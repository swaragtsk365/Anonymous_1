function LLOLD(RT) %Minimum LogLikelihood Outlier detector given data of a subject
RTS=sort(RT);
[N,~]=size(RT); %Since RT is a column vector
AICV=[];
OL=[];
for k=1:(N-30)
    OL=[OL,k];
    R=egfit(RTS);%Fits the ec-Gaussian function to the data
    params=R;
    Loglk=eglike(params,RTS);%Likelihood estimation
    RTS=RTS(1:(N-k),1);
    AICV=[AICV, Loglk];
end
figure
plot(OL,AICV,'Color','r','Marker',"o")
title('Number of outlayers excluded from positive extreme side')
ylabel('Log-lokelihood values')
xlabel('Number of excluded outliers')

end