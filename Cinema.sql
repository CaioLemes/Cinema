-- MySQL Script generated by MySQL Workbench
-- 09/04/17 14:06:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema CatalogoFilmes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CatalogoFilmes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CatalogoFilmes` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `CatalogoFilmes` ;

-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Filmes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Filmes` (
  `idFilmes` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `distribuidora` VARCHAR(45) NOT NULL,
  `duracao` VARCHAR(45) NOT NULL,
  `classificacao` VARCHAR(45) NOT NULL,
  `orcamento` DECIMAL(10,2) NOT NULL,
  `dataestreia` DATE NOT NULL,
  `datasaida` DATE NOT NULL,
  PRIMARY KEY (`idFilmes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Diretor` (
  `idDiretor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` VARCHAR(45) NULL,
  PRIMARY KEY (`idDiretor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Ator` (
  `idAtor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` VARCHAR(45) NULL,
  PRIMARY KEY (`idAtor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Critica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Critica` (
  `idCritica` INT NOT NULL AUTO_INCREMENT,
  `estrelas` INT NULL,
  PRIMARY KEY (`idCritica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Genero` (
  `idGenero` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Filmes_has_Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Filmes_has_Diretor` (
  `Filmes_idFilmes` INT NOT NULL,
  `Diretor_idDiretor` INT NOT NULL,
  PRIMARY KEY (`Filmes_idFilmes`, `Diretor_idDiretor`),
  INDEX `fk_Filmes_has_Diretor_Diretor1_idx` (`Diretor_idDiretor` ASC),
  INDEX `fk_Filmes_has_Diretor_Filmes_idx` (`Filmes_idFilmes` ASC),
  CONSTRAINT `fk_Filmes_has_Diretor_Filmes`
    FOREIGN KEY (`Filmes_idFilmes`)
    REFERENCES `CatalogoFilmes`.`Filmes` (`idFilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filmes_has_Diretor_Diretor1`
    FOREIGN KEY (`Diretor_idDiretor`)
    REFERENCES `CatalogoFilmes`.`Diretor` (`idDiretor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Filmes_has_Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Filmes_has_Ator` (
  `Filmes_idFilmes` INT NOT NULL,
  `Ator_idAtor` INT NOT NULL,
  PRIMARY KEY (`Filmes_idFilmes`, `Ator_idAtor`),
  INDEX `fk_Filmes_has_Ator_Ator1_idx` (`Ator_idAtor` ASC),
  INDEX `fk_Filmes_has_Ator_Filmes1_idx` (`Filmes_idFilmes` ASC),
  CONSTRAINT `fk_Filmes_has_Ator_Filmes1`
    FOREIGN KEY (`Filmes_idFilmes`)
    REFERENCES `CatalogoFilmes`.`Filmes` (`idFilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filmes_has_Ator_Ator1`
    FOREIGN KEY (`Ator_idAtor`)
    REFERENCES `CatalogoFilmes`.`Ator` (`idAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Filmes_has_Critica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Filmes_has_Critica` (
  `Filmes_idFilmes` INT NOT NULL,
  `Critica_idCritica` INT NOT NULL,
  PRIMARY KEY (`Filmes_idFilmes`, `Critica_idCritica`),
  INDEX `fk_Filmes_has_Critica_Critica1_idx` (`Critica_idCritica` ASC),
  INDEX `fk_Filmes_has_Critica_Filmes1_idx` (`Filmes_idFilmes` ASC),
  CONSTRAINT `fk_Filmes_has_Critica_Filmes1`
    FOREIGN KEY (`Filmes_idFilmes`)
    REFERENCES `CatalogoFilmes`.`Filmes` (`idFilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filmes_has_Critica_Critica1`
    FOREIGN KEY (`Critica_idCritica`)
    REFERENCES `CatalogoFilmes`.`Critica` (`idCritica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CatalogoFilmes`.`Filmes_has_Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CatalogoFilmes`.`Filmes_has_Genero` (
  `Filmes_idFilmes` INT NOT NULL,
  `Genero_idGenero` INT NOT NULL,
  PRIMARY KEY (`Filmes_idFilmes`, `Genero_idGenero`),
  INDEX `fk_Filmes_has_Genero_Genero1_idx` (`Genero_idGenero` ASC),
  INDEX `fk_Filmes_has_Genero_Filmes1_idx` (`Filmes_idFilmes` ASC),
  CONSTRAINT `fk_Filmes_has_Genero_Filmes1`
    FOREIGN KEY (`Filmes_idFilmes`)
    REFERENCES `CatalogoFilmes`.`Filmes` (`idFilmes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filmes_has_Genero_Genero1`
    FOREIGN KEY (`Genero_idGenero`)
    REFERENCES `CatalogoFilmes`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
