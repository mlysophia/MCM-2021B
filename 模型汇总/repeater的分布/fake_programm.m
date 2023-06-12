t=-2*pi:0.1:2*pi;
x1=20*cos(t);
y1=20*sin(t);
x2=30*cos(t);
y2=30*sin(t);
x3=35*cos(t);
y3=35*sin(t);
x4=5*cos(t)+20*sqrt(2)/2;
y4=5*sin(t)+20*sqrt(2)/2;
x5=5*cos(t)+30*sqrt(2)/2;
y5=5*sin(t)+30*sqrt(2)/2;
x6=5*cos(t)+20*cos(pi/5);
y6=5*sin(t)+20*sin(pi/5);

plot(x1,y1,'b-');hold on
plot(x2,y2,'b-');hold on
plot(x3,y3,'b-');hold on

plot([-35,0],[0,0],'b-');hold on
text(-38,5,'r3=35km')
plot([30*cos(11*pi/12),0],[30*sin(11*pi/12),0],'b-');hold on
text(30*cos(11*pi/12),30*sin(11*pi/12)+5,'r2=30km')
plot([20*cos(5*pi/6),0],[20*sin(5*pi/6),0],'b-');hold on
text(20*cos(5*pi/6),20*sin(5*pi/6)+7,'r1=20km')

plot(0,0,'r.','markersize',30);hold on
text(1,-3,'EOC')

plot(20*sqrt(2)/2,20*sqrt(2)/2,'r.','markersize',15);hold on
text(20*sqrt(2)/2,20*sqrt(2)/2,'repeater1')
plot(30*sqrt(2)/2,30*sqrt(2)/2,'r.','markersize',15);hold on
text(30*sqrt(2)/2,30*sqrt(2)/2,'repeater2')
plot(x4,y4,'r-');hold on
plot(x5,y5,'r-');hold on
axis([-40,40,-40,40])

plot(20*cos(pi/5),20*sin(pi/5),'r.','markersize',15);hold on
text(20*cos(pi/5)+1,20*sin(pi/5)-2,'repeater3')
plot(x6,y6,'r-');hold on


