clc;
clear;
format long e;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
I=0.1;
rs=[200,150,100];
sigma=1./rs;
th=[0,20,10];
offset=[5,10,15,20,25,30,40,50,100,150];
% question 1b
[qapp,V,Qarr] = dcves(I,sigma,th,offset);
loglog(offset,(qapp)); grid on;
xlabel('offset(m)')
ylabel('apparent resistivity (ohmm)')