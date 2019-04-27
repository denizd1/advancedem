clc;
clear;
close all
format bank;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
I=2;
rs=[200,150];
sigma=1./rs;
th=[0,20];
offset=[5,10,15,20,25,30,40,50,100,150];

% question 1c
for p=1:10  
    [qapp] = dcves(I,sigma,th,offset);
    qa_q1=qapp/rs(2);
    r_d=offset/th(2);
    kk(p)=(rs(1)-rs(2))/(rs(1)+rs(2));
    Legend{p}=strcat('k= ', num2str(round(kk(p),2)));
    loglog(r_d,qa_q1,'linewidth',2);
    xticks([(0:5)])
    xlabel('r/d')
    ylabel('qa/q1')
    legend(Legend,'Location','northwest')
    hold on;
    rs(1)=rs(1)+100;
    sigma(1)=1/rs(1);
end
hold off;



