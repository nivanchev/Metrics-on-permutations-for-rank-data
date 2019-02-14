function [res]=d_L(a,b)
    n=length(a);
    res=sum(min(abs(a-b),n-abs(a-b)));
end