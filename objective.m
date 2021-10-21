function f = objective(x,T,vars,k)
    
    Tref = vars.Tref;
    Ca = vars.Ca;
    dt = vars.dt;
    f = mdot(x,T,vars,k) * Ca * abs(T(1)-Tref*dt+(T(1)-Tref)^2);
end

