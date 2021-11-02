
proc sort data=work.clean_final;
by uniqueID;
run;

proc sort data=work.train_imputed_swoe;
by uniqueID;
run;

data work.clean_final;
merge work.clean_final work.train_imputed_swoe;
by uniqueID;
run;
 
ods graphics off;

proc freq data=work.clean_final;
tables (&finalC)* applicant_race_name_1 /chisq expected cellchi2 nocol 
nopercent relrisk oddsratio;
run;
ods graphics on;




%let finalI =     
      
    /*cluster 1*/
  m_population_int
  			/*cluster 2*/
  lien_status_name_swo
  				/*3*/
  county_name_swo
			/*4*/
  /* high p number1_4_family_int*/
  			/*5*/
  m_rate_spread_int
  			/*6*/
  purchaser_type_name_swo
  			/*7*/
  income_int
  			/*8*/
  /*agency_name_swo*/
  			/*cluster 9*/
  minority_pop_int
  			/*cluster 10*/
  loan_amount_int
  			/*cluster 11*/
  loan_type_name_swo
  			/*cluster 12*/
  tract_to_msamd_int
  			/*cluster 13*/
 /*rate_spread_int has to be removed. Causing convergence issues*/
 
  			/*cluster 14*/
  applicant_race_name_1;
  
  

ods graphics on;

proc logistic data=work.clean_final plots(only maxpoints=none)=(effect oddsratio);
class applicant_race_name_1(ref='White') loan_type_name  owner_occupancy_binary  /param=ref;
model action_taken_binary(event='1')=&finalI   / clodds=pl;
units income_int=1000;
title 'Logistic Model (2):action_taken_binary=applicant_race_name_1';
run;

