function pen = penalty(x,T,vars,k)
    flow = mdot(x,T,vars,k);
    if flow < 0.5*300 & flow>0
        pen = abs(((150/flow)-1)*11^4);
    elseif flow<=0
       pen = abs(10^9);
    else
        pen = 0;
    end

end