function [res]=d_C(a,b)
n=length(a);
p=composite(a,b,n);
res=0;
for j=1:n
    res=res+maxJ(j,p,n);
end
end