select name from city where countrycode = 'JPN';
select distinct city from station where ID % 2 = 0;
select count(city) - count(distinct city) from station;

select city, length(city) from station order by length(city) desc limit 1;
select city, length(city) from station order by length(city), city asc limit 1;

/*
SQL Query order of execution:

FROM
JOIN ON
WHERE
GROUP BY
HAVING

SELECT
ORDER BY
LIMIT

*/

select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u');

select (case when Occupation = 'Doctor' then Name else null end) as Doctor, (case when Occupation = 'Professor' then Name else null end), (case when Occupation = 'Singer' then Name else null end) as Singer, (case when Occupation = 'Actor' then Name else null end) as Actor
from occupations;

/*

DAX: MONTH(<datetime>), COUNT()
SQL: EXTRACT(part FROM date), COUNT()

*/


select client_id, extract(month from time_id) as month, count(distinct user_id)
from fact_events
group by client_id, month;

/* 

Group by defines the granularity of aggregation.

*/
select city, property_type, avg(bathrooms), avg(bedrooms)
from airbnb_search_details
group by city, property_type
order by city

select concat(extract(year from shipment_date), '-', extract(month from shipment_date)) as year_month, count(sub_id & shipment_id) as shipments
from amazon_shipment
group by year_month;


select product_id, sum(cost_in_dollars * units_sold) as total_revenue
from online_orders
where date between '2022-01-1' and '2022-06-30'
group by product_id
order by total_revenue desc
limit 5;


select event_name, count(event_name) as eventcount
from playbook_events
where device = 'macbook pro'
group by event_name
order by eventcount desc;

select activity_date, pe_description
from los_angeles_restaurant_health_inspections
where facility_name = 'STREET CHURROS' and score < 95;

select extract(year from inspection_date) as year, count(violation_id) 
from sf_restaurant_health_violations
where business_name = 'Roxanne Cafe'
group by year;

-- Employees that joined after April (any year)

select count(worker_id)
from worker
where department = 'Admin' and extract(month from joining_date) between 4 and 12;

select department, count(worker_id)
from worker
where extract(month from joining_date) between 4 and 12
group by department;


/* 

The almighty join.
Why does every recruiter love this?

*/

select first_name, last_name, city, order_details
from customers
left join orders on cust_id = customers.id
order by first_name asc, order_details asc;

/* 

Views help you look at a table in a different way (focused, or simplified)
Views might be associated with access control
They don't take up more storage; they're virtual tables

*/

create view players as
select username, nation, avatar
from biome3dusers;