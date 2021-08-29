function CorrelationMatrix(data)
A=readtable(data);
Cat1=categorical(table2array(A(:,{'Cat1'})));
Cat1=Cat1=='S';
Cat2=categorical(table2array(A(:,{'Cat2'})));
Cat2=Cat2=='G';
MC=table2array(A(:,{'MC'}));
LT=categorical(table2array(A(:,{'LT'})));
LT=LT=='Y';
JP=categorical(table2array(A(:,{'JP'})));
JP=JP=='L';
AD=table2array(A(:,{'AD'}));
MAT=[Cat1,Cat2,MC,LT,JP,AD];
tbl=table(Cat1,Cat2,MC,LT,JP,AD);
PM=zeros(6,6);
for k1=1:6
    for k2=1:6
        Variab1=MAT(:,k1);
        Variab2=MAT(:,k2);
        a=Crammer_V(Variab1,Variab2);
        PM(k1,k2)=a;
    end
end
figure
h=imagesc(PM)
title('Subject 15 only')
colorbar
saveas(h,'JSS15.png')
%imwrite(h,'DDM/MatlabBehaviorFiles/Combined_session_files_placebo/AAA1.png')
end