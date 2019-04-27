clc;
clear;
format long e;
% parameters are 
% I=current
% offset=electrode distance array,offset values
I=2;
th=[10,15,20,25];
offset=10;
perm=4*pi*10^(-7);
mag=[];
% question 3d
for i=1:length(th)
    mag(end+1)=(perm*I/(4*pi*offset))*(1-th(i)/sqrt(offset^2+th(i)^2));
end
loglog(th,mag)
grid on
xlabel('depth (m)')
ylabel('magnetic field (nT)')