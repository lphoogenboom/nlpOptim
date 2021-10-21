clear; clc; close all;
vars = variables();

T = ones(4,1)*(289);

u0 = 0*ones(144,1);
v0 = 0*ones(144,1);
x0 = [u0 ; v0]; clear u0 v0;

A = [];
b = [];
Aeq = [];
beq = [];

ub = ones(288,1);
lb = zeros(288,1);

options = optimoptions(@fmincon,'Algorithm','sqp');
[x,fval,exitflag,output] = fmincon(@(x)objective(x,T,vars),x0,A,b,Aeq,beq,lb,ub,[],options);