-- MySQL Script generated by MySQL Workbench
-- Mon Dec 17 05:30:02 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema online_shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_shop` DEFAULT CHARACTER SET utf8 ;
USE `online_shop` ;

-- -----------------------------------------------------
-- Table `online_shop`.`drzava`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`drzava` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `skracenica` VARCHAR(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`grad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`grad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `drzava_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_grad_drzava1_idx` (`drzava_id` ASC),
  CONSTRAINT `fk_grad_drzava1`
    FOREIGN KEY (`drzava_id`)
    REFERENCES `online_shop`.`drzava` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`adresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`adresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `postanski_broj` INT NULL,
  `ulica` VARCHAR(90) NULL,
  `broj` VARCHAR(20) NULL,
  `grad_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_adresa_grad1_idx` (`grad_id` ASC),
  CONSTRAINT `fk_adresa_grad1`
    FOREIGN KEY (`grad_id`)
    REFERENCES `online_shop`.`grad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`grupa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`grupa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `skracenica` VARCHAR(1) NOT NULL,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `privilijegije_UNIQUE` (`skracenica` ASC),
  UNIQUE INDEX `naziv_UNIQUE` (`naziv` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`korpa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`korpa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`korisnik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `korisnicko_ime` VARCHAR(30) NOT NULL,
  `email` VARCHAR(90) NOT NULL,
  `lozinka` VARCHAR(32) NOT NULL,
  `telefon` VARCHAR(20) NULL,
  `adresa_id` INT NULL,
  `ime` VARCHAR(45) NULL,
  `prezime` VARCHAR(45) NULL,
  `grupa_id` INT NOT NULL DEFAULT 2,
  `korpa_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `korisicniko_ime_UNIQUE` (`korisnicko_ime` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `telefon_UNIQUE` (`telefon` ASC),
  INDEX `fk_korisinik_adresa1_idx` (`adresa_id` ASC),
  INDEX `fk_korisinik_grupa1_idx` (`grupa_id` ASC),
  INDEX `fk_korisnik_korpa1_idx` (`korpa_id` ASC),
  CONSTRAINT `fk_korisinik_adresa1`
    FOREIGN KEY (`adresa_id`)
    REFERENCES `online_shop`.`adresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_korisinik_grupa1`
    FOREIGN KEY (`grupa_id`)
    REFERENCES `online_shop`.`grupa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_korisnik_korpa1`
    FOREIGN KEY (`korpa_id`)
    REFERENCES `online_shop`.`korpa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`merna_jedinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`merna_jedinica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv_jedinice` VARCHAR(45) NOT NULL,
  `skracenica` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`kategorija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`kategorija` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`proizvodjac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`proizvodjac` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`proizvod` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(90) NOT NULL,
  `cena` FLOAT NOT NULL,
  `kolicina` INT NOT NULL,
  `opis` LONGTEXT NULL,
  `merna_jedinica_id` INT NOT NULL,
  `postoji` INT NOT NULL DEFAULT 1,
  `kategorija_id` INT NOT NULL,
  `proizvodjac_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proizvod_merna_jedinica1_idx` (`merna_jedinica_id` ASC),
  INDEX `fk_proizvod_kategorija1_idx` (`kategorija_id` ASC),
  INDEX `fk_proizvod_proizvodjac1_idx` (`proizvodjac_id` ASC),
  CONSTRAINT `fk_proizvod_merna_jedinica1`
    FOREIGN KEY (`merna_jedinica_id`)
    REFERENCES `online_shop`.`merna_jedinica` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_kategorija1`
    FOREIGN KEY (`kategorija_id`)
    REFERENCES `online_shop`.`kategorija` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_proizvodjac1`
    FOREIGN KEY (`proizvodjac_id`)
    REFERENCES `online_shop`.`proizvodjac` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`racun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`racun` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `datum` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`racun_proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`racun_proizvod` (
  `racun_id` INT NOT NULL,
  `proizvod_id` INT NOT NULL,
  `cena` FLOAT NOT NULL,
  `kolicina` INT NOT NULL,
  PRIMARY KEY (`racun_id`, `proizvod_id`),
  INDEX `fk_racun_has_proizvod_proizvod1_idx` (`proizvod_id` ASC),
  INDEX `fk_racun_has_proizvod_racun1_idx` (`racun_id` ASC),
  CONSTRAINT `fk_racun_has_proizvod_racun1`
    FOREIGN KEY (`racun_id`)
    REFERENCES `online_shop`.`racun` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_racun_has_proizvod_proizvod1`
    FOREIGN KEY (`proizvod_id`)
    REFERENCES `online_shop`.`proizvod` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`korpa_proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`korpa_proizvod` (
  `korpa_id` INT NOT NULL,
  `proizvod_id` INT NOT NULL,
  `kolicina` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`korpa_id`, `proizvod_id`),
  INDEX `fk_korpa_has_proizvod_proizvod1_idx` (`proizvod_id` ASC),
  INDEX `fk_korpa_has_proizvod_korpa1_idx` (`korpa_id` ASC),
  CONSTRAINT `fk_korpa_has_proizvod_korpa1`
    FOREIGN KEY (`korpa_id`)
    REFERENCES `online_shop`.`korpa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_korpa_has_proizvod_proizvod1`
    FOREIGN KEY (`proizvod_id`)
    REFERENCES `online_shop`.`proizvod` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_shop`.`korisnik_racun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_shop`.`korisnik_racun` (
  `korisnik_id` INT NOT NULL,
  `racun_id` INT NOT NULL,
  PRIMARY KEY (`korisnik_id`, `racun_id`),
  INDEX `fk_korisnik_has_racun_racun1_idx` (`racun_id` ASC),
  INDEX `fk_korisnik_has_racun_korisnik1_idx` (`korisnik_id` ASC),
  CONSTRAINT `fk_korisnik_has_racun_korisnik1`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `online_shop`.`korisnik` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_korisnik_has_racun_racun1`
    FOREIGN KEY (`racun_id`)
    REFERENCES `online_shop`.`racun` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `online_shop`.`drzava`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`drzava` (`id`, `naziv`, `skracenica`) VALUES (1, 'Srbija', NULL);
INSERT INTO `online_shop`.`drzava` (`id`, `naziv`, `skracenica`) VALUES (2, 'Bugarska', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`grad`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`grad` (`id`, `naziv`, `drzava_id`) VALUES (1, 'Novi Sad', 1);
INSERT INTO `online_shop`.`grad` (`id`, `naziv`, `drzava_id`) VALUES (2, 'Beograd', 1);
INSERT INTO `online_shop`.`grad` (`id`, `naziv`, `drzava_id`) VALUES (3, 'Sofia', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`adresa`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`adresa` (`id`, `postanski_broj`, `ulica`, `broj`, `grad_id`) VALUES (1, 400107, 'Jevrejska', '10A', 1);
INSERT INTO `online_shop`.`adresa` (`id`, `postanski_broj`, `ulica`, `broj`, `grad_id`) VALUES (2, 101801, 'Poenkareova', '5B', 1);
INSERT INTO `online_shop`.`adresa` (`id`, `postanski_broj`, `ulica`, `broj`, `grad_id`) VALUES (3, 400107, 'Jevrejska', '42', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`grupa`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`grupa` (`id`, `skracenica`, `naziv`) VALUES (1, 'A', 'administrator');
INSERT INTO `online_shop`.`grupa` (`id`, `skracenica`, `naziv`) VALUES (2, 'K', 'korisnik');

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`korpa`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`korpa` (`id`) VALUES (1);
INSERT INTO `online_shop`.`korpa` (`id`) VALUES (2);
INSERT INTO `online_shop`.`korpa` (`id`) VALUES (3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`korisnik`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`korisnik` (`id`, `korisnicko_ime`, `email`, `lozinka`, `telefon`, `adresa_id`, `ime`, `prezime`, `grupa_id`, `korpa_id`) VALUES (1, 'admin', 'admin@admin', '21232f297a57a5a743894a0e4a801fc3', '555-333', 1, 'Admin', 'Admin', 1, 1);
INSERT INTO `online_shop`.`korisnik` (`id`, `korisnicko_ime`, `email`, `lozinka`, `telefon`, `adresa_id`, `ime`, `prezime`, `grupa_id`, `korpa_id`) VALUES (2, 'korisnik', 'korisnik@gmail.com', '716b64c0f6bad9ac405aab3f00958dd1', '111-111', 2, 'Korisnik', 'Korisnik', 2, 2);
INSERT INTO `online_shop`.`korisnik` (`id`, `korisnicko_ime`, `email`, `lozinka`, `telefon`, `adresa_id`, `ime`, `prezime`, `grupa_id`, `korpa_id`) VALUES (3, 'pera', 'pera@gmail.com', '4d67f865a4e6c0da688d544e5513e730', '222-222', 3, 'Pera', 'Peric', 2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`merna_jedinica`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`merna_jedinica` (`id`, `naziv_jedinice`, `skracenica`) VALUES (1, 'Komad', 'kom');
INSERT INTO `online_shop`.`merna_jedinica` (`id`, `naziv_jedinice`, `skracenica`) VALUES (2, 'Gram', 'gm');
INSERT INTO `online_shop`.`merna_jedinica` (`id`, `naziv_jedinice`, `skracenica`) VALUES (3, 'Kilogram', 'kg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`kategorija`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`kategorija` (`id`, `naziv`) VALUES (1, 'Slusalice');
INSERT INTO `online_shop`.`kategorija` (`id`, `naziv`) VALUES (2, 'Tastature');
INSERT INTO `online_shop`.`kategorija` (`id`, `naziv`) VALUES (3, 'Misevi');

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`proizvodjac`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`proizvodjac` (`id`, `naziv`) VALUES (1, 'Razer');
INSERT INTO `online_shop`.`proizvodjac` (`id`, `naziv`) VALUES (2, 'Red dragon');
INSERT INTO `online_shop`.`proizvodjac` (`id`, `naziv`) VALUES (3, 'HyperX');
INSERT INTO `online_shop`.`proizvodjac` (`id`, `naziv`) VALUES (4, 'Logitech');

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`proizvod`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`proizvod` (`id`, `naziv`, `cena`, `kolicina`, `opis`, `merna_jedinica_id`, `postoji`, `kategorija_id`, `proizvodjac_id`) VALUES (1, 'Nothosaur M606', 14, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.', 1, 1, 3, 2);
INSERT INTO `online_shop`.`proizvod` (`id`, `naziv`, `cena`, `kolicina`, `opis`, `merna_jedinica_id`, `postoji`, `kategorija_id`, `proizvodjac_id`) VALUES (2, 'BlackWidow X Chroma', 200, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.', 1, 1, 2, 1);
INSERT INTO `online_shop`.`proizvod` (`id`, `naziv`, `cena`, `kolicina`, `opis`, `merna_jedinica_id`, `postoji`, `kategorija_id`, `proizvodjac_id`) VALUES (3, 'G402 Hyperion', 90, 15, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.', 1, 1, 3, 4);
INSERT INTO `online_shop`.`proizvod` (`id`, `naziv`, `cena`, `kolicina`, `opis`, `merna_jedinica_id`, `postoji`, `kategorija_id`, `proizvodjac_id`) VALUES (4, 'Kraken Neon', 70, 20, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.', 1, 1, 1, 1);
INSERT INTO `online_shop`.`proizvod` (`id`, `naziv`, `cena`, `kolicina`, `opis`, `merna_jedinica_id`, `postoji`, `kategorija_id`, `proizvodjac_id`) VALUES (5, 'Cloud ', 95, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.', 1, 1, 1, 3);
INSERT INTO `online_shop`.`proizvod` (`id`, `naziv`, `cena`, `kolicina`, `opis`, `merna_jedinica_id`, `postoji`, `kategorija_id`, `proizvodjac_id`) VALUES (6, 'G613', 170, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rutrum ipsum elit, sed placerat dui blandit eget. Ut gravida ultrices lorem, at ornare sapien posuere sed. Ut aliquam vulputate tellus, ac euismod urna blandit tristique. Vivamus facilisis dui quis dui bibendum fermentum. Nunc suscipit purus vel tortor tempor, ut venenatis lacus efficitur. Aenean consequat convallis hendrerit. Vivamus commodo eu quam id suscipit. Maecenas leo orci, molestie vel turpis in, egestas fringilla nisi. Vivamus sodales dictum dapibus. Cras nunc ipsum, ullamcorper molestie lectus eu, tempor luctus orci. Integer convallis, urna accumsan sagittis aliquam, est augue lacinia neque, eget placerat sem quam et risus. Pellentesque quis accumsan ligula. Maecenas lobortis mi est, sit amet commodo sapien gravida a. Nunc vel tristique odio.', 1, 1, 2, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `online_shop`.`korpa_proizvod`
-- -----------------------------------------------------
START TRANSACTION;
USE `online_shop`;
INSERT INTO `online_shop`.`korpa_proizvod` (`korpa_id`, `proizvod_id`, `kolicina`) VALUES (1, 1, 5);
INSERT INTO `online_shop`.`korpa_proizvod` (`korpa_id`, `proizvod_id`, `kolicina`) VALUES (2, 1, 3);
INSERT INTO `online_shop`.`korpa_proizvod` (`korpa_id`, `proizvod_id`, `kolicina`) VALUES (2, 2, 2);
INSERT INTO `online_shop`.`korpa_proizvod` (`korpa_id`, `proizvod_id`, `kolicina`) VALUES (3, 3, 1);
INSERT INTO `online_shop`.`korpa_proizvod` (`korpa_id`, `proizvod_id`, `kolicina`) VALUES (1, 2, 5);

COMMIT;

