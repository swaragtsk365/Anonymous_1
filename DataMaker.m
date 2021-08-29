function DataMaker()
    for k=1:15
        A=readtable('S'+string(k)+'.csv');
        B=table2array(A);
        SGT=rmmissing(B(:,1));
        SBT=rmmissing(B(:,2));
        OGT=rmmissing(B(:,3));
        OBT=rmmissing(B(:,4));
        RT=cell2mat(struct2cell(load('S'+string(k)+'.mat','cReactionTime_')));
        MagnitudeCue=cell2mat(struct2cell(load('S'+string(k)+'.mat','cMagCue_')));
        MagnitudeCue(:,1)=[];
        LeftTarget=cell2mat(struct2cell(load('S'+string(k)+'.mat','cLeftT_')));
        JoyPosition=cell2mat(struct2cell(load('S'+string(k)+'.mat','cJoyPosn_')));
        RewardCue=cell2mat(struct2cell(load('S'+string(k)+'.mat','cRwdCue_')));
        SGTrials=[];
        SBTrials=[];
        OGTrials=[];
        OBTrials=[];
        RTSG=RT(SGT',1);%Reaction times for each category
        RTSB=RT(SBT',1);
        RTOG=RT(OGT',1);
        RTOB=RT(OBT',1);
        MCSG=MagnitudeCue(SGT',1);%Magnitude cue for each category
        MCSB=MagnitudeCue(SBT',1);
        MCOG=MagnitudeCue(OGT',1);
        MCOB=MagnitudeCue(OBT',1);
        LTSG=LeftTarget(SGT',1);%Left target option
        LTSB=LeftTarget(SBT',1);
        LTOG=LeftTarget(OGT',1);
        LTOB=LeftTarget(OBT',1);
        JPSG=JoyPosition(SGT',1);%Joy Position, right or left
        JPSB=JoyPosition(SBT',1);
        JPOG=JoyPosition(OGT',1);
        JPOB=JoyPosition(OBT',1);
        RCSG=RewardCue(SGT',1);%Reward Cue
        RCSB=RewardCue(SBT',1);
        RCOG=RewardCue(OGT',1);
        RCOB=RewardCue(OBT',1);
        Ttl={'RT','MC','LT','JP'};
        SGTrials=table(RTSG,MCSG,LTSG,JPSG);
        SGTrials.Properties.VariableNames=Ttl;
        writetable(SGTrials,'SGT'+string(k)+'.csv');
        SBTrials=table(RTSB,MCSB,LTSB,JPSB);
        SBTrials.Properties.VariableNames=Ttl;
        writetable(SBTrials,'SBT'+string(k)+'.csv');
        OGTrials=table(RTOG,MCOG,LTOG,JPOG);
        OGTrials.Properties.VariableNames=Ttl;
        writetable(OGTrials,'OGT'+string(k)+'.csv');
        OBTrials=table(RTOB,MCOB,LTOB,JPOB);
        OBTrials.Properties.VariableNames=Ttl;
        writetable(OBTrials,'OBT'+string(k)+'.csv');
        
    end
end