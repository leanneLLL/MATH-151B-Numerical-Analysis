%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Target function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
F=@(y) 4*y*(1-y);           % Modified for RK-2 w/o variable t

tInitial=0;
tFinal=1;
yInitial=1/10 ;

% Step sizes
% h=0.1;
% h=0.05;
% h = 0.025
% h = 0.0125;
% h = 0.00625;
% h = 0.003125;

N=(tFinal-tInitial)/h;
y=zeros(N+1,1);
t=zeros(N+1,1);
format long;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Implementing RK2 to find sol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t(1)=tInitial;
y(1)=yInitial;

h = 0.2;
finalVal = 1.0;
finalVal1 = 1.0;
finalVal2 = 1.0;
finalVal3 = 1.0;
orderConvergence = 1.0;
format long
fs = ['     h                     Approx                     order',sprintf('\n')];
for (i = 1:6)
    h = h/2.0;
    N=(tFinal-tInitial)/h;
    for( i = 1:N)
        % RK method
        y(i+1) = y(i) + h*(1/2)*F(y(i)) + h*(1/2)*F(y(i) + 1*h*F(y(i)));
    end
    if i == N
    	finalVal = y(i+1);
    end
    finalVal1 = finalVal2;
    finalVal2 = finalVal3;
    finalVal3 = finalVal;
    fs =[fs,sprintf('%-15.10e       %-15.10e          %-15.10e\n',h,finalVal,orderConvergence)]
    orderConvergence = (log((finalVal1 - finalVal2)/(finalVal2 - finalVal3)))/log(2);
    
end


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Plot the function
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tPlotMin=tInitial;
% tPlotMax=tFinal;
% yPlotMin=0.0;
% yPlotMax=1.0;
% 
% plot(t,y)
% hold on
% axis([tPlotMin, tPlotMax,yPlotMin, yPlotMax]);
% title('Approximate Solution using Eulers MEthod h=0.025 ')
% xlabel('t') 
% ylabel('y(t)')

% RK-2 Method
% h = 0.1           0.852986409173368
% h = 0.05          0.857108490469313
% h = 0.025         0.858140204624536
% h = 0.0125        0.858399561373773
% h = 0.00625       0.858464679344383
% h = 0.003125      0.858481000627705

