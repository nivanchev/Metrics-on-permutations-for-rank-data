function [res,modes,count]=k_cluster_data(data,k,d_name)
    [~,n1]=size(data);
    n=n1-1;
    p=perms(1:n);
    c=nchoosek(1:factorial(n),k);
    res=sum_min_data(data,p([c(1,:)],:),d_name);
    count=1;
    for i=2:nchoosek(factorial(n),k)
        res0=sum_min_data(data,p([c(i,:)],:),d_name);
        if res0<res
            count=1;
            modes=p([c(i,:)],:);
        end
        if res0==res
            count=count+1;
        end
        res=min(res,res0);
    end
end