clc;
clear;
rho=[];
for f=1:1000
    rho(end+1)=2*pi*f*4*pi*10^(-7)*100^2;
end
semilogy(rho)
grid on;
xlabel('Frequency(Hz)')
ylabel('Apparent Resistivity (ohmm)')