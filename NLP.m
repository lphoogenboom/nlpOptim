clear all; clc; close all;
vars = variables();

T = ones(4,1)*(289);
Tevolve = zeros(4,144);
t = [1:144];

u0 = 1*ones(144,1);
v0 = 1*ones(144,1);
x0 = [u0 ; v0]'; clear u0 v0;

A = [];
b = [];
Aeq = [];
beq = [];

ub = ones(288,1);
lb = zeros(288,1);

options = optimoptions(@fmincon,'Algorithm','sqp','MaxFunctionEvaluations',1e5,'MaxIterations',1500);
[x,fval,exitflag,output] = fmincon(@(x)objective(x,T,vars),x0,A,b,Aeq,beq,lb,ub,@(x)nonLinCon(x,T,vars),options);

UV = [x(1:144) ;  x(145:288)];

saveData()

%% Visuals

figure(1)
hold on; grid on;
plot(t,UV(1,:))
plot(t,UV(2,:))
legend("u(t)","v(t)")

