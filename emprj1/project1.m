
%J0 Hankel Transform routine for GPGN420/520
%Andrei Swidinsky, Feb 2014.
clc;
clear;
format short;
load('FilterCoefficients.mat');

I=200;
rs=[300,200,100];
th=[300,200];
offset=[5,10,15,20,25,30,40];
q=zeros(length(offset),length(th));
l=0;
for r=1:length(offset)
    for n=1:length(th)
        for h=1:N_J0
            l=(root_J0)^(h-N0_J0)/offset(r);
            l=l+l;
        end
        if n==1
            q(r,n)=(1/(rs(1)*l));
        else
            q(r,n)=q(r,n)+(1/(l*rs(n)))*(q(r,n-1)*l*rs(n)+tanh(l*th(n)))/(q(r,n-1)*l*rs(n)*tanh(l*th(n))+1);
        end
    end
end 

V=zeros(length(offset),1);

for r=1:length(offset)
    for h=1:N_J0
        l=(root_J0)^(h-N0_J0)/offset(r);
        V(r)=V(r)+(I/(2*pi))*l*q(r,end)/offset(r);
    end
    qapp=(V/I)*2*pi*offset(r);
end
disp(qapp)


    
            