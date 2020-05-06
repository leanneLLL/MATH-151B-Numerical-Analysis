%%%%%%%%%  Target function %%%%%%%%% 
F = @(t,y) (-20)*y + 20*sin(t) + cos(t);      
S = sin(t)+ exp((-20)*t);
tInitial = 0; 
tFinal = 2; 
yInitial = 1; 
h = 0.1;

N = (tFinal-tInitial)/h;
y = zeros(N+1,1);
t = zeros(N+1,1);
format long;

%%%%%%%%% Implementing RK2 %%%%%%%%% 
t(1) = tInitial;
y(1) = yInitial;

for( i = 1:N)
	% RK method
    t(i+1) = t(i) + h;
    y(i+1) = y(i) + (h/6)*F(t(i),y(i)) + (h/3)*F((t(i)+(h/2)),y(i)+(h/2)*F(t(i),y(i))) ...
        + (h/3)*F((t(i)+(h/2)),y(i)+(h/2)*F((t(i)+(h/2)),y(i)+(h/2)*F(t(i),y(i)))) ...
        + (h/6)*F(t(i+1),y(i)+h*F((t(i)+(h/2)),y(i)+(h/2)*F((t(i)+(h/2)),y(i)+(h/2)*F(t(i),y(i)))));
end

%%%%%%%%% Plot %%%%%%%%% 
tPlotMin = tInitial;
tPlotMax = tFinal; 
yPlotMin = 0; 
yPlotMax = 1.5;
plot(t,y)
hold on
plot(t,S)
hold off
axis([tPlotMin, tPlotMax,yPlotMin, yPlotMax]); 
title('Approximate Solution - RK-4 h=0.1 ') 
xlabel('t')
ylabel('y(t)')
legend('Approximation','Exact')
