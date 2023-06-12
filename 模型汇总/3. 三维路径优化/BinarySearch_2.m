function position = BinarySearch_2(array,low,high,value) 
if low>high
    position = 0;
else
    mid=floor((low+high)/2);
    
    if (array(mid)<=value)&&(array(mid+1)>value)
        position = mid;
        return
    end
    
    if array(mid+1)<=value
        position = BinarySearch_2(array,mid+1,high,value); 
    else
        position = BinarySearch_2(array,low,mid-1,value);
    end   
end
