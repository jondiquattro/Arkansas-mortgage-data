/* step one*/
%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u50209962/sasuser.v94/hmda_2017_ar_all-records_labels.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT; RUN;


%web_open_table(WORK.IMPORT);


data work.import;
set work.import;
uniqueID = _n_;
run;


data work.cat_vars;
set work.import; 
drop as_of_year state_name state_abbr state_code respondent_id

/*co applicants mostly missing*/
applicant_race_name_2 applicant_race_2  applicant_race_3 applicant_race_4 applicant_race_5 applicant_race_name_3 
applicant_race_name_4 applicant_race_name_5  co_applicant_race_2 co_applicant_race_3 co_applicant_race_4 co_applicant_race_5 
co_applicant_race_name_2 co_applicant_race_name_3 co_applicant_race_name_4 co_applicant_race_name_5


/*missing fields*/
edit_status edit_status_name sequence_number application_date_indicator

/*duplicate*/
 agency_code  loan_type property_type loan_purpose owner_occupancy preapproval_name
 action_taken applicant_ethnicity co_applicant_ethnicity applicant_race_1 co_applicant_race_1
 applicant_sex co_applicant_sex purchaser_type denial_reason_1  denial_reason_2 denial_reason_3
 hoepa_status lien_status


loan_amount_000s census_tract_number applicant_income_000s tract_to_msamd_income minority_population
rate_spread county_code population number_of_1_to_4_family_units  number_of_owner_occupied_units;
run;


