select (co_applicant_race_name_1);
 when ('American Indian or Alaska Native') co_applicant_race_name_1_swo = -0.096062733 ;
 when ('Asian') co_applicant_race_name_1_swo = 0.7059370997 ;
 when ('Black or African American') co_applicant_race_name_1_swo = -0.117797968 ;
 when ('Information not provided by applicant in mail, Internet, or telephone application') co_applicant_race_name_1_swo = 0.0088405839 ;
 when ('Native Hawaiian or Other Pacific Islander') co_applicant_race_name_1_swo = 0.5215982106 ;
 when ('No co-applicant') co_applicant_race_name_1_swo = 0.4270571351 ;
 when ('Not applicable') co_applicant_race_name_1_swo = 6.4348701343 ;
 when ('White') co_applicant_race_name_1_swo = 0.7539510708 ;
 otherwise co_applicant_race_name_1_swo = 0.6694589568 ;
end;
