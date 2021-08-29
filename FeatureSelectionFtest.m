function FeatureSelectionFtest(file)
A=readtable(file);
Cat1=categorical(table2array(A(:,{'Cat1'})));
Cat2=categorical(table2array(A(:,{'Cat2'})));
[idx,scores] = fsrftest(A,'RT');
figure
bar(scores(idx))
title('Predictor Importance Score')
ylabel('Score')
xlabel('Predictor Index')
end