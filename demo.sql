SELECT last_name, first_name, phone
FROM tab_persons,
     tab_person_phones
WHERE tab_persons.person_id = tab_person_phones.person_id
ORDER BY last_name;

SELECT *
FROM tab_persons;

SELECT *
FROM tab_person_phones;

UPDATE tab_person_phones
SET person_id = (SELECT person_id
                 FROM tab_persons
                 WHERE last_name = 'Persons')
WHERE person_id = (SELECT person_id
                   FROM tab_persons
                   WHERE last_name = 'Anonimus');

DELETE
FROM tab_person_phones
WHERE person_id = (SELECT person_id FROM tab_persons WHERE last_name = 'Persons');

DELETE
FROM tab_persons
WHERE person_id = 3;

SELECT *
FROM view_person_phones
WHERE last_name = 'Starinin';

SELECT last_name, first_name, phone
FROM tab_persons,
     tab_person_phones
WHERE tab_persons.person_id = tab_person_phones.person_id AND
      tab_persons.is_delete = FALSE AND
      tab_person_phones.is_delete = FALSE
ORDER BY last_name;

SELECT last_name, first_name, phone
FROM tab_person_phones
JOIN tab_persons
    ON tab_person_phones.person_id = tab_persons.person_id
WHERE tab_persons.is_delete = FALSE AND
      tab_person_phones.is_delete = FALSE
ORDER BY last_name;