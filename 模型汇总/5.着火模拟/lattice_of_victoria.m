clear;clc;

height=cell2mat(struct2cell(load('height.mat')));

lattice = zeros(200,300);
for i=1:200
    for j=1:300
        lattice(i,j) = 99999.90;
        if height(i,j)>0
            lattice(i,j) = rand();
        end
    end
end

for j=1:300
    lattice(56,j) = lattice(55,j);
    lattice(127,j) = lattice(126,j);
    lattice(188,j) = lattice(187,j);
end

for i=1:200
    lattice(i,176) = lattice(i,175);
end

dlmwrite('lattice',lattice,'delimiter','\t','precision','%.2f')