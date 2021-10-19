function Ta = TaEv(x,u,vars,k)
%TA Summary of this function goes here
    % x = [Ta T1 T2 T3]^T
    rhoa = vars.rhoa;
    qdotp = vars.qdotp(k);
    Ca = vars.Ca;
    Va = vars.Va;
    T_o = vars.V_o(k);
    A = vars.A;
    ha = vars.ha;

    mflow = mdot(u,x,vars,k);
    Ta = x(1)+ (dt)/(rhoa*Va*Ca) * (qdotp+mflow*Ca*(T_o-x(1)) + ...
        ha*A(1)*(x(2)-x(1)) + ha*A(2)*(x(3)-x(1)) + ha*A(3)*(x(4)-x(1)));
end

