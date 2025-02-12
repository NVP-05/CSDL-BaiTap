-- 2
DELIMITER &&
CREATE PROCEDURE CalculatePopulation(IN p_countryCode VARCHAR(255), OUT total_population INT)
BEGIN
    SELECT SUM(Population) INTO total_population
    FROM country
    WHERE Code = p_countryCode;
END &&
DELIMITER &&;

-- 3
SET @total_population = 0;
CALL CalculatePopulation('AFG', @total_population);
SELECT @total_population AS TotalPopulation;

-- 4
DROP PROCEDURE IF EXISTS CalculatePopulation;
