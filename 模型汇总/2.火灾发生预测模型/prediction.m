clear;clc;

firetimes_stat=cell2mat(struct2cell(load('firetimes_stat.mat')));
firetimeslevel1=cell2mat(struct2cell(load('firetimeslevel1.mat')));
firetimeslevel2=cell2mat(struct2cell(load('firetimeslevel2.mat')));
firetimeslevel3=cell2mat(struct2cell(load('firetimeslevel3.mat')));
firetimeslevel4=cell2mat(struct2cell(load('firetimeslevel4.mat')));

firetimes_pred=zeros(200,300,30);
r0=0;
rela=0;
count=0;
for i=1:200
    for j=1:300
        if (j-i >= 60)&&(i<=70)
            continue
        end
            array=zeros(1,20);
            for k=1:20
                array(k)=firetimes_stat(i,300*(k-1)+j);
            end
            array_n = rmoutliers(array,'quartiles');
            if array_n == zeros(1,size(array_n,2))
                continue
            end
            x=linspace(2000,2019,size(array_n,2));
            rela = rela + corrcoef(x,array_n);
            [r0_t,firetimes_pred(i,j,1:30)] = pre_linear(0,i,j,array,array_n);
            r0=r0+r0_t;
            count=count+1;
    end
end

firetimes_pred_l1=zeros(200,300,30);
r1=0;
for i=1:200
    for j=1:300
        if (j-i >= 60)&&(i<=70)
            continue
        end
            array=zeros(1,20);
            for k=1:20
                array(k)=firetimeslevel1(i,300*(k-1)+j);
            end
            array_n = rmoutliers(array,'quartiles');
            if array_n == zeros(1,size(array_n,2))
                continue
            end
            [r1_t,firetimes_pred_l1(i,j,1:30)] = pre_linear(1,i,j,array,array_n);
            r0=r0+r0_t;
    end
end

firetimes_pred_l2=zeros(200,300,30);
r2=0;
for i=1:200
    for j=1:300
        if (j-i >= 60)&&(i<=70)
            continue
        end
            array=zeros(1,20);
            for k=1:20
                array(k)=firetimeslevel2(i,300*(k-1)+j);
            end
            array_n = rmoutliers(array,'quartiles');
            if array_n == zeros(1,size(array_n,2))
                continue
            end
            [r2_t,firetimes_pred_l2(i,j,1:30)] = pre_linear(2,i,j,array,array_n);
            r2=r2+r2_t;
    end
end

firetimes_pred_l3=zeros(200,300,30);
r3=0;
for i=1:200
    for j=1:300
        if (j-i >= 60)&&(i<=70)
            continue
        end
            array=zeros(1,20);
            for k=1:20
                array(k)=firetimeslevel3(i,300*(k-1)+j);
            end
            array_n = rmoutliers(array,'quartiles');
            if array_n == zeros(1,size(array_n,2))
                continue
            end
            [r3_t,firetimes_pred_l3(i,j,1:30)] = pre_linear(3,i,j,array,array_n);
            r3=r3+r3_t;
    end
end

firetimes_pred_l4=zeros(200,300,30);
r4=0;
for i=1:200
    for j=1:300
        if (j-i >= 60)&&(i<=70)
            continue
        end
            array=zeros(1,20);
            for k=1:20
                array(k)=firetimeslevel4(i,300*(k-1)+j);
            end
            array_n = rmoutliers(array,'quartiles');
            if array_n == zeros(1,size(array_n,2))
                continue
            end
            [r4_t,firetimes_pred_l4(i,j,1:30)] = pre_linear(4,i,j,array,array_n);
            r4=r4+r4_t;
    end
end

save('firetimes_pred.mat','firetimes_pred');
save('firetimes_pred_l1.mat','firetimes_pred_l1');
save('firetimes_pred_l2.mat','firetimes_pred_l2');
save('firetimes_pred_l3.mat','firetimes_pred_l3');
save('firetimes_pred_l4.mat','firetimes_pred_l4');

r0/count
rela/count
r0
r1
r2
r3
r4
                