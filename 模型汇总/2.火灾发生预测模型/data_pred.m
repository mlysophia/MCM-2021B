firetimes_pred=cell2mat(struct2cell(load('firetimes_pred.mat')));
firetimes_pred_l1=cell2mat(struct2cell(load('firetimes_pred_l1.mat')));
firetimes_pred_l2=cell2mat(struct2cell(load('firetimes_pred_l2.mat')));
firetimes_pred_l3=cell2mat(struct2cell(load('firetimes_pred_l3.mat')));
firetimes_pred_l4=cell2mat(struct2cell(load('firetimes_pred_l4.mat')));

table0=zeros(200,300);
table1=zeros(200,300);
table2=zeros(200,300);
table3=zeros(200,300);
table4=zeros(200,300);

for i=1:200
    for j=1:300
        table0(i,j) = mean(firetimes_pred(i,j,:));
    end
end

for i=1:200
    for j=1:300
        table1(i,j) = mean(firetimes_pred_l1(i,j,:));
    end
end

for i=1:200
    for j=1:300
        table2(i,j) = mean(firetimes_pred_l2(i,j,:));
    end
end

for i=1:200
    for j=1:300
        table3(i,j) = mean(firetimes_pred_l3(i,j,:));
    end
end

for i=1:200
    for j=1:300
        table4(i,j) = mean(firetimes_pred_l4(i,j,:));
    end
end

save('pred.mat','table0');
save('pred_l1.mat','table1');
save('pred_l2.mat','table2');
save('pred_l3.mat','table3');
save('pred_l4.mat','table4');
