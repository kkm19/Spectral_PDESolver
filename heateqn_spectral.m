function [v]=heateqn_spectral(tmax,N,M)
h = 2*pi/N; x = h*(-N/2+1:N/2); t = 0; dt = tmax/M;
c = 1;
v = exp(sin(x));

column = [-pi^2/(3*h^2)-1/6 ...
-.5*(-1).^(1:N-1)./sin(h*(1:N-1)/2).^2];
D2 = toeplitz(column);

for n = 1:M
    t = t+dt;
    w = v*D2;
    vnew = v + dt*c.*w; v = vnew;
end