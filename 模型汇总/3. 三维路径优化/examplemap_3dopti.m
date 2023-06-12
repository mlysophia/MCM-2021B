clear;clc;

height=cell2mat(struct2cell(load('height.mat')));

x=131:1:150;
y=151:1:190;
xx = repmat(x',1,40);
yy = repmat(y,20,1);

for i=131:150
    height(i,176) = height(i,175);
end

A=smoothdata(height(x,y));
surf(xx,yy,A),shading interp
xlabel('north-south'),ylabel('east-west'),zlabel('elevation')
colormap summer,view(80,50)
hold on
plot3(131,151,height(131,151),'k.','markersize',15)
hold on
plot3(150,190,height(150,190),'k.','markersize',15)
