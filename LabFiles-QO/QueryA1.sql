-- TestScript.sql

.echo on

.output TestOutput.log

SELECT Country.Name
FROM Country
JOIN Encompasses ON Country.Code = Encompasses.Country
JOIN Continent ON Encompasses.Continent = Continent.Name
WHERE Continent.Name = 'Europe' AND Encompasses.Percentage > 50;

