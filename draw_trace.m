function draw_trace(home, point, col_rgb)
    plot3(home(1) + point(1), home(2) + point(2), home(3) + point(3), 'Color', col_rgb, 'LineWidth', 3, 'Marker', '+');
end