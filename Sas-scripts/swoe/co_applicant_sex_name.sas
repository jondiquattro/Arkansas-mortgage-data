select (co_applicant_sex_name);
 when ('Female') co_applicant_sex_name_swo = 0.7401539643 ;
 when ('Information not provided by applicant in mail, Internet, or telephone application') co_applicant_sex_name_swo = 0.0067123778 ;
 when ('Male') co_applicant_sex_name_swo = 0.3974292936 ;
 when ('No co-applicant') co_applicant_sex_name_swo = 0.4270571351 ;
 when ('Not applicable') co_applicant_sex_name_swo = 6.2886678228 ;
 otherwise co_applicant_sex_name_swo = 0.6694589568 ;
end;
