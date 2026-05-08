function M_xyz = regulator(M_prev, v_d_fi, omega)
% v_d_fi - angle error
% omega - angular rate
    K = 7;
    K_diff = 28;
    M_xyz = M_prev - K*v_d_fi - K_diff.*omega;
    % M_xyz = [0 0 0];
end