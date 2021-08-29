function SubjWiseSigCoeff
for k=1:15
    InN='Subject'+string(k)+'Individual_summaryGLMResponse.csv';
    OFname='Subject'+string(k)+'Significant_Individual_summaryGLMResponse.csv';
    SigCoeffExtractor(InN,OFname)
end
end