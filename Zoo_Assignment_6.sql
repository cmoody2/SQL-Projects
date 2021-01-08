USE db_zoo
GO

SELECT 
	specialist_fname, specialist_lname, specialist_contact
	FROM tbl_specialist
	INNER JOIN tbl_care ON tbl_specialist.specialist_id = tbl_care.care_specialist
	INNER JOIN tbl_species ON tbl_species.species_care = tbl_care.care_id
	WHERE tbl_species.species_care = 'care_6'
;
