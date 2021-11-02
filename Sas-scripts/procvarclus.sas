
/*if this hasnt been run in the previous step you would need to run this to create the imputes swoe from
swoe files*/



data work.train_imputed_swoe;
	set work.clean_final;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/agency_name.sas" / source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/applicant_race_name_1.sas" 
		/ source2;
	%include 
		"/home/u50209962/sasuser.v94/capstone/swoe/applicant_ethnicity_name.sas" / 
		source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/applicant_sex_name_1.sas" 
		/ source2;
	%include 
		"/home/u50209962/sasuser.v94/capstone/swoe/co_applicant_ethnicity_name.sas" / 
		source2;
	%include 
		"/home/u50209962/sasuser.v94/capstone/swoe/co_applicant_race_name_1.sas" / 
		source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/co_applicant_sex_name.sas" 
		/ source2;
	%include 
		"/home/u50209962/sasuser.v94/capstone/swoe/hud_median_family_income.sas" / 
		source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/lien_status_name.sas" / 
		source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/loan_type_name.sas" / 
		source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/purchaser_type_name.sas" / 
		source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/swoe_county_name.sas" / 
		source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/swoe_msamd.sas" / source2;
	%include "/home/u50209962/sasuser.v94/capstone/swoe/swoe_msamd_name.sas" / 
		source2;
run;

ods select none;
ods output clusterquality=work.summary rsquare=work.clusters;

proc varclus data=work.clean_final(drop=action_taken_binary uniqueID) 
		maxeigen=.7 hi;
run;

ods select all;
%global nvar;

data _null_;
	set work.summary;
	call symput('nvar', compress(NumberOfClusters));
run;

title1 "variables by cluster";

proc print data=work.clusters noobs label split='*';
	where NumberOfClusters=&nvar;
	var Cluster Variable RSquareRatio;
	label RSquareRatio="1 - RSquare*Ratio";
run;

/*display the variation from each variable*/
title1 'variation explained by cluster';

proc print data=work.summary label;
run;

