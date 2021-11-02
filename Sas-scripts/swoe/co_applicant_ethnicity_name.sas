select (co_applicant_ethnicity_name);
 when ('Hispanic or Latino') co_applicant_ethnicity_name_swo = 0.4947173724 ;
 when ('Information not provided by applicant in mail, Internet, or telephone application') co_applicant_ethnicity_name_swo = -0.305135524 ;
 when ('No co-applicant') co_applicant_ethnicity_name_swo = 0.4270571351 ;
 when ('Not Hispanic or Latino') co_applicant_ethnicity_name_swo = 0.7683740375 ;
 when ('Not applicable') co_applicant_ethnicity_name_swo = 6.2901775263 ;
 otherwise co_applicant_ethnicity_name_swo = 0.6694589568 ;
end;
