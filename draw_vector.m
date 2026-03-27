function vec = draw_vector(home, vector, col_rgb, width)
    arguments
        home (3, 1) double;
        vector (3, 1) double;
        col_rgb (1, 3) double;
        width (1, 1) double = 1;
    end
    % if size(vector) == [1 3]
    %     vector = vector';
    % end
    v_1 = [home, home + vector];
    vec = plot3(v_1(1, :), v_1(2, :), v_1(3, :),'-', 'Color', col_rgb, 'LineWidth', width);
end