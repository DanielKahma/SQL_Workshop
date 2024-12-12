-- 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM CITY WHERE NAME LIKE 'ping%' ORDER BY POPULATION ASC;

-- 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM CITY WHERE NAME LIKE 'ran%' ORDER BY POPULATION DESC;

-- 3: Count all cities
SELECT COUNT(*) FROM CITY;

-- 4: Get the average population of all cities
SELECT AVG(POPULATION) FROM CITY;

-- 5: Get the biggest population found in any of the cities
SELECT MAX(POPULATION) FROM CITY;

-- 6: Get the smallest population found in any of the cities
SELECT MIN(POPULATION) FROM CITY;

-- 7: Sum the population of all cities with a population below 10000
SELECT SUM(POPULATION) FROM CITY WHERE POPULATION < 10000;

-- 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(*) FROM CITY WHERE COUNTRYCODE IN ('MOZ', 'VNM');

-- 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT COUNTRYCODE, COUNT(*) FROM CITY WHERE COUNTRYCODE IN ('MOZ', 'VNM') GROUP BY COUNTRYCODE;

-- 10: Get average population of cities in MOZ and VNM
SELECT COUNTRYCODE, AVG(POPULATION) FROM CITY WHERE COUNTRYCODE IN ('MOZ', 'VNM') GROUP BY COUNTRYCODE;

-- 11: Get the countrycodes with more than 200 cities
SELECT COUNTRYCODE FROM CITY GROUP BY COUNTRYCODE HAVING COUNT(*) > 200;

-- 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT COUNTRYCODE FROM CITY GROUP BY COUNTRYCODE HAVING COUNT(*) > 200 ORDER BY COUNT(*) ASC;

-- 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT NAME, LANGUAGE FROM CITY JOIN COUNTRYLANGUAGE ON CITY.COUNTRYCODE = COUNTRYLANGUAGE.COUNTRYCODE WHERE POPULATION BETWEEN 400 AND 500;

-- 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT NAME, LANGUAGE FROM CITY COUNTRY JOIN COUNTRYLANGUAGE ON COUNTRY.COUNTRYCODE = COUNTRYLANGUAGE.COUNTRYCODE WHERE COUNTRY.POPULATION BETWEEN 500 AND 600;

-- 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT NAME FROM CITY WHERE COUNTRYCODE = (SELECT COUNTRYCODE FROM CITY WHERE POPULATION = 122199);

-- 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT NAME FROM CITY WHERE COUNTRYCODE = (SELECT COUNTRYCODE FROM CITY WHERE POPULATION = 122199) AND POPULATION != 122199;

-- 17: What are the city names in the country where Luanda is capital?
SELECT CITY.NAME FROM CITY JOIN COUNTRY ON CITY.COUNTRYCODE = CODE WHERE COUNTRY.CAPITAL = (SELECT ID FROM CITY WHERE NAME= 'LUANDA');

-- 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT C.NAME FROM CITY C JOIN COUNTRY CO ON C.ID = CO.CAPITAL WHERE CO.REGION = (SELECT CO2.REGION FROM CITY C2 JOIN COUNTRY CO2 ON C2.COUNTRYCODE = CO2.CODE WHERE C2.NAME = 'YAREN');

-- 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT CL.LANGUAGE FROM COUNTRYLANGUAGE CL JOIN COUNTRY CO ON CL.COUNTRYCODE = CO.CODE WHERE CO.REGION = (SELECT CO2.REGION FROM CITY C2 JOIN COUNTRY CO2 ON C2.COUNTRYCODE = CO2.CODE WHERE C2.NAME = 'RIGA');

-- 20: Get the name of the most populous city
SELECT NAME FROM CITY ORDER BY POPULATION DESC LIMIT 1;