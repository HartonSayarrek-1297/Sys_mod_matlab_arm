function [s_new, omega_new] = quat_shift(s, omega, dt)
% computing the shift of quaternion (Euler)
% s - initial quaternion of rotation
% omega - angrate
    
    k1 = quat_derivative(s, omega);
    s_new = s + dt.*k1;
    N = norm(s_new, 2);
    s_new = s_new./N;
    omega_new = omega;
end