function dev = critfunRT(X,Y)
model = fitglm(X,Y,'Distribution','inverse gaussian');% Approx distribution of RT
dev = model.Deviance;
end