
.echo on

.eqp on

.output QueryC2OutputMond20.log

SELECT DISTINCT c.Name
FROM country c
WHERE EXISTS (
    SELECT 1
    FROM city ci
    WHERE ci.Country = c.Code AND ci.Population > 1000000
);