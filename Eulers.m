% Euler's Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Target function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
F=@(t,y) (-5)*y+5* t.^2 +2*t;
tInitial=0; 
tFinal=1; 
yInitial=1/3 ; 
% h=0.1;
% h=0.05; 
h=0.025;
N=(tFinal-tInitial)/h; 
y=zeros(N+1,1); 
t=zeros(N+1,1); 
format long;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Implementing Euler's to find sol %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
t(1)=tInitial;
y(1)=yInitial; 
for(i = 1:N)
    t(i+1) = t(i) + h;
    y(i+1) = y(i) + h*F(t(i),y(i));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Plot the function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
tPlotMin=tInitial;
tPlotMax=tFinal; 
yPlotMin=0.0; 
yPlotMax=1.0;
plot(t,y)
hold on
axis([tPlotMin, tPlotMax,yPlotMin, yPlotMax]); 
title('Approximate Solution using Eulers MEthod h=0.025 ') 
xlabel('t')
ylabel('y(t)')