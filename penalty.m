function pen = penalty(x,T,vars,k)
    % Penalty: Computes penalty function value to be added to objective
    % function for enforcing soft constraint of airflow>=0.5
    
    flow = mdot(x,T,vars,k);
    
    if flow < 0.5*300 & flow>0 % If exceeds constraint
        pen = abs(((150/flow)-1)*11^4);
    elseif flow<=0
       pen = abs(10^9); % if flow==0
    else % no penalty
        pen = 0;
    end
end