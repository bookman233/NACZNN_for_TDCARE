function Q = MatrixQ(t)
    Q=[(3+(1/(t+1)).^2+sin(t)), 0
       0, (6+(2+exp(-t)).^2-cos(t))];