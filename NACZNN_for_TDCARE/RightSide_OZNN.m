function output=RightSide_OZNN(t,x,gamma)
    C = MatrixC(t);
    D = MatrixD(t);
    Q = MatrixQ(t);
    DotC = DiffC(t);
    DotD = DiffD(t);
    DotQ = DiffQ(t);
    X = reshape(x(1:4), 2, 2);
    inte = x(5:8);

    M = kron(eye(2), (C'-X*D));
    N = kron((C-D*X)', eye(2));
    U = kron(eye(2), (X*DotD-DotC'));
    V = kron(DotC', eye(2));
    W = kron(C', eye(2));
    
    y = reshape(X, 4, 1);
    z = reshape(Q, 4, 1);
    Diffz = reshape(DotQ, 4, 1);
    
    Err = (M+W)*y+z;
    noise_con = [2;2;2;2];
    noise_rand = 1.5*rand(4,1)+0.5;
    noise_linear = 0.4*[t,t,t,t]';
    
%     doty = inv(M+N) * ((U-V)*y-Diffz-scal_param_one*Err - lambda*inte + noise);
    doty = inv(M+N) * ((U-V)*y-Diffz-gamma*Err+ noise_rand);
%     doty = inv(M+N) * ((U-V)*y-Diffz- gamma*Err + noise);
    output = [doty; Err];
    t
