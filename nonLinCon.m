function [c,ceq] = nonLinCon(x,T,vars)
    % nonlinear constraint
massFlow = zeros(288,1); % pre-aloc matrix

for i = 1:144
    massFlow(i) = mdot(x,T,vars,i); % airflow
end

c = 0.5*300 - massFlow; % signs cause airflowgreater than 5kg/s. factor 300
% because discretised time
ceq = []; % no equality constraint
end