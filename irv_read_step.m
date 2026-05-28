function [earth_vect] = irv_read_step(home)
    earth_vect = -home./norm(home, 2);
end