function LR_Col_Resp_Bias_Condition_Subject_Wise(File)
% input including 50-50 trials
A=readtable(File);
subj_idx=table2array(A(:,{'subj_idx'}));
Cat1=table2array(A(:,{'Cat1'}));
Cat2=table2array(A(:,{'Cat2'}));
Jp=table2array(A(:,{'JP'}));
[nn1,~]=size(subj_idx);
CAT1=[];
CAT2=[];
JP=[];
for k1=1:nn1
    cat1=Cat1(k1,1);
    cat2=Cat2(k1,1);
    jp=Jp(k1,1);
    CAT1=[CAT1;cat1{1}];
    CAT2=[CAT2;cat2{1}];
    JP=[JP;jp{1}];
    
end
CON=[CAT1 CAT2];
Idx=unique(subj_idx);
[N,~]=size(Idx);
SI=[];
SGN=[];
SBN=[];
OGN=[];
OBN=[];
SGL=[];
ExpSGL=[];
SBL=[];
ExpSBL=[];
OGL=[];
ExpOGL=[];
OBL=[];
ExpOBL=[];
Chi2Val=[];
DF=[];
pVal=[];
for k=1:N
    SI=[SI;k];
    CONS=CON(subj_idx==k);
    CAT1S=CAT1(subj_idx==k);
    CAT2S=CAT2(subj_idx==k);
    JPS=JP(subj_idx==k);
    JPSL=JPS=='L';
    NUMER=sum(JPSL);
    JPSG1=JPS(CAT1S=='S');
    CAT2SG=CAT2(CAT1S=='S');
    JPSG=JPSG1(CAT2SG=='G');
    
    JPSB1=JPS(CAT1S=='S');
    CAT2SB=CAT2(CAT1S=='S');
    JPSB=JPSB1(CAT2SB=='B');
    JPOG1=JPS(CAT1S=='O');
    CAT2OG=CAT2(CAT1S=='O');
    JPOG=JPOG1(CAT2OG=='G');
    JPOB1=JPS(CAT1S=='O');
    CAT2OB=CAT2(CAT1S=='O');
    JPOB=JPOB1(CAT2OB=='B');
    sgL=JPSG=='L';
    [NSG,~]=size(sgL);
    NLSG=sum(sgL);
    SGN=[SGN;NSG];
    SGL=[SGL;NLSG];
    
    sbL=JPSB=='L';
    [NSB,~]=size(sbL);
    NLSB=sum(sbL);
    SBN=[SBN;NSB];
    SBL=[SBL;NLSB];
    ogL=JPOG=='L';
    [NOG,~]=size(ogL);
    NLOG=sum(ogL);
    OGN=[OGN;NOG];
    OGL=[OGL;NLOG];
    obL=JPOB=='L';
    [NOB,~]=size(obL);
    NLOB=sum(obL);
    OBN=[OBN;NOB];
    OBL=[OBL;NLOB];
    CCC=(NSG+NSB+NOG+NOB);
    NA1=(NUMER*NSG)/CCC;
    ExpSGL=[ExpSGL;NA1];
    NA2=(NUMER*NSB)/CCC;
    ExpSBL=[ExpSBL;NA2];
    NA3=(NUMER*NOG)/CCC;
    ExpOGL=[ExpOGL;NA3];
    NA4=(NUMER*NOB)/CCC;
    ExpOBL=[ExpOBL;NA4];
    
    Exp=[NA1;NA2;NA3;NA4];
    Obs=[NLSG;NLSB;NLOG;NLOB];
    Num1=(Obs-Exp).*(Obs-Exp);
    Num2=Num1./Exp;
    CHI2=sum(Num2);
    Chi2Val=[Chi2Val;CHI2];
    DF=[DF;3];
    pv=chi2cdf(CHI2,3,"upper");
    pVal=[pVal;pv];
    ad=(NSG+NSB+NOG+NOB)
    
    
end
Total=table(SI,SGN,ExpSGL,SGL,SBN,ExpSBL,SBL,OGN,ExpOGL,OGL,OBN,ExpOBL,OBL,Chi2Val,DF,pVal);
Total.Properties.VariableNames={'subj_idx','Num_SG','Exp_SG(L)','Obs_SG(L)','Num_SB','Exp_SB(L)','Obs_SB(L)', 'Num_OG','Exp_OG(L)','Obs_OG(L)','Num_OB','Exp_OB(L)','Obs_ON(L)','Chi2','df','pValue'};
writetable(Total,'Equal_Choosing_Left_Different_Condition_Summary.csv')
end