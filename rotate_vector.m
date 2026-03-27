function new_vector = rotate_vector (vector, fi_x, fi_y, fi_z)
% rotating vector for 3 Euler`s angles - fi_x, fi_y, fi_z
    M = get_euler_matrix(fi_x, fi_y, fi_z);

    new_vector = M*vector;
    % drawing projections for visualisation of rotate
    if (fi_x ~= 0) && (fi_y == 0) && (fi_z == 0)
        v_1 = [0, 0;
               0, vector(2);
               0, vector(3)];
        v_2 = [0, 0;
               0, new_vector(2);
               0, new_vector(3)];
        plot3(v_1(1, :), v_1(2, :), v_1(3, :),'-', 'Color', [0.5 0.5 0.5]);
        plot3(v_2(1, :), v_2(2, :), v_2(3, :),'-', 'Color', [0.5 0.5 0.5]);
    end
    if (fi_y ~= 0) && (fi_z == 0) && (fi_x == 0)
        v_1 = [0, vector(1);
               0, 0;
               0, vector(3)];
        v_2 = [0, new_vector(1);
               0, 0
               0, new_vector(3)];
        plot3(v_1(1, :), v_1(2, :), v_1(3, :),'-', 'Color', [0.5 0.5 0.5]);
        plot3(v_2(1, :), v_2(2, :), v_2(3, :),'-', 'Color', [0.5 0.5 0.5]);
    end
    if (fi_z ~= 0) && (fi_x == 0) && (fi_y == 0)
        v_1 = [0, vector(1);
               0, vector(2);
               0, 0];
        v_2 = [0, new_vector(1);
               0, new_vector(2)
               0, 0];
        plot3(v_1(1, :), v_1(2, :), v_1(3, :),'-', 'Color', [0.5 0.5 0.5]);
        plot3(v_2(1, :), v_2(2, :), v_2(3, :),'-', 'Color', [0.5 0.5 0.5]);
    end
end