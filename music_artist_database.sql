DROP TABLE album;
Drop Table artist;
DROP DATABASE music_artist_database;

CREATE DATABASE music_artist_database;

USE music_artist_database;

-- Artist Table 
CREATE TABLE artist (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(30) NOT NULL,
genre VARCHAR(30),

PRIMARY KEY (id)
);

-- Album Table
CREATE TABLE album (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(30),
track_list INT,
popular_song VARCHAR(30),
release_year INT,
artist_id INT NOT NULL,

PRIMARY KEY (id),
FOREIGN KEY (artist_id) REFERENCES artist(id)
);

-- Inserting data to artist table 
INSERT INTO artist (name, genre) 
VALUES ('Bad Bunny', 'Latin'),
	   ('Taylor Swift', 'Pop'),
       ('Hairy Styles', NULL),	-- Pop/Name Misspelled
       ('Drake', 'Rap'),
       ('Morgan Wallen', 'Country'),
       ('Doja Cat', 'Pop'),
       ('Ed Sheeran', 'Pop'),
       ('Adel', 'Pop'),	-- Name Misspelled
       ('The Weeknd', 'Pop'),
       ('Lil Baby', 'Rap'),
       ('Future', 'Rap'),
       ('Justin Bieber', 'Pop'),
       ('Post Malone', 'Pop'),
       ('Jack Harlow', 'Rap'),
       ('Kendrick Lamar', NULL);	-- Rap

-- Inserting data to album table 
INSERT INTO album (name, track_list, popular_song, release_year, artist_id)
VALUES ('Oasis', NULL, 'La Cancion', 2019, 1), -- Track list is 8
	   ('1989', 13, 'Blank Space', 2014, 2),
       ("Harry's House", 13, 'As it Was', 2022, 3),
       ('Views', 20, 'Hotline Bling', NULL, 4), -- Release Year is 2016 
       ('One Thing at a Time', 36, 'You Proof', 2023, 5),
       ('Hot Pink', 7, 'Say So', 2019, 6),
       ('Divide', 16, 'Shape of You', 2017, 7),
       ('21', 12, 'Someone Like You', 2011, 8),
       ('After Hours', 14, 'Blinded by the Lights', 2020, 9),
       ('Drip Harder', 13, 'Drip Too Hard', 2018, 10),
       ('Future', 20, 'Mask Off', 2017, 11),
       ('My World 2.0', 10, NULL, 2010, 12), -- Song Baby
       (NULL, 14, 'White Iverson', 2016, 13), -- Album Stoney
       ('Come Home the Kids Miss You', 15, 'First Class', 2022, 14),
       ('DAMN.', 14, 'Love', 2017, 15);

-- Retrieve all artists
SELECT * 
From artist; 

-- Retrieve artists with NULL genre or NULL name
SELECT *
FROM artist
WHERE genre IS NULL;

-- Update the name and genre column for a specific artist
UPDATE artist
SET name = CASE
        WHEN id = 3 THEN 'Harry Styles'
        WHEN id = 8 THEN 'Adele'
        ELSE name
    END,
    genre = CASE
        WHEN id = 3 THEN 'Pop'
        WHEN id = 15 THEN 'Rap'
        ELSE genre
    END
WHERE id IN (3, 8, 15);

-- Retrieve all albums:
SELECT * 
FROM album;

-- Retrieve albums with NULL in a column
SELECT *
FROM album
WHERE name IS NULL
   OR track_list IS NULL
   OR popular_song IS NULL
   OR release_year IS NULL;

-- Update the name, track_list, popular_song, release_year column for a specific album
UPDATE album
SET name = 'Stoney',
    track_list = 8,
    popular_song = 'Baby',
    release_year = 2016
WHERE id IN (13, 1, 12, 4);

-- Retrieve albums of a specific artist
SELECT * 
FROM artist 
WHERE id = 13;

-- Retrieve all albums with their corresponding artist details
SELECT 
	album.*, 
    artist.name AS artist_name
FROM album
JOIN artist 
ON album.artist_id = artist.id;
 
-- Retrieve the names of artists who genre is Pop
SELECT artist.name, artist.genre 
FROM artist
JOIN album 
ON artist.id = album.artist_id
WHERE artist.genre = 'Pop';

-- Retrieve the names of artists who have released albums with more than 10 tracks
SELECT artist.name, album.track_list
FROM artist
JOIN album ON artist.id = album.artist_id
WHERE album.track_list > 10;

-- Retrieve the names of artists who have released albums in the last five years:
SELECT DISTINCT artist.name, album.release_year
FROM artist
JOIN album ON artist.id = album.artist_id
WHERE album.release_year >= YEAR(CURDATE()) - 5;

-- Retrieve the total number of albums released by each artist
SELECT artist.name, COUNT(album.id) AS total_albums
FROM artist
LEFT JOIN album ON artist.id = album.artist_id
GROUP BY artist.id;

-- Retrieve the total number of genre albums released
SELECT genre, COUNT(*) AS album_count
FROM artist
JOIN album ON artist.id = album.artist_id
GROUP BY genre;

-- Retrieve the average number of track list per genre > 10
SELECT genre, AVG(album.track_list) AS 'Average Track List'
FROM artist
JOIN album ON artist.id = album.artist_id
GROUP BY genre
HAVING AVG(album.track_list) > 10;

-- Retrieve artist's name if it hase an 'i' or genre if it is pop, or the album release year is < 2015
SELECT artist.name, artist.genre, album.release_year
FROM artist
JOIN album ON artist.id = album.artist_id
WHERE artist.name LIKE '%i%'
   OR artist.genre = 'Pop'
   OR album.release_year < 2015;
