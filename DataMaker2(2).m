function DataMaker2()
    RT2=[];
    MC=[];
    LT=[];
    JP=[];
    RC=[];
    TN=[];
    Cat1=[];
    Cat2=[];
    TRIALNumber=[];
    for k=1:15
        A=readtable('S'+string(k)+'.csv');
        B=table2array(A);
        SGT=rmmissing(B(:,1));
        SBT=rmmissing(B(:,2));
        OGT=rmmissing(B(:,3));
        OBT=rmmissing(B(:,4));
        TrialNumber=[SGT;SBT;OGT;OBT];
        TargetOn=cell2mat(struct2cell(load('S'+string(k)+'.mat','cTwoTargetsON_')));
        LTACQT=cell2mat(struct2cell(load('S'+string(k)+'.mat','cAcqLTarget_')));
        RTACQT=cell2mat(struct2cell(load('S'+string(k)+'.mat','cAcqRTarget_')));
        len1=length(TargetOn);
        RT=zeros(len1,1);
        MagnitudeCue=cell2mat(struct2cell(load('S'+string(k)+'.mat','cMagCue_')));
        MagnitudeCue(:,1)=[];
        LeftTarget=cell2mat(struct2cell(load('S'+string(k)+'.mat','cLeftT_')));
        JoyPosition=cell2mat(struct2cell(load('S'+string(k)+'.mat','cJoyPosn_')));
        RewardCue=cell2mat(struct2cell(load('S'+string(k)+'.mat','cRCueCol_')));
        for k2=1:len1
            if JoyPosition(k2,1)=='L'
                RT(k2,1)= LTACQT(k2,1)-TargetOn(k2,1);
            elseif JoyPosition(k2,1)=='R'
                RT(k2,1)= RTACQT(k2,1)-TargetOn(k2,1);
            end
        end
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
        Cat1SG=strrep(RCSG','R','S');
        Cat1SG=Cat1SG';
        Cat2SG=strrep(RCSG','R','G');
        Cat2SG=Cat2SG';
        RCSB=RewardCue(SBT',1);
        Cat1SB=strrep(RCSB','B','S');
        Cat1SB=Cat1SB';
        Cat2SB=strrep(RCSB','B','B');
        Cat2SB=Cat2SB';
        RCOG=RewardCue(OGT',1);
        Cat1OG=strrep(RCOG','M','O');
        Cat1OG=Cat1OG';
        Cat2OG=strrep(RCOG','M','G');
        Cat2OG=Cat2OG';
        RCOB=RewardCue(OBT',1);
        Cat1OB=strrep(RCOB','G','O');
        Cat1OB=Cat1OB';
        Cat2OB=strrep(RCOB','G','B');
        Cat2OB=Cat2OB';
        RTl=[RTSG;RTSB;RTOG;RTOB];
        RT2=[RT2;RTl];
        RCl=[RCSG;RCSB;RCOG;RCOB];
        RC=[RC;RCl];
        %disp(size(RC)==size(RT))
        MC=[MC;MCSG;MCSB;MCOG;MCOB];
        Cat1=[Cat1;Cat1SG;Cat1SB;Cat1OG;Cat1OB];
        Cat2=[Cat2;Cat2SG;Cat2SB;Cat2OG;Cat2OB];
        LT=[LT;LTSG;LTSB;LTOG;LTOB];
        JP=[JP;JPSG;JPSB;JPOG;JPOB];
        l=length(LTSG)+length(LTSB)+length(LTOG)+length(LTOB);
        l2=k*ones(l,1);
        TN=[TN;l2];
        TRIALNumber=[TRIALNumber;TrialNumber];
        %disp(length(RT)==length(RC))
        %disp(length(TN)==length(RC))
        
        
    end
    disp(size(TN))
    disp(size(RC))
    disp(size(RT2))
    disp(size(MC))
    disp(size(LT))
    disp(size(JP))
    disp(size(Cat1))
    disp(size(Cat2))
    RT2=0.001*RT2;
    Total=table(TN,TRIALNumber,RC,Cat1,Cat2,RT2,MC,LT,JP);
    Total.Properties.VariableNames={'Session','Trial_Number','RC','Cat1','Cat2','RT','MC','LT','JP'};
    writetable(Total,'FindataPlacebo2Cat.csv');
end