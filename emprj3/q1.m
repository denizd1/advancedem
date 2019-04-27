clc;
clear;
format long e;

I=1;
rs=[1];
sigma=1./rs;
th=[0];
b=10;
a=110;
tm = -5:0.01:-1;
time=10.^tm;
[V] = TEM(time,I,sigma,th,a,b);
loglog(time,V)
hold on
mu=4*pi*10^(-7);
for j=1:length(time)
    fi=sqrt(mu*sigma/(4*time(j)));
    
    error=erf(fi*a);
    
    ex=-(fi^2)*a^2;
    
    bb=-(I/(sigma*(a^3)))*((3*error)-(2/sqrt(pi))*fi*a*(3+(a^2)*2*fi^2)*exp(ex));
    
    vv1(j)=-bb*pi*b^2;
end
loglog(time,vv1,'--r')
%error
% (vv1-V)./V*100;
% plot(time,abs(ans))