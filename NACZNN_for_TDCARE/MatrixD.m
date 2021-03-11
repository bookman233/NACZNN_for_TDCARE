function D = MatrixD(t)
    D=[(4+exp(-t)-cos(t)).^2, 0;
       0, (2+(1/(t+1))+sin(t)).^2];