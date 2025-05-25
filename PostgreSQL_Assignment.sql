-- Active: 1747474886536@@127.0.0.1@5432@conservation_db

-- crate table
CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);


CREATE type thread_status AS ENUM ('Endangered', 'Vulnerable');

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY NOT NULL,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50),
    discovery_date DATE NOT NULL,
    conservation_status thread_status NOT NULL
);


CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY NOT NULL,
    ranger_id INTEGER NOT NULL REFERENCES rangers(ranger_id),
    species_id INTEGER NOT NULL REFERENCES species(species_id),
    sighting_time TIMESTAMP WITHOUT TIME ZONE,
    location VARCHAR(50) NOT NULL,
    notes TEXT
)