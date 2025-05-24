-- Active: 1747474886536@@127.0.0.1@5432@conservation_db

-- crate table
CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
)

