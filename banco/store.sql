-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `entrada_produtos`
--

DROP TABLE IF EXISTS `entrada_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_produtos` (
  `id` bigint NOT NULL,
  `id_produto` bigint DEFAULT NULL,
  `qtde` int DEFAULT NULL,
  `valor_unitario` decimal(9,2) DEFAULT '0.00',
  `data_entrada` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_produtos`
--

LOCK TABLES `entrada_produtos` WRITE;
/*!40000 ALTER TABLE `entrada_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrada_produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_EntradaProduto_AI` AFTER INSERT ON `entrada_produtos` FOR EACH ROW BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde, new.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_EntradaProduto_AU` AFTER UPDATE ON `entrada_produtos` FOR EACH ROW BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde - old.qtde, new.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_EntradaProduto_AD` AFTER DELETE ON `entrada_produtos` FOR EACH ROW BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde * -1, old.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produto` int DEFAULT NULL,
  `qtde` int DEFAULT NULL,
  `valor_unitario` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` char(1) NOT NULL DEFAULT 'A',
  `descricao` varchar(200) NOT NULL,
  `estoque_min` int NOT NULL,
  `estoque_max` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'A','CABO CAFET ITALIANA 03 CAFES G.R M 2',3,5),(2,'A','BORR PAN PRESS SILIC ERILAR 13-18-22l FINA GUAM',3,5),(3,'A','REGULADOR GD 2000 - 02KG/H IMAR',3,5),(4,'A','BORR PAN PRESS SILIC MULTIUSO 7L AZ CWA',5,10),(5,'A','BORR PAN PRESS SILIC ETERNA NIGRO 3-4,5-6L S/PQ CWA',5,10),(6,'A','BORR PAN PRESS COMUM FULGOR 12-20L GUAM',5,10),(7,'A','CABO PANELA TIPO TRAMONTINA C028 LL',3,5),(8,'A','CABO PANELA 03F PQ C063 LL M3',5,10),(9,'A','BORR PAN PRESS SILIC 3D ALCAST 4,5L S/PIQ CWA',5,10),(10,'A','CABO CAFET ITALIANA 06 CAFES G.R M 2',3,5),(11,'A','CABO CAFET ITALIANA 09 CAFES G.R M 2',3,5),(12,'A','BORR PAN PRESS SILIC ETERNA NIGRO 4,5L GUAM',5,10),(13,'A','BORR PAN PRESS COMUM FULGOR 12-15-20L GUAM',5,10),(14,'A','CABO PANELA SUPERIOR TAMPA VALENCIA TRAM',3,5),(15,'A','BORR PAN PRESS SILIC PANEX LIDER 3-4-5-7L GUAM',5,10),(16,'A','MANGUEIRA GLP 18*10MM 1250MM RENATA',5,10),(17,'A','BORR PAN PRESS SILIC ROCHEDO 11,4-20,8L GUAM',5,10),(18,'A','GUARNICAO CAFET ITALIANA 03 CAFES GUAM PT 2',3,5),(19,'A','GUARNICAO CAFET ITALIANA 06 CAFES GUAM PT 2',3,5),(20,'A','GUARNICAO CAFET ITALIANA 09 CAFES GUAM PT 2',3,5),(21,'A','ABRACADEIRA PRESS 5/8 * 3/4 M 10',10,25),(22,'A','REBITE PANELA 5/32 * 8 PT 100GR',10,25),(23,'A','REBITE PANELA 5/32 * 22 PT 100GR',10,25),(24,'A','REBITE PANELA 3/16 * 11 PT 100GR',10,25),(25,'A','REBITE PANELA 5/32 * 10 PT 100GR',10,25),(26,'A','REGULADOR GD 506/01 ALIANCA',3,5),(27,'A','REGULADOR PQ IMAR',3,5),(28,'A','REGULADOR PQ NV 504/1 ALIANCA',3,5),(29,'A','ALCA CAÇAROLA PANELA PRESS A025 LL M3',5,35),(30,'A','CABO PAN PRESS CLOCK MOD 3F C006 LL M2',5,15),(31,'A','CABO LEITEIRA LARGO LUXO GD LL M3',5,15),(32,'A','PESO PAN PRESS CROM PENEDO M10',5,15),(33,'A','ALCA PAN PRESS GLOBO MOD A019 LL M3',5,15),(34,'A','CABO PAN PRESS PENEDO ROCHEDO CORPO C ACESS LL',5,15),(35,'A','CABO FRIGIDEIRA MD 03F C056 LL M3',5,15),(36,'A','CABO CACAROLA LUXO C060 LL',5,15),(37,'A','CABO FRIGIDEIRA LUXO C060F LL',5,15),(38,'A','CABO FRIGIDEIRA PQ 03F C065 LL M3',5,15),(39,'A','PESO PAN PRESS CROM ETERNA NIGRO M10',5,15),(40,'A','PESO PAN PRESS CAPA AZ UNIV M10 ALTIMAR',5,15),(41,'A','PESO PAN PRESS CROM CLOCK M10 ALTIMAR',5,15),(42,'A','PESO PAN PRESS CAPA CLOCK PR M10',5,15),(43,'A','PESO PAN PRESS CAPA CLOCK VERM M10',5,15),(44,'A','PESO PAN PRESS CAPA PANEX PR M10',5,15),(45,'A','BORR PAN PRESS SILIC TP ORIGINAL CLOCK 4.5L CWA',5,100),(46,'A','CABO LEITEIRA LARGO LUXO GD M3',5,15),(47,'A','CABO LEITEIRA MARMICOC LARGO MINI M3',5,15),(48,'A','CABO PAN PRESS PENEDO ROCHEDO CORPO LEVE S SUP M3',5,15),(49,'A','PESO PAN PRESS CAPA AZ UNIV MINI M10',5,15),(50,'A','PESO PAN PRESS CAPA CLOCK NV PR AM M10',5,15),(51,'A','PESO PAN PRESS CAPA CLOCK NV PR AZ M10',5,15),(52,'A','CABO LEITEIRA 4F PQ 2046 MCA M3',5,15),(53,'A','SELO REPET PAN PRESS SILIC ROCHEDO NIGRO CWA M10',5,15),(54,'A','ALCA PAN PRESS GLOBO MOD A007 M3 GR',5,15),(55,'A','ALCA PAN PRESS ROCHEDO CANNERS CORPO TP ORIG M3',5,15),(56,'A','CAPA PINO INDICAD SILIC PAN PRESS TRAMONTINA PT2',5,15),(57,'A','CABO CACAROLA LUXO MD 20 MCA M3',5,15),(58,'A','KIT REPARO P PAN PRESS VANCOUVER 1 PESO 1PINO TRAM',5,15),(59,'A','SELO REPET PAN PRESS VANCOUVER TRAMONTINA M4',5,15),(60,'A','SELO PAN PRESS VANCOUVER P CABO TAMPA TRAM M2',5,15),(61,'A','CABO CACAROLA LUXO GD 21 MCA M3',5,15),(62,'A','CABO PAN PRESS SUPERIOR TAMPA VALENCIA TRAM',5,15),(63,'A','BORR PAN PRESS SILIC MULTIUSO 4.5L TURBO TOP C EMB',5,15),(64,'A','CABO CACAROLA MAD GD 402 MCA M3',5,15),(65,'A','SELO PANELA PRESS CLOCK M10',5,100),(66,'A','CABO CACAROLA MAD MD 401 MCA M3',5,15),(67,'A','SELO PAN PRESS ROCHEDO NIGRO GUAM M20',5,100),(68,'A','SELO REPET PAN PRESS SILIC ROCHEDO NIGRO GUAM M10',5,100),(69,'A','CABO LEITEIRA LUXO 07 MCA M3',5,15),(70,'A','CABO CANECA PQ 35 MCA M3',5,15),(71,'A','CABO CANECA MD 36 MCA M3',5,15),(72,'A','CABO CANECA GD 37 MCA M3',5,15),(73,'A','CABO CACAROLA CM PQ 10 MCA M3',5,15),(74,'A','HASTE PAN PRESS CLOCK ANT 4.5L',5,15),(75,'A','HASTE PAN PRESS CLOCK MOD 4.5L',5,15),(76,'A','HASTE PAN PRESS CLOCK ANT 7L',5,15),(77,'A','HASTE PAN PRESS CLOCK MOD 7L',5,15),(78,'A','HASTE PAN PRESS PANEX LIDER ANT 4.5L',5,15),(79,'A','PESO PAN PRESS CAPA PR UNIV MINI M10',5,15),(80,'A','PESO PAN PRESS CAPA CLOCK NV PR VERM M10',5,15),(81,'A','PESO PANELA PRESS CAPA VERM UNIV MINI M10',5,15);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saida_produto`
--

DROP TABLE IF EXISTS `saida_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saida_produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produto` int DEFAULT NULL,
  `qtde` int DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `valor_unitario` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saida_produto`
--

LOCK TABLES `saida_produto` WRITE;
/*!40000 ALTER TABLE `saida_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `saida_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_SaidaProduto_AI` AFTER INSERT ON `saida_produto` FOR EACH ROW BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, new.qtde * -1, new.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_SaidaProduto_AU` AFTER UPDATE ON `saida_produto` FOR EACH ROW BEGIN
      CALL SP_AtualizaEstoque (new.id_produto, old.qtde - new.qtde, new.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;

/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`admin`@`localhost`*/ /*!50003 TRIGGER `TRG_SaidaProduto_AD` AFTER DELETE ON `saida_produto` FOR EACH ROW BEGIN
      CALL SP_AtualizaEstoque (old.id_produto, old.qtde, old.valor_unitario);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-08 18:33:27
