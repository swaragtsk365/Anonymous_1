function Left_Right_RT_Plot(file)
A=readtable(file);
subj_idx=table2array(A(:,{'subj_idx'}));
RT=table2array(A(:,{'RT'}));
JP1=table2array(A(:,{'JP'}));
[N,~]=size(JP1);
JP=[];
for k=1:N
    a=JP1(k,1);
    JP=[JP;a{1}];
end
Idx=unique(subj_idx);
[N1,~]=size(Idx);
for k1=1:N1
    figure
    RTS=RT(subj_idx==k1);
    JPS=JP(subj_idx==k1);
    RTSL=RTS(JPS=='L');
    RTSR=RTS(JPS=='R');
    histogram(RTSL,15,"FaceColor",'b')
    hold on
    histogram(RTSR,15,"FaceColor",'r')
    title('RT distribution for chosen left v/s right; subject:'+string(k1))
    ylabel('Count')
    xlabel('Response Time')
end

end