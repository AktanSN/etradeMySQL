-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.30-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema etrade
--

CREATE DATABASE IF NOT EXISTS etrade;
USE etrade;

--
-- Definition of table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(10) unsigned NOT NULL,
  `COUNTRY` varchar(45) NOT NULL,
  `CITY` varchar(45) NOT NULL,
  `TOWN` varchar(45) NOT NULL,
  `DISTRICT` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_address_1` (`USERID`),
  CONSTRAINT `FK_address_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`ID`,`USERID`,`COUNTRY`,`CITY`,`TOWN`,`DISTRICT`) VALUES 
 (1,1,'TURKEY','ISTANBUL','MALTEPE','KUCUKYALI'),
 (2,1,'TURKEY','ISTANBUL','KADIKOY','RIHTIM'),
 (3,1,'TURKEY','ANTALYA','MURATPASA','MURATPASA'),
 (4,1,'TURKEY','ISTANBUL','MALTEPE','KUCUKYALI'),
 (5,2,'TURKEY','TEKIRDAG','MALTEPE','AYDINEVLER'),
 (6,3,'TURKEY','IZMIR','KARSIYAKA','KALEICI'),
 (7,4,'TURKEY','ISTANBUL','KADIKOY','RIHTIM'),
 (8,4,'TURKEY','ISTANBUL','MALTEPE','MAVIEVLER'),
 (9,5,'TURKEY','ANKARA','AYDINEV','ANITLAR'),
 (10,5,'TURKEY','ISTANBUL','MALTEPE','KUCUKYALI'),
 (11,6,'TURKEY','ISTANBUL','MALTEPE','KUCUKYALI'),
 (12,6,'TURKEY','ISTANBUL','KADIKOY','RIHTIM'),
 (13,6,'TURKEY','ANTALYA','MURATPASA','MURATPASA'),
 (14,7,'TURKEY','ISTANBUL','MALTEPE','KUCUKYALI'),
 (15,7,'TURKEY','TEKIRDAG','KARSIYAKA','KARSIYAKA'),
 (16,7,'TURKEY','IZMIR','KADIKOY','RIHTIM'),
 (17,7,'TURKEY','ISTANBUL','MALTEPE','KUCUKYALI'),
 (18,8,'TURKEY','ISTANBUL','MALTEPE','MAVIEVLER'),
 (19,8,'TURKEY','ANKARA','AYDINEV','ANITLAR'),
 (20,9,'TURKEY','ISTANBUL','MALTEPE','KUCUKYALI');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;


--
-- Definition of table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ITEMCODE` varchar(45) NOT NULL,
  `ITEMNAME` varchar(100) NOT NULL,
  `UNITPRICE` float NOT NULL,
  `CATEGORY` varchar(45) NOT NULL,
  `BRAND` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`ID`,`ITEMCODE`,`ITEMNAME`,`UNITPRICE`,`CATEGORY`,`BRAND`) VALUES 
 (1,'5','PIL KODAK XTRA HEAVY 9 V',5,'EV','KODAK'),
 (2,'6','PIL KODAK AA*2 MAX ALKALIN KALEM',8.26,'EV','KODAK'),
 (3,'9','PILLI SESLI UCAK',53.2,'OYUNCAK','OYUNCAK'),
 (4,'11','VAKKUMLU TASIYICI TIR',20.83,'OYUNCAK','OYUNCAK'),
 (5,'15','OYUNCAK KUT.4LU METAL CEK BIRAK',30.95,'OYUNCAK','OYUNCAK'),
 (6,'16','OYUNCAK BEZ BEBEK',19.55,'OYUNCAK','OYUNCAK'),
 (7,'17','OFICA SERIT DAKSIL',1.01,'EV','EV'),
 (8,'18','OFFICA MAKET BICAGI UCU',1.68,'EV','EV'),
 (9,'19','OFICA FH4550 HESAP MAKINASI ',31.13,'EV','EV'),
 (10,'21','PRT.UDAG WA0030 SAKLAMA KABI ',15.55,'EV','EV'),
 (11,'22','PRT.UDAG WA0046 TUVALET KAGITLIGI  ',19.83,'TEMIZLIK','TEMIZLIK'),
 (12,'23','MARUL KIVIRCIK',6.25,'YESILLIK','TEMIZLIK'),
 (13,'29','CARPEX TYPES KLIMA KOKU SUMMER BREEZE ',7.53,'TEMIZLIK','TEMIZLIK'),
 (14,'30','PIL KODAK XTRA HEAVY KALEM 2\'LI',4.75,'EV','EV'),
 (15,'35','OYUNCAK KUTUDA RENKLI SACLI BEBEK',40.03,'OYUNCAK','OYUNCAK'),
 (16,'36','FIGURLU OGRENCI MAKASI',2.05,'EV','EV'),
 (17,'37','CITCIT DOSYA',1.3,'EV','EV'),
 (18,'40','SOGAN KISKA PK.',0.73,'SEBZE','SEBZE'),
 (19,'42','DOMATES KOKTEYL SEKER PAKET ',1.44,'SEBZE','SEBZE'),
 (20,'43','GOLBASI MAROL',1.6,'YESILLIK','YESILLIK');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


--
-- Definition of table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ORDERID` int(10) unsigned NOT NULL,
  `ITEMID` int(10) unsigned NOT NULL,
  `AMOUNT` int(10) unsigned NOT NULL,
  `UNITPRICE` float NOT NULL,
  `LINETOTAL` float NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_orderdetails_1` (`ORDERID`),
  KEY `FK_orderdetails_2` (`ITEMID`),
  CONSTRAINT `FK_orderdetails_1` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`ID`),
  CONSTRAINT `FK_orderdetails_2` FOREIGN KEY (`ITEMID`) REFERENCES `items` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetails`
--

/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` (`ID`,`ORDERID`,`ITEMID`,`AMOUNT`,`UNITPRICE`,`LINETOTAL`) VALUES 
 (1,1,1,2,10,20),
 (2,2,2,3,12,36),
 (3,3,3,2,5,10),
 (4,4,4,1,10,10),
 (5,5,5,3,5,15),
 (6,6,6,4,8,32),
 (7,7,7,5,5,25),
 (8,8,8,6,9,54),
 (9,9,9,1,5,5),
 (10,10,10,4,7,28),
 (11,11,11,1,10,10),
 (12,12,12,2,10,20),
 (13,13,13,3,5,15),
 (14,14,14,1,20,20),
 (15,15,15,2,10,20),
 (16,16,16,5,5,25),
 (17,17,17,2,2,4),
 (18,18,18,1,10,10),
 (19,19,19,1,2,2),
 (20,20,20,3,1,3);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;


--
-- Definition of table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(10) unsigned NOT NULL,
  `DATE_` datetime NOT NULL,
  `TOTALRPICE` float NOT NULL,
  `STATUS_` int(10) unsigned NOT NULL,
  `ADDRESSID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_orders_1` (`USERID`),
  KEY `FK_orders_2` (`ADDRESSID`),
  CONSTRAINT `FK_orders_1` FOREIGN KEY (`USERID`) REFERENCES `users` (`ID`),
  CONSTRAINT `FK_orders_2` FOREIGN KEY (`ADDRESSID`) REFERENCES `address` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`ID`,`USERID`,`DATE_`,`TOTALRPICE`,`STATUS_`,`ADDRESSID`) VALUES 
 (1,1,'2020-01-10 00:00:00',140,2,1),
 (2,1,'2020-01-12 00:00:00',120,1,2),
 (3,1,'2020-03-15 00:00:00',50,2,3),
 (4,1,'2020-03-15 00:00:00',80,2,4),
 (5,2,'2020-03-15 00:00:00',100,2,5),
 (6,3,'2020-03-15 00:00:00',40,1,6),
 (7,4,'2020-03-15 00:00:00',70,1,7),
 (8,4,'2020-03-15 00:00:00',200,3,8),
 (9,5,'2020-03-15 00:00:00',100,2,9),
 (10,5,'2020-03-15 00:00:00',50,1,10),
 (11,6,'2020-03-15 00:00:00',60,1,11),
 (12,6,'2020-03-15 00:00:00',100,2,12),
 (13,6,'2020-03-15 00:00:00',150,3,13),
 (14,7,'2020-03-15 00:00:00',50,2,14),
 (15,7,'2020-03-15 00:00:00',60,2,15),
 (16,7,'2020-03-15 00:00:00',10,1,16),
 (17,7,'2020-03-15 00:00:00',50,1,17),
 (18,8,'2020-03-15 00:00:00',200,4,18),
 (19,8,'2020-03-15 00:00:00',150,2,19),
 (20,9,'2020-03-15 00:00:00',120,3,20);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


--
-- Definition of table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ORDERID` int(10) unsigned NOT NULL,
  `PAYMENTTYPE` int(10) unsigned NOT NULL,
  `DATE_` datetime NOT NULL,
  `ISOK` bit(1) NOT NULL,
  `APPROVECODE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_payments_1` (`ORDERID`),
  CONSTRAINT `FK_payments_1` FOREIGN KEY (`ORDERID`) REFERENCES `orders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`ID`,`ORDERID`,`PAYMENTTYPE`,`DATE_`,`ISOK`,`APPROVECODE`) VALUES 
 (1,1,1,'2020-01-10 00:00:00',0x00,'1234'),
 (2,2,1,'2020-01-10 00:00:00',0x00,'5678'),
 (3,3,1,'2020-01-10 00:00:00',0x00,'1345'),
 (4,4,1,'2020-01-10 00:00:00',0x00,'5761'),
 (5,5,0,'2020-01-10 00:00:00',0x00,'1235'),
 (6,6,1,'2020-01-10 00:00:00',0x00,'7952'),
 (7,7,0,'2020-01-10 00:00:00',0x00,'1266'),
 (8,8,0,'2020-01-10 00:00:00',0x00,'6654'),
 (9,9,0,'2020-01-10 00:00:00',0x00,'2476'),
 (10,10,0,'2020-01-10 00:00:00',0x00,'6572'),
 (11,11,1,'2020-01-10 00:00:00',0x00,'3217'),
 (12,12,1,'2020-01-10 00:00:00',0x00,'4562'),
 (13,13,1,'2020-01-10 00:00:00',0x00,'2375'),
 (14,14,0,'2020-01-10 00:00:00',0x00,'6756'),
 (15,15,0,'2020-01-10 00:00:00',0x00,'5674'),
 (16,16,0,'2020-01-10 00:00:00',0x00,'6786'),
 (17,17,0,'2020-01-10 00:00:00',0x00,'6852'),
 (18,18,1,'2020-04-10 00:00:00',0x00,'5432'),
 (19,19,1,'2020-08-10 00:00:00',0x00,'2222'),
 (20,20,1,'2020-07-10 00:00:00',0x00,'2146');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERNAME_` varchar(45) NOT NULL,
  `PASSWORD_` varchar(45) NOT NULL,
  `NAMESURNAME` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `GENDER` varchar(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`ID`,`USERNAME_`,`PASSWORD_`,`NAMESURNAME`,`EMAIL`,`GENDER`) VALUES 
 (1,'N_OZSIMITCI','doropipa','Nazlican OZSIMITCI','N_OZSIMITCI@mail.com','K'),
 (2,'A_TOPAL','boerke80','Arya TOPAL','A_TOPAL@mail.com','K'),
 (3,'D_GURBETOGLU','theebryanT','Done GURBETOGLU','D_GURBETOGLU@mail.com','E'),
 (4,'E_SELIM','xpais','Emihan SELIM','E_SELIM@mail.com','E'),
 (5,'S_VLGEN','iamNorthian','Soner ULGEN','S_VLGEN@mail.com','E'),
 (6,'C_BORKLV','audraia','Cetin BORKLU','C_BORKLV@mail.com','E'),
 (7,'E_KURTUNCU','translatlantic','Ezgi KURTUNCU','E_KURTUNCU@mail.com','K'),
 (8,'H_VREGIL','happy2shoes','Hazal UREGIL','H_VREGIL@mail.com','K'),
 (9,'A_SUYUR','im_nthelordsarmy','Aykut SUYUR','A_SUYUR@mail.com','E'),
 (10,'O_KIRIT','sugarandspice39','Onur KIRIT','O_KIRIT@mail.com','E'),
 (11,'A_HAKKI','1234543','Ahmet HAKKI','A_HAKKI@mail.com','E'),
 (12,'M_YILDIZ','546466','Mustafa YILDIZ','M_YILDIZ@mail.com','E'),
 (13,'A_PAK','3543453','Arzu PAK','A_PAK@mail.com','K'),
 (14,'E_YUKSEK','13254345','Eda YUKSEK','E_YUKSEK@mail.com','K'),
 (15,'E_RAK','12312321','Erdi RAK','E_RAK@mail.com','E'),
 (16,'A_SANHAL','132145345','Aktan SANHAL','A_SANHAL@mail.com','E'),
 (17,'H_SOL','68745','Hasan SOL','H_SOL@mail.com','E'),
 (18,'R_TERZI','35446786','Remzi TERZI','R_TERZI@mail.com','E'),
 (19,'N_ODLEK','456547','Neslihan ODLEK','N_ODLEK@mail.com','K'),
 (20,'R_KAYA','3546456','Riza KAYA','R_KAYA@mail.com','E');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
