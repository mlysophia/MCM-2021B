clear;clc;

height=cell2mat(struct2cell(load('height.mat')));

x=1:10:200;
y=1:10:300;
xx = repmat(x',1,30);
yy = repmat(y,20,1);

surf(xx,yy,height(x,y)),shading interp
xlabel('north-south'),ylabel('east-west'),zlabel('elevation')
title('Elevation map of Victoria'),colormap parula,view(50,30)
