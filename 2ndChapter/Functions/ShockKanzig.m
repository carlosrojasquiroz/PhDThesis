function k=ShockKanzig(p)
%---------------------------------------------------------------------------------
% OPEC announcements database
%---------------------------------------------------------------------------------
opec = readtimetable('CountryData.xlsx','Sheet','OPECANNOUNCEMENTS'); 
%---------------------------------------------------------------------------------
% Variables about OPEC announcements
%---------------------------------------------------------------------------------
statementDates = opec.AnnouncementDay;
statementDates_tradingDays = opec.TradingDay;
%---------------------------------------------------------------------------------
% Oil futures prices
%---------------------------------------------------------------------------------
foil = readtimetable('CountryData.xlsx','Sheet','OILFUTURES'); 
%---------------------------------------------------------------------------------
% Oil price futures contracts (100log(x))
%---------------------------------------------------------------------------------
foil.Variables = 100*log(foil.Variables);
%---------------------------------------------------------------------------------
% Surprises (on selected trading days)
%---------------------------------------------------------------------------------
% First differences
deltaDay = diff(foil);
deltaDay.TIME = foil.TIME(2:end);
deltaDay = deltaDay(:,1:p.contractMax);
% Complete the matrix
for jj = 1:length(statementDates_tradingDays)
    oo(jj,:) = deltaDay(deltaDay.TIME == statementDates_tradingDays(jj,1),:);
end
oo.TIME = statementDates;
oo = fillmissing(oo,'constant',0);
%---------------------------------------------------------------------------------
% Principal component analysis
%---------------------------------------------------------------------------------
proxySel = table2array(oo(:,2:13));
[~,score,~,~,~] = pca(zscore(proxySel));
oilPC = score(:,1);
oilPC = oilPC./std(oilPC)*mean(std(proxySel));
% Collect PC
oilPCWTI = addvars(oo, oilPC,'NewVariableNames','COMP');
% Summing up surprises by month
oilProxyWTI = retime(oilPCWTI, 'monthly', 'sum');
% Dates
months = p.smplStartSProxy:calmonths(1):p.smplEndSProxy;
months.Format = 'MMM-yyyy';
months = months';
% Create a new timetable with extended dates
oilProxy = retime(oilProxyWTI, months, 'fillwithconstant');
%---------------------------------------------------------------------------------
% Proxy (instrumental) variable 
%---------------------------------------------------------------------------------
proxyRaw = [oilProxy(:,p.contractMax+1)]; 
%---------------------------------------------------------------------------------
% Figure
%---------------------------------------------------------------------------------
if p.showFigs
    figure('DefaultAxesFontSize',13);
else
    figure('DefaultAxesFontSize',13,'visible','off');
end    
hold on
TimeInterval=p.smplStartSProxy:calmonths(1):p.smplEndSProxy;
varEx=proxyRaw.COMP(TimeInterval);
bar(TimeInterval,varEx,2.5,'FaceColor',p.myred)
plot(proxyRaw.TIME(abs(proxyRaw.COMP)>7),proxyRaw.COMP(abs(proxyRaw.COMP)>7),'ko',...
    'LineWidth',2,'MarkerSize',5,'MarkerEdgeColor',p.mygray,'MarkerFaceColor',p.myblue)
varEx=proxyRaw(TimeInterval,"COMP");
TimePoints = {'Aug-1986','Nov-2001','Nov-2014','Nov-2016','Mar-2020','Jul-2021'};
TimePoints = datetime(TimePoints);
TimePoints.Format = 'MMM-yyyy';
plot(TimePoints,varEx.COMP(TimePoints),'ko')
ylim([-15 15]);
% OPEC agreement on new production quotas
text(proxyRaw.TIME('Aug-1986'),varEx.COMP(TimeInterval=='Aug-1986')+1,...
    '5 Aug 1986','fontsize',12)
% OPEC supply restriction that can potentially derived in a price war
text(proxyRaw.TIME('Nov-2001'),varEx.COMP(TimeInterval=='Nov-2001')-1,...
    '14 Nov 2001','fontsize',12)
% OPEC announcement on unchanged level production in the amidst of a weak global demand
text(proxyRaw.TIME('Nov-2014')-62,varEx.COMP(TimeInterval=='Nov-2014')-1,...
    '27 Nov 2014','fontsize',12)
% OPEC agreement on production cuts (also by non-OPEC members like Russia)
text(proxyRaw.TIME('Nov-2016'),varEx.COMP(TimeInterval=='Nov-2016')+1,...
    '30 Nov 2016','fontsize',12)
% % Further production adjustments by OPEC do not fit with extremely weak global demand
text(proxyRaw.TIME('Mar-2020'),varEx.COMP(TimeInterval=='Mar-2020')-1,...
    '5 Mar 2020','fontsize',12)
% Expected increase in oil supply by OPEC between Aug-Dec 2021 by 0.4 million bpd per month
text(proxyRaw.TIME('Jul-2021'),varEx.COMP(TimeInterval=='Jul-2021')-1,...
    '5/18 Jul 2021','fontsize',12)
ylabel('Revision in oil price expectations (\%)')
line(get(gca,'xlim'),[0 0],'Color','k')
grid on
box on
if p.saveFigs
    saveas(gcf,'Figures\Kanzig_Proxy','epsc2')
end
%---------------------------------------------------------------------------------
% Output
%---------------------------------------------------------------------------------
proxyRaw.Properties.DimensionNames{1}='MONTH';
k.shock= proxyRaw;
%---------------------------------------------------------------------------------