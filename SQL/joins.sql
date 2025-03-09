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

select * 
from user_flags as a
inner join user_flags as b on a.user_firstname = b.user_firstname
right join user_flags as c on a.user_firstname = c.user_firstname
;


-- Multiple types of joins over various tables
select *
from customers as a
inner join orders as b on a.customer_id = b.customer_id
right join payments as c on a.customer_id = c.customer_id
left join payments as d on a.customer_id = d.customer_id;

select *
from employees as e1
inner join employees as e2 on e1.id = e2.mgr_id
right join department as d on e1.dept_id = e1.dept_id;

select * from test2;
select * from test4;

select *
from test2 as a
inner join test4 as b on a.identifier = b.identifier;

select *
from test2 as a
full outer join test4 as b on a.identifier = b.identifier;

select *
from test2 as a
left join test4 as b on a.identifier = b.identifier;

select *
from test2 as a
right join test4 as b on a.identifier = b.identifier;

select * 
from test2 as a
inner join test4 as b on a.identifier = b.identifier
right join test2 as c on a.identifier = c.identifier;