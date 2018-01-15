-- MySQL Script generated by MySQL Workbench
-- Tue Dec 19 11:07:29 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8;
USE mydb;

-- -----------------------------------------------------
-- Table mydb.student
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS student (
  id_student INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(65) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_student),
  UNIQUE INDEX id_student_UNIQUE (id_student ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.quiz
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS quiz (
  id_quiz INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(250) NOT NULL,
  PRIMARY KEY (id_quiz),
  UNIQUE INDEX id_quiz_UNIQUE (id_quiz ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.question
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS question (
  id_question INT NOT NULL AUTO_INCREMENT,
  text VARCHAR(500) NOT NULL,
  id_quiz INT NOT NULL,
  PRIMARY KEY (id_question),
  UNIQUE INDEX id_question_UNIQUE (id_question ASC),
  INDEX question_id_quiz_fk_idx (id_quiz ASC),
  CONSTRAINT question_id_quiz_fk
    FOREIGN KEY (id_quiz)
    REFERENCES quiz (id_quiz)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Answer
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS answer (
  id_answer INT NOT NULL AUTO_INCREMENT,
  text VARCHAR(250) NOT NULL,
  is_correct TINYINT NOT NULL,
  id_question INT NOT NULL,
  PRIMARY KEY (id_answer),
  UNIQUE INDEX id_answer_UNIQUE (id_answer ASC),
  INDEX answer_id_question_fk_idx (id_question ASC),
  CONSTRAINT answer_id_question_fk
    FOREIGN KEY (id_question)
    REFERENCES question (id_question)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.student_answer
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS student_answer (
  id_student INT NOT NULL,
  id_answer INT NOT NULL,
  PRIMARY KEY (id_student, id_answer),
  INDEX student_answer_id_answer_idx (id_answer ASC),
  CONSTRAINT student_answer_id_student_fk
    FOREIGN KEY (id_student)
    REFERENCES student (id_student)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT student_answer_id_answer
    FOREIGN KEY (id_answer)
    REFERENCES answer (id_answer)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;