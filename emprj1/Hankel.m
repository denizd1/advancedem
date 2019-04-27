

%J0 Hankel Transform routine for GPGN420/520
%Andrei Swidinsky, Feb 2014.

clc;
clear;
format long e;

%Values for example
r=100;
z=100;

%Load up the coefficients of the transform.  There are other 
%Useful things here besides just a J0 Hankel Transform.

        load('FilterCoefficients.mat');
        
%Loop over range of lambda values

        for h=1:N_J0;
            
%Calculate each lambda value            
        
            l=(root_J0)^(h-N0_J0)/r;
            
%Kernel expression goes here.  This is just an example            
            
            Kernel(h) = exp(-l*z);
            
        end;
            
%Sum over integral, weighted by coefficients.           
            
            Answer_Numerical=sum(J0.*Kernel'/r)
            
            Answer_Analytical=1/sqrt(r^2+z^2)            