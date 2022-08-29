CREATE TABLE tab_persons
(
    person_id  INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name TEXT NOT NULL,
    last_name  TEXT NOT NULL,
    is_delete BOOL NOT NULL DEFAULT FALSE
);

CREATE TABLE tab_person_phones
(
    person_phone_id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    person_id       INT  NOT NULL,
    phone           TEXT NOT NULL,
    is_delete BOOL NOT NULL DEFAULT FALSE,
    FOREIGN KEY (person_id) REFERENCES tab_persons(person_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE VIEW view_person_phones
AS SELECT last_name, first_name, phone
FROM tab_person_phones
JOIN tab_persons
    ON tab_person_phones.person_id = tab_persons.person_id
WHERE tab_persons.is_delete = FALSE AND
      tab_person_phones.is_delete = FALSE
ORDER BY last_name;

INSERT INTO tab_persons (first_name, last_name)
VALUES ('Andrey', 'Starinin'),
       ('Anonim', 'Anonimus'),
       ('Person', 'Persons');

INSERT INTO tab_person_phones (person_id, phone)
VALUES (1, '+79042144491'),
       (2, '+71231231212'),
       (1, '257-57-55'),
       ((SELECT person_id
         FROM tab_persons
         WHERE last_name = 'Persons'), '+7 123 123-12-12');
