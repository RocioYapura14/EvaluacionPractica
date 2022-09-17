-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EvaluacionPractica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EvaluacionPractica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EvaluacionPractica` DEFAULT CHARACTER SET utf8 ;
USE `EvaluacionPractica` ;

-- -----------------------------------------------------
-- Table `EvaluacionPractica`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EvaluacionPractica`.`Users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EvaluacionPractica`.`Notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EvaluacionPractica`.`Notes` (
  `idNotes` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `create_date` DATE NOT NULL,
  `modify_date` DATE NOT NULL,
  `description` TEXT(10000) NOT NULL,
  `delete` TINYINT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`idNotes`),
  UNIQUE INDEX `create_date_UNIQUE` (`create_date` ASC) VISIBLE,
  INDEX `fk_Notes_Users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Notes_Users`
    FOREIGN KEY (`users_id`)
    REFERENCES `EvaluacionPractica`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EvaluacionPractica`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EvaluacionPractica`.`Categories` (
  `idCategories` INT NOT NULL AUTO_INCREMENT,
  `name` INT NOT NULL,
  PRIMARY KEY (`idCategories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EvaluacionPractica`.`Notes_Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EvaluacionPractica`.`Notes_Categories` (
  `idNotes_Categories` INT NOT NULL AUTO_INCREMENT,
  `id_notes` INT NOT NULL,
  `id_categories` INT NOT NULL,
  PRIMARY KEY (`idNotes_Categories`),
  INDEX `fk_categories_notes_idx` (`id_categories` ASC) VISIBLE,
  INDEX `fk_notes_categories_idx` (`id_notes` ASC) VISIBLE,
  CONSTRAINT `fk_categories_notes`
    FOREIGN KEY (`id_categories`)
    REFERENCES `EvaluacionPractica`.`Categories` (`idCategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_categories`
    FOREIGN KEY (`id_notes`)
    REFERENCES `EvaluacionPractica`.`Notes` (`idNotes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
