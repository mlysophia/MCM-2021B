clear;clc;

result = zeros(11,1);

for i=1:11
    result(i)=firespread(100,90,0.9+0.02*(i-1));
end

per = 0.9:0.02:1.1;

plot(per,result);hold on
plot(per,result,'b.','markersize',15)
xlabel('Multiple of vegetation on Austalia')
ylabel('spread range of flame')
axis([0.9,1.1,0,15000])
grid on