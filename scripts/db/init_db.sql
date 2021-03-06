-- MySQL Script generated by MySQL Workbench
-- ter 05 fev 2019 16:56:08 -02
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema grooty
-- -----------------------------------------------------
-- This database is to the grooty system;
DROP SCHEMA IF EXISTS `grooty`;

-- -----------------------------------------------------
-- Schema grooty
--
-- This database is to the grooty system;
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grooty` DEFAULT CHARACTER SET utf8;
SHOW WARNINGS;
USE `grooty`;

-- -----------------------------------------------------
-- Table `grooty`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grooty`.`client`;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `grooty`.`client`
(
  `id`            INT           NOT NULL AUTO_INCREMENT,
  `name`          VARCHAR(255)  NOT NULL,
  `self_serv_url` VARCHAR(255)  NOT NULL,
  `socket`        VARCHAR(255)  NOT NULL,
  `token_api`     VARCHAR(1024) NOT NULL,
  `site_url`      VARCHAR(255)  NOT NULL,
  `email`         VARCHAR(255)  NOT NULL,
  `welcome_page`  VARCHAR(2048) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC)
)
  ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `grooty`.`faq_question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grooty`.`faq_question`;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `grooty`.`faq_question`
(
  `id`        INT         NOT NULL AUTO_INCREMENT,
  `client_id` INT         NOT NULL,
  `question`  VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_faq_question_client_idx` (`client_id` ASC),
  CONSTRAINT `fk_faq_question_client`
    FOREIGN KEY (`client_id`)
      REFERENCES `grooty`.`client` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
  ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `grooty`.`faq_answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grooty`.`faq_answer`;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `grooty`.`faq_answer`
(
  `id`               INT      NOT NULL AUTO_INCREMENT,
  `faq_question_id` INT      NOT NULL,
  `answer`           LONGTEXT NOT NULL,
  INDEX `fk_table1_faq_question1_idx` (`faq_question_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_table1_faq_question1`
    FOREIGN KEY (`faq_question_id`)
      REFERENCES `grooty`.`faq_question` (`id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
  ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;


INSERT INTO client (name, self_serv_url, socket, token_api, site_url, email, welcome_page)
VALUES ('Luan Santos', 'http://localhost:8082', 'http://localhost:8083', '376c746416e3a83bb4c93696e90d6221',
        'http://localhost:8081', 'luansantos@grooty.com',
        'Ol&#xE1;!&#x3C;p&#x3E;Se voc&#xEA; tiver alguma d&#xFA;vida sobre &#x22;&#x3C;i&#x3E;Como comprar&#x3C;/i&#x3E;&#x22;, &#x22;Como acompanhar o seu pedido&#x22;, &#x22;Como ver o seu hist&#xF3;rico de compras&#x22;, etc. Acesse as perguntas mais frequentes &#x3C;a class=&#x22;js-request-faq&#x22; href=&#x22;http://localhost:8082/faq-question&#x22;&#x3E;clicando aqui&#x3C;/a&#x3E;&#x3C;/p&#x3E;');

SET @client_id = (SELECT id FROM client ORDER BY id DESC LIMIT 1);

INSERT INTO faq_question (client_id, question)
VALUES ( @client_id, 'Como realizar uma compra?');

SET @question_1 = (SELECT id FROM faq_question ORDER BY id DESC LIMIT 1);

INSERT INTO faq_answer (faq_question_id, answer)
VALUES (@question_1, 'Voc&#xEA; deve selecionar um produto e colocar no carrinho e ent&#xE3;o clicar no bot&#xE3;o comprar. Preencha os dados e clique em efetuar compra'),
       (@question_1, 'Voc&#xEA; pode ligar para um de nossos vendedores especializados e ele ir&#xE1; te guiar durante a compra');

INSERT INTO faq_question (client_id, question)
VALUES ( @client_id, 'Como acompanhar o seu pedido?');

SET @question_2 = (SELECT id FROM faq_question ORDER BY id DESC LIMIT 1);
INSERT INTO faq_answer (faq_question_id, answer)
VALUES (@question_2, 'Voc&#xEA; consegue acompanhar todos os status pela sua &#xE1;rea de cliente');


INSERT INTO client (name, self_serv_url, socket, token_api, site_url, email, welcome_page)
VALUES ('Grooty', 'http://localhost:8082', 'http://localhost:8083', 'd41d8cd98f00b204e9800998ecf8427e',
        'http://localhost:8082', 'luansantos@grooty.com',
        'Ol&#xE1;!&#x3C;p&#x3E;Se voc&#xEA; tiver alguma d&#xFA;vida sobre &#x22;&#x3C;i&#x3E;Como comprar&#x3C;/i&#x3E;&#x22;, &#x22;Como acompanhar o seu pedido&#x22;, &#x22;Como ver o seu hist&#xF3;rico de compras&#x22;, etc. Acesse as perguntas mais frequentes &#x3C;a class=&#x22;js-request-faq&#x22; href=&#x22;http://localhost:8082/faq-question&#x22;&#x3E;clicando aqui&#x3C;/a&#x3E;&#x3C;/p&#x3E;');

SET @client_id = (SELECT id FROM client ORDER BY id DESC LIMIT 1);

INSERT INTO faq_question (client_id, question)
VALUES ( @client_id, 'Question 1');

SET @question_1 = (SELECT id FROM faq_question ORDER BY id DESC LIMIT 1);

INSERT INTO faq_answer (faq_question_id, answer)
VALUES (@question_1, 'Answer 1'),
       (@question_1, 'Answer 2');

INSERT INTO faq_question (client_id, question)
VALUES ( @client_id, 'Question 2');

SET @question_2 = (SELECT id FROM faq_question ORDER BY id DESC LIMIT 1);
INSERT INTO faq_answer (faq_question_id, answer)
VALUES (@question_2, 'Answer 1');

