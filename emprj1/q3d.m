clc;
clear;
format long e;
% parameters are
% I=current
% sigma=Conductivities. array from the first layer
% th=thickness array from the first layer
% offset=electrode distance array,offset values
I=2;
rs=[200,150,100,250];
sigma=1./rs;
th=[30,20,10,20];
offset=[5,10,15,20,25,30,40,50,100,150];
perm=4*pi*10^(-7);
% question 3d
for r=1:length(offset)
    for z=1:length(th)
        B(r,z)=(perm*I/(4*pi*offset(r)))*(1-th(z)/sqrt(offset(r)^2+th(z)^2))
    end
end
