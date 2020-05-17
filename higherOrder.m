%% Higher order systems 
clear
%Defining F, where our IVP was given by du/dt = F(t,u), where F,u are
%vector valued.

% A= @(t) [0 1 0; 0 0 1; -2/t^3 2/t^2 -1/t];
A= @(t) [0 1 0; 0 0 1; 2 1 -2];
F=@(t,u) A(t)*u + [0; 0; exp(t)];

%true solution
y_exact=@(t) (43/36)*exp(t) + (1/4)*exp(-t) -(4/9)*exp(-2*t) +(1/6)*t.*exp(t);
%initial conditions
u0=[1; 2; 0];
a=0; b=3; h=0.1;


N=(b-a)/h;
t = a:h:b;
u = zeros(3,N+1);
u(:,1) = u0;
%Heun's scheme's loop
for i=1:N
    u(:,i+1) = u(:,i) + h/2.* ( F(t(i),u(:,i)) + F(t(i+1), u(:,i)+h.*F(t(i),u(:,i)) ));
end

figure();
hold on
plot(t,u(1,:),'-o','DisplayName','Heuns')

plot(t,y_exact(t),'-*','DisplayName','True')
legend();