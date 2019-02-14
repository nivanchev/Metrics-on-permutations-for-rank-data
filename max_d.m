function [res]=max_d(n,d_name)
    res=0;
    p=perms(1:n);
    for i=1:factorial(n)
        res=max(res,d_name(1:n,p(i,:)));
    end
end