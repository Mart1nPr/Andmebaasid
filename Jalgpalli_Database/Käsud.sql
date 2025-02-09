-- Jalgpalli andmebaasi käsud

-- Club
INSERT INTO Club (id, location, name, stadium) VALUES
    (1, 'Tallinn', 'FC Tallinn', 'A. Le Coq Arena'),
    (2, 'Riga', 'FC Riga', 'Daugava Stadium');
select * from Club;

-- Coach
INSERT INTO Coach (firstname, lastname, Country_id) VALUES
    (123, "Martin", "Pruus", 1);
select * from Coach;

-- Coach_has_club
INSERT INTO coach_has_club (Coach_id, Club_id) VALUES (123, 1), (123, 2);
select * from coach_has_club;

-- Country
INSERT INTO Country (id, code, name) VALUES
    (1,'EST', 'Eesti'),
    (2 ,'LAT', 'Läti');
select * from country;

-- Formation
INSERT INTO Formation (description) VALUES 
	('4-4-2'), 
    ('4-3-3');
select * from formation;

-- Game
INSERT INTO Game (id, homeclub, foreignclub, homescore, foreignscore, homeformation, foreignformation, gametime, createdat) VALUES
	(123, 1, 2, 2, 1, 1, 2, '2024-02-10 18:00:00');
select * from game;

-- Gameplayer
INSERT INTO GamePlayer (Game_id, Player_id) VALUES
    (123, 1),
    (123, 2),
    (123, 3),
    (123, 4),
    (123, 5),
    (123, 6);
select * from gameplayer;

-- Player
INSERT INTO Player (id, firstname, lastname, salary, country_id, club_id) VALUES 
    (1, 'Märt', 'Kask', 50000, 1, 1),
    (2, 'Mihkel', 'Tamm', 60000, 2, 1),
    (3, 'Laura', 'Pärn', 55000, 1, 2),
    (4, 'Anna', 'Eensalu', 70000, 2, 2),
    (5, 'Jüri', 'Saar', 48000, 1, 1),
    (6, 'Kert', 'Jõgi', 45000, 2, 1);
select * from Player;

