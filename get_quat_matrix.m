function L = get_quat_matrix(p)
% there we obtain the rotating matrix basing quaternion coeffs
    p0 = p(1);
    x = p(2);
    y = p(3);
    z = p(4);
    L = [p0^2 + x^2 - y^2 - z^2, 2*(x*y - p0*z), 2*(x*z + p0*y);
        2*(x*y + p0*z), p0^2 - x^2 + y^2 - z^2, 2*(y*z - p0*x);
        2*(x*z - p0*y), 2*(y*z + p0*x), p0^2 - x^2 - y^2 + z^2];
end