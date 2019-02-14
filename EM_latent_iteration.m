function [m_new,p_new,t_new]=EM_latent_iteration(data,m,p,t,f_name)
[~,n1]=size(data);
n=n1-1;
obs=sum(data(:,n1));
[~,k]=size(p);
m_new=zeros(k,n);
p_new=zeros(1,k);
t_new=zeros(1,k);
r=perms(1:n);
for j=1:k
    p_new(j)=T_gen(data,m,p,t,j,f_name)/obs;
    rs=zeros(1,factorial(n));
    for i=1:factorial(n)
        rs(i)=TM_gen(data,m,p,t,j,f_name,r(i,:));
    end
    [~,si]=sort(rs);
    m_max=r(si(factorial(n)),:);
        if j>1
            f=0;
            for l=1:(j-1)
              if sum(m_max==m_new(l,:))  
                  f=f+1;
              end
            end
            count=1;
            while f>0
                m_max=r(si(factorial(n)-count),:);
                f=0;
                for l=1:(j-1)
                  if sum(m_max==m_new(l,:))  
                      f=f+1;
                  end
                end
                count=count+1;
            end
        end
   
    m_min=r(si(1),:);
        if j>1
        f=0;
        for l=1:(j-1)
          if sum(m_min==m_new(l,:))  
              f=f+1;
          end
        end
        count=1;
        while f>0
             m_min=r(si(1+count),:);
            f=0;
            for l=1:(j-1)
              if sum(m_min==m_new(l,:))  
                  f=f+1;
              end
            end
            count=count+1;
        end
        end
    
    t_max=fsolve(@(x) TM_gen(data,m,p,t,j,f_name,m_max)-T_gen(data,m,p,t,j,f_name)*psi_prime(n,x,f_name),0);
    t_min=fsolve(@(x) TM_gen(data,m,p,t,j,f_name,m_min)-T_gen(data,m,p,t,j,f_name)*psi_prime(n,x,f_name),0);
    if TMT_gen(data,m,p,t,j,f_name,m_max,t_max)>TMT_gen(data,m,p,t,j,f_name,m_min,t_min)
        m_new(j,:)=m_max;
        t_new(j)=t_max;
    else
        m_new(j,:)=m_min;
        t_new(j)=t_min;
    end
end

end