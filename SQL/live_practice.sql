create table strings(
	contents varchar(200)
);

select * from strings;

insert into strings (contents)
values ('In a world where clouds wore polka dots, the rain danced a jig with every drop.');

select unnest(string_to_array(contents, ' '))
from strings;

insert into strings (contents)
values ('When the moon swapped hats with a disco ball, groovy shadows boogied with cackling squirrels.');