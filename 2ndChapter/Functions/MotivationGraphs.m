clc;clear;close all;
%---------------------------------------------------------------------------------
%% Data management
%---------------------------------------------------------------------------------
addpath(genpath('Auxfiles')); addpath(genpath('Data')); addpath(genpath('Functions')); 
oo = readtimetable('DataBaseV2.xlsx','Sheet','MOTIVATION');
oo.MONTH.Format = 'MMM-yyyy';
oo.AUXREALPRICE = oo.AUXPRICE./oo.CPIUSA*100;
oo.COCREALPRICE = oo.COCPRICE./oo.CPIUSA*100;
oo.CUREALPRICE = oo.CUPRICE./oo.CPIUSA*100;
oo.OILREALPRICE = oo.OILPRICE./oo.CPIUSA*100;
%---------------------------------------------------------------------------------
% Customized colors
%---------------------------------------------------------------------------------
myblue=[16,52,166]/255; %[0, 114, 198]
myred=[234, 84, 85]/255;
myorange=[240, 123, 63]/255;
myyellow=[255, 212, 96]/255;
mygreen=[67, 124, 23]/255;
%---------------------------------------------------------------------------------
%% Zambia
%---------------------------------------------------------------------------------
SmplStart = datetime(2017,1,1);
SmplEnd = datetime(2023,8,31); 
Smpl = SmplStart: calmonths(1): SmplEnd;
Smpl.Format = 'MMM-yyyy';
%---------------------------------------------------------------------------------
% Default events
%---------------------------------------------------------------------------------
% November 2020
Def1Start = datetime(2020,10,1);
Def1End = datetime(2020,12,1);
Def1StartIdx = find(oo.MONTH == Def1Start);
Def1EndIdx = find(oo.MONTH == Def1End);
%---------------------------------------------------------------------------------
% Figure (1)
%---------------------------------------------------------------------------------
figure(1);
box on; grid on;
xlabel('Year','FontSize',18)
yyaxis left
ax = gca; ax.YColor = myblue; 
patch([oo.MONTH(Def1StartIdx), oo.MONTH(Def1EndIdx), oo.MONTH(Def1EndIdx), ...
    oo.MONTH(Def1StartIdx)], [0, 0, 250, 250], 'black', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
ylim([80 180])
hold on;
arrowStart = [0.6, 0.6];
arrowEnd = [0.725, 0.5];
% annotation('arrow', [arrowStart(1), arrowEnd(1)], [arrowStart(2), arrowEnd(2)], 'Color', 'black', ...
%     'LineWidth', 3.5);
plot(Smpl,oo.CUREALPRICE(Smpl),'Color',myblue,'LineWidth',3.5);
ylabel('Copper real price','FontSize',18)
yyaxis right
ax = gca; ax.YColor = mygreen; 
plot(Smpl,oo.SPR10YZAM(Smpl),'Color',mygreen,'LineWidth',3.5);
ylabel('Spread - 10Y Gov Bonds','FontSize',18)
ax = gca;
ax.FontSize = 18;
%title('Zambia','FontSize',22)
saveas(gcf,'Figures\ZambiaMov','epsc2')
%---------------------------------------------------------------------------------
%% Ecuador
%---------------------------------------------------------------------------------
SmplStart = datetime(2017,1,1);
SmplEnd = datetime(2023,8,31); 
Smpl = SmplStart: calmonths(1): SmplEnd;
Smpl.Format = 'MMM-yyyy';
%---------------------------------------------------------------------------------
% Default events
%---------------------------------------------------------------------------------
% December 2008
Def2Start = datetime(2008,11,1);
Def2End = datetime(2009,1,1);
Def2StartIdx = find(oo.MONTH == Def2Start);
Def2EndIdx = find(oo.MONTH == Def2End);
% April 2020
Def3Start = datetime(2020,3,1);
Def3End = datetime(2020,5,1);
Def3StartIdx = find(oo.MONTH == Def3Start);
Def3EndIdx = find(oo.MONTH == Def3End);
%---------------------------------------------------------------------------------
% Figure (2)
%---------------------------------------------------------------------------------
figure(2);
box on; grid on;
xlabel('Year','FontSize',18)
yyaxis left
ax = gca; ax.YColor = myblue; 
%patch([oo.MONTH(Def2StartIdx), oo.MONTH(Def2EndIdx), oo.MONTH(Def2EndIdx), ...
%oo.MONTH(Def2StartIdx)], [0, 0, 70, 70], 'black', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
hold on;
arrowStart = [0.5, 0.65];
arrowEnd = [0.70, 0.435];
% annotation('arrow', [arrowStart(1), arrowEnd(1)], [arrowStart(2), arrowEnd(2)], 'Color', 'black', ...
%     'LineWidth', 3.5);
patch([oo.MONTH(Def3StartIdx), oo.MONTH(Def3EndIdx), oo.MONTH(Def3EndIdx), ...
oo.MONTH(Def3StartIdx)], [0, 0, 70, 70], 'black', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
ylim([0 40])
plot(Smpl,oo.OILREALPRICE(Smpl),'Color',myblue,'LineWidth',3.5);
hold off;
ylabel('Oil real price','FontSize',18)
yyaxis right
ax = gca; ax.YColor = mygreen; 
plot(Smpl,oo.EMBIECU(Smpl),'Color',mygreen,'LineWidth',3.5);
ylabel('EMBI+','FontSize',18)
ax = gca;
ax.FontSize = 18;
%title('Ecuador','FontSize',22)
saveas(gcf,'Figures\EcuadorMov','epsc2')
%---------------------------------------------------------------------------------
%% Venezuela
%---------------------------------------------------------------------------------
SmplStart = datetime(2013,1,1);
SmplEnd = datetime(2019,5,31); 
Smpl = SmplStart: calmonths(1): SmplEnd;
Smpl.Format = 'MMM-yyyy';
%---------------------------------------------------------------------------------
% Default events
%---------------------------------------------------------------------------------
% November 2017
Def4Start = datetime(2017,10,1);
Def4End = datetime(2017,12,1);
Def4StartIdx = find(oo.MONTH == Def4Start);
Def4EndIdx = find(oo.MONTH == Def4End);
%---------------------------------------------------------------------------------
% Figure (3)
%---------------------------------------------------------------------------------
figure(3);
box on; grid on;
xlabel('Year','FontSize',18)
yyaxis left
ax = gca; ax.YColor = myblue; 
patch([oo.MONTH(Def4StartIdx), oo.MONTH(Def4EndIdx), oo.MONTH(Def4EndIdx), ...
    oo.MONTH(Def4StartIdx)], [0, 0, 250, 250], 'black', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
hold on;
arrowStart = [0.62, 0.65];
arrowEnd = [0.75, 0.425];
% annotation('arrow', [arrowStart(1), arrowEnd(1)], [arrowStart(2), arrowEnd(2)], 'Color', 'black', ...
%     'LineWidth', 3.5);
plot(Smpl,oo.OILREALPRICE(Smpl),'Color',myblue,'LineWidth',3.5);
ylabel('Oil real price','FontSize',18)
ylim([10 50])
yyaxis right
ax = gca; ax.YColor = mygreen; 
plot(Smpl,oo.EMBIVEN(Smpl),'Color',mygreen,'LineWidth',3.5);
ylabel('EMBI+','FontSize',18)
ax = gca;
ax.FontSize = 18;
%title('Venezuela','FontSize',22)
saveas(gcf,'Figures\VenezuelaMov','epsc2')
%---------------------------------------------------------------------------------
%% Ghana
%---------------------------------------------------------------------------------
SmplStart = datetime(2017,1,1);
SmplEnd = datetime(2023,3,31); 
Smpl = SmplStart: calmonths(1): SmplEnd;
Smpl.Format = 'MMM-yyyy';
%---------------------------------------------------------------------------------
% Default events
%---------------------------------------------------------------------------------
% November 2022
Def5Start = datetime(2022,10,1);
Def5End = datetime(2022,12,1);
Def5StartIdx = find(oo.MONTH == Def5Start);
Def5EndIdx = find(oo.MONTH == Def5End);
%---------------------------------------------------------------------------------
% Figure (4)
%---------------------------------------------------------------------------------
figure(4);
box on; grid on;
xlabel('Year','FontSize',18)
yyaxis left
ax = gca; ax.YColor = myblue; 
patch([oo.MONTH(Def5StartIdx), oo.MONTH(Def5EndIdx), oo.MONTH(Def5EndIdx), ...
    oo.MONTH(Def5StartIdx)], [0, 0, 850, 850], 'black', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
hold on;
arrowStart = [0.55, 0.65];
arrowEnd = [0.825, 0.425];
% annotation('arrow', [arrowStart(1), arrowEnd(1)], [arrowStart(2), arrowEnd(2)], 'Color', 'black', ...
%     'LineWidth', 3.5);
plot(Smpl,oo.AUXREALPRICE(Smpl),'Color',myblue,'LineWidth',3.5);
ylabel('Gold real price','FontSize',18)
ylim([450 800])
yyaxis right
ax = gca; ax.YColor = mygreen; 
plot(Smpl,oo.EMBIGHA(Smpl),'Color',mygreen,'LineWidth',3.5);
ylabel('EMBI+','FontSize',18)
ax = gca;
ax.FontSize = 18;
%title('Ghana','FontSize',22)
saveas(gcf,'Figures\GhanaMov','epsc2')