function T = TEv(xTemp,T,vars,i)

    Ta = TaEv(xTemp,T,vars,i);
    [T1,T2,T3] = TwEv(xTemp,T,vars,i);
    
    T = [Ta T1 T2 T3]';
end

