function FinTableMaker(data)%The CSV file Findata
    %mn=0;
    A=readtable(data);
    A1=A(:,{'Session'});
    A1=table2array(A1);
    l=length(A1);
    A2=A(:,{'RC'});
    Cat1=A(:,{'Cat1'});
    Cat2=A(:,{'Cat2'});
    A2=table2array(A2);
    a2=[];
    CA1=[];
    CA2=[];
    for j=1:l
        E11=A2(j,1);
        a2=[a2; E11{1}];
        E12=Cat1(j,1);
        CA1=[CA1;E12{1,1}{1}];
        E13=Cat2(j,1);
        CA2=[CA2; E13{1,1}{1}];
    end
    A3=A(:,{'RT'});
    A3=table2array(A3);
    A4=A(:,{'MC'});
    A4=table2array(A4);
    A5=A(:,{'LT'});
    A5=table2array(A5);
    a5=[];
    for j=1:l
        E2=A5(j,1);
        a5=[a5; E2{1}];
    end
    A6=A(:,{'JP'});
    A6=table2array(A6);
    a6=[];
    for j=1:l
        E3=A6(j,1);
        a6=[a6; E3{1}];
    end
    %disp(a5)
    AD=[];
    Volume=[];
    response=[];
    for k=1:l
        if A4(k,1)==1
            AD=[AD; 80];
            if (a5(k,1)=='W' && a6(k,1)=='L') || (a5(k,1)=='Y' && a6(k,1)=='R')
                Volume=[Volume; 90];
                response=[response;1];
            elseif (a5(k,1)=='Y' && a6(k,1)=='L') || (a5(k,1)=='W' && a6(k,1)=='R')
                Volume=[Volume; 10];
                response=[response;0];
            end
        elseif A4(k,1)==2
            AD=[AD; 34];
            if (a5(k,1)=='W' && a6(k,1)=='L') || (a5(k,1)=='Y' && a6(k,1)=='R')
                Volume=[Volume; 67];
                response=[response;1];
            elseif (a5(k,1)=='Y' && a6(k,1)=='L') || (a5(k,1)=='W' && a6(k,1)=='R')
                Volume=[Volume; 33];
                response=[response;0];
            end
        elseif A4(k,1)==3
            AD=[AD; 0];
            Volume=[Volume; 50];
            response=[response;0];
            %mn=mn+1;
        elseif A4(k,1)==4
            AD=[AD; 34];
            if (a5(k,1)=='W' && a6(k,1)=='L') || (a5(k,1)=='Y' && a6(k,1)=='R')
                Volume=[Volume; 33];
                response=[response;0];
            elseif (a5(k,1)=='Y' && a6(k,1)=='L') || (a5(k,1)=='W' && a6(k,1)=='R')
                Volume=[Volume; 67];
                response=[response;1];
            end
        elseif A4(k,1)==5
            AD=[AD; 80];
            if (a5(k,1)=='W' && a6(k,1)=='L') || (a5(k,1)=='Y' && a6(k,1)=='R')
                Volume=[Volume; 10];
                response=[response;0];
            elseif (a5(k,1)=='Y' && a6(k,1)=='L') || (a5(k,1)=='W' && a6(k,1)=='R')
                Volume=[Volume; 90];
                response=[response;1];
            end
        end
    end
    disp(size(AD))
    disp(size(Cat1))
    disp(Cat1)
    A=A1(AD~=0);
    B=a2(AD~=0);
    C=A3(AD~=0);
    D=A4(AD~=0);
    E=a5(AD~=0);
    F=a6(AD~=0);
    G=AD(AD~=0);
    X=CA1(AD~=0);
    Y=CA2(AD~=0);
    disp(size(X))
    disp(size(Y))
    H=Volume(AD~=0);
    I=response(AD~=0);
    
    Total=table(A,B,X,Y,C,D,E,F,G,H,I);
    Total.Properties.VariableNames={'Session','RC','Cat1','Cat2','RT','MC','LT','JP','AD','Volume(%)','response'};
    writetable(Total,'PlaceboSampleDataF12Category.csv');    
end