-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/09/2024 às 02:35
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `shopmastermarco`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `nota` int(11) DEFAULT NULL CHECK (`nota` between 0 and 10),
  `comentario` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `fkid_cliente` int(11) DEFAULT NULL,
  `fkid_produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_Cliente` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `date_registro` date DEFAULT NULL,
  `end_faturamento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_Endereco` int(11) NOT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `fkid_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `contato_principal` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `data_contratacao` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `metodo_pag` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `fkid_endereco` int(11) DEFAULT NULL,
  `fkid_produto` int(11) DEFAULT NULL,
  `fkid_cliente` int(11) DEFAULT NULL,
  `fkid_pagamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_produto`
--

CREATE TABLE `pedido_produto` (
  `fkid_Pedido` int(11) DEFAULT NULL,
  `fkid_Produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco_venda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_Produto` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `fk_Fornecedor_id_fornecedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suporte`
--

CREATE TABLE `suporte` (
  `id_suporte` int(11) NOT NULL,
  `fkid_cliente` int(11) DEFAULT NULL,
  `descricao_problema` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `fkid_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`),
  ADD KEY `FK_Avaliacao_Cliente` (`fkid_cliente`),
  ADD KEY `FK_Avaliacao_Produto` (`fkid_produto`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_Cliente`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_Endereco`),
  ADD KEY `FK_Endereco_Cliente` (`fkid_cliente`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `FK_Pedido_Cliente` (`fkid_cliente`),
  ADD KEY `FK_Pedido_Endereco` (`fkid_endereco`),
  ADD KEY `FK_Pedido_Pagamento` (`fkid_pagamento`),
  ADD KEY `FK_Pedido_Produto` (`fkid_produto`);

--
-- Índices de tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD KEY `FK_Pedido_Produto_Produto` (`fkid_Produto`),
  ADD KEY `FK_Pedido_Produto_Pedido` (`fkid_Pedido`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_Produto`),
  ADD KEY `FK_Produto_Fornecedor` (`fk_Fornecedor_id_fornecedor`);

--
-- Índices de tabela `suporte`
--
ALTER TABLE `suporte`
  ADD PRIMARY KEY (`id_suporte`),
  ADD KEY `FK_Suporte_Funcionario` (`fkid_funcionario`),
  ADD KEY `FK_Suporte_Cliente` (`fkid_cliente`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `FK_Avaliacao_Cliente` FOREIGN KEY (`fkid_cliente`) REFERENCES `cliente` (`id_Cliente`),
  ADD CONSTRAINT `FK_Avaliacao_Produto` FOREIGN KEY (`fkid_produto`) REFERENCES `produto` (`id_Produto`);

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `FK_Endereco_Cliente` FOREIGN KEY (`fkid_cliente`) REFERENCES `cliente` (`id_Cliente`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_Pedido_Cliente` FOREIGN KEY (`fkid_cliente`) REFERENCES `cliente` (`id_Cliente`),
  ADD CONSTRAINT `FK_Pedido_Endereco` FOREIGN KEY (`fkid_endereco`) REFERENCES `endereco` (`id_Endereco`),
  ADD CONSTRAINT `FK_Pedido_Pagamento` FOREIGN KEY (`fkid_pagamento`) REFERENCES `pagamento` (`id_pagamento`),
  ADD CONSTRAINT `FK_Pedido_Produto` FOREIGN KEY (`fkid_produto`) REFERENCES `pedido_produto` (`fkid_Produto`);

--
-- Restrições para tabelas `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD CONSTRAINT `FK_Pedido_Produto_Pedido` FOREIGN KEY (`fkid_Pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `FK_Pedido_Produto_Produto` FOREIGN KEY (`fkid_Produto`) REFERENCES `produto` (`id_Produto`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `FK_Produto_Fornecedor` FOREIGN KEY (`fk_Fornecedor_id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`);

--
-- Restrições para tabelas `suporte`
--
ALTER TABLE `suporte`
  ADD CONSTRAINT `FK_Suporte_Cliente` FOREIGN KEY (`fkid_cliente`) REFERENCES `cliente` (`id_Cliente`),
  ADD CONSTRAINT `FK_Suporte_Funcionario` FOREIGN KEY (`fkid_funcionario`) REFERENCES `funcionario` (`id_funcionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
