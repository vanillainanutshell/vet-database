/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '01-12-2019';
SELECT name FROM animals WHERE neutered='true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pickachu';
SELECT name,escape_attempts FROM animals WHERE weight_Kg > 10.5;
SELECT * FROM animals WHERE neutered='true';
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
select * FROM animals;
COMMIT;
select * FROM animals;

BEGIN;
DELETE FROM animals;
select * FROM animals;
ROLLBACK;
select * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
SAVEPOINT save01;
UPDATE animals SET weight_kg = -1 * weight_kg;
ROLLBACK to save01;
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
select * FROM animals;
COMMIT;
select * FROM animals;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE neutered = false;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT * FROM (SELECT neutered as neutered, SUM(escape_attempts) as sum_escapes FROM animals GROUP BY neutered ORDER BY sum_escapes DESC) AS t LIMIT 1;
SELECT species, MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals  WHERE  date_of_birth >= '1990-01-01' AND date_of_birth < '2000-12-31' GROUP BY species;

SELECT name, owner_id FROM animals JOIN owners ON owner_id = owner_id AND owners.full_name = 'Melody Pond';
SELECT * FROM animals JOIN species ON species_id = species_id AND species.name = 'Pokemons';
SELECT * FROM owners LEFT JOIN animals ON owners.id = owner_id;
SELECT species.name, SUM(species_id) FROM animals JOIN species ON species_id = species.id GROUP BY species.name;
SELECT * FROM animals JOIN owners ON owner_id = owners.id and owners.full_name = 'Jennifer Orwell' JOIN species ON species.name = 'Digimon';
SELECT * FROM animals JOIN owners ON owner_id = owners.id and owners.full_name = 'Dean Winchester' WHERE escape_attempts = 0;
SELECT full_name, COUNT(owner_id) FROM animals JOIN owners ON owner_id = owners.id GROUP BY full_name ORDER BY count DESC LIMIT 1;
