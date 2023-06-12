clear;clc;

e_distance = zeros(1000,1000);
for i=1:1000
    for j=i:1000-i+1
        e_distance(i,j) = sqrt(8.1379+11.09*(cos(((i/200)-(j/200))*0.0257))^2);
    end
end

e = e_distance';
e_distance = e + e_distance;
e = e_distance';
e_distance = e + e_distance;
save('e_distance.mat','e_distance');
writematrix(e_distance,'e_distance.csv');