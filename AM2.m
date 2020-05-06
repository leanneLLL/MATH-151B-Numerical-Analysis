% AM2 method
function [t, y] = AM2(f,a,b,y0,h)
% Determine values of N and h.
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
% AM2
    for i = 2:N
        y(i+1) = (16/29)*y(i) + (1/29)*y(i-1) + (5/29)*(t(i+1).^2) +(8/29)*(t(i).^2) - (1/29)*(t(i-1).^2)...
            +(2/29)*t(i+1) +(16/145)*t(i) -(2/145)*t(i-1);
    end
end


