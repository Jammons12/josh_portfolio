# US HOUSEHOLD INCOME DATA CLEANING

ALTER TABLE us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`
;

SELECT * 
FROM us_household_income
;

SELECT * 
FROM us_household_income_statistics
;


SELECT COUNT(id)
FROM us_household_income
;

SELECT COUNT(id)
FROM us_household_income_statistics
;


SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1
;

SELECT *
FROM (
SELECT row_id, 
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM us_household_income
) duplicates
WHERE row_num > 1
;


DELETE FROM us_household_income
WHERE row_id IN (
SELECT row_id
FROM (
SELECT row_id, 
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM us_household_income
) duplicates
WHERE row_num > 1)
;

SELECT id, COUNT(id)
FROM us_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1
;


SELECT DISTINCT State_Name, COUNT(State_Name)
FROM us_household_income
GROUP BY State_Name
;

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_name = 'georia'
;

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_name = 'alabama'
;

SELECT DISTINCT State_ab
FROM us_household_income
;

SELECT * 
FROM us_household_income
WHERE County = 'Autauga County'
AND City = 'Vinemont'
;

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE City = 'Vinemont'
AND County = 'Autauga County'
;



SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type
;


UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

SELECT ALand, AWater
FROM us_household_income
WHERE (AWater = 0 OR AWater = '' OR AWater IS NULL)
AND (ALand = 0 OR ALand = '' OR ALand IS NULL)
;



