USE pokeexam2;

SELECT * FROM users;

SELECT * FROM pokes;

SELECT * FROM users 
LEFT JOIN pokes ON users.id = pokes.being_poked
WHERE users.id !=4;

SELECT users.id, users.first_name, users.last_name, users.alias, users.email, pokes.number_of_poke FROM users 
LEFT JOIN pokes ON users.id = pokes.being_poked
WHERE users.id !=4;

SELECT * FROM pokes WHERE being_poked = 4 ORDER BY number_of_poke DESC;

SELECT * FROM pokes;

UPDATE pokes SET number_of_poke = 7, updated_at= NOW() WHERE being_poked = 1 AND poking = 4;

UPDATE pokes SET number_of_poke = :number_of_poke, updated_at= NOW() WHERE being_poked = :being_poked;


SELECT users.first_name, pokes.number_of_poke FROM users
JOIN pokes ON users.id = pokes.poking
WHERE being_poked = 1 ORDER BY number_of_poke DESC;

SELECT * FROM pokes;
