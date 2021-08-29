function Left_Right_RT_egFit(data)
% Data is everything including 50-50(Y3) trials
A=readtable(data);
subj_idx=table2array(A(:,{'subj_idx'}));
RT=table2array(A(:,{'RT'}));
JP1=table2array(A(:,{'JP'}));
[N,~]=size(JP1);
JP=[];
for k=1:N
    a=JP1(k,1);
    JP=[JP;a{1}];
end
Idx=unique(subj_idx);
[N1,~]=size(Idx);
SI=[];
SSL=[];
SSR=[];
MUL=[];
MUR=[];
SEML=[];
SEMR=[];
ZScore=[];
pValue=[];
for k1=1:N1
    SI=[SI;k1];
    RTS=RT(subj_idx==k1);
    JPS=JP(subj_idx==k1);
    RTSL=RTS(JPS=='L');
    RTSR=RTS(JPS=='R');
    [NL,~]=size(RTSL);
    SSL=[SSL;NL];
    [NR,~]=size(RTSR);
    SSR=[SSR;NR];
    RL=egfit(RTSL);
    RR=egfit(RTSR);
    MuL= RL(1,1);
    MUL=[MUL;MuL];
    SigmaL= RL(1,2);
    TauL=RL(1,3);
    MeanL=MuL+TauL;
    VarL=((SigmaL*SigmaL)+(TauL*TauL))/NL;
    SEML=[SEML;sqrt(VarL)];
    MuR= RR(1,1);
    MUR=[MUR;MuR];
    SigmaR= RR(1,2);
    TauR=RR(1,3);
    MeanR=MuR+TauR;
    VarR=((SigmaR*SigmaR)+(TauR*TauR))/NR;
    SEMR=[SEMR;sqrt(VarR)];
    Numer=MuL-MuR;
    Denom=sqrt(VarL+VarR);
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
Total=table(SI,SSL,SSR,MUL,MUR,SEML,SEMR,ZScore,pValue);
Total.Properties.VariableNames={'subj_idx','Sample_Size(Left)','Sample_Size(right)','MeanRT(Left)','MeanRT(Right)','SEM(Left)','SEM(Right)','Z Score','pValue'};
writetable(Total,'Left_Right_RT_Comparison_summary_50-50incl.csv')
end