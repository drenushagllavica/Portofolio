---Fatal Encounters Data Exploration
---Dataset was taken from Fatal encounters website

---I told MS SQL to use the Portofolio database that I created in order to store the datasets that I am going to work with.
USE Portofolio

---A preview of the dataset tham I am going to work with
SELECT *
FROM fatal


---Checking which gender is killed more
SELECT Gender, COUNT(Gender) AS Gender_count
FROM fatal
GROUP BY Gender
ORDER BY gender_count DESC


---Checking which race is killed more
SELECT Race, COUNT(Race) AS Race_count
FROM fatal
GROUP BY Race
ORDER BY Race_count DESC


---Checking age of the victims, top 15 most killed ages
SELECT TOP 15 Age, COUNT(Age) AS Age_count
FROM fatal
GROUP BY Age
ORDER BY Age_count DESC


---Checking each state and saving it as a VIEW to store data for later visualizations
CREATE VIEW deathperstate AS
(
SELECT State, COUNT(State) AS State_count
FROM fatal
GROUP BY State
)


---Checking 20 top cities where fatal encounters happened
SELECT TOP 20 State, Location_of_death_city, COUNT(Location_of_death_city) AS highest_count_cities
FROM fatal
GROUP BY Location_of_death_city, State
ORDER BY highest_count_cities DESC


---Checking 20 top counties where fatal encounters happened
SELECT TOP 20 State, Location_of_death_county, COUNT(Location_of_death_county) AS highest_count_counties
FROM fatal
GROUP BY Location_of_death_county, State
ORDER BY highest_count_counties DESC


---Checking the date with the highest deaths
SELECT TOP 20 State, Date_of_death, COUNT(Date_of_death) AS highest_death_year
FROM fatal
GROUP BY Date_of_death, State
ORDER BY highest_death_year DESC



--- Creating a temporary table
DROP TABLE IF EXISTS #FatalEncounters
CREATE TABLE #FatalEncounters
(
Name nvarchar(255),
State nvarchar(255),
Gender nvarchar(255),
Date_of_death datetime,
Age nvarchar(255),
)


INSERT INTO #FatalEncounters
SELECT fatal.Name, fatal.State, fatal.Gender, fatal.Date_of_death, fatal.Age
From fatal
Select *
From #FatalEncounters

