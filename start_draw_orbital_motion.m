f4 = figure(4);
f4.Name = 'Orbital movement without dynamics';
f4.NumberTitle = 'off';
f4.Position = [15 70 673 599];
hold on;
grid on;
grid minor;
axis equal;
campos([10, 10, 10]);
draw_basis(inertia_home, inertia_basis, true);

xlim([-7 7]);
ylim([-7 7]);
zlim([-7 7]);

timelen = 10;
timeline = dt:dt:timelen;

rel_basis_current = rel_basis;
rel_home_current = rel_home;
temp_b = draw_basis(rel_home, rel_basis, false, 0.5, "_1");

w_orb = [0, 0, sqrt(G*m / (r+h)^3)];
w_r = w_orb;

fi_0e = norm(w_orb, 2)*dt;
fi_0r = norm(w_r, 2)*dt;
q_e = get_quat(w_orb, fi_0);
q_r = get_quat(w_r, fi_0);

X_logs = zeros(1 + length(timeline), 7);
X_logs(1, 1:3) = w_r;
X_logs(1, 4:7) = q_r;
k = 2;

pause(dt);

for t = timeline
    figure(4);

    [q_e, w_orb] = quat_shift_RK4(q_e, w_orb, dt);
    [q_r, w_r] = quat_shift_RK4(q_r, w_r, dt);
    Q = get_quat_matrix(q_r);
    X_logs(k, 1:3) = w_r;
    X_logs(k, 4:7) = q_r;
    k = k+1;

    rel_basis_current = Q*rel_basis;
    rel_home_current = quat_rotate(rel_home, q_e);

    delete(temp_b);
    temp_b = draw_basis(rel_home_current, rel_basis_current, false, 0.5, "_1");
    draw_trace(rel_home_current, [0 0 0], [0.7 0.7 0.7]);

    pause(dt);
end