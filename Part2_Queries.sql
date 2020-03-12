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

