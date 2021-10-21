function flow = mdot(x,T,vars,k)
%MDOT: mass flow rate of air through thermal tower
    rhoa = vars.rhoa;
    phi = vars.phi;
    g = vars.g;
    H = vars.H;
    T_o = vars.T_o(k);
    
    flow = rhoa*x(1)*phi*sqrt(2*g*H*max(0,(T(1)-T_o)/T(1)));
end

