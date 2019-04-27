clc;
clear;
format bank;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
%arraytype= 1=pole pole, 2=wenner, 3=dipole dipole, 4=schlumberger

rs=[250,150,100];
sigma=1./rs;
th=[0,20,15];
offset=[5,10,15,20,25,30,40,50,100,150];
I=2;
chrgblty=[0,0.6,0];   %chargeability values. I have tried to create higher chargeability layer between 2 layers
arraytype=1;
% question 2a
[deltaV,~]=ArrayCalc(arraytype,I,sigma,th,offset);
Vsigma=deltaV
sigma2=(1./rs).*(1-chrgblty);
[deltaV,~]=ArrayCalc(arraytype,I,sigma2,th,offset);
Vchar=deltaV;
Vsecond=Vchar-Vsigma   %secondary potential
charapp=Vsecond./Vchar  %apparent chargeability
loglog(offset,charapp)  %offset - apparent chargeability graph
xlabel('offset(m)')
ylabel('apparent chargeability')
grid on