clc;
clear;
format long e;
load('realdata.txt');
I=3;
sigma=[500,500,500];
th=[0,10,10];
b=3.17;
a=100;
hplot1=loglog(realdata(:,2),realdata(:,3), 'LineWidth',3,'displayname','Real');
hold on
[V] = TEM(realdata(:,2),I,sigma,th,a,b);
hplot2=loglog(realdata(:,2),V,'--r', 'LineWidth',3,'displayname','Syntetic');
legend([hplot1,hplot2])
grid on
xlabel('t') 
ylabel('V') 
