function [res]=sum_min(w,f_name)
[k,n]=size(w);
p=perms(1:n);
res=0;
for i=1:factorial(n)
    res=res+min_diff(p(i,:),w,k,f_name);
end
res=res/factorial(n);
end