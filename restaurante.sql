CREATE DATABASE  IF NOT EXISTS `restaurante` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurante`;

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

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_plato` int NOT NULL,
  `cantidad` int NOT NULL,
   precio_unitario DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_plato` (`id_plato`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE,
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_plato`) REFERENCES `platos` (`id_plato`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `ingredientes_inv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes_inv` (
  `id_ingrediente` int NOT NULL AUTO_INCREMENT,
  `nombre_ingrediente` varchar(100) NOT NULL,
  `stock_actual` decimal(10,2) NOT NULL,
  `stock_minimo` decimal(10,2) DEFAULT '0.00',
  `unidad_medida` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ingrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ingredientes_inv` WRITE;
/*!40000 ALTER TABLE `ingredientes_inv` DISABLE KEYS */;
INSERT INTO `ingredientes_inv` VALUES (1,'Pan de hamburguesa',100.00,10.00,'unidades'),(2,'Carne de hamburguesa',80.00,15.00,'unidades'),(3,'Queso cheddar (láminas)',200.00,30.00,'unidades'),(4,'Papas congeladas',5000.00,500.00,'gramos'),(5,'Pechuga de pollo empanizada',60.00,10.00,'unidades'),(6,'Lechuga fresca',50.00,10.00,'gramos'),(7,'Tomate rodajas',50.00,10.00,'unidades'),(8,'Salsa de la casa',1000.00,100.00,'mililitros'),(9,'Refresco 500ml',150.00,20.00,'unidades'),(10,'Pan de perro caliente',80.00,10.00,'unidades'),(11,'Salchicha manguera',80.00,10.00,'unidades'),(12,'Papas fosforito',1500.00,200.00,'gramos'),(13,'Carne picada de res',3000.00,500.00,'gramos'),(14,'Chorizo',50.00,10.00,'unidades');
/*!40000 ALTER TABLE `ingredientes_inv` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `num_mesa` int NOT NULL,
  `estado` varchar(20) DEFAULT 'PENDIENTE',
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos` (
  `id_plato` int NOT NULL AUTO_INCREMENT,
  `nombre_plato` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_plato`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
INSERT INTO `platos` VALUES (1,'Hamburguesa Clásica con Papas',15000.00,'Hamburguesas','hamburguesa.jpg'),(2,'Hamburguesa Doble Queso',18000.00,'Hamburguesas','hamburguesa_doble.jpg'),(3,'Sándwich de Pollo Crispy',14000.00,'Sándwiches','sandwich_pollo.jpg'),(4,'Gaseosa 500ml',4000.00,'Bebidas','gaseosa.jpg'),(5,'Perro Caliente Especial',12000.00,'Perros','perro_especial.jpg'),(6,'Picada Familiar (2-3 personas)',35000.00,'Picadas','picada_familiar.jpg');
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `id_plato` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad_necesaria` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_receta`),
  KEY `id_plato` (`id_plato`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_plato`) REFERENCES `platos` (`id_plato`) ON DELETE CASCADE,
  CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes_inv` (`id_ingrediente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (1,1,1,1.00),(2,1,2,1.00),(3,1,3,1.00),(4,1,4,150.00),(5,2,1,1.00),(6,2,2,2.00),(7,2,3,2.00),(8,3,1,1.00),(9,3,5,1.00),(10,3,6,30.00),(11,4,9,1.00),(12,5,10,1.00),(13,5,11,1.00),(14,5,3,1.00),(15,5,12,30.00),(16,6,13,300.00),(17,6,5,2.00),(18,6,14,3.00),(19,6,4,300.00);
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(100) NOT NULL,
    rol VARCHAR(30) NOT NULL
);

INSERT INTO empleados
(nombre, usuario, password_hash, rol)
VALUES
('Jesus', 'caja01', '$2a$10$UuzCxA147R/kMPwKrxRzY.kUNjuuZkOasU4XKxwm7uA./ynXCX3ZG', 'CAJA'),
('Andrea', 'cocina02', '$2a$10$5tdS6VOwJfG/9O3GVWDwQO3sdkhU0ACZNkdaLtV3fY21rX/QltfAK', 'COCINA'),
('Sergio', 'admin03', '$2a$10$KVh2ZMfyM3m2LDzIKotMouUdxI71arGTkZRdlzakNu1qLEoTx3mnC', 'ADMINISTRACION');
