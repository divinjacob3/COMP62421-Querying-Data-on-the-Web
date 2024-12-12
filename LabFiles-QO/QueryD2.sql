
.echo on

.eqp on

.output QueryD2OutputMond10.log

SELECT c.Name AS CountryName, 
       (SELECT AVG(Population) 
        FROM City 
        WHERE City.Country = c.Code) AS AverageCityPopulation
FROM Country c;