CREATE DATABASE  IF NOT EXISTS `tienda661` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tienda661`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda661
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cedula_cliente` bigint NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `email_cliente` varchar(255) NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `telefono_cliente` varchar(255) NOT NULL,
  PRIMARY KEY (`cedula_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `codigo_detalle_venta` bigint NOT NULL,
  `cantidad_producto` int NOT NULL,
  `codigo_producto` bigint NOT NULL,
  `codigo_venta` bigint NOT NULL,
  `valor_total` double NOT NULL,
  `valor_venta` double NOT NULL,
  `valoriva` double NOT NULL,
  PRIMARY KEY (`codigo_detalle_venta`),
  KEY `codigo_venta_idx` (`codigo_venta`),
  KEY `codigo_producto_idx` (`codigo_producto`),
  CONSTRAINT `codigo_producto` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo_producto`),
  CONSTRAINT `codigo_venta` FOREIGN KEY (`codigo_venta`) REFERENCES `ventas` (`codigo_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo_producto` bigint NOT NULL,
  `ivacompra` double NOT NULL,
  `nitproveedor` bigint NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `precio_compra` double NOT NULL,
  `precio_venta` double NOT NULL,
  PRIMARY KEY (`codigo_producto`),
  KEY `nitproveedor_idx` (`nitproveedor`),
  CONSTRAINT `nitproveedor` FOREIGN KEY (`nitproveedor`) REFERENCES `proveedores` (`nitproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `nitproveedor` bigint NOT NULL,
  `ciudad_proveedor` varchar(255) NOT NULL,
  `direccion_proveedor` varchar(255) NOT NULL,
  `nombre_proveedor` varchar(255) NOT NULL,
  `telefono_proveedor` varchar(255) NOT NULL,
  PRIMARY KEY (`nitproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `cedula_usuario` bigint NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  PRIMARY KEY (`cedula_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'inicial','inicial','admin123456','admininicial');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `codigo_venta` bigint NOT NULL,
  `cedula_cliente` bigint NOT NULL,
  `cuedula_usuario` bigint NOT NULL,
  `ivaventa` double NOT NULL,
  `total_venta` double NOT NULL,
  `valor_venta` double NOT NULL,
  PRIMARY KEY (`codigo_venta`),
  KEY `cedula_cliente_idx` (`cedula_cliente`),
  KEY `cedula_usuario_idx` (`cuedula_usuario`),
  CONSTRAINT `cedula_cliente` FOREIGN KEY (`cedula_cliente`) REFERENCES `clientes` (`cedula_cliente`),
  CONSTRAINT `cedula_usuario` FOREIGN KEY (`cuedula_usuario`) REFERENCES `usuarios` (`cedula_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-29 18:17:24
