CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
)

INSERT INTO
rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White','River Delta'),
('Carol King','Mountain Range');


CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    conservation_status VARCHAR(20) NOT NULL
)

INSERT INTO species (common_name,scientific_name,discovery_date,conservation_status) VALUES
('Snow Leopard','Panthera uncia','1775-01-01','Endangered'),
('Bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered'),
('Hoolock Gibbon','Hoolock hoolock','1867-01-01','Endangered'),
('Indian Roofed Turtle','Pangshura tecta','1831-01-01','Vulnerable');


CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species (species_id) NOT NULL,
    ranger_id INT REFERENCES rangers (ranger_id) NOT NULL,
    sightings_time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes TEXT
);

INSERT INTO sightings (ranger_id, species_id, sightings_time, location, notes) VALUES
(1, 1, '2024-05-01 08:30:00', 'Northern Hills', 'Observed near riverbank'),
(1, 1, '2024-05-02 09:00:00', 'Northern Hills', 'Seen resting under tree'),
(2, 2, '2024-05-03 14:15:00', 'River Delta', 'Tracks found near water'),
(2, 2, '2024-05-04 15:45:00', 'River Delta', 'Roaring heard in the distance'),
(3, 3, '2024-05-05 10:00:00', 'Mountain Range', 'Feeding on bamboo'),
(3, 3, '2024-05-06 11:30:00', 'Mountain Range', 'Climbing a tree'),
(1, 2, '2024-05-18 18:30:00', 'Snowfall Pass', '');


SELECT * from rangers;
SELECT * from species;
SELECT * from sightings;

-- Problem - 1
INSERT INTO
    rangers (name, region)
VALUES ('Arif Rahman', 'Coastal Plains')

-- problem - 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- problem - 3
SELECT
    sighting_id,
    species_id,
    ranger_id,
    location,
    sightings_time,
    notes
FROM sightings
WHERE
    location ILIKE '%Pass%';

-- problem - 4
SELECT
    rangers.name AS ranger_name,
    COUNT(sightings.sighting_id) AS total_sightings
FROM rangers
    LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY
    rangers.ranger_id,
    rangers.name

-- problem - 5
SELECT common_name
FROM species
WHERE
    species_id NOT IN (
        SELECT species_id
        FROM sightings
    );

-- problem - 6
SELECT * FROM sightings ORDER BY sightings_time DESC LIMIT 2;

-- problem - 7
-- Update all species discovered before year 1800 to have status 'Historic'
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    discovery_date < '1800-01-01';


-- problem - 8
SELECT
    sighting_id,
    CASE
        WHEN EXTRACT(
            HOUR
            FROM sightings_time
        ) < 12 THEN 'Morning'
        WHEN EXTRACT(
            HOUR
            FROM sightings_time
        ) >= 12
        AND EXTRACT(
            HOUR
            FROM sightings_time
        ) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- prolem - 9
-- Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE
    ranger_id NOT IN (
        SELECT DISTINCT
            ranger_id
        FROM sightings
    );