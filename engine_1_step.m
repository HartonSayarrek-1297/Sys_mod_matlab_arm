function M_x_1 = engine_1_step(m_area_data, b_area_data)
    if (m_area_data(1) == 0) && (b_area_data(4) == 1)
        M_x_1 = 1;
    else
        M_x_1 = 0;
    end
end