function LRCACF(file) %Left Right Accuracy Comparison function
% Input should be the file in which 50:50 trials are removed
A=readtable(file);
subj_idx=table2array(A(:,{'subj_idx'}));
JP=table2array(A(:,{'JP'}));
response=table2array(A(:,{'response'}));
Idx=unique(subj_idx);
[N,~]=size(Idx);
JPCSA=[];
[NM,~]=size(JP);
for r=1:NM
    jpc=JP(r,1);
    JPCSA=[JPCSA;jpc{1}];
end
SI=[];
DC=[];
DCN=[];
CorrD=[];
SDCN=[];
CorrSD=[];
SDCP=[];
DCP=[];
pVal=[];
for k=1:N
    SI=[SI;k];
    JPS=JPCSA(subj_idx==k)
    RS=response(subj_idx==k);
    RSL=RS(JPS=='L');
    RSR=RS(JPS=='R');
    [N1,~]=size(RSL);
    [N2,~]=size(RSR);
    if N1>N2
        DC=[DC;'L'];
        DCN=[DCN;N1];
        SDCN=[SDCN;N2];
        dc= RSL; % Dominant choice
        sdc= RSR; % Sub Dominant choice
        dcN=N1;
        sdcN=N2;
    elseif N2>N1 
        DC=[DC;'R'];
        DCN=[DCN;N2];
        SDCN=[SDCN;N1];
        dc= RSR;
        sdc= RSL;
        dcN=N2;
        sdcN=N1;
    end
    Psdc=sum(sdc)/sdcN;
    CorrSD=[CorrSD;sum(sdc)];
    SDCP=[SDCP;Psdc];
    Pdc=sum(dc)/dcN;
    CorrD=[CorrD;sum(dc)];
    DCP=[DCP;Pdc];
    pv=binocdf(sum(dc),dcN,Psdc); % Comparing the dominant choice with sub dominant strategy
    if pv>0.5
         pv=2*(1-pv);
    else
         pv=2*pv;
    end
    pVal=[pVal;pv];
    
end
Total=table(SI,DC,DCN,CorrD,SDCN,CorrSD,DCP,SDCP,pVal);
Total.Properties.VariableNames={'subj_idx','Dominant_Choice','Number_of_Dominant_Choice','Num_CORR_Dominant','Number_of_Sub_Dominat_Choice','Num_CORR_Subdominant','Prportion_Correct_Dominant','Proportion_Correct_Subdominant','pValue'};
writetable(Total,'Left_Right_choice_accuracy_comparison_5050_excl.csv')
end