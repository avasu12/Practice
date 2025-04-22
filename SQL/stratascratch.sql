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

--Medium - City of SanFrancisco
with total_comp as(
    select employee_title, sex, salary, sum(bonus) as bonus_pay
    from sf_employee as e
    inner join sf_bonus as b on e.id = b.worker_ref_id
    group by employee_title, sex, salary
)
select employee_title, sex, avg(salary + bonus_pay) as avg_comp
from total_comp
group by employee_title, sex;

--Medium - Airbnb
select distinct h.host_id, g.guest_id
from airbnb_hosts as h
inner join airbnb_guests as g on h.gender = g.gender and h.nationality = g.nationality;

--Medium - Google/Amazon
select (count(case when address <> '' then c.id else null end)::decimal/count(c.id)::decimal)*100 as percentage
from orders as o
inner join customers as c on o.cust_id = c.id;


--Medium - Meta
select post_date, (sum(case when post_keywords = '[#spam#]' then 1 else null end)::decimal/count(*)::decimal)*100 as spam_percentage
from facebook_posts as p
inner join facebook_post_views as v on p.post_id = v.post_id
group by post_date;

--Medium - Apple/Google
select language, count(distinct case when device in ('ipad air', 'iphone 5s', 'macbook pro') then u.user_id else null end), count(distinct u.user_id) as total_users
from playbook_users as u
inner join playbook_events as e on u.user_id = e.user_id
group by language
order by total_users desc;

--Medium - Instacart/Amazon
select distinct c.first_name
from customers as c
left join orders as o on c.id = o.cust_id
except
select distinct c.first_name
from customers as c
inner join orders as o on c.id = o.cust_id
where o.order_date between '2019-02-01' and '2019-03-01';

--Medium - Airbnb
explain
select h.nationality, count(distinct u.unit_id) as total_apartments
from airbnb_hosts as h
inner join airbnb_units as u on h.host_id = u.host_id and h.age < 30 and unit_type = 'Apartment'
--where h.age < 30
group by h.nationality
order by total_apartments desc;

explain
select h.nationality, count(distinct u.unit_id) as total_apartments
from airbnb_hosts as h
inner join airbnb_units as u on h.host_id = u.host_id and h.age < 30 
where h.age < 30 and unit_type = 'Apartment' 
group by h.nationality
order by total_apartments desc;

--Medium - Airbnb
with guest_messages as(
    select id_guest, sum(n_messages) as total_messages
    from airbnb_contacts
    group by id_guest
    order by total_messages desc
)
select dense_rank() over (order by total_messages desc) as guest_rank, *
from guest_messages;


--Medium - City of SanFrancisco
select business_postal_code, count(distinct case when business_address ~ '^[0-9]' then lower(split_part(business_address, ' ', 2)) else lower(split_part(business_address, ' ', 1)) end) as total_streets
from sf_restaurant_health_violations
where business_postal_code is not null
group by business_postal_code
order by total_streets desc, business_postal_code asc;

--Medium - Meta
select a.date, count(b.user_id_sender)::numeric/count(a.user_id_sender)::numeric as acceptance_rate
from fb_friend_requests as a
left join fb_friend_requests as b on a.user_id_sender = b.user_id_sender and a.user_id_receiver = b.user_id_receiver and a.action ='sent' and b.action = 'accepted'
where a.action = 'sent'
group by a.date;

--Medium - Meta
select count(case when clicked = 1 and search_results_position between 1 and 3 then 1 else null end)*100::numeric/count(*)::numeric as percent_clicked, count(case when clicked = 0 and search_results_position between 1 and 3 then 1 else null end)*100::numeric/count(*)::numeric as percent_not_clicked
from fb_search_events;

--Medium - Meta
select count(case when status = 'closed' then 1 else null end)::numeric/count(*)::numeric as closed_ratio
from fb_account_status
where date = '2020-01-10';

--Medium - Linkedin
select a.title, a.budget, ceiling(sum((c.salary::numeric/365)*(a.end_date-a.start_date))) as prorated
from linkedin_projects as a
inner join linkedin_emp_projects as b on a.id = b.project_id
inner join linkedin_employees as c on b.emp_id = c.id
group by a.title, a.budget
having a.budget < ceiling(sum((c.salary::numeric/365)*(a.end_date-a.start_date)));

--Medium - Tesla
select company_name, count(case when year = 2020 then 1 else null end)- count(case when year = 2019 then 1 else null end) as net_difference
from car_launches
group by company_name;

--Medium - Amazon
select distinct a.user_id
from amazon_transactions as a
inner join amazon_transactions as b on a.user_id = b.user_id and (a.created_at between b.created_at and b.created_at+7) and a.id <> b.id;

--Medium - Google
with sub_table as(
select from_user, count(to_user) as total_emails
from google_gmail_emails
group by from_user
)
select from_user, total_emails, row_number() over (order by total_emails desc, from_user asc) as activity_rank
from sub_table;

select from_user, count(to_user) as total_emails, row_number() over (order by count(to_user) desc, from_user asc)
from google_gmail_emails
group by from_user;
