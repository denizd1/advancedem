% dc resistivity function
% parameters are
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness. array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
% function returns the apparent resistivity, potential, Qarray (use for MMR)
function [qapp,V,Qarray] = dcves(I,sigma,th,offset)
load('FilterCoefficients.mat');

r=offset;
qapp=zeros(1,length(offset));
V=zeros(1,length(offset));
curr=I/(2*pi);
Qarray=[];
for ir=1:length(offset)                                     %for loop for offsets
    for il=1:N_J0
        lambda=(root_J0)^(il-N0_J0)/offset(ir);
        for ily=1:length(th)                                %for loop for layers
            sig = sigma(ily);                               %sigma for each layer
            d = th(ily);
            if (ily==1)
                Q = (1/(sigma(1)*lambda));                  %Calculation for the Q value for Nth layer
            else
                Q = (1/(lambda*sig)) * ( (lambda * sig * Q + tanh(lambda*d)) ...    %Calculation for the Q value for layers
                    / (lambda * sig * Q * tanh(lambda*d) + 1) );
            end
        end
        
        V(ir) = V(ir) + curr*(lambda * Q * J0(il) / r(ir));      %sum up the potentials
    end
    Qarray(end+1)=Q;
    qapp(ir)=(V(ir)/I)*2*pi*r(ir); %apparent resistivity
end
end