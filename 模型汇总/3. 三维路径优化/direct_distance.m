clear;clc;

height=cell2mat(struct2cell(load('height.mat')));
NodesMap=cell2mat(struct2cell(load('distance.mat')));

m=20;

d=0;
for i=1:m-1
    %d = d+NodesMap((2*i-1)*20+i,(2*i-1)*20+i+1);
    %d = d+NodesMap((2*i-1)*20+i+1,2*i*20+i+1);
    
    d = d+NodesMap((2*i-1)*20+i,2*i*20+i);
    d = d+NodesMap(2*i*20+i,(2*i+1)*20+i);
    d = d+NodesMap((2*i+1)*20+i,(2*i+1)*20+i+1);
end
d