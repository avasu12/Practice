select name from city where countrycode = 'JPN';
select distinct city from station where ID % 2 = 0;
select count(city) - count(distinct city) from station;

select city, length(city) from station order by length(city) desc limit 1;
select city, length(city) from station order by length(city), city asc limit 1;

select count(movie) 
from oscar_nominees
where nominee = 'Abigail Breslin';

select hotel_name,reviewer_score, count(*) 
from hotel_reviews
where hotel_name = 'Hotel Arena'
group by hotel_name, reviewer_score;

select child_asin, parent_asin, campaign_name, sum(spend)
from sales_and_traffic
right join advertised_asin on child_asin = promoted_asin
where brand = 'Stucco'
group by campaign_name, parent_asin, child_asin;

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
OFFSET

*/

/*

Index of concepts:
1. Operators
    i. Pattern matching: ilike, like, ~
    ii. 
2. Functions
    i. CASE WHEN ... THEN ... ELSE ... END
    ii. NULLIF
    iii. String - lower()
3. Delimiters:
    i. ' - String literals
    ii. " - Identifiers
    iii. () - Function arguments

*/

select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u');

/*

Conditional Expressions

*/
select (case when Occupation = 'Doctor' then Name else null end) as Doctor, (case when Occupation = 'Professor' then Name else null end), (case when Occupation = 'Singer' then Name else null end) as Singer, (case when Occupation = 'Actor' then Name else null end) as Actor
from occupations;

select (count(case when country = 'USA' then user_id end) / count(user_id)) as US_Share
from fb_active_users
where status = 'open';


select artist, count(id) as occurence
from spotify_worldwide_daily_song_ranking
group by artist
order by occurence desc;

select distinct hotel_name, total_number_of_reviews
from hotel_reviews
order by total_number_of_reviews desc;

select *, count(emp_id) as total_staff
from emp_table
group by mgr_id
having total_staff <= 2;

/*

DAX-SQL Comparisons

DAX: MONTH(<datetime>), COUNT()
SQL: EXTRACT(part FROM date), COUNT()

*/


select client_id, extract(month from time_id) as month, count(distinct user_id)
from fact_events
group by client_id, month;

/*

DAX: A "group by" is possible with SUMMARIZE()

*/
select department, first_name, max(salary)
from employee
group by department, first_name;

-- Context doesn't exist in SQL
-- ALL: removes all context filters (query context: row & column filters, slicers, and report filters)
-- ALLSELECTED: removes selected context filters (Only selected row & column filters. slicers & report filters still take effect)
-- SQL simply filters using "WHERE"

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

select first_name, order_date, order_details, total_order_cost
from customers
inner join orders on customers.id = cust_id
where first_name = 'Jill' or first_name = 'Eva'
order by customers.id asc;

select location, avg(popularity) as average_popularity
from facebook_employees
inner join facebook_hack_survey on employee_id = id
group by location;

select distinct p.post_date, p.post_id, p.post_keywords, p.post_text, p.poster
from facebook_reactions as r
left join facebook_posts as p on r.post_id = p.post_id
where reaction = 'heart';

-- Join a table by itself
select account_id, entry_date
from premium_accounts_by_day a
left join premium_accounts_by_day b
where a.inal_price > 0;

/* 

Views help you look at a table in a different way (focused, or simplified)
Views might be associated with access control
They don't take up more storage; they're virtual tables

*/

create view players as
select username, nation, avatar
from biome3dusers;


/* 

Common table expressions: they're like variables that temporarily hold tables (until a query is done running). 
Something like "with" in python.

*/

with department_average as (
    select department, avg(salary) as average_salary
    from employee
    group by department
)
select e.department, first_name, salary, average_salary
from employee as e
inner join department_average on e.department = department_average.department;

select * 
from sat_scores;

with middle as (
    select max(data_index)/2 as median_row, 
    (case when max(data_index)%2 = 0  then max(data_index)/2 else (max(data_index)/2) + 1 end) as next_row
    from (
        select sat_writing, row_number() over () as data_index
        from sat_scores
    ) as numbered_scores
), median_score as (
    select sat_writing, median_row, next_row, row_number() over () as row_index
    from sat_scores
    natural join middle
) select *
from median_score;

