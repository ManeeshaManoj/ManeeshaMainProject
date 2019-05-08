/*
SQLyog Community Edition- MySQL GUI v8.03 
MySQL - 5.1.32-community : Database - project
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`project` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `project`;

/*Table structure for table `algorithm` */

DROP TABLE IF EXISTS `algorithm`;

CREATE TABLE `algorithm` (
  `id` int(11) NOT NULL,
  `lanslide_type` varchar(15) DEFAULT NULL,
  `trigger` float DEFAULT NULL,
  `landslide_size` float DEFAULT NULL,
  `distance_to_river` float DEFAULT NULL,
  `elevation` float DEFAULT NULL,
  `aspect` float DEFAULT NULL,
  `soil_type` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `class_label` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `algorithm` */

/*Table structure for table `contact` */

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `contactid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `house_name` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `phone` bigint(14) DEFAULT NULL,
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `contact` */

insert  into `contact`(`contactid`,`name`,`house_name`,`street`,`post`,`city`,`district`,`phone`) values (1,'localauthority','hhhhh','aaaaaaaaaaa','huuu','hggg','hjhhh',12345),(2,'kkkkk','vgfggffgfg       ','Kottooli','Kottooli','ffff','vfgfgff',999999999999999),(3,'localauthority','hhhhh','ss','huuu','hggg','hjhhh',12345),(4,'maneesha','hhhhh','aaaaaaaaaaa','huuu','hggg','hjhhh',12345);

/*Table structure for table `disasterreport` */

DROP TABLE IF EXISTS `disasterreport`;

CREATE TABLE `disasterreport` (
  `rptid` int(11) NOT NULL AUTO_INCREMENT,
  `ndtype` varchar(25) DEFAULT NULL,
  `casualities` varchar(100) DEFAULT NULL,
  `loss` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`rptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `disasterreport` */

/*Table structure for table `inputdatas` */

DROP TABLE IF EXISTS `inputdatas`;

CREATE TABLE `inputdatas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place` varchar(50) DEFAULT NULL,
  `l_type` float DEFAULT NULL,
  `triger` float DEFAULT NULL,
  `l_size` float DEFAULT NULL,
  `dis_river` float DEFAULT NULL,
  `elevation` float DEFAULT NULL,
  `aspect` int(20) DEFAULT NULL,
  `soil_type` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `inputdatas` */

insert  into `inputdatas`(`id`,`place`,`l_type`,`triger`,`l_size`,`dis_river`,`elevation`,`aspect`,`soil_type`,`latitude`,`longitude`) values (1,'Eranad',0,0,0,514,42,1,7,11.2689,76.2154),(2,'Tirur',0,0,0,200,9,1,2,10.9177,75.9218),(3,'Tirurangadi',0,0,0,7854,34,1,7,11.0425,75.9271),(4,'Sungai Putai',3,4,2,96.7024,195,1,1,1.8257,113.899),(5,'Kingcome Inlet',3,4,1,136.655,879,2,1,50.9975,-126.404),(6,'Kondotty',0,0,0,2556,30,1,6,11.1455,75.9651),(7,'Cherukulamba',0,0,0,2456,19,1,7,11.0187,76.1157),(8,'Kuruvambalam',0,0,0,1223,19,1,8,10.9206,76.1662),(9,'Golden Tower Building',0,0,0,2556,19,1,8,10.9206,76.1662),(10,'Sreekanteswara Complex',0,0,0,2556,10,1,8,11.2581,75.7843);

/*Table structure for table `legal` */

DROP TABLE IF EXISTS `legal`;

CREATE TABLE `legal` (
  `legal_id` int(11) NOT NULL AUTO_INCREMENT,
  `disaster` varchar(25) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `alert` varchar(20) DEFAULT NULL,
  `helpnum` bigint(15) DEFAULT NULL,
  `descri` varchar(100) DEFAULT NULL,
  `precautions` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`legal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `legal` */

insert  into `legal`(`legal_id`,`disaster`,`location`,`alert`,`helpnum`,`descri`,`precautions`) values (1,'Drought','localauthority','Red',12345,'jjjjjjjjjjjjjj','ssssssssssssssssssss'),(2,'Drought','localauthority','Red',12345,'jjjjjjjjjjjjj','aaaaaaaaaaaaaaa'),(3,'Drought','wertyui','Red',9898989898,'sdfghj','dfghj'),(4,'Drought','calicut','Red',7909151924,'qwertyuii','asdfgh'),(5,'Drought','hhhhh','Not Specified',79091519,'eeeeeeeee','errrrrrr');

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `locationid` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(25) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `altitude` varchar(25) DEFAULT NULL,
  `river_area` varchar(25) DEFAULT NULL,
  `population` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `location` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `loginid` int(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`loginid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`loginid`,`user_name`,`password`,`type`) values (1,'disaster','disaster123','dmt'),(11,'police123','police123','local'),(12,'police','000000','local'),(13,'police','000000','local'),(15,'local123','local123','local'),(16,'firecalicut','fire123','local'),(17,'disaster','disaster123','local'),(18,'maneesha','123456789','guestuser'),(22,'Naveen','9876543210','guestuser'),(23,'Aswani','1234567890','guestuser'),(24,'Ajanya','1234','guestuser'),(25,'ASWANI','1234','guestuser'),(26,'mannnn','7736330327','local'),(27,'Maneesha','123','guestuser');

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `meet_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) DEFAULT NULL,
  `venue` varchar(20) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `agenda` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`meet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `meeting` */

insert  into `meeting`(`meet_id`,`subject`,`venue`,`time`,`agenda`) values (4,'localauthority','ddd1','00:00:10','wwwwwww'),(5,'mjjjj','ddd1','00:00:10','dd'),(6,'mmmmmmm','ddd1','00:00:10','eeeeeeeeeee'),(7,'asaa','calicut','00:00:10','asdf'),(8,'hhhh','hhhh','00:00:10','yyyyy');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `disaster` varchar(20) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `status` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `notification` */

insert  into `notification`(`notification_id`,`disaster`,`description`,`date`,`time`,`status`) values (1,'Storm','errrrrrrrrrrrrr','2000-12-12','00:00:10','viewed'),(2,'Earthquake','hugyfdsa','2000-12-12','00:00:10','viewed');

/*Table structure for table `precautions` */

DROP TABLE IF EXISTS `precautions`;

CREATE TABLE `precautions` (
  `precaution_id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_of_dis` varchar(50) DEFAULT NULL,
  `Precautions` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`precaution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `precautions` */

insert  into `precautions`(`precaution_id`,`Type_of_dis`,`Precautions`) values (1,'Drought','jii');

/*Table structure for table `prediction` */

DROP TABLE IF EXISTS `prediction`;

CREATE TABLE `prediction` (
  `prediction_id` int(11) NOT NULL AUTO_INCREMENT,
  `rain` varchar(10) DEFAULT NULL,
  `wind_speed` varchar(10) DEFAULT NULL,
  `temperature` varchar(10) DEFAULT NULL,
  `air_pollution` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`prediction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prediction` */

/*Table structure for table `reg` */

DROP TABLE IF EXISTS `reg`;

CREATE TABLE `reg` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `localname` varchar(20) DEFAULT NULL,
  `place` varchar(25) DEFAULT NULL,
  `post` varchar(25) DEFAULT NULL,
  `pin` int(10) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `emailid` varchar(25) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `reg` */

insert  into `reg`(`reg_id`,`localname`,`place`,`post`,`pin`,`city`,`emailid`,`phone`) values (1,'localauthority','jjjj','mmmm',1234,'mmm','mmm',33333),(4,'disasterteam','ddd1','hhhhh',222,'hhhh','dddddddddd',12222),(7,'collector','calicut','calicut',673016,'calicut','calicut',2222),(8,'fire','town','city',673016,'calicut','emailid',12345),(9,'health','kozhikode','kozhikode',673016,'calicut','mmm',999999999999999),(11,'police','calicut','calicut',673016,'calicut','maneesha',11111),(12,'ff','ff','fff',1234,'fff','fff',123),(15,'localauthority','jjjj','mmmm',1234,'mmm','mmm',33333),(16,'Fire','calicut','calicut',673016,'calicut','fire@gmail.com',9888888888),(17,'aaa','calicut','lkjhgf',987654,'jkhgfd','a@gmail.com',8989898989),(26,'fire safety','kozhikode','kozhikode',673016,'kozhikode','man@gmail.com',7736330327);

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `rpt_id` int(11) NOT NULL AUTO_INCREMENT,
  `disaster` varchar(15) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `landmark` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `alertlevel` varchar(15) DEFAULT NULL,
  `precaution` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rpt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `report` */

insert  into `report`(`rpt_id`,`disaster`,`location`,`landmark`,`description`,`alertlevel`,`precaution`) values (1,'Drought',' mmm','mmmm','mmmmmmmmmmmmmmmm',' mmm','mmmmm');

/*Table structure for table `reportuser` */

DROP TABLE IF EXISTS `reportuser`;

CREATE TABLE `reportuser` (
  `rpt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `report` varchar(1000) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rpt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `reportuser` */

insert  into `reportuser`(`rpt_id`,`user_id`,`date`,`report`,`image`) values (1,1,'2019-12-12','a issue about water','sample.jpg'),(2,27,'2019-04-29','Hh','20190428_112154.jpg');

/*Table structure for table `suggestion` */

DROP TABLE IF EXISTS `suggestion`;

CREATE TABLE `suggestion` (
  `sug_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sugg` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`sug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `suggestion` */

insert  into `suggestion`(`sug_id`,`user_id`,`date`,`sugg`) values (1,1,'2019-12-12','improve'),(2,2,'2019-04-27','IMPROVE'),(3,25,'2019-04-27','hjjrwee'),(4,25,'2019-04-29','Improve');

/*Table structure for table `userlogin` */

DROP TABLE IF EXISTS `userlogin`;

CREATE TABLE `userlogin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `userlogin` */

insert  into `userlogin`(`user_id`,`name`,`location`,`phone`) values (25,'ASWANI','CALICUT',1234),(27,'Maneesha','Calicut',123);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
