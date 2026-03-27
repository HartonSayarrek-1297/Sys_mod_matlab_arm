function s_diff = quat_derivative(s, omega)
% computing the derivative of quaternion
% omega - 3-dimension vector of angular velocity, [x, y, z]
% s - quaternion
    s_diff(1) = 0.5 * (-omega(1)*s(2) - omega(2)*s(3) - omega(3)*s(4));
    s_diff(2) = 0.5 * (omega(1)*s(1) + omega(3)*s(3) - omega(2)*s(4));
    s_diff(3) = 0.5 * (omega(2)*s(1) + omega(1)*s(4) - omega(3)*s(2));
    s_diff(4) = 0.5 * (omega(3)*s(1) + omega(2)*s(2) - omega(1)*s(3));
end