with row_table as(
    select id, sat_writing, row_number() over (order by sat_writing) as row_index
    from sat_scores
), median_table as(
    select max(row_index)/2 as middle, (case when max(row_index)%2 = 0 then max(row_index)/2 else (max(row_index)/2)+1 end) as middle_next
    from row_table
), median_score as(
    select avg(sat_writing) as median_value
    from row_table
    inner join median_table on row_index = middle or row_index = middle_next
) select id
from sat_scores
inner join median_score on sat_writing = median_value;

with counts_table as (
    select candidate, round(cast(1 as numeric)/nullif(cast(count(candidate) as numeric), 0), 2) as weight
    from voting_results
    group by candidate
    order by candidate
), tally as (
    select v.candidate, v.voter, sum(c.weight) as total_votes
    from voting_results as v
    inner join counts_table as c on c.candidate = v.candidate
    group by v.voter, v.candidate
    order by total_votes desc
)
select *
from tally;

/* 

Operators

*/
-- ilike is case insenstive
select employeename, basepay
from sf_public_salaries
where jobtitle ilike '%CAPTAIN%';


/*

Data types: SQL

*/

-- boolean: true/false
select distinct home_library_code
from library_usage
where circulation_active_year = 2016 
    and notice_preference_definition = 'email'
    and provided_email_address = false;

-- yearly_salary is bigint. It is 8 bytes long, or 64 bits long
select * 
from lyft_drivers
where yearly_salary <= 30000 or yearly_salary >= 70000;

-- end_time is of type "timestamp (without timezone)" it is 8 bytes, or 64 bits long
select bike_number, max(end_time) as last_use
from dc_bikeshare_q1_2012
group by bike_number
order by last_use desc;

-- the name columns are of type "text" they can be of variable, unlimited length
select id, first_name, last_name, department_id, max(salary) as current_salary
from ms_employee_salary
group by id, first_name, last_name, department_id
order by id;

select abs(
    max(
        case when d.department = 'marketing' then salary end
    ) - max(
        case when d.department = 'engineering' then salary end
    )
) as absolute_difference
from db_employee as e
inner join db_dept as d on e.department_id = d.id
where d.department = 'marketing' or d.department = 'engineering';


/*

Window functions
Windows are a subset of rows that you can perform operations on
It's like aggregating, but without losing rows

*/

select id, sale_date, amount, 
sum(amount) over (partition by id order by sale_date)
from sales
order by id;

select account_id, final_price, avg(final_price) over (partition by account_id)
from premium_accounts_by_day
order by account_id;

-- This creates a window that is the whole table. 
select account_id, final_price, avg(final_price) over ()
from premium_accounts_by_day
order by account_id;

select student_id, row_number() over ()
from sat_scores;


/*

Sorting

*/

-- This sorts by username in ascending order
select id, username, department
from employee
order by 2;

-- The records in a window can be ordered
select id, row_number() over (partition by department order by id) as row_num
from employee;


/*

Math functions

*/

select random()
from sample_table;

with vote_weights as(
    select *, round(cast(1 as numeric), 3)/count(voter) over (partition by voter) as weight
    from voting_results
), tally as (
    select candidate, sum(weight) as total_votes
    from vote_weights
    group by candidate
    order by total_votes desc
), ranked_tally as (
    select *, rank() over (order by total_votes desc) as candidate_rank
    from tally
    where candidate is not null
) select candidate
from ranked_tally
where candidate_rank = 1;

/*

Text functions

*/

select video_id, count(distinct concat(user_firstname, user_lastname)) from user_flags
where flag_id is not null
group by video_id;

/*

Subqueries

*/

select *
from sample_table
where average_sales > (select max(sales) from sample_table)

select *
from student_performance
where average_stanine < (select max(score) from student_scores);

/*

Display random text

*/

select entry_date, count(distinct account_id) as no_prem_paid, 'random_text' as days_later
from premium_accounts_by_day
group by entry_date;

