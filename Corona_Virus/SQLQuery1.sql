select * from Covid_Database;

--Q1. Write a code to check NULL values
SELECT *
FROM Covid_Database
WHERE Province IS NULL OR Country_Region IS NULL OR Latitude IS NULL OR Longitude IS NULL OR 
Dates IS NULL OR Confirmed IS NULL OR Deaths IS NULL OR Recovered IS NULL;
--Solution. There is no any Null values

--Q2. check total number of rows
select
	COUNT(*) as Total_rows 
FROM
	Covid_Database
-- Solution. There is total 78386 Rows in table

--Q4. Check what is start_date and end_date
SELECT
    MIN(Dates) AS start_date,
    MAX(Dates) AS end_date
FROM
    Covid_Database;

--Q4. Check what is start_date and end_date, Group by Province (Additional)
SELECT
	Province,
    MIN(Dates) AS start_date,
    MAX(Dates) AS end_date
FROM
    Covid_Database
GROUP BY
	Province
ORDER BY Province ASC;

-- Q5. Number of month present in dataset
SELECT
    COUNT(DISTINCT YEAR(Dates) * 100 + MONTH(Dates)) AS distinct_months_count
FROM
    Covid_Database;

--Q6. Find monthly average for confirmed, deaths, recovered
SELECT
	YEAR(Dates) as year,
	Month(Dates) as Month,
	AVG(Confirmed) as Avg_confirmed,
	AVG(Deaths) as Avg_Deaths,
	AVG(Recovered) as Avg_Recovered
FROM
	Covid_Database
GROUP BY 
	YEAR(Dates),
	Month(Dates)
order by
	year,
	month;

/*Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT 
    year(Dates) as year,
    month(Dates) as month,
    count(Confirmed) as value_Occurs
FROM
    Covid_Database
GROUP BY
    year(Dates), 
	month(Dates)
order by
	year,
	month*/

--Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT 
	YEAR(DATES) AS YEAR,
	 MIN(CASE WHEN Confirmed > 0 THEN Confirmed ELSE NULL END) AS min_confirmed,
    MIN(CASE WHEN Deaths > 0 THEN Deaths ELSE NULL END) AS min_deaths,
    MIN(CASE WHEN Recovered > 0 THEN Recovered ELSE NULL END) AS min_recovered
FROM 
	Covid_Database
GROUP BY 
	year(Dates)
ORDER BY
	year;

--Q9. Find Maximum values for confirmed, deaths, recovered per year
SELECT 
	YEAR(Dates) as Year,
	--MONTH(Dates) as Month,
	 MAX(Confirmed) as Max_Confirmed,
	 MAX(Deaths) as Max_Deaths,
	 MAX(Recovered) as Max_Recovered
FROM 
	Covid_Database
GROUP BY 
	year(Dates)
	--month(dates)
ORDER BY
	year;
	--month;

--Q.10 The total number of case of confirmed, deaths, recovered each month
SELECT 
	YEAR(Dates) as Year,
	Month(Dates) as Month,
	SUM(Confirmed) as Total_Confirmed,
	SUM(Deaths) as Total_Deaths,
	SUM(Recovered) as Total_Recovered
FROM
	Covid_Database
GROUP BY
	YEAR(Dates),
	MONTH(Dates)
ORDER BY
	year,
	month;

--	Q11. Check how corona virus spread out with respect to confirmed case
--  (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
    SUM(Confirmed) AS total_confirmed,
    ROUND(AVG(Confirmed),2) AS average_confirmed,
    ROUND(VAR(Confirmed),2) AS variance_confirmed,
    ROUND(STDEV(Confirmed),2) AS stdev_confirmed
FROM
    Covid_Database;

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
	YEAR(DATES) AS YEAR,
	MONTH(Dates) AS MONTH,
	ROUND(AVG(deaths),2) AS average_Deaths,
    ROUND(VAR(Deaths),2) AS variance_Deaths,
    ROUND(STDEV(Deaths),2) AS stdev_Deaths
FROM
	Covid_Database
GROUP BY
	YEAR(DATES),
	MONTH(DATES)
ORDER BY
	YEAR,
	MONTH;

-- Q13. Check how corona virus spread out with respect to recovered case
--(Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
    SUM(Recovered) AS total_Recovered,
    ROUND(AVG(Recovered),2) AS average_Recovered,
    ROUND(VAR(Recovered),2) AS variance_Recovered,
    ROUND(STDEV(Recovered),2) AS stdev_Recovered
FROM
    Covid_Database;

-- Q14. Find Country having highest number of the Confirmed case
SELECT 
	Country_Region,
	SUM(Confirmed) as Highest_confirmed
FROM
	Covid_Database
Group by
	Country_Region
order by
	Highest_confirmed desc

-- Q15. Find Country having lowest number of the death case
SELECT 
	Country_Region,
	SUM(Deaths) as lowest_Deaths
FROM
	Covid_Database
Group by
	Country_Region
order by
	lowest_Deaths ASC;

--Q16. Find top 5 countries having highest recovered case
SELECT TOP 5
	Country_Region,
	SUM(Recovered) as Highest_Recovered
FROM
	Covid_Database
Group by
	Country_Region
order by
	Highest_Recovered desc; 
	
