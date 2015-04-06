function [v,x] = spectralBSCall(s,k,r,vol,T,N,M)
[D,x]=cheb(N);
D2=D^2;
%D2=(4/s^2)*D2(2:N,2:N);
x=s+x;
vmax=exp(x(1))-exp(k);
vmin=0;
v=max(exp(x(2:N))-exp(k),0);
v=[vmax;v;vmin];
dt=T/M;

c1=r-vol*vol/2;
c2=vol*vol/2;
c3=r+1/dt;

for n = 1:M
    vnew = (v/dt + c1*D*v+c2*D2*v)/c3; v = vnew;
    v=[vmax;v(2:N);vmin];
end