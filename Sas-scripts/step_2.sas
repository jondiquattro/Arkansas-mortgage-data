/*this file converts the data inport continuous variables into numerics
It converts action taken into a binary response variable.
*/

data work.number_strings;
set work.import;
keep uniqueID
action_taken_name
loan_amount_000s census_tract_number applicant_income_000s tract_to_msamd_income minority_population
rate_spread population number_of_1_to_4_family_units  number_of_owner_occupied_units
hud_median_family_income;

if action_taken_name = 'Loan originated' then action_taken_name = '1';
else if action_taken_name = 'Loan purchased by the institution'  then action_taken_name = '1';
else action_taken_name = '0';

run;


data work.numeric;
set work.number_strings;

action_taken_binary = input(action_taken_name, 1.);
income_int = input(applicant_income_000s, 10.) * 1000;
census_tract_int = input(census_tract_number, 5.2);
loan_amount_int = input(loan_amount_000s, 10.) * 1000;
minority_pop_int = input(minority_population, 3.5);
number1_4_family_int = input( number_of_1_to_4_family_units, 5.);
owner_occupied_unit = input( number_of_owner_occupied_units, 5.);
population_int = input(population,6.);
rate_spread_int = input(rate_spread, 3.2);
tract_to_msamd_int = input( tract_to_msamd_income, 4.3);
hud_median_family_income_int = input(hud_median_family_income, 10.);



drop census_tract_number minority_population number_of_1_to_4_family_units 
hud_median_family_income 
number_of_owner_occupied_units population tract_to_msamd_income
applicant_income_000s loan_amount_000s action_taken_name;
run;

proc means data=work.numeric mean nmiss median max;
run;



/*
proc univariate data=work.numeric noPrint;
class action_taken_binary;
var loan_amount_int income_int;
histogram loan_amount_int income_int;
inset mean std median min max / format=10. position=nw;
run;

*/








