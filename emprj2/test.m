clc;
clear;
format long e;
%Parameters are conductivity(sigma),depth of layers(th)
%and the frequency(freq)
%sigma and th start from the last layer.
%first value of sigma and th are the conductivity and depth
%for the last layer.
%rs values are resistivity of each layer

rs=[100,2000];
th=[0,200];
sigma=1./rs;
frq = -4:0.1:4; 
freq = 10.^frq;
[rhoapp,phase] = MT(sigma,th,freq);
loglog(freq,rhoapp)

grid on;
xlabel('Frequency(Hz)')
ylabel('Apparent Resistivity (ohmm)')
set(gca,'xdir','reverse')
% ylabel('Phase')