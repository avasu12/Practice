/* 
Medium - Google
*/

with mytable as(
    select concat(user_firstname, ' ', user_lastname) as full_name, count(distinct video_id) as total_approved
    from user_flags as a
    inner join flag_review as b on a.flag_id = b.flag_id
    where b.reviewed_by_yt = true and b.reviewed_outcome = 'APPROVED'
    group by full_name
    order by total_approved desc
)
select full_name
from mytable
where total_approved = (select max(total_approved) from mytable);

-- Medium - Spotify

select distinct year_rank, group_name, song_name
from billboard_top_100_year_end
where year = 2010
order by year_rank
limit 10;

-- Medium - City of San Francisco
select distinct business_name, (
    case when business_name ilike '%restaurant%' then 'restaurant'
    when business_name ilike '%cafe%' or business_name ilike '%café%' or business_name ilike '%coffee%' then 'cafe'
    when business_name ilike '%school%' then 'school' 
    else 'other' end
) as business_class
from sf_restaurant_health_violations;

--Medium - Meta
select type, round(sum((case when processed is true then 1 else null end))::numeric/count(processed)::numeric, 2)
from facebook_complaints
group by type;

--Medium - Meta
select cust_id, sum(total_order_cost) as total_revenue
from orders
where extract(month from order_date) = 3 and extract(year from order_date) = 2019
group by cust_id
order by total_revenue desc;

--Medium - Google
select trim(unnest(string_to_array(lower(contents), ' ')), ',.') as word, count(*) as occurrences
from google_file_store
group by word;

--Medium - Tesla/Google
select survived, sum(case when pclass = 1 then 1 else 0 end) as "First class", sum(case when pclass = 2 then 1 else 0 end) as "Second class", sum(case when pclass = 3 then 1 else 0 end) as "Third class"
from titanic
group by survived;

--Medium - Amazon 
select salary
from employee
where salary < (select max(salary) from employee)
order by salary desc
limit 1;

--Medium - Dropbox
select salary
from employee
order by salary desc
offset 1
limit 1;

--Medium - Walmart
select e1.first_name, e1.salary
from employee e1
inner join employee e2 on e2.id = e1.manager_id and e1.salary > e2.salary;

--Medium - Asana
with new_table as(
    select department, first_name, salary, max(salary) over (partition by department) as max_salary
    from employee
)
select department, first_name, max_salary
from new_table
where salary = max_salary;

--Medium - Salesforce
select first_name, target
from salesforce_employees
where manager_id = 13 and target = (select max(target) from salesforce_employees where manager_id = 13);

--Medium - Walmart
select c.id, count(o.id) as total_orders
from customers as c
right join orders as o on c.id = o.cust_id
group by c.id
order by total_orders desc
limit 1;

--Medium - Shopify
select first_name, sum(total_order_cost) as order_cost, order_date
from customers as c
right join orders as o on c.id = o.cust_id
group by first_name, order_date
order by order_cost desc
limit 1;

--Medium - ESPN
select games, count(distinct name) as atheletes
from olympics_athletes_events
group by games
order by atheletes desc
limit 1;

--Medium - Spotify
select trackname, count(trackname) as rank_frequency 
from spotify_worldwide_daily_song_ranking
where position = 1
group by trackname
order by rank_frequency desc;

--Medium - Wine magazine
select winery
from winemag_p1
where lower(description) ~ '\y(plum|cherry|rose|hazelnut)\y';

--Medium - Yelp
select name, review_count
from yelp_business
order by review_count desc
limit 5;

--Medium - Yelp
explain
select name, review_count
from yelp_business
order by review_count desc
limit 5;

explain
with ranked_businesses as(
    select name, review_count, rank() over (order by review_count desc) as reviews_rank
    from yelp_business
)
select name, review_count
from ranked_businesses
where reviews_rank <= 5;

--Medium - Yelp
with category_table as (
    select unnest(string_to_array(categories, ';')) as category, review_count
    from yelp_business
)
select category, sum(review_count) as total_reviews
from category_table
group by category
order by total_reviews desc;

--Medium - Yelp
explain
select business_name, review_text
from yelp_reviews
where cool = (select max(cool) from yelp_reviews);

explain
with maxcool as (
    select max(cool) as bigcool
    from yelp_reviews
)
select business_name, review_text
from yelp_reviews
join maxcool on cool = bigcool;

--Medium - Meta
with energy_usage as (
    select * from fb_eu_energy
    union all
    select * from fb_asia_energy
    union all
    select * from fb_na_energy
), consumption_totals as(
    select date, sum(consumption) as total_consumption
    from energy_usage
    group by date
)
select *
from consumption_totals
where total_consumption = (select max(total_consumption) from consumption_totals);