function T = TEv(xTemp,T,vars,i)
    % single evolution for all temps
    % T = [Ta T1 T2 T3]^T
    Ta = TaEv(xTemp,T,vars,i); % find next Ta
    [T1,T2,T3] = TwEv(xTemp,T,vars,i); % Find next Tw's
    
    T = [Ta T1 T2 T3]';
end

