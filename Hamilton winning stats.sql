/* Hamilton Stats Code -Rifata */
SELECT
	races.year,
	CONCAT(drivers.forename ,' ', drivers.surname) AS Driver_Name,
    results3.driverId  AS driverId,
    SUM(results3.points) AS Total_points,
	COUNT(CASE WHEN results3.position = 1 THEN 1 END) AS Races_Won,
    COUNT(CASE WHEN results3.position = 1 OR results3.position = 2 OR results3.position =3 THEN 1 END) AS Podiums,
    COUNT(races.raceId) AS Num_of_Races,
    COUNT(CASE WHEN results3.rank = 1 THEN 1 END) AS Fastest_Laps
FROM
	races
	/* Joining the results and races table, then filter the races year from 2013 to 2020 (Hamilton's season at Mercedes) */
	INNER JOIN 
	results3 ON races.raceId = results3.raceId AND races.year BETWEEN 2013 AND 2020  
	/* Joining the drivers table with the previous joined table and filter the driverId to get only Hamilton (driverId = 1) */
	INNER JOIN
	drivers ON results3.driverID = drivers.driverId AND drivers.driverId = 1
GROUP BY races.year
ORDER BY races.year DESC;
