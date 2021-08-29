function V=Crammer_V(Var1,Var2)
%% Source of logic: https://www.kaggle.com/chrisbss1/cramer-s-v-correlation-matrix
CTBL=CrossTable(Var1,Var2);% Cross Table Calculation
OBS= sum(CTBL(:)); %Number of Observations
[df,X2,P]=Chi2cont(CTBL);
[M,N]=size(CTBL);
Min=min(M,N);
V= sqrt(X2/(OBS*(Min-1)));
end