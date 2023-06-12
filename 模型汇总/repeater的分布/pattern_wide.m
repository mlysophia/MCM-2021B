t=-2*pi:0.1:2*pi;
x1=20*cos(t);
y1=20*sin(t);
x2=30*cos(t);
y2=30*sin(t);
x3=35*cos(t);
y3=35*sin(t);
x4=5*cos(t)+22*sqrt(2)/2;
y4=5*sin(t)+22*sqrt(2)/2;
x5=5*cos(t)+25*cos(-pi/6);
y5=5*sin(t)+25*sin(-pi/6);

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

plot(22*sqrt(2)/2,22*sqrt(2)/2,'r.','markersize',15);hold on
text(22*sqrt(2)/2,22*sqrt(2)/2,'repeater1')
plot(25*cos(-pi/6),25*sin(-pi/6),'r.','markersize',15);hold on
text(25*cos(-pi/6),25*sin(-pi/6),'repeater2')
plot(x4,y4,'r-');hold on
plot(x5,y5,'r-');hold on
axis([-40,40,-40,40])
