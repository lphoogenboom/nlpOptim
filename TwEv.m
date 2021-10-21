function [Tw1, Tw2, Tw3] = TwEv(x,vars,k)
%T1 Summary of this function goes here
%   Detailed explanation goes here
    I = vars.I(k);
    T_o = vars.T_o(k);
    alpha = vars.alpha;
    Tsky = vars.Tsky(k);
    ho = vars.ho;
    V = vars.V;
    tau = vars.tau(1);
    A = vars.A;
    dt = vars.dt;
    rho = vars.rho;
    C = vars.C;
    lambda = vars.lambda;
    ha = vars.ha;
    
    Tw1 = x(2) + A(1) * dt/(rho(1)*V(1)*C(1)) * (x(6)*I*alpha(1) + ...
        lambda*(Tsky^4-x(2)^4)) + ho*(T_o-x(2)) + ha*(x(2)-x(1));
    
    Tw2 = x(3) + A(2) * dt/(rho(2)*V(2)*C(2)) * (I*alpha(2) + ...
        lambda*(Tsky^4-x(3)^4)) + ho*(T_o-x(3)) + ha*(x(3)-x(1));
    
    Tw3 = x(4) + A(3)*dt/(rho(3)*V(3)*C(3)) * (0.5*x(6)*I*tau*alpha(3) + ...
        ha*(x(4)-x(1)));
end

