
.echo on

.eqp on

.output QueryC1VarOutputMond20.log

SELECT DISTINCT c.Name
FROM country c
JOIN city ci ON CAST(c.Code AS TEXT) = CAST(ci.Country AS TEXT)
WHERE ci.Population > 1000000;