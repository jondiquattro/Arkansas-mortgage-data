/*this should be run in the following order
1. clean_work_cap
2. convertNumerics
3. create_missing_numerics1
4. create_missing_cats1
5. smooth_weight_cats
6. cleanfinal

*/
proc sort data=work.missing_numeric;
by uniqueID;
run;

proc sort data=work.cat_missing;
by uniqueID;
run;

data work.clean_final;
merge work.missing_numeric work.cat_missing;
by uniqueID;
run;







