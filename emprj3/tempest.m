clc;
clear;
format long e;

I=280;
rs=[1,10,90];
sigma=1./rs;
th=[0,10,50];
b=10;
a=185;
tm = -5:10:-1;
time=10.^tm;
airflag=1;
airheight=200;
fixedaem=1;
r=100;
[V] = TEM(time,I,sigma,th,a,b,airheight,airflag,fixedaem,r);
loglog(time,V, 'LineWidth',3);
grid on
xlabel('t') 
ylabel('V') 