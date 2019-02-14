function [res]=C_k_0(n,k,f_name)
if k==1
    res=sum_min(1:n,f_name);
else
p=perms(1:n);
c=nchoosek(1:factorial(n),k);
res=sum_min(p([c(1,:)],:),f_name);
for i=2:nchoosek(factorial(n),k)
    res=min(res,sum_min(p([c(i,:)],:),f_name));
end
end
end