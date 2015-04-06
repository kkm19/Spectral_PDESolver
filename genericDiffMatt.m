function [K,a] = genericDiffMatt(x)
n=size(x);
len=n(1);

K=zeros(len,len);

for l=1:len
    a(l)=1;
    for m=1:len
        if l~=m 
            a(l)=a(l)*(x(l)-x(m));
        end
    end
end

for l=1:len
    for m=1:len
        if l~=m 
            K(l,m)=a(l)/(a(m)*(x(l)-x(m)));
        else
            for p=1:len
                if l~=p 
                    K(l,l)=K(l,l)+1/(x(l)-x(p));
                end
            end
        end
    end
end
