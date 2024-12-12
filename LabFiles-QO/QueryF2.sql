.echo on

.eqp on

.output QueryF2OutputMond10.log

SELECT Name
FROM Country
WHERE EXISTS (
    SELECT 1
    FROM City
    WHERE City.Country = Country.Code AND City.Population > 1000000
);