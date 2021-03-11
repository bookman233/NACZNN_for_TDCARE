function output = DiffQ(t)
    syms u;
    Q = MatrixQ(u);
    DotQ = diff(Q);
    u=t;
    output = eval(DotQ);
