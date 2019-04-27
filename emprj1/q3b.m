clc;
clear;
format long e;
% parameters are 
% I=current
% sigma=Conductivities. array from the first layer
% th=thickness array from the first layer
% offset=electrode distance array,offset values
I=2;
rs=[200,100,150];
sigma=1./rs;
th=[0];
offset=[10];
perm=4*pi*10^(-7);
% question 3b
[mag] = mmr(I,sigma,th,offset);
Answer_Numerical=mag
Answer_Analytical=(perm*I/(4*pi*offset))*(1-th/sqrt(offset^2+th^2))
