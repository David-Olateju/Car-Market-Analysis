SELECT *
FROM Cars.dbo.car_scrape$;

select SUBSTRING(title, 0, CHARINDEX(' ', title))
from Cars.dbo.car_scrape$

SELECT manufacturer, COUNT(manufacturer)
FROM Cars.dbo.car_scrape$
GROUP BY manufacturer

SELECT DISTINCT(location)
FROM Cars.dbo.car_scrape$



SELECT loc FROM
	(SELECT title, LEFT(title, 6) AS loc
	FROM Cars.dbo.car_scrape$) sub
WHERE loc LIKE 'Toyota'



SELECT SUBSTRING(TITLE, 0, 7)
FROM Cars.dbo.car_scrape$
WHERE title LIKE '%Toyota%'


SELECT location,
	CASE WHEN location = 'Lagos' THEN 'Lagos State'
		 WHEN location = 'Ogun' THEN  'Ogun State'
		 ELSE location
		 END
FROM Cars.dbo.car_scrape$


UPDATE Cars.dbo.car_scrape$
SET location = 	CASE WHEN location = 'Lagos' THEN 'Lagos State'
		 WHEN location = 'Ogun' THEN  'Ogun State'
		 WHEN location = 'Abuja' THEN  'Abuja'
		 ELSE location
		 END


-- 
UPDATE Cars.dbo.car_scrape$
SET location = 	CASE WHEN manufacturer = 'Land' THEN 'Land Rover'
		 WHEN manufacturer = 'MINI' THEN  'MINI COOPER'
		 WHEN manufacturer = ''	THEN 'Mercedes-Benz'
		 ELSE manufacturer
		 END



SELECT DISTINCT(manufacturer)
FROM Cars.dbo.car_scrape$
ORDER BY manufacturer

SELECT location, COUNT(location)
FROM Cars.dbo.car_scrape$
WHERE location = 'Abuja'
GROUP BY location


SELECT title, manufacturer
FROM Cars.dbo.car_scrape$
ORDER BY manufacturer


SELECT title, manufacturer
FROM Cars.dbo.car_scrape$
WHERE manufacturer = ''

UPDATE Cars.dbo.car_scrape$
SET manufacturer = 'Mercedes-Benz'
	WHERE title = 'Mercedes-Benz/52'









