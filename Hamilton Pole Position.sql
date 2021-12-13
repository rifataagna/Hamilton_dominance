/* Hamilton's Pole Position - Rifata */
SELECT
	races.year,
    qualifying.driverId,
    CONCAT(drivers.forename ,' ', drivers.surname) AS Driver_Name,
    COUNT(races.raceId) AS Num_of_Races,
    COUNT(CASE WHEN qualifying.position = 1 THEN 1 END) AS Num_Pole
FROM
	qualifying
    INNER JOIN
		drivers ON qualifying.driverId = drivers.driverId AND drivers.driverId = 1
	INNER JOIN
		races ON qualifying.raceId = races.raceId AND races.year BETWEEN 2013 AND 2020
GROUP BY races.year
ORDER BY races.year DESC;