use world;
-- Questions 


-- Find the language spoken by the highest percentage of the population in each country.
select cl.countrycode ,cl.language ,cl.percentage
from countrylanguage as cl
join country as c on cl.countrycode = c.code
where cl.percentage=(
select max(cl2.percentage) 
from countrylanguage as cl2
where cl2.countrycode=cl.countrycode);

-- Retrieve all countries whose GNP is higher than the average GNP of all countries.
select  GNP , country.name as country_name from country
where GNP > (select  avg(GNP) as AVG_gnp from country);

-- List the top 5 countries with the highest life expectancy.
select  LifeExpectancy , name from country
order by LifeExpectancy desc
limit 5;

-- Retrieve all cities where the population is greater than 1 million.
select * from city
where Population > 1000000;

-- Find all countries in the 'Europe' continent.
select*from country
where Continent = 'Europe';

-- Select the names of all cities in the district 'California'.
select * from city
where district like 'California';

-- List all countries ordered by their population in descending order.
select * from country
order by population desc;

-- Get the top 10 cities with the highest population, ordered by population.
select * from city
order by population desc
limit 10;

-- Retrieve the names of countries along with their capital cities.
select country.name as countryName , city.name as cityname from country 
join city 
on country.capital=city.ID;

-- Find all cities and their respective countries in the continent 'Asia'.
select * from city c1
join country c2
on c2.Code = c1.CountryCode
where continent like 'Asia'; 

-- List all official languages spoken in each country.
select distinct(language),country.name from countrylanguage as OL
join country
on country.code = OL.CountryCode
where OL.isOfficial='T';

-- Find the total population of each continent.
select sum(population),continent from country
group by continent
order by continent;

-- Calculate the average life expectancy per region.
select avg(LifeExpectancy),region from country
group by region 
order by region asc;

-- List the number of countries in each continent.
select count(name) as total_country,continent from country
group by continent;

-- List continents where the average population of countries is greater than 50 million.
select continent , avg(population) avg_population  from country
group by continent 
having avg(population) > 50000000;

-- Find countries where more than 20% of the population speaks an official language.
 select name from country
 join countrylanguage
 on country.code = countrylanguage.countrycode
 where countrylanguage.isofficial='T'
 and countrylanguage.Percentage >20;
 
-- Find the countries whose population is greater than all cities in the city table.
select * from country
where population > (select max(population) from city);
-- Retrieve the name of the country with a population greater than all countries in the 'Europe' continent.
select name , population from country
where population > (SELECT MAX(population) from country
					where continent like 'Europe');
                    
-- Find the total population of each continent by joining country and city tables.
select sum(c1.population) as total_population,continent from country as ct
inner join city as c1 on
ct.code=c1.countrycode
group  by ct.continent;

-- List countries along with the number of cities they have with a population greater than 500,000.
select country_name.name as country_name , count(total_city.name) as total_city from country as country_name
inner join city as total_city
ON country_name.code = total_city.countrycode
where total_city.population > 500000
group by country_name.name;










