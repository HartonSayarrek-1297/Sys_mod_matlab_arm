LOGS_1 = figure(3);
LOGS_1.Name = 'Logs';
LOGS_1.NumberTitle = 'off';
LOGS_1.Position = [692 70 648 599];


subplot(3,1,1);
title('Logs of state vector');
hold on;
grid on;
grid minor;
% axis equal;
X_logs(:,1:3) = X_logs(:,1:3).*(180/pi);
plot(timeline, X_logs(:,1), "Color", [1 0 0]);
plot(timeline, X_logs(:,2), "Color", [0 1 0]);
plot(timeline, X_logs(:,3), "Color", [0 0 1]);
ylabel('w, [degrees/sec]');
xlabel('t, [sec]');
legend('w_x','w_y','w_z');

subplot(3,1,2);
hold on;
grid on;
grid minor;
% axis equal;
plot(timeline, X_logs(:,4), "Color", [0 0 0]);
plot(timeline, X_logs(:,5), "Color", [1 0 0]);
plot(timeline, X_logs(:,6), "Color", [0 1 0]);
plot(timeline, X_logs(:,7), "Color", [0 0 1]);
ylabel('q');
xlabel('t, [sec]');
legend('q_0','q_1','q_2','q_3');

subplot(3,1,3);
title('External dynamic torques');
hold on;
grid on;
grid minor;
% axis equal;
plot(timeline, M_logs(:, 1), "Color", [1 0 0]);
plot(timeline, M_logs(:, 2), "Color", [0 1 0]);
plot(timeline, M_logs(:, 3), "Color", [0 0 1]);
ylabel('M, [N*m]');
xlabel('t, [sec]');
legend('M_x','M_y','M_z');

%%
LOGS_2 = figure(4);
LOGS_2.Name = "logs of ang err";
LOGS_2.NumberTitle = 'off';
LOGS_2.Position = [15 70 673 599];

subplot(3,1,1);
title('Logs of ang err');
hold on;
grid on;
grid minor;
% axis equal;
v_d_logs = v_d_logs.*(180/pi);
plot(timeline, v_d_logs(:,1), "Color", [1 0 0]);
plot(timeline, v_d_logs(:,2), "Color", [0 1 0]);
plot(timeline, v_d_logs(:,3), "Color", [0 0 1]);
ylabel('vd fi, [degrees]');
xlabel('t, [sec]');
legend('vd_x','vd_y','vd_z');

subplot(3,1,2);
title('Logs of earth vect');
hold on;
grid on;
grid minor;
% axis equal;
plot(timeline, ev_logs(:,1), "Color", [1 0 0]);
plot(timeline, ev_logs(:,2), "Color", [0 1 0]);
plot(timeline, ev_logs(:,3), "Color", [0 0 1]);
ylabel('ev');
xlabel('t, [sec]');
legend('ev_x','ev_y','ev_z');

subplot(3,1,3);
title('Logs of q orb');
hold on;
grid on;
grid minor;
% axis equal;
plot(timeline, qrb_logs(:,1), "Color", [0 0 0]);
plot(timeline, qrb_logs(:,2), "Color", [1 0 0]);
plot(timeline, qrb_logs(:,3), "Color", [0 1 0]);
plot(timeline, qrb_logs(:,4), "Color", [0 0 1]);
ylabel('q orb');
xlabel('t, [sec]');
legend('qrb_0','qrb_1','qrb_2', 'qrb_3');

