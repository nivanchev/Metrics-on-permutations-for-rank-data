function [res]=psi_t(n,t,d_name)
    m=max_d(n,d_name);
    prob=pmf(n,d_name);
    res=log(factorial(n)*sum(prob.*exp((0:m).*t)));
end