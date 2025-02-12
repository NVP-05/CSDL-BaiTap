-- 2
CREATE VIEW OfficialLanguageView AS
SELECT 
    c.Code AS CountryCode,
    c.Name AS CountryName,
    cl.Language
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T';
-- 3
SELECT * FROM OfficialLanguageView;
-- 4
CREATE INDEX idx_city_name ON city(Name);
-- 5
DELIMITER &&
CREATE PROCEDURE GetSpecialCountriesAndCities(IN language_name VARCHAR(50))
BEGIN
    SELECT c.Name,ci.Name,ci.Population,
	(SELECT SUM(cy.Population) from city cy where cy.CountryCode = c.Code) AS TotalPopulation
    FROM city ci
    JOIN country c ON ci.CountryCode = c.Code
    JOIN countrylanguage cl ON c.Code = cl.CountryCode
    WHERE cl.Language = language_name 
      AND cl.IsOfficial = 'T'
      AND ci.Name LIKE 'New%'  
      AND (SELECT SUM(cy.Population) FROM city cy WHERE cy.CountryCode = c.Code) > 5000000
    ORDER BY TotalPopulation DESC
    LIMIT 10;
END &&;
DELIMITER &&;
-- 6
CALL GetSpecialCountriesAndCities('English');
