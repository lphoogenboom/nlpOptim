function f = objective(x,vars,k)
    
    Tref = vars.Tref;
    Ca = vars.Ca;
    dt = vars.dt;
    f = mdot(x,vars,k) * Ca * abs(x(1)-Tref*dt+(x(1)-Tref)^2);
end

