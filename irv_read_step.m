function [earth_vect] = irv_read_step(home)
    earth_vect = -home./norm(home, 2);
    % q = inv_quat(q);
    % earth_vect = quat_rotate(earth_vect, q);
end