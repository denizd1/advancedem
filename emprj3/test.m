clc;
clear;
format long e;
load('FilterCoefficients.mat');

I=2;
rs=[10];
sigma=1./rs;
th=[0];
b=10;
a=100;
mu=mu0;
V1=[];
t=100;

for neww=1:length(Dgs)
    s=neww*((log(2))/t);
    for il=1:N_J1
        lambda=(root_J1)^(il-N0_J1)/a;
        Qa=mu/lambda;
        for ily=1:length(th)
            sig = sigma(ily);
            k=sqrt(lambda^2+s*mu*sig);
            d = th(ily);
            if (ily==1)
                Q = (mu/k);
            else
                Q = (mu/k) * (( k*Q + mu*tanh(k*d)) ...
                    / (k*Q*tanh(k*d)+mu) );
            end
        end
        V1(il,neww)=((Qa*Q)/(Qa+Q))*lambda^2*J1(il)*a;
    end
    FrequencyDomainResponse(neww)=s*I*pi*a*b^2*sum(V1(:,neww));
end
sum(FrequencyDomainResponse.*Dgs')*((log(2))/t);