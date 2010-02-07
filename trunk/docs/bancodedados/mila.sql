SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mila` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mila`;

-- -----------------------------------------------------
-- Table `mila`.`pedido`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`pedido` (
  `pedido_id` INT NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(250) NULL ,
  `data_pedido` DATETIME NULL ,
  `data_evento` DATETIME NULL ,
  `data_entrega` DATETIME NULL ,
  `valor_total` FLOAT NULL ,
  `valor_pago` FLOAT NULL ,
  `producao` TINYINT(1) NULL ,
  `observacoes` VARCHAR(250) NULL ,
  PRIMARY KEY (`pedido_id`) )
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`layout`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`layout` (
  `layout_id` INT NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(250) NULL ,
  `cor_vies` VARCHAR(250) NULL ,
  `cor_ribana` VARCHAR(250) NULL ,
  `tecido` VARCHAR(250) NULL ,
  `url_estampa` VARCHAR(250) NULL ,
  PRIMARY KEY (`layout_id`) )
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`cliente` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(250) NULL ,
  `endereco` VARCHAR(250) NULL ,
  `bairro` VARCHAR(250) NULL ,
  `cidade` VARCHAR(250) NULL ,
  `uf` VARCHAR(250) NULL ,
  `cep` VARCHAR(250) NULL ,
  `email` VARCHAR(250) NULL ,
  `telefone` VARCHAR(250) NULL ,
  `contato` VARCHAR(250) NULL ,
  `cnpj_cpf` VARCHAR(250) NULL ,
  `data_evento` DATETIME NULL ,
  PRIMARY KEY (`cliente_id`) )
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`pedido_layout`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`pedido_layout` (
  `pedido_layout_id` INT NOT NULL AUTO_INCREMENT ,
  `item_produto` VARCHAR(250) NULL ,
  `item_quantidade` INT NULL ,
  `item_rs_unidade` FLOAT NULL ,
  `item_valor` FLOAT NULL ,
  `item_tipo_impressao` ENUM('offset','silkscreen') NULL ,
  `camisa_gld` INT NULL ,
  `camisa_egg` INT NULL ,
  `camisa_gg` INT NULL ,
  `camisa_g` INT NULL ,
  `camisa_m` INT NULL ,
  `camisa_p` INT NULL ,
  `infantil_14` INT NULL ,
  `infantil_12` INT NULL ,
  `infantil_10` INT NULL ,
  `infantil_08` INT NULL ,
  `infantil_06` INT NULL ,
  `abada_gld` INT NULL ,
  `abada_egg` INT NULL ,
  `abada_gg` INT NULL ,
  `abada_g` INT NULL ,
  `abada_m` INT NULL ,
  `abada_p` INT NULL ,
  `babylook_g` INT NULL ,
  `babylook_m` INT NULL ,
  `babylook_p` INT NULL ,
  `pedido_id` INT NOT NULL ,
  `layout_id` INT NOT NULL ,
  `cliente_id` INT NOT NULL ,
  PRIMARY KEY (`pedido_layout_id`) ,
  INDEX `fk_pedido_layout_pedido` (`pedido_id` ASC) ,
  INDEX `fk_pedido_layout_layout1` (`layout_id` ASC) ,
  INDEX `fk_pedido_layout_cliente1` (`cliente_id` ASC) ,
  CONSTRAINT `fk_pedido_layout_pedido`
    FOREIGN KEY (`pedido_id` )
    REFERENCES `mila`.`pedido` (`pedido_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_layout_layout1`
    FOREIGN KEY (`layout_id` )
    REFERENCES `mila`.`layout` (`layout_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_layout_cliente1`
    FOREIGN KEY (`cliente_id` )
    REFERENCES `mila`.`cliente` (`cliente_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`acabamento_embalagem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`acabamento_embalagem` (
  `acabamento_embalagem_id` INT NOT NULL AUTO_INCREMENT ,
  `data_inicio_producao` DATETIME NULL ,
  `data_fim_producao` DATETIME NULL ,
  `total` INT NULL ,
  `pedido_layout_id` INT NOT NULL ,
  PRIMARY KEY (`acabamento_embalagem_id`) ,
  INDEX `fk_acabamento_embalagem_pedido_layout1` (`pedido_layout_id` ASC) ,
  CONSTRAINT `fk_acabamento_embalagem_pedido_layout1`
    FOREIGN KEY (`pedido_layout_id` )
    REFERENCES `mila`.`pedido_layout` (`pedido_layout_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`impressao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`impressao` (
  `impressao_id` INT NOT NULL AUTO_INCREMENT ,
  `data_inicio_producao` DATETIME NULL ,
  `data_fim_producao` DATETIME NULL ,
  `total` INT NULL ,
  `tipo` ENUM('offset','silkscreen') NULL ,
  `pedido_layout_id` INT NOT NULL ,
  PRIMARY KEY (`impressao_id`) ,
  INDEX `fk_impressao_pedido_layout1` (`pedido_layout_id` ASC) ,
  CONSTRAINT `fk_impressao_pedido_layout1`
    FOREIGN KEY (`pedido_layout_id` )
    REFERENCES `mila`.`pedido_layout` (`pedido_layout_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`fotolito`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`fotolito` (
  `fotolito_id` INT NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(250) NULL ,
  `data_inicio_producao` DATETIME NULL ,
  `data_fim_producao` DATETIME NULL ,
  `tempo_producao` FLOAT NULL ,
  `tipo` ENUM('offset','silkscreen') NULL ,
  `pedido_layout_id` INT NOT NULL ,
  PRIMARY KEY (`fotolito_id`) ,
  INDEX `fk_fotolito_pedido_layout1` (`pedido_layout_id` ASC) ,
  CONSTRAINT `fk_fotolito_pedido_layout1`
    FOREIGN KEY (`pedido_layout_id` )
    REFERENCES `mila`.`pedido_layout` (`pedido_layout_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`revelacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`revelacao` (
  `revelacao_id` INT NOT NULL AUTO_INCREMENT ,
  `data_inicio_producao` DATETIME NULL ,
  `data_fim_producao` DATETIME NULL ,
  `fotolito_id` INT NOT NULL ,
  PRIMARY KEY (`revelacao_id`) ,
  INDEX `fk_revelacao_fotolito1` (`fotolito_id` ASC) ,
  CONSTRAINT `fk_revelacao_fotolito1`
    FOREIGN KEY (`fotolito_id` )
    REFERENCES `mila`.`fotolito` (`fotolito_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`corte_costura`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`corte_costura` (
  `corte_costura_id` INT NOT NULL AUTO_INCREMENT ,
  `camisa_gld` INT NULL ,
  `camisa_egg` INT NULL ,
  `camisa_gg` INT NULL ,
  `camisa_g` INT NULL ,
  `camisa_m` INT NULL ,
  `camisa_p` INT NULL ,
  `infantil_14` INT NULL ,
  `infantil_12` INT NULL ,
  `infantil_10` INT NULL ,
  `infantil_08` INT NULL ,
  `infantil_06` INT NULL ,
  `abada_gld` INT NULL ,
  `abada_egg` INT NULL ,
  `abada_gg` INT NULL ,
  `abada_g` INT NULL ,
  `abada_m` INT NULL ,
  `abada_p` INT NULL ,
  `babylook_g` INT NULL ,
  `babylook_m` INT NULL ,
  `babylook_p` INT NULL ,
  `pedido_layout_id` INT NOT NULL ,
  PRIMARY KEY (`corte_costura_id`) ,
  INDEX `fk_corte_costura_pedido_layout1` (`pedido_layout_id` ASC) ,
  CONSTRAINT `fk_corte_costura_pedido_layout1`
    FOREIGN KEY (`pedido_layout_id` )
    REFERENCES `mila`.`pedido_layout` (`pedido_layout_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = MyISAM;


-- -----------------------------------------------------
-- Table `mila`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mila`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(250) NULL ,
  `senha` VARCHAR(250) NULL ,
  `grupo` VARCHAR(250) NULL ,
  PRIMARY KEY (`usuario_id`) )
ENGINE = MyISAM
INSERT_METHOD = NO;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
