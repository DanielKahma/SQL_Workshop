SELECT * FROM CITY;

SELECT * FROM CITY WHERE DISTRICT = 'aceh';

SELECT NAME FROM CITY WHERE COUNTRYCODE = 'bfa';

SELECT NAME, DISTRICT FROM CITY WHERE COUNTRYCODE = 'tto';

SELECT NAME AS nm, DISTRICT AS dist FROM CITY WHERE COURNTRYCODE = 'arm';

SELECT * FROM CITY WHERE NAME LIKE 'bor%';

SELECT * FROM CITY WHERE NAME LIKE '%ORTO%';

SELECT * FROM CITY WHERE POPULATION < 1000;

SELECT DISTINCT COUNTRYCODE FROM CITY WHERE POPULATION < 1000;

SELECT * FROM CITY WHERE COUNTRYCODE ='UKR' AND POPULATION > 1000000;

SELECT * FROM CITY WHERE POPULATION < 200 OR POPULATION > 9500000;

SELECT * FROM CITY WHERE COUNTRYCODE IN ('TJK', 'MRT', 'AND', 'PNG', 'SJM');

SELECT * FROM CITY WHERE POPULATION BETWEEN 200 AND 700;

SELECT * FROM CITY WHERE POPULATION BETWEEN 8000 AND 20000;

SELECT NAME FROM COUNTRY WHERE INDEPYEAR < 0;

SELECT * FROM COUNTRY WHERE INDEPYEAR IS NULL AND POPULATION > 1000000;

SELECT * FROM COUNTRY WHERE SURFACEAREA < 10 AND LIFEEXPECTANCY IS NOT NULL;
