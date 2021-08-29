function LRAA(file) %Linear Regression Analysis of Accuracy
    [fSG,fSB,fOG,fOB]=FractionalAccuracy(file);
    Cat1=['S';'S';'O';'O'];
    Cat2=['G';'B';'G';'B'];
    Resp=[fSG;fSB;fOG;fOB];
    v=LogitFunction(Resp);
    data = table(Cat1,Cat2,v);
    data.Cat1=categorical(cellstr(data.Cat1));
    data.Cat2=categorical(cellstr(data.Cat2));
    X=[Cat1 Cat2];
    Y=v;
    fit=fitlm(data)%Vars',[Cat1,Cat2])
    anova(fit)
    
    
    %X=[a1,a2];
    %disp(X(:,1))
    %mdl = fitglm(X,R,'R ~ c(X(:,1)) + c(X(:,2))')
    %A.Cat1=categorical(A.Cat1);
    %A.Cat2=categorical(A.Cat2);
    %fit = fitlm(A,'response~Cat1+Cat2+Cat1*Cat2');
    %tbl = anova(fit)
    %disp(a1)
    %disp(a2)
    %disp(R)
end