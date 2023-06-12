clear;clc;

DefultMaxValue=1e3;
%NodesMap=[0 1 12 DefultMaxValue DefultMaxValue DefultMaxValue;
%          DefultMaxValue 0 9 3 DefultMaxValue DefultMaxValue;
%          DefultMaxValue DefultMaxValue 0 DefultMaxValue 5 DefultMaxValue;
%          DefultMaxValue DefultMaxValue 4 0 13 15;
%          DefultMaxValue DefultMaxValue DefultMaxValue DefultMaxValue 0 4;
%          DefultMaxValue DefultMaxValue DefultMaxValue DefultMaxValue DefultMaxValue 0];    
 
% NodesMap=[0 6 3 DefultMaxValue DefultMaxValue DefultMaxValue;
%           6 0 2 5 DefultMaxValue DefultMaxValue;
%           3 2 0 3 4 DefultMaxValue;
%           DefultMaxValue 5 3 0 2 3;
%           DefultMaxValue DefultMaxValue 4 2 0 5;
%           DefultMaxValue DefultMaxValue DefultMaxValue 3 5 0];

NodesMap=cell2mat(struct2cell(load('distance.mat')));

Distance=NodesMap(1,:);
 
%book结果初始化
SearchedFlag=zeros(1,size(Distance,2));
SearchedFlag(1)=1;
 
FootsResults=zeros(size(NodesMap));
FootsResults(:,1)=1;
 
Preview=zeros(1,size(Distance,2));
Preview(1)=1;
 
for i=2:size(SearchedFlag,2)
    MinID=1;
    MinValue=DefultMaxValue;
    for j=1:size(SearchedFlag,2)
        if SearchedFlag(j)==0 && Distance(j)<MinValue
            MinID=j;
            MinValue=Distance(j);
        end
    end
    SearchedFlag(MinID)=1;
    
    if i>2
        FootsResults(i,i-1)=Preview(MinID);
        for j=1:(i-1)
            Temp=FootsResults(j,:);
            FindFlag=0;
            for k=1:size(SearchedFlag,2)
                if Temp(k)==0
                    if Temp(k-1)==Preview(MinID)
                        FindFlag=1;
                        break;
                    end
                end
            end
            if FindFlag==1
                break;
            end
        end
        FootsResults(i,:)=Temp;
        FootsResults(i,k)=MinID;
    else
        FootsResults(i,i)=MinID;
    end
      
    for j=1:size(SearchedFlag,2)
        if NodesMap(MinID,j)<DefultMaxValue && SearchedFlag(j)==0
            if Distance(j)>(Distance(MinID)+NodesMap(MinID,j))
                Distance(j)=Distance(MinID)+NodesMap(MinID,j);
%                 FootsResults(i,j)=MinID;
                Preview(j)=MinID;
            end
        end
    end
 
end
% Preview
Distance
save('opti_distance.mat','Distance');
writematrix(Distance,'opti_distance.csv');