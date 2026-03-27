function M = get_euler_matrix(fi_x, fi_y, fi_z)
% three Euler`s angles form the matrix
    M_OX = [1, 0, 0;
            0, cos(fi_x) -sin(fi_x);
            0, sin(fi_x), cos(fi_x)];
    M_OY = [cos(fi_y), 0, sin(fi_y);
            0, 1, 0;
            -sin(fi_y), 0 cos(fi_y)];
    M_OZ = [cos(fi_z), -sin(fi_z), 0;
            sin(fi_z), cos(fi_z), 0;
            0, 0, 1];
    M = M_OX*M_OY*M_OZ;
end