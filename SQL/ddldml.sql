/*

Selections

*/

select * from test2;
select * from test3;
select * from test4;


-- Definitions

create table test4(
	identifier varchar(50),
	other_name varchar(100)
)

-- Insertions

insert into test4
values ('a3', 'Horror');

insert into test2
values ('a4');

-- Schema alterations

alter table test2 
add column likeability integer;

alter table test2
add column person_name varchar(100);

-- Update records
update test2
set likeability = 89
where identifier = 'a3';


-- Selections
explain
select *
from test2
where likeability = 77 or likeability = 31;

explain
select * 
from test2
where likeability between 20 and 80;