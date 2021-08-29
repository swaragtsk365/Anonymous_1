function Y=NotAllSubjWiseSubsetComb
Vars={'Cat1';'Cat2';'AD';'Cat1:Cat2';'Cat1:AD';'Cat2:AD';'Cat1:Cat2:AD'};
EQS={};
%a1=Vars{1,1}
%a2=Vars{2,1}
%a3=string(a1)+'+'+string(a2)
[N,~]=size(Vars);

for k1=1:N % Combination of one
    a0=Vars{k1,1};
    a01='response~'+string(a0);
    EQS{end+1,1}=a01;
    for k2=k1+1:N% Combination of two
        a2=Vars{k2,1};
        a3=a01+'+'+string(a2);
        EQS{end+1,1}=a3;
        for k3=k2+1:N %Combination of 3
            a4=Vars{k3,1};
            a5=a3+'+'+string(a4);
            EQS{end+1,1}=a5;
            for k4=k3+1:N %Combination of 4
                a6=Vars{k4,1};
                a7=a5+'+'+string(a6);
                EQS{end+1,1}=a7;
                for k5=k4+1:N % Combination of 5
                    a8=Vars{k5,1};
                    a9=a7+'+'+string(a8);
                    EQS{end+1,1}=a9;
                end
            end
        end
    end
end
Y=EQS;
end