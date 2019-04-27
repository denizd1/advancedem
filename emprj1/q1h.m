clc;
clear;
format long e;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
%arraytype= 1=pole pole, 2=wenner, 3=dipole dipole, 4=schlumberger

I=0.1;
rs=[6,7,10,20,390];
sigma=1./rs;
th=[0,5,10,15,10];
offset=[5,15,25,35,45,55,65,75,85,95,105];
% question 1h wenner data test
testrho=[386.6,93.7,49.02,31.34,20.95,15.62,12.32,10.24,8.302,7.189,6.703];
hplot1=plot(offset,testrho,'DisplayName', 'Real Data');
hold on
arraytype=2;
[deltaV,qapp]=ArrayCalc(arraytype,I,sigma,th,offset);
hplot2=plot(offset,qapp,'DisplayName', 'Test Data');
hold off
legend ([hplot1, hplot2])
xlabel('offset(m)')
ylabel('apparent resistivity (ohmm)')
grid on;