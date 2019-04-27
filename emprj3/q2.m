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
for t=1:length(time)
    appsigma(t)=((1/(I*pi*b^2))*V(t)*20*sqrt(pi)*(1/a^2)*(1/mu^(5/2))*time(t)^(5/2))^(2/3);
end
loglog(time,1./appsigma ,'LineWidth',2)
grid on
xlabel('t') 
ylabel('apparent resistivity (ohmm)') 
