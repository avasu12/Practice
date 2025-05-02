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
