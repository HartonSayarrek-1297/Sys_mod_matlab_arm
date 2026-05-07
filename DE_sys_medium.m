function X_out = DE_sys_medium(X, M)
    global J;
    w = X(1:3);
    s = X(4:7);

    dw1 = (M(1) - (J(3,3)-J(2,2))*w(3)*w(2))/J(1,1);
    dw2 = (M(2) - (J(1,1)-J(3,3))*w(1)*w(3))/J(2,2);
    dw3 = (M(3) - (J(2,2)-J(1,1))*w(2)*w(1))/J(3,3);

    ds0 = 0.5 * (-w(1)*s(2) - w(2)*s(3) - w(3)*s(4));
    ds1 = 0.5 * (w(1)*s(1) + w(3)*s(3) - w(2)*s(4));
    ds2 = 0.5 * (w(2)*s(1) + w(1)*s(4) - w(3)*s(2));
    ds3 = 0.5 * (w(3)*s(1) + w(2)*s(2) - w(1)*s(3));
    
    N = sqrt(ds0^2 + ds1^2 + ds2^2 + ds3^2);
    if (N == 0)
        N = 1;
    end
    ds0 = ds0/N;
    ds1 = ds1/N;
    ds2 = ds2/N;
    ds3 = ds3/N;

    X_out = [dw1, dw2, dw3, ds0, ds1, ds2, ds3];
end
