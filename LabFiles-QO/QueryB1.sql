
.echo on

.eqp on

.output QueryB1OutputMond20.log

SELECT c.Name AS country, ci.Name AS city
FROM Country c
JOIN City ci ON CAST(ci.Country AS TEXT) = CAST(c.Code AS TEXT)
WHERE ci.Population > 1000000;