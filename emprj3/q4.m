clc;
clear;
format long e;

I=1;
sigma=[10,1,10];
th=[0,5,50];
b=10;
a=110;
tm = -5:0.01:-1;
time=10.^tm;
mu=4*pi*10^(-7);
airflag=0;
airheight=0;
[V] = TEM(time,I,sigma,th,a,b,airheight,airflag);
for t=1:length(time)
    appsigma(t)=((1/(I*pi*b^2))*V(t)*20*sqrt(pi)*(1/a^2)*(1/mu^(5/2))*time(t)^(5/2))^(2/3);
end
loglog(time,appsigma ,'LineWidth',2)
grid on
xlabel('t') 
ylabel('apparent conductivity (S/m)') 