-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: perritos
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `idcli` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `pass` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`idcli`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_mascota`
--

DROP TABLE IF EXISTS `cliente_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente_mascota` (
  `idcl_mas` int(11) NOT NULL AUTO_INCREMENT,
  `idcli` int(11) DEFAULT NULL,
  `idmas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcl_mas`),
  KEY `fk_clmas_cliente` (`idcli`),
  KEY `fk_clmas_mascota` (`idmas`),
  CONSTRAINT `fk_clmas_cliente` FOREIGN KEY (`idcli`) REFERENCES `cliente` (`idcli`),
  CONSTRAINT `fk_clmas_mascota` FOREIGN KEY (`idmas`) REFERENCES `mascota` (`idmas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_mascota`
--

LOCK TABLES `cliente_mascota` WRITE;
/*!40000 ALTER TABLE `cliente_mascota` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcion`
--

DROP TABLE IF EXISTS `descripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `descripcion` (
  `iddes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `idserv` int(11) DEFAULT NULL,
  `idprod` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddes`),
  KEY `fk_detalle_servicio` (`idserv`),
  KEY `fk_detalle_producto` (`idprod`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`idprod`) REFERENCES `producto` (`idprod`),
  CONSTRAINT `fk_detalle_servicio` FOREIGN KEY (`idserv`) REFERENCES `servicio` (`idserv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcion`
--

LOCK TABLES `descripcion` WRITE;
/*!40000 ALTER TABLE `descripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `descripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle` (
  `iddet` int(11) NOT NULL AUTO_INCREMENT,
  `enfermedad` varchar(150) DEFAULT NULL,
  `vacuna` varchar(150) DEFAULT NULL,
  `alergia` varchar(150) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`iddet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidad`
--

DROP TABLE IF EXISTS `disponibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disponibilidad` (
  `iddisp` int(11) NOT NULL AUTO_INCREMENT,
  `idhor` int(11) DEFAULT NULL,
  `idpas` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddisp`),
  KEY `fk_disp_hor` (`idhor`),
  KEY `fk_disp_pas` (`idpas`),
  CONSTRAINT `fk_disp_hor` FOREIGN KEY (`idhor`) REFERENCES `horario` (`idhor`),
  CONSTRAINT `fk_disp_pas` FOREIGN KEY (`idpas`) REFERENCES `paseador` (`idpas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidad`
--

LOCK TABLES `disponibilidad` WRITE;
/*!40000 ALTER TABLE `disponibilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `especialidad` (
  `idesp` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idesp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `horario` (
  `idhor` int(11) NOT NULL AUTO_INCREMENT,
  `hora` time NOT NULL,
  `dia` varchar(50) NOT NULL,
  PRIMARY KEY (`idhor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mascota` (
  `idmas` int(11) NOT NULL AUTO_INCREMENT,
  `iddet` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `raza` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `tipo_animal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmas`),
  KEY `fk_mascota_detalle` (`iddet`),
  CONSTRAINT `fk_mascota_detalle` FOREIGN KEY (`iddet`) REFERENCES `detalle` (`iddet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `idtip_pago` int(11) DEFAULT NULL,
  `iddes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpago`),
  KEY `fk_pago_tip_pago` (`idtip_pago`),
  KEY `fk_pago_iddes` (`iddes`),
  CONSTRAINT `fk_pago_iddes` FOREIGN KEY (`iddes`) REFERENCES `descripcion` (`iddes`),
  CONSTRAINT `fk_pago_tip_pago` FOREIGN KEY (`idtip_pago`) REFERENCES `tipo_pago` (`idtip_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paseador`
--

DROP TABLE IF EXISTS `paseador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paseador` (
  `idpas` int(11) NOT NULL AUTO_INCREMENT,
  `idesp` int(11) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `pass` varchar(128) DEFAULT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idpas`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_paseador_esp` (`idesp`),
  CONSTRAINT `fk_paseador_esp` FOREIGN KEY (`idesp`) REFERENCES `especialidad` (`idesp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paseador`
--

LOCK TABLES `paseador` WRITE;
/*!40000 ALTER TABLE `paseador` DISABLE KEYS */;
INSERT INTO `paseador` VALUES (1,NULL,'Paolo','Minaya',NULL,'av. jazmin',939170013,'paolo@',47058222,'pzur','$5$rounds=535000$qRmsG.HWmZDZADPZ$xEsXgc/dyYjkzjZ11vRsrvuUL3phnZyH/d8.K6UxSN2','ththt'),(2,NULL,'luis','castro',NULL,'av. jazmin',123456,'lui@',123,'luis','$5$rounds=535000$axSz52FaRCUNx8il$4Jq7TwplOK6jwDzVsPN48cWhc1UyO30SjCq0cES0pJB','ikik');
/*!40000 ALTER TABLE `paseador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `producto` (
  `idprod` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idprod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programacion`
--

DROP TABLE IF EXISTS `programacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `programacion` (
  `idprog` int(11) NOT NULL AUTO_INCREMENT,
  `iddisp` int(11) DEFAULT NULL,
  `idcl_mas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idprog`),
  KEY `fk_programacion_disponibilidad` (`iddisp`),
  KEY `fk_programacion_cl_mas` (`idcl_mas`),
  CONSTRAINT `fk_programacion_cl_mas` FOREIGN KEY (`idcl_mas`) REFERENCES `cliente_mascota` (`idcl_mas`),
  CONSTRAINT `fk_programacion_disponibilidad` FOREIGN KEY (`iddisp`) REFERENCES `disponibilidad` (`iddisp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programacion`
--

LOCK TABLES `programacion` WRITE;
/*!40000 ALTER TABLE `programacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `programacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promocion` (
  `idprom` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(150) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`idprom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reserva` (
  `idres` int(11) NOT NULL AUTO_INCREMENT,
  `idprog` int(11) DEFAULT NULL,
  `idpago` int(11) DEFAULT NULL,
  PRIMARY KEY (`idres`),
  KEY `fk_reserva_programacion` (`idprog`),
  KEY `fk_reserva_pago` (`idpago`),
  CONSTRAINT `fk_reserva_pago` FOREIGN KEY (`idpago`) REFERENCES `pago` (`idpago`),
  CONSTRAINT `fk_reserva_programacion` FOREIGN KEY (`idprog`) REFERENCES `programacion` (`idprog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `servicio` (
  `idserv` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `idprom` int(11) DEFAULT NULL,
  PRIMARY KEY (`idserv`),
  KEY `fk_servicio_promocion` (`idprom`),
  CONSTRAINT `fk_servicio_promocion` FOREIGN KEY (`idprom`) REFERENCES `promocion` (`idprom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_pago` (
  `idtip_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idtip_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_cliente`
--

DROP TABLE IF EXISTS `usuario_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario_cliente` (
  `idus_cli` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `contrasena` varchar(128) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`idus_cli`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_cliente`
--

LOCK TABLES `usuario_cliente` WRITE;
/*!40000 ALTER TABLE `usuario_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-20 14:55:47
