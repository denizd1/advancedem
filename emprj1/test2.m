
%J0 Hankel Transform routine for GPGN420/520
%Andrei Swidinsky, Feb 2014.
clc;
clear;
format long e;
I=0.2;
rs=[100,20,30];
th=[100000000000,100,50];
load('FilterCoefficients.mat');
offset=[5,10,15,20,25,30,40];
q=zeros(length(offset));
lam=[]
l=0;
for r=1:length(offset)
    for h=1:N_J0
        l=l+(root_J0)^(h-N0_J0)/offset(r);
    end
    lam(end+1)=l
end
disp(lam)
for n=1:length(th)
        if n==1
            bot=(1/(rs(end)*l'));
        else
            bot=q(n);
        end
        q(n)=(1/(l*rs(n)))*(bot*l*rs(n)+tanh(l*th(n)))/(bot*l*rs(n)*tanh(l*th(n))+1);
end

% for r=1:length(offset)
%     for n=1:length(th)
%         for h=1:N_J0
%             l=(root_J0)^(h-N0_J0)/offset(r);
%             if n==1
%                 q(r,n)=q(r,n)+(1/(rs(1)*l));
%             else
%                 q(r,n)=q(r,n)+(1/(l*rs(n)))*(q(r,n-1)*l*rs(n)+tanh(l*th(n)))/(q(r,n-1)*l*rs(n)*tanh(l*th(n))+1);
%             end
%         end
%     end
% end 

V=zeros(length(offset),1);

for r=1:length(offset)
    for h=1:N_J0
        l=(root_J0)^(h-N0_J0)/offset(r);
        V(r)=V(r)+J0(h)*(I/(2*pi))*l*q(r,end);
    end
end
%  V=(I/(2*pi))*qn/sqrt(r^2+th(1)^2);


%     Q=0;
%     for a=length(th):-1:1
%         if a==length(lam)
%             qn=1/(rs(end)*lam');
%         else
%             qn=Q;
%         end
%        Q=Q+(1/(lam'*rs(a)))*(qn*lam'*rs(a)+tanh(lam'*th(a)))/(qn*lam'*rs(a)*tanh(lam'*th(a))+1);
%     end
    
%     for n=1:length(th)
%         for r=5:5:offset
%             V=(I/(2*pi))*Q/sqrt(r^2+th(n)^2);
%             apparent(end+1)=(V/I)*2*r;
%         end
%     end

    
            