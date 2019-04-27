clc;
clear;
format long e;
% parameters are 
% I=current
% offset=electrode distance array,offset values
I=2;
th=10;
offset=[5,10,15,20,25,30,35,40,45,50,60,70,80,100,120];
perm=4*pi*10^(-7);
mag=[];
% question 3d
for i=1:length(offset)
    mag(end+1)=(perm*I/(4*pi*offset(i)))*(1-th/sqrt(offset(i)^2+th^2));
end
loglog(mag)
grid on
xlabel('offset(m)')
ylabel('magnetic field (nT)')