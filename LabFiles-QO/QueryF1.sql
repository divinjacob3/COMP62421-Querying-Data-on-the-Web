.echo on

.eqp on

.output QueryF1OutputMond10.log

SELECT Name
FROM Country
WHERE Code IN (
    SELECT Country
    FROM City
    WHERE Population > 1000000
);