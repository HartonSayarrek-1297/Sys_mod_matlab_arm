function [s_new, w_new] = quat_shift_RK4(s, w, dt)
% function for kinematic motion by constant angrate
% INPUT
% s - state vector of quaternion [s0, s1, s2, s3]
% w - state vector of angrate [w1, w2, w3]
% dt - time step
% OUTPUT
% s_new - new state vector of quaternion [s0, s1, s2, s3]
% w_new - new state vector of angrate [w1, w2, w3]
    
    k1 = quat_derivative(s, w);
    k2 = quat_derivative(s + 0.5*dt.*k1, w);
    k3 = quat_derivative(s + 0.5*dt.*k2, w);
    k4 = quat_derivative(s + dt.*k3, w);

    k_med = (dt/6) .* (k1 + 2.*k2 + 2.*k3 + k4);
    s_new = s + k_med;
    w_new = w;
end