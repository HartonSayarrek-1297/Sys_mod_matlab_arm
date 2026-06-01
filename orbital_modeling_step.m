function [q_orb_new, X_new, rel_home_current, rel_basis_current] = orbital_modeling_step(dt, rel_home, rel_basis, q_orb, X, M_xyz)
    global w_orb vis_enable;
    
    X_new = RK4_shift(@DE_sys_hard, X, M_xyz(1:3), dt);
    
    [q_orb_new] = quat_shift_RK4(q_orb, w_orb, dt);

    w = X_new(1:3);
    q = X_new(4:7);
    
    Q = get_quat_matrix(q);   
    rel_basis_current = Q*rel_basis;
    rel_home_current = quat_rotate(rel_home, q_orb_new);

end