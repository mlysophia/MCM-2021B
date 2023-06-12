clear;clc
A=[-35.40,143.55;-35.73,143.91;-36.74,142.21;-37.59,141.39;-37.74,142.03;-37.26,142.94;-36.74,144.28;-37.54,143.83;-38.33,143.58;-38.12,144.36;-37.68,144.57;-37.72,145.31;-37.85,145.17;-38.02,145.23;-38.16,145.93;-38.11,147.08;-37.83,147.60;-37.01,145.12;-36.38,145.40;
   -36.38,146.27;-36.13,146.88];
B=zeros(21,2);
for i=1:21
    B(i,1)=floor((-A(i,1)-34)/0.05)+480;
    B(i,2)=floor((A(i,2)-141)/0.05)+580;
end
C=zeros(21,2);
for i=1:21
    C(i,1)=floor((-A(i,1)-34)/0.05*2);
    C(i,2)=floor((A(i,2)-141)/0.03);
end

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
u1= 30*2.5/(2.5+1.75) ;
u2=  25*2.5/(2.5+1.75) ;
u3=  23*2.5/(2.5+1.75) ;

lam=log((u1-u2)/(u2-u3));
A=lam*(u1-u2)^3/(u1+u3-2*u2)^2;
a=(u1*u3-u2^2)/(u1+u3-2*u2);

%取效用1=15，效用2=10，效用3=7
%A=15.9625;
%lam=0.5108;
%a=2.5;

f=@(x)A*exp(-lam*x)+a;
g=@(x)0.0672*x^2+0.1051*x;

fireweight=zeros(1,21);
for z=1:21
    for i =C(z,1)-11 :C(z,1)+11
        for j = C(z,2)-11:C(z,2)+11
            if (i-C(z,1))^2+(j-C(z,2))^2 >121 %无人机的拍摄角度带来2.75km的可拍照距离
                continue
            end
            fireweight(z)=fireweight(z)+k0*pred(i,j)+k1*pred_l1(i,j)+...
                k2*pred_l2(i,j)+k3*pred_l3(i,j)+k4*pred_l4(i,j);
        end
    end
end
loss=zeros(21,10);
for j=1:21
    for i=1:10
        use=0;
        for k=1:i
            use=use+f(i);
        end
        loss(j,i) = g(max(0,fireweight(j)-use)) + 100*i;
    end
end

d=zeros(21,1);
e=zeros(21,1);
for i=1:21
    [d(i),e(i)]=min(loss(i,:));
end
fireweight
d
e