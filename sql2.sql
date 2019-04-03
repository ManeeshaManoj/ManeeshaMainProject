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

/*Table structure for table `legal` */

DROP TABLE IF EXISTS `legal`;

CREATE TABLE `legal` (
  `legal_id` int(11) NOT NULL AUTO_INCREMENT,
  `disaster` varchar(25) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `alert` varchar(20) DEFAULT NULL,
  `helpnum` int(15) DEFAULT NULL,
  `descri` varchar(100) DEFAULT NULL,
  `precautions` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`legal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `legal` */

insert  into `legal`(`legal_id`,`disaster`,`location`,`alert`,`helpnum`,`descri`,`precautions`) values (1,'Drought','localauthority','Red',12345,'jjjjjjjjjjjjjj','ssssssssssssssssssss'),(2,'Drought','localauthority','Red',12345,'jjjjjjjjjjjjj','aaaaaaaaaaaaaaa');

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
  `loginid` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`loginid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`loginid`,`user_name`,`password`,`type`) values (1,'disaster','disaster123','dmt'),(11,'police123','police123','local'),(12,'police','000000','local'),(13,'police','000000','local'),(14,'','','local'),(15,'local123','local123','local'),(16,'firecalicut','fire123','local');

/*Table structure for table `meeting` */

DROP TABLE IF EXISTS `meeting`;

CREATE TABLE `meeting` (
  `meet_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) DEFAULT NULL,
  `venue` varchar(20) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `agenda` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`meet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `meeting` */

insert  into `meeting`(`meet_id`,`subject`,`venue`,`time`,`agenda`) values (4,'localauthority','ddd1','00:00:10','wwwwwww'),(5,'mjjjj','ddd1','00:00:10','dd'),(6,'mmmmmmm','ddd1','00:00:10','eeeeeeeeeee');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `disaster` varchar(20) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `notification` */

insert  into `notification`(`notification_id`,`disaster`,`description`,`date`,`time`) values (1,'Storm','errrrrrrrrrrrrr','2000-12-12','00:00:10');

/*Table structure for table `precautions` */

DROP TABLE IF EXISTS `precautions`;

CREATE TABLE `precautions` (
  `precaution_id` int(11) NOT NULL AUTO_INCREMENT,
  `precautions` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`precaution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `precautions` */

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `reg` */

insert  into `reg`(`reg_id`,`localname`,`place`,`post`,`pin`,`city`,`emailid`,`phone`) values (1,'localauthority','jjjj','mmmm',1234,'mmm','mmm',33333),(4,'disasterteam','ddd1','hhhhh',222,'hhhh','dddddddddd',12222),(7,'collector','calicut','calicut',673016,'calicut','calicut',2222),(8,'fire','town','city',673016,'calicut','emailid',12345),(9,'health','kozhikode','kozhikode',673016,'calicut','mmm',999999999999999),(11,'police','calicut','calicut',673016,'calicut','maneesha',11111),(12,'ff','ff','fff',1234,'fff','fff',123),(15,'localauthority','jjjj','mmmm',1234,'mmm','mmm',33333),(16,'Fire','calicut','calicut',673016,'calicut','fire@gmail.com',9876543210);

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

/*Table structure for table `reporting` */

DROP TABLE IF EXISTS `reporting`;

CREATE TABLE `reporting` (
  `reportid` int(11) NOT NULL AUTO_INCREMENT,
  `report` varchar(75) DEFAULT NULL,
  `c_image` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reporting` */

/*Table structure for table `suggestion` */

DROP TABLE IF EXISTS `suggestion`;

CREATE TABLE `suggestion` (
  `sug_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sugg` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`sug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `suggestion` */

insert  into `suggestion`(`sug_id`,`user_id`,`date`,`sugg`) values (1,1,'2019-12-12','improve');

/*Table structure for table `suggestions` */

DROP TABLE IF EXISTS `suggestions`;

CREATE TABLE `suggestions` (
  `sugg_id` int(11) NOT NULL AUTO_INCREMENT,
  `suggestion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sugg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `suggestions` */

/*Table structure for table `userlogin` */

DROP TABLE IF EXISTS `userlogin`;

CREATE TABLE `userlogin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `userlogin` */

insert  into `userlogin`(`user_id`,`name`,`location`,`email`,`phone`) values (1,'maneesha','calicut','maneesha',9999999);

/*Table structure for table `userreport` */

DROP TABLE IF EXISTS `userreport`;

CREATE TABLE `userreport` (
  `rpt_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `report` varchar(1000) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`rpt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `userreport` */

insert  into `userreport`(`rpt_id`,`user_id`,`date`,`report`,`image`) values (1,1,'2019-12-12','a issue about water','sample.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
