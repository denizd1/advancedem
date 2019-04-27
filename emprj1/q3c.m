clc;
clear;
format long e;
% parameters are 
% I=current
% sigma=Conductivities. array from the first layer
% th=thickness array from the first layer
% offset=electrode distance array,offset values
I=2;
rs=[200,150,100,250];
chrgblty=[0,0.4,0.2,0.1];    %chargeability values
sigma=(1./rs).*(1-chrgblty);
th=[30,20,10,20];
offset=[5,10,15,20,25,30,40,50];
% question 3a
[mag] = mmr(I,sigma,th,offset);
loglog(offset,mag);
xlabel('offset(m)')
ylabel('magnetic field (nT)')
grid on
