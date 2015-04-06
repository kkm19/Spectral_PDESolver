% Problem 7.2 in Trefethen book
% u''+4u'+exp(x)*u = sin(8x)
function k = prob1(N)
[D,x] = cheb(N);
D2 = D^2;
D2 = D2(2:N,2:N); % boundary conditions
xt=x(2:N);
f = sin(8*xt);
Dcomb = D2+4*D(2:N,2:N)+diag(exp(xt));

u = Dcomb\f; % Poisson eq. solved here
u = [0;u;0];
p = polyfit(x,u,N); % interpolate grid data
k=polyval(p,0);