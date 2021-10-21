clear; clc;
vars = variables();

T = ones(4,1)*(16+273);

x0 = 0.5*ones(288,1);

A = [];
b = [];
Aeq = [];
beq = [];

ub = ones(288,1);
lb = zeros(288,1);

% options = optimoptions(@fmincon,'Algorithm','sqp');
[x,fval,exitflag,output] = fmincon(@(x)objective(x,T,vars),x0,A,b,Aeq,beq,lb,ub);