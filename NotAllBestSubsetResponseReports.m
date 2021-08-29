function NotAllBestSubsetResponseReports
for k=1:15
    Name='RTFiltered_PlaceboSampleData2Categorywithout5050trials'+string(k)+'_only.csv';
    BestSubsetSelectionSWIntVarOnly(Name,k)
end
end