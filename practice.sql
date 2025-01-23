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
where left(city, 1) in ('a', 'e', 'i', 'o', 'u')
;

select (case when Occupation = 'Doctor' then Name else null end) as Doctor, (case when Occupation = 'Professor' then Name else null end), (case when Occupation = 'Singer' then Name else null end) as Singer, (case when Occupation = 'Actor' then Name else null end) as Actor
from occupations
;

/*

DAX: MONTH(<datetime>), COUNT()
SQL: EXTRACT(part FROM date), COUNT()

*/


select client_id, extract(month from time_id) as month, count(distinct user_id)
from fact_events
group by client_id, month
;


select concat(extract(year from shipment_date), '-', extract(month from shipment_date)) as year_month, count(sub_id & shipment_id) as shipments
from amazon_shipment
group by year_month
;


select product_id, sum(cost_in_dollars * units_sold) as total_revenue
from online_orders
where date between '2022-01-1' and '2022-06-30'
group by product_id
order by total_revenue desc
limit 5
;