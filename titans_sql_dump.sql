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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
-- -----------------------------------------------------
-- Schema titans_homework_3
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`regions` (
  `region_id` INT NOT NULL,
  `region_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`countries` (
  `country_id` INT NOT NULL,
  `country_name` VARCHAR(45) NULL DEFAULT NULL,
  `region_id` INT NOT NULL,
  PRIMARY KEY (`country_id`, `region_id`),
  INDEX `region_id_fk_idx` (`region_id` ASC),
  CONSTRAINT `region_id_fk`
    FOREIGN KEY (`region_id`)
    REFERENCES `mydb`.`regions` (`region_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`locations` (
  `location_id` INT NOT NULL,
  `street_address` VARCHAR(45) NULL DEFAULT NULL,
  `postal_code` INT NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state_province` VARCHAR(45) NULL DEFAULT NULL,
  `country_id` INT NOT NULL,
  PRIMARY KEY (`location_id`, `country_id`),
  INDEX `country_id_fk_idx` (`country_id` ASC),
  CONSTRAINT `country_id_fk`
    FOREIGN KEY (`country_id`)
    REFERENCES `mydb`.`countries` (`country_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departments` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(45) NULL DEFAULT NULL,
  `manager_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`department_id`, `manager_id`, `location_id`),
  INDEX `location_id_fk_idx` (`location_id` ASC),
  CONSTRAINT `location_id_fk`
    FOREIGN KEY (`location_id`)
    REFERENCES `mydb`.`locations` (`location_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`jobs` (
  `job_id` INT NOT NULL,
  `job_title` VARCHAR(45) NULL DEFAULT NULL,
  `min_salary` INT NULL DEFAULT NULL,
  `max_salary` INT NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `employee_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` INT NULL DEFAULT NULL,
  `hire_date` VARCHAR(45) NULL DEFAULT NULL,
  `job_id` INT NOT NULL,
  `salary` INT NULL DEFAULT NULL,
  `comimission_pct` VARCHAR(45) NULL DEFAULT NULL,
  `manager_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `job_id`, `manager_id`, `department_id`),
  INDEX `department_id_idx` (`department_id` ASC),
  INDEX `manager_id_fk_idx` (`manager_id` ASC),
  INDEX `job_id_fk_idx` (`job_id` ASC) VISIBLE,
  CONSTRAINT `department_id_fk`
    FOREIGN KEY (`department_id`)
    REFERENCES `mydb`.`departments` (`department_id`),
  CONSTRAINT `job_id_fk`
    FOREIGN KEY (`job_id`)
    REFERENCES `mydb`.`jobs` (`job_id`),
  CONSTRAINT `manager_id_fk`
    FOREIGN KEY (`manager_id`)
    REFERENCES `mydb`.`employees` (`employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`job_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`job_history` (
  `employee_id` INT NOT NULL,
  `start_date` DATETIME NULL DEFAULT NULL,
  `end_date` DATETIME NULL DEFAULT NULL,
  `job_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `job_id`, `department_id`),
  INDEX `jobh_id_fk_idx` (`job_id` ASC),
  INDEX `departmenth_id_fk_idx` (`department_id` ASC),
  CONSTRAINT `departmenth_id_fk`
    FOREIGN KEY (`department_id`)
    REFERENCES `mydb`.`departments` (`department_id`),
  CONSTRAINT `employee_id_fk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `mydb`.`employees` (`employee_id`),
  CONSTRAINT `jobh_id_fk`
    FOREIGN KEY (`job_id`)
    REFERENCES `mydb`.`jobs` (`job_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
