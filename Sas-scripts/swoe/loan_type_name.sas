select (loan_type_name);
 when ('Conventional') loan_type_name_swo = 0.5816877871 ;
 when ('FHA-insured') loan_type_name_swo = 0.7945884506 ;
 when ('FSA/RHS-guarant') loan_type_name_swo = 1.5379299994 ;
 when ('VA-guaranteed') loan_type_name_swo = 0.5447105033 ;
 otherwise loan_type_name_swo = 0.6694589568 ;
end;
