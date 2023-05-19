/* Marvel Heroes and Villains Based on the website http://marvel.wikia.com/Main_Page
with popularity data from http://observationdeck.io9.com/something-i-found-marvel-character-popularity-poll-cb-1568108064 
and power grid data from http://marvel.wikia.com/Power_Grid#Power
Collected by: https://www.khanacademy.org/profile/Mentrasto/ */

CREATE TABLE marvels (ID INTEGER PRIMARY KEY,
    name TEXT,
    popularity INTEGER,
    alignment TEXT,
    gender TEXT, 
    height_m NUMERIC,
    weight_kg NUMERIC,
    hometown TEXT,
    intelligence INTEGER,
    strength INTEGER,
    speed INTEGER,
    durability INTEGER,
    energy_Projection INTEGER,
    fighting_Skills INTEGER);
    
INSERT INTO marvels VALUES
    (1, "Spider Man", 1, "Good", "Male", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4)
    (2, "Iron Man", 20, "Neutral", "Male", 1.98, 102.58, "USA", 6, 6, 5, 6, 6, 4),
    (3, "Hulk", 18, "Neutral", "Male", 2.44, 635.29, "USA", 1, 7, 3, 7, 5, 4),
    (4, "Wolverine", 3, "Good", "Male", 1.6, 88.46, "Canada", 2, 4, 2, 4, 1, 7),
    (5, "Thor", 5, "Good", "Male", 1.98, 290.3, "Asgard", 2, 7, 7, 6, 6, 4),
    (6, "Green Goblin", 91, "Bad", "Male", 1.93, 174.63, "USA", 4, 4, 3, 4, 3, 3),
    (7, "Magneto", 11, "Neutral", "Male", 1.88, 86.18, "Germany", 6, 3, 5, 4, 6, 4),
    (8, "Thanos", 47, "Bad", "Male", 2.01, 446.79, "Titan", 6, 7, 7, 6, 6, 4),
    (9, "Loki", 32, "Bad", "Male", 1.93, 238.14, "Jotunheim", 5, 5, 7, 6, 6, 3),
    (10, "Doctor Doom", 19, "Bad", "Male", 2.01, 188.24, "Latveria", 6, 4, 5, 6, 6, 4),
    (11, "Jean Grey", 8, "Good", "Female", 1.68, 52.16, "USA", 3, 2, 7, 7, 7, 4),
    (12, "Rogue", 4, "Good", "Female", 1.73, 54.43, "USA", 7, 7, 7, 7, 7, 7),
    (13, "Storm", 2, "Good", "Female", 1.80, 66, "Kenya", 2, 2, 3, 2, 5, 4),
    (14, "Nightcrawler", 6, "Good", "Male", 1.75, 73, "Germany", 3, 2, 7, 2, 1, 3),
    (15, "Gambit", 7, "Good", "Male", 1.88, 81, "EUA", 2, 2, 2, 2, 2, 4),
    (16, "Captain America", 9, "Good", "Male", 1.88, 108, "EUA", 3, 3, 2, 3, 1, 6),
    (17, "Cyclops", 10, "Good", "Male", 1.90, 88, "EUA", 3, 2, 2, 2, 5, 4),
    (18, "Emma Frost", 12, "Neutral", "Female", 1.78, 65, "EUA", 4, 4, 2, 5, 5, 3),
    (19, "Kitty Pryde", 13, "Good", "Female", 1.68, 50, "EUA", 4, 2, 2, 3, 1, 5),
    (20, "Daredevil", 14, "Good", "Male", 1.83, 91, "EUA", 3, 3, 2, 2, 4, 5),
    (21, "Punisher", 50, "Neutral", "Male", 1.85, 91, "EUA", 3, 3, 2, 2, 1, 6),
    (22, "Silver Surfer", 33, "Good", "Male", 1.93, 102, "Zenn-La", 3, 7, 7, 6, 7, 2),
    (23, "Ghost Rider", 86, "Good", "Male", 1.88, 99, "EUA", 2, 4, 3, 5, 4, 2),
    (24, "Venon", 78, "Neutral", "Male", 1.90, 118, "EUA", 3, 4, 2, 6, 1, 4),
    (25, "Juggernaut", 76, "Neutral", "Male", 2.87, 862, "EUA", 2, 7, 2, 7, 1, 4),
    (26, "Professor X", 58, "Good", "Male", 1.83, 86, "EUA", 5, 2, 2, 2, 5, 3);

/* What are average, max, and min values in the data? */
SELECT 
AVG(height_m) AS average_height,
MAX(height_m) AS max_height,
MIN(height_m) AS min_height,
AVG(weight_kg) AS average_weight,
MAX(weight_kg) AS max_weight,
MIN(weight_kg) AS min_weight,
AVG(intelligence) AS average_intelligence,
MAX(intelligence) AS max_intelligence,
MIN(intelligence) AS min_intelligence,
AVG(strength) AS average_strength,
MAX(strength) AS max_strength,
MIN(strength) AS min_strength,
AVG(speed) AS average_speed,
MAX(speed) AS max_speed,
MIN(speed) AS min_speed,
AVG(durability) AS average_durability,
MAX(durability) AS max_durability,
MIN(durability) AS min_durability,
AVG(energy_Projection) AS average_energy_projection,
MAX(energy_Projection) AS max_energy_projection,
MIN(energy_Projection) AS min_energy_projection,
AVG(fighting_Skills) AS average_fighting_skills,
MAX(fighting_Skills) AS max_fighting_skills,
MIN(fighting_Skills) AS min_fighting_skills
FROM marvels;

/* What about those numbers per category in the data (using HAVING)? */
SELECT gender, 
    AVG(height_m) AS average_height,
    MAX(height_m) AS max_height,
    MIN(height_m) AS min_height,
    AVG(weight_kg) AS average_weight,
    MAX(weight_kg) AS max_weight,
    MIN(weight_kg) AS min_weight
FROM marvels
GROUP BY gender
HAVING COUNT(*) > 1;

/* What ways are there to group the data values that don’t exist yet (using CASE)? */
SELECT 
CASE
    WHEN alignment = 'Good' THEN 'Good'
    WHEN alignment = 'Neutral' THEN 'Neutral'
    WHEN alignment = 'Bad' THEN 'Bad'
    ELSE 'Unknown'
END AS alignment_group,
COUNT(*) AS count
FROM marvels
GROUP BY alignment_group;

/* What interesting ways are there to filter the data (using AND/OR)? */
SELECT name
FROM marvels
WHERE (intelligence >= 5 AND strength >= 5)
OR (speed >= 5 AND durability >= 5);
