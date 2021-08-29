function YWLRDistributionAnalyser(file,OFname)
A=readtable(file);
subj_idx=table2array(A(:,{'subj_idx'}));
LT1=table2array(A(:,{'LT'}));
JP1=table2array(A(:,{'JP'}));
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
[N,~]=size(Idx);
SI=[];
TOTL=[];
TOTR=[];
YCL=[];
YCR=[];
YLP=[];
YRP=[];
ZScore=[];
pVal=[];
for k=1:N
    SI=[SI;k];
    Pcolor=COL(subj_idx==k);
    JPP=JP(subj_idx==k);
    Ccolor1=Pcolor(JPP=='L');
    Ccolor2=Pcolor(JPP=='R');
    ycNL=sum(Ccolor1=='Y');
    ycNR=sum(Ccolor2=='Y');
    [TNEL,~]=size(Ccolor1);
    TOTL=[TOTL;TNEL];
    [TNER,~]=size(Ccolor2);
    TOTR=[TOTR;TNER];
    YCL=[YCL;ycNL];
    YCR=[YCR;ycNR];
    YLP=[YLP;ycNL/TNEL];
    YRP=[YRP;ycNR/TNER];
    [Zs,Mu,STD]=PropZScore(ycNL,TNEL,ycNR,TNER);
    ZScore=[ZScore;Zs];
    pv=normcdf(Zs,0,1);
    
    if pv>0.5
          pv=2*(1-pv);
    else
          pv=2*pv;
    end
    pVal=[pVal;pv];
end
Total=table(SI,TOTL,TOTR,YCL,YCR,YLP,YRP,ZScore,pVal);
Total.Properties.VariableNames={'subj_idx','Total_Left_Trials','Total_Right_Trials','Num_Yellow_Left','Num_Yellow_Right','Prop_Yellow_Left','Prop_Yellow_Right','Z-Score','pValue'};
writetable(Total,OFname)
end