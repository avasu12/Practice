--Joining a table with itself

select a.entry_date, count(a.account_id) as pp_accts, count(b.account_id) as pp_accts_7dlater
from premium_accounts_by_day as a
left join premium_accounts_by_day as b
on a.entry_date+7 = b.entry_date
where a.final_price <> 0
group by a.entry_date;

select a.entry_date, count(a.account_id) as prem_accts, count(b.account_id) as still_premium
from premium_accounts_by_day as a
left join premium_accounts_by_day as b
on a.account_id = b.account_id
and b.entry_date - a.entry_date = 7 and b.final_price > 0
where a.final_price > 0
group by a.entry_date
order by a.entry_date
limit 7;