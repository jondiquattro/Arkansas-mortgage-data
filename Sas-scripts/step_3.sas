/*
should be run after running the convert numerics script
This code takes missing categorical values and replaces them with a missing category
it also adds a missing colum for each missing value
*/
data work.missing_numeric;
	set work.numeric;

	if missing(income_int) then
		do;
			income_int=60000;
			m_income_int=0;
		end;
	else
		m_income_int=1;

	if missing(census_tract_int) then
		do;
			census_tract_int=204;
			m_census_tract_int=0;
		end;
	else
		m_census_tract_int=1;

	if missing(minority_pop_int) then
		do;
			minority_pop_int=16;
			m_minority_pop_int=0;
		end;
	else
		m_minority_pop_int=1;

	if missing(number1_4_family_int) then
		do;
			number1_4_family_int=2085;
			m_number1_4_family_int=0;
		end;
	else
		m_number1_4_family_int=1;

	if missing(owner_occupied_unit) then
		do;
			owner_occupied_unit=1385;
			m_owner_occupied_unit=0;
		end;
	else
		m_owner_occupied_unit=1;

	if missing(population_int) then
		do;
			population_int=5165;
			m_population_int=0;
		end;
	else
		m_population_int=1;

	if missing(rate_spread_int) then
		do;
			rate_spread_int=2;
			m_rate_spread_int=0;
		end;
	else
		m_rate_spread_int=1;

	if missing(tract_to_msamd_int) then
		do;
			tract_to_msamd_int=281;
			m_tract_to_msamd_int=0;
		end;
	else
		m_tract_to_msamd_int=1;
		
keep  
uniqueID
action_taken_binary 

census_tract_int m_census_tract_int            income_int m_income_int
loan_amount_int m_loan_amount_int              minority_pop_int m_minority_pop_int 

number1_4_family_int m_number1_4_family_int   owner_occupied_unit m_owner_occupied_unit 
population_int m_population_int               rate_spread_int m_rate_spread_int 
 
tract_to_msamd_int m_tract_to_msamd_int;
run;

proc freq data=work.missing_numeric;
table m_loan_amount_int;
run;

proc means data=work.missing_numeric nmiss;
run;