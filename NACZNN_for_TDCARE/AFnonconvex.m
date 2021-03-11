function output = AFnonconvex(E)
    output = zeros(size(E));
    for i = 1:length(E)
        if E(i) > 0.5
            E(i) = 1;
        end
        if E(i) < -0.5
            E(i) = -1;
        end
    end

    for i = 1:length(E)
        if E(i) > 0.1
            if E(i) < 0.3
                E(i) = 0.1;
            end
        end
        if E(i) < -0.1
            if E(i) > -0.3
                E(i) = -0.1;
            end
        end
    end

    for i = 1:length(E)
        output(i) = E(i);
    end
