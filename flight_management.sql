/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.6.26 : Database - flight_management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`flight_management` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `flight_management`;

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(50) NOT NULL COMMENT '城市名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `city` */

insert  into `city`(`id`,`cityName`) values (1,'北京'),(2,'广州'),(3,'上海'),(4,'深圳');

/*Table structure for table `flight` */

DROP TABLE IF EXISTS `flight`;

CREATE TABLE `flight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flightNo` varchar(50) NOT NULL COMMENT '航班编号',
  `departureCity` int(11) NOT NULL COMMENT '起飞城市id',
  `departureTime` date NOT NULL COMMENT '起飞时间',
  `arrivalCity` int(11) NOT NULL COMMENT '到达城市id',
  `arrivalTime` date NOT NULL COMMENT '到达时间',
  PRIMARY KEY (`id`),
  KEY `departureCity` (`departureCity`),
  KEY `arrivalCity` (`arrivalCity`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`departureCity`) REFERENCES `city` (`id`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`arrivalCity`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `flight` */

insert  into `flight`(`id`,`flightNo`,`departureCity`,`departureTime`,`arrivalCity`,`arrivalTime`) values (11,'S1001',1,'2019-01-01',2,'2019-01-02'),(12,'S1002',2,'2019-01-02',1,'2019-01-03'),(13,'S1003',4,'2019-01-01',1,'2019-01-02'),(14,'S1004',3,'2019-01-01',1,'2019-01-02'),(15,'S1005',4,'2019-01-01',2,'2019-01-02'),(16,'S1006',1,'2021-05-10',2,'2021-05-11'),(17,'S1007',2,'2021-05-10',1,'2021-05-11'),(18,'S1008',1,'2021-05-10',2,'2021-05-10'),(19,'S107',1,'2021-05-10',2,'2021-05-10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
