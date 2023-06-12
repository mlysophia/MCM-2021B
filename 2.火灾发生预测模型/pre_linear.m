function [r,y_a]=pre_linear(level,row,column,array,array_n)
%t1 = 2000:2019;
t2 = 2000:2029;
t3=linspace(2000,2019,size(array_n,2));
p_a = polyfit(t3,array_n,1);
y_t = polyval(p_a,t3);
yres = sum((y_t-array_n).^2);
r = 1 - yres/((size(array,2)-1)*var(array));
y_a = polyval(p_a,t2);

%plot(t1, array,'r.'); hold on;
%plot(t2, y_a, 'b-');
%xlabel('year'); ylabel('number of fires per year');
%legend('actual number','number of prediction without abnormal data');
%title('forcast chart of number of fires');
%grid on;
%saveas(gca,strcat('等级',num2str(level),'格子',num2str(row),'，',num2str(column),'的着火预测图.png'));
%hold off;