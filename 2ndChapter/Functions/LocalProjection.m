function LocalProjection(p)
oX = readtable('ResultsX_LEVEL.xls');
oM = readtable('ResultsM_LEVEL.xls');
%---------------------------------------------------------------------------------
% Impulse Response for net exporters
%---------------------------------------------------------------------------------
time = (1:p.horizon)';
if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b_ls(1:p.horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
grid on;
box on;
ylabel('Percent')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u_ls(1);...
            oX.d_ls(1:p.horizon,1); flipud([oX.u_ls(1:p.horizon,1);...
            oX.d_ls(p.horizon,1)])],p.myblue);
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5)
xlim([1 36])
if p.saveFigs
    saveas(gcf,'Figures\BaselineLP','epsc2')
end

if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b_ls(1:p.horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oM.b_ls(1:p.horizon,1),'Color',p.mygreen,'LineWidth',3.5)
grid on;
box on;
ylabel('Percent')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u_ls(1);...
            oX.d_ls(1:p.horizon,1); flipud([oX.u_ls(1:p.horizon,1);...
            oX.d_ls(p.horizon,1)])],p.myblue);
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oM.u_ls(1);...
            oM.d_ls(1:p.horizon,1); flipud([oM.u_ls(1:p.horizon,1);...
            oM.d_ls(p.horizon,1)])],p.mygreen);
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5)
xlim([1 36])
if p.saveFigs
    saveas(gcf,'Figures\WIMPLP','epsc2')
end

if p.showFigs
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23);
else
    figure('Position',[100 100 1000 600],'PaperPositionMode','Auto','DefaultAxesFontSize',23,...
        'visible','off');
end
plot(time,oX.b3_ls(1:p.horizon,1),'Color',p.myblue,'LineWidth',3.5)
hold on
plot(time,oM.b3_ls(1:p.horizon,1),'Color',p.mygreen,'LineWidth',3.5)
grid on;
box on;
ylabel('Percent')
xlabel('Months')
hh=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oX.u3_ls(1);...
            oX.d3_ls(1:p.horizon,1); flipud([oX.u3_ls(1:p.horizon,1);...
            oX.d3_ls(p.horizon,1)])],p.myblue);
hi=fill([time(1); time(1:end); flipud([time(1:end); time(end)])],[oM.u3_ls(1);...
            oM.d3_ls(1:p.horizon,1); flipud([oM.u3_ls(1:p.horizon,1);...
            oM.d3_ls(p.horizon,1)])],p.mygreen);
set(hh,'facealpha',.2);
set(hh,'edgecolor','none');
set(hi,'facealpha',.2);
set(hi,'edgecolor','none');
line(get(gca,'xlim'),[0 0],'Color','k','LineWidth',2.5)
xlim([1 36])
if p.saveFigs
    saveas(gcf,'Figures\WMICLP','epsc2')
end