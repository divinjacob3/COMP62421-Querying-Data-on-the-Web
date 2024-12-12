
.echo on

.eqp on

.output QueryD1OutputMond10.log

SELECT c.Name AS CountryName, s.AvgPop AS AverageCityPopulation
FROM Country c, (
    SELECT ci.Country, AVG(ci.Population) AS AvgPop
    FROM City ci
    GROUP BY ci.Country
) s
WHERE c.Code = s.Country;