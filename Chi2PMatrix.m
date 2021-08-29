function Chi2PMatrix(data,NNN)
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
PVM=zeros(6,6);
for k1=1:6
    for k2=1:6
        CT=CrossTable(MAT(:,k1),MAT(:,k2));
        [~,~,P]=Chi2cont(CT);
        if P<0.05
           PVM(k1,k2)=1;
        elseif P>=0.05
           PVM(k1,k2)=0;
        end
    end
end
figure
h1=imagesc(PVM)
STR1='Subject '+string(NNN)+' only';
title(STR1)
colormap("gray")
OFN='JSN'+string(NNN)+'.png';
saveas(h1,OFN)
end