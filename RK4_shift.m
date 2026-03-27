function X_out = RK4_shift(func, X, M, dt)
% INPUT
% func - pointer on law
% X - state vector [w1, w2, w3, s0, s1, s2, s3]
% J - inertion tensor
% M - external dynamic impact
% dt - time step
% OUTPUT
% X_out - new state vector [w1, w2, w3, s0, s1, s2, s3]
    
    k1 = func( X, M );
    k2 = func( X + 0.5*dt.*k1, M );
    k3 = func( X + 0.5*dt.*k2, M );
    k4 = func( X + dt.*k3, M );

    k_med = (dt/6) .* (k1 + 2.*k2 + 2.*k3 + k4);
    X_out = X + k_med;
end