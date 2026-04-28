function M_x_2 = engine_2_step(m_area_data, b_area_data)
    if (m_area_data(1) == 0) && (b_area_data(2) == 1)
        M_x_2 = 1;
    else
        M_x_2 = 0;
    end
end