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