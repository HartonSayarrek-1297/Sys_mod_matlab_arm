function new_vector = quat_rotate(vector, q)
% rotate vector using quaternion multiplication
% q - rotating normed quaternion that we obtained in get_quat()
    v = [0; vector];
    q_ = inv_quat(q);
    qv = quat_mul(q, v);
    qvq_ = quat_mul(qv, q_);
    new_vector = qvq_(2:4)';
end