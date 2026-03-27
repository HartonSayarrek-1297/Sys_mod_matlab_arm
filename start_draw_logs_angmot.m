
f3 = figure(3);
f3.Name = 'Logs';
f3.NumberTitle = 'off';
f3.Position = [692 70 648 599];

subplot(3,1,1);
title('Logs of state vector');
hold on;
grid on;
grid minor;
% axis equal;
X_logs(:,1:3) = X_logs(:,1:3).*(180/pi);
plot([0 timeline], X_logs(:,1), "Color", [1 0 0]);
plot([0 timeline], X_logs(:,2), "Color", [0 1 0]);
plot([0 timeline], X_logs(:,3), "Color", [0 0 1]);
ylabel('w, [degrees/sec]');
xlabel('t, [sec]');
legend('w_x','w_y','w_z');

subplot(3,1,2);
hold on;
grid on;
grid minor;
axis equal;
plot([0 timeline], X_logs(:,4), "Color", [0 0 0]);
plot([0 timeline], X_logs(:,5), "Color", [1 0 0]);
plot([0 timeline], X_logs(:,6), "Color", [0 1 0]);
plot([0 timeline], X_logs(:,7), "Color", [0 0 1]);
ylabel('q');
xlabel('t, [sec]');
legend('q_0','q_1','q_2','q_3');

subplot(3,1,3);
title('External dynamic torques');
hold on;
grid on;
grid minor;
axis equal;
plot([0 timeline], M_logs(:, 1), "Color", [1 0 0]);
plot([0 timeline], M_logs(:, 2), "Color", [0 1 0]);
plot([0 timeline], M_logs(:, 3), "Color", [0 0 1]);
ylabel('M, [N*m]');
xlabel('t, [sec]');
legend('M_x','M_y','M_z');