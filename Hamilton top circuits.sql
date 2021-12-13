SELECT
	-- CONCAT(drivers.forename ,' ', drivers.surname) AS Driver_Name,
    results3.driverId  AS driverId,
	COUNT(CASE WHEN results3.position = 1 THEN 1 END) AS Races_Won,
    COUNT(CASE WHEN results3.position = 1 OR results3.position = 2 OR results3.position =3 THEN 1 END) AS Podiums,
    COUNT(races.raceId) AS Num_of_Races,
    COUNT(CASE WHEN results3.rank = 1 THEN 1 END) AS Fastest_Laps,
    circuits.name,
    circuits.country
    
FROM
	results3
 JOIN
	races ON races.raceId = results3.raceId AND (races.year BETWEEN 2013 AND 2020)   AND results3.driverId = 1
 JOIN
	circuits ON races.circuitId = circuits.circuitId

GROUP BY circuits.name
ORDER BY Races_Won DESC, podiums DESC, fastest_laps DESC
LIMIT 10;