function output = DiffC(t)
    syms u;
    C = MatrixC(u);
    DotC = diff(C);
    u=t;
    output = eval(DotC);
