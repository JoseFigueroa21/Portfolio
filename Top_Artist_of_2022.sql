CREATE TABLE artist (
id INTEGER PRIMARY KEY,
name TEXT,
genres TEXT);

INSERT INTO artist VALUES
    (1, 'Bad Bunny', 'Latin'),
    (2, 'Taylor Swift', 'Pop'),
    (3, 'Hairy Styles', 'Pop'),
    (4, 'Drake', 'Rap'),
    (5, 'Morgan Wallen', 'Country'),
    (6, 'Doja Cat', 'Pop'),
    (7, 'Ed Sheeran', 'Pop'),
    (8, 'Adel', 'Pop'),
    (9, 'The Weeknd', 'Pop'),
    (10, 'Lil Baby', 'Rap'),
    (11, 'Future', 'Rap'),
    (12, 'Justin Bieber', 'Pop'),
    (13, 'Post Malone', 'Pop'),
    (14, 'Jack Harlow', 'Rap'),
    (15, 'Kendrick Lamar', 'Rap');

CREATE TABLE songs (
id INTEGER PRIMARY KEY,
title TEXT,
artist_id INTEGER
);

INSERT INTO songs VALUES
    (1, 'La Cancion', 1),
    (2, 'Blank Space', 2),
    (3, 'As it Was', 3),
    (4, 'Hotline Bling', 4),
    (5, 'Last Night', 5),
    (6, 'Say So', 6),
    (7, 'Shape of You', 7),
    (8, 'Someone Like You', 8),
    (9, 'Blinded by the Lights', 9),
    (10, 'Drip Too Hard', 10),
    (11, 'Mask Off', 11),
    (12, 'Baby', 12),
    (13, 'White Iverson', 13),
    (14, 'First Class', 14),
    (15, 'Bitch, Dont Kill My Vibe', 15);

SELECT artist.name, songs.title
FROM artist
JOIN songs 
ON artist.id = songs.artist_id;

SELECT artist.name, artist.genres 
FROM artist
JOIN songs 
ON artist.id = songs.artist_id
WHERE artist.genres = 'Pop';

SELECT artist.name, artist.genres
FROM songs
JOIN artist ON songs.artist_id = artist.id
WHERE artist.genres <> 'Pop';

SELECT genres, COUNT(*) AS song_count
FROM artist
JOIN songs ON artist.id = songs.artist_id
GROUP BY genres;