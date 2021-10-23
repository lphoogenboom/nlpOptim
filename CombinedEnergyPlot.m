function combinedPlot = CombinedEnergyPlot(uvoptimal,uv_noc,uv_mcon,vars)
    vars = variables();
    t = [1:144];
    T= zeros(4,144);
    T(:,1) = [16 16 16 16]' +273;
    
    figure()
    u = uvoptimal(1,:);
    v = uvoptimal(2,:);
    for i = 1:143
       f(i)=mdot([u,v],T,vars,i) * vars.Ca * abs(T(1,i)-vars.Tref)*vars.dt+vars.Beta*(T(1,i)-vars.Tref)^2;
       T(:,i+1) = TEv([u(i) v(i)]',T(:,i),vars,i) ;  
    end
    f(144)=mdot([u,v],T,vars,i) * vars.Ca * abs(T(1,i)-vars.Tref)*vars.dt+vars.Beta*(T(1,i)-vars.Tref)^2;
    plot(t,f)
    hold on
    u = uv_noc(1:144);
    uv = uv_noc(145:288);
    for i = 1:143
       f(i)=mdot([u,v],T,vars,i) * vars.Ca * abs(T(1,i)-vars.Tref)*vars.dt+vars.Beta*(T(1,i)-vars.Tref)^2;
       T(:,i+1) = TEv([u(i) v(i)]',T(:,i),vars,i) ;  
    end
    f(144)=mdot([u,v],T,vars,i) * vars.Ca * abs(T(1,i)-vars.Tref)*vars.dt+vars.Beta*(T(1,i)-vars.Tref)^2;
    plot(t,f)
    hold on
    u = uv_mcon(1:144);
    v = uv_mcon(145:288);
    for i = 1:143
       f(i)=mdot([u,v],T,vars,i) * vars.Ca * abs(T(1,i)-vars.Tref)*vars.dt+vars.Beta*(T(1,i)-vars.Tref)^2;
       T(:,i+1) = TEv([u(i) v(i)]',T(:,i),vars,i) ;  
    end
    f(144)=mdot([u,v],T,vars,i) * vars.Ca * abs(T(1,i)-vars.Tref)*vars.dt+vars.Beta*(T(1,i)-vars.Tref)^2;
    plot(t,f)
    hold on
    legend("Optimal","Constant","Additional constraint")
end