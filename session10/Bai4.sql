-- 2
DELIMITER &&
CREATE PROCEDURE UpdateCityPopulation (IN city_id INT, IN new_population INT)
BEGIN
    UPDATE city 
    SET Population = new_population
    WHERE ID = city_id;

    SELECT ID, Name, Population
    FROM city
    WHERE ID = city_id;
END &&
DELIMITER &&;

-- 3
CALL UpdateCityPopulation(1, 100);

-- 4
DROP PROCEDURE IF EXISTS UpdateCityPopulation;
