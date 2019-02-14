function [res]=pmf(n,d_name)
    res=zeros(1,max_d(n,d_name)+1);
    p=perms(1:n);
    for i=1:factorial(n)
        d=d_name(1:n,p(i,:));
        res(d+1)=res(d+1)+1;
    end
    res=res./factorial(n);
end