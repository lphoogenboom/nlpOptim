clear all; clc; close all;
vars = variables();

T = ones(4,1)*(289);
Tevolve = zeros(4,144);
t = [1:144];

u0 = 1;
v0 = 0;
x0 = [u0*ones(144,1) ; v0*ones(144,1)]';

A = [];
b = [];
Aeq = [];
beq = [];

ub = ones(288,1);
lb = zeros(288,1);

% @(x)nonLinCon(x,T,vars)
options = optimoptions(@fmincon,'Algorithm','sqp','MaxFunctionEvaluations',1e5,'MaxIterations',1500);
[x,fval,exitflag,output] = fmincon(@(x)objective(x,T,vars),x0,A,b,Aeq,beq,lb,ub,[],options);

UV = [x(1:144) ;  x(145:288)];

% time = clock();
% time = string(time(1))+'-'+string(time(2))+'-'+string(time(3))+"--"+...
%     string(time(4))+":"+string(time(5))+":"+...
%     string(cast(time(6),'uint8'))+".mat";
% save(time);

% different starting points
functionvalues(1)=fval
PlotResult(UV(1,:),UV(2,:),fval,u0,v0) %plots T of u and v
u0 = 0;
v0 = 1;
x0 = [u0*ones(144,1) ; v0*ones(144,1)]';
[x,fval,exitflag,output] = fmincon(@(x)objective(x,T,vars),x0,A,b,Aeq,beq,lb,ub,[],options);
functionvalues(2)=fval;
UV = [x(1:144) ;  x(145:288)];
PlotResult(UV(1,:),UV(2,:),fval,u0,v0)
u0 = 0;
v0 = 0;
x0 = [u0*ones(144,1) ; v0*ones(144,1)]';
[x,fval,exitflag,output] = fmincon(@(x)objective(x,T,vars),x0,A,b,Aeq,beq,lb,ub,[],options);
functionvalues(3)=fval;
UV = [x(1:144) ;  x(145:288)];
PlotResult(UV(1,:),UV(2,:),fval,u0,v0)
u0 = 1;
v0 = 1;
x0 = [u0*ones(144,1) ; v0*ones(144,1)]';
[x,fval,exitflag,output] = fmincon(@(x)objective(x,T,vars),x0,A,b,Aeq,beq,lb,ub,[],options);
functionvalues(4)=fval;
UV = [x(1:144) ;  x(145:288)];
PlotResult(UV(1,:),UV(2,:),fval,u0,v0)
%%

