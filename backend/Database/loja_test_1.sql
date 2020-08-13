-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Ago-2020 às 04:18
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_test_1`
--
CREATE DATABASE IF NOT EXISTS `loja_test_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `loja_test_1`;

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_funcionarios_save` (IN `pnome` VARCHAR(70), IN `pdtNasc` DATE, IN `pdtAdmissao` DATE, IN `pcargo` INT(11))  BEGIN
  
    DECLARE vidFuncionario INT;
    
  INSERT INTO funcionarios (nome, dtNasc, dtAdmissao, cargo)
    VALUES(pnome, pdtNasc, pdtAdmissao, pcargo);
    
    SET vidFuncionario = LAST_INSERT_ID();
    
    SELECT * FROM funcionarios WHERE id = LAST_INSERT_ID();
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `dtCadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de Cargos';

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `descricao`, `dtCadastro`) VALUES
(1, 'Desenvolvedor', '2020-08-11 20:52:13'),
(2, 'Gestor', '2020-08-11 20:52:13'),
(3, 'Desenvolvedor', '2020-08-11 20:52:55');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `dtNasc` date NOT NULL,
  `dtAdmissao` date NOT NULL,
  `cargo` int(11) NOT NULL,
  `dtCadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de Funcionários';

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `dtNasc`, `dtAdmissao`, `cargo`, `dtCadastro`) VALUES
(1, 'João Cléber', '1987-08-03', '2015-03-21', 1, '2020-08-11 20:53:58'),
(4, 'Pedro Gonçalves', '1997-04-27', '2017-02-11', 2, '2020-08-11 22:39:09'),
(7, 'Elder', '1998-02-18', '0000-00-00', 1, '2020-08-12 23:09:58'),
(8, 'Juan Carlo', '1976-11-23', '2017-03-20', 2, '2020-08-12 23:12:32'),
(9, 'teste', '2000-03-20', '2015-12-04', 3, '2020-08-12 23:13:34'),
(10, 'Fernando De La Viera', '1996-05-22', '2020-07-21', 1, '2020-08-12 23:15:11');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_funcionario_cargo` (`cargo`) USING BTREE;

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fk_funcionario_cargo` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
