-- Active: 1747802128488@@127.0.0.1@5432@wildlife
-- assingment-2 on DB 

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
)

INSERT INTO rangers (name, region) VALUES
('Arifur Rahman', 'Sundarbans'),
('Rakib Ahmed', 'Chittagong Hill Tracts'),
('Jhankar Mahbub', 'Bandarban Tract'),
('Mizan Rahman', 'Sylhet Forest'),
('Faisal Mahbub', 'Madhupur Jungle')

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    conservation_status VARCHAR(20) NOT NULL,
    CONSTRAINT conservation_status_check CHECK (conservation_status IN ('Endangered', 'Vulnerable'))
)

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Bengal Tiger', 'Panthera tigris tigris', '2001-05-20', 'Endangered'),
('Asian Elephant', 'Elephas maximus', '2002-03-15', 'Endangered'),
('Saltwater Crocodile', 'Crocodylus porosus', '2003-07-10', 'Vulnerable'),
('Ganges River Dolphin', 'Platanista gangetica', '2004-09-22', 'Endangered'),
('Hoolock Gibbon', 'Hoolock hoolock', '2005-11-30', 'Endangered'),
('Fishing Cat', 'Prionailurus viverrinus', '2006-01-12', 'Vulnerable'),
('Indian Python', 'Python molurus', '2007-04-18', 'Vulnerable'),
('Leopard Cat', 'Prionailurus bengalensis', '2008-06-25', 'Vulnerable'),
('Clouded Leopard', 'Neofelis nebulosa', '2009-08-14', 'Vulnerable'),
('Red Junglefowl', 'Gallus gallus', '2010-10-05', 'Vulnerable'),
('Black Softshell Turtle', 'Nilssonia nigricans', '2011-12-19', 'Endangered'),
('Pangolin', 'Manis crassicaudata', '2012-02-28', 'Endangered'),
('Sloth Bear', 'Melursus ursinus', '2013-03-17', 'Vulnerable'),
('Smooth-coated Otter', 'Lutrogale perspicillata', '2014-05-23', 'Vulnerable'),
('Greater Adjutant', 'Leptoptilos dubius', '2015-07-09', 'Endangered'),
('White-rumped Vulture', 'Gyps bengalensis', '2016-09-01', 'Endangered'),
('Asian Pied Starling', 'Gracupica contra', '2017-11-11', 'Vulnerable'),
('Spoon-billed Sandpiper', 'Calidris pygmaea', '2018-01-29', 'Endangered'),
('Irrawaddy Dolphin', 'Orcaella brevirostris', '2019-04-16', 'Vulnerable'),
('Masked Finfoot', 'Heliopais personatus', '2020-06-20', 'Endangered');

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id) NOT NULL,
    species_id INT REFERENCES species(species_id) NOT NULL,
    sightings_time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes TEXT
)

INSERT INTO sightings(ranger_id,species_id, sightings_time, location) VALUES
(5, 2, '2025-05-27 16:20:00', 'Madhupur Jungle');


SELECT * from rangers;
SELECT * from species;
SELECT * from sightings;









INSERT INTO sightings (ranger_id, species_id, sightings_time, location, notes) VALUES
(1, 1, '2025-05-23 08:30:00', 'Sundarbans', 'Tiger seen near riverbank'),
(2, 3, '2025-05-24 10:15:00', 'Chittagong Hill Tracts', 'Crocodile basking on sand'),
(3, 5, '2025-05-25 14:00:00', 'Bandarban Tract', 'Gibbon calls heard in canopy'),
(4, 11, '2025-05-26 09:45:00', 'Sylhet Forest', 'Turtle spotted in wetland'),
(5, 2, '2025-05-27 16:20:00', 'Madhupur Jungle', 'Elephant herd crossing trail');

INSERT INTO sightings(ranger_id, species_id, sightings_time, location, notes) VALUES
(2, 3, '2025-05-24 10:15:00', 'Chittagong Hill Tracts', 'Crocodile basking on sand'),
(3, 5, '2025-05-25 14:00:00', 'Bandarban Tract', 'Gibbon calls heard in canopy'),
(4, 11, '2025-05-26 09:45:00', 'Sylhet Forest', 'Turtle spotted in wetland'),
(5, 2, '2025-05-27 16:20:00', 'Madhupur Jungle', 'Elephant herd crossing trail'),
(1, 6, '2025-05-28 07:50:00', 'Sundarbans', 'Fishing cat seen near water edge');