function [measure_area_data, browse_areas_data] = solar_sensor_read_step_3()
    B_exist = 0;
    C_exist = 0;
    D_exist = 0;
    F_exist = 0;

    A_exist = 1;
    E_exist = 0;

    measure_area_data = [A_exist, E_exist];
    browse_areas_data = [B_exist, C_exist, D_exist, F_exist];
end