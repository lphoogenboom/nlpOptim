function obj = objective(x,T,vars)
    obj = 0;
    for i= 1:144
        xTemp = [x(i) x(i+144)]';
        Tref = vars.Tref;
        Ca = vars.Ca;
        dt = vars.dt;
        beta = vars.Beta;
        f = mdot(xTemp,T,vars,i) * Ca * abs(T(1)-Tref)*dt+beta*(T(1)-Tref)^2;
        obj = obj + f;
        
        T = TEv(xTemp,T,vars,i);
    end
end

