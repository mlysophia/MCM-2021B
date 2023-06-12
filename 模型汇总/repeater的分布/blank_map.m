t=-2*pi:0.1:2*pi;
x1=20*cos(t);
y1=20*sin(t);
x2=30*cos(t);
y2=30*sin(t);
x3=35*cos(t);
y3=35*sin(t);

plot(x1,y1,'b-');hold on
plot(x2,y2,'b-');hold on
plot(x3,y3,'b-');hold on

plot([-35,0],[0,0],'b-');hold on
text(-38,5,'r3=50km')
plot([30*cos(11*pi/12),0],[30*sin(11*pi/12),0],'b-');hold on
text(30*cos(11*pi/12),30*sin(11*pi/12)+5,'r2=30km')
plot([20*cos(5*pi/6),0],[20*sin(5*pi/6),0],'b-');hold on
text(20*cos(5*pi/6),20*sin(5*pi/6)+7,'r1=20km')

plot(0,0,'r.','markersize',30);hold on
text(1,-3,'EOC')

axis([-40,40,-40,40])