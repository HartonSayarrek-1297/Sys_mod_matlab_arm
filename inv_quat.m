function p_ = inv_quat(p)
    N = norm(p)^2;
    p_ = [p(1)/N, -p(2)/N, -p(3)/N, -p(4)/N];
end