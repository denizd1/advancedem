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
rs=[0.8,50,100,725];
sigma=1./rs;
th=[0,10,5,20];
offset=[5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,...
    110,115,120,125,130,135,140,145,150,155];

testrho=[724.8,217.9,96.67,54.52,35.11,24.02,20.29,14.03,11.05,8.663,...
    6.73,5.233,4.307,3.485,2.812,2.433,2.24,1.966,1.533,1.42,...
    1.366,1.232,1.082,1.075,0.9312,0.926,0.9489,0.8984,0.4556,...
    0.8037,1.495];

% question 1h schlumberger data test
arraytype=4;
hplot1=plot(offset,testrho,'DisplayName', 'Real Data');
hold on
[deltaV,qapp]=ArrayCalc(arraytype,I,sigma,th,offset);
hplot2=plot(offset,qapp,'DisplayName', 'Test Data');
hold off
legend ([hplot1, hplot2])
xlabel('offset(m)')
ylabel('apparent resistivity (ohmm)')
grid on;