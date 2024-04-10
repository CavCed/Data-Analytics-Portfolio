-- Selecting data that I am going to use
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM "CovidDeaths"
ORDER BY 1,2

-- looking at total cases vs total deaths / Relationship between contracting COVID and dying in different countries
SELECT location, date, total_cases::numeric, total_deaths::integer, total_deaths/total_cases*100 AS death_percentage
FROM "CovidDeaths"
WHERE location like '%States'
ORDER BY 1,2

-- looking at total cases vs population / Finding out percentage of population that got COVID in the United States
SELECT location, date, population, total_cases, (total_cases/population)*100 AS Covid_percentage
FROM "CovidDeaths"
WHERE location like '%States'
ORDER BY 1,2

-- Breaking down by countries --

-- Countries with highest infection rate compared to population
SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS percent_population_infected
FROM "CovidDeaths"
GROUP BY population, location
order by percent_population_infected desc

-- showing countries with highest death count per population
SELECT location, MAX(total_deaths) AS Total_death_count
FROM "CovidDeaths"
group by location
order by Total_death_count

-- breaking information by continent / total death count per continent
SELECT location, Max(total_deaths) as Total_death_count
FROM "CovidDeaths"
Where "Continent" IS NULL
group by location
order by Total_death_count

-- Breaking data down to GLOBAL scale --

-- Death percentage on a global scale
SELECT sum(new_cases::float) as Total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths)/(sum(new_cases)*1.00))*100 as Death_Percentage
FROM "CovidDeaths"

-- Total population vs Vaccinations
Select "Continent", dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
-- (RollingPeopleVaccinated/population)*100
From "CovidDeaths" dea
Join "CovidVaccinations" vac
	On dea.location = vac.location
	and dea.date = vac.date
where "Continent" is not null 
order by 2,3

-- Creating Temporary table to calcualte partition, or number of people vaccinated in each location
Create Table PercentPopulationVaccinated
(
Continent varchar(255),
Location varchar(255),
Date date,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
);

INSERT INTO PercentPopulationVaccinated
(Select "Continent", dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
,(RollingPeopleVaccinated/population)*100
From "CovidDeaths" dea
Join "CovidVaccinations" vac
	On dea.location = vac.location
	and dea.date = vac.date);


SELECT *, (RollingPeopleVaccinated/population)*100 AS PeopleVaccinated
From PercentPopulationVaccinated

-- Creating a View
CREATE VIEW "PercentPopulationVaccinated" as 
Select "Continent", dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
-- (RollingPeopleVaccinated/population)*100
From "CovidDeaths" dea
Join "CovidVaccinations" vac
	On dea.location = vac.location
	and dea.date = vac.date
where "Continent" is not null
