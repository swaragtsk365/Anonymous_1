function exGFFit(RT)
N=length(RT);
RTS=sort(RT);
MSEL=[];
EEP=[];
for k=1:N-1
    EEP=[EEP,k];
    [mu,sigma,tau]=exgfit(RTS,[0.1,1,0.1]);
    RMax=max(RTS);
    RMin=min(RTS);
    Fact=(RMax-EMin)/10;
    Bins=RMin:Fact:RMax;
    f=histogram(RTS,'BinEdges',Bins);
    v=f.Values;
    S=sum(v);
    V=(1/S)*v;
    LB=Bins(1,1:length(Bins)-1);
    UB=Bins(1,2:length(Bins));
    AVG=1/2*(LB+UB);
    PDF=exgauss_pdf(AVG,mu,sigma,tau);
    Err=PDF-V;
    SQE=Err.*Err;
    MSE=(1/length(Err))*SQE;
    MSEL=[MSEL,MSE]
    RTS=RTS(1:N-k,1);
    
end
figure
plot(EEP,MSEL,'Color','g','Marker',"o")
end