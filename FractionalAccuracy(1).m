function [fSG,fSB,fOG,fOB]=FractionalAccuracy(file)%Gives Fraction of accurate choices per total number of choices
    A=readtable(file);
    RC=A(:,{'RC'});
    Resp=A(:,{'response'});
    Resp=Resp{:,1};
    [l,~]=size(RC);
    rc=[]; 
    for j=1:l
       e11=RC(j,1);
       rc=[rc; e11{1,1}{1}];
    end
    %disp(rc)
    SGA=Resp(rc=='R');%Response to specific trial types
    SBA=Resp(rc=='B');
    OGA=Resp(rc=='M');
    OBA=Resp(rc=='G');
    [TotSG,~]=size(SGA);%Total number of attempts
    [TotSB,~]=size(SBA);
    [TotOG,~]=size(OGA);
    [TotOB,~]=size(OBA);
    ASG=sum(SGA);%Number of accurate attempts
    ASB=sum(SBA);
    AOG=sum(OGA);
    AOB=sum(OBA);
    fSG=ASG/TotSG;%Probability of correct
    fSB=ASB/TotSB;
    fOG=AOG/TotOG;
    fOB=AOB/TotOB;
end