function [w1]=learn(x,y,w)
times=100;
eta=0.008;
lw=[];
answer=[];
[m,n]=size(x);

for k=1:times
    a=100000000000000000000000;
    for l=1:n
        if double(1-h(x(:,l),w))==0
            continue;
        else
        a=double(a/n)+double((y(1,l)*log(h(x(:,l),w)))/n)+double(((1-y(1,l))*log(1-h(x(:,l),w)))/n);
        end
    end
    a=-a;
    answer=[answer a];
    A=x'*w';
    E=[];
    for l=1:n
        e=double(1/(1+exp(-(A(l,1))))-y(1,l));
        E=[E e];
    end
    E=E';
    w=w+(eta*x*E)';
    lw=[lw w'];
end
minum=minm(answer,times);
w1=lw(:,minum);
w1=w1';

end
