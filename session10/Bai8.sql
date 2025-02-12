-- 2
DELIMITER &&
CREATE PROCEDURE GetCountriesByCityNames()
BEGIN
    SELECT c.Name, cl.Language, SUM(ci.Population)
    FROM country c
    join countrylanguage cl on c.Code = cl.CountryCode
    join city ci on c.Code = ci.CountryCode
    where cl.IsOfficial = 'T' and ci.Name like 'A%'
    GROUP BY c.Name, cl.Language
    HAVING SUM(ci.Population) > 2000000
    ORDER BY SUM(ci.Population) ASC;
END &&
DELIMITER &&;
-- 3
CALL GetCountriesByCityNames();
-- 4
drop procedure if exists GetCountriesByCityNames;