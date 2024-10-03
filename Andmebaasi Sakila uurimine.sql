use sakila;

-- 1. Mitu poodi on andmebaasis?
select count(*) from store;

-- 2. Kumb pood on rohkem DVD-sid laenutanud? 
select staff_id, count(*) from rental group by staff_id;

-- 3. Millise kategooria filme on kõige enam laenutatud (kordades ja rahas)? 
-- Millise kategooria filmid on laenutamises olnud kõige kallimad? 
    SELECT 
        `c`.`name` AS `category`, SUM(`p`.`amount`) AS `total_sales`, count(*) count, avg (`p`.`amount`) avarage
    FROM
        (((((`payment` `p`
        JOIN `rental` `r` ON ((`p`.`rental_id` = `r`.`rental_id`)))
        JOIN `inventory` `i` ON ((`r`.`inventory_id` = `i`.`inventory_id`)))
        JOIN `film` `f` ON ((`i`.`film_id` = `f`.`film_id`)))
        JOIN `film_category` `fc` ON ((`f`.`film_id` = `fc`.`film_id`)))
        JOIN `category` `c` ON ((`fc`.`category_id` = `c`.`category_id`)))
    GROUP BY `c`.`name`
    ORDER BY `total_sales` DESC;

-- 5. Millise filmi asendamine maksab kõige enam? 
SELECT title, replacement_cost FROM film WHERE replacement_cost = (SELECT MAX(replacement_cost) FROM film);

-- 6. Mis film on kõige pikem, kõige lühem? 
SELECT title, length FROM film WHERE length = (SELECT MIN(length) FROM film);

SELECT title, length FROM film WHERE length = (SELECT MAX(length) FROM film);



