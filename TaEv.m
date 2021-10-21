function Ta = TaEv(x,T,vars,k)
%TA Summary of this function goes here
    % x = [Ta T1 T2 T3]^T
    rhoa = vars.rhoa;
    qpdot = vars.qpdot(k);
    Ca = vars.Ca;
    Va = vars.Va;
    T_o = vars.T_o(k);
    A = vars.A;
    ha = vars.ha;
    dt = vars.dt;
    mflow = mdot(x,vars,k);
    
    Ta = T(1)+ (dt)/(rhoa*Va*Ca) * (qpdot+mflow*Ca*(T_o-T(1)) + ...
        ha*A(1)*(T(2)-T(1)) + ha*A(2)*(T(3)-T(1)) + ha*A(3)*(x(4)-T(1)));
end