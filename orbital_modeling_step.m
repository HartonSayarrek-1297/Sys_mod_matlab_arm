function [q_orb_new, X_new, rel_home_current, rel_basis_current, temp_b_new] = orbital_modeling_step(dt, rel_home, rel_basis, q_orb, X, M_xyz, temp_b)
    global w_orb vis_enable;
    
    X_new = RK4_shift(@DE_sys_hard, X, M_xyz(1:3), dt);
    
    [q_orb_new, w_orb] = quat_shift_RK4(q_orb, w_orb, dt);

    w = X_new(1:3);
    q = X_new(4:7);
    
    Q = get_quat_matrix(q);   
    rel_basis_current = Q*rel_basis;
    rel_home_current = quat_rotate(rel_home, q_orb_new);

    if (vis_enable)
        delete(temp_b); 
        temp_b_new = draw_basis(rel_home_current, rel_basis_current, false, 0.5, "_1");
        draw_trace([0 0 0], rel_home_current, [0.5 0.5 0.5]);
    else
        temp_b_new = temp_b;
    end
end