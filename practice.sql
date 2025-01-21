select name from city where countrycode = 'JPN';
select distinct city from station where ID % 2 = 0;
select count(city) - count(distinct city) from station;

select city, length(city) from station order by length(city) desc limit 1;
select city, length(city) from station order by length(city), city asc limit 1;

/*
SQL Query order of execution:

FROM
JOIN ON
WHERE
GROUP BY
HAVING

SELECT
ORDER BY
LIMIT

*/

select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u')
;

select (case when Occupation = 'Doctor' then Name else null end) as Doctor, (case when Occupation = 'Professor' then Name else null end), (case when Occupation = 'Singer' then Name else null end) as Singer, (case when Occupation = 'Actor' then Name else null end) as Actor
from occupations
;