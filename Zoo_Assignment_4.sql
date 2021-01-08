USE db_zooTest2
GO

SELECT species_name
FROM tbl_species 
WHERE species_nutrition >= 2202 AND species_nutrition <= 2206