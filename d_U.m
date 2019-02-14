function [res]=d_U(a,b)
n=length(a);
p=composite(a,b,n);
m=1;
current=1;
for i=2:n
    if p(i)>p(i-1)
        current=current+1;
        m=max(m,current);
    else current=1;
    end
end
res=n-m;
end