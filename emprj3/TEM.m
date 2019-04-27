function [V,V1,FrequencyDomainResponse] = TEM(time,I,sigma,th,a,b)
load('FilterCoefficients.mat');
mu=mu0;
V1=[];
V=zeros(1,length(time));
for t=1:length(time)
    for neww=1:length(Dgs)
        s=neww*((log(2))/time(t));
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
            V1(il,neww)=((Qa*Q)/(Qa+Q))*lambda^2*J1(il);
        end
         FrequencyDomainResponse(neww)=I*pi*a*b^2*sum(V1(:,neww))/a;
    end
     V(t) = sum(FrequencyDomainResponse.*Dgs')*((log(2))/time(t));
end
end