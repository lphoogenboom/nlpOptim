function T = TEv(x,T,vars,k)

    Ta = TaEv(x,T,vars,k);
    [T1,T2,T3] = TwEv(x,T,vars,k);
    
    T = [Ta T1 T2 T3]';
end

