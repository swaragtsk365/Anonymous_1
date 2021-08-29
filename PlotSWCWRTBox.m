function PlotSWCWRTBox
for k=1:15
    Dl=readtable('RTFiltered_PlaceboSampleData2Categorywith5050trials'+string(k)+'_only.csv');
    RT=Dl.RT;
    RC=categorical(Dl.RC);
    RTSG=RT(RC=='R'); % SG trials
    RTSB=RT(RC=='B'); % SB trials
    RTOG=RT(RC=='M'); % OG Trials
    RTOB=RT(RC=='G'); % OB trials
    RSG=egfit(RTSG);
    RSB=egfit(RTSB);
    ROG=egfit(RTOG);
    ROB=egfit(RTOB);
    RT1=sort(RT);
    %RTL={RTSG, RTSB, RTOG, RTOB};
    h=figure
    boxplot(RTSG,{'SG'});
    hold on
    boxplot(RTSB,{'SB'});
    boxplot(RTOG,{'OG'});
    boxplot(RTOB,{'OB'});
    
    title("Condition Wise RT Distribution for Subject:"+string(k))
    set(gca,'XTickLabel',{'SG','SB','OG','OB'})
    ylabel('Response Time')
    saveas(h,'S'+string(k)+'BoxPlotCondWiseRT.png')
end
end