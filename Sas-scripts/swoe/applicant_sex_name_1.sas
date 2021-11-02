select (applicant_sex_name);
 when ('Female') applicant_sex_name_swo = 0.3416305841 ;
 when ('Information not provided by applicant in mail, Internet, or telephone application') applicant_sex_name_swo = -0.179312216 ;
 when ('Male') applicant_sex_name_swo = 0.5731353647 ;
 when ('Not applicable') applicant_sex_name_swo = 4.0502677343 ;
 otherwise applicant_sex_name_swo = 0.6694589568 ;
end;
