A = [];
for i=0:100
    app=0;
    for j=1:10
        app1=10*i*(0.5^j)/((i^2+(2*j*10)^2)^0.5);
        app=app+app1;
    end
    app=app+5;
    A(end+1)=app;
end
i=linspace(0,100,101);

figure
loglog(i,A)
xlabel('offset')
ylabel('apparent resistivity')
