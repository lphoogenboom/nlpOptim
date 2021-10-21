function Objectivetotal = ObjectiveSum(x,vars,N)
    for k=1:N
        y=objective(x,vars,k);
   end
   Objectivetotal = sum(y);
end