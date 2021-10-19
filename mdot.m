function flow = mdot(u,x,vars,k)
%MDOT: mass flow rate of air through thermal tower
    rhoa = vars.rhoa;
    phi = vars.phi;
    g = vars.g;
    H = vars.H
    T_o = vars.T_o(k)
    
    flow = rhoa*u*phi*sqrt(2*g*H*max(0,(x(1)-T_o(k))/x(1)));
end

