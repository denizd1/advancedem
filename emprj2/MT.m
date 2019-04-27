%Magnetotelluric phase&app. resistivity function
%Function parameters are conductivity(sigma),depth of layers(th)
%and the frequency(freq)
%function returns apparent resistivity(rhoapp)
%and phase. sigma and th start from the last layer.
%first value of sigma and th are the conductivity and depth
%for the last layer.
function [rhoapp,phase] = MT(sigma,th,freq)
mu=4*pi*10^(-7);
for ir=1:length(freq)     %For each freq. 
    w = 2*pi*freq(ir);
    for ily=1:length(th)    %For each Layer
        sig = sigma(ily);
        d = th(ily);
        alpha=sqrt(sqrt(-1)*w*mu*sig);  %alpha to use in Z
        if (ily==1)
            Z = alpha/sig;      %last layer impedance
        else
            Z = (alpha/sig)*((tanh(alpha*d)+sig*Z/alpha)... 
                /(1+tanh(alpha*d)*sig*Z/alpha));    %Calc. impedance to surface
        end
        
    end
    rhoapp(ir)=(abs(Z)^2)/(w*mu);   %Apparent resistivity
    phase(ir)=atand(imag(Z)/real(Z));           %Phase
end
end