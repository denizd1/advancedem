clc;
clear;
format bank;


I=2;
rs=[200,150];
th=[1000000,20];
offset=[5,10,15,20,25,30,40,50,100,150];

% question 1
[qapp] = dcves(I,rs,th,offset);
loglog(offset,(qapp)); grid on;
xlabel('offset(m)')
ylabel('apparent resistivity')

% question 2
% for p=1:10  
%     rs(1)=rs(1)+50;
%     [qapp] = dcves(I,rs,th,offset);
%     qa_q1=qapp/rs(2);
%     r_d=offset/th(2);
%     kk(p)=(rs(1)-rs(2))/(rs(1)+rs(2))
%     loglog(r_d,qa_q1);
%     xlabel('r/d')
%     ylabel('qa/q1')  
%     hold on;
% end
% hold off;



