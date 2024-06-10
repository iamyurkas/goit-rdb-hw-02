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
-- Table `mydb`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `client_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(45) NULL,
  `client_address` VARCHAR(255) NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `client_id_UNIQUE` (`client_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_date` DATE NULL,
  `client_id` INT UNSIGNED NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  INDEX `client_id_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`items` (
  `item_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(45) NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE INDEX `item_id_UNIQUE` (`item_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders_items` (
  `order_id` INT UNSIGNED NOT NULL,
  `item_id` INT UNSIGNED NULL,
  `item_qty` INT UNSIGNED NULL,
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `item_id_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `mydb`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
