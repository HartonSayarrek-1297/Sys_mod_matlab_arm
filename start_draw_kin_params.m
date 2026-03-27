f1 = figure(1);
f1.Position = [693 242 672 425];

subplot(2,2,1);
title('Rotating with rotation matrix using Euler`s angles');
hold on;
campos([3, 5, 3]);
draw_basis(inertia_home, inertia_basis);
draw_vector(inertia_home, v, [0.5 0 0.5]); % violet

M1 = get_euler_matrix(0, 0, fi1);
v1 = rotate_vector(v, 0, 0, fi1); % OZ
draw_vector(inertia_home, v1, [0 0 0.5]); % blue

M2 = get_euler_matrix(0, fi2, 0);
v2 = rotate_vector(v1, 0, fi2, 0) % OY
draw_vector(inertia_home, v2, [0 0 0.3]);

M = M2*M1

grid on;
grid minor;
axis equal;


subplot(2,2,2);
title('Rotating with rotation matrix using quaternion');
hold on;
campos([3, 5, 3]);
draw_basis(inertia_home, inertia_basis);
draw_vector(inertia_home, v, [0.5 0 0.5]);

q1 = get_quat([0 0 1], fi1); % OZ
q2 = get_quat([0 1 0], fi2); % OY
L1 = get_quat_matrix(q1);
L2 = get_quat_matrix(q2);
L = L2*L1

v_1_mq = L*v
draw_vector(inertia_home, v_1_mq, [0 0 0]);

grid on;
grid minor;
axis equal;


subplot(2,2,3);
title('Rotating with quaternion multiplication')
hold on;
campos([3, 5, 3]);
draw_basis(inertia_home, inertia_basis);
draw_vector(inertia_home, v, [0.5 0 0.5]);

v_1_q = quat_rotate(v, q1);
v_2_q = quat_rotate(v_1_q, q2)
draw_vector(inertia_home, v_2_q, [0 0 0]);

grid on;
grid minor;
axis equal;

subplot(2,2,4);
title('Rotating with quaternion multiplication 2')
hold on;
campos([3, 5, 3]);
draw_basis(inertia_home, inertia_basis);
draw_vector(inertia_home, v, [0.5 0 0.5]);

q3 = quat_mul(q2, q1);
v_3_q = quat_rotate(v, q3);
draw_vector(inertia_home, v_3_q, [0 0 0]);

grid on;
grid minor;
axis equal;