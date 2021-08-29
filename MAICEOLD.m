function MAICEOLD(RT) %Minimum AIC Outlier detector given data of a subject
RTS=sort(RT);
[N,~]=size(RT); %Since RT is a column vector
AICV=[];
OL=[];
for k=1:(N-30)
    OL=[OL,k];
    R=egfit(RTS);%Fits the ec-Gaussian function to the data
    params=R;
    Loglk=eglike(params,RTS);%Likelihood estimation
    Aic=AIC(Loglk,3);%AIC value estimation
    RTS=RTS(1:(N-k),1);
    AICV=[AICV, Aic];
end
figure
plot(OL,AICV,'Color','r','Marker',"o")
title('Number of outlayers excluded from positive extreme side')
ylabel('AIC Score')
xlabel('Number of excluded outliers')

end