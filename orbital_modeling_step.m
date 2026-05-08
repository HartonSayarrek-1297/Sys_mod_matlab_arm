function [X_new, rel_home_current, rel_basis_current, temp_b_new] = orbital_modeling_step(dt, rel_home, rel_basis, X, M_xyz, temp_b)
    global w_orb vis_enable;

    if (vis_enable)
        delete(temp_b); 
        temp_b_new = draw_basis(rel_home, rel_basis, false, 0.5, "_1");
        draw_trace([0 0 0], rel_home, [0.5 0.5 0.5]);
    else
        temp_b_new = temp_b;
    end
    
    X_new = RK4_shift(@DE_sys_hard, X, M_xyz(1:3), dt/50);

    w = X_new(1:3);
    q = X_new(4:7);
    q_orb = get_quat(w_orb, norm(w_orb,2)*dt);
    % q = q./norm(q,2);
    Q = get_quat_matrix(q);

    
    rel_basis_current = Q*rel_basis;
    rel_home_current = quat_rotate(rel_home, q_orb);
end