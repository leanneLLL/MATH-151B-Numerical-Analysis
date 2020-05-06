% AB2 method
function [t, y] = AB2(f,a,b,y0,h)
    
    N = round((b - a) / h);
% Allocate space for my variables.
    y= zeros(1,N+1);
    
% Set the initial conditions of my variables.
    t=a:h:b;
    y(1) = y0;
% Starting value y1 obtained using RK4
    t(2) = a+h;
	y(2)=y(1)+h*(1/6*f(t(1),y(1))+1/3*(f(t(1)+h/2,y(1)+h/2*f(t(1),y(1))))... 
        +1/3*(f(t(1)+h/2,y(1)+h/2*(f(t(1)+h/2,y(1)+h/2*f(t(1),y(1))))))... 
        +1/6*(f(t(2),y(1)+h*(f(t(1)+h/2,y(1)+h/2*(f(t(1)+h/2,y(1)+h/2*f(t(1),y(1)))))))));
% AB2
    for i = 2:N
        y(i+1) = y(i) + h * ((3/2)*f(t(i), y(i))-(1/2)*(f(t(i-1),y(i-1))));
    end
end


