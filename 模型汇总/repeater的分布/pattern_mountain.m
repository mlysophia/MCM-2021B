t=-2*pi:0.1:2*pi;
x1=11*cos(t);
y1=11*sin(t);
x2=22*cos(t);
y2=22*sin(t);
x3=30*cos(t);
y3=30*sin(t);
x6=32*cos(t);
y6=32*sin(t);

plot(x1,y1,'b-');hold on
plot(x2,y2,'b-');hold on
plot(x3,y3,'b-');hold on
plot(x6,y6,'b-');hold on

plot([-32,0],[0,0],'b-');hold on
text(-35,2,'r4=32km')
plot([30*cos(23*pi/24),0],[30*sin(23*pi/24),0],'b-');hold on
text(30*cos(23*pi/24),30*sin(23*pi/24)+2,'r3=30km')
plot([22*cos(11*pi/12),0],[22*sin(11*pi/12),0],'b-');hold on
text(22*cos(11*pi/12),22*sin(11*pi/12)+2,'r2=22km')
plot([11*cos(5*pi/6),0],[11*sin(5*pi/6),0],'b-');hold on
text(11*cos(5*pi/6),11*sin(5*pi/6)+2,'r1=11km')

plot(0,0,'r.','markersize',30);hold on
text(1,-3,'EOC')

x4=2*cos(t)+11*sqrt(2)/2;
y4=2*sin(t)+11*sqrt(2)/2;
x5=2*cos(t)+11*cos(-pi/6);
y5=2*sin(t)+11*sin(-pi/6);

plot(11*sqrt(2)/2,11*sqrt(2)/2,'r.','markersize',15);hold on
text(11*sqrt(2)/2,11*sqrt(2)/2,'repeater1')
plot(11*cos(-pi/6),11*sin(-pi/6),'r.','markersize',15);hold on
text(11*cos(-pi/6),11*sin(-pi/6),'repeater2')
plot(x4,y4,'r-');hold on
plot(x5,y5,'r-');hold on
axis([-40,40,-40,40])



