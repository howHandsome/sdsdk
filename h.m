function [c]=h(x,w)
c=double(1/(1+exp(-(w*x))));
end