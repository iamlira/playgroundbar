/*
SQLyog Ultimate v8.32 
MySQL - 5.5.36 : Database - tijianba
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tijianba` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tijianba`;

/*Table structure for table `applyinvoice` */

DROP TABLE IF EXISTS `applyinvoice`;

CREATE TABLE `applyinvoice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `OrderNo` varchar(32) NOT NULL,
  `InvoiceNo` varchar(32) DEFAULT NULL,
  `Title` varchar(128) NOT NULL,
  `ReceiverName` varchar(32) NOT NULL,
  `ReceiverAddress` varchar(256) NOT NULL,
  `ReceiverContact` varchar(64) NOT NULL,
  `Remark` varchar(1024) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `applyinvoice` */

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Code` char(10) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `ParentCode` char(10) DEFAULT NULL,
  `Level` tinyint(4) NOT NULL,
  `Letter` char(1) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8;

/*Data for the table `area` */

insert  into `area`(`ID`,`Code`,`Name`,`ParentCode`,`Level`,`Letter`,`Weight`,`Status`,`CreateTime`,`ModifyTime`) values (10000,'3305710000','杭州','3300000000',2,'H',NULL,0,'2014-11-03 22:45:08','2014-11-03 22:45:08'),(10001,'3305770000','温州','3300000000',2,'W',NULL,0,'2014-11-03 22:45:17','2014-11-03 22:45:17'),(10002,'3300000000','浙江',NULL,1,'',NULL,0,'2014-11-03 22:45:33','2014-11-03 22:45:33'),(10003,'3305710001','滨江区','3305710000',3,'',NULL,0,'2014-11-05 00:08:56','2014-11-05 00:08:56'),(10004,'3305770001','鹿城区','3305770000',3,'',NULL,0,'2014-11-05 00:09:12','2014-11-05 00:09:12');

/*Table structure for table `bonus` */

DROP TABLE IF EXISTS `bonus`;

CREATE TABLE `bonus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Money` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `ExpireTime` datetime DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `bonus` */

insert  into `bonus`(`ID`,`Money`,`Amount`,`Type`,`ExpireTime`,`Status`,`CreateTime`,`ModifyTime`) values (1,195,1002,0,'2015-11-21 00:00:00',0,'2014-11-18 21:55:02','2014-11-18 22:38:33'),(2,10,34,1,'2015-10-16 00:00:00',0,'2014-12-26 22:57:35','2014-12-26 23:09:47');

/*Table structure for table `bookservers` */

DROP TABLE IF EXISTS `bookservers`;

CREATE TABLE `bookservers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ExamType` int(11) NOT NULL,
  `CardNo` varchar(32) NOT NULL,
  `CardPassword` varchar(32) NOT NULL,
  `UseState` int(11) NOT NULL,
  `MenuId` int(11) DEFAULT NULL,
  `OrgId` int(11) DEFAULT NULL,
  `RelateSubjectID` varchar(32) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `bookservers` */

insert  into `bookservers`(`ID`,`ExamType`,`CardNo`,`CardPassword`,`UseState`,`MenuId`,`OrgId`,`RelateSubjectID`,`CreateTime`,`ModifyTime`,`UserId`) values (25,3,'2014111531128','243000',0,NULL,NULL,'1','2014-11-15 11:12:39','2014-11-15 11:12:39',4),(26,3,'2014111561630','243001',0,NULL,NULL,'1','2014-11-15 11:12:39','2014-11-15 11:12:39',5),(27,3,'2014111514741','243002',0,NULL,NULL,'1','2014-11-15 11:12:39','2014-11-15 11:12:39',6),(28,3,'2014111522225','243003',0,NULL,NULL,'1','2014-11-15 11:12:39','2014-11-15 11:12:39',7),(29,3,'2014111565607','243004',0,NULL,NULL,'1','2014-11-15 11:12:39','2014-11-15 11:12:39',8),(30,3,'2014111531800','243005',0,NULL,NULL,'1','2014-11-15 11:12:39','2014-11-15 11:12:39',9),(31,3,'2014111523630','243006',0,NULL,NULL,'1','2014-11-15 11:12:39','2014-11-15 11:12:39',10),(32,3,'2014111530076','243007',0,NULL,NULL,'1','2014-11-15 11:12:39','2014-11-15 11:12:39',11),(33,1,'1111111','111111',1,10004,10010,'1','2014-11-20 22:09:46','2014-12-27 17:53:56',1),(34,1,'222222','222222',1,10005,NULL,'2','2014-11-21 20:37:02','2014-11-21 20:37:05',1),(35,1,'10144447313','710661',0,10009,NULL,'38','2014-12-31 00:31:32','2014-12-31 00:31:32',NULL),(36,4,'40152053837','526878',0,NULL,NULL,'0','2015-01-05 22:15:56','2015-01-05 22:15:56',NULL),(37,4,'40154428282','021452',0,NULL,NULL,'36','2015-01-05 22:20:36','2015-01-05 22:20:36',NULL),(38,4,'40158378300','428240',0,NULL,NULL,'37','2015-01-05 22:25:17','2015-01-05 22:25:17',NULL),(39,4,'40155137658','652077',0,NULL,NULL,'33','2015-01-06 21:47:53','2015-01-06 21:47:53',NULL),(40,4,'40152082707','624765',0,NULL,NULL,'34','2015-01-06 21:47:57','2015-01-06 21:47:57',NULL);

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

/*Data for the table `brand` */

insert  into `brand`(`ID`,`Name`,`Status`,`CreateTime`,`ModifyTime`) values (1,'品牌A',1,'2014-11-02 23:05:17','2014-11-02 23:13:46'),(2,'品牌B2',0,'2014-11-02 23:16:48','2014-11-03 19:37:17'),(3,'小强肥皂',0,'2014-11-03 19:37:07','2014-11-03 19:37:07'),(1000,'小欢药店',0,'2014-11-03 21:46:59','2015-05-07 18:33:53'),(1001,'美年大健康',0,'2014-11-30 19:44:11','2014-11-30 19:44:11');

/*Table structure for table `card` */

DROP TABLE IF EXISTS `card`;

CREATE TABLE `card` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityId` int(11) NOT NULL,
  `CardNo` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Type` tinyint(11) NOT NULL DEFAULT '0',
  `UserId` int(11) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `card` */

insert  into `card`(`ID`,`ActivityId`,`CardNo`,`Password`,`Type`,`UserId`,`Status`,`CreateTime`,`ModifyTime`) values (4,2,'40147711585','823840',1,NULL,'0','2014-11-26 22:41:41','2014-11-26 22:41:41'),(5,2,'40148832318','086736',1,NULL,'0','2014-11-26 22:41:42','2014-11-26 22:41:42'),(6,2,'40145530703','814336',1,NULL,'0','2014-11-26 22:41:42','2014-11-26 22:41:42'),(7,3,'40144154633','645740',1,NULL,'0','2014-11-27 22:04:23','2014-11-27 22:04:23'),(8,3,'40148700627','044382',1,NULL,'1','2014-11-27 22:04:23','2014-11-30 19:09:20'),(9,3,'40145186156','485740',1,1,'2','2014-11-27 22:04:23','2014-11-27 22:22:44'),(10,2,'40148428750','563115',1,NULL,'1','2014-11-30 21:40:04','2014-11-30 21:42:00'),(11,2,'40140404640','227762',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(12,2,'40145653558','373670',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(13,2,'40141478680','664670',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(14,2,'40145248536','678231',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(15,2,'40148785313','075372',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(16,2,'40148611587','188235',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(17,2,'40145188000','277337',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(18,2,'40142631685','042474',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(19,2,'40142268287','171885',1,NULL,'0','2014-11-30 21:40:04','2014-11-30 21:40:04'),(20,3,'40147731856','231775',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(21,3,'40141173312','836201',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(22,3,'40147015376','756871',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(23,3,'40146810414','703010',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(24,3,'40146580055','401301',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(25,3,'40147810770','403801',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(26,3,'40142446858','312272',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(27,3,'40144078776','117186',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(28,3,'40143215760','657846',1,NULL,'0','2014-12-01 22:39:09','2014-12-01 22:39:09'),(29,3,'40147660465','615001',1,NULL,'1','2014-12-01 22:39:09','2014-12-06 19:23:08'),(30,3,'40151262155','340302',1,NULL,'0','2015-01-05 22:15:56','2015-01-05 22:15:56'),(31,3,'40154231522','188126',1,NULL,'0','2015-01-05 22:20:36','2015-01-05 22:20:36'),(32,3,'40157773465','463858',1,NULL,'0','2015-01-05 22:25:17','2015-01-05 22:25:17'),(33,3,'40152141486','627640',1,NULL,'0','2015-01-06 21:47:48','2015-01-06 21:47:48'),(34,3,'40158630400','658130',1,NULL,'0','2015-01-06 21:47:55','2015-01-06 21:47:55');

/*Table structure for table `cardactivity` */

DROP TABLE IF EXISTS `cardactivity`;

CREATE TABLE `cardactivity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `cardactivity` */

insert  into `cardactivity`(`ID`,`Name`,`Status`,`CreateTime`,`ModifyTime`) values (1,'aaaa',1,'2014-11-25 22:29:38','2014-11-25 22:53:11'),(2,'bbbbc',0,'2014-11-25 22:53:16','2014-11-25 22:54:51'),(3,'行贿',0,'2014-11-27 22:04:06','2014-12-02 22:25:55');

/*Table structure for table `cardrelation` */

DROP TABLE IF EXISTS `cardrelation`;

CREATE TABLE `cardrelation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CardNo` varchar(32) NOT NULL,
  `MenuSuitId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `cardrelation` */

insert  into `cardrelation`(`ID`,`CardNo`,`MenuSuitId`,`CreateTime`,`ModifyTime`) values (2,'40147660465',10011,'2014-12-06 18:55:06','2014-12-06 18:55:06'),(3,'40147660465',10014,'2014-12-06 23:10:46','2014-12-06 23:10:46'),(4,'40147660465',10013,'2014-12-06 23:10:46','2014-12-06 23:10:46'),(5,'40147660465',10012,'2014-12-06 23:13:09','2014-12-06 23:13:09'),(6,'40147660465',10015,'2014-12-06 23:14:22','2014-12-06 23:14:22'),(7,'40147660465',10021,'2014-12-06 23:39:57','2014-12-06 23:39:57'),(8,'40147660465',10019,'2014-12-06 23:39:57','2014-12-06 23:39:57');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `ExpireTime` datetime DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `cart` */

insert  into `cart`(`ID`,`UserId`,`Status`,`ExpireTime`,`CreateTime`,`ModifyTime`) values (27,15,0,NULL,'2015-01-01 19:58:37','2015-01-01 19:58:37');

/*Table structure for table `cartdetail` */

DROP TABLE IF EXISTS `cartdetail`;

CREATE TABLE `cartdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `CartId` int(11) NOT NULL,
  `MenuId` int(11) NOT NULL,
  `IsFamily` tinyint(4) NOT NULL,
  `Num` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10052 DEFAULT CHARSET=utf8;

/*Data for the table `cartdetail` */

insert  into `cartdetail`(`ID`,`UserId`,`CartId`,`MenuId`,`IsFamily`,`Num`,`CreateTime`,`ModifyTime`) values (10051,15,27,10009,0,5,'2015-01-01 19:58:37','2015-01-01 20:00:02');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `Contact` varchar(512) DEFAULT NULL,
  `Address` varchar(512) DEFAULT NULL,
  `Remark` varchar(1024) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  `ContactName` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `company` */

insert  into `company`(`ID`,`Name`,`Contact`,`Address`,`Remark`,`Status`,`CreateTime`,`ModifyTime`,`ContactName`) values (1,'小强面包厂','1373777777','杭州滨江江南大道aaa','员工8000人 大厂aaa',0,'2014-11-05 21:08:52','2014-11-05 22:00:38',NULL),(2,'恒生电子','','','',0,'2014-11-08 15:00:18','2014-11-08 15:00:18',NULL),(3,'华为','1111','','',0,'2014-11-08 15:01:14','2014-11-08 15:01:14',NULL);

/*Table structure for table `companydays` */

DROP TABLE IF EXISTS `companydays`;

CREATE TABLE `companydays` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` int(11) NOT NULL,
  `SubscribeStartDate` datetime NOT NULL,
  `SubscribeEndDate` datetime NOT NULL,
  `EndDay` date NOT NULL,
  `Year` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `companydays` */

insert  into `companydays`(`ID`,`CompanyId`,`SubscribeStartDate`,`SubscribeEndDate`,`EndDay`,`Year`,`CreateTime`,`ModifyTime`) values (1,1,'2014-11-18 00:00:00','2015-11-27 00:00:00','2014-12-30',2010,'2014-11-15 14:11:34','2014-11-15 14:11:34'),(2,1,'2014-11-12 00:00:00','2014-11-19 00:00:00','2014-11-24',2010,'2014-11-15 19:31:04','2014-11-15 19:31:04'),(3,1,'2014-10-26 00:00:00','2014-10-30 00:00:00','2014-11-10',2010,'2014-11-15 20:04:59','2014-11-15 20:04:59'),(4,2,'2014-11-05 00:00:00','2014-11-10 00:00:00','2014-12-03',2010,'2014-11-15 20:07:18','2014-11-15 20:07:18'),(5,2,'2014-11-02 00:00:00','2014-11-05 00:00:00','2013-10-27',2014,'2014-11-30 20:53:21','2014-11-30 21:00:48');

/*Table structure for table `companydaysdetail` */

DROP TABLE IF EXISTS `companydaysdetail`;

CREATE TABLE `companydaysdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyDaysId` int(11) NOT NULL,
  `Day` date NOT NULL,
  `MaxNum` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `companydaysdetail` */

insert  into `companydaysdetail`(`ID`,`CompanyDaysId`,`Day`,`MaxNum`,`CreateTime`,`ModifyTime`) values (1,3,'2014-11-04',300,'2014-11-15 20:05:11','2014-11-15 20:05:11'),(2,3,'2014-11-06',200,'2014-11-15 20:05:11','2014-11-15 20:05:11'),(3,3,'2014-11-08',100,'2014-11-15 20:05:11','2014-11-15 20:05:11'),(4,4,'2014-11-12',300,'2014-11-15 20:07:24','2014-11-15 20:07:24'),(5,4,'2014-11-17',200,'2014-11-15 20:07:24','2014-11-15 20:07:24'),(10,5,'2014-11-18',100,'2014-11-30 21:00:48','2014-11-30 21:00:48'),(11,5,'2014-11-12',23,'2014-11-30 21:00:48','2014-11-30 21:00:48');

/*Table structure for table `companyrelation` */

DROP TABLE IF EXISTS `companyrelation`;

CREATE TABLE `companyrelation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` int(11) NOT NULL,
  `MenuSuitId` int(11) NOT NULL,
  `IsFamily` tinyint(4) NOT NULL DEFAULT '1',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `companyrelation` */

insert  into `companyrelation`(`ID`,`CompanyId`,`MenuSuitId`,`IsFamily`,`CreateTime`,`ModifyTime`) values (2,3,10008,1,'2014-11-30 16:59:23','2014-11-30 16:59:23');

/*Table structure for table `companyuser` */

DROP TABLE IF EXISTS `companyuser`;

CREATE TABLE `companyuser` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` int(11) NOT NULL,
  `Mobile` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `IDNumber` varchar(32) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  `SuitGender` tinyint(4) DEFAULT NULL,
  `SuitMarried` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `companyuser` */

insert  into `companyuser`(`ID`,`CompanyId`,`Mobile`,`Password`,`IDNumber`,`CreateTime`,`ModifyTime`,`SuitGender`,`SuitMarried`) values (1,1,'13732207030','555555','33032819555555','2014-11-08 15:04:34','2014-11-08 15:04:37',NULL,NULL),(2,1,'13700000001','253000','330328198404253000','2014-11-08 19:24:02','2014-11-08 19:24:02',NULL,NULL),(3,1,'13700000002','253001','330328198404253001','2014-11-08 19:24:04','2014-11-08 19:24:04',NULL,NULL),(4,1,'13700000003','253002','330328198404253002','2014-11-08 19:24:07','2014-11-08 19:24:07',NULL,NULL),(5,1,'13700000004','253003','330328198404253003','2014-11-08 19:24:07','2014-11-08 19:24:07',NULL,NULL),(6,1,'13700000005','253004','330328198404253004','2014-11-08 19:24:07','2014-11-08 19:24:07',NULL,NULL),(7,1,'13700000006','253005','330328198404253005','2014-11-08 19:24:07','2014-11-08 19:24:07',NULL,NULL),(8,1,'13700000007','253006','330328198404253006','2014-11-08 19:24:07','2014-11-08 19:24:07',NULL,NULL),(9,1,'13700000008','253007','330328198404253007','2014-11-08 19:24:07','2014-11-08 19:24:07',NULL,NULL),(10,1,'13700000009','253008','330328198404253008','2014-11-08 19:24:08','2014-11-08 19:24:08',NULL,NULL),(11,1,'13700000010','253009','330328198404253009','2014-11-08 19:24:08','2014-11-08 19:24:08',NULL,NULL),(12,1,'13700000011','253010','330328198404253010','2014-11-08 19:24:08','2014-11-08 19:24:08',NULL,NULL),(13,1,'13700000012','253011','330328198404253011','2014-11-08 19:24:08','2014-11-08 19:24:08',NULL,NULL),(14,1,'13700000013','253012','330328198404253012','2014-11-08 19:24:08','2014-11-08 19:24:08',NULL,NULL),(15,1,'13700000014','253013','330328198404253013','2014-11-08 19:24:08','2014-11-08 19:24:08',NULL,NULL),(17,1,'13770000002','243001','330328198404243001','2014-11-08 19:31:57','2014-11-08 19:31:57',NULL,NULL),(18,1,'13770000003','243002','330328198404243002','2014-11-08 19:31:57','2014-11-08 19:31:57',NULL,NULL);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Gp` varchar(32) DEFAULT NULL,
  `Name` varchar(64) NOT NULL,
  `Val` varchar(128) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `config` */

insert  into `config`(`ID`,`Gp`,`Name`,`Val`,`CreateTime`,`ModifyTime`) values (2,NULL,'bonusRule','500-100','2014-12-25 22:33:19','2014-12-25 22:33:19');

/*Table structure for table `fav` */

DROP TABLE IF EXISTS `fav`;

CREATE TABLE `fav` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Type` tinyint(4) NOT NULL,
  `TargetId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fav` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `NameStrong` varchar(128) DEFAULT NULL,
  `MenuTypeId` int(11) NOT NULL,
  `SuitGender` tinyint(4) NOT NULL DEFAULT '0',
  `SuitMarried` tinyint(4) NOT NULL DEFAULT '0',
  `SuitObject` tinyint(4) NOT NULL DEFAULT '0',
  `CustomerNeedKnow` varchar(512) DEFAULT NULL,
  `Feature` varchar(1024) DEFAULT NULL,
  `Logo` varchar(128) DEFAULT NULL,
  `TotalNum` int(11) DEFAULT NULL,
  `PlatformPrice` int(11) DEFAULT NULL,
  `MarketPrice` int(11) NOT NULL,
  `FamilyPrice` int(11) DEFAULT NULL,
  `Rebate` int(11) NOT NULL DEFAULT '0',
  `Power` int(11) NOT NULL DEFAULT '0',
  `Promotion` int(11) NOT NULL DEFAULT '0',
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`ID`,`Name`,`NameStrong`,`MenuTypeId`,`SuitGender`,`SuitMarried`,`SuitObject`,`CustomerNeedKnow`,`Feature`,`Logo`,`TotalNum`,`PlatformPrice`,`MarketPrice`,`FamilyPrice`,`Rebate`,`Power`,`Promotion`,`Status`,`CreateTime`,`ModifyTime`) values (10004,'大力水手套餐2','不含B超2',1001,2,2,1,'国庆不参加2','23333323','upload/menu_upload/20141111/1415721007859_z.JPG',NULL,4,122126,1225,27,38,59,0,'2014-11-11 22:04:51','2014-12-06 23:03:22'),(10005,'12222','fewfwe',1,0,0,0,'23','2fwefwe','upload/menu_upload/20141121/1416573310843_阿芙尊荣眼霜.JPG',NULL,23,22,2323,0,0,0,0,'2014-11-21 20:35:45','2014-12-06 23:03:22'),(10006,'3232','23232',1001,0,0,0,'232','32232323','upload/menu_upload/20141127/1417093617046_阿芙尊荣眼霜.JPG',NULL,23,334333,5454,34,34,34,0,'2014-11-27 21:07:30','2014-12-06 23:03:22'),(10007,'ffwefwe','fwefwefw',1001,1,1,0,'fwfwe','fwefwefwfwfw','upload/menu_upload/20141203/1417621300234_阿芙尊荣眼霜.JPG',23,23,232,23,2,0,0,0,'2014-12-03 23:41:09','2014-12-06 23:03:22'),(10008,'套餐一','ffwfwfwe',1002,0,0,0,'','','upload/menu_upload/20141210/1418186097706_YunfengZhu_photo.JPG',200,800,1000,NULL,0,0,0,0,'2014-12-10 12:35:49','2014-12-10 12:35:49'),(10009,'一分钱套餐','强调',1002,0,0,0,'你必须知道','好有特点','upload/menu_upload/20141229/1419858301343_1.gif',12,12,13,11,1,12121,122,0,'2014-12-29 21:09:09','2014-12-31 16:01:14');

/*Table structure for table `menudetail` */

DROP TABLE IF EXISTS `menudetail`;

CREATE TABLE `menudetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuId` int(11) NOT NULL,
  `Detail` text NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8;

/*Data for the table `menudetail` */

insert  into `menudetail`(`ID`,`MenuId`,`Detail`,`CreateTime`,`ModifyTime`) values (10004,10004,'<p>&nbsp;wweewweew9</p>','2014-11-11 22:04:52','2014-11-11 23:50:04'),(10005,10005,'<p>&nbsp;233233232</p>','2014-11-21 20:35:45','2014-11-21 20:35:45'),(10006,10006,'<p>&nbsp;343434343</p>','2014-11-27 21:07:30','2014-11-27 21:09:17'),(10007,10007,'<p>23322323</p>','2014-12-03 23:41:09','2014-12-03 23:41:09'),(10008,10008,'<p>小二货</p>','2014-12-10 12:35:49','2014-12-10 12:35:49'),(10009,10009,'<p>&nbsp;1212121</p>','2014-12-29 21:09:09','2014-12-31 16:01:14');

/*Table structure for table `menusales` */

DROP TABLE IF EXISTS `menusales`;

CREATE TABLE `menusales` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuId` int(11) NOT NULL,
  `PurchaseNum` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

/*Data for the table `menusales` */

insert  into `menusales`(`ID`,`MenuId`,`PurchaseNum`,`CreateTime`,`ModifyTime`) values (10002,10004,0,'2014-11-11 22:04:52','2014-11-11 22:04:52'),(10003,10005,0,'2014-11-21 20:35:45','2014-11-21 20:35:45'),(10004,10006,0,'2014-11-27 21:07:30','2014-11-27 21:07:30'),(10005,10007,0,'2014-12-03 23:41:09','2014-12-03 23:41:09'),(10006,10008,0,'2014-12-10 12:35:49','2014-12-10 12:35:49'),(10007,10009,0,'2014-12-29 21:09:09','2014-12-29 21:09:09');

/*Table structure for table `menusuit` */

DROP TABLE IF EXISTS `menusuit`;

CREATE TABLE `menusuit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` tinyint(4) NOT NULL DEFAULT '0',
  `MenuId` int(11) NOT NULL,
  `OrgId` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10024 DEFAULT CHARSET=utf8;

/*Data for the table `menusuit` */

insert  into `menusuit`(`ID`,`Type`,`MenuId`,`OrgId`,`Status`,`CreateTime`,`ModifyTime`) values (10005,0,10004,10000,1,'2014-11-14 23:10:23','2014-11-15 21:47:19'),(10006,0,10004,10000,1,'2014-11-15 22:07:28','2014-11-15 22:16:41'),(10007,0,10004,10010,0,'2014-11-15 22:07:28','2014-11-15 22:07:28'),(10008,0,10004,10009,1,'2014-11-15 22:07:28','2014-11-15 22:08:13'),(10009,0,10004,10008,1,'2014-11-15 22:07:28','2014-11-15 22:08:12'),(10010,0,10004,10004,1,'2014-11-15 22:07:28','2014-11-15 22:08:00'),(10011,0,10004,10002,1,'2014-11-15 22:07:28','2014-11-15 22:08:00'),(10012,0,10004,10012,0,'2014-12-03 23:41:22','2014-12-03 23:41:22'),(10013,0,10006,10012,0,'2014-12-03 23:41:22','2014-12-03 23:41:22'),(10014,0,10007,10012,0,'2014-12-03 23:41:22','2014-12-03 23:41:22'),(10015,0,10005,10012,0,'2014-12-03 23:41:22','2014-12-03 23:41:22'),(10016,1,10004,10013,0,'2014-12-06 23:28:37','2014-12-06 23:28:37'),(10017,1,10006,10013,0,'2014-12-06 23:28:37','2014-12-06 23:28:37'),(10018,1,10007,10013,0,'2014-12-06 23:30:23','2014-12-06 23:30:23'),(10019,2,10005,10013,0,'2014-12-06 23:30:23','2014-12-06 23:30:23'),(10020,1,10004,10008,0,'2014-12-06 23:36:23','2014-12-06 23:36:23'),(10021,2,10004,10004,0,'2014-12-06 23:36:23','2014-12-06 23:36:23'),(10022,0,10008,10004,0,'2014-12-21 23:06:21','2014-12-21 23:06:21'),(10023,0,10009,10012,0,'2014-12-29 21:09:23','2014-12-29 21:09:23');

/*Table structure for table `menutype` */

DROP TABLE IF EXISTS `menutype`;

CREATE TABLE `menutype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

/*Data for the table `menutype` */

insert  into `menutype`(`ID`,`Name`,`Status`,`CreateTime`,`ModifyTime`) values (1,'老年人套餐;',0,'2014-11-05 22:33:53','2014-11-05 22:36:51'),(1000,'kkklk',1,'2014-11-05 22:36:07','2014-11-05 22:36:22'),(1001,'fewwfwfwfw',0,'2014-11-05 22:39:17','2014-11-05 22:39:17'),(1002,'企业家属套餐',0,'2014-11-30 20:00:00','2014-11-30 20:00:51');

/*Table structure for table `mobileadvertise` */

DROP TABLE IF EXISTS `mobileadvertise`;

CREATE TABLE `mobileadvertise` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(128) DEFAULT NULL COMMENT '标题',
  `Img` varchar(128) NOT NULL,
  `Type` tinyint(4) NOT NULL COMMENT '广告类型\n0：外部链接\n1：机构\n2：套餐\n\n',
  `RelationValue` varchar(128) NOT NULL COMMENT '链接url/机构id/套餐id',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0：未发布 \n1：已发布\n',
  `Power` int(11) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动端首页广告表';

/*Data for the table `mobileadvertise` */

/*Table structure for table `mobileareahot` */

DROP TABLE IF EXISTS `mobileareahot`;

CREATE TABLE `mobileareahot` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(128) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Power` int(11) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动端热门城市';

/*Data for the table `mobileareahot` */

/*Table structure for table `mobileconfig` */

DROP TABLE IF EXISTS `mobileconfig`;

CREATE TABLE `mobileconfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Val` varchar(1024) DEFAULT NULL,
  `Description` varchar(128) DEFAULT NULL,
  `IsShow` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobileconfig` */

/*Table structure for table `mobilehealthadvice` */

DROP TABLE IF EXISTS `mobilehealthadvice`;

CREATE TABLE `mobilehealthadvice` (
  `ID` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `ValueRangeMin` double DEFAULT NULL,
  `IsMinExists` tinyint(4) DEFAULT NULL,
  `ValueRangeMax` double DEFAULT NULL,
  `IsMaxExists` tinyint(4) DEFAULT NULL,
  `IsNormal` tinyint(4) NOT NULL,
  `Clinic` varchar(512) DEFAULT NULL,
  `Advice` varchar(512) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobilehealthadvice` */

insert  into `mobilehealthadvice`(`ID`,`ItemId`,`ValueRangeMin`,`IsMinExists`,`ValueRangeMax`,`IsMaxExists`,`IsNormal`,`Clinic`,`Advice`,`CreateTime`,`ModifyTime`) values (1,1,0,0,2.5,1,1,NULL,NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(2,2,0,0,200,1,1,NULL,NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(3,3,NULL,0,90,0,0,'较低',NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(4,3,90,1,139,0,0,'正常','','2015-04-09 10:31:50','2015-04-21 13:29:11'),(5,3,140,1,NULL,0,0,'较高','好好休息','2015-04-09 10:31:50','2015-04-21 13:29:21'),(6,4,NULL,0,60,0,0,'较低',NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(7,4,60,1,85,0,1,'正常','','2015-04-09 10:31:50','2015-04-20 16:48:10'),(8,4,85,1,NULL,0,0,'较高',NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(9,5,NULL,0,60,1,0,'心动过缓',NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(10,5,60,0,100,0,1,'正常',NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(11,5,100,1,NULL,0,0,'心动过速',NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(12,6,36,1,37.3,0,1,'正常',NULL,'2015-04-09 10:31:50','2015-04-09 10:31:50'),(13,6,37.3,1,NULL,0,0,'发热',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(14,7,1,1,2,1,1,'正常','','2015-04-09 10:31:51','2015-04-20 16:47:44'),(15,7,3,1,NULL,0,0,'偏多',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(16,8,NULL,0,1000,0,0,'偏少',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(17,8,1000,1,2000,1,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(18,8,2000,0,NULL,0,0,'偏多',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(19,9,NULL,0,3.6,0,0,'较低',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(20,9,3.6,1,6.1,1,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(21,9,6.1,0,NULL,0,0,'较高',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(22,10,NULL,0,3000,0,0,'偏少',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(23,10,3000,1,NULL,0,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(24,11,NULL,0,1000,1,0,'偏少',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(25,11,1000,1,1200,1,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(26,11,1200,0,NULL,0,0,'偏多',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(27,12,NULL,0,300,0,0,'偏少',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(28,12,300,1,NULL,0,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(29,13,NULL,0,200,0,1,'偏少',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(30,13,200,1,NULL,0,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(31,14,NULL,0,100,0,0,'偏少',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(32,14,100,1,100,1,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(33,14,100,0,NULL,0,0,'偏多',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(34,15,NULL,0,50,0,0,'偏少',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(35,15,50,1,50,1,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(36,15,50,0,NULL,0,0,'偏多',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(37,16,NULL,0,18.5,0,0,'偏瘦',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(38,16,18.5,1,24,0,1,'正常',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(39,16,24,1,27,0,0,'偏重',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(40,16,27,1,30,0,0,'轻度肥胖',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(41,16,30,1,40,0,0,'中度肥胖',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(42,16,40,1,NULL,0,0,'重度肥胖',NULL,'2015-04-09 10:31:51','2015-04-09 10:31:51'),(50,7,0,1,1,NULL,0,'偏少',NULL,'2015-04-20 16:56:00','2015-04-20 16:56:00');

/*Table structure for table `mobilehealthbooklet` */

DROP TABLE IF EXISTS `mobilehealthbooklet`;

CREATE TABLE `mobilehealthbooklet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `Value` double NOT NULL,
  `IsNormal` tinyint(4) NOT NULL,
  `AdviceId` int(11) DEFAULT NULL,
  `DataDate` date NOT NULL,
  `DataTime` datetime NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `datatimeUnique` (`DataDate`,`UserId`,`ItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobilehealthbooklet` */

/*Table structure for table `mobilehealthuser` */

DROP TABLE IF EXISTS `mobilehealthuser`;

CREATE TABLE `mobilehealthuser` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `HeadImg` varchar(128) DEFAULT NULL,
  `Gender` char(1) NOT NULL,
  `BornDate` date NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobilehealthuser` */

/*Table structure for table `mobilehealthuseritem` */

DROP TABLE IF EXISTS `mobilehealthuseritem`;

CREATE TABLE `mobilehealthuseritem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `IsShow` tinyint(4) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `userIdItemIdUnique` (`UserId`,`ItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobilehealthuseritem` */

/*Table structure for table `mobilehomemenutype` */

DROP TABLE IF EXISTS `mobilehomemenutype`;

CREATE TABLE `mobilehomemenutype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(128) NOT NULL,
  `Img` varchar(128) NOT NULL,
  `MenuTypeId` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL COMMENT '0：未发布\n1：已发布\n',
  `Power` int(11) DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='移动端首页套餐分类表';

/*Data for the table `mobilehomemenutype` */

/*Table structure for table `mobilemenuhot` */

DROP TABLE IF EXISTS `mobilemenuhot`;

CREATE TABLE `mobilemenuhot` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Img` varchar(128) NOT NULL,
  `MenuId` int(11) NOT NULL,
  `CityCode` varchar(32) NOT NULL,
  `Power` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页热门套餐表';

/*Data for the table `mobilemenuhot` */

/*Table structure for table `mobilemenurecommend` */

DROP TABLE IF EXISTS `mobilemenurecommend`;

CREATE TABLE `mobilemenurecommend` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MenuId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MenuId` (`MenuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='套餐推荐表';

/*Data for the table `mobilemenurecommend` */

/*Table structure for table `mobileorganizationhot` */

DROP TABLE IF EXISTS `mobileorganizationhot`;

CREATE TABLE `mobileorganizationhot` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Img` varchar(128) NOT NULL,
  `OrgId` varchar(128) NOT NULL,
  `Power` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页热门机构表';

/*Data for the table `mobileorganizationhot` */

/*Table structure for table `mobileorganizationrecommend` */

DROP TABLE IF EXISTS `mobileorganizationrecommend`;

CREATE TABLE `mobileorganizationrecommend` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrgId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `OrgId` (`OrgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构推荐表';

/*Data for the table `mobileorganizationrecommend` */

/*Table structure for table `mobilepedometerdaily` */

DROP TABLE IF EXISTS `mobilepedometerdaily`;

CREATE TABLE `mobilepedometerdaily` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Steps` int(11) NOT NULL,
  `Kms` double NOT NULL,
  `Calorie` int(11) NOT NULL,
  `Day` date NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `mobilepedometerdaily` */

insert  into `mobilepedometerdaily`(`ID`,`UserId`,`Steps`,`Kms`,`Calorie`,`Day`,`CreateTime`,`ModifyTime`) values (1,1,500550,5.55,155000,'2013-03-04','2013-03-04 10:00:00','2013-03-04 10:00:00'),(2,1,407350,3.3,133300,'2015-05-25','2015-05-25 10:00:00','2015-05-25 10:00:00'),(3,1,457350,4.6,143300,'2015-05-25','2015-05-26 10:00:00','2015-05-25 10:00:00'),(4,1,288888,2.7,143300,'2015-05-25','2015-05-27 10:00:00','2015-05-25 10:00:00'),(5,1,500000,5.2,143300,'2015-05-25','2015-05-28 10:00:00','2015-05-25 10:00:00'),(6,1,560000,6.1,143300,'2015-05-25','2015-05-29 10:00:00','2015-05-25 10:00:00');

/*Table structure for table `mobilepedometerweekly` */

DROP TABLE IF EXISTS `mobilepedometerweekly`;

CREATE TABLE `mobilepedometerweekly` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `StepNum` int(11) NOT NULL,
  `KmNum` double NOT NULL,
  `Calorie` int(11) NOT NULL,
  `MondayOfWeek` date NOT NULL,
  `PrizeOrderId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `mobilepedometerweekly` */

insert  into `mobilepedometerweekly`(`ID`,`UserId`,`StepNum`,`KmNum`,`Calorie`,`MondayOfWeek`,`PrizeOrderId`,`CreateTime`,`ModifyTime`) values (1,1,399000,222,333333,'2015-05-25',1,'2015-05-25 10:10:10','0000-00-00 00:00:00'),(2,1,399789,240.7,336666,'2015-05-25',1,'2015-05-26 10:10:10','0000-00-00 00:00:00'),(3,1,400504,266.7,336666,'2015-05-25',1,'2015-05-27 10:10:10','0000-00-00 00:00:00'),(4,1,403444,240.8,336666,'2015-05-25',1,'2015-05-28 10:10:10','0000-00-00 00:00:00'),(5,1,412222,240.3,336666,'2015-05-25',1,'2015-05-29 10:10:10','0000-00-00 00:00:00'),(7,2,399789,218,333333,'2015-05-26',2,'2015-05-26 10:10:10','2015-05-26 10:10:10'),(8,3,399789,198,333333,'2015-05-26',4,'2015-05-26 10:10:10','2015-05-26 10:10:10'),(9,4,399789,200,333333,'2015-05-26',3,'2015-05-26 10:10:10','2015-05-26 10:10:10'),(11,5,399789,150,333333,'2015-05-26',5,'2015-05-22 10:10:10','2015-05-26 10:10:10'),(12,6,399789,140,333333,'2015-05-26',6,'2015-05-26 10:10:10','2015-05-26 10:10:10'),(23,1,399000,222,333333,'2015-05-24',1,'2015-05-24 10:10:10','0000-00-00 00:00:00'),(24,1,399000,222,333333,'2015-05-23',1,'2015-05-23 10:10:10','0000-00-00 00:00:00'),(25,1,399000,222,333333,'2015-05-25',1,'2015-05-22 10:10:10','0000-00-00 00:00:00'),(26,1,399000,222,333333,'2015-05-25',1,'2015-05-21 10:10:10','0000-00-00 00:00:00'),(27,1,399000,222,333333,'2015-05-25',1,'2015-05-20 10:10:10','0000-00-00 00:00:00'),(28,2,399000,222,333333,'2015-05-25',1,'2015-05-22 10:10:10','0000-00-00 00:00:00'),(29,2,399000,222,333333,'2015-05-25',1,'2015-05-22 10:10:10','0000-00-00 00:00:00'),(30,2,399000,222,333333,'2015-05-25',1,'2015-05-22 10:10:10','0000-00-00 00:00:00');

/*Table structure for table `mobileprize` */

DROP TABLE IF EXISTS `mobileprize`;

CREATE TABLE `mobileprize` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Price` int(11) NOT NULL,
  `Rules` varchar(1024) NOT NULL,
  `Detail` varchar(1024) NOT NULL,
  `PicShow` varchar(128) NOT NULL,
  `PicThumb` varchar(128) NOT NULL,
  `Type` tinyint(4) DEFAULT NULL,
  `MondayDate` datetime NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobileprize` */

insert  into `mobileprize`(`ID`,`Name`,`Price`,`Rules`,`Detail`,`PicShow`,`PicThumb`,`Type`,`MondayDate`,`CreateTime`,`ModifyTime`) values (1,'智能血压计   自己在家都能测血压',299,'<p>1.活动时间：2015年5月30号至2015年6月5号 <br>2.开奖时间：每周一早上09:00 <br>3.活动规则：每周走路总步数 <br>4.注意事项：注意事项注意事项注意事项注意事注意<br></p>','详情详情详情详情详情详情详情详情详情详情详情详情详情','upload/tijianba_image_upload/20141109/1415464580406_111.jpg','upload/tijianba_image_upload/20141109/1415464580406_112.jpg',1,'2015-05-25 00:00:00','2015-05-30 00:00:00','0000-00-00 00:00:00'),(2,'儿童便携式体温计 环保 准确 快速',199,'<p>1.活动时间：2015年5月30号至2015年6月5号 <br>2.开奖时间：每周一早上09:00 <br>3.活动规则：每周走路总步数 <br>4.注意事项：注意事项注意事项注意事项注意事注意<br></p>','详情详情详情详情详情详情详情详情详情详情详情详情详情','upload/tijianba_image_upload/20141109/1415464580406_111.jpg','upload/tijianba_image_upload/20141109/1415464580406_112.jpg',1,'2015-05-25 00:00:00','2015-05-30 00:00:00','0000-00-00 00:00:00'),(3,'均可获得1000个柠檬币',99,'<p>1.活动时间：2015年5月30号至2015年6月5号 <br>2.开奖时间：每周一早上09:00 <br>3.活动规则：每周走路总步数 <br>4.注意事项：注意事项注意事项注意事项注意事注意<br></p>','详情详情详情详情详情详情详情详情详情详情详情详情详情','upload/tijianba_image_upload/20141109/1415464580406_111.jpg','upload/tijianba_image_upload/20141109/1415464580406_112.jpg',1,'2015-05-25 00:00:00','2015-05-30 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `mobileprizeorders` */

DROP TABLE IF EXISTS `mobileprizeorders`;

CREATE TABLE `mobileprizeorders` (
  `ID` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Name` varchar(16) NOT NULL,
  `Mobile` varchar(32) NOT NULL,
  `Address` varchar(256) DEFAULT NULL,
  `ZipCode` varchar(16) NOT NULL,
  `Remark` varchar(256) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobileprizeorders` */

insert  into `mobileprizeorders`(`ID`,`UserId`,`Name`,`Mobile`,`Address`,`ZipCode`,`Remark`,`Status`,`CreateTime`,`ModifyTime`) values (1,1,'张三','13770000005','杭州西湖','325800','ddddd',1,'2015-05-29 10:00:00','2015-05-29 10:00:00');

/*Table structure for table `mobileprizepicdetail` */

DROP TABLE IF EXISTS `mobileprizepicdetail`;

CREATE TABLE `mobileprizepicdetail` (
  `ID` int(11) NOT NULL,
  `PrizeId` int(11) NOT NULL,
  `url` varchar(128) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobileprizepicdetail` */

/*Table structure for table `mobileweekliyprize` */

DROP TABLE IF EXISTS `mobileweekliyprize`;

CREATE TABLE `mobileweekliyprize` (
  `ID` int(11) NOT NULL,
  `PrizeId` varchar(64) NOT NULL,
  `Grade` int(11) NOT NULL,
  `Type` tinyint(4) DEFAULT NULL,
  `ModayDate` datetime NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mobileweekliyprize` */

insert  into `mobileweekliyprize`(`ID`,`PrizeId`,`Grade`,`Type`,`ModayDate`,`CreateTime`,`ModifyTime`) values (1,'1',1,0,'2015-05-25 00:00:00','2015-05-29 00:00:00','0000-00-00 00:00:00'),(2,'2',2,0,'2015-05-25 00:00:00','2015-05-29 00:00:00','0000-00-00 00:00:00'),(3,'3',3,0,'2015-05-25 00:00:00','2015-05-29 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `Subject` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`ID`,`CreateTime`,`ModifyTime`,`Status`,`Subject`) values (1,'2014-11-15 23:55:36','2014-11-17 23:57:13',0,'wwewewdd');

/*Table structure for table `newsdetail` */

DROP TABLE IF EXISTS `newsdetail`;

CREATE TABLE `newsdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `NewsId` int(11) NOT NULL,
  `Content` text,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

/*Data for the table `newsdetail` */

insert  into `newsdetail`(`ID`,`NewsId`,`Content`,`CreateTime`,`ModifyTime`) values (1,1,'<p>&nbsp;ewewewewew</p>','2014-11-15 23:55:36','2014-11-15 23:55:36'),(10000,10000,'<p>&nbsp;232323223</p>','2014-11-17 23:01:10','2014-11-17 23:01:10');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(32) NOT NULL,
  `MenuId` int(11) NOT NULL,
  `IsFamily` tinyint(4) NOT NULL DEFAULT '1',
  `Price` int(11) NOT NULL,
  `MarketPrice` int(11) NOT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`ID`,`OrderNo`,`MenuId`,`IsFamily`,`Price`,`MarketPrice`,`Status`,`CreateTime`,`ModifyTime`) values (5,'10146581140',10004,1,4,122126,0,'2014-12-25 23:53:13','2014-12-25 23:53:13'),(6,'10146581140',10004,1,4,122126,0,'2014-12-25 23:53:13','2014-12-25 23:53:13'),(7,'10146581140',10006,1,23,334333,0,'2014-12-25 23:53:13','2014-12-25 23:53:13'),(8,'10146581140',10006,1,23,334333,0,'2014-12-25 23:53:13','2014-12-25 23:53:13'),(9,'10145874500',10004,1,4,122126,0,'2014-12-28 22:34:54','2014-12-28 22:34:54'),(10,'10147146171',10004,1,4,122126,0,'2014-12-28 22:46:25','2014-12-28 22:46:25'),(11,'10147146171',10004,1,4,122126,0,'2014-12-28 22:46:25','2014-12-28 22:46:25'),(12,'10147146171',10004,1,4,122126,0,'2014-12-28 22:46:25','2014-12-28 22:46:25'),(13,'10147146171',10004,1,4,122126,0,'2014-12-28 22:46:25','2014-12-28 22:46:25'),(14,'10147146171',10004,1,4,122126,0,'2014-12-28 22:46:25','2014-12-28 22:46:25'),(15,'10147146171',10004,1,4,122126,0,'2014-12-28 22:46:25','2014-12-28 22:46:25'),(16,'10147146171',10004,1,4,122126,0,'2014-12-28 22:46:25','2014-12-28 22:46:25'),(17,'10147146171',10004,1,4,122126,0,'2014-12-28 22:46:25','2014-12-28 22:46:25'),(18,'10143416127',10007,1,23,232,0,'2014-12-28 22:48:31','2014-12-28 22:48:31'),(19,'10146388250',10006,1,23,334333,0,'2014-12-28 22:50:03','2014-12-28 22:50:03'),(20,'10147357484',10007,1,23,232,0,'2014-12-28 23:29:03','2014-12-28 23:29:03'),(21,'10147357484',10007,1,23,232,0,'2014-12-28 23:29:03','2014-12-28 23:29:03'),(22,'10147357484',10007,1,23,232,0,'2014-12-28 23:29:03','2014-12-28 23:29:03'),(23,'10144688005',10006,1,23,334333,0,'2014-12-28 23:30:36','2014-12-28 23:30:36'),(24,'10146338366',10007,1,23,232,0,'2014-12-28 23:50:55','2014-12-28 23:50:55'),(25,'10140305685',10007,1,23,232,0,'2014-12-28 23:52:49','2014-12-28 23:52:49'),(26,'10144526705',10007,1,23,232,0,'2014-12-28 23:54:43','2014-12-28 23:54:43'),(27,'10143381831',10007,1,23,232,0,'2014-12-28 23:55:42','2014-12-28 23:55:42'),(28,'10141122171',10007,1,23,232,0,'2014-12-28 23:57:46','2014-12-28 23:57:46'),(29,'10140028033',10004,1,4,122126,0,'2014-12-29 22:20:19','2014-12-29 22:20:19'),(30,'10142362101',10009,1,12,13,0,'2014-12-29 22:24:38','2014-12-29 22:24:38'),(31,'10142772261',10009,1,12,13,0,'2014-12-29 22:28:17','2014-12-29 22:28:17'),(32,'10142608653',10009,1,12,13,0,'2014-12-29 22:29:52','2014-12-29 22:29:52'),(33,'10148550033',10009,1,12,13,0,'2014-12-29 22:33:20','2014-12-29 22:33:20'),(34,'10148838332',10009,1,12,13,0,'2014-12-30 00:10:23','2014-12-30 00:10:23'),(35,'10143511811',10009,1,12,13,0,'2014-12-30 21:20:32','2014-12-30 21:20:32'),(36,'10147027245',10009,1,12,13,0,'2014-12-30 21:26:50','2014-12-30 21:26:50'),(37,'10148481684',10009,1,12,13,0,'2014-12-30 21:29:32','2014-12-30 21:29:32'),(38,'10148618732',10009,1,12,13,0,'2014-12-30 21:33:33','2014-12-30 21:33:33'),(39,'10146820226',10009,1,12,13,0,'2014-12-30 21:44:33','2014-12-30 21:44:33');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(32) DEFAULT NULL,
  `TradeNo` varchar(32) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `PayTime` datetime DEFAULT NULL,
  `PayChannel` tinyint(4) NOT NULL DEFAULT '0',
  `PayType` char(1) DEFAULT '0',
  `TotalPrice` int(11) NOT NULL DEFAULT '0',
  `BonusMoney` int(11) NOT NULL DEFAULT '0',
  `PayMoney` int(11) NOT NULL,
  `OrderUserName` varchar(32) NOT NULL,
  `OrderUserMobile` varchar(32) NOT NULL,
  `OrderUserEmail` varchar(32) DEFAULT NULL,
  `OrderUserMailAddress` varchar(512) DEFAULT NULL,
  `OrderUserRemark` varchar(512) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `OrderNo` (`OrderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`ID`,`OrderNo`,`TradeNo`,`UserId`,`PayTime`,`PayChannel`,`PayType`,`TotalPrice`,`BonusMoney`,`PayMoney`,`OrderUserName`,`OrderUserMobile`,`OrderUserEmail`,`OrderUserMailAddress`,`OrderUserRemark`,`Status`,`CreateTime`,`ModifyTime`) values (5,'10146581140',NULL,15,NULL,0,'0',54,0,-68,'a','13989486252',NULL,NULL,'b','0','2014-12-25 23:53:13','2014-12-25 23:53:13'),(6,'10145874500',NULL,15,NULL,0,'0',4,0,-23,'fwefwe','13989486252',NULL,NULL,'fwefwe','0','2014-12-28 22:34:54','2014-12-28 22:34:54'),(7,'10147146171',NULL,15,NULL,0,'0',32,0,-184,'fwf','13989486252',NULL,NULL,'wefwefew','0','2014-12-28 22:46:25','2014-12-28 22:46:25'),(8,'10143416127',NULL,15,NULL,0,'0',23,0,21,'fwf','13989486252',NULL,NULL,'wefwefwe','0','2014-12-28 22:48:31','2014-12-28 22:48:31'),(9,'10146388250',NULL,15,NULL,0,'0',23,0,-11,'few','13989486252',NULL,NULL,'fewfwe','0','2014-12-28 22:50:03','2014-12-28 22:50:03'),(10,'10147357484',NULL,15,NULL,0,'0',69,0,63,'fwef','13989486252',NULL,NULL,'wefwefw','0','2014-12-28 23:29:03','2014-12-28 23:29:03'),(11,'10144688005',NULL,15,NULL,0,'0',23,0,-11,'ffwefwe','13989486252',NULL,NULL,'fwefwefw','0','2014-12-28 23:30:36','2014-12-28 23:30:36'),(12,'10146338366',NULL,15,NULL,0,'0',23,0,21,'ere','13989486252',NULL,NULL,'rt43t43t34','0','2014-12-28 23:50:55','2014-12-28 23:50:55'),(13,'10140305685',NULL,15,NULL,0,'0',23,0,21,'gerg','13989486252',NULL,NULL,'ergergerger','0','2014-12-28 23:52:49','2014-12-28 23:52:49'),(14,'10144526705',NULL,15,NULL,0,'0',23,0,21,'ere','13989486252',NULL,NULL,'erreerrt','0','2014-12-28 23:54:43','2014-12-28 23:54:43'),(15,'10143381831',NULL,15,NULL,0,'0',23,0,21,'g','13989486252',NULL,NULL,'ergerger','0','2014-12-28 23:55:42','2014-12-28 23:55:42'),(16,'10141122171',NULL,15,NULL,0,'0',23,0,21,'ger','13989486252',NULL,NULL,'gergerge','0','2014-12-28 23:57:46','2014-12-28 23:57:46'),(17,'10140028033',NULL,15,NULL,0,'0',4,0,-23,'fwe','13989486252',NULL,NULL,'fwefwefwe','0','2014-12-29 22:20:19','2014-12-29 22:20:19'),(18,'10142362101',NULL,15,NULL,0,'0',12,0,11,'qf','13989486252',NULL,NULL,'wefwefwefw','0','2014-12-29 22:24:38','2014-12-29 22:24:38'),(19,'10142772261',NULL,15,NULL,0,'0',12,0,11,'gg','13989486252',NULL,NULL,'grhrthrthrt','0','2014-12-29 22:28:17','2014-12-29 22:28:17'),(20,'10142608653',NULL,15,NULL,0,'0',12,0,11,'3','13989486252',NULL,NULL,'32232323','0','2014-12-29 22:29:52','2014-12-29 22:29:52'),(21,'10148550033',NULL,15,NULL,0,'0',12,0,11,'555','13989486252',NULL,NULL,'546456546','0','2014-12-29 22:33:20','2014-12-29 22:33:20'),(22,'10148838332',NULL,15,NULL,0,'0',12,0,11,'fwefwefwe','13989486252',NULL,NULL,'fwfwefwefwe','0','2014-12-30 00:10:23','2014-12-30 00:10:23'),(23,'10143511811',NULL,15,NULL,0,'0',12,0,11,'er','13989486252',NULL,NULL,'gregergre','0','2014-12-30 21:20:32','2014-12-30 21:20:32'),(24,'10147027245',NULL,15,NULL,0,'0',12,0,11,'gre','13989486252',NULL,NULL,'gergre','0','2014-12-30 21:26:50','2014-12-30 21:26:50'),(25,'10148481684',NULL,15,NULL,0,'0',12,0,11,'ger','13989486252',NULL,NULL,'gergerger','0','2014-12-30 21:29:32','2014-12-30 21:29:32'),(26,'10148618732','10148618733',15,'2014-12-31 00:31:32',0,'0',12,0,11,'2323','13989486252',NULL,NULL,'232322','1','2014-12-30 21:33:33','2014-12-31 00:31:32'),(27,'10146820226','10146820227',15,NULL,0,'0',12,0,11,'333','13989486252',NULL,NULL,'323332','1','2014-12-30 21:44:33','2014-12-31 00:07:12');

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(512) NOT NULL,
  `BrandId` int(11) NOT NULL,
  `OrgType` tinyint(4) NOT NULL,
  `ProvinceCode` char(10) NOT NULL,
  `CityCode` char(10) NOT NULL,
  `RegionCode` char(10) NOT NULL,
  `Address` varchar(256) NOT NULL,
  `Pic` varchar(128) NOT NULL,
  `WorkTime` varchar(512) NOT NULL,
  `AdvanceDays` int(11) NOT NULL,
  `MaxNumPerDay` int(11) NOT NULL,
  `HowToGo` varchar(1024) DEFAULT NULL,
  `CanUploadReport` tinyint(4) NOT NULL DEFAULT '1',
  `Power` int(11) NOT NULL DEFAULT '0',
  `Promotion` int(11) NOT NULL DEFAULT '0',
  `Status` char(1) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8;

/*Data for the table `organization` */

insert  into `organization`(`ID`,`Name`,`BrandId`,`OrgType`,`ProvinceCode`,`CityCode`,`RegionCode`,`Address`,`Pic`,`WorkTime`,`AdvanceDays`,`MaxNumPerDay`,`HowToGo`,`CanUploadReport`,`Power`,`Promotion`,`Status`,`CreateTime`,`ModifyTime`) values (10000,'svsdvsdvsd',1000,0,'3300000000','3305710000','3305710001','物美大超市','upload/org_upload/20141105/1415200282468_Blue hills.jpg','vsvs',2,1,'zhe yang go',0,2,4,'0','2014-11-05 23:11:04','2014-12-08 22:41:42'),(10002,'efwfefw',2,2,'3300000000','3305710000','3305710001','临江花园','upload/org_upload/20141106/1415285638421_Winter.jpg','fwefwefwe',2,4,'5dsdss',1,0,0,'0','2014-11-06 22:54:21','2014-12-08 22:16:31'),(10003,'ewww',2,1,'3300000000','3305710000','3305710001','233','upload/org_upload/20141106/1415286311906_Sunset.jpg','23',4,6,'78888',0,4,2,'1','2014-11-06 23:05:30','2014-11-10 23:42:08'),(10004,'444343',1000,0,'3300000000','3305770000','3305770001','滨江街道','upload/org_upload/20141107/1415366341500_1.gif','34534534534',6,7,'4444',1,12,12,'0','2014-11-07 21:19:09','2014-12-21 21:57:44'),(10008,'232222222',3,0,'3300000000','3305710000','3305710001','南环路','upload/org_upload/20141109/1415464949843_1.png','223',2,3,'444',1,0,0,'0','2014-11-09 00:43:03','2014-12-08 22:16:03'),(10009,'bbbbb',3,0,'3300000000','3305710000','3305710001','wewerwerw','upload/org_upload/20141109/1415465091125_1.png','2',9,0,'345',1,0,0,'1','2014-11-09 00:45:22','2014-11-30 19:57:31'),(10010,'小强体检机构',3,0,'3300000000','3305710000','3305710001','江南大道','upload/org_upload/20141109/1415511803205_2-12.gif','周末',3,5,'151',1,0,0,'0','2014-11-09 13:43:37','2014-11-09 13:43:37'),(10011,'cccccc',3,2,'3300000000','3305710000','3305710001','cwweqwe1e12e12','upload/org_upload/20141109/1415546445250_2.jpg','ccsqew',2,4,'554454445545',1,34,43,'1','2014-11-09 23:21:03','2014-11-10 23:42:08'),(10012,'美年大健康杭州滨江分院',1001,0,'3300000000','3305710000','3305710001','浙江杭州市滨江区江南大道102号2层','upload/org_upload/20141208/1418049863921_zx.jpg','每天8：00-17：00',5,100,'',0,2,3,'0','2014-11-30 19:51:54','2014-12-08 22:43:51'),(10013,'23ffewfw',1001,0,'3300000000','3305710000','3305710001','约克酒店','upload/org_upload/20141206/1417877121046_1.gif','fewfew',23,23,'23',0,0,0,'0','2014-12-06 22:44:32','2014-12-08 22:43:39');

/*Table structure for table `orgdetail` */

DROP TABLE IF EXISTS `orgdetail`;

CREATE TABLE `orgdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrgId` int(11) NOT NULL,
  `Introduce` text NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `orgdetail` */

insert  into `orgdetail`(`ID`,`OrgId`,`Introduce`,`CreateTime`,`ModifyTime`) values (2,10002,'<p>&nbsp;fwefwefwefwe</p>','2014-11-06 22:54:30','2014-12-08 22:16:31'),(3,10003,'<p>rggregerge</p>','2014-11-06 23:05:30','2014-11-06 23:05:30'),(4,10004,'<p>&nbsp;45t45t45</p>','2014-11-07 21:19:09','2014-12-21 21:57:44'),(8,10008,'<p>&nbsp;444434334</p>','2014-11-09 00:43:05','2014-12-08 22:16:03'),(9,10009,'<p>&nbsp;5y45y54</p>','2014-11-09 00:45:24','2014-11-09 00:45:24'),(10,10010,'<p>很实惠</p>','2014-11-09 13:43:57','2014-11-09 13:43:57'),(11,10011,'<p>&nbsp;45545454男</p>','2014-11-09 23:21:09','2014-11-10 00:15:30'),(12,10012,'<p>本体检机构很好</p>','2014-11-30 19:51:54','2014-12-08 22:43:51'),(13,10013,'<p>2322223</p>','2014-12-06 22:44:32','2014-12-08 22:43:39');

/*Table structure for table `orgenv` */

DROP TABLE IF EXISTS `orgenv`;

CREATE TABLE `orgenv` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrgId` int(11) NOT NULL,
  `Pic` varchar(128) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8;

/*Data for the table `orgenv` */

insert  into `orgenv`(`ID`,`OrgId`,`Pic`,`CreateTime`,`ModifyTime`) values (4,10007,'upload/tijianba_image_upload/20141109/1415464580406_1.jpg','2014-11-09 00:37:44','2014-11-09 00:37:44'),(10001,10009,'upload/tijianba_image_upload/20141109/1415465079843_1.gif','2014-11-09 00:45:40','2014-11-09 00:45:40'),(10002,10010,'upload/tijianba_image_upload/20141109/1415511776342_2-14.gif','2014-11-09 13:44:15','2014-11-09 13:44:15'),(10003,10010,'upload/tijianba_image_upload/20141109/1415511776342_2-14.gif','2014-11-09 14:24:12','2014-11-09 14:24:12'),(10007,10008,'upload/tijianba_image_upload/20141109/1415464940375_1.gif','2014-12-08 22:16:03','2014-12-08 22:16:03'),(10011,10013,'upload/tijianba_image_upload/20141206/1417877108093_1.jpg','2014-12-08 22:43:39','2014-12-08 22:43:39'),(10012,10013,'upload/tijianba_image_upload/20141206/1417877108234_1.png','2014-12-08 22:43:39','2014-12-08 22:43:39'),(10013,10013,'upload/tijianba_image_upload/20141206/1417877108375_1.gif','2014-12-08 22:43:39','2014-12-08 22:43:39');

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `Name` varchar(16) NOT NULL,
  `IDNumber` varchar(32) NOT NULL,
  `OrgName` varchar(512) DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Attachment` varchar(128) NOT NULL,
  `Src` tinyint(4) NOT NULL,
  `IsRead` tinyint(4) NOT NULL DEFAULT '0',
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `report` */

insert  into `report`(`ID`,`UserId`,`Name`,`IDNumber`,`OrgName`,`Time`,`Attachment`,`Src`,`IsRead`,`Status`,`CreateTime`,`ModifyTime`) values (1,15,'金陈杰','4445543432212121121','10000','2014-11-22 00:00:00','upload/report_upload/20141122/1416669948218_1.pdf',1,1,1,'2014-11-22 23:26:32','2015-01-05 22:02:29'),(2,15,'金陈杰','4445543432212121121','10000','2015-01-02 00:21:50','upload/report_upload/20141122/1416669948218_2.pdf',1,0,1,'2015-01-02 00:22:05','2015-01-05 22:02:33'),(3,1,'夏小强','330328198604253318','10010',NULL,'upload/report_upload/20150104/1420386307984_a.pdf',1,1,0,'2015-01-04 23:44:31','2015-01-04 23:44:31'),(4,1,'夏小强','330328198604253318','10010',NULL,'upload/report_upload/20150104/1420386473281_a.pdf',1,1,0,'2015-01-04 23:47:15','2015-01-04 23:47:15'),(5,1,'夏小强','330328198604253318','10010',NULL,'upload/report_upload/20150105/1420466472062_a.pdf',1,1,1,'2015-01-05 22:00:43','2015-01-05 23:09:03'),(6,1,'夏小强','330328198604253318','小强体检机构',NULL,'upload/report_upload/20150105/1420470450562_a.pdf',1,1,0,'2015-01-05 23:06:22','2015-01-05 23:06:22'),(7,15,'小金','330324198709876600','小强机构','2015-01-01 00:00:00','upload/report_upload/20150105/1420472340156_a.pdf',0,1,0,'2015-01-05 23:37:37','2015-01-05 23:37:37'),(8,15,'小金','330324198709876600','小强机构','2015-01-01 00:00:00','upload/report_upload/20150105/1420472408140_a.pdf',0,1,0,'2015-01-05 23:38:42','2015-01-05 23:38:42'),(9,15,'小金','330324198709876600','小强机构','2015-01-01 00:00:00','upload/report_upload/20150105/1420472507312_a.pdf',0,1,0,'2015-01-05 23:40:21','2015-01-05 23:40:21'),(10,15,'品牌A','4445543432212121121','机构','2015-01-07 00:00:00','upload/report_upload/20150105/1420472545890_a.pdf',0,1,0,'2015-01-05 23:40:59','2015-01-05 23:40:59'),(11,1,'夏小强','330328198604253318','小强体检机构',NULL,'upload/report_upload/20150106/1420552020562_a.pdf',1,1,0,'2015-01-06 21:46:40','2015-01-06 21:46:40'),(12,1,'夏小强','330328198604253318','小强体检机构',NULL,'upload/report_upload/20150106/1420554856953_b.pdf',1,1,0,'2015-01-06 22:33:48','2015-01-06 22:33:48');

/*Table structure for table `stepcounter` */

DROP TABLE IF EXISTS `stepcounter`;

CREATE TABLE `stepcounter` (
  `UserId` int(10) NOT NULL,
  `DayStep` int(10) DEFAULT NULL,
  `WeekStep` int(10) DEFAULT NULL,
  `DayTopStep` int(10) DEFAULT NULL,
  `Kilometre` double(12,2) DEFAULT NULL,
  `Ranking` int(10) DEFAULT NULL,
  `GiftId` int(10) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stepcounter` */

insert  into `stepcounter`(`UserId`,`DayStep`,`WeekStep`,`DayTopStep`,`Kilometre`,`Ranking`,`GiftId`,`CreateTime`,`ModifyTime`) values (1,600,22222,890,2.00,2,2,'2015-05-26 05:50:50','0000-00-00 00:00:00'),(1,560,22222,789,2.00,2,2,'2015-05-25 05:50:50','0000-00-00 00:00:00'),(1,550,22222,980,2.00,2,2,'2015-05-24 05:50:50','0000-00-00 00:00:00'),(1,500,22222,789,2.00,2,2,'2015-05-23 05:50:50','0000-00-00 00:00:00'),(1,789,22222,1000,2.00,2,2,'2015-05-22 05:50:50','0000-00-00 00:00:00'),(1,378,22222,678,2.00,2,2,'2015-05-21 05:50:50','0000-00-00 00:00:00'),(1,767,22222,988,2.00,2,2,'2015-05-20 05:50:50','0000-00-00 00:00:00'),(1,567,22222,600,2.00,2,2,'2015-05-19 05:50:50','0000-00-00 00:00:00'),(1,800,22222,890,2.00,2,2,'2015-05-18 05:50:50','0000-00-00 00:00:00'),(1,786,22222,899,2.00,2,2,'2015-05-17 05:50:50','0000-00-00 00:00:00'),(1,567,22222,666,2.00,2,2,'2015-05-16 05:50:50','0000-00-00 00:00:00'),(2,600,22222,1000,2.00,2,2,'2015-05-16 05:50:50','0000-00-00 00:00:00'),(3,600,22222,1000,2.00,1,1,'2015-05-16 05:50:50','0000-00-00 00:00:00'),(4,600,22222,1000,2.00,5,3,'2015-05-16 05:50:50','0000-00-00 00:00:00'),(5,600,22222,1000,2.00,2,2,'2015-05-16 05:50:50','0000-00-00 00:00:00'),(6,600,22222,1000,2.00,2,2,'2015-05-16 05:50:50','0000-00-00 00:00:00'),(7,600,22222,1000,2.00,2,2,'2015-05-16 05:50:50','0000-00-00 00:00:00'),(15,600,22222,1000,2.00,2,2,'2015-05-16 05:50:50','0000-00-00 00:00:00'),(298,600,22222,1000,2.00,2,2,'2015-05-16 05:50:50','0000-00-00 00:00:00');

/*Table structure for table `stepcountergift` */

DROP TABLE IF EXISTS `stepcountergift`;

CREATE TABLE `stepcountergift` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `GiftName` varchar(64) DEFAULT NULL,
  `Price` double(12,2) DEFAULT NULL,
  `Picture` varchar(256) DEFAULT NULL,
  `ActivityTime` varchar(64) DEFAULT NULL,
  `LotteryTime` varchar(64) DEFAULT NULL,
  `Rules` varchar(64) DEFAULT NULL,
  `Descr` varchar(64) DEFAULT NULL,
  `Detail` varchar(256) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `stepcountergift` */

insert  into `stepcountergift`(`Id`,`GiftName`,`Price`,`Picture`,`ActivityTime`,`LotteryTime`,`Rules`,`Descr`,`Detail`,`CreateTime`,`ModifyTime`) values (1,'智能血压计',5.00,'/upload/twj.jpg','5月15日到5月21日','周六','每周走路总步数','自己在家都可测血压','体温计不错不错','2000-01-01 00:00:00','2000-01-31 00:00:00'),(2,'儿童便携式体温计',5.00,'/upload/twj.jpg','5月15日到5月21日','周六','每周走路总步数','环保 准确 快速','体温计不错不错','2000-01-01 00:00:00','2000-01-31 00:00:00'),(3,'空气净化器',5.00,'/upload/twj.jpg','5月15日到5月21日','周六','每周走路总步数','清新健康','体温计不错不错','2000-01-01 00:00:00','2000-01-31 00:00:00');

/*Table structure for table `subscribe` */

DROP TABLE IF EXISTS `subscribe`;

CREATE TABLE `subscribe` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BookServerID` int(11) NOT NULL,
  `CardNo` varchar(32) NOT NULL,
  `TesterName` varchar(16) NOT NULL,
  `TesterGender` tinyint(4) NOT NULL,
  `TesterMarried` tinyint(4) NOT NULL,
  `TesterIDNumber` varchar(32) NOT NULL,
  `TesterMobile` varchar(32) NOT NULL,
  `ContactName` varchar(32) DEFAULT NULL,
  `ContactMobile` varchar(32) DEFAULT NULL,
  `TestDay` date DEFAULT NULL,
  `AgreeUploadReport` tinyint(4) DEFAULT '1',
  `ChangeTime` datetime DEFAULT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  `ContactPostAddr` varchar(256) DEFAULT NULL,
  `ContactZipCode` varchar(16) DEFAULT NULL,
  `Source` tinyint(4) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `Step` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `subscribe` */

insert  into `subscribe`(`ID`,`BookServerID`,`CardNo`,`TesterName`,`TesterGender`,`TesterMarried`,`TesterIDNumber`,`TesterMobile`,`ContactName`,`ContactMobile`,`TestDay`,`AgreeUploadReport`,`ChangeTime`,`CreateTime`,`ModifyTime`,`ContactPostAddr`,`ContactZipCode`,`Source`,`Status`,`Step`) values (2,33,'1111111','夏小强',0,0,'330328198604253318','13656564343','xxxx','13732207030',NULL,NULL,NULL,'2014-12-27 17:53:56','2014-12-27 17:53:56','2222','310063',0,1,1);

/*Table structure for table `systemuser` */

DROP TABLE IF EXISTS `systemuser`;

CREATE TABLE `systemuser` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LoginName` (`LoginName`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;

/*Data for the table `systemuser` */

insert  into `systemuser`(`ID`,`LoginName`,`Password`,`CreateTime`,`ModifyTime`) values (10001,'tijianba','tijianba','2014-10-21 21:14:34','2014-10-21 21:14:34');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(32) NOT NULL,
  `Mobile` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `IDNumber` varchar(32) DEFAULT NULL,
  `NickName` varchar(16) DEFAULT NULL,
  `RealName` varchar(32) DEFAULT NULL,
  `Source` tinyint(4) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Married` char(1) DEFAULT NULL,
  `BornDate` date DEFAULT NULL,
  `Address` varchar(512) DEFAULT NULL,
  `Telephone` varchar(32) DEFAULT '',
  `QQ` varchar(32) DEFAULT NULL,
  `Email` varchar(32) DEFAULT '0',
  `MonthIncome` varchar(32) DEFAULT '0',
  `Interest` varchar(512) DEFAULT NULL,
  `Status` char(1) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  `CompanyId` int(11) DEFAULT NULL,
  `Points` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Mobile` (`Mobile`) USING BTREE,
  UNIQUE KEY `LoginName` (`LoginName`) USING BTREE,
  UNIQUE KEY `IDNumber` (`IDNumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`ID`,`LoginName`,`Mobile`,`Password`,`IDNumber`,`NickName`,`RealName`,`Source`,`Gender`,`Married`,`BornDate`,`Address`,`Telephone`,`QQ`,`Email`,`MonthIncome`,`Interest`,`Status`,`CreateTime`,`ModifyTime`,`CompanyId`,`Points`) values (1,'13732207030','13732207030','4cee16f6f2cab4982bd17394188b1cff','22222','小强','夏小强',0,'0','0','1983-06-16','滨江高教园','0577645','12222','xshengqiang@163.com','5000','篮球、羽毛球','0','2014-11-04 22:26:23','2014-11-04 22:26:28',NULL,100),(2,'jincj','1378888','111111','33333','牛','金小牛',0,'0','0','2014-11-10','AAAA','0588888','2222','jincn@163.com','50000','泡妞','0','2014-11-04 22:29:22','2014-11-04 22:29:26',NULL,NULL),(3,'test','1388888888','111111','8888','发发','测试账号',0,'0','0','1994-10-04','来自地球','057777777','33333','0test@163.com','90000000','遨游宇宙','0','2014-10-03 22:31:12','2014-11-04 23:08:46',NULL,NULL),(4,'13770000001','13770000001','243000','330328198404243000','小白',NULL,0,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'0','2014-11-15 10:54:01','2014-11-15 11:12:39',1,NULL),(5,'13770000002','13770000002','243001','330328198404243001','spa',NULL,0,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'0','2014-11-15 10:54:01','2014-11-15 11:12:39',1,NULL),(6,'13770000003','13770000003','243002','330328198404243002','haha',NULL,0,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'0','2014-11-15 10:54:01','2014-11-15 11:12:39',1,NULL),(7,'13770000004','13770000004','243003','330328198404243003','hello',NULL,0,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'0','2014-11-15 10:54:01','2014-11-15 11:12:39',1,NULL),(8,'13770000005','13770000005','243004','330328198404243004','tom',NULL,0,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'0','2014-11-15 10:54:01','2014-11-15 11:12:39',1,NULL),(9,'13770000006','13770000006','243005','330328198404243005','lili',NULL,0,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'0','2014-11-15 10:54:01','2014-11-15 11:12:39',1,NULL),(10,'13770000007','13770000007','243006','330328198404243006','sam',NULL,0,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'1','2014-11-15 10:54:02','2014-11-30 19:31:07',1,NULL),(11,'13770000008','13770000008','243007','330328198404243007','rose',NULL,0,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'0','2014-11-15 10:54:02','2014-11-15 11:12:39',1,NULL),(12,'137322070302','137322070302','4cee16f6f2cab4982bd17394188b1cff',NULL,'banana',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,NULL,'0','2014-12-03 22:42:55','2014-12-03 22:42:55',NULL,NULL),(14,'137322070301','137322070301','4cee16f6f2cab4982bd17394188b1cff',NULL,'oranage',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,NULL,'0','2014-12-03 23:05:26','2014-12-08 09:37:57',NULL,NULL),(15,'13989486252','13989486252','686e7356378f50a00fe23db1a622c9c1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'',NULL,NULL,'0','2014-12-08 22:34:51','2015-01-07 22:13:39',1,NULL),(16,'13216169563','13216169563','123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'0','0',NULL,'0','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,NULL);

/*Table structure for table `userbonus` */

DROP TABLE IF EXISTS `userbonus`;

CREATE TABLE `userbonus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `BonusId` int(11) NOT NULL,
  `UsedMoney` int(11) NOT NULL DEFAULT '0',
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `userbonus` */

insert  into `userbonus`(`ID`,`UserId`,`BonusId`,`UsedMoney`,`CreateTime`,`ModifyTime`) values (1,1,1,0,'2014-11-18 23:02:54','2014-11-18 23:02:59'),(2,15,1,0,'2015-01-08 22:10:13','2015-01-08 22:36:29'),(3,15,2,0,'2015-01-08 22:10:28','2015-01-08 22:36:29');

/*Table structure for table `userverify` */

DROP TABLE IF EXISTS `userverify`;

CREATE TABLE `userverify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mobile` varchar(32) NOT NULL,
  `VerifyCode` char(6) NOT NULL,
  `ExpireTime` datetime NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `userverify` */

insert  into `userverify`(`ID`,`Mobile`,`VerifyCode`,`ExpireTime`,`CreateTime`,`ModifyTime`) values (1,'13732207030','627443','2014-12-27 23:13:21','2014-12-03 22:40:56','2014-12-27 23:08:21'),(2,'13989486252','587499','2015-01-07 22:18:03','2014-12-08 22:34:24','2015-01-07 22:13:03');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
