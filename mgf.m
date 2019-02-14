function [res]=mgf(n,t,d_name)
    res=sum(pmf(n,d_name).*exp((0:max_d(n,d_name)).*t));
end