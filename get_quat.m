function p = get_quat(e_, theta)
% e_ - axis (x, y, z)
% theta - angle
% there we form the quaternion
    if (theta ~= 0)
        Norm = norm(e_, 2);
        tensor_q = Norm/sin(theta/2);
        
        p(2) = e_(1)/tensor_q;
        p(3) = e_(2)/tensor_q;
        p(4) = e_(3)/tensor_q;
        p(1) = cos(theta/2);
    else
        p(2) = 0;
        p(3) = 0;
        p(4) = 0;
        p(1) = 1;
    end
    
end