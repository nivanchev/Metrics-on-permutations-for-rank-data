function [res]=d_K(a,b)
n=length(a);
res=0;
for i=1:n
    for j=1:n
        if a(i)<a(j) && b(i)>b(j)
            res=res+1;
        end
    end
end
end