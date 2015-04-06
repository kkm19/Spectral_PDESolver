function [v]=heateqn_spectral2(T,L,h,r)
N=round(L/h)+1;
M=round(T/(r*h^2));

x = h*(0:1:N-1); dt = T/M;
c = 1;
v = sin(pi*x);

for n = 1:M
    v_hat=fft(v);
    w_hat=-1*[N/2+1:N 1:N/2].^2.*v_hat;
%    w_hat=-1*(1:N).^2.*v_hat;
    w = real(ifft(w_hat));
    vnew = v + dt*c.*w; v = vnew;
end