-- Active: 1747474886536@@127.0.0.1@5432@conservation_db

-- crate table
CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);




CREATE type thread_status AS ENUM ('Endangered', 'Vulnerable', 'Historic');

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
);



-- Insert Table Data
INSERT INTO rangers(name, region) VALUES
('Emily Rose', 'Western Forest'),
('Jake Carter', 'Savannah Border'),
('Liam Wells', 'Highland Cliffs');


INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status) VALUES
('Golden Langur', 'Trachypithecus geei', '1953-01-01', 'Endangered'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Vulnerable'),
('Great Indian Bustard', 'Ardeotis nigriceps', '1861-01-01', 'Endangered'),
('Nilgiri Marten', 'Martes gwatkinsii', '1832-01-01', 'Vulnerable');


INSERT INTO sightings(species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Hillview Post', '2024-05-09 06:20:00', 'Spotted near waterhole'),
(2, 2, 'Dry Rock Area', '2024-05-13 15:45:00', 'Scales found on ground'),
(3, 3, 'Open Grass Field', '2024-05-17 17:50:00', 'Seen during patrol'),
(1, 2, 'Snowfall Pass', '2024-05-20 19:10:00', 'Photographed from distance');


-- Problem Number 1 : Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers(name, region) VALUES
('Derek Fox', 'Coastal Plains');



-- Problem Number 2 : Count unique species ever sighted.
SELECT count(DISTINCT species_id) AS unique_species_sighted FROM sightings;



-- Problem Number 3 :  Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE "location" ILIKE '%Pass%';



-- Problem Number 4 : List each ranger's name and their total number of sightings.
SELECT rangers.name, COUNT(sightings.sighting_id) AS total_sightings
FROM rangers LEFT JOIN sightings
ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name ORDER BY rangers.name;



-- Problem Number 5 : List species that have never been sighted.
SELECT species.common_name FROM species
LEFT JOIN sightings ON species.species_id = sightings.species_id
WHERE sightings.sighting_id IS NULL;





SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;