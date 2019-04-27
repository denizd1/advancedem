clear all;
clc;
figure(1);
close(1);
disp('====================================');
disp('1D MAGNETOTELLURIC MODELLING PROGRAM');
disp('====================================');
disp('    LAST UPDATED 29TH DECEMBER 2013 ');
disp('    DEVELOPED BY ANDREW PETHICK     ');
disp('      WWW.DIGITIALEARTHLAB.COM      ');
disp('====================================');
disp('');
disp('        licensed under WTFPL') 
disp('');
data = load('data.txt');
dataFrequencies = data(:,1);
dataApparentResistivities = data(:,2);
dataError = data(:,3);

%data taken from telford
resistivities = [300 2500 0.8 3000 2500];
thicknesses = [200 400 40 500];

dataModelledApparentResistivities = zeros(length(dataApparentResistivities),1);
for i = 1 : length(dataFrequencies)
    frequency = dataFrequencies(i);
    [apparentResistivity] = modelMT(resistivities, thicknesses, frequency);
    dataModelledApparentResistivities(i) = apparentResistivity;
end


%Calculate Misfit
misfit = zeros(length(dataApparentResistivities),1);
for i = 1 : length(dataFrequencies)
    d = dataApparentResistivities(i);
    m = dataModelledApparentResistivities(i);
    e = dataError(i);
    misfit(i) = ((m - e)^2)/((d*e/10))^2;
end

%Create array of frequencies from 10^-4 to 10^4Hz
%i.e. frequencies = 10^n, where n = -4,-3.9,-3.8....4
logFrequencies = -4:0.1:4; 
frequencies = 10.^logFrequencies;




apparentResistivities = zeros(length(frequencies),1);
for i = 1 : length(frequencies)
    frequency = frequencies(i);
    [apparentResistivity] = modelMT(resistivities, thicknesses, frequency);
    apparentResistivities(i) = apparentResistivity;
end

earthModelText = repmat(cellstr(''), length(resistivities + 2),1);
earthModelText{1} = ['Misfit = '  num2str(sum(misfit)) '%'];
earthModelText{2} = ['Layer       ' ' Resistivity       ' ' Thickness'];
for i = 1 : length(resistivities)
    resistivity = resistivities(i);
    mainText = ['Layer ' num2str(i) '     '  num2str(resistivity) ' Ohm m     '];
   earthModelText{i + 2} = mainText;
   if(i == length(resistivities)) 
       earthModelText{i+2} = [earthModelText{i+2} 'Halfspace'];
   else
       earthModelText{i+2} = [earthModelText{i+2} num2str(thicknesses(i)) 'm'];
   end
end

%Plot for each resistivity
scrsz = get(0,'ScreenSize');
figure(1)
set(1,'Position',[50 50 900 400]);
yy = spline(dataFrequencies,dataApparentResistivities,dataFrequencies);
subplot(1, 4, [1,3])
loglog(frequencies,apparentResistivities,'-r','LineWidth',2);
hold on
loglog(dataFrequencies,dataApparentResistivities,'-bs','LineWidth',1,'MarkerSize',3,'MarkerFaceColor','b');
loglog(dataFrequencies,dataModelledApparentResistivities,'rs','LineWidth',1,'MarkerSize',3,'MarkerFaceColor','r');
%set(get(AX(2),'Ylabel'),'String','Error (%)');
legend('Field Data','Modelled Data');
hold off
title({['Apparent Resistivity (Ohm m) vs Frequency(Hz)']});   
xlabel('Frequency (Hz)');
ylabel('Apparent Resistivity (Ohm m)');
subplot(1,4,4);



text(0,0.5,earthModelText);

axis off

xlabel('Frequency (Hz)');
ylabel('B-Field (T)');
                        

