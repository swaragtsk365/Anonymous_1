function YWBiasAnalyser(file,OFname)
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
TOT=[];
YC=[];
EP=[];
OP=[];
pVal=[];
for k=1:N
    SI=[SI;k];
    Pcolor=COL(subj_idx==k);
    [TNE,~]=size(Pcolor);
    ycN=sum(Pcolor=='Y');
    TOT=[TOT;TNE];
    YC=[YC;ycN];
    EP=[EP;0.5];
    OP=[OP;ycN/TNE];
    pv=binocdf(ycN,TNE,0.5);
    if pv>0.5
          pv=2*(1-pv);
    else
          pv=2*pv;
    end
    pVal=[pVal;pv];
end
Total=table(SI,TOT,YC,EP,OP,pVal);
Total.Properties.VariableNames={'subj_idx','Total_trials','Num_Yellow','Exp_Prop','Obs_Prop','pValue'};
writetable(Total,OFname)
end