SELECT l.Name AS language, c.Name AS country
FROM Language l
JOIN Country c ON l.country = c.Code;

SELECT l.Name AS language, c.Name AS country
FROM Language l
JOIN Country c ON CAST(l.country AS TEXT) = CAST(c.Code AS TEXT);

SELECT c.Name, c.Capital, c.Area
FROM country c
JOIN economy e ON c.Code = e.Country
WHERE e.GDP > 500000;

SELECT c.Name, c.Capital, c.Area
FROM country c
WHERE EXISTS (
    SELECT 1
    FROM economy e
    WHERE e.Country = c.Code AND e.GDP > 500000
);


SELECT c.Name AS Country, c.Capital, e.GDP
FROM country c
JOIN economy e ON c.Code = e.Country
ORDER BY e.GDP DESC;


SELECT c.Name AS Country, c.Capital, e.GDP
FROM country c
CROSS JOIN economy e
WHERE c.Code = e.Country
ORDER BY e.GDP DESC;
