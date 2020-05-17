% Finite difference method of solving BVP
%% BVPS
% y'' - 2y' +y = xe^x -x, y(a)=0, y(b)=-4
f=@(x) x.*(exp(x)) - x;

a = 0; b = 2;
h=0.2;
N=(b-a)/h;
ya = 0; yb = -4; 
ytrue = @(x) (1/6)*(x.^3).*exp(x) - (5/3)*x.*exp(x) + 2*exp(x) - x -2;

%set up A matrix
A=zeros(N-1,N-1);
u=zeros(N-1,1);
F=zeros(N-1,1);
%%
p = -2;
A= (1-(2/(h^2))).*diag(ones(N-1,1),0) +...
    ((1/(h^2))+(p/(2*h))).*diag(ones(N-2,1),1) +...
    ((1/(h^2))-(p/(2*h))).* diag(ones(N-2,1),-1);
%%
X=a:h:b;

F=f(X(2:end-1)');
F(N-1,1) = f(X(end-1)) + 4/h^2 - 4/h;
F(1,1) = f(X(2));

u=A\F;
%Here, we add in the end (boundary) points back to u, so it has the
%solution for x_0,...,x_N.
u=[ya ;u ; yb];
%plot(X,u,X,ytrue(X))
%legend('approx','true')

%This gives large error since u is Nx1, while ytrue(X) is 1XN
error = norm(u-ytrue(X))

%This gives real error
error11 = norm(u'-ytrue(X),1);
error12 = norm(u'-ytrue(X),2);
error1inf = norm(u'-ytrue(X),inf);

errors1 = 0.0114;
errors2 = 0.0021;
errors3 = 6.0018e-04;

errorm1 = 0.0228;
errorm2 = 0.0059;
errorm3 = 0.0024;

errorl1 = 0.0451;
errorl2 = 0.0170;
errorl3 = 0.0096;
 
x = [0.05,0.1,0.2];
y1 = [errors1,errorm1,errorl1];
y2 = [errors2,errorm2,errorl2];
y3 = [errors3,errorm3,errorl3];

plot(x,y1,'o-',x,y2,'v-',x,y3,'*-');
legend('L1 norm','L2 norm','Infinity norm');