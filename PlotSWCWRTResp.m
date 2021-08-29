function PlotSWCWRTResp
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
    PSG=exgausspdf(RSG(1,1),RSG(1,2),RSG(1,3),RT1);
    PSB=exgausspdf(RSB(1,1),RSB(1,2),RSB(1,3),RT1);
    POG=exgausspdf(ROG(1,1),ROG(1,2),ROG(1,3),RT1);
    POB=exgausspdf(ROB(1,1),ROB(1,2),ROB(1,3),RT1);
    h=figure
    
    plot(RT1,PSG,'Color','r');
    hold on
    plot(RT1,PSB,'Color','B');
    plot(RT1,POG,'Color','M');
    plot(RT1,POB,'Color','G');
    title("Condition Wise Normalized RT Distribution for Subject:"+string(k))
    xlabel('Response Time')
    legend('SG','SB','OG','OB')
    saveas(h,'S'+string(k)+'CondWiseRT.png')
end
end