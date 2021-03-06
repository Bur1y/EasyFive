-- MySQL Script generated by MySQL Workbench
-- Thu Jun  2 01:03:08 2022
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`biomaterial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`biomaterial` (
                                                    `idbiomaterial` INT NOT NULL,
                                                    PRIMARY KEY (`idbiomaterial`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`services` (
                                                 `idservices` INT NOT NULL AUTO_INCREMENT,
                                                 `name` VARCHAR(45) NULL,
    `cost` VARCHAR(45) NULL,
    `code_services` VARCHAR(45) NULL,
    `deadline` INT NULL,
    `mean_deviation` VARCHAR(45) NULL,
    PRIMARY KEY (`idservices`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`services` (
                                                 `idservices` INT NOT NULL AUTO_INCREMENT,
                                                 `name` VARCHAR(45) NULL,
    `cost` VARCHAR(45) NULL,
    `code_services` VARCHAR(45) NULL,
    `deadline` INT NULL,
    `mean_deviation` VARCHAR(45) NULL,
    PRIMARY KEY (`idservices`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`companys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`companys` (
                                                 `idcompanys` INT NOT NULL AUTO_INCREMENT,
                                                 `name` VARCHAR(45) NULL,
    `address` VARCHAR(45) NULL,
    `INN` INT NULL,
    `r/s` INT NULL,
    `BIK` INT NULL,
    `companyscol` VARCHAR(45) NULL,
    PRIMARY KEY (`idcompanys`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patients` (
                                                 `idpatients` INT NOT NULL AUTO_INCREMENT,
                                                 `login` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `date_birth` DATE NULL,
    `series_number_passport` VARCHAR(45) NULL,
    `phone` VARCHAR(45) NULL,
    `email` VARCHAR(45) NULL,
    `policy_number` INT NULL,
    `type_policy` VARCHAR(45) NULL,
    `company` INT NOT NULL,
    PRIMARY KEY (`idpatients`, `company`),
    INDEX `fk_patients_companys_idx` (`company` ASC) VISIBLE,
    CONSTRAINT `fk_patients_companys`
    FOREIGN KEY (`company`)
    REFERENCES `mydb`.`companys` (`idcompanys`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tients` (
                                               `services_idservices` INT NOT NULL,
                                               `patients_idpatients` INT NOT NULL,
                                               `patients_company` INT NOT NULL,
                                               PRIMARY KEY (`services_idservices`, `patients_idpatients`, `patients_company`),
    INDEX `fk_services_has_patients_patients1_idx` (`patients_idpatients` ASC, `patients_company` ASC) VISIBLE,
    INDEX `fk_services_has_patients_services1_idx` (`services_idservices` ASC) VISIBLE,
    CONSTRAINT `fk_services_has_patients_services1`
    FOREIGN KEY (`services_idservices`)
    REFERENCES `mydb`.`services` (`idservices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_services_has_patients_patients1`
    FOREIGN KEY (`patients_idpatients` , `patients_company`)
    REFERENCES `mydb`.`patients` (`idpatients` , `company`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
                                               `idorder` INT NOT NULL AUTO_INCREMENT,
                                               `servicess` INT NOT NULL,
                                               `patients_idpatients` INT NOT NULL,
                                               `date_create` DATE NULL,
                                               `status_order` VARCHAR(45) NULL,
    `status_services` VARCHAR(45) NULL,
    `lead_time` INT NULL,
    INDEX `fk_services_has_patients_patients2_idx` (`patients_idpatients` ASC) VISIBLE,
    INDEX `fk_services_has_patients_services2_idx` (`servicess` ASC) VISIBLE,
    PRIMARY KEY (`idorder`, `servicess`, `patients_idpatients`),
    CONSTRAINT `fk_services_has_patients_services2`
    FOREIGN KEY (`servicess`)
    REFERENCES `mydb`.`services` (`idservices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_services_has_patients_patients2`
    FOREIGN KEY (`patients_idpatients`)
    REFERENCES `mydb`.`patients` (`idpatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`data_analyzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`data_analyzer` (
                                                      `iddata_analyzer` INT NOT NULL AUTO_INCREMENT,
                                                      `orders_idorder` INT NOT NULL,
                                                      `orders_servicess` INT NOT NULL,
                                                      `date_receipt` DATETIME NULL,
                                                      `duration` INT NULL,
                                                      PRIMARY KEY (`iddata_analyzer`, `orders_idorder`, `orders_servicess`),
    INDEX `fk_data_analyzer_orders1_idx` (`orders_idorder` ASC, `orders_servicess` ASC) VISIBLE,
    CONSTRAINT `fk_data_analyzer_orders1`
    FOREIGN KEY (`orders_idorder` , `orders_servicess`)
    REFERENCES `mydb`.`orders` (`idorder` , `servicess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`assistants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`assistants` (
                                                   `idassistants` INT NOT NULL AUTO_INCREMENT,
                                                   `login` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `FIO` VARCHAR(45) NULL,
    `release_date` DATETIME NULL,
    `set_services` VARCHAR(45) NULL,
    PRIMARY KEY (`idassistants`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service_rendered`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`service_rendered` (
                                                         `idrendered` INT NOT NULL AUTO_INCREMENT,
                                                         `iddata_analyzer` INT NOT NULL,
                                                         `idorder` INT NOT NULL,
                                                         `servicess` INT NOT NULL,
                                                         `idassistants` INT NOT NULL,
                                                         `date` DATETIME NULL,
                                                         PRIMARY KEY (`idrendered`, `iddata_analyzer`, `idorder`, `servicess`, `idassistants`),
    INDEX `fk_data_analyzer_has_assistants_assistants1_idx` (`idassistants` ASC) VISIBLE,
    INDEX `fk_data_analyzer_has_assistants_data_analyzer1_idx` (`iddata_analyzer` ASC, `idorder` ASC, `servicess` ASC) VISIBLE,
    CONSTRAINT `fk_data_analyzer_has_assistants_data_analyzer1`
    FOREIGN KEY (`iddata_analyzer` , `idorder` , `servicess`)
    REFERENCES `mydb`.`data_analyzer` (`iddata_analyzer` , `orders_idorder` , `orders_servicess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_data_analyzer_has_assistants_assistants1`
    FOREIGN KEY (`idassistants`)
    REFERENCES `mydb`.`assistants` (`idassistants`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`accountant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`accountant` (
                                                   `idassistants` INT NOT NULL AUTO_INCREMENT,
                                                   `login` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    `FIO` VARCHAR(45) NULL,
    `release_date` DATETIME NULL,
    `set_services` VARCHAR(45) NULL,
    `company_accounts` VARCHAR(45) NULL,
    PRIMARY KEY (`idassistants`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`admin` (
                                              `idadmin` INT NOT NULL,
                                              `login` VARCHAR(45) NULL,
    `password` VARCHAR(45) NULL,
    PRIMARY KEY (`idadmin`))
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
