function M_xyz = regulator(v_d_fi, omega)
% v_d_fi - angle error
% omega - angular rate
    K = 5;
    K_diff = 1;
    M_xyz = K*v_d_fi - K_diff.*omega ;
    % M_xyz = [0 0 0];
end