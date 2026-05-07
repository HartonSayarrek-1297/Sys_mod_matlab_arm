function [q_j2000] = star_sensor_step(q_old)
    q_step = [1 0 0 0];
    q_j2000 = quat_mul(q_old, q_step);
end