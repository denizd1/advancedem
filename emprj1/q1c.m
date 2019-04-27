clc;
clear;
close all
format bank;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
I=2;
sigma=[0.1,1];
th=[0,8];
sigma1=[0.1,2];
th1=[0,4];
offset=[5,10,15,20,25,30,40,50,100,150];

% question 1d

[qapp] = dcves(I,sigma,th,offset); 
hplot1=loglog(offset,qapp,'DisplayName', 'd=8 m');
hold on;
[qapp] = dcves(I,sigma1,th1,offset);
hplot2=loglog(offset,qapp,'DisplayName', 'd=4 m');
legend([hplot1, hplot2])
grid on;
xlabel('offset(m)')
ylabel('apparent resistivity (ohmm)')
hold off;