-- 2
CREATE VIEW CountryLanguageView AS
SELECT 
    c.Code AS CountryCode,
    c.Name AS CountryName,
    cl.Language,
    cl.IsOfficial
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T';
-- 3
SELECT * FROM CountryLanguageView;
-- 4
DELIMITER &&
CREATE PROCEDURE GetLargeCitiesWithEnglish()
BEGIN
    SELECT ci.Name, c.Name, ci.Population
    FROM city ci
    join country c on ci.CountryCode = c.Code
    join countrylanguage cl on c.Code = cl.CountryCode
    where cl.Language = 'English' and cl.IsOfficial = 'T' and ci.Population > 1000000
    ORDER BY ci.Population DESC
    LIMIT 20;
END &&;
DELIMITER &&;
-- 5
CALL GetLargeCitiesWithEnglish();
-- 6
drop procedure if exists GetLargeCitiesWithEnglish;