function M_xyz = regulator(v_d_fi, omega, integ)
% v_d_fi - angle error
% omega - angular rate
    K = 200;
    K_diff = 9;
    K_int = 0;
    S = [0 0 0];
    
    M_xyz = K.*(S - v_d_fi) + K_diff.*(S - omega) + K_int.*(S - integ);
    % M_xyz = [0 0 0];
end