function [res]=sum_min_data(data,w,f_name)
[data_size,n1]=size(data);
[k,n]=size(w);
res=0;
for i=1:data_size
    res=res+min_diff(data(i,1:(n1-1)),w,k,f_name)*data(i,n1);
end
res=res/sum(data(:,n1));
end