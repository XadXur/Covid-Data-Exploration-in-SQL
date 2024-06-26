




select*
from PortfolioProject.dbo.CovidDeaths$
order by 3,4

--select*
--from PortfolioProject.dbo.CovidVaccinations$
--order by 3,4


--Looking at Total Cases vs Total Deaths

Select Location, Date, Total_Cases, Total_Deaths, (Total_Deaths/Total_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths$
Where Location = 'Russia'
Order By 1,2

--Looking at Total Cases vs Population
Select Location, Date, Total_Cases, Population, (Total_Cases/Population)*100 as InfectionPercentage
From PortfolioProject..CovidDeaths$
Where Location = 'United States'
Order By 1,2

-- Looking at countries with highest Infection Rate compared to Population
Select Location, Population, Max(Total_Cases) as HighestInfectionCount, Max((Total_Cases/Population))*100 as InfectionPercentage
From CovidDeaths$
Group By Location, Population
Order by InfectionPercentage Desc 

-- Showing countries with highest Death Count per Population
Select Location, Max(cast(Total_Deaths as Integer)) as TotalDeathCount
From CovidDeaths$
Where Continent is not Null
Group By Location
Order By TotalDeathCount Desc

-- LETS BREAK THINGS DOWN BY CONTINENT 
Select Continent, Max(cast(Total_Deaths as Integer)) as TotalDeathCount
From CovidDeaths$
Where Continent is not Null
Group By Continent
Order By TotalDeathCount Desc

Select Location, Max(cast(Total_Deaths as Integer)) as TotalDeathCount
From CovidDeaths$
Where Continent is Null
Group By Location
Order By TotalDeathCount Desc

-- Showing Continents with the Highest Death Count per Population
Select Location, Max(cast(Total_Deaths as Integer)) as TotalDeathCount
From CovidDeaths$
Where Continent is not Null
Group By Location
Order By TotalDeathCount Desc

--GLOBAL NUMBERS
Select Location, Date, Total_Cases, Total_Deaths, (Total_Deaths/Total_Cases)*100 as DeathPercentage
From CovidDeaths$
Where Continent is not Null 
Order By 1,2

-- Looking at Total Population vs Vaccination
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From CovidDeaths$ as dea
Join CovidVaccinations$ as vac
On dea.location = vac.location
And dea.date = vac.date
Where dea.continent is not Null
Order By 2,3


Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From CovidDeaths$ dea
Join CovidVaccinations$ vac
On dea.date = vac.date
And dea.location = vac.location
Where dea.continent is not Null
Order By 2,3
