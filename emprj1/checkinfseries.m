clc;
clear;
format long e;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
I=0.1;
rs=[200,150];
sigma=1./rs;
th=[0,30];
offset=[20];
k=(rs(1)-rs(2))/(rs(1)+rs(2));
% check aganist the infinite series solution
V_is=I*rs(2)/(2*pi)*((1/offset)+(2*k)/sqrt(offset^2+(2*th(end))^2))
[qapp,V] = dcves(I,sigma,th,offset);
V_rr=V
error=abs((V_is-V_rr)/(V_rr))*100