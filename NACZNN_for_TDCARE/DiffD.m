function output = DiffD(t)
    syms u;
    D = MatrixD(u);
    DotD = diff(D);
    u=t;
    output = eval(DotD);