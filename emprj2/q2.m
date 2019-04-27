clc;
clear;
format long e;
%Parameters are conductivity(sigma),depth of layers(th)
%and the frequency(freq)
%sigma and th start from the last layer.
%first value of sigma and th are the conductivity and depth
%for the last layer.

th=[0,50,500];
sigma=[0.1,10,0.1];
frq=-4:0.1:1; 
freq=10.^frq;

[rhoapp,phase] = MT(sigma,th,freq);
loglog(freq,rhoapp)
grid on;
xlabel('Frequency(Hz)')
ylabel('Apparent Resistivity (ohmm)')
% ylabel('Phase')