function Ta = TaEv(xTemp,T,vars,i)
%TA Summary of this function goes here
    % x = [Ta T1 T2 T3]^T
    rhoa = vars.rhoa;
    qpdot = vars.qpdot(i);
    Ca = vars.Ca;
    Va = vars.Va;
    T_o = vars.T_o(i);
    A = vars.A;
    ha = vars.ha;
    dt = vars.dt;
    mflow = mdot(xTemp,T,vars,i);
    
    Ta = T(1)+ (dt)/(rhoa*Va*Ca) * (qpdot+mflow*Ca*(T_o-T(1)) + ...
        ha*A(1)*(T(2)-T(1)) + ha*A(2)*(T(3)-T(1)) + ha*A(3)*(T(4)-T(1)));
end