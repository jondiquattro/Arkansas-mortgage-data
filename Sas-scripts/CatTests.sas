%let final= hud_median_family_income lien_status_name county_name
/*not significant*/ 
 loan_type_name agency_name applicant_race_name_1 co_applicant_race_name_1;


%let finalC= loan_type_name;
agency_name county_name 
hud_median_family_income;

%let finalI = number1_4_family_int 
minority_pop_int  
loan_amount_int 
tract_to_msamd_int 
income_int  
rate_spread_int 
census_tract_int 
m_population_int;
  
  
ods graphics off;

proc freq data=work.clean_final;
tables (&final)*action_taken_binary /chisq expected cellchi2 nocol 
nopercent relrisk oddsratio;
run;
ods graphics on;




ods graphics on;

proc logistic data=work.clean_final plots(only maxpoints=none)=(effect oddsratio);
class applicant_race_name_1(ref='White') loan_type_name  owner_occupancy_binary  /param=ref;
model action_taken_binary(event='1')=&finalI applicant_race_name_1 lien_status_name_swo loan_type_name / clodds=pl;
units income_int=1000;
title 'Logistic Model (2):action_taken_binary=applicant_race_name_1';
run;


ods graphics off;
proc freq data=work.clean_final;
tables (applicant_race_name_1) * action_taken_binary / chisq expected cellchi2 nocol nopercent relrisk;
run;
ods graphics on;