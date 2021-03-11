function F_norm(x0, iter, gamma, lambda)
    format long;
%     tspan = 0: 0.01:20;
    tspan = [0, 20];

    options = odeset();
    if iter == 1
        [t, x] = ode45(@RightSide_PTCZNN, tspan, x0, options, gamma);
    end
    if iter == 2
        [t, x] = ode45(@RightSide_NBZNN, tspan, x0, options, gamma);
    end
    if iter == 3
        [t, x] = ode45(@RightSide_OZNN, tspan, x0, options, gamma);
    end   
    if iter == 4
        [t, x] = ode45(@RightSide_MEAZNN, tspan, x0, options, gamma, lambda);
    end 
    
%     if iter == 5
%         [t, x] = ode45(@RightSide_ProsZNN, tspan, x0, options, gamma, lambda);
%     end 

    
%     [t, x] = ode45(@RightSide_OZNN, tspan, x0, options, gamma, lambda);
    size(x)
    max_val = 0;
    average_val = 0;
    cout_val = 0;
    for j = 1:length(t)
        T = t(j);
        C = MatrixC(T);
        D = MatrixD(T);
        Q = MatrixQ(T);
        
        X = reshape(x(j,1:4), 2, 2);
        M = kron(eye(2), (C'-X*D));
        W = kron(C', eye(2));
        z = reshape(Q, 4, 1);

        temp = (M+W)*(x(j,1:4))'+z;
        Err(:, j) = reshape(temp, 4, 1);
        nerr(j) = norm(Err(:,j));
        
        if T > 10
            average_val = average_val + nerr(j);
        end
        if T > 15
                if nerr(j) > max_val
                max_val = nerr(j);
            end
        end
        cout_val = cout_val + 1;
    end
    ASSRE = (average_val / cout_val)
    MSSRE = max_val

    set(gca,'FontSize',14)
    plot(t, nerr, 'LineWidth', 2);
    txt = {'||{\itE}(t)||_F'};
    text(0.6,0,txt)
    txt = {'{\itt} (s)'};
    text(4,0.3,txt)
    hold on;

    savefig('F_norm_Noise_Rand');