

if (vis_enable)
    delete(temp_b);
    delete(temp_c);
    temp_b = draw_basis(rel_home, rel_basis, false, 0.5, "_1");
    temp_c = draw_vector(rel_home, X(1:3).*10, [0.3 0 0], 1);
    
    if (mod(i, 10) == 0)
        draw_trace([0 0 0], rel_home, [0.5 0.5 0.5]);
        draw_vector(rel_home, earth_vect, [0.5 0 0.5], 1);
    end

    pause(dt);
end