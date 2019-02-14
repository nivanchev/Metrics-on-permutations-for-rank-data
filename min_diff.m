function [res]=min_diff(y,w,k,f_name)
res=f_name(y,w(1,:));
for i=2:k
    res=min(res,f_name(y,w(i,:)));
end
end