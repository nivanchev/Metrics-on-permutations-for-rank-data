function [res]=LRS_latent(data,modes,proportions,theta,d_name)
    [data_size,n1]=size(data);
    n=n1-1;
    [~,k]=size(proportions);
    res=0;
    psi_k=zeros(1,k);
    for j=1:k
        psi_k(j)=psi_t(n,theta(j),d_name);
    end
    for i=1:data_size
        y=data(i,1:n);
        s=0;
    for j=1:k
        s=s+proportions(j)*exp(theta(j)*d_name(modes(j,:),y)-psi_k(j));
    end
        res=res+data(i,n1)*log(s);
    end
    res=2*(res+sum(data(:,n1))*log(factorial(n)));
end