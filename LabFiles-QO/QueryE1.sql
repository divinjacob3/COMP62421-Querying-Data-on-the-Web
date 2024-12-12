
.echo on

.eqp on

.output QueryE1OutputMond10.log

SELECT Country.Name AS Country, City.Name AS CapitalCity,
    City.Population AS CapitalPopulation, Continent.Name AS Continent
FROM Country
JOIN encompasses ON encompasses.Country = Country.Code
JOIN Continent ON encompasses.Continent = Continent.Name
JOIN City ON City.Name = Country.Capital AND City.country = Country.Code
WHERE Continent.Area > 30000000 AND Country.Population > 10000000;