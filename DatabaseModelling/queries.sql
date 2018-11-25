-- All jockeys that have ever worked with the horse (horse names: Spirit, Star, Astor)
SELECT
       j.first_name || ' ' || j.last_name AS full_name,
       j.sex,
       TO_CHAR(j.date_of_birth,'DD.MM.YYYY') AS date_of_birth,
       j.height,
       j.weight
FROM jockeys j
       JOIN horse_jockeys hj ON j.id = hj.jockey_id
       JOIN horses h ON hj.horse_id = h.id
WHERE h.name = '${Enter horse name}';


-- Owners with more than 3 horses
SELECT o.* FROM owners o
WHERE (SELECT COUNT(*) FROM horse_owners ho WHERE ho.owner_id = o.id) >= 3;


-- Champions of the last year races
SELECT h.name as horse_name,
       j.first_name || ' ' || j.last_name AS jockey_name,
       r.name AS race,
       TO_CHAR(r.race_datetime,'DD.MM.YYYY') AS date_of_race
FROM horse_races hr
       JOIN horse_jockeys hj ON hj.id = hr.horse_jockey_id
       JOIN horses h ON hj.horse_id = h.id
       JOIN jockeys j on hj.jockey_id = j.id
       JOIN races r on hr.race_id = r.id
WHERE hr.place = 1 AND r.race_datetime > ADD_MONTHS(CURRENT_DATE, -12);





