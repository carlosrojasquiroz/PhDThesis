function d = DataManagement(p,k)
%---------------------------------------------------------------------------------
% Time length
%---------------------------------------------------------------------------------
smpl = p.smplStart:calmonths(1):p.smplEnd;
smpl = smpl';
%---------------------------------------------------------------------------------
% Oil real price
%---------------------------------------------------------------------------------
oo = readtimetable('CountryData.xlsx','Sheet','PRICES');
oo.MONTH.Format = 'MMM-yyyy';
oo.WTIREAL = oo.WTI./oo.CPIUSA.*100;
%---------------------------------------------------------------------------------
% Financial risk rating for net oil exports
%---------------------------------------------------------------------------------
fr = readtimetable('CountryData.xlsx','Sheet','FRRICRGX');
N = size(fr,2);
T = size(fr,1);
%---------------------------------------------------------------------------------
% CDS 5Y for net oil exports
%---------------------------------------------------------------------------------
cds = readtimetable('CountryData.xlsx','Sheet','CDSX');
cds.MONTH.Format = 'MMM-yyyy';
CDS = stack(cds,p.codeX,'NewDataVariableName','CDS5Y');
CDS = sortrows(CDS,{'CDS5Y_Indicator','MONTH'},'ascend');
%---------------------------------------------------------------------------------
% Constructing dataset for net oil exports
%---------------------------------------------------------------------------------
Idx = [];
for jj=1:N
        Aux = jj*ones(T,1);
        Idx = [Idx; Aux];
end
SX = stack(fr,p.codeX,'NewDataVariableName','FRR');
SX.MONTH.Format = 'MMM-yyyy';
SX = sortrows(SX,{'FRR_Indicator','MONTH'},'ascend');
SX.NUM = Idx;
SX.WTI = repmat(oo.WTIREAL(smpl),N,1);
SX.VIX = repmat(oo.VIX(smpl),N,1);
SX.BAA = repmat(oo.BAA(smpl),N,1);
SX.CDS5Y = CDS.CDS5Y;
SX.SHOCK = repmat(k.shock.COMP(smpl),N,1);
% Middle-Income Oil Exporters
SX.MI = zeros(N*T,1);
for jj = 1:N*T
    for ll = 1:size(p.MI_X,2)
        if SX.FRR_Indicator(jj)==p.MI_X(ll)
            SX.MI(jj,1) =1;
        end
    end
end
% OPEC members 
SX.OPEC = zeros(N*T,1);
for jj = 1:N*T
    for ll = 1:size(p.OPEC,2)
        if SX.FRR_Indicator(jj)==p.OPEC(ll)
            SX.OPEC(jj,1) =1;
        end
    end
end
%---------------------------------------------------------------------------------
% Financial risk rating for net oil imports
%---------------------------------------------------------------------------------
fr = readtimetable('CountryData.xlsx','Sheet','FRRICRGM');
N = size(fr,2);
T = size(fr,1);
%---------------------------------------------------------------------------------
% CDS 5Y for net oil exports
%---------------------------------------------------------------------------------
cds = readtimetable('CountryData.xlsx','Sheet','CDSM');
cds.MONTH.Format = 'MMM-yyyy';
CDS = stack(cds,p.codeM,'NewDataVariableName','CDS5Y');
CDS = sortrows(CDS,{'CDS5Y_Indicator','MONTH'},'ascend');
%---------------------------------------------------------------------------------
% Constructing dataset for net oil imports
%---------------------------------------------------------------------------------
Idx = [];
for jj=1:N
        Aux = jj*ones(T,1);
        Idx = [Idx; Aux];
end
SM = stack(fr,p.codeM,'NewDataVariableName','FRR');
SM.MONTH.Format = 'MMM-yyyy';
SM = sortrows(SM,{'FRR_Indicator','MONTH'},'ascend');
SM.NUM = Idx;
SM.WTI = repmat(oo.WTIREAL(smpl),N,1);
SM.VIX = repmat(oo.VIX(smpl),N,1);
SM.BAA = repmat(oo.BAA(smpl),N,1);
SM.CDS5Y = CDS.CDS5Y;
SM.SHOCK = repmat(k.shock.COMP(smpl),N,1);
% Middle-Income Oil Exporters
SM.MI = zeros(N*T,1);
for jj = 1:N*T
    for ll = 1:size(p.MI_M,2)
        if SM.FRR_Indicator(jj)==p.MI_M(ll)
            SM.MI(jj,1) =1;
        end
    end
end
%---------------------------------------------------------------------------------
% Outcome
%---------------------------------------------------------------------------------
d.SX = SX;
writetimetable(SX,'Stata/Data/DataSetX.xlsx')
d.SM = SM;
writetimetable(SM,'Stata/Data/DataSetM.xlsx')
%---------------------------------------------------------------------------------