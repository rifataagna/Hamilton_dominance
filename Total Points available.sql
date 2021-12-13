SELECT
		races.year AS season,
        SUM(results3.points) AS Total_points_available
FROM
	races
	JOIN
		results3 ON races.raceId = results3.raceId AND races.year != 2021
	GROUP BY races.year
    ORDER BY races.year DESC;