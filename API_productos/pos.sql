-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pos
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `producto_codigo` bigint(20) unsigned NOT NULL CHECK (octet_length(`producto_codigo`) = 13),
  `producto_nombre` varchar(255) NOT NULL CHECK (octet_length(trim(`producto_nombre`)) > 0),
  `producto_precio` decimal(4,2) NOT NULL CHECK (`producto_precio` >= 0.01),
  `producto_imagen` varchar(255) NOT NULL CHECK (octet_length(trim(`producto_imagen`)) > 4 and `producto_imagen` regexp '^[0-9a-zA-Z]+\\.(png|jpg|webp|svg|gif)$'),
  UNIQUE KEY `producto_imagen` (`producto_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1000000000004,'Acrilicos',99.99,'acrilicos.webp'),(1000000000055,'Acuarela metalica',60.00,'acuarelaMetal.jpg'),(1000000000002,'Acuarelas',99.99,'acuarelas.png'),(1000000000033,'Adhesivo blanco',12.00,'adhesivoBlanco.jpg'),(1000000000096,'Adhesivo en spray',32.00,'adhesivoSpray.jpg'),(1000000000059,'Aerosol barniz',50.00,'aerosolBarniz.jpg'),(1000000000071,'Afilador metálico',9.00,'afiladorMetal.jpg'),(1000000000041,'Alcohol isopropílico',33.00,'alcoholIso.jpg'),(1000000000094,'Alcohol para tinta',18.00,'alcoholTinta.jpg'),(1000000000027,'Barniz brillante',35.00,'barnizBrillante.jpg'),(1000000000077,'Barniz mate',29.00,'barnizMate.jpg'),(1000000000015,'Bloc de dibujo',90.00,'blocDibujo.jpg'),(1000000000045,'Bolígrafos de gel',55.00,'boligrafosGel.jpg'),(1000000000019,'Borrador amasable',18.00,'borradorAmasable.jpg'),(1000000000100,'Caballete grande',99.99,'caballeteGrande.jpg'),(1000000000098,'Caja de marcadores',99.99,'cajaMarcadores.jpg'),(1000000000025,'Caja para materiales',99.99,'cajaMateriales.jpg'),(1000000000065,'Caja metálica',75.00,'cajaMetal.jpg'),(1000000000050,'Caja para pinceles',99.99,'cajaPinceles.jpg'),(1000000000088,'Caja témperas',99.99,'cajaTemperas.jpg'),(1000000000012,'Carboncillo',40.00,'carboncillo.jpg'),(1000000000022,'Cartulina negra',8.00,'cartulinaNegra.jpg'),(1000000000069,'Cinta azul',11.00,'cintaAzul.jpg'),(1000000000035,'Cinta doble cara',18.00,'cintaDoble.jpg'),(1000000000084,'Cinta dorada',14.00,'cintaDorada.jpg'),(1000000000008,'Cinta masking',15.00,'cintaMasking.jpg'),(1000000000057,'Cinta métrica',18.00,'cintaMetrica.jpg'),(1000000000089,'Compás escolar',35.00,'compasEscolar.jpg'),(1000000000010,'Compás metálico',55.00,'compasMetalico.jpg'),(1000000000040,'Caja de crayones',42.00,'crayones.jpg'),(1000000000074,'Set de crayones',48.00,'crayonesSet.jpg'),(1000000000054,'Cuaderno de bocetos',90.00,'cuadernoBocetos.jpg'),(1000000000082,'Cuadro para óleo',99.99,'cuadroOleo.jpg'),(1000000000014,'Cúter de precisión',35.00,'cutterPrecision.jpg'),(1000000000056,'Espátula curva',20.00,'espatulaCurva.jpg'),(1000000000042,'Espátula flexible',24.00,'espatulaFlex.jpg'),(1000000000032,'Espátula de pintura',25.00,'espatulaPintura.jpg'),(1000000000038,'Estuche rígido',65.00,'estucheRigido.jpg'),(1000000000075,'Estuche de viaje',99.99,'estucheViaje.jpg'),(1000000000048,'Goma de borrar',6.00,'gomaBorrar.jpg'),(1000000000061,'Goma moldeable',12.00,'gomaMoldeable.jpg'),(1000000000029,'Grafito en barra',26.00,'grafitoBarra.jpg'),(1000000000093,'Caja grafito',42.00,'grafitoCaja.jpg'),(1000000000083,'Grapadora pequeña',22.00,'grapadora.jpg'),(1000000000099,'Kit de dibujo',99.99,'kitDibujo.jpg'),(1000000000063,'Lapicero mecánico',38.00,'lapiceroMecanico.jpg'),(1000000000079,'Caja lápices 12pzas',66.00,'lapices12.jpg'),(1000000000020,'Lápices de colores',95.00,'lapicesColores.jpg'),(1000000000044,'Lápices pastel',70.00,'lapicesPastel.jpg'),(1000000000037,'Lápiz 2B',5.00,'lapiz2b.jpg'),(1000000000097,'Lápices carbón',34.00,'lapizCarbon.jpg'),(1000000000049,'Lápiz carpintero',7.00,'lapizCarpintero.jpg'),(1000000000070,'Lápiz HB',5.00,'lapizHB.jpg'),(1000000000003,'Lienzo 30x40',75.00,'lienzo30x40.jpg'),(1000000000011,'Marcadores permanentes',60.00,'marcadores.jpg'),(1000000000067,'Marcadores gruesos',60.00,'marcadorGrueso.jpg'),(1000000000092,'Marcador textil',33.00,'marcadorTextil.jpg'),(1000000000034,'Mini caballete',90.00,'miniCaballete.jpg'),(1000000000085,'Mini espátula',10.00,'miniEspatula.jpg'),(1000000000013,'Caja de óleos',99.99,'oleosCaja.jpg'),(1000000000068,'Paleta de madera',33.00,'paletaMadera.jpg'),(1000000000017,'Paleta de mezclas',22.00,'paletaMezclas.png'),(1000000000021,'Papel acuarela',40.00,'papelAcuarela.jpg'),(1000000000043,'Papel cebolla',15.00,'papelCebolla.jpg'),(1000000000062,'Papel ilustración',26.00,'papelIlustracion.jpg'),(1000000000005,'Papel kraft',12.00,'papelKraft.jpg'),(1000000000087,'Papel mantequilla',13.00,'papelMantequilla.jpg'),(1000000000066,'Papel reciclado',10.00,'papelReciclado.jpg'),(1000000000095,'Caja pastel óleo',99.99,'pastelOleo.jpg'),(1000000000072,'Caja pastel seco',99.99,'pastelSeco.jpg'),(1000000000047,'Pegamento en barra',10.00,'pegamentoBarra.jpg'),(1000000000081,'Pegamento líquido',15.00,'pegamentoLiquido.jpg'),(1000000000001,'Pincel fino',25.00,'pincelFino.jpg'),(1000000000023,'Pincel plano',28.00,'pincelPlano.jpg'),(1000000000016,'Pintura metálica',38.00,'pinturaMetalica.jpg'),(1000000000036,'Plantillas geométricas',28.00,'plantillasGeo.jpg'),(1000000000090,'Plastilina colores',39.00,'plastilina.jpg'),(1000000000009,'Plumones',85.00,'plumones.jpg'),(1000000000086,'Plumones de agua',60.00,'plumonesAgua.jpg'),(1000000000053,'Plumón punta fina',22.00,'plumonFino.jpg'),(1000000000030,'Portaminas',30.00,'portaminas.jpg'),(1000000000091,'Regla curva',27.00,'reglaCurva.jpg'),(1000000000006,'Regla metálica',30.00,'reglaMetalica.jpg'),(1000000000052,'Rotulador blanco',35.00,'rotuladorBlanco.jpg'),(1000000000028,'Rotuladores',60.00,'rotuladores.jpg'),(1000000000080,'Rotulador grueso',37.00,'rotuladorGrueso.jpg'),(1000000000051,'Set de pinceles',45.00,'setPinceles.jpg'),(1000000000076,'Soporte para pincel',19.00,'soportePincel.jpg'),(1000000000018,'Spray fijador',70.00,'sprayFijador.jpg'),(1000000000026,'Set de stencil',45.00,'stencilSet.jpg'),(1000000000078,'Témpera blanca',16.00,'temperab.jpg'),(1000000000046,'Témperas',90.00,'temperas.jpg'),(1000000000007,'Tijeras',20.00,'tijeras.png'),(1000000000039,'Tinta blanca',48.00,'tintaBlanca.jpg'),(1000000000024,'Tinta china',50.00,'tintaChina.jpg'),(1000000000031,'Tinta dorada',55.00,'tintaDorada.jpg'),(1000000000073,'Tinta negra',40.00,'tintaNegra.jpg'),(1000000000064,'Tinta sepia',55.00,'tintaSepia.jpg'),(1000000000058,'Tiralíneas',33.00,'tiralineas.jpg'),(1000000000060,'Tiza pastel',44.00,'tizaPastel.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-01 21:11:10
