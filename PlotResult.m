function Plot = PlotResult(u,v,fval,u0,v0)
    vars = variables();
    t = [1:144];

    T= zeros(4,144);
    T(:,1) = [16 16 16 16]' +273;

    for i = 1:143
       T(:,i+1) = TEv([u(i) v(i)]',T(:,i),vars,i) ;
    end

    figure()
    hold on;
    plot(t,T(1,:)-273)
    plot(t,T(2,:)-273)
    plot(t,T(3,:)-273)
    plot(t,T(4,:)-273)
    plot(t,ones(1,length(t))*(vars.Tref-273),"--")
    legend("Ta","T1","T2","T3","Tref")
    title(sprintf("Temperatures with total energy %1.5e J, initial (u,v)=(%1.1f %1.1f)",fval,u0,v0))
    
    figure()
    hold on; grid on;
    plot(t,u)
    plot(t,v)
    legend("u(t)","v(t)")
    title(sprintf("Total energy: %1.5e J initial (u,v)=(%1.1f %1.1f)",fval,u0,v0))
end