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

xlim([-5 5]);
ylim([-5 5]);
zlim([-5 5]);

dt = 0.05;
timelen = sum(M_xyz(:,4));
timeline = dt:dt:timelen;

v2 = v1;
draw_trace(rel_home, v2, [0.7 0.7 0.7]);
temp = draw_vector(rel_home, v2, [0 0 0], 3);

rel_basis_current = rel_basis;
temp_b = draw_basis(rel_home, rel_basis_current, false, 0.5, "_1");

w_in = w; % relate angular rate in inertia basis
draw_vector(rel_home, w, [0.7 0 0.7]);
temp_w = draw_vector(rel_home, w, [1 0 1], 3);

fi_0 = norm(w, 2)*dt;
q = get_quat(w, fi_0);

pause(dt);

X_0 = [w, q];
X_logs = zeros(1 + length(timeline), 7);
X_logs(1, :) = X_0;
k = 2;
M_logs = zeros(1 + length(timeline), 3);
M_logs(1, :) = M_xyz(1,1:3);

checkpoint = M_xyz(1,4);
i = 1;
for t = timeline
    figure(2);

    X = RK4_shift(@DE_sys_medium, [w, q], M_xyz(i,1:3), dt);
    X_logs(k, :) = X;
    M_logs(k, :) = M_xyz(i,1:3);
    k = k+1;

    w = X(1:3);
    q = X(4:7);
    q = q./norm(q,2);
    Q = get_quat_matrix(q);

    v2 = quat_rotate(v1, q);
    rel_basis_current = Q*rel_basis;
    w_in = Q*w';
    delete(temp);
    delete(temp_w);
    delete(temp_b);
    
    draw_trace(rel_home, v2, [0.7 0.7 0.7]);
    draw_vector(rel_home, w_in, [0.7 0 0.7]);
    temp = draw_vector(rel_home, v2, [0 0 0], 3);
    temp_w = draw_vector(rel_home, w_in, [1 0 1], 3);
    temp_b = draw_basis(rel_home, rel_basis_current, false, 0.5, "_1");
    pause(dt);

    if (t >= checkpoint)
        i = i+1;
        if (i > length(M_xyz))
            break
        end
        checkpoint = checkpoint + M_xyz(i,4);
    end
end
f2.Name = 'Modeling is finished.';