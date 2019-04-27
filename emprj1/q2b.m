clc;
clear;
format bank;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
%arraytype= 1=pole pole, 2=wenner, 3=dipole dipole, 4=schlumberger

sigma=[1,0.1];
th=[0,8];
offset=[5,10,15,20,25,30,40,50];
I=2;
chrgblty=[0,0.1];   %chargeability values.
arraytype=1;
% question 2a
[deltaV,~]=ArrayCalc(arraytype,I,sigma,th,offset);
Vsigma=deltaV
sigma=sigma.*(1-chrgblty);
[deltaV,~]=ArrayCalc(arraytype,I,sigma,th,offset);
Vchar=deltaV;
Vsecond=Vchar-Vsigma  %secondary potential
charapp=Vsecond./Vchar   %apparent chargeability
loglog(offset,charapp)  %offset - apparent chargeability graph
xlabel('offset(m)')
ylabel('apparent chargeability')
grid on