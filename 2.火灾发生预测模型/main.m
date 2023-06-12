clear;clc;

m2000=cell2mat(struct2cell(load('m2000.mat')));
m2001=cell2mat(struct2cell(load('m2001.mat')));
m2002=cell2mat(struct2cell(load('m2002.mat')));
m2003=cell2mat(struct2cell(load('m2003.mat')));
m2004=cell2mat(struct2cell(load('m2004.mat')));
m2005=cell2mat(struct2cell(load('m2005.mat')));
m2006=cell2mat(struct2cell(load('m2006.mat')));
m2007=cell2mat(struct2cell(load('m2007.mat')));
m2008=cell2mat(struct2cell(load('m2008.mat')));
m2009=cell2mat(struct2cell(load('m2009.mat')));
m2010=cell2mat(struct2cell(load('m2010.mat')));
m2011=cell2mat(struct2cell(load('m2011.mat')));
m2012=cell2mat(struct2cell(load('m2012.mat')));
m2013=cell2mat(struct2cell(load('m2013.mat')));
m2014=cell2mat(struct2cell(load('m2014.mat')));
m2015=cell2mat(struct2cell(load('m2015.mat')));
m2016=cell2mat(struct2cell(load('m2016.mat')));
m2017=cell2mat(struct2cell(load('m2017.mat')));
m2018=cell2mat(struct2cell(load('m2018.mat')));
m2019=cell2mat(struct2cell(load('m2019.mat')));
longitude=cell2mat(struct2cell(load('longitude.mat')));
latitude=cell2mat(struct2cell(load('latitude.mat')));

init = zeros(200,300);

firetimes_all = repmat(init, 1, 20);
firetimeslevel1_all = repmat(init, 1, 20);
firetimeslevel2_all = repmat(init, 1, 20);
firetimeslevel3_all = repmat(init, 1, 20);
firetimeslevel4_all = repmat(init, 1, 20);

length = zeros(21,1);
length(1) = 0;
length(2) = size(m2000, 1);
length(3) = size(m2001, 1) + length(1);
length(4) = size(m2002, 1) + length(2);
length(5) = size(m2003, 1) + length(3);
length(6) = size(m2004, 1) + length(4);
length(7) = size(m2005, 1) + length(5);
length(8) = size(m2006, 1) + length(6);
length(9) = size(m2007, 1) + length(7);
length(10) = size(m2008, 1) + length(8);
length(11) = size(m2009, 1) + length(9);
length(12) = size(m2010, 1) + length(10);
length(13) = size(m2011, 1) + length(11);
length(14) = size(m2012, 1) + length(12);
length(15) = size(m2013, 1) + length(13);
length(16) = size(m2014, 1) + length(14);
length(17) = size(m2015, 1) + length(15);
length(18) = size(m2016, 1) + length(16);
length(19) = size(m2017, 1) + length(17);
length(20) = size(m2018, 1) + length(18);
length(21) = size(m2019, 1) + length(19);

list = [m2000; m2001; m2002; m2003; m2004;...
    m2005; m2006; m2007; m2008; m2009;...
    m2010; m2011; m2012; m2013; m2014; ...
    m2015; m2016; m2017; m2018; m2019];

for i = 1:20
    for j = 1:(length(i+1)-length(i))
        row = BinarySearch_2(latitude,1,200,abs(list(length(i)+j,1)));
        column = BinarySearch_2(longitude,1,300,list(length(i)+j,2));
        if (row>0)&&(column>0)
            firetimes_all(row,300*(i-1)+column) = firetimes_all(row,300*(i-1)+column)+1;
            if list(length(i)+j,13)<20
                firetimeslevel1_all(row,300*(i-1)+column) = firetimeslevel1_all(row,300*(i-1)+column)+1;
            else
                if list(length(i)+j,13)<50
                    firetimeslevel2_all(row,300*(i-1)+column) = firetimeslevel2_all(row,300*(i-1)+column)+1;
                else
                    if list(length(i)+j,13)<100
                        firetimeslevel3_all(row,300*(i-1)+column) = firetimeslevel3_all(row,300*(i-1)+column)+1;
                    else
                        firetimeslevel4_all(row,300*(i-1)+column) = firetimeslevel4_all(row,300*(i-1)+column)+1;
                    end
                end
            end
        end
    end
end

for i=1:20
    save('firetimes_stat.mat','firetimes_all');
    save('firetimeslevel1.mat','firetimeslevel1_all');
    save('firetimeslevel2.mat','firetimeslevel2_all');
    save('firetimeslevel3.mat','firetimeslevel3_all');
    save('firetimeslevel4.mat','firetimeslevel4_all');
end


        
