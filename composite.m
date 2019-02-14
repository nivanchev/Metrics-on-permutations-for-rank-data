function [res]=composite(a,b,n)
res=zeros(1,n);
for i=1:n
    res(a(i))=b(i);
end
end