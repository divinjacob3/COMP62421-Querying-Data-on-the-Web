.echo on

.eqp on

.output QueryE2OutputMond10.log

SELECT Country.Name AS Country, City.Name AS CapitalCity,
    City.Population AS CapitalPopulation, Continent.Name AS Continent
FROM City
CROSS JOIN encompasses
CROSS JOIN Continent
CROSS JOIN Country
WHERE Continent.Area > 30000000 AND Country.Population > 10000000
    AND encompasses.Country = Country.Code AND encompasses.Continent = Continent.Name
    AND City.Name = Country.Capital AND City.country = Country.Code;