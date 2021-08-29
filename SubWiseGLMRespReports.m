function SubWiseGLMRespReports
for k=1:15
    Data1='RTFiltered_PlaceboSampleData2Categorywith5050trials'+string(k)+'_only.csv';
    OF1='RTFiltered_PlaceboSampleData2Categorywithout5050trials'+string(k)+'_only.csv';
    Y35050Filter(Data1,OF1)
    PlotAICSubWise(OF1,k)
end
end