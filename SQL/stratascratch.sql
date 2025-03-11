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