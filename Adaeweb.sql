-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema adaeweb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema adaeweb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `adaeweb` DEFAULT CHARACTER SET utf8 ;
USE `adaeweb` ;

-- -----------------------------------------------------
-- Table `adaeweb`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adaeweb`.`usuario` ;

CREATE TABLE IF NOT EXISTS `adaeweb`.`usuario` (
  `id_usu` INT(8) NOT NULL AUTO_INCREMENT,
  `nom_usu` VARCHAR(45) NOT NULL,
  `contra_usu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adaeweb`.`materia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adaeweb`.`materia` ;

CREATE TABLE IF NOT EXISTS `adaeweb`.`materia` (
  `id_mate` INT NOT NULL,
  `des_mate` VARCHAR(85) NOT NULL,
  PRIMARY KEY (`id_mate`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `adaeweb`.`tarea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `adaeweb`.`tarea` ;

CREATE TABLE IF NOT EXISTS `adaeweb`.`tarea` (
  `id_tarea` INT NOT NULL AUTO_INCREMENT,
  `des_tarea` VARCHAR(45) NOT NULL,
  `estado` INT(2) NOT NULL,
  `fecha` VARCHAR(10) NOT NULL,
  `id_mate` INT(2) NOT NULL,
  `id_usu` INT(8) NOT NULL,
  PRIMARY KEY (`id_tarea`),
  INDEX `id_mate_idx` (`id_mate` ASC) ,
  INDEX `id_usu_idx` (`id_usu` ASC) ,
  CONSTRAINT `id_mater`
    FOREIGN KEY (`id_mate`)
    REFERENCES `adaeweb`.`materia` (`id_mate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_usua`
    FOREIGN KEY (`id_usu`)
    REFERENCES `adaeweb`.`usuario` (`id_usu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `adaeweb`.`materia`
-- -----------------------------------------------------
START TRANSACTION;
USE `adaeweb`;
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (1, 'Cálculo integral');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (2, 'Física III');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (3, 'Química III');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (4, 'Inglés V');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (5, 'Orientación juvenil y profesional III');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (6, 'Introducción a los sistemas distribuidos');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (7, 'Introducción a la ingeniería de pruebas');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (8, 'Seguridad web y aplicaciones');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (9, 'Laboratorio de proyectos de tecnologías de la información III');
INSERT INTO `adaeweb`.`materia` (`id_mate`, `des_mate`) VALUES (10, 'Automatización de pruebas');

COMMIT;

