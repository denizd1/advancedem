%calculation for different arrays
%arraytype= 1=pole pole, 2=wenner, 3=dipole dipole, 4=schlumberger

function[deltaV,qapp]=ArrayCalc(arraytype,I,sigma,th,offset)
if(arraytype==1)  %for pole pole
    [qapp,V] = dcves(I,sigma,th,offset);
    deltaV=V;
    qapp=qapp;
elseif(arraytype==2) %for wenner
    [~,V] = dcves(I,sigma,th,offset);
    v_am=V;
    v_bn=V;
    offset=offset*2;
    [~,V] = dcves(I,sigma,th,offset);
    v_an=V;
    v_bm=V;
    deltaV=v_am-v_an-v_bm+v_bn;
    offset=offset/2;
    qapp=(deltaV/I)*2*pi.*offset;
elseif(arraytype==3)  %for dipole dipole
    n=2;
    offsetd1=n.*offset;
    [~,V] = dcves(I,sigma,th,offsetd1);
    v_am=V;
    offsetd2=offsetd1+offset;
    [~,V] = dcves(I,sigma,th,offsetd2);
    v_an=V;
    offsetd3=offsetd1+offset;
    [~,V] = dcves(I,sigma,th,offsetd3);
    v_bm=V;
    offsetd4=offsetd1+2*offset;
    [~,V] = dcves(I,sigma,th,offsetd4);
    v_bn=V;
    deltaV=v_am-v_bm-v_an+v_bn;
    qapp=(deltaV/I)*pi.*offset*n*(n+1)*(n+2);
elseif(arraytype==4)   %for schlumberger
    n=2;
    offset1=offset*n;
    [~,V] = dcves(I,sigma,th,offset1);
    v_am=V;
    [~,V] = dcves(I,sigma,th,offset+offset1);
    v_an=V;
    [~,V] = dcves(I,sigma,th,offset+offset1);
    v_bm=V;
    [~,V] = dcves(I,sigma,th,offset1);
    v_bn=V;
    deltaV=v_am-v_bm-v_an+v_bn;
    qapp=(deltaV/I)*pi.*offset.*(n*(n+1));
end

end