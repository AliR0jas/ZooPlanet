CREATE DATABASE  IF NOT EXISTS `animales` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `animales`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: animales
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clase` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'Aves','Las Aves son animales vertebrados terrestres que tienen el cuerpo recubierto de plumas y las extremidades anteriores transformadas en alas.'),(2,'Mamíferos','Los Mamíferos son animales vertebrados que por respirar por pulmones,  la mayoría tienen pelos, cuatro patas y cola, aunque los mamíferos acuáticos tienen aletas y la piel desnuda.'),(3,'Peces','Los Anfibios son animales vertebrados que se caracterizan porque tienen su piel desnuda, sin escamas  y tienen metamorfosis. '),(4,'Anfibios',' Los Peces son animales vertebrados que tienen el cuerpo recubierto de escamas, viven en el agua, se desplazan utilizando sus aletas, tienen respiración branquial y tienen un esqueleto formado por espinas. '),(5,'Reptiles','Los Reptiles son animales vertebrados que se caracterizan por su especial manera de andar, ya que andan arrastrando el vientre por el suelo.');
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especies`
--

DROP TABLE IF EXISTS `especies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especies` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Especie` varchar(45) NOT NULL,
  `IdClase` int(11) DEFAULT NULL,
  `Habitat` varchar(45) DEFAULT NULL,
  `Peso` double(7,2) DEFAULT NULL,
  `Tamaño` int(11) DEFAULT NULL,
  `Observaciones` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_especie_clase_idx` (`IdClase`),
  CONSTRAINT `fk_especie_clase` FOREIGN KEY (`IdClase`) REFERENCES `clase` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (1,'Águila real',1,'Montañas',6.00,95,'Caza volando en picado o en vuelo raso.'),(2,'Alce',2,'Tundra',530.00,290,'Tiene astas palmeadas con una envergadura de hasta 3 metros.'),(3,'Anguila',3,'Ríos y mares',4.00,75,'Los adultos migran al mar.'),(4,'Ardilla',2,'Bosques',0.30,45,'Come semillas, frutos e insectos.'),(5,'Armiño',2,'Montañas',0.45,29,'Caza pequeños mamíferos, sobre todo conejos.'),(6,'Bisonte europeo',2,'Praderas',900.00,340,'Se alimenta de hojas de árboles y pequeñas ramas.'),(7,'Búho real',1,'Bosques y montañas',3.20,70,'Se alimenta de mamíferos, aves, anfibios, reptiles e invertebrados.'),(8,'Cabra alpina',2,'Montañas',150.00,170,'No tolera el calor y es una buena escaladora.'),(9,'Carpa',3,'Ríos',40.00,150,'En invierno se entierra en el fango para invernar.'),(10,'Castor',2,'Ríos y lagos',25.00,110,'Construye una madriguera con la entrada bajo la superficie del agua.'),(11,'Cigüeña',1,'Terrenos abiertos',4.40,110,'Anida en los tejados.'),(12,'Cisne',1,'Lagos',10.00,200,'Construye los nidos en los cañaverales.'),(13,'Codorniz',1,'Estepa',0.10,18,'Crea sus nidos e incuba sus huevos en el suelo.'),(14,'Comadreja',2,'Montañas',0.10,25,'Suele frecuentar los establos, sótanos, etc.'),(15,'Conejo',2,'Estepas',2.00,45,'Alcanza una velocidad de 38 Km/h.'),(16,'Cormorán',1,'Lagos',2.30,92,'En algunos países lo utilizan para pescar.'),(17,'Corzo',2,'Bosques',50.00,140,'Suele luchar por marcar su territorio.'),(18,'Culebra de collar',5,'Orillas de ríos',0.50,105,'Su veneno es débil y le sirve para digerir sus presas: ranas y peces.'),(19,'Delfín mular',2,'Mares',300.00,270,'Es capaz de guiarse mediante un sistema análogo al sonar.'),(20,'Erizo',2,'Bosques y jardines',1.20,30,'Vive solitario excepto en la época de apareamiento.'),(21,'Foca',2,'Mares',120.00,200,'Amamanta de 4 a 6 semanas a sus crías.'),(22,'Gamo',2,'Parques',125.00,165,'Sus cuernos tienen forma de pequeñas paletas.'),(23,'Garza real',1,'Lagunas',1.70,100,'Se nutre de peces, moluscos y pequeños roedores.'),(24,'Gato montés',2,'Bosques montañosos',6.00,80,'Posee territorio de caza y se alimenta de ratones, conejos, aves, etc.'),(25,'Gavilán',1,'Bosques',0.35,34,'El macho caza para dar de comer a los polluelos.'),(26,'Grulla',1,'Pantanos',6.00,122,'Migra en grupo, adoptando forma de V durante el vuelo.'),(27,'Halcón',1,'Bosques',0.90,48,'Vuela en picado, alcanzando una velocidad de 320 Km/h.'),(28,'Hámster',2,'Estepas',0.50,29,'Omnívoro; come plantas, raíces... e incluso invertebrados.'),(29,'Jabalí',2,'Bosques',180.00,155,'Se alimenta de raíces, setas y bellotas.'),(30,'Lagartija',5,'Rocas',0.08,20,'En verano, se calienta bajo el sol en los muros.'),(31,'Lenguado',3,'Mares',0.30,50,'Los adultos son asimétricos, ya que sufren transformaciones por aplastamiento.'),(32,'Liebre',2,'Estepas',4.00,65,'Alcanza una velocidad máxima de 70 Km/h.'),(33,'Lince',2,'Bosques y montañas',26.00,110,'Puede vivir hasta 20 años.'),(34,'Lirón careto',2,'Bosques',0.12,17,'Come orugas, escarabajos, saltamontes, etc.'),(35,'Lobo',2,'Estepas y bosques',40.00,155,'Ataca en jaurías a grandes animales.'),(36,'Lución',5,'Terrenos húmedos',0.13,50,'Aunque parezca una serpiente, se trata de un lagarto sin patas.'),(37,'Marmota',2,'Montañas',4.00,69,'Excava terreras de hasta 10 metros de longitud.'),(38,'Murciélago',2,'Parques y jardines',0.15,13,'Vuela en la oscuridad.'),(39,'Nutria',2,'Ríos',13.00,90,'Construye madrigueras en las aguas tranquilas.'),(40,'Oropéndola',1,'Parques y jardines',0.09,24,'Realiza la migración a Etiopia y Mozambique.'),(41,'Oso pardo',2,'Montañas y bosques',225.00,210,'Es omnívoro; come todo lo que encuentra.'),(42,'Paloma',1,'Ciudades',0.33,33,'Nidifica en las cornisas de las casas.'),(43,'Perdiz',1,'Estepas',0.40,30,'El macho es el encargado de cuidar de los perdigones.'),(44,'Quebrantahuesos',1,'Montañas',7.10,114,'Se alimenta de huesos, que tira contra las rocas hasta que se astillan.'),(45,'Ratón casero',2,'Casas rurales',0.03,18,'Come semillas, provisiones y desechos variados.'),(46,'Rebeco',2,'Montañas',62.00,130,'Los dedos del casco están unidos por ligamentos.'),(47,'Ruiseñor',1,'Parques y jardines',0.03,16,'Migra hacia la sabana de África Central.'),(48,'Salamandra',4,'Orillas de lagos',0.04,20,'Su piel segrega veneno mortal para los pequeños organismos.'),(49,'Salmón',3,'Mares',20.00,130,'Remonta los ríos para desovar.'),(50,'Sapo común',4,'Bosques y jardines',0.10,15,'Se defiende con un veneno que sale de las glándulas de la piel.'),(51,'Tejón',2,'Bosques',15.00,85,'No inverna, tan sólo baja su actividad y duerme muchísimo.'),(52,'Topo',2,'Bosques y jardines',0.12,17,'Vive 3 años y de forma solitaria.'),(53,'Tórtola',1,'Bosques',4.20,28,'Nidifica en arbustos de estepas densas.'),(54,'Tritón crestado',4,'Lagos',0.50,18,'La hembra carece de cresta; come pequeños crustáceos, insectos y renacuajos.'),(55,'Trucha',3,'Ríos montañosos',0.50,30,'Es capaz de poner 1500 huevos de una sola vez.'),(56,'Víbora',5,'Montes',0.60,80,'Las crías salen de los huevos con los dientes venenosos perfectos.'),(57,'Zorro',2,'Bosques',7.00,90,'Construye y vive en madrigueras con varias galerías.');
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-07 22:08:43
