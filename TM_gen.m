function [res]=TM_gen(data,m,p,t,l,f_name,m_new_l)
[data_size,n1]=size(data);
n=n1-1;
[~,k]=size(p);
res=0;
psi_k=zeros(1,k);
for j=1:k
psi_k(j)=psi_t(n,t(j),f_name);
end
for i=1:data_size
y=data(i,1:n);
s=0;
for j=1:k
s=s+p(j)*exp(t(j)*f_name(m(j,:),y)-psi_k(j));
end
res=res+data(i,n1)*p(l)*exp(t(l)*f_name(m(l,:),y)-psi_k(l))*f_name(m_new_l,y)/s;
end
end