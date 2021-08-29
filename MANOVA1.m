function MANOVA1(Data)
tbl=readtable(Data);
tbl.Cat1=categorical(tbl.Cat1);
tbl.Cat2=categorical(tbl.Cat2);
tbl.LT=categorical(tbl.LT);
tbl.JP=categorical(tbl.JP);
tbl.AD=categorical(tbl.AD);

end