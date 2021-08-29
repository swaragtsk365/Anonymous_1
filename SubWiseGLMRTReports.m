function SubWiseGLMRTReports
for k=1:15
    Data='RTFiltered_PlaceboSampleData2Categorywith5050trials'+string(k)+'_only.csv';
    PlotAICRTSubWise(Data,k)
end
end