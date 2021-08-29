function LR_YWBiasComparison(LRFile,YWFile,OFname)
% Input results of LRBiasAnalyser and YWBiasAnalyser
A=readtable(LRFile);
B=readtable(YWFile);
subj_idx=table2array(B(:,{'subj_idx'}));
TOT=table2array(B(:,{'Total_trials'}));
NL=table2array(A(:,3));
NY=table2array(B(:,{'Num_Yellow'}));
PropL=NL./TOT;
PropY=NY./TOT;
[N,~]=size(TOT);
pVal=[];
for k=1:N
    P=PropL(k,1);
    pv=binocdf(NY(k,1),TOT(k,1),P);
    if pv>0.5
          pv=2*(1-pv);
    else
          pv=2*pv;
    end
    pVal=[pVal;pv];
end
Total=table(subj_idx, TOT,NL,NY,PropL,PropY, pVal);
Total.Properties.VariableNames={'subj_idx','Total_trials','Num_Left','Num_Yellow','Proportion_L','Proportion_Yellow','pValue'};
writetable(Total, OFname)

end