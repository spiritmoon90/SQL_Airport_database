-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Passengers` (
  `passenger_id` INT NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `First_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`passenger_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Airlines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Airlines` (
  `airline_id` TINYINT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`airline_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`depart_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`depart_location` (
  `depart_id` MEDIUMINT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  PRIMARY KEY (`depart_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`arrive_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`arrive_location` (
  `arrive_id` MEDIUMINT NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  PRIMARY KEY (`arrive_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Flights` (
  `flight_id` INT NOT NULL,
  `airline_id` TINYINT NOT NULL,
  `depart_date` DATETIME NOT NULL,
  `arrive_date` DATETIME NOT NULL,
  `passenger_id` INT NOT NULL,
  `depart_id` MEDIUMINT NOT NULL,
  `arrive_id` MEDIUMINT NOT NULL,
  `flight_dur_mins` MEDIUMINT NOT NULL,
  PRIMARY KEY (`flight_id`),
  INDEX `fk_Flights_Passengers1_idx` (`passenger_id` ASC) VISIBLE,
  INDEX `fk_Flights_depart_location1_idx` (`depart_id` ASC) VISIBLE,
  INDEX `fk_Flights_arrive_location1_idx` (`arrive_id` ASC) VISIBLE,
  CONSTRAINT `fk_Flights_Passengers1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `mydb`.`Passengers` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Flights_depart_location1`
    FOREIGN KEY (`depart_id`)
    REFERENCES `mydb`.`depart_location` (`depart_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Flights_arrive_location1`
    FOREIGN KEY (`arrive_id`)
    REFERENCES `mydb`.`arrive_location` (`arrive_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Class` (
  `Class_id` TINYINT NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`Class_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tickets` (
  `ticket_id` INT NOT NULL,
  `confirmation` CHAR(6) NOT NULL,
  `airline_id` TINYINT NOT NULL,
  `passenger_id` INT NOT NULL,
  `Class_id` TINYINT NOT NULL,
  `price` MEDIUMINT NOT NULL,
  INDEX `fk_Tickets_Airlines1_idx` (`airline_id` ASC) VISIBLE,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_Tickets_Passengers1_idx` (`passenger_id` ASC) VISIBLE,
  INDEX `fk_Tickets_Class1_idx` (`Class_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tickets_Airlines1`
    FOREIGN KEY (`airline_id`)
    REFERENCES `mydb`.`Airlines` (`airline_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tickets_Passengers1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `mydb`.`Passengers` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Tickets_Class1`
    FOREIGN KEY (`Class_id`)
    REFERENCES `mydb`.`Class` (`Class_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
