/*this script creates files for each categorical swoe*/


%let path = "/home/u50209962/sasuser.v94/capstone/swoe/hud_median_family_income.sas";
%PUT &=path;

proc sql;
select mean(action_taken_binary) into:rho1 from work.clean_final;
quit;


proc means data=work.clean_final sum nway;
class hud_median_family_income;
var action_taken_binary;
output out=work.counts sum=events;
run;


data work.test_data;
file &path;
set work.counts end=last;
logit=log((events + &rho1*24)/(_FREQ_ - events + (1-&rho1)*24));
if _n_=1 then put "select (hud_median_family_income);" ;
put " when ('" hud_median_family_income +(-1)"') hud_median_family_income_swo = " logit ";" ;
if last then do;
logit=log(&rho1/(1-&rho1));
put " otherwise hud_median_family_income_swo = " logit ";" / "end;";
end;
run;

data work.train_imputed_swoe;
set work.counts;
%include &path / source2;
run;
/* this ends the swoe file creation that would be run for every categorical variable*/

proc freq data=work.train_imputed_swoe;
table hud_median_family_income;
run;

/*this creates the imputed swoe data set*/

data work.train_imputed_swoe;
set work.clean_final;
%include "/home/u50209962/sasuser.v94/capstone/swoe/agency_name.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/applicant_race_name_1.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/applicant_ethnicity_name.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/applicant_sex_name_1.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/co_applicant_ethnicity_name.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/co_applicant_race_name_1.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/co_applicant_sex_name.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/hud_median_family_income.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/lien_status_name.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/loan_type_name.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/purchaser_type_name.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/swoe_county_name.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/swoe_msamd.sas" / source2;
%include "/home/u50209962/sasuser.v94/capstone/swoe/swoe_msamd_name.sas" / source2;

run;

/*converts remainder cats to binary*/
data work.clean_final;
set work.clean_final;


if property_type_name = 'Manufactured housing' then property_type_binary = '100';
else if property_type_name = 'Multifamily dwelling'  then property_type_binary = '010';
else property_type_binary = '001';

if loan_purpose_name = 'Home improvement' then loan_purpose_binary = '100';
else if loan_purpose_name = 'Home purchase'  then loan_purpose_binary = '010';
else loan_purpose_binary = '001';

if owner_occupancy_name = 'Not applicable' then owner_occupancy_binary = '100';
else if owner_occupancy_name = 'Not owner-occupied as a principal dwelling'  then owner_occupancy_binary = '010';
else owner_occupancy_binary = '001';

if preapproval = '1' then preapproval_binary = '100';
else if preapproval = '2'  then preapproval_binary = '010';
else preapproval_binary = '001';

drop property_type_name loan_purpose_name owner_occupancy_name preapproval;

run;

proc freq data=work.clean_final;
table property_type_binary loan_purpose_binary owner_occupancy_binary preapproval_binary;
run;

