clc;
clear;
format long e;
%Parameters are conductivity(sigma),depth of layers(th)
%and the frequency(freq)
%sigma and th start from the last layer.
%first value of sigma and th are the conductivity and depth
%for the last layer.
%rs values are resistivity of each layer
load('realdata.txt');
rs=[100,3000,25000,40000,8000,19000];
th=[0,90000,100000,300000,200000,100000];
sigma=1./rs;

freq=realdata(:,1);
realappres=realdata(:,2);
realphase=realdata(:,3);
hplot1=loglog(freq,realphase,'displayname','Real');

hold on;
[rhoapp,phase] = MT(sigma,th,freq);
hplot2=loglog(freq,phase,'displayname','Synthetic');
hold off;
grid on;
legend([hplot1,hplot2], 'Location', 'best')
xlabel('Frequency(Hz)')
%ylabel('Apparent Resistivity (ohmm)')
ylabel('Phase')