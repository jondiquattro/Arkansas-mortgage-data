select (applicant_ethnicity_name);
 when ('Hispanic or Latino') applicant_ethnicity_name_swo = 0.3290939991 ;
 when ('Information not provided by applicant in mail, Internet, or telephone application') applicant_ethnicity_name_swo = -0.402230603 ;
 when ('Not Hispanic or Latino') applicant_ethnicity_name_swo = 0.5718068071 ;
 when ('Not applicable') applicant_ethnicity_name_swo = 4.044396264 ;
 otherwise applicant_ethnicity_name_swo = 0.6694589568 ;
end;
