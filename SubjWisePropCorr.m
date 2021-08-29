function SubjWisePropCorr(file)
% Input should be RT filtered data from which Y3(50-50) trials are removed
A=readtable(file);
subj_idx=table2array(A(:,{'subj_idx'}));
Resp=table2array(A(:,{'response'}));
Idx=unique(subj_idx);
[N,~]=size(Idx);
SI=[];
TOT=[];
CT=[];
Prop=[];
for k=1:N
    SI=[SI;k];
    RS=Resp(subj_idx==k);
    [M1,~]=size(RS);
    Nc=sum(RS);
    TOT=[TOT;M1];
    CT=[CT;Nc];
    P=Nc/M1;
    Prop=[Prop;P];
    
end
Total=table(SI,TOT,CT,Prop);
Total.Properties.VariableNames={'subj_idx','Total_trials', 'Num_Correct_Response','Proportion_Correct'};
writetable(Total,'Subject_Wise_Correct_Responses.csv')
end