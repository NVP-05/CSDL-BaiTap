-- 2
DELIMITER &&
CREATE PROCEDURE GETLanguage(IN language VARCHAR(255))
BEGIN
    SELECT CountryCode, Language, Percentage 
    FROM countrylanguage
    WHERE Language = language AND Percentage > 50;
END &&
DELIMITER &&;

-- 3
CALL GETLanguage('Muong');

-- 4
DROP PROCEDURE IF EXISTS GETLanguage;
