-- TestScript.sql

.echo on

.output TestOutput.log

SELECT Country.Name
FROM Country, Encompasses, Continent
WHERE Country.Code = Encompasses.Country
  AND Encompasses.Continent = Continent.Name
  AND Encompasses.Percentage + 0 > 50
  AND Continent.Name = UPPER('europe');


