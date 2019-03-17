-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17-Mar-2019 às 20:40
-- Versão do servidor: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buffet`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `idagenda` int(11) NOT NULL,
  `orcamento_idorcamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `buffet`
--

CREATE TABLE `buffet` (
  `idbuffet` int(11) NOT NULL,
  `razaoSocial` varchar(45) DEFAULT NULL,
  `pessoa_idpessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nasc` varchar(45) DEFAULT NULL,
  `pessoa_idpessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idfuncionario` int(11) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  `pessoa_idpessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `galeria`
--

CREATE TABLE `galeria` (
  `idgaleria` int(11) NOT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `nomeFoto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento`
--

CREATE TABLE `orcamento` (
  `idorcamento` int(11) NOT NULL,
  `valor` decimal(2,0) DEFAULT NULL,
  `percDesconto` decimal(2,0) DEFAULT NULL,
  `formaPagamento` varchar(45) DEFAULT NULL,
  `valorDesconto` decimal(2,0) DEFAULT NULL,
  `percAcressimo` decimal(2,0) DEFAULT NULL,
  `valorAcressimo` decimal(2,0) DEFAULT NULL,
  `quantidadePessoa` int(11) DEFAULT NULL,
  `quantidadePacote` int(11) DEFAULT NULL,
  `dataOrcamento` date DEFAULT NULL,
  `incrementos` tinyint(10) DEFAULT NULL,
  `observacoes` varchar(45) DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `status` tinyint(10) DEFAULT NULL,
  `tipoEvento` varchar(45) DEFAULT NULL,
  `dataEvento` date DEFAULT NULL,
  `localEvento` varchar(45) DEFAULT NULL,
  `pacote_idpacote` int(11) NOT NULL,
  `pratoPac_idpratoPac` int(11) NOT NULL,
  `agenda_idagenda` int(11) NOT NULL,
  `buffet_idbuffet` int(11) NOT NULL,
  `buffet_pessoa_idpessoa` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `cliente_pessoa_idpessoa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacote`
--

CREATE TABLE `pacote` (
  `idpacote` int(11) NOT NULL,
  `nomePacote` varchar(45) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `qtdPessoas` int(11) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pac_sub`
--

CREATE TABLE `pac_sub` (
  `idpac_sub` int(11) NOT NULL,
  `qtdsub` int(11) DEFAULT NULL,
  `pacote_idpacote` int(11) NOT NULL,
  `subcategoria_idtsubcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `idpessoa` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cpf_cnpj` int(15) NOT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `complemento` varchar(45) NOT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `numero` int(10) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `CEP` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prato`
--

CREATE TABLE `prato` (
  `idprato` int(11) NOT NULL,
  `nomeprato` varchar(45) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pratopac`
--

CREATE TABLE `pratopac` (
  `idpratoPac` int(11) NOT NULL,
  `prato_idprato` int(11) NOT NULL,
  `pacote_idpacote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subcategoria`
--

CREATE TABLE `subcategoria` (
  `idtsubcategoria` int(11) NOT NULL,
  `nomeSubcategoria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `subcategoria`
--

INSERT INTO `subcategoria` (`idtsubcategoria`, `nomeSubcategoria`) VALUES
(1, 'principal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `subecategoria`
--

CREATE TABLE `subecategoria` (
  `idsubecategoria` int(11) NOT NULL,
  `nomesubcategoria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subprato`
--

CREATE TABLE `subprato` (
  `idsubPrato` int(11) NOT NULL,
  `subcategoria_idtsubcategoria` int(11) NOT NULL,
  `prato_idprato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`idagenda`),
  ADD KEY `fk_agenda_orcamento1_idx` (`orcamento_idorcamento`);

--
-- Indexes for table `buffet`
--
ALTER TABLE `buffet`
  ADD PRIMARY KEY (`idbuffet`,`pessoa_idpessoa`),
  ADD KEY `fk_buffet_pessoa1_idx` (`pessoa_idpessoa`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`,`pessoa_idpessoa`),
  ADD KEY `fk_cliente_pessoa1_idx` (`pessoa_idpessoa`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idfuncionario`,`pessoa_idpessoa`),
  ADD KEY `fk_funcionario_pessoa1_idx` (`pessoa_idpessoa`);

--
-- Indexes for table `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`idgaleria`);

--
-- Indexes for table `orcamento`
--
ALTER TABLE `orcamento`
  ADD PRIMARY KEY (`idorcamento`),
  ADD KEY `fk_orcamento_pacote1_idx` (`pacote_idpacote`),
  ADD KEY `fk_orcamento_pratoPac1_idx` (`pratoPac_idpratoPac`),
  ADD KEY `fk_orcamento_buffet1_idx` (`buffet_idbuffet`,`buffet_pessoa_idpessoa`),
  ADD KEY `fk_orcamento_cliente1_idx` (`cliente_idcliente`,`cliente_pessoa_idpessoa`);

--
-- Indexes for table `pacote`
--
ALTER TABLE `pacote`
  ADD PRIMARY KEY (`idpacote`);

--
-- Indexes for table `pac_sub`
--
ALTER TABLE `pac_sub`
  ADD PRIMARY KEY (`idpac_sub`),
  ADD KEY `fk_pac_sub_pacote1_idx` (`pacote_idpacote`),
  ADD KEY `fk_pac_sub_subcategoria1_idx` (`subcategoria_idtsubcategoria`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`idpessoa`);

--
-- Indexes for table `prato`
--
ALTER TABLE `prato`
  ADD PRIMARY KEY (`idprato`);

--
-- Indexes for table `pratopac`
--
ALTER TABLE `pratopac`
  ADD PRIMARY KEY (`idpratoPac`),
  ADD KEY `fk_pratoPac_prato1_idx` (`prato_idprato`),
  ADD KEY `fk_pratoPac_pacote1_idx` (`pacote_idpacote`);

--
-- Indexes for table `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`idtsubcategoria`);

--
-- Indexes for table `subecategoria`
--
ALTER TABLE `subecategoria`
  ADD PRIMARY KEY (`idsubecategoria`);

--
-- Indexes for table `subprato`
--
ALTER TABLE `subprato`
  ADD PRIMARY KEY (`idsubPrato`),
  ADD KEY `fk_subPrato_subcategoria_idx` (`subcategoria_idtsubcategoria`),
  ADD KEY `fk_subPrato_prato1_idx` (`prato_idprato`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `fk_agenda_orcamento1` FOREIGN KEY (`orcamento_idorcamento`) REFERENCES `orcamento` (`idorcamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `buffet`
--
ALTER TABLE `buffet`
  ADD CONSTRAINT `fk_buffet_pessoa1` FOREIGN KEY (`pessoa_idpessoa`) REFERENCES `pessoa` (`idpessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_pessoa1` FOREIGN KEY (`pessoa_idpessoa`) REFERENCES `pessoa` (`idpessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_pessoa1` FOREIGN KEY (`pessoa_idpessoa`) REFERENCES `pessoa` (`idpessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD CONSTRAINT `fk_orcamento_buffet1` FOREIGN KEY (`buffet_idbuffet`,`buffet_pessoa_idpessoa`) REFERENCES `buffet` (`idbuffet`, `pessoa_idpessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orcamento_cliente1` FOREIGN KEY (`cliente_idcliente`,`cliente_pessoa_idpessoa`) REFERENCES `cliente` (`idcliente`, `pessoa_idpessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orcamento_pacote1` FOREIGN KEY (`pacote_idpacote`) REFERENCES `pacote` (`idpacote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orcamento_pratoPac1` FOREIGN KEY (`pratoPac_idpratoPac`) REFERENCES `pratopac` (`idpratoPac`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pac_sub`
--
ALTER TABLE `pac_sub`
  ADD CONSTRAINT `fk_pac_sub_pacote1` FOREIGN KEY (`pacote_idpacote`) REFERENCES `pacote` (`idpacote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pac_sub_subcategoria1` FOREIGN KEY (`subcategoria_idtsubcategoria`) REFERENCES `subcategoria` (`idtsubcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pratopac`
--
ALTER TABLE `pratopac`
  ADD CONSTRAINT `fk_pratoPac_pacote1` FOREIGN KEY (`pacote_idpacote`) REFERENCES `pacote` (`idpacote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pratoPac_prato1` FOREIGN KEY (`prato_idprato`) REFERENCES `prato` (`idprato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `subprato`
--
ALTER TABLE `subprato`
  ADD CONSTRAINT `fk_subPrato_prato1` FOREIGN KEY (`prato_idprato`) REFERENCES `prato` (`idprato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_subPrato_subcategoria` FOREIGN KEY (`subcategoria_idtsubcategoria`) REFERENCES `subcategoria` (`idtsubcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
