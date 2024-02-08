function LocalProjection(p)
close all;
oX = readtable('ResultsX_LEVEL.xlsx');
oM = readtable('ResultsM_LEVEL.xlsx');
%---------------------------------------------------------------------------------
% Impulse Response for net exporters
%---------------------------------------------------------------------------------
% Credit Default Swap (5Y)
%---------------------------------------------------------------------------------
horizon = p.horizonCDS;
time = (1:horizon)';
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
grid on;
box on;
ylabel('Basis Points')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u_ls(1);...
            oX.d_ls(1:horizon,1); flipud([oX.u_ls(1:horizon,1);...
            oX.d_ls(horizon,1)])],p.myblue);
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5)
xlim([1 18])
if p.saveFigs
    saveas(gcf,'Figures\X_BaselineLP_CDS','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oM.b_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('Oil Exporters','Oil Importers','Location','best','FontSize',25)
grid on;
box on;
ylabel('Basis Points')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u_ls(1);...
            oX.d_ls(1:horizon,1); flipud([oX.u_ls(1:horizon,1);...
            oX.d_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oM.u_ls(1);...
            oM.d_ls(1:horizon,1); flipud([oM.u_ls(1:horizon,1);...
            oM.d_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 18])
if p.saveFigs
    saveas(gcf,'Figures\XM_ComparisonLP_CDS','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oX.b2_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('All Sample','Non-OPEC Countries','Location','best','FontSize',25)
grid on;
box on;
ylabel('Basis Points')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u_ls(1);...
            oX.d_ls(1:horizon,1); flipud([oX.u_ls(1:horizon,1);...
            oX.d_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u2_ls(1);...
            oX.d2_ls(1:horizon,1); flipud([oX.u2_ls(1:horizon,1);...
            oX.d2_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 18])
if p.saveFigs
    saveas(gcf,'Figures\X_NonOPECComparisonLP_CDS','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oX.b3_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('All Sample','Middle-Income Countries','Location','best','FontSize',25)
grid on;
box on;
ylabel('Basis Points')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u_ls(1);...
            oX.d_ls(1:horizon,1); flipud([oX.u_ls(1:horizon,1);...
            oX.d_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u3_ls(1);...
            oX.d3_ls(1:horizon,1); flipud([oX.u3_ls(1:horizon,1);...
            oX.d3_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 18])
if p.saveFigs
    saveas(gcf,'Figures\X_MiddleIncomeComparisonLP_CDS','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oX.b4_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('Baseline','LP-IV','Location','best','FontSize',25)
grid on;
box on;
ylabel('Basis Points')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u_ls(1);...
            oX.d_ls(1:horizon,1); flipud([oX.u_ls(1:horizon,1);...
            oX.d_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u4_ls(1);...
            oX.d4_ls(1:horizon,1); flipud([oX.u4_ls(1:horizon,1);...
            oX.d4_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 18])
if p.saveFigs
    saveas(gcf,'Figures\X_NewsShockComparisonLP_CDS','epsc2')
end
%---------------------------------------------------------------------------------
% Financial Risk Rating
%---------------------------------------------------------------------------------
horizon = p.horizonFRR;
time = (1:horizon)';
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b5_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
grid on;
box on;
ylabel('Percent')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u5_ls(1);...
            oX.d5_ls(1:horizon,1); flipud([oX.u5_ls(1:horizon,1);...
            oX.d5_ls(horizon,1)])],p.myblue);
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5)
xlim([1 36])
if p.saveFigs
    saveas(gcf,'Figures\X_BaselineLP_FRR','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b5_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oM.b5_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('Oil Exporters','Oil Importers','Location','best','FontSize',25)
grid on;
box on;
ylabel('Percent')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u5_ls(1);...
            oX.d5_ls(1:horizon,1); flipud([oX.u5_ls(1:horizon,1);...
            oX.d5_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oM.u5_ls(1);...
            oM.d5_ls(1:horizon,1); flipud([oM.u5_ls(1:horizon,1);...
            oM.d5_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 36])
if p.saveFigs
    saveas(gcf,'Figures\XM_ComparisonLP_FRR','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b5_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oX.b6_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('All Sample','Non-OPEC Countries','Location','best','FontSize',25)
grid on;
box on;
ylabel('Percent')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u5_ls(1);...
            oX.d5_ls(1:horizon,1); flipud([oX.u5_ls(1:horizon,1);...
            oX.d5_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u6_ls(1);...
            oX.d6_ls(1:horizon,1); flipud([oX.u6_ls(1:horizon,1);...
            oX.d6_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 36])
if p.saveFigs
    saveas(gcf,'Figures\X_NonOPECComparisonLP_FRR','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b5_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oX.b7_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('All Sample','Middle-Income Countries','Location','best','FontSize',25)
grid on;
box on;
ylabel('Percent')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u5_ls(1);...
            oX.d5_ls(1:horizon,1); flipud([oX.u5_ls(1:horizon,1);...
            oX.d5_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u7_ls(1);...
            oX.d7_ls(1:horizon,1); flipud([oX.u7_ls(1:horizon,1);...
            oX.d7_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 36])
if p.saveFigs
    saveas(gcf,'Figures\X_MiddleIncomeComparisonLP_FRR','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b5_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oX.b8_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('Baseline','LP-IV','Location','best','FontSize',25)
grid on;
box on;
ylabel('Percent')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u5_ls(1);...
            oX.d5_ls(1:horizon,1); flipud([oX.u5_ls(1:horizon,1);...
            oX.d5_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u8_ls(1);...
            oX.d8_ls(1:horizon,1); flipud([oX.u8_ls(1:horizon,1);...
            oX.d8_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 36])
if p.saveFigs
    saveas(gcf,'Figures\X_NewsShockComparisonLP_FRR','epsc2')
end
%---------------------------------------------------------------------------------
% EMBI
%---------------------------------------------------------------------------------
horizon = p.horizonCDS;
time = (1:horizon)';
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b9_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oM.b9_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('Oil Exporters','Oil Importers','Location','best','FontSize',25)
grid on;
box on;
ylabel('Basis Points')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u9_ls(1);...
            oX.d9_ls(1:horizon,1); flipud([oX.u9_ls(1:horizon,1);...
            oX.d9_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oM.u9_ls(1);...
            oM.d9_ls(1:horizon,1); flipud([oM.u9_ls(1:horizon,1);...
            oM.d9_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 18])
if p.saveFigs
    saveas(gcf,'Figures\XM_ComparisonLP_EMBI','epsc2')
end
%---------------------------------------------------------------------------------
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b9_ls(1:horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oX.b10_ls(1:horizon,1),'Color',p.myred,'LineWidth',3.5)
legend('Baseline','LP-IV','Location','best','FontSize',25)
grid on;
box on;
ylabel('Basis Points')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u9_ls(1);...
            oX.d9_ls(1:horizon,1); flipud([oX.u9_ls(1:horizon,1);...
            oX.d9_ls(horizon,1)])],p.myblue,'HandleVisibility','off');
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u10_ls(1);...
            oX.d10_ls(1:horizon,1); flipud([oX.u10_ls(1:horizon,1);...
            oX.d10_ls(horizon,1)])],p.myred,'HandleVisibility','off');
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5,'HandleVisibility','off')
xlim([1 18])
if p.saveFigs
    saveas(gcf,'Figures\X_NewsShockComparisonLP_EMBI','epsc2')
end
%---------------------------------------------------------------------------------
%close all;