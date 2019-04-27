clc;
clear;
format long e;
%Parameters are conductivity(sigma),depth of layers(th)
%and the frequency(freq)
%sigma and th start from the last layer.
%first value of sigma and th are the conductivity and depth
%for the last layer.
%rs values are resistivity of each layer

rs=[200,300,400];
th=[0,100,200];
sigma=1./rs;
frq = -4:0.1:3; 
freq = 10.^frq;

[rhoapp,phase] = MT(sigma,th,freq);
loglog(freq,rhoapp)

grid on;
xlabel('Frequency(Hz)')
ylabel('Apparent Resistivity (ohmm)')
% ylabel('Phase')