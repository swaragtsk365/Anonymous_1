function CT=CrossTable(V1,V2)
V1u=unique(V1);
V2u=unique(V2);
[N1,~]=size(V1u);
[N2,~]=size(V2u);
CT=zeros(N1,N2);
for k1=1:N1
    a1=V1u(k1,1);
    VV1=V2(V1==a1);
    for k2=1:N2
        a2=V2u(k2,1);
        CT(k1,k2)=sum(VV1==a2);
    end
end
end