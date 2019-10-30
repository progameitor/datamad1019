-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coches` DEFAULT CHARACTER SET utf8 ;
USE `coches` ;

-- -----------------------------------------------------
-- Table `coches`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(45) NULL DEFAULT NULL,
  `Manufacturer` VARCHAR(45) NULL DEFAULT NULL,
  `Model` VARCHAR(45) NULL DEFAULT NULL,
  `Year` INT NULL DEFAULT NULL,
  `Color` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coches`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Customer` (
  `ID` INT NOT NULL,
  `Customer` INT NULL DEFAULT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Phone number` VARCHAR(45) NULL DEFAULT NULL,
  `Adress` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Postal` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coches`.`Sales person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Sales person` (
  `ID` INT NOT NULL,
  `Staff id` VARCHAR(45) NULL DEFAULT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Store` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coches`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coches`.`Invoices` (
  `ID` INT NOT NULL,
  `Invoice number` VARCHAR(45) NULL DEFAULT NULL,
  `Date` DATETIME NULL DEFAULT NULL,
  `Sales person_ID` INT NOT NULL,
  `Customer_ID` INT NOT NULL,
  `Cars_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Invoices_Sales person1_idx` (`Sales person_ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Customer1_idx` (`Customer_ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`Cars_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_ID`)
    REFERENCES `coches`.`Cars` (`ID`),
  CONSTRAINT `fk_Invoices_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `coches`.`Customer` (`ID`),
  CONSTRAINT `fk_Invoices_Sales person1`
    FOREIGN KEY (`Sales person_ID`)
    REFERENCES `coches`.`Sales person` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
