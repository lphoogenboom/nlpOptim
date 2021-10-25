function flow = mdot(xTemp,T,vars,i)
    %MDOT: mass flow rate of air through thermal tower
    % variables
    rhoa = vars.rhoa;
    phi = vars.phi;
    g = vars.g;
    H = vars.H;
    T_o = vars.T_o(i);
    
    flow = rhoa*xTemp(1)*phi*sqrt(2*g*H*max(0,(T(1)-T_o)/T(1))); % airflow
end

