SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE DATABASE  IF NOT EXISTS tis /*!40100 DEFAULT CHARACTER SET latin1*/;
USE tis;

DROP TABLE IF EXISTS `EstCarrera` ;
DROP TABLE IF EXISTS `ProfTesis` ;
DROP TABLE IF EXISTS `EstTesis` ;
DROP TABLE IF EXISTS `Titulo` ;
DROP TABLE IF EXISTS `Docente` ;
DROP TABLE IF EXISTS `Profesional` ;
DROP TABLE IF EXISTS `Modalidad` ;
DROP TABLE IF EXISTS `GestionPer` ;
DROP TABLE IF EXISTS `Tesis` ;
DROP TABLE IF EXISTS `Tribunal` ;
DROP TABLE IF EXISTS `Estudiante` ;
DROP TABLE IF EXISTS `Area` ;
DROP TABLE IF EXISTS `AreasProfesional` ;
DROP TABLE IF EXISTS `AreaTesis` ;
DROP TABLE IF EXISTS `Carrera` ;

-- -----------------------------------------------------
-- Table `EstCarrera`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `EstCarrera` (
  `cod_est` INT NOT NULL ,
  `cod_carrera` INT NOT NULL ,
  PRIMARY KEY (`cod_est`, `cod_carrera`) ,
  INDEX `cod_carrera_idx` (`cod_carrera` ASC) ,
  INDEX `cod_est_idx` (`cod_est` ASC) ,
  CONSTRAINT `cod_est`
    FOREIGN KEY (`cod_est` )
    REFERENCES `Estudiante` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_carrera`
    FOREIGN KEY (`cod_carrera` )
    REFERENCES `Carrera` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ProfTesis`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `ProfTesis` (
  `cod_prof` INT NOT NULL ,
  `cod_tesis` INT NOT NULL ,
  PRIMARY KEY (`cod_prof`, `cod_tesis`) ,
  INDEX `cod_prof_idx` (`cod_prof` ASC) ,
  INDEX `cod_tesis_idx` (`cod_tesis` ASC) ,
  CONSTRAINT `cod_prof`
    FOREIGN KEY (`cod_prof` )
    REFERENCES `Profesional` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_tesis`
    FOREIGN KEY (`cod_tesis` )
    REFERENCES `Tesis` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `EstTesis`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `EstTesis` (
  `cod_alumno` INT NOT NULL ,
  `cod_tes` INT NOT NULL ,
  PRIMARY KEY (`cod_alumno`, `cod_tes`) ,
  INDEX `cod_tes_idx` (`cod_tes` ASC) ,
  INDEX `cod_alumno_idx` (`cod_alumno` ASC) ,
  CONSTRAINT `cod_alumno`
    FOREIGN KEY (`cod_alumno` )
    REFERENCES `Estudiante` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_tes`
    FOREIGN KEY (`cod_tes` )
    REFERENCES `Tesis` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Titulo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Titulo` (
  `codigo` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`codigo`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Docente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Docente` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `carga_horaria` VARCHAR(45) NULL ,
  `telefono` VARCHAR(8) NULL ,
  `direccion` VARCHAR(45) NULL ,
  `ci` VARCHAR(45) NULL ,
  `dir_fot` VARCHAR(45) NULL ,
  `cod_tip` INT NULL ,
  `cod_cue` INT NULL ,
  PRIMARY KEY (`codigo`) ,
  UNIQUE INDEX `idDocente_UNIQUE` (`codigo` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Profesional`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Profesional` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apellido_paterno` VARCHAR(45) NOT NULL ,
  `apellido_materno` VARCHAR(45) NOT NULL ,
  `titulo` INT NOT NULL ,
  `cod_docente` INT NULL DEFAULT 0,
  `correo` VARCHAR(45) NULL ,
  PRIMARY KEY (`codigo`) ,
  UNIQUE INDEX `id_UNIQUE` (`codigo` ASC) ,
  INDEX `titulo_idx` (`titulo` ASC) ,
  UNIQUE INDEX `cod_docente_UNIQUE` (`cod_docente` ASC) ,
  CONSTRAINT `titulo`
    FOREIGN KEY (`titulo` )
    REFERENCES `Titulo` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_docente`
    FOREIGN KEY (`cod_docente` )
    REFERENCES `Docente` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Modalidad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Modalidad` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(200) NULL ,
  PRIMARY KEY (`codigo`) ,
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `GestionPer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `GestionPer` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `fecha_ini` DATE NULL ,
  `fecha_fin` DATE NULL ,
  `periodo` INT NULL ,
  PRIMARY KEY (`codigo`) ,
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Tesis`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Tesis` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `codigo_tesis` VARCHAR(45) NOT NULL ,
  `nombre` VARCHAR(200) NOT NULL ,
  `descripcion` VARCHAR(200) NULL ,
  `estado` VARCHAR(1) NOT NULL ,
  `dir_form` VARCHAR(45) NULL ,
  `cod_ges_per_ini` INT NULL ,
  `cod_ges_per_fin` INT NULL ,
  `fecha_registro` INT NULL ,
  `cod_modalidad` INT NOT NULL ,
  `cod_emp` INT NULL ,
  `obj_gral` VARCHAR(200) NULL ,
  `carrera` INT NOT NULL,
  PRIMARY KEY (`codigo`) ,
  UNIQUE INDEX `idProyecto_UNIQUE` (`codigo` ASC) ,
  UNIQUE INDEX `codigo_tesis_UNIQUE` (`codigo_tesis` ASC) ,
  INDEX `cod_modalidad_idx` (`cod_modalidad` ASC) ,
  INDEX `cod_ges_per_ini_idx` (`cod_ges_per_ini` ASC) ,
  INDEX `cod_ges_per_fin_idx` (`cod_ges_per_fin` ASC) ,
  INDEX `carrera_idx` (`carrera` ASC),
  CONSTRAINT `cod_modalidad`
    FOREIGN KEY (`cod_modalidad` )
    REFERENCES `Modalidad` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_ges_per_ini`
    FOREIGN KEY (`cod_ges_per_ini` )
    REFERENCES `GestionPer` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cod_ges_per_fin`
    FOREIGN KEY (`cod_ges_per_fin` )
    REFERENCES `GestionPer` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `carrera`
    FOREIGN KEY (`carrera` )
    REFERENCES `Carrera` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Tribunal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Tribunal` (
  `idTribunal` INT NOT NULL AUTO_INCREMENT ,
  `id_profesional1` INT NOT NULL ,
  `id_profesional2` INT NOT NULL ,
  `id_profesional3` INT NOT NULL ,
  `id_tesis` INT NOT NULL ,
  `fecha_defensa` DATE NOT NULL ,
  PRIMARY KEY (`idTribunal`) ,
  INDEX `id_proyecto_idx` (`id_tesis` ASC) ,
  UNIQUE INDEX `id_proyecto_UNIQUE` (`id_tesis` ASC) ,
  UNIQUE INDEX `idTribunal_UNIQUE` (`idTribunal` ASC) ,
  INDEX `profesional1_idx` (`id_profesional1` ASC) ,
  INDEX `profesional2_idx` (`id_profesional2` ASC) ,
  INDEX `profesional3_idx` (`id_profesional3` ASC) ,
  CONSTRAINT `profesional1`
    FOREIGN KEY (`id_profesional1` )
    REFERENCES `Profesional` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_proyecto`
    FOREIGN KEY (`id_tesis` )
    REFERENCES `Tesis` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `profesional2`
    FOREIGN KEY (`id_profesional2` )
    REFERENCES `Profesional` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `profesional3`
    FOREIGN KEY (`id_profesional3` )
    REFERENCES `Profesional` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Estudiante`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Estudiante` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `cod_sis` INT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apellido_pat` VARCHAR(45) NOT NULL ,
  `apellido_mat` VARCHAR(45) NOT NULL ,
  `telefono` INT NULL ,
  `direccion` VARCHAR(45) NULL ,
  `cod_cue` VARCHAR(45) NULL ,
  `correo` VARCHAR(45) NULL ,
  `ci` VARCHAR(45) NULL ,
  `dir_fot` INT NULL ,
  PRIMARY KEY (`codigo`) ,
  UNIQUE INDEX `id_estudiante_UNIQUE` (`codigo` ASC) ,
  UNIQUE INDEX `cod_sis_UNIQUE` (`cod_sis` ASC) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Area`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Area` (
  `idArea` INT NOT NULL AUTO_INCREMENT ,
  `nombre_area` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NULL DEFAULT 'Area de conocimiento o area de interes' ,
  `id_subarea` INT NULL,
  PRIMARY KEY (`idArea`) ,
  INDEX `id_subarea_idx` (`id_subarea` ASC) ,
  UNIQUE INDEX `idArea_UNIQUE` (`idArea` ASC) ,
  CONSTRAINT `id_subarea`
    FOREIGN KEY (`id_subarea` )
    REFERENCES `Area` (`idArea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AreasProfesional`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `AreasProfesional` (
  `id_profesional` INT NOT NULL ,
  `id_area` INT NOT NULL ,
  INDEX `area_idx` (`id_area` ASC) ,
  PRIMARY KEY (`id_profesional`, `id_area`) ,
  INDEX `profesional_idx` (`id_profesional` ASC) ,
  CONSTRAINT `area`
    FOREIGN KEY (`id_area` )
    REFERENCES `Area` (`idArea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `profesional`
    FOREIGN KEY (`id_profesional` )
    REFERENCES `Profesional` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `AreaTesis`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `AreaTesis` (
  `id_tesis` INT NOT NULL ,
  `id_area` INT NOT NULL ,
  INDEX `area_idx` (`id_area` ASC) ,
  INDEX `proyecto_idx` (`id_tesis` ASC) ,
  PRIMARY KEY (`id_tesis`, `id_area`) ,
  CONSTRAINT `area0`
    FOREIGN KEY (`id_area` )
    REFERENCES `Area` (`idArea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `proyecto`
    FOREIGN KEY (`id_tesis` )
    REFERENCES `Tesis` (`codigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Carrera`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Carrera` (
  `codigo` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(50) NOT NULL ,
  `descripcion` VARCHAR(200) NULL ,
  `anios_est` INT NOT NULL ,
  PRIMARY KEY (`codigo`) ,
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;