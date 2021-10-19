function f = objective(x,u,v,vars,k)

   
    f = mdot(x,u,vars,k) * Ca * abs(x(1)-Tref*dt+(x(1)-Tref)^2);
end

