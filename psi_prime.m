function [res]=psi_prime(n,t,f_name)
m=max_d(n,f_name);
prob=pmf(n,f_name);
res=sum(prob.*exp((0:m).*t).*(0:m))/sum(prob.*exp((0:m).*t));
end