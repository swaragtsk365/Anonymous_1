function Yellow_White_RT_egFit(data)
% Data is everything including 50-50(Y3) trials
A=readtable(data);
subj_idx=table2array(A(:,{'subj_idx'}));
RT=table2array(A(:,{'RT'}));
JP1=table2array(A(:,{'JP'}));
LT1=table2array(A(:,{'LT'}));
[NM,~]=size(LT1);
LT=[];
JP=[];
COL=[];

for l=1:NM
    lte=LT1(l,1);
    jpe=JP1(l,1);
    LT=[LT;lte{1}];
    JP=[JP;jpe{1}];
    if (lte{1}=='Y' && jpe{1}=='L') || (lte{1}=='W' && jpe{1}=='R')
        COL=[COL;'Y'];
    elseif (lte{1}=='Y' && jpe{1}=='R') || (lte{1}=='W' && jpe{1}=='L')
        COL=[COL;'W'];
    end
end
Idx=unique(subj_idx);
[N1,~]=size(Idx);
SI=[];
SSY=[];
SSW=[];
MUY=[];
MUW=[];
SEMY=[];
SEMW=[];
ZScore=[];
pValue=[];
for k1=1:N1
    SI=[SI;k1];
    RTS=RT(subj_idx==k1);
    COLS=COL(subj_idx==k1);
    RTSY=RTS(COLS=='Y');
    RTSW=RTS(COLS=='W');
    [NY,~]=size(RTSY);
    SSY=[SSY;NY];
    [NW,~]=size(RTSW);
    SSW=[SSW;NW];
    RY=egfit(RTSY);
    RW=egfit(RTSW);
    MuY= RY(1,1);
    MUY=[MUY;MuY];
    SigmaY= RY(1,2);
    TauY=RY(1,3);
    MeanY=MuY+TauY;
    VarY=((SigmaY*SigmaY)+(TauY*TauY))/NY;
    SEMY=[SEMY;sqrt(VarY)];
    MuW= RW(1,1);
    MUW=[MUW;MuW];
    SigmaW= RW(1,2);
    TauW=RW(1,3);
    MeanW=MuW+TauW;
    VarW=((SigmaW*SigmaW)+(TauW*TauW))/NW;
    SEMW=[SEMW;sqrt(VarW)];
    Numer=MuY-MuW;
    Denom=sqrt(VarY+VarW);
    Zs=Numer/Denom;
    ZScore=[ZScore;Zs];
    pv=normcdf(Zs,0,1);
    if pv>=0.5
        pv=2*(1-pv);
    elseif pv<0.5
        pv=2*pv;
    end
    pValue=[pValue;pv];
end
Total=table(SI,SSY,SSW,MUY,MUW,SEMY,SEMW,ZScore,pValue);
Total.Properties.VariableNames={'subj_idx','Sample_Size(Y)','Sample_Size(W)','MeanRT(Y)','MeanRT(W)','SEM(Y)','SEM(W)','Z Score','pValue'};
writetable(Total,'Yellow_White_RT_Comparison_summary_50-50incl.csv')
end