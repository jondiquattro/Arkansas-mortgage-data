select (lien_status_name);
 when ('Not applicable') lien_status_name_swo = 7.8421801269 ;
 when ('Not secured by a lien') lien_status_name_swo = 0.0828899101 ;
 when ('Secured by a first lien') lien_status_name_swo = 0.3941921248 ;
 when ('Secured by a subordinate') lien_status_name_swo = 0.6818699119 ;
 otherwise lien_status_name_swo = 0.6694589568 ;
end;
