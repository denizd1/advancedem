
%Laplace transform routine for GPGN420 Lab 4
%Andrei Swidinsky, Apr 2015.

clc;
clear;
format long e;

%Value for example
t=100;

%Load up the coefficients of the transform. .

        load('FilterCoefficients.mat');
        
%Loop over range of s values

        for neww=1:length(Dgs);
            
%Calculate each s value            
        
            s=neww*((log(2))/t);
            
%Frequency domain expression goes here.  This is just an example            
            
            FrequencyDomainResponse(neww) = 1/sqrt(s);
            
        end;
        
%Sum over integral, weighted by coefficients.           
            
            Answer_Numerical=sum(FrequencyDomainResponse.*Dgs')*((log(2))/t);
            
            Answer_Analytical=1/sqrt(pi*t);
            