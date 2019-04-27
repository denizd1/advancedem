function [V1] = DoHankel(s,I,sigma,th,a)
load('FilterCoefficients.mat');
mu=mu0;
V1=[];
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
    V1(il)=((Qa*Q)/(Qa+Q))*lambda^2*J1(il)*a;
end
end