-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema pokeExam
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pokeExam
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pokeExam` DEFAULT CHARACTER SET utf8 ;
USE `pokeExam` ;

-- -----------------------------------------------------
-- Table `pokeExam`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokeExam`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `alias` VARCHAR(75) NULL,
  `email` VARCHAR(75) NULL,
  `password` VARCHAR(255) NULL,
  `birthday` DATE NULL,
  `created_at` DATETIME NULL,
  `update_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokeExam`.`Pokes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokeExam`.`Pokes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `being_poked` INT NOT NULL,
  `poking` INT NULL,
  `number_of_poke` INT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Pokes_Users_idx` (`being_poked` ASC),
  CONSTRAINT `fk_Pokes_Users`
    FOREIGN KEY (`being_poked`)
    REFERENCES `pokeExam`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
