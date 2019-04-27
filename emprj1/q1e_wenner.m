clc;
clear;
format long e;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
%arraytype= 1=pole pole, 2=wenner, 3=dipole dipole, 4=schlumberger

I=2;
rs=[200,150,100,80];
sigma=1./rs;
th=[0,20,15,17];
% question 1f
arraytype=1;
offset=[5,10,15,20,25,30,40,50,100,150];
[deltaV,qapp]=ArrayCalc(arraytype,I,sigma,th,offset);
hplot1=loglog(offset,qapp,'DisplayName', 'Pole-Pole','linewidth',2);
hold on
arraytype=2;
[deltaV,qapp]=ArrayCalc(arraytype,I,sigma,th,offset);
hplot2=loglog(offset,qapp,'DisplayName', 'Wenner','linewidth',2);
hold on
arraytype=3;
[deltaV,qapp]=ArrayCalc(arraytype,I,sigma,th,offset);
hplot3=loglog(offset,qapp,'DisplayName', 'Dipole-Dipole','linewidth',2);
hold on
arraytype=4;
[deltaV,qapp]=ArrayCalc(arraytype,I,sigma,th,offset);
hplot4=loglog(offset,qapp,'DisplayName', 'Schlumberger','linewidth',2);
xlabel('offset(m)')
ylabel('apparent resistivity (ohmm)')
legend([hplot1, hplot2, hplot3, hplot4],'Location','northwest')
grid on;
hold off