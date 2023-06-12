clear;clc;

A=[1,0,2,5,0,3,0,8,5,6,3,9,7,0,3,0,3,13,1,81];

A_n = rmoutliers(A);

t1 = 2000:2019;
t2=linspace(2000,2019,size(A_n,2));

plot(t1, A,'g-'); hold on;
plot(t2, A_n, 'b-');
xlabel('year'); ylabel('number of fires per year');
legend('number with abnormal data','number without abnormal data');
grid on;