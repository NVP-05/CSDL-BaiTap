-- 2

DELIMITER &&
CREATE PROCEDURE GetCitiesByCountry(IN country_code VARCHAR(255))
BEGIN
    SELECT ID, Name, Population
    FROM city
    WHERE CountryCode = country_code ;
END&&
DELIMITER &&;
-- 3
CALL GetCitiesByCountry('AFG');
 
-- 4
drop procedure if exists GetCitiesByCountry;  