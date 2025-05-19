/*
Hackerrank problems
*/

-- Easy - aggregation
select count(*)
from city
where population > 100000;

select sum(population)
from city
where district = "California";

select avg(population)
from city
where district = 'California';

select floor(avg(population))
from city;

select sum(population)
from city
where countrycode = 'JPN';

select max(population) - min(population) as difference
from city;

select ceiling(avg(Salary) - avg(replace(Salary, 0, ''))) as error
from employees;

-- Easy - calculated columns
select salary*months as maximum_total_earnings, count(*) as total_max_staff
from Employee
where salary*months = (select max(salary*months) from Employee)
group by maximum_total_earnings;

-- Easy - expressions in group by & where
select salary*months as total_earnings, count(*) as total_number
from Employee
where (salary*months) = (select max(salary*months) from Employee)
group by salary*months;

-- Easy - Hash/sort with math function
select round(sum(lat_n), 2), round(sum(long_w), 2)
from station;

select round(sum(lat_n), 4)
from station
where lat_n between 38.7880 and 137.2345;

select round(max(lat_n), 4)
from station
where lat_n < 137.2345;

select round(long_w, 4)
from station
where lat_n = (
    select max(lat_n)
    from Station
    where lat_n < 137.2345
)
    

select round(min(lat_n), 4)
from Station
where lat_n > 38.7780;

select round(long_w, 4)
from station
where lat_n = (select min(lat_n) from station where lat_n > 38.7780)

select round(abs(max(lat_n) - min(lat_n)) + abs(max(long_w) - min(long_w)), 4)
from station;

select round(sqrt(power(min(lat_n) - max(lat_n), 2) + power(min(long_w) - max(long_w), 2)), 4)
from station;

select sum(city.population)
from country
inner join city on countrycode = code
where continent = 'Asia';

select city.name
from country
inner join city on countrycode = code
where continent = 'Africa';

select country.continent, floor(avg(city.population)) as average_population
from country
inner join city on code = countrycode
group by country.continent;

-- Easy - Recursive CTEs

with recursive cte as(
    select 1 as parameter
    union all
    select parameter + 1
    from cte
    where parameter < 20
)
select *
from cte;

-- Medium - multiple joins
select s.Name
from Students as s
inner join Friends as f on s.ID = f.ID
inner join Packages as p1 on s.ID = p1.ID
inner join Packages as p2 on f.Friend_ID = p2.ID
where p2.Salary > p1.Salary
order by p2.Salary asc;

-- Medium - Cross join
with indexed_Functions as(
    select *, row_number() over () as index_col
    from Functions
)
select distinct f1.x, f1.y
from indexed_Functions as f1
cross join indexed_Functions as f2
where f1.index_col <> f2.index_col and f1.x <= f1.y and f1.x = f2.y and f1.y = f2.x
order by f1.x;

-- Medium - inner join using between
select case when Grade < 8 then null else Name end, Grade, Marks
from Students
inner join Grades on Marks between Min_Mark and Max_Mark
order by Grade desc, Name asc, Marks asc;