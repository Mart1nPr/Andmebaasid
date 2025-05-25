-- Iga aasta kohta 3 parimat filmi žanri kaupa
CREATE VIEW top_3_movies_by_genre_year AS
SELECT 
    g.genres,
    t.startYear,
    t.primaryTitle,
    t.averageRating,
    t.numVotes
FROM title t
JOIN genre g ON t.tconst = g.tconst
WHERE t.startYear IS NOT NULL
ORDER BY g.genres, t.startYear, t.averageRating DESC
LIMIT 3;

-- Näitlejad filmi kaupa
CREATE VIEW actors_by_movie AS
SELECT 
    t.tconst,
    t.primaryTitle,
    p.primaryName AS actor_name
FROM ta23e ta
JOIN person p ON ta.nconst = p.nconst
JOIN title t ON ta.tconst = t.tconst
WHERE ta.category = 'actor' OR ta.category = 'actress'
ORDER BY t.primaryTitle, actor_name;

-- Režissöörid filmi kaupa
CREATE VIEW directors_by_movie AS
SELECT 
    t.tconst,
    t.primaryTitle,
    p.primaryName AS director_name
FROM ta23e ta
JOIN person p ON ta.nconst = p.nconst
JOIN title t ON ta.tconst = t.tconst
WHERE ta.category = 'director'
ORDER BY t.primaryTitle, director_name;

-- Filmide arv žanri ja aasta lõikes
CREATE VIEW movie_count_by_genre_year AS
SELECT 
    g.genres,
    t.startYear,
    COUNT(*) AS movie_count
FROM genre g
JOIN title t ON g.tconst = t.tconst
WHERE t.startYear IS NOT NULL
GROUP BY g.genres, t.startYear
ORDER BY g.genres, t.startYear;