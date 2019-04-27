clc;
clear;
format long e;
% parameters are 
% I=current
% sigma=Conductivities. array from the first layer
% th=thickness array from the first layer
% offset=electrode distance array,offset values
I=2;
rs=[200,150];
sigma=1./rs;
th=[30,20];
offset=[5,10,15,20,25,30,40,50,100];
% question 3a
[mag] = mmr(I,sigma,th,offset);
loglog(mag)
xlabel('offset(m)')
ylabel('magnetic field (nT)')
