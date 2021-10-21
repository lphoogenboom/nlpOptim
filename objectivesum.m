function Objectivetotal = ObjectiveSum(x,T,vars,N)
    y = 0;   
    for k=1:N
       y= y + objective(x,T,vars,k);
    end
end