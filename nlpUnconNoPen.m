clear;clc; clf;
vars = variables();

t = [1:144];

T= zeros(4,144);
T(:,1) = [16 16 16 16]' +273; % initial temp is 16C

for i = 1:143
   T(:,i+1) = TEv([0 0]',T(:,i),vars,i); % temperature evolution
end

figure(1) % plot temps
hold on;
plot(t,T(1,:)-273)
plot(t,T(2,:)-273)
plot(t,T(3,:)-273)
plot(t,T(4,:)-273)
legend("Ta","T1","T2","T3")