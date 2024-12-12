-- TestScript.sql

.echo on

.eqp on

.output QueryA2Output.log

/* DROP INDEX CountryCodeIndex;
DROP INDEX CityPopulationIndex; */

DROP INDEX CountryCodeIndex;
DROP INDEX CityPopulationIndex;
DROP INDEX EncompassesCountryIndex;
DROP INDEX LanguageCountryIndex;
SELECT c.Name AS country, ci.Name AS city, ci.Population, encompasses.continent, l.name
FROM Country c
JOIN City ci ON ci.Country = c.Code
JOIN encompasses e ON e.country = c.Name
JOIN Language l on l.country = c.Name
WHERE ci.Population > 1000000
ORDER BY ci.Population DESC;


