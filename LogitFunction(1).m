function v=LogitFunction(P)%P is the row matrix containing probabilities
    [~,l]=size(P);
    One=ones(1,l);
    Den=One-P;
    val=P./Den;
    v=log(val);
end