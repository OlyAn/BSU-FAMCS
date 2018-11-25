CREATE TABLE owners (
	id                   INTEGER NOT NULL PRIMARY KEY ,
	first_name            VARCHAR2(100) NULL,
	last_name            VARCHAR2(100) NULL,
	address              VARCHAR2(100) NULL
);

CREATE TABLE horses (
	id                   INTEGER NOT NULL PRIMARY KEY,
	name                 VARCHAR2(100) NOT NULL,
  date_of_birth        DATE CHECK (
    date_of_birth BETWEEN TO_DATE('1990/01/01', 'YYYY/MM/DD') AND TO_DATE('2008/01/01', 'YYYY/MM/DD')
  ),
	sex                  VARCHAR2(100) NULL CHECK (sex IN('Male', 'Female', 'Gelding'))
);

CREATE TABLE horse_jockeys (
	id                   INTEGER NOT NULL PRIMARY KEY,
	horse_id INTEGER NOT NULL,
	jockey_id INTEGER NOT NULL,
  active CHAR(1) DEFAULT 'Y'
);


CREATE TABLE horse_owners (
	id                   INTEGER NOT NULL PRIMARY KEY,
	horse_id             INTEGER NOT NULL,
  owner_id             INTEGER NOT NULL
);

CREATE TABLE jockeys (
	id                   INTEGER NOT NULL PRIMARY KEY,
	first_name           VARCHAR2(100) NOT NULL,
	last_name            VARCHAR2(100) NOT NULL,
  sex                  VARCHAR(20) NULL CHECK (sex IN ('Female', 'Male')),
	height               INTEGER NULL CHECK (height BETWEEN 130 AND 220),
	weight               INTEGER NULL CHECK (weight BETWEEN 35 AND 120),
	date_of_birth        DATE NOT NULL CHECK (
      date_of_birth BETWEEN TO_DATE('1980/01/01', 'YYYY/MM/DD') AND TO_DATE('1998/01/01', 'YYYY/MM/DD')
  )
);

CREATE TABLE races (
	id                   INTEGER NOT NULL PRIMARY KEY,
	name                 VARCHAR2(100) NULL UNIQUE,
	location             VARCHAR2(100) NOT NULL,
	race_datetime        DATE NOT NULL,
  courses_count        INTEGER NOT NULL
);

CREATE TABLE horse_races (
  id                   INTEGER NOT NULL PRIMARY KEY,
  horse_jockey_id      INTEGER NOT NULL,
  race_id              INTEGER NOT NULL,
  place                INTEGER NOT NULL
);

ALTER TABLE horse_jockeys
	ADD (
    CONSTRAINT HJ_horse_fk FOREIGN KEY (horse_id) REFERENCES horses (id),
    CONSTRAINT HJ_jockey_fk FOREIGN KEY (jockey_id) REFERENCES jockeys (id)
  );

ALTER TABLE horse_owners
	ADD (
    CONSTRAINT HO_horse_fk FOREIGN KEY (horse_id) REFERENCES horses (id),
    CONSTRAINT HO_owner_fk FOREIGN KEY (owner_id) REFERENCES owners (id)
  );

ALTER TABLE horse_races
	ADD (
    CONSTRAINT HR_horse_jockey_fk FOREIGN KEY (horse_jockey_id) REFERENCES horse_jockeys (id),
    CONSTRAINT HR_race_fk FOREIGN KEY (race_id) REFERENCES races (id)
  );


CREATE  TRIGGER tI_horse_owners BEFORE INSERT ON horse_owners for each row
DECLARE NUMROWS INTEGER;
BEGIN
    SELECT count(*) INTO NUMROWS
      FROM horses
      WHERE
        :new.horse_id = horses.id;
    IF (
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert horse_owners because horses does not exist.'
      );
    END IF;
END;

CREATE  TRIGGER tU_horse_owners AFTER UPDATE ON horse_owners for each row
DECLARE NUMROWS INTEGER;
BEGIN
  SELECT count(*) INTO NUMROWS
    FROM horses
    WHERE
      :new.horse_id = horses.id;
  IF (
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update horse_owners because horses does not exist.'
    );
  END IF;
END;

CREATE  TRIGGER  tD_horses AFTER DELETE ON horses for each row
DECLARE NUMROWS INTEGER;
BEGIN
    SELECT count(*) INTO NUMROWS
      FROM horse_owners
      WHERE
        horse_owners.horse_id = :old.id;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete horses because horse_owners exists.'
      );
    END IF;
END;

CREATE  TRIGGER tU_horses AFTER UPDATE ON horses for each row
DECLARE NUMROWS INTEGER;
BEGIN
  IF
    :old.id <> :new.id
  THEN
    SELECT count(*) INTO NUMROWS
      FROM horse_owners
      WHERE
        horse_owners.horse_id = :old.id;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20005,
        'Cannot update horses because horse_owners exists.'
      );
    END IF;
  END IF;
END;

CREATE INDEX HO_horse_fk ON horse_owners(horse_id);
CREATE INDEX HO_owner_fk ON horse_owners(owner_id);

CREATE INDEX HJ_horse_fk ON horse_jockeys(horse_id);
CREATE INDEX HJ_jockey_fk ON horse_jockeys(jockey_id);

CREATE INDEX HR_horse_jockey_fk ON horse_races(horse_jockey_id);
CREATE INDEX HR_race_fk ON horse_races(race_id);
