function [T,flow] = simOpt(UV,vars)
    % simulate system with provided control input
    T = zeros(4,144);
    T(:,1) = [16 16 16 16]' + 273;
    flow = zeros(1,144);

    for i = 1:143
        T(:,i+1) = TEv(UV(:,i),T(:,i),vars,i); % temps evolution
        flow(i) = mdot(UV(:,i),T(:,i),vars,i); % airflow evolution
    end
end

