clc;clear;close all;
addpath(genpath('Data')); addpath(genpath('Functions')); 
Data=readtimetable('DefaultCrises_DataBase.xlsx','Sheet','DataTimeTable');
Data.Year.Format = 'yyyy';

myblue=[16,52,166]/255;
myred=[234, 84, 85]/255;
myorange=[240, 123, 63]/255;
myyellow=[255, 212, 96]/255;
mygreen=[67, 124, 23]/255;

figure(1) 
b1=bar(Data.Year,Data.All);
b1.FaceColor=mygreen;
ax=gca;
ax.FontSize=16; 
xlabel('Year','FontSize',16)
ylabel('No. of countries in default','FontSize',16)
saveas(gcf,'Figures\Barchart01','epsc')

fig=figure(2);
set(fig,'defaultAxesColorOrder',[mygreen;myblue]);
hold on;
yyaxis left
b2=bar(Data.Year,Data.Metals);
b2.FaceColor=mygreen;
ylabel('No. of countries in default','FontSize',16)
yyaxis right
b3=plot(Data.Year,Data.Copper,'LineWidth',2.5,'Color',myblue);
ylabel('Real copper price','FontSize',16)
hold off;
ax=gca;
ax.FontSize=16;
xlabel('Year','FontSize',16)
saveas(gcf,'Figures\Barchart02','epsc')

fig=figure(3);
set(fig,'defaultAxesColorOrder',[mygreen;myblue]);
hold on;
yyaxis left
b2=bar(Data.Year,Data.Energy);
b2.FaceColor=mygreen;
ylabel('No. of countries in default','FontSize',16)
yyaxis right
b3=plot(Data.Year,Data.Oil,'LineWidth',2.5,'Color',myblue);
ylabel('Real oil price','FontSize',16)
hold off;
ax=gca;
ax.FontSize=16; 
xlabel('Year','FontSize',16)
saveas(gcf,'Figures\Barchart03','epsc')

fig=figure(4);
set(fig,'defaultAxesColorOrder',[mygreen;myblue]);
hold on;
yyaxis left
b2=bar(Data.Year,Data.Food);
b2.FaceColor=mygreen;
ylabel('No. of countries in default','FontSize',16)
yyaxis right
b3=plot(Data.Year,Data.Soybean,'LineWidth',2.5,'Color',myblue);
ylabel('Real soybean price','FontSize',16)
hold off;
ax=gca;
ax.FontSize=16; 
xlabel('Year','FontSize',16)
saveas(gcf,'Figures\Barchart04','epsc')