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