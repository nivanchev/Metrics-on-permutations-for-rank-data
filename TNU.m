function [res]=TNU(data,n,obs)
m=size(data);
res=0;
for i=1:m
    if data(i,n+1)>0
        res=res+2*data(i,n+1)*log(data(i,n+1)*factorial(n)/obs);
    end
end
end