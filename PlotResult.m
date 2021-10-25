function Plot = PlotResult(u,v,u0,v0)
    vars = variables();
    t = [1:144];

    T= zeros(4,144);
    T(:,1) = [16 16 16 16]' +273;

    for i = 1:143
       f(i)=mdot([u,v],T,vars,i) * vars.Ca * abs(T(1,i)-vars.Tref)*vars.dt+vars.Beta*(T(1,i)-vars.Tref)^2;
       T(:,i+1) = TEv([u(i) v(i)]',T(:,i),vars,i) ;  
    end
    f(144)=mdot([u,v],T,vars,i) * vars.Ca * abs(T(1,i)-vars.Tref)*vars.dt+vars.Beta*(T(1,i)-vars.Tref)^2;
    fval=sum(f);
    figure()
    hold on;
    plot(t,T(1,:)-273)
    plot(t,T(2,:)-273)
    plot(t,T(3,:)-273)
    plot(t,T(4,:)-273)
    plot(t,ones(1,length(t))*(vars.Tref-273),"--")
    xlabel(["Timestep [k]"])
    ylabel(["Temperature ["+char(176)+"C]"])
    legend("Ta","T1","T2","T3","Tref")
    title(sprintf("Temperatures with total energy %1.5e J, initial (u,v)=(%1.1f %1.1f)",fval,u0,v0))
    
    figure()
    hold on; grid on;
    plot(t,u)
    plot(t,v)
    xlabel("timestep [k]")
    legend("u(t)","v(t)")
    title(sprintf("Total energy: %1.5e J initial (u,v)=(%1.1f %1.1f)",fval,u0,v0))
    
    figure()
    hold on; grid on;
    plot(t,f)
    xlabel("timestep [k]")
    ylabel("Energy [J]")
    title("Energy at time k")
    
end