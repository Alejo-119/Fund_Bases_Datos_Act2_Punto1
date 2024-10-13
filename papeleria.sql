-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: papeleria
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Dirección` varchar(255) DEFAULT NULL,
  `Teléfono` varchar(20) DEFAULT NULL,
  `Correo_Electrónico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Pérez','Avenida Siempre Viva 742','555-5678','juan.perez@email.com'),(2,'Ana López','Calle de la Luna 21','555-8765','ana.lopez@email.com'),(3,'Luis Gómez','Calle del Sol 12','555-3456','luis.gomez@email.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_Producto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Descripción` text,
  `Precio_Unitario` decimal(10,2) NOT NULL,
  `Cantidad_En_Stock` int NOT NULL,
  `ID_Proveedor` int DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`),
  KEY `ID_Proveedor` (`ID_Proveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Cuaderno A4','Cuaderno de 100 hojas',2.50,200,1),(2,'Bolígrafo Azul','Bolígrafo con tinta azul',0.50,500,1),(3,'Calculadora Científica','Calculadora con funciones científicas',15.00,50,2),(4,'Marcador Permanente','Marcador para escribir en superficies no porosas',1.20,150,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID_Proveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Dirección` varchar(255) NOT NULL,
  `Teléfono` varchar(20) DEFAULT NULL,
  `Correo_Electrónico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Papelería ABC','Calle Falsa 123','555-1234','contacto@papeleriaabc.com'),(2,'Proveedora XYZ','Avenida Principal 456','555-5678','info@proveedoraxyz.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `ID_Venta` int NOT NULL AUTO_INCREMENT,
  `Fecha_Venta` date NOT NULL,
  `ID_Cliente` int DEFAULT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2024-09-15',1),(2,'2024-09-16',2),(3,'2024-09-17',3);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_producto`
--

DROP TABLE IF EXISTS `venta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_producto` (
  `ID_Venta` int NOT NULL,
  `ID_Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Valor_Unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_Venta`,`ID_Producto`),
  KEY `ID_Producto` (`ID_Producto`),
  CONSTRAINT `venta_producto_ibfk_1` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`ID_Venta`),
  CONSTRAINT `venta_producto_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_producto`
--

LOCK TABLES `venta_producto` WRITE;
/*!40000 ALTER TABLE `venta_producto` DISABLE KEYS */;
INSERT INTO `venta_producto` VALUES (1,1,3,2.50),(1,2,2,0.50),(2,3,1,15.00),(3,4,5,1.20);
/*!40000 ALTER TABLE `venta_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ventas_hoy`
--

DROP TABLE IF EXISTS `ventas_hoy`;
/*!50001 DROP VIEW IF EXISTS `ventas_hoy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ventas_hoy` AS SELECT 
 1 AS `ID_Venta`,
 1 AS `Fecha_Venta`,
 1 AS `Nombre_Cliente`,
 1 AS `Total_Venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_con_clientes_proveedores`
--

DROP TABLE IF EXISTS `vista_ventas_con_clientes_proveedores`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_con_clientes_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_con_clientes_proveedores` AS SELECT 
 1 AS `ID_Venta`,
 1 AS `Fecha_Venta`,
 1 AS `Nombre_Cliente`,
 1 AS `Nombre_Proveedor`,
 1 AS `Nombre_Producto`,
 1 AS `Cantidad`,
 1 AS `Valor_Unitario`,
 1 AS `Total_Venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ventas_hoy`
--

/*!50001 DROP VIEW IF EXISTS `ventas_hoy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ventas_hoy` AS select `v`.`ID_Venta` AS `ID_Venta`,`v`.`Fecha_Venta` AS `Fecha_Venta`,`c`.`Nombre` AS `Nombre_Cliente`,sum((`vp`.`Cantidad` * `vp`.`Valor_Unitario`)) AS `Total_Venta` from ((`venta` `v` join `cliente` `c` on((`v`.`ID_Cliente` = `c`.`ID_Cliente`))) join `venta_producto` `vp` on((`v`.`ID_Venta` = `vp`.`ID_Venta`))) where (`v`.`Fecha_Venta` = curdate()) group by `v`.`ID_Venta`,`v`.`Fecha_Venta`,`c`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_con_clientes_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_con_clientes_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_con_clientes_proveedores` AS select `v`.`ID_Venta` AS `ID_Venta`,`v`.`Fecha_Venta` AS `Fecha_Venta`,`c`.`Nombre` AS `Nombre_Cliente`,`p`.`Nombre` AS `Nombre_Proveedor`,`prod`.`Nombre` AS `Nombre_Producto`,`vp`.`Cantidad` AS `Cantidad`,`vp`.`Valor_Unitario` AS `Valor_Unitario`,(`vp`.`Cantidad` * `vp`.`Valor_Unitario`) AS `Total_Venta` from ((((`venta` `v` join `cliente` `c` on((`v`.`ID_Cliente` = `c`.`ID_Cliente`))) join `venta_producto` `vp` on((`v`.`ID_Venta` = `vp`.`ID_Venta`))) join `producto` `prod` on((`vp`.`ID_Producto` = `prod`.`ID_Producto`))) join `proveedor` `p` on((`prod`.`ID_Proveedor` = `p`.`ID_Proveedor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-13 17:19:15
