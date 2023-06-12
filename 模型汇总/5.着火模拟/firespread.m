function res=firespread(a,b,para)
aus = load('lattice');
[m,n] = size(aus);

% ���� aus ����ɭ��
S = 2*((rand(m,n)<sqrt(aus)) & (aus<para));
S(aus>1) = -1;

Plight = 0;    % �������
Pgrowth = 0;      % ��������

S(a,b)=1;
count=0;
% �ھӷ�λ d �͵�ȼ���� p
d = {[1,0], [0,1], [-1,0], [0,-1], [1,1], [-1,1], [-1,-1], [1,-1]};
p = [ones(1,4), ones(1,4)*(sqrt(1/2)-1/2)];
% % ���Ƿ�����
% d = {[1,0], [0,1], [-1,0], [0,-1], [1,1], [-1,1], [-1,-1], [1,-1], [0,-2]};
% p = [ 0.80,  0.30,   0.80,   1.00,  0.12,   0.12,    0.30,   0.30,    0.8]; 

% ��=-1, ��=0, ��=1, ��=2�����ǡ���ʾ�ǰĴ����ǵĲ��ֻ�ˮ��
U = -1; E = 0; F = 1; T = 2; 
isE = (S==E); isF = (S==F); isT = (S==T); isU = (S==U);

% ����Ԫ��״������ɫ 
R = isF + isU; G = isT + isU; B = isU;
%imh = image([140,150],[-39,-34], flipud(cat(3,R,G,B)));

%hold on; axis image; axis([140 150 -39 -34]); set(gca,'ydir','normal')

for t = 1:100

    % �����ھ����ܴ����Ż�ĸ���
    su = zeros(size(S));
    for j = 1:length(d)
        su = su + p(j) * (circshift(S,d{j})==F);
    end
    
    % �ֱ��ҳ�����״̬��Ԫ��
    isE = (S==E); isF = (S==F); isT = (S==T); isU = (S==U);
    
    % �ҳ������Ż�������Ԫ��
    ignite = rand(m,n)<su | (rand(m,n)<Plight);  
    
    % ���� 1: �Ż�
    Rule1 = T*(isT & ~ignite) + F*(isT & ignite);
    % ���� 2: �վ�
    Rule2 = F*isF - F*isF;
    % ���� 3: ����
    Rule3 = T*(isE & rand(m,n)<Pgrowth);
    % ���� 4: ���ǡ�����
    Rule4 = U*isU;
    
    % �����й����ۺ�����
    S = Rule1 + Rule2 + Rule3 + Rule4;
    count=count + sum(isF(:));
    
    % ����Ԫ��״������ɫ   
    R = isF + R-0.02.*(R>0&R<=1); R(R<0)=0; G = isT + isU;
    %set(imh, 'cdata', flipud(cat(3, R+isU, G, B)) )
    %drawnow
end
res=count;
end

