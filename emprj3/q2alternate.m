clc;
clear;
format long e;

I=1;
rs=[10];
sigma=1./rs;
th=[0];
b=10;
a=110;
tm = -5:0.01:-1;
time=10.^tm;
mu=4*pi*10^(-7);
[V] = TEM(time,I,sigma,th,a,b);
hplot1=loglog(time,V, 'LineWidth',3,'displayname','Numerical');
grid on
hold on
for t=1:length(time)
    vlate(t)=pi*b^2*I*sigma^(3/2)*mu^(5/2)*a^2*(time(t))^(-5/2)/(20*sqrt(pi));
end
hplot2=semilogx(time,vlate,'--r' ,'LineWidth',3,'displayname','V late');
legend([hplot1,hplot2])

xlabel('t') 
ylabel('V') 
