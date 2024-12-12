
.echo on

.eqp on

.output QueryB2OutputMond20.log

SELECT c.Name AS country, ci.Name AS city
FROM Country c
JOIN City ci ON ci.Country = c.Code
WHERE ci.Population > 1000000;