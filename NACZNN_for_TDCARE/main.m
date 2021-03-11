% clear
% clc

gamma=5;
lambda=5;
tstar=[0, 10];

options=odeset();
%----------------------------------------------------------------x(t)
for i=1:1
%     x0=8*(rand(4,1)-0.5*ones(4,1));
    set=[2*(rand(4,1)-0.5*ones(4,1));0;0;0;0];
    x0 = set';
    [t,x]=ode45(@RightSide_MEAZNN,tstar,x0,options,gamma,lambda);
    
    subplot(2,2,1);
    plot(t,x(:,1), '-b', 'LineWidth', 1);
    xlabel('{\itt} (s)', 'FontSize', 10);
    hold on
    
    subplot(2,2,2);
    plot(t,x(:,3), '-b', 'LineWidth', 1);
    xlabel('{\itt} (s)', 'FontSize', 10);
    hold on
    
    subplot(2,2,3);
    plot(t,x(:,2), '-b', 'LineWidth', 1);
    xlabel('{\itt} (s)', 'FontSize', 10);
    hold on
    
    subplot(2,2,4);
    plot(t,x(:,4), '-b', 'LineWidth', 1);
    xlabel('{\itt} (s)', 'FontSize', 10);
    hold on
end

savefig('Solution_Free');