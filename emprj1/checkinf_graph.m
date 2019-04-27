clc;
clear;
format long e;
% parameters are 
% I=current
% sigma=Conductivities. array from Nth layer(last layer Conductivity will be first)
% th=thickness array from Nth layer(last layer thickness will be first)
% offset=electrode distance array,offset values
I=0.1;
rs=[200,150];
sigma=1./rs;
th=[0,30];
offset=[5,10,15,20,25,30,40,50,100];
k=(rs(1)-rs(2))/(rs(1)+rs(2));
qapp_is=[];
% check aganist the infinite series solution
for i=1:length(offset)
    V_is=I*rs(2)/(2*pi)*((1/offset(i))+(2*k)/sqrt(offset(i)^2+(2*th(end))^2));
    qapp_is(i)=(V_is/I)*2*pi*offset(i);
end
[qapp,V] = dcves(I,sigma,th,offset);
hplot1=loglog(offset,qapp,'DisplayName', 'Recursion Relation'); 
hold on
hplot2=loglog(offset,qapp_is,'DisplayName', 'Infinite Series');
hold off
grid on;
legend([hplot1, hplot2],'Location','northwest')
xlabel('offset(m)')
ylabel('apparent resistivity (ohmm)')