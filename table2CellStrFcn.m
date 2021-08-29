function Tstr = table2CellStrFcn(T)
% Input a numeric table with column and row names (T) and convert to cell of strings (Tstr)
cname = [' ', T.Properties.VariableNames]; 
rname = T.Properties.RowNames; 
datastr = cellfun(@num2str,table2cell(T),'UniformOutput',false); 
Tstr = [cname; [rname, datastr]]; 
% pad elements of Tstr so columns have the same length
maxLen = max(cellfun(@numel, Tstr),[], 1); 
for i = 1:size(Tstr,2)
    Tstr(:,i) = pad(Tstr(:,i),maxLen(i),'right'); 
end
% Join columns to make nx1 array
Tstr = cellfun(@strjoin,mat2cell(Tstr,ones(1,size(Tstr,1)), size(Tstr,2)),'Unif',false); 
end