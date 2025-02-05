-- Mängijad
INSERT INTO Player (id, firstname, lastname, salary, country_id, club_id) VALUES 
    (1, 'Märt', 'Kask', 50000, 1, 1),
    (2, 'Mihkel', 'Tamm', 60000, 2, 1),
    (3, 'Laura', 'Pärn', 55000, 1, 2),
    (4, 'Anna', 'Eensalu', 70000, 2, 2),
    (5, 'Jüri', 'Saar', 48000, 1, 1),
    (6, 'Kert', 'Jõgi', 45000, 2, 1);

select * from Player;

-- Klubid
INSERT INTO Club (id, location, name, stadium) VALUES
    (1, 'Tallinn', 'FC Tallinn', 'A. Le Coq Arena'),
    (2, 'Riga', 'FC Riga', 'Daugava Stadium');

select * from Club;

-- Riigidcountry
INSERT INTO Country (id, code, name) VALUES
    (1,'EST', 'Eesti'),
    (2 ,'LAT', 'Läti');
    
select * from country;

-- Treenerid
INSERT INTO Coach (firstname, lastname, Country_id) VALUES
    (123, "Martin", "Pruus", 1);
    
select * from Coach;
