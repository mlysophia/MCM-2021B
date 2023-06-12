clear;clc;

height=cell2mat(struct2cell(load('height.mat')));

m=20;
n=2*m;
k=m*n;
latitude=130;
longitude=150;

distance = zeros(k,k);
for i=1:k
    for j=1:k
        distance(i,j) = 1e3;
        if j==i-1
            column=int32(i)/20;
            row=i-20*column;
            distance(i,j) = ...
                sqrt(8.1379+11.09*(cos(34+double(row)*0.0257)^2)+((height(row+latitude,longitude+column)-height(row+latitude-1,longitude+column))/1000)^2);
        else
            if j==i+1
                column=int32(i)/20;
                row=i-20*column;
                distance(i,j) = ...
                    sqrt(8.1379+11.09*(cos(34+double(row)*0.0257)^2)+((height(row+latitude,longitude+column)-height(row+latitude+1,longitude+column))/1000)^2);
            else
                if (int32(j)/20 == int32(i)/20-1)&&(mod(j,20)==mod(i,20))
                    column=int32(i)/20;
                    row=i-20*column;
                    distance(i,j) = ...
                        sqrt(8.1379+11.09*(cos(34+double(row)*0.0257)^2)+((height(latitude+row,longitude+column)-height(row+latitude,column+longitude-1))/1000)^2);
                else
                    if (int32(j)/20 == int32(i)/20+1)&&(mod(j,20)==mod(i,20))
                        column=int32(i)/20;
                        row=i-20*column;
                        distance(i,j) = ...
                            sqrt(8.1379+11.09*(cos(34+double(row)*0.0257)^2)+((height(row+latitude,column+longitude)-height(row+latitude,column+longitude+1))/1000)^2);
                    else
                        if j==i
                            distance(i,j) = 0;
                        end
                    end
                end
            end
        end                    
    end
end

save('distance.mat','distance');
