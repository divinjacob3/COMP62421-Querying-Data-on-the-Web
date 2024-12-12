-- TestScript.sql

.echo on

.eqp on

.output QueryA1Output.log

CREATE INDEX CountryCodeIndex ON Country(Code);
CREATE INDEX CityPopulationIndex ON City(Population);
SELECT c.Name AS country, ci.Name AS city, ci.Population
FROM Country c
JOIN City ci ON ci.Country = c.Code
WHERE ci.Population > 1000000
ORDER BY ci.Population DESC;

