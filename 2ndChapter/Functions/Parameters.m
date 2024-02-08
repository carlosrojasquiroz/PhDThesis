function p=Parameters()
%---------------------------------------------------------------------------------
rng default; % Set the random number generator to its default settings
set(groot,'defaultAxesTickLabelInterpreter','latex'); % Set the interpreter for tick labels to 'latex'
set(groot,'defaulttextinterpreter','latex'); % Set the interpreter for all text objects to 'latex'
set(groot,'defaultLegendInterpreter','latex'); % Set the interpreter for legend labels to 'latex'
%---------------------------------------------------------------------------------
% Local Projection sample 
%---------------------------------------------------------------------------------
p.smplStart = datetime(1984,1,1); 
p.smplEnd = datetime(2023,12,1);
%---------------------------------------------------------------------------------
% Instrument sample 
%---------------------------------------------------------------------------------
% Kanzig (2021)
p.smplStartSProxy = datetime(1983,1,1); 
p.smplEndSProxy = datetime(2023,12,1);
% Baumeister (2022)
p.smplStartEProxy = datetime(1986,1,1); 
p.smplEndEProxy = datetime(2023,3,1);
%---------------------------------------------------------------------------------
% Switches
%---------------------------------------------------------------------------------
p.showFigs = true; % Show figures
p.saveFigs = true; % Save figures
p.writeExcel = true; % Save data output in Excel
%---------------------------------------------------------------------------------
% Countries
%---------------------------------------------------------------------------------
p.codeX = {'ALB','DZA','AGO','AZE','BOL','BRA','BRN','CMR','CAN','COL','COG','ECU','EGY','GAB','GHA',...
    'IDN','IRN','IRQ','KAZ','KWT','LBY','MYS','MEX','NGA','NOR','OMN','PNG','QAT','RUS','SAU','SDN',...
    'SYR','TUN','ARE','VEN','VNM','YEM'};
p.codeM = {'AUS','AUT','BLR','BEL','BGR','CHL','CHN','CZE','FIN','FRA','DEU','GRC','HUN','IND','ISR',...
    'ITA','JPN','KOR','LTU','NLD','PAK','PHL','POL','PRT','ROM','SIN','SVK','ZAF','ESP','SWE','TWN','THA',...
    'TUR','UKR','GBR','USA','BHS','BHR','BGD','CRI','CIV','HRV','CUB','DOM','SLV','IRL','JAM','JOR','KEN',...
    'MAR','NZL','NIC','PER','SEN','SER','LKA','CHE','TTO','URY','ZMB'};
p.countryX = {'Albania','Algeria','Angola','Azerbaijan','Bolivia','Brazil','Brunei','Cameroon','Canada',...
    'Canada','Colombia','Congo','Ecuador','Egypt','Gabon','Ghana','Iran','Iraq','Kazakhstan','Kuwait',...
    'Libya','Malaysia','Mexico','Nigeria','Norway','Oman','Papua New Guinea','Qatar','Russia',...
    'Saudi Arabia','Sudan','Syria','Tunisia','United Arab Emirates','Venezuela','Vietnam','Yemen'};
p.countryM = {'Australia','Austria','Belarus','Belgium','Bulgaria','Chile','China','Czechia','Finland','France',...
    'Germany','Greece','Hungary','India ','Israel','Italy','Japan','Korea','Lithuania','Netherlands',...
    'Pakistand','Philipines','Poland','Portugal','Rumania','Singapore','Slovakia','South Africa','Spain','Sweden',...
    'Taiwan','Thailand','Turkey','Ukraine','United Kingdom','United States','Bahamas','Bahrein','Bangladesh','Costa Rica',...
    'Cote dIvoire','Croatia','Cuba','Dominican Republic','El Salvador','Ireland','Jamaica','Jordan','Kenya','Morocco',...
    'New Zealand','Nicaragua','Peru','Senegal','Serbia','Sri Lanka','Switzertland','Trinidad and Tobago','Uruguay','Zambia'};
%---------------------------------------------------------------------------------
% Country groups
%---------------------------------------------------------------------------------
% Middle-Income World Bank Classification
p.MI_X = {'ALB','DZA','AGO','AZE','BOL','BRA','CMR','COL','COG','ECU','EGY','GAB','GHA','IDN','IRN',...
    'IRQ','KAZ','LBY','MYS','MEX','NGA','PNG','RUS','TUN','VEN','VNM'};
p.MI_M = {'BLR','BGR','CHN','IND','PAK','PHL','ROM','ZAF','THA','TUR','UKR','BGD','CRI','CIV','CUB',...
    'DOM','SLV','JAM','JOR','KEN','MAR','NIC','PER','SEN','SER','LKA','ZMB'};
% OPEC members
p.OPEC = {'DZA','AGO','COG','ECU','GAB','IDN','IRN','IRQ','KWT','LBY','NGA','QAT','SAU','ARE','VEN'};
%---------------------------------------------------------------------------------
% LP specifications
%---------------------------------------------------------------------------------
p.contractMax = 13; % Maximum number of future oil contracts
p.horizonFRR = 36; % Horizon for IRFs
p.horizonCDS = 18; % Horizon for IRFs
p.signIRFs = 1; % Sign of the IRF from the Local Projection
%---------------------------------------------------------------------------------
% Customized colors
%---------------------------------------------------------------------------------
p.myred = [234, 84, 85]/255;
p.myblue = [16,52,166]/255;
p.myorange = [240, 123, 63]/255;
p.mygray = [200,200,200]/255;
p.myyellow = [255, 212, 96]/255;
p.mygreen = [147, 155, 98]/255;
%---------------------------------------------------------------------------------