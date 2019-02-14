function [res]=maxJ(j,p,n)
s=zeros(1,n+1);
current=j;
    for i=1:(n+1)
        s(i)=current;
        current=p(current);
    end
 if max(s)==j
     res=0;
 else res=1;
 end
end