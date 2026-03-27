function X_out = DE_sys_hard(X, M)
    global J J_inv;
    w = X(1:3);
    s = X(4:7);

    dw = J_inv*(M - cross(w, J*w'))';

    ds0 = 0.5 * (-w(1)*s(2) - w(2)*s(3) - w(3)*s(4));
    ds1 = 0.5 * (w(1)*s(1) + w(3)*s(3) - w(2)*s(4));
    ds2 = 0.5 * (w(2)*s(1) + w(1)*s(4) - w(3)*s(2));
    ds3 = 0.5 * (w(3)*s(1) + w(2)*s(2) - w(1)*s(3));

    X_out = [dw(1), dw(2), dw(3), ds0, ds1, ds2, ds3];
end
