clear all; clc; close all;
vars = variables();

T = ones(4,1)*(289); % inital temp = 16C

u0 = .5; % initial guess for u and v
v0 = .5;
x0 = [u0*ones(144,1) ; v0*ones(144,1)];

A = [];
b = [];
Aeq = [];
beq = [];
ub = ones(288,1); % 1 upperbound for u&v
lb = zeros(288,1);% 0 upperbound for u&v

% @(x)nonLinCon(x,T,vars) the nonlinear constraint results in
% infeassibility. This can be added to options to test, be we don't
% recommend using it
options = optimoptions(@fmincon,'Algorithm','sqp','MaxFunctionEvaluations',1e5,'MaxIterations',3000);
[x,fval,exitflag,output] = fmincon(@(x)objective(x,T,vars,false),x0,A,b,Aeq,beq,lb,ub,[],options);


UV = [x(1:144)' ;  x(145:288)']; %[u(k) ; v(k)] evolution

%% Save Data as date--time.mat
% time = clock();
% time = './data/'+string(time(1))+'-'+string(time(2))+'-'+string(time(3))+"--"+...
%     string(time(4))+":"+string(time(5))+":"+...
%     string(cast(time(6),'uint8'))+".mat";
% save(time); clear time;

%% Sim Optimal System
[Tevol, flow] = simOpt(UV,vars);%[Temp Evolution, airflow evolution]


%% Visuals
PlotResult(UV(1,:),UV(2,:),u0,v0);
t = [1:144];
figure(5)
plot(t,flow)