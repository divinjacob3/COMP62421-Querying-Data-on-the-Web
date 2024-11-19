-- TestScript.sql

.echo on

.output Query12Output.log

SELECT DISTINCT name AS country_name, population / 2 AS half_population
FROM Country
ORDER BY country_name
LIMIT 10;



