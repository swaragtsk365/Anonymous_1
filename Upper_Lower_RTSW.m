function Upper_Lower_RTSW()
Data=readtable('RTFilteredPlaceboSampleData2Categorywithout5050trials.csv');
response=table2array(Data(:,{'response'}));
RT=table2array(Data(:,{'RT'}));
SIDX=table2array(Data(:,{'subj_idx'}));
for k=1:15
    RT2=RT(SIDX==k);
    R2=response(SIDX==k);
    RT_Correct=sort(RT2(R2==1));
    RT_Wrong=sort(RT2(R2==0));
    R_right=egfit(RT_Correct);
    R_wrong=egfit(RT_Wrong);
    PDF_right=exgausspdf(R_right(1),R_right(2),R_right(3),RT_Correct);
    PDF_wrong=exgausspdf(R_wrong(1),R_wrong(2),R_wrong(3),RT_Wrong);
    figure
    title('Sbject'+string(k))
    plot(RT_Correct,PDF_right,'Color','r')
    hold on
    plot(RT_Wrong,PDF_wrong,'Color','b')
end
end