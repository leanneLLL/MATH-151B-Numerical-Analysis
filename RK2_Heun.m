%%%%%%%%%Target function %%%%%%%%%
F =@(y) 10*(y-y.^2);     
tInitial = 0; 
tFinal = 5; 
yInitial = 0.5; 

% Step sizes
h = 0.01;

N = (tFinal-tInitial)/h;
y = zeros(N+1,1);
t = zeros(N+1,1);
format long;

%%%%%%%%%Implementing RK2%%%%%%%%%
t(1) = tInitial;
y(1) = yInitial;

for( i = 1:N)
	% RK method
    t(i+1) = t(i) + h;
    y(i+1) = y(i) + (h/2)*F(y(i)) + (h/2)*F(y(i)+h*F(y(i)))
end

%%%%%%%%%Plot%%%%%%%%%
tPlotMin = tInitial;
tPlotMax = tFinal; 
yPlotMin = 0; 
yPlotMax = 1.5;
plot(t,y)
axis([tPlotMin, tPlotMax,yPlotMin, yPlotMax]); 
title('Approximate Solution - RK2 - Heun s h=0.1 ') 
xlabel('t')
ylabel('y(t)')
