SELECT *
FROM Cars.dbo.car_scrape$;

SELECT COUNT(*)
FROM Cars.dbo.car_scrape$ 

-- CREATING A COLUMN FOR MANUFACTURERS NAMES
ALTER TABLE Cars.dbo.car_scrape$
ADD manufacturer Nvarchar(255)
-- POPULATING COLUMN
UPDATE Cars.dbo.car_scrape$
SET manufacturer = SUBSTRING(title, 0, CHARINDEX(' ', title))

-- COUNTS OF MANUFACTURERS
SELECT	manufacturer,COUNT(manufacturer) AS Counts
FROM Cars.dbo.car_scrape$
GROUP BY manufacturer
ORDER BY Counts DESC;

-- COUNT OF VEHICLE TYPES
SELECT title, COUNT(title) AS Vehicles_Counts
FROM Cars.dbo.car_scrape$
GROUP BY title
ORDER BY Vehicles_Counts DESC;


-- MEDIUMS OF PURCHASE
SELECT isimported, COUNT(isimported) counts
FROM Cars.dbo.car_scrape$
GROUP BY isimported
ORDER BY counts desc;

-- hhow the mileage affects price  
SELECT title, odometer,price
FROM Cars.dbo.car_scrape$
ORDER BY odometer DESC;


-- STATES WITH MOST CARS
SELECT LOCATION, COUNT(location) AS Cars_Counts
FROM Cars.dbo.car_scrape$
GROUP BY location
ORDER BY Cars_Counts DESC;


-- maximum number of cars by state
SELECT DISTINCT(location), MAX(Counts)
FROM
	(SELECT location, title, COUNT(title) AS Counts
	FROM Cars.dbo.car_scrape$
	GROUP BY location, title
	ORDER BY Counts desc
	OFFSET 0 ROWS) sub
GROUP BY location
ORDER BY location;


-- engine types popularity
SELECT engine, COUNT(engine) AS engine_counts
FROM Cars.dbo.car_scrape$
GROUP BY engine
ORDER BY engine_counts DESC;


-- ENGINE TYPES BY PURCHASE MEDIUMS
SELECT engine, isimported, COUNT(engine) AS engine_counts
FROM Cars.dbo.car_scrape$
GROUP BY engine, isimported
ORDER BY engine_counts DESC;


-- transmission
SELECT transmission, COUNT(transmission)
FROM Cars.dbo.car_scrape$
GROUP BY transmission;

-- FUEL TYPE
SELECT fuel, COUNT([fuel])
FROM Cars.dbo.car_scrape$
GROUP BY fuel;


-- MOST POPULAR  CAR YEAR
SELECT title, year, COUNT(year) AS Counts
FROM Cars.dbo.car_scrape$
GROUP BY year, title
ORDER BY Counts DESC;


-- MOST PREFERRED CAR BY YEAR IN EACH STATE
SELECT location, title, year, COUNT(title) AS Counts
FROM Cars.dbo.car_scrape$
GROUP BY year, title, location 
ORDER BY Counts DESC;


-- updating the location
UPDATE Cars.dbo.car_scrape$
SET location = 'Ogun'
	WHERE location = 'Arepo ogun state'


SELECT location
FROM Cars.dbo.car_scrape$
WHERE location LIKE '%state%'










