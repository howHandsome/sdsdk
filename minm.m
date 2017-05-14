function [x]=minm(a,times)
b=a(1,1);
b1=1;
for k=1:times
    if a(1,k)<b
        b=a(1,k);
        b1=k;
    end
end
x=b1;
end