INSERT ALL
  INTO horses (id, name, date_of_birth, sex) VALUES (1, 'Ellie', TO_DATE('2000/01/08', 'YYYY/MM/DD'), 'Female')
  INTO horses (id, name, date_of_birth, sex) VALUES (2, 'Star', TO_DATE('1999/06/28', 'YYYY/MM/DD'), 'Male')
  INTO horses (id, name, date_of_birth, sex) VALUES (3, 'Lightning', TO_DATE('2001/11/29', 'YYYY/MM/DD'), 'Gelding')
  INTO horses (id, name, date_of_birth, sex) VALUES (4, 'Spirit', TO_DATE('2004/06/01', 'YYYY/MM/DD'), 'Male')
  INTO horses (id, name, date_of_birth, sex) VALUES (5, 'Astor', TO_DATE('1999/06/03', 'YYYY/MM/DD'), 'Male')
  INTO horses (id, name, date_of_birth, sex) VALUES (6, 'Gypsy', TO_DATE('2003/10/30', 'YYYY/MM/DD'), 'Female')
  INTO horses (id, name, date_of_birth, sex) VALUES (7, 'Zed', TO_DATE('2002/07/18', 'YYYY/MM/DD'), 'Gelding')
  INTO horses (id, name, date_of_birth, sex) VALUES (8, 'Ulf', TO_DATE('2005/10/28', 'YYYY/MM/DD'), 'Male')
  INTO horses (id, name, date_of_birth, sex) VALUES (9, 'Jackie', TO_DATE('2002/05/13', 'YYYY/MM/DD'), 'Female')
  INTO horses (id, name, date_of_birth, sex) VALUES (10, 'Youth', TO_DATE('2001/12/06', 'YYYY/MM/DD'), 'Male')
  INTO horses (id, name, date_of_birth, sex) VALUES (11, 'Pamela', TO_DATE('1998/05/13', 'YYYY/MM/DD'), 'Female')
  INTO horses (id, name, date_of_birth, sex) VALUES (12, 'Hugh', TO_DATE('2000/10/15', 'YYYY/MM/DD'), 'Male')
  INTO horses (id, name, date_of_birth, sex) VALUES (13, 'Piotr', TO_DATE('2003/03/28', 'YYYY/MM/DD'), 'Gelding')
  INTO horses (id, name, date_of_birth, sex) VALUES (14, 'Jeezee', TO_DATE('1992/07/25', 'YYYY/MM/DD'), 'Male')
  INTO horses (id, name, date_of_birth, sex) VALUES (15, 'Yves', TO_DATE('1992/01/21', 'YYYY/MM/DD'), 'Gelding')
  INTO horses (id, name, date_of_birth, sex) VALUES (16, 'Terrie', TO_DATE('1998/02/22', 'YYYY/MM/DD'), 'Female')
  INTO horses (id, name, date_of_birth, sex) VALUES (17, 'Philippa', TO_DATE('2001/06/18', 'YYYY/MM/DD'), 'Female')
  INTO horses (id, name, date_of_birth, sex) VALUES (18, 'Goodie', TO_DATE('2000/07/15', 'YYYY/MM/DD'), 'Male')
  INTO horses (id, name, date_of_birth, sex) VALUES (19, 'Paullie', TO_DATE('1998/02/22', 'YYYY/MM/DD'), 'Female')
  INTO horses (id, name, date_of_birth, sex) VALUES (20, 'Easter', TO_DATE('2001/06/18', 'YYYY/MM/DD'), 'Female')
  INTO horses (id, name, date_of_birth, sex) VALUES (21, 'Go', TO_DATE('2000/07/15', 'YYYY/MM/DD'), 'Male')
SELECT * FROM dual;

INSERT ALL
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (1, 'Jack', 'Nickson', 'Male', TO_DATE('1996/05/28', 'YYYY/MM/DD'), 80, 179)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (2, 'Ashlie', 'Cheeze', 'Female', TO_DATE('1995/01/09', 'YYYY/MM/DD'), 55, 170)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (3, 'Peter', 'Parker', 'Male', TO_DATE('1996/10/15', 'YYYY/MM/DD'), 87, 180)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (4, 'Paul', 'Ledger', 'Male', TO_DATE('1995/08/01', 'YYYY/MM/DD'), 85, 174)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (5, 'Elizabeth', 'Niell', 'Female', TO_DATE('1996/03/17', 'YYYY/MM/DD'), 56, 160)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (6, 'Hugh', 'Grant', 'Male', TO_DATE('1997/04/24', 'YYYY/MM/DD'), 53, 167)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (7, 'Piotr', 'Kozlovich', 'Male', TO_DATE('1996/05/19', 'YYYY/MM/DD'), 79, 180)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (8, 'Tom', 'Sawer', 'Male', TO_DATE('1995/03/10', 'YYYY/MM/DD'), 65, 174)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (9, 'Oggy', 'Pop', 'Male', TO_DATE('1996/07/29', 'YYYY/MM/DD'), 85, 168)
  INTO jockeys (id, first_name, last_name, sex, date_of_birth, weight, height) VALUES
    (10, 'Catherine', 'Zee', 'Female', TO_DATE('1997/02/25', 'YYYY/MM/DD'), 87, 192)
SELECT * FROM dual;

