/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
ALTER TABLE animals ADD species VARCHAR(50);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_owners
FOREIGN KEY(owner_id) REFERENCES owners(id);
ALTER TABLE animals ADD CONSTRAINT fk_species
FOREIGN KEY(species_id) REFERENCES species(id);