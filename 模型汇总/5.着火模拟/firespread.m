function res=firespread(a,b,para)
aus = load('lattice');
[m,n] = size(aus);

% 根据 aus 生成森林
S = 2*((rand(m,n)<sqrt(aus)) & (aus<para));
S(aus>1) = -1;

Plight = 0;    % 闪电概率
Pgrowth = 0;      % 生长概率

S(a,b)=1;
count=0;
% 邻居方位 d 和点燃概率 p
d = {[1,0], [0,1], [-1,0], [0,-1], [1,1], [-1,1], [-1,-1], [1,-1]};
p = [ones(1,4), ones(1,4)*(sqrt(1/2)-1/2)];
% % 考虑风的情况
% d = {[1,0], [0,1], [-1,0], [0,-1], [1,1], [-1,1], [-1,-1], [1,-1], [0,-2]};
% p = [ 0.80,  0.30,   0.80,   1.00,  0.12,   0.12,    0.30,   0.30,    0.8]; 

% 非=-1, 空=0, 火=1, 树=2；“非”表示非澳大利亚的部分或水域
U = -1; E = 0; F = 1; T = 2; 
isE = (S==E); isF = (S==F); isT = (S==T); isU = (S==U);

% 根据元胞状设置颜色 
R = isF + isU; G = isT + isU; B = isU;
%imh = image([140,150],[-39,-34], flipud(cat(3,R,G,B)));

%hold on; axis image; axis([140 150 -39 -34]); set(gca,'ydir','normal')

for t = 1:100

    % 计算邻居中能传播着火的个数
    su = zeros(size(S));
    for j = 1:length(d)
        su = su + p(j) * (circshift(S,d{j})==F);
    end
    
    % 分别找出四种状态的元胞
    isE = (S==E); isF = (S==F); isT = (S==T); isU = (S==U);
    
    % 找出满足着火条件的元胞
    ignite = rand(m,n)<su | (rand(m,n)<Plight);  
    
    % 规则 1: 着火
    Rule1 = T*(isT & ~ignite) + F*(isT & ignite);
    % 规则 2: 烧尽
    Rule2 = F*isF - F*isF;
    % 规则 3: 新生
    Rule3 = T*(isE & rand(m,n)<Pgrowth);
    % 规则 4: “非”不变
    Rule4 = U*isU;
    
    % 将所有规则综合起来
    S = Rule1 + Rule2 + Rule3 + Rule4;
    count=count + sum(isF(:));
    
    % 根据元胞状设置颜色   
    R = isF + R-0.02.*(R>0&R<=1); R(R<0)=0; G = isT + isU;
    %set(imh, 'cdata', flipud(cat(3, R+isU, G, B)) )
    %drawnow
end
res=count;
end

