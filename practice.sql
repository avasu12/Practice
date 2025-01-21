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

<<<<<<< HEAD
select distinct city
from station
where left(city, 1) in ('a', 'e', 'i', 'o', 'u')
;

select (case when Occupation = 'Doctor' then Name else null end) as Doctor, (case when Occupation = 'Professor' then Name else null end), (case when Occupation = 'Singer' then Name else null end) as Singer, (case when Occupation = 'Actor' then Name else null end) as Actor
from occupations
=======
select concat(Name, "(", left(Occupation, 1), ")")
from occupations
order by Name asc
;

select concat("There are a total of ", count(occupation), " ", lower(Occupation), "s.")
from occupations
group by Occupation
order by count(Occupation)
>>>>>>> 3c2cf24bad94a43dd2f6b798f1cdf8538005b039
;