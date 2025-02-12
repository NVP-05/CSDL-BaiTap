-- 2
DELIMITER &&
CREATE PROCEDURE GetLargeCitiesByCountry(IN country_code varchar(255))
BEGIN
    SELECT ID, Name, Population
    FROM city
    WHERE CountryCode = country_code AND Population > 1000000
    ORDER BY Population DESC;
END && 
DELIMITER &&;
-- 3
CALL GetLargeCitiesByCountry('AFG');
-- 4
drop procedure if exists GetLargeCitiesByCountry;

