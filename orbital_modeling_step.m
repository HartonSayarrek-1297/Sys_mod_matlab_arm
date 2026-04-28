function [X_new, rel_basis_current, temp_b_new] = orbital_modeling_step(dt, rel_home, rel_basis, X, M_xyz, temp_b)
    delete(temp_b);
    
    rel_basis_current = rel_basis;
    temp_b_new = draw_basis(rel_home, rel_basis_current, false, 0.5, "_1");
    
    X_new = RK4_shift(@DE_sys_hard, X, M_xyz(1:3), dt);

    w = X_new(1:3);
    q = X_new(4:7);
    q = q./norm(q,2);
    Q = get_quat_matrix(q);
    
    rel_basis_current = Q*rel_basis;
end