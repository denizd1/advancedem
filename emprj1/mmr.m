% borehole mmr function
% parameters are
% I=current
% sigma=Conductivities. array from the first layer
% th=thickness array from the first layer
% offset=electrode distance array,offset values
% function returns magnetic field
function [mag] = mmr(I,sigma,th,offset)
[~,~,Qarr] = dcves(I,sigma,th,offset);
load('FilterCoefficients.mat');
r=offset;
mag=zeros(1,length(offset));
perm=4*pi*10^(-7);
for ir=1:length(offset)                                     %for loop for offsets
    for il=1:N_J1
        flag=length(th);
        lambda=(root_J1)^(il-N0_J1)/offset(ir);
        for ily=1:length(th)                                %for loop for layers
            sig = sigma(ily);                               %sigma for each layer
            d = th(ily);
            if (ily==1)
                B = (perm*I/(4*pi*lambda));                  %Calculation for the B value for surface
            else
                B=B*((lambda*sig*Qarr(ir,flag,il)*sech(lambda*d))/((lambda*sig*Qarr(ir,flag,il))+tanh(lambda*d)));
            end     
            flag=flag-1;
        end
        mag(ir) = mag(ir) + (lambda * B * J1(il) / r(ir));      %sum up the magnetic field
    end
end
end