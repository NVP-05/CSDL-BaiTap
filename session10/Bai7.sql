-- 2
DELIMITER &&

CREATE PROCEDURE GetEnglishSpeakingCountriesWithCities(IN language VARCHAR(255))
BEGIN
    SELECT c.Name, SUM(ci.Population)
    FROM country c
    join countrylanguage cl on c.Code = cl.CountryCode
    join city ci on c.Code = ci.CountryCode
    where cl.Language = language and cl.IsOfficial = 'T'
    GROUP BY c.Name
    HAVING SUM(ci.Population) > 5000000
    ORDER BY SUM(ci.Population) DESC
    LIMIT 10;
END &&

DELIMITER &&;
-- 3
CALL GetEnglishSpeakingCountriesWithCities('VIETNAMESE');
-- 4
drop procedure if exists GetEnglishSpeakingCountriesWithCities;
