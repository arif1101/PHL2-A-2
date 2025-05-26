-- Active: 1747802128488@@127.0.0.1@5432@wildlife
-- assingment-2 on DB

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
)

INSERT INTO
    rangers (name, region)
VALUES ('Arifur Rahman', 'Sundarbans'),
    (
        'Rakib Ahmed',
        'Chittagong Hill Tracts'
    ),
    (
        'Jhankar Mahbub',
        'Bandarban Tract'
    ),
    (
        'Mizan Rahman',
        'Sylhet Forest'
    ),
    (
        'Faisal Mahbub',
        'Madhupur Jungle'
    )

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    conservation_status VARCHAR(20) NOT NULL,
    CONSTRAINT conservation_status_check CHECK (
        conservation_status IN ('Endangered', 'Vulnerable')
    )
)

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Bengal Tiger',
        'Panthera tigris tigris',
        '2001-05-20',
        'Endangered'
    ),
    (
        'Asian Elephant',
        'Elephas maximus',
        '2002-03-15',
        'Endangered'
    ),
    (
        'Saltwater Crocodile',
        'Crocodylus porosus',
        '2003-07-10',
        'Vulnerable'
    ),
    (
        'Ganges River Dolphin',
        'Platanista gangetica',
        '2004-09-22',
        'Endangered'
    ),
    (
        'Hoolock Gibbon',
        'Hoolock hoolock',
        '2005-11-30',
        'Endangered'
    ),
    (
        'Fishing Cat',
        'Prionailurus viverrinus',
        '2006-01-12',
        'Vulnerable'
    ),
    (
        'Indian Python',
        'Python molurus',
        '2007-04-18',
        'Vulnerable'
    ),
    (
        'Leopard Cat',
        'Prionailurus bengalensis',
        '2008-06-25',
        'Vulnerable'
    ),
    (
        'Clouded Leopard',
        'Neofelis nebulosa',
        '2009-08-14',
        'Vulnerable'
    ),
    (
        'Red Junglefowl',
        'Gallus gallus',
        '2010-10-05',
        'Vulnerable'
    ),
    (
        'Black Softshell Turtle',
        'Nilssonia nigricans',
        '2011-12-19',
        'Endangered'
    ),
    (
        'Pangolin',
        'Manis crassicaudata',
        '2012-02-28',
        'Endangered'
    ),
    (
        'Sloth Bear',
        'Melursus ursinus',
        '2013-03-17',
        'Vulnerable'
    ),
    (
        'Smooth-coated Otter',
        'Lutrogale perspicillata',
        '2014-05-23',
        'Vulnerable'
    ),
    (
        'Greater Adjutant',
        'Leptoptilos dubius',
        '2015-07-09',
        'Endangered'
    ),
    (
        'White-rumped Vulture',
        'Gyps bengalensis',
        '2016-09-01',
        'Endangered'
    ),
    (
        'Asian Pied Starling',
        'Gracupica contra',
        '2017-11-11',
        'Vulnerable'
    ),
    (
        'Spoon-billed Sandpiper',
        'Calidris pygmaea',
        '2018-01-29',
        'Endangered'
    ),
    (
        'Irrawaddy Dolphin',
        'Orcaella brevirostris',
        '2019-04-16',
        'Vulnerable'
    ),
    (
        'Masked Finfoot',
        'Heliopais personatus',
        '2020-06-20',
        'Endangered'
    );

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers (ranger_id) NOT NULL,
    species_id INT REFERENCES species (species_id) NOT NULL,
    sightings_time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes TEXT
)

INSERT INTO
    sightings (
        ranger_id,
        species_id,
        sightings_time,
        location,
        notes
    )
VALUES (
        1,
        1,
        '2025-05-20 08:00:00',
        'Sundarbans',
        'Tiger seen near riverbank'
    ),
    (
        2,
        1,
        '2025-05-21 09:30:00',
        'Chittagong Hill Tracts',
        'Tiger footprints found'
    ),
    (
        3,
        2,
        '2025-05-22 10:15:00',
        'Bandarban Tract',
        'Elephant herd moving'
    ),
    (
        4,
        2,
        '2025-05-23 11:45:00',
        'Sylhet Forest',
        'Single elephant observed'
    ),
    (
        5,
        3,
        '2025-05-24 12:30:00',
        'Madhupur Jungle',
        'Crocodile basking on sand'
    ),
    (
        1,
        3,
        '2025-05-25 13:00:00',
        'Sundarbans',
        'Crocodile swimming in canal'
    ),
    (
        2,
        5,
        '2025-05-26 14:20:00',
        'Chittagong Hill Tracts',
        'Gibbon calls heard'
    ),
    (
        3,
        5,
        '2025-05-27 15:10:00',
        'Bandarban Tract',
        'Gibbon seen swinging'
    ),
    (
        4,
        11,
        '2025-05-28 16:00:00',
        'Sylhet Forest',
        'Turtle spotted in wetland'
    ),
    (
        5,
        11,
        '2025-05-29 17:30:00',
        'Madhupur Jungle',
        'Turtle laying eggs'
    );

INSERT INTO
    sightings (
        ranger_id,
        species_id,
        sightings_time,
        location,
        notes
    )
VALUES (
        1,
        1,
        '2025-06-25 10:00:00',
        'Sundarbans',
        'Tiger seen in jungle'
    );

SELECT * from rangers;

SELECT * from species;

SELECT * from sightings;

-- Problem - 1
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains')

-- problem - 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- problem - 3
SELECT
    sighting_id,
    ranger_id,
    species_id,
    sightings_time,
    location,
    notes
FROM sightings
WHERE
    location ILIKE '%tracts%';

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