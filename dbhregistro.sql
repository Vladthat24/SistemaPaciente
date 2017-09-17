-- MySQL Script generated by MySQL Workbench
-- mar 12 sep 2017 23:16:08 -05
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dbhregistro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbhregistro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbhregistro` DEFAULT CHARACTER SET utf8 ;
USE `dbhregistro` ;

-- -----------------------------------------------------
-- Table `dbhregistro`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhregistro`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `historia_clinica` VARCHAR(35) NOT NULL,
  `nombre` VARCHAR(35) NOT NULL,
  `apaterno` VARCHAR(25) NOT NULL,
  `amaterno` VARCHAR(25) NOT NULL,
  `tipo_seguro` VARCHAR(10) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(9) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` VARCHAR(20) NOT NULL,
  `edad` VARCHAR(30) NOT NULL,
  `fa_nombres` VARCHAR(35) NOT NULL,
  `fa_apellidos` VARCHAR(35) NOT NULL,
  `fa_edad` VARCHAR(3) NOT NULL,
  `fa_direccion` VARCHAR(35) NOT NULL,
  `fecha_actual` VARCHAR(25) NOT NULL,
  `estado_civil` VARCHAR(10) NOT NULL,
  `tipo_documento` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE INDEX `historia_clinica_UNIQUE` (`historia_clinica` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbhregistro`.`h_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhregistro`.`h_paciente` (
  `idpersona` INT NOT NULL,
  `codigo_paciente_dni` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`idpersona`),
  UNIQUE INDEX `codigo_paciente_dni_UNIQUE` (`codigo_paciente_dni` ASC),
  CONSTRAINT `fk_persona_hpaciente`
    FOREIGN KEY (`idpersona`)
    REFERENCES `dbhregistro`.`persona` (`idpersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbhregistro`.`persona_trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhregistro`.`persona_trabajador` (
  `idptrabajador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  `apaterno` VARCHAR(25) NOT NULL,
  `amaterno` VARCHAR(25) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `tipo_documento` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`idptrabajador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbhregistro`.`trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhregistro`.`trabajador` (
  `idptrabajador` INT NOT NULL,
  `num_documento` VARCHAR(8) NOT NULL,
  `celular` VARCHAR(9) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `fecha_registro` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idptrabajador`),
  UNIQUE INDEX `num_documento_UNIQUE` (`num_documento` ASC),
  CONSTRAINT `fk_persona_trabajador_trabajador`
    FOREIGN KEY (`idptrabajador`)
    REFERENCES `dbhregistro`.`persona_trabajador` (`idptrabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbhregistro`.`acceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbhregistro`.`acceso` (
  `idacceso` INT NOT NULL AUTO_INCREMENT,
  `idtrabajador` INT NOT NULL,
  `acceso` VARCHAR(13) NOT NULL,
  `login` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idacceso`),
  INDEX `fk_trabajador_acceso_idx` (`idtrabajador` ASC),
  UNIQUE INDEX `acceso_UNIQUE` (`acceso` ASC),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `estado_UNIQUE` (`estado` ASC),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC),
  CONSTRAINT `fk_trabajador_acceso`
    FOREIGN KEY (`idtrabajador`)
    REFERENCES `dbhregistro`.`trabajador` (`idptrabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
