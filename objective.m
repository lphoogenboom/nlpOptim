function obj = objective(x,T,vars,p)
    % objective function to optimize for control for all time till horizon
    obj = 0; % initial objective val
    
    for i= 1:144
        % required vars
        xTemp = [x(i) x(i+144)]';
        Tref = vars.Tref;
        Ca = vars.Ca;
        dt = vars.dt;
        beta = vars.Beta;
        
        f = mdot(xTemp,T,vars,i) * Ca * abs(T(1)-Tref)*dt+...
            beta*(T(1)-Tref)^2;% Objective
        
        switch p % penalty?
            case true
                pen = penalty(xTemp,T,vars,i); % penalty
                obj = obj+f+pen; % cumulative sum w. objective and penalty
            case false
                obj = obj+f; % cumulative sum w. objective    
        end
        
        T = TEv(xTemp,T,vars,i); %  T = T(K+1), prep for next loop.  
    end
end