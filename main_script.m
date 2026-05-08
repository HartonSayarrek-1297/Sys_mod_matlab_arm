% Yamanaev RR
% 
close all;
clc;
clear;
% set(0,'DefaultFigureWindowStyle','docked')


inertia_basis = [3 0 0;
                0 3 0;
                0 0 3];
inertia_home = [0;0;0]; % J2000
global J J_inv w_orb vis_enable;
J = [1, 0, 0; % inertia tensor
     0, 1, 0;
     0, 0, 1];
J_inv = J^(-1);
w_orb = [0, 0, pi/270];

vis_enable = 0; % no way

%%
if (vis_enable)
    f2 = figure(2); % visualisation of a kinematics of rotation around different axis
    f2.Name = 'modeling...';
    f2.NumberTitle = 'off';
    f2.Position = [15 70 673 599];
    hold on;
    grid on;
    grid minor;
    axis equal;
    campos([3, 5, 3]);
    draw_basis(inertia_home, inertia_basis, true);
    xlim([-7 7]);
    ylim([-7 7]);
    zlim([-7 7]);
end

duration = 30;

dt = 0.05;
timeline = 0:dt:duration;
timelen = length(timeline);
X_logs = zeros(timelen, 7);
v_d_logs = zeros(timelen, 3);
M_logs = zeros(timelen, 3);

G = 6.67*10^(-11); % gravitational constant
m = 10^(13); % planet mass
r = 1; % planet radius
h = 4; % orbital altitude
rel_home0 = [0; r + h; 0];
rel_basis0 = [2 0 0;
             0 2 0;
             0 0 2];
w0 = [0, 0, 0];
q0 = [1, 0, 0, 0];

X = [w0, q0];
rel_basis = rel_basis0;
rel_home = rel_home0;
if (vis_enable)
    temp_b = draw_basis(rel_home, rel_basis, false, 0.5, "_1");
else
    temp_b = 0;
end

%%
for i = 1:timelen
    q = star_sensor_step(X(4:7));
    earth_vect = irv_read_step(-rel_home);
    y_axis_to_align = -rel_basis(:, 2); % -y CCK

    v_d_fi_len = acos(earth_vect'*y_axis_to_align/norm(earth_vect,2)/norm(y_axis_to_align, 2));
    v_d_fi_direction = cross(earth_vect, y_axis_to_align)';
    N = norm(v_d_fi_direction, 2);
    if (N == 0)
        N = 1;
    end
    v_d_fi = v_d_fi_len.*(v_d_fi_direction./N);
    if (vis_enable)
        temp = draw_vector(rel_home, v_d_fi, [1 0 1]);
    end
    
    if (i > 1)
        M_prev = M_logs(i-1, :);
    else
        M_prev = [0 0 0];
    end
    M_xyz = regulator(M_prev, v_d_fi, X(1:3));
    [X, rel_home, rel_basis, temp_b] = orbital_modeling_step(dt, rel_home, rel_basis, X, M_xyz, temp_b);
    X_logs(i,:) = X;
    v_d_logs(i,:) = v_d_fi;
    M_logs(i,:) = M_xyz;
    if (vis_enable)
        pause(dt);
    end
end

logs_get;