INSERT ALL
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (1, 2, 3, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (2, 2, 6, 'N')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (3, 2, 4, 'N')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (4, 2, 1, 'N')

  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (5, 8, 10, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (6, 8, 3, 'N')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (7, 8, 1, 'N')

  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (8, 4, 5, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (9, 4, 6, 'N')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (10, 4, 7, 'N')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (11, 4, 8, 'N')

  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (12, 3, 8, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (13, 3, 2, 'N')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (14, 3, 1, 'N')

  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (15, 5, 2, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (16, 5, 5, 'N')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (17, 5, 9, 'N')

  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (18, 6, 3, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (19, 1, 10, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (20, 14, 1, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (21, 13, 6, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (22, 12, 7, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (23, 9, 8, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (24, 7, 9, 'Y')
  INTO horse_jockeys (id, horse_id, jockey_id, active) VALUES (25, 10, 2, 'Y')
SELECT * FROM dual;

INSERT ALL
  INTO owners (id, first_name, last_name, address) VALUES
    (1, 'Ilon', 'Musk', '1244 Chickago avenue')
  INTO owners (id, first_name, last_name, address) VALUES
    (2, 'Rocky', 'Turell', '24 Madison square')
  INTO owners (id, first_name, last_name, address) VALUES
    (3, 'Katie', 'Yves', '78 Lenin avenue')
  INTO owners (id, first_name, last_name, address) VALUES
    (4, 'Yvette', 'Marseille', '232 Rue Liberte')
  INTO owners (id, first_name, last_name, address) VALUES
    (5, 'John', 'Smith', '29 East Coast Side')
  INTO owners (id, first_name, last_name, address) VALUES
    (6, 'George', 'Bund', '666 Riverside Bank')
  INTO owners (id, first_name, last_name, address) VALUES
    (7, 'Philippe', 'Nguen', '2114 Times Square')
  INTO owners (id, first_name, last_name, address) VALUES
    (8, 'Laura', 'Palmer', '653 Owls avenue')
  INTO owners (id, first_name, last_name, address) VALUES
    (9, 'Kyle', 'Donovan', '65 Post Square')
  INTO owners (id, first_name, last_name, address) VALUES
    (10, 'Derek', 'Vent', '373 Neverwinter avenue')
SELECT * FROM dual;


INSERT ALL
  INTO horse_owners (id, horse_id, owner_id) VALUES (1, 1, 1)
  INTO horse_owners (id, horse_id, owner_id) VALUES (2, 2, 1)
  INTO horse_owners (id, horse_id, owner_id) VALUES (3, 3, 1)
  INTO horse_owners (id, horse_id, owner_id) VALUES (4, 4, 1)
  INTO horse_owners (id, horse_id, owner_id) VALUES (5, 5, 2)
  INTO horse_owners (id, horse_id, owner_id) VALUES (6, 6, 2)
  INTO horse_owners (id, horse_id, owner_id) VALUES (7, 7, 3)
  INTO horse_owners (id, horse_id, owner_id) VALUES (8, 8, 3)
  INTO horse_owners (id, horse_id, owner_id) VALUES (9, 9, 3)
  INTO horse_owners (id, horse_id, owner_id) VALUES (10, 10, 3)
  INTO horse_owners (id, horse_id, owner_id) VALUES (11, 11, 4)
  INTO horse_owners (id, horse_id, owner_id) VALUES (12, 12, 5)
  INTO horse_owners (id, horse_id, owner_id) VALUES (13, 13, 6)
  INTO horse_owners (id, horse_id, owner_id) VALUES (14, 14, 7)
  INTO horse_owners (id, horse_id, owner_id) VALUES (15, 15, 7)
  INTO horse_owners (id, horse_id, owner_id) VALUES (16, 16, 7)
  INTO horse_owners (id, horse_id, owner_id) VALUES (17, 17, 7)
  INTO horse_owners (id, horse_id, owner_id) VALUES (18, 18, 9)
  INTO horse_owners (id, horse_id, owner_id) VALUES (19, 18, 10)
  INTO horse_owners (id, horse_id, owner_id) VALUES (20, 18, 10)
  INTO horse_owners (id, horse_id, owner_id) VALUES (21, 18, 10)
SELECT * FROM dual;


INSERT ALL
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (1, 'Grande Prêmio Brasil', 'Hipódromo da Gávea, Rio de Janeiro', TO_DATE('2018/07/30', 'YYYY/MM/DD'), 3)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (2, 'Stockholm Cup International', 'Bro Park, Upplands-Bro', TO_DATE('2018/06/21', 'YYYY/MM/DD'), 4)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (3, 'Prix de Diane', 'Chantilly Racecourse, France', TO_DATE('2015/01/28', 'YYYY/MM/DD'), 3)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (4, 'Australian Derby', 'Randwick Racecourse, Sydney', TO_DATE('2017/10/18', 'YYYY/MM/DD'), 4)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (5, 'The English Derby', 'Epsom Downs Racecourse, England', TO_DATE('2018/04/18', 'YYYY/MM/DD'), 2)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (6, 'Woodbine Mile', 'Woodbine Racetrack, Toronto', TO_DATE('2018/09/10', 'YYYY/MM/DD'), 3)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (7, 'Northern Dancer Turf Stakes', 'Woodbine Racetrack Toronto', TO_DATE('2017/12/30', 'YYYY/MM/DD'), 2)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (8, 'Challenge Stakes', 'Hastings Racecourse, Hawkes Bay', TO_DATE('2012/02/10', 'YYYY/MM/DD'), 4)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (9, 'Grosser Preis von Berlin', 'Hoppegarten Racecourse, Germany', TO_DATE('2010/07/12', 'YYYY/MM/DD'), 3)
  INTO races (id, name, location, race_datetime, courses_count) VALUES
    (10, 'Grande Prêmio Paraná', 'Hipodromo do Tarumã, Curitiba', TO_DATE('2017/02/19', 'YYYY/MM/DD'), 3)
SELECT * FROM dual;

INSERT ALL
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (1, 1, 1, 4)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (2, 5, 1, 2)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (3, 8, 1, 5)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (4, 12, 1, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (5, 15, 1, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (6, 18, 1, 6)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (7, 2, 2, 4)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (8, 6, 2, 2)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (9, 4, 2, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (10, 10, 2, 3)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (11, 12, 3, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (12, 6, 3, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (13, 9, 3, 4)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (14, 7, 3, 2)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (15, 10, 3, 5)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (16, 12, 4, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (17, 6, 4, 4)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (18, 9, 4, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (19, 7, 4, 5)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (20, 10, 4, 2)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (21, 12, 5, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (22, 6, 5, 4)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (23, 9, 5, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (24, 7, 5, 5)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (25, 10, 5, 2)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (26, 2, 6, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (27, 6, 6, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (28, 4, 6, 2)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (29, 7, 6, 4)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (30, 8, 6, 5)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (31, 12, 7, 4)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (32, 13, 7, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (33, 1, 7, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (34, 5, 7, 5)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (35, 10, 7, 2)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (36, 10, 8, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (37, 6, 8, 4)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (38, 3, 8, 5)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (39, 7, 8, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (40, 2, 8, 2)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (41, 6, 9, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (42, 9, 9, 2)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (43, 7, 9, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (44, 10, 9, 4)

  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (45, 6, 10, 3)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (46, 9, 10, 2)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (47, 7, 10, 1)
  INTO horse_races (id, horse_jockey_id, race_id, place) VALUES (48, 10, 10, 4)
SELECT * FROM dual;

DELETE FROM races;