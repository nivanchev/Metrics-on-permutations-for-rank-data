function [m,p,t]=EM_latent(data,d_name,error,m_initial,p_initial,t_initial)
    m=m_initial;
    p=p_initial;
    t=t_initial;
    [~,k]=size(p_initial);
    e=zeros(1,3*k)+1;
    while max(e)>error 
        [m_new,p_new,t_new]=EM_latent_iteration(data,m,p,t,d_name);
        e(1:k)=abs(p-p_new);
        e((k+1):2*k)=abs(t-t_new);
        e((2*k+1):3*k)=sum(sum(abs(m-m_new)));
        m=m_new;
        p=p_new;
        t=t_new;
    end
end