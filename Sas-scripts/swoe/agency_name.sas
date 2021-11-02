select (agency_name);
 when ('Consumer Financial Protection Bureau') agency_name_swo = 0.9498069267 ;
 when ('Department of Housing and Urban Development') agency_name_swo = 0.2129909504 ;
 when ('Federal Deposit Insurance Corporation') agency_name_swo = 1.1134344577 ;
 when ('Federal Reserve System') agency_name_swo = 1.0223049507 ;
 when ('National Credit Union Administration') agency_name_swo = 0.186258351 ;
 when ('Office of the Comptroller of the Currency') agency_name_swo = 1.3658759904 ;
 otherwise agency_name_swo = 0.6694589568 ;
end;
