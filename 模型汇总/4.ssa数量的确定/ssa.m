pred=cell2mat(struct2cell(load('pred.mat')));
pred_l1=cell2mat(struct2cell(load('pred_l1.mat')));
pred_l2=cell2mat(struct2cell(load('pred_l2.mat')));
pred_l3=cell2mat(struct2cell(load('pred_l3.mat')));
pred_l4=cell2mat(struct2cell(load('pred_l4.mat')));

k0=3;
k1=2;
k2=1.5;
k3=2;
k4=2.5;
moneyweight=0.5;

u1= 10*2.5/(2.5+1.75) ;
u2=  5*2.5/(2.5+1.75) ;
u3=  2*2.5/(2.5+1.75) ;

lam=log((u1-u2)/(u2-u3));
A=lam*(u1-u2)^3/(u1+u3-2*u2)^2;
a=(u1*u3-u2^2)/(u1+u3-2*u2);

%取效用1=15，效用2=10，效用3=7
%A=15.9625;
%lam=0.5108;
%a=2.5;

f=@(x)A*exp(-lam*x)+a; 

fireweight=0;
for i = 39:61
    for j = 49:71
        if (i-50)^2+(j-60)^2 >121 %无人机的拍摄角度带来2.75km的可拍照距离
            continue
        end
        fireweight=fireweight+k0*pred(i,j)+k1*pred_l1(i,j)+...
            k2*pred_l2(i,j)+k3*pred_l3(i,j)+k4*pred_l4(i,j);
    end
end

loss=zeros(1,10);
for i=1:10
    loss(i) = f(i) + 10*i;
end
[a,b] = min(loss);
a
b

fire=zeros(200,300);
for i = 1:200
    for j = 1:300
        fire(i,j) = k0*pred(i,j)+k1*pred_l1(i,j)+...
            k2*pred_l2(i,j)+k3*pred_l3(i,j)+k4*pred_l4(i,j);
    end
end

x=1:1:200;
y=1:1:300;
xx = repmat(x',1,300);
yy = repmat(y,200,1);

surf(yy,xx,fire(x,y)),shading interp,colormap hot,view(0,90)




        
        
        
        
        