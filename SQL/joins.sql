--Joining a table with itself

select a.entry_date, count(a.account_id) as pp_accts, count(b.account_id) as pp_accts_7dlater
from premium_accounts_by_day as a
left join premium_accounts_by_day as b
on a.entry_date+7 = b.entry_date
where a.final_price <> 0
group by a.entry_date;
