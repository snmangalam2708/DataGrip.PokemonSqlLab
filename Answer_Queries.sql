USE pokemon;
SHOW TABLES;
SELECT * FROM pokemons;

/***************************PART 2***********************************/

SELECT * FROM types;
SELECT name FROM pokemons WHERE id = 45;
SELECT COUNT(id) FROM pokemons;
SELECT COUNT(id) FROM types;
SELECT COUNT(*) FROM pokemons WHERE secondary_type IS NOT NULL;

/***************************PART 3**********************************/

SELECT pokemons.name, types.name FROM types INNER JOIN pokemons ON types.id = pokemons.primary_type;;
SELECT name, secondary_type FROM pokemons WHERE name = 'Rufflet';
SELECT pokemons.name, pokemon_trainer.trainerID FROM pokemons INNER JOIN pokemon_trainer ON pokemons.id = pokemon_trainer.pokemon_id where trainerID = 303;
SELECT COUNT(*) FROM pokemons WHERE secondary_type = 7;
SELECT primary_type, COUNT(*) FROM pokemons GROUP BY primary_type;
SELECT trainers.trainername, COUNT(*) FROM pokemon_trainer, trainers WHERE pokelevel = 100 AND pokemon_trainer.trainerID = trainers.trainerID GROUP BY trainers.trainerID;
SELECT pokemon_id FROM pokemon_trainer GROUP BY pokemon_id HAVING COUNT(*) = 1;

/***************************PART 4**********************************/

/*Part 4 - HIGHEST BASED ON ATT, SPA, SPD TOTAL.*/
SELECT p.name AS pokemon_name, t.trainername AS trainer_name, pt.pokelevel AS level,
ptype.name AS type, stype.name AS sub_type, (attack + spatk + speed) AS AttSpaSpd
FROM pokemons AS p
JOIN pokemon_trainer AS pt
ON p.id = pt.pokemon_id
JOIN trainers AS t
ON pt.trainerID = t.trainerID
RIGHT JOIN types AS ptype
ON p.primary_type = ptype.id
LEFT JOIN types AS stype
ON p.secondary_type = stype.id
ORDER BY AttSpaSpd DESC;