CREATE SCHEMA IF NOT EXISTS `songdatabase` DEFAULT CHARACTER SET utf8 ;
USE `songdatabase` ;

-- User table
CREATE TABLE IF NOT EXISTS `songdatabase`.`User` (
  `user_id` INT NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE)
ENGINE = InnoDB;


-- Artist Table
CREATE TABLE IF NOT EXISTS `songdatabase`.`Artist` (
  `artist_id` INT NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `dob` DATE NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;


-- Genre Table
CREATE TABLE IF NOT EXISTS `songdatabase`.`Genre` (
  `genre_id` INT NOT NULL,
  `genre_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- Song Table
CREATE TABLE IF NOT EXISTS `songdatabase`.`Song` (
  `song_id` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `artist_id` INT NOT NULL,
  `duration` INT NOT NULL,
  `genre_id1` INT NOT NULL,
  `genre_id2` INT NULL,
  `genre_id3` INT NULL,
  `explicit` TINYINT NOT NULL,
  `link` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`song_id`),
  INDEX `artist_id_idx` (`artist_id` ASC) VISIBLE,
  INDEX `genre_id1_idx` (`genre_id1` ASC) VISIBLE,
  INDEX `genre_id2_idx` (`genre_id2` ASC) VISIBLE,
  INDEX `genre_id3_idx` (`genre_id3` ASC) VISIBLE,
  CONSTRAINT `artist_id`
    FOREIGN KEY (`artist_id`)
    REFERENCES `songdatabase`.`Artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `genre_id1`
    FOREIGN KEY (`genre_id1`)
    REFERENCES `songdatabase`.`Genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `genre_id2`
    FOREIGN KEY (`genre_id2`)
    REFERENCES `songdatabase`.`Genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `genre_id3`
    FOREIGN KEY (`genre_id3`)
    REFERENCES `songdatabase`.`Genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Favorite Table
CREATE TABLE IF NOT EXISTS `songdatabase`.`Favorite` (
  `faver_id` INT NOT NULL,
  `faved_id` INT NOT NULL,
  PRIMARY KEY (`faver_id`),
  UNIQUE INDEX `faved_id_UNIQUE` (`faved_id` ASC) VISIBLE,
  CONSTRAINT `faver_id`
    FOREIGN KEY (`faver_id`)
    REFERENCES `songdatabase`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `faved_id`
    FOREIGN KEY (`faved_id`)
    REFERENCES `songdatabase`.`Song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Playlist Table
CREATE TABLE IF NOT EXISTS `songdatabase`.`Playlist` (
  `playlist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `rank` INT NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `song_id_idx` (`song_id` ASC) VISIBLE,
  CONSTRAINT `playlist_id`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `songdatabase`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `song_id`
    FOREIGN KEY (`song_id`)
    REFERENCES `songdatabase`.`Song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
