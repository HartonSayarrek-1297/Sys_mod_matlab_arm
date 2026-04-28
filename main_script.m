% Yamanaev RR
% 
close all;
clc;
clear;
% set(0,'DefaultFigureWindowStyle','docked')

inertia_basis = [3 0 0;
                0 3 0;
                0 0 3];
inertia_home = [0;0;0];
global J J_inv;
J = [1, 0, 0; % inertia tensor
     0, 1, 0;
     0, 0, 1];
J_inv = J^(-1);

%%
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

timeline = 5;
dt = 0.05;

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
temp_b = draw_basis(rel_home0, rel_basis, false, 0.5, "_1");
%%
for i = 0:dt:timeline
    [m_a_data_x, b_a_data_x] = solar_sensor_read_step_1();
    [m_a_data_y, b_a_data_y] = solar_sensor_read_step_2();
    [m_a_data_z, b_a_data_z] = solar_sensor_read_step_3();
    M_xyz(1) = engine_1_step(m_a_data_x, b_a_data_x) - engine_2_step(m_a_data_x, b_a_data_x);
    M_xyz(2) = 0;
    M_xyz(3) = 0;
    M_xyz(4) = dt;

    [X, rel_basis, temp_b] = orbital_modeling_step(dt, rel_home0, rel_basis, X, M_xyz, temp_b);
    pause(dt);
end

% start_draw;
% start_draw_logs;
