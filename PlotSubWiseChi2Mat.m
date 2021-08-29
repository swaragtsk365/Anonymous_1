function PlotSubWiseChi2Mat
for k=1:15
    Data='RTFiltered_PlaceboSampleData2Categorywith5050trials'+string(k)+'_only.csv';
    Chi2PMatrix(Data,k)
end
end