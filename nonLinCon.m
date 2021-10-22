function [c,ceq] = nonLinCon(x,T,vars)
massFlow = zeros(288,1);
for i = 1:144
    massFlow(i) = mdot(x,T,vars,i);
end

c = 0.5 - massFlow;
ceq = [];
end