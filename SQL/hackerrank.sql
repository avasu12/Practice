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