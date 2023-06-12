clear;clc;

result = zeros(11,1);

for i=1:11
    result(i)=firespread(100,90,0.4+0.02*(i-1));
end

per = 0.4:0.02:0.6;

plot(per,result);hold on
plot(per,result,'b.','markersize',15)
xlabel('vegetation coverage')
ylabel('spread range of flame')
axis([0.4,0.6,0,10])
grid on