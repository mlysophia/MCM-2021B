clear;clc;

firetimes_stat=cell2mat(struct2cell(load('firetimes_stat.mat')));
firetimeslevel1=cell2mat(struct2cell(load('firetimeslevel1.mat')));
firetimeslevel2=cell2mat(struct2cell(load('firetimeslevel2.mat')));
firetimeslevel3=cell2mat(struct2cell(load('firetimeslevel3.mat')));
firetimeslevel4=cell2mat(struct2cell(load('firetimeslevel4.mat')));

table0=zeros(200,300);
table1=zeros(200,300);
table2=zeros(200,300);
table3=zeros(200,300);
table4=zeros(200,300);

for i=1:200
    for j=1:300
        array=zeros(1,20);
        for k=1:20
           array(k)=firetimes_stat(i,300*(k-1)+j);
        end
        table0(i,j) = mean(array);
        array=zeros(1,20);
        for k=1:20
           array(k)=firetimeslevel1(i,300*(k-1)+j);
        end
        table1(i,j) = mean(array);
        array=zeros(1,20);
        for k=1:20
           array(k)=firetimeslevel2(i,300*(k-1)+j);
        end
        table2(i,j) = mean(array);
        array=zeros(1,20);
        for k=1:20
           array(k)=firetimeslevel3(i,300*(k-1)+j);
        end
        table3(i,j) = mean(array);
        array=zeros(1,20);
        for k=1:20
           array(k)=firetimeslevel4(i,300*(k-1)+j);
        end
        table4(i,j) = mean(array);
    end
end

save('pred.mat','table0');
save('pred_l1.mat','table1');
save('pred_l2.mat','table2');
save('pred_l3.mat','table3');
save('pred_l4.mat','table4');


