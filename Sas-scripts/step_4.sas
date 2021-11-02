/*This code takes missing categorical values and replaces them with a missing category
it also adds a missing colum for each missing value
*/
data work.cat_missing;
	set work.cat_vars;

	if missing(msamd) then
		do;
			msamd='m_cat';
		end;

	if missing(msamd_name) then
		do;
			msamd_name='m_cat';
		end;

	if missing(county_name) then
		do;
			county_name='m_cat';
		end;

	if missing(hud_median_family_income) then
		do;
			hud_median_family_income='m_cat';
		end;

	if missing(denial_reason_name_1) then
		do;
			denial_reason_name_1='m_cat';
		end;

	if missing(denial_reason_name_2) then
		do;
			denial_reason_name_2='m_cat';
		end;

	if missing(denial_reason_name_3) then
		do;
			denial_reason_name_3='m_cat';
		end;
	run;

proc freq data=work.cat_vars;
table property_type_name loan_purpose_name owner_occupancy_name preapproval;
run;