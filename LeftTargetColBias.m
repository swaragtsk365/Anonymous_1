function LeftTargetColBias(file)
% File should contain all trials including Y3 after RT filtering
A=readtable(file);
subj_idx=table2array(A(:,{'subj_idx'}));
LT1=table2array(A(:,{'LT'}));
[N,~]=size(LT1);
LT=[];
for k=1:N
    a=LT1(k,1);
    LT=[LT;a{1}];
end
Idx=unique(subj_idx);
[N1,~]=size(Idx);
SI=[];
TOT=[];
NY=[];
EP=[];
Prop=[];
pVal=[];
for k1=1:N1
    SI=[SI;k1];
    LTS=LT(subj_idx==k1);
    ID=LTS=='Y';
    [Num,~]=size(ID);
    nY=sum(ID);
    TOT=[TOT;Num];
    NY=[NY;nY];
    EP=[EP;0.5];
    Prop=[Prop;nY/Num];
    pv=binocdf(nY,Num,0.5);
    
    if pv>=0.5
        pv=2*(1-pv);
    elseif pv<0.5
        pv=2*pv;
    end
    pVal=[pVal;pv];
end
Total=table(SI,TOT,NY,EP,Prop,pVal);
Total.Properties.VariableNames={'subj_idx','Num_Total','Num_Yellow','Expect_Prop','Observer_Prop','pValue'};
writetable(Total,'LT_Color_Bias_Subject_Wise_5050incl.csv')
end