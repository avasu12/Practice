/*
*/

select *
from test2;

select * from test3;

create table test4(
	identifier varchar(50),
	other_name varchar(100)
)

select * from test4;

insert into test4
values ('a3', 'Horror');

insert into test2
values ('a4');

alter table test2 
add column identifier varchar(50);

alter table test2
add column person_name varchar(100);

update test2
set person_name = 'four'
where identifier = 'a4';