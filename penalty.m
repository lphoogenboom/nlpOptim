function pen = penalty(x,T,vars,k)
    flow = mdot(x,T,vars,k);
    if flow < 0.5*300
       pen = abs((1/flow)*10^9);
    else
        pen = 0;
    end

end