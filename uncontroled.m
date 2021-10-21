clear;clc; clf;

vars = variables();
t = [1:144];

T= zeros(4,144);
T(:,1) = [16 16 16 16]' +273;

for i = 1:143
   T(:,i+1) = TEv([1 1]',T(:,i),vars,i) ;
end

figure(1)
hold on;
plot(t,T(1,:)-273)
plot(t,T(2,:)-273)
plot(t,T(3,:)-273)
plot(t,T(4,:)-273)
legend("Ta","T1","T2","T3")