-- 2
DELIMITER &&
CREATE PROCEDURE GetCountriesWithLargeCities()
BEGIN
    SELECT c.Name, SUM(ci.Population)
    FROM country c
    JOIN city ci ON c.Code = ci.CountryCode
    WHERE c.Continent = 'Asia'
    GROUP BY c.Name
    HAVING SUM(ci.Population) > 10000000
    ORDER BY SUM(ci.Population) DESC;
END &&
DELIMITER &&;
-- 3
CALL GetCountriesWithLargeCities();
-- 4
drop procedure if exists GetCountriesWithLargeCities;
