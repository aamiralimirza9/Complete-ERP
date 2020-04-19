/*
SQLyog Job Agent v11.11 (64 bit) Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 5.5.5-10.1.9-MariaDB : Database - enterprise resource planning
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`enterprise resource planning` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `enterprise resource planning`;

/*Table structure for table `aamir` */

DROP TABLE IF EXISTS `aamir`;

CREATE TABLE `aamir` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `aamir` */

insert  into `aamir`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);

/*Table structure for table `accountpayable` */

DROP TABLE IF EXISTS `accountpayable`;

CREATE TABLE `accountpayable` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `accountpayable` */

insert  into `accountpayable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`) values (1,NULL,0,300,300);
insert  into `accountpayable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`) values (4,NULL,NULL,200,500);
insert  into `accountpayable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`) values (5,NULL,NULL,100,600);

/*Table structure for table `accountrecieveable` */

DROP TABLE IF EXISTS `accountrecieveable`;

CREATE TABLE `accountrecieveable` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `accountrecieveable` */

insert  into `accountrecieveable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (8,NULL,200,NULL,200,NULL);
insert  into `accountrecieveable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (9,NULL,100,NULL,300,NULL);
insert  into `accountrecieveable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (10,NULL,200,NULL,500,NULL);
insert  into `accountrecieveable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (11,'JV#89',100,NULL,600,'2017-07-29');
insert  into `accountrecieveable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (12,'JV#90',100,NULL,700,'2017-07-22');

/*Table structure for table `accounts` */

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `accounts` */

insert  into `accounts`(`id`,`account_name`,`account_number`,`account_type`) values (1,'ahmad','144',NULL);
insert  into `accounts`(`id`,`account_name`,`account_number`,`account_type`) values (2,'cash','240',NULL);

/*Table structure for table `accountsubtype` */

DROP TABLE IF EXISTS `accountsubtype`;

CREATE TABLE `accountsubtype` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `subtype` varchar(255) DEFAULT NULL,
  `type` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  CONSTRAINT `accountsubtype_ibfk_1` FOREIGN KEY (`type`) REFERENCES `accounttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `accountsubtype` */

insert  into `accountsubtype`(`id`,`subtype`,`type`) values (1,'Cash',1);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (2,'Account_recieveable',1);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (3,'Longterm Liablity',2);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (4,'Unearned',2);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (5,'Expenses',3);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (6,'Salary',3);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (7,'Other assests',1);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (8,'Fixed Assest',1);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (9,'Account Payable',2);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (10,'Purchase',3);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (11,'Depriciation Expenses',3);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (12,'Equity Retained Earning',5);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (13,'Sales',4);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (14,'Sales Return ',4);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (15,'Fees',4);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (16,'Commision',4);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (17,'Rent',4);
insert  into `accountsubtype`(`id`,`subtype`,`type`) values (18,'markup',4);

/*Table structure for table `accounttype` */

DROP TABLE IF EXISTS `accounttype`;

CREATE TABLE `accounttype` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `accounttype` */

insert  into `accounttype`(`id`,`type`) values (1,'Assests');
insert  into `accounttype`(`id`,`type`) values (2,'Liability');
insert  into `accounttype`(`id`,`type`) values (3,'Expenses');
insert  into `accounttype`(`id`,`type`) values (4,'Revenue');
insert  into `accounttype`(`id`,`type`) values (5,'Capital');
insert  into `accounttype`(`id`,`type`) values (6,'Capital withdraw');

/*Table structure for table `ali` */

DROP TABLE IF EXISTS `ali`;

CREATE TABLE `ali` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `Branch_no` int(255) DEFAULT NULL,
  `Branch_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ali` */

/*Table structure for table `asad` */

DROP TABLE IF EXISTS `asad`;

CREATE TABLE `asad` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `Branch_no` int(255) DEFAULT NULL,
  `Branch_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `asad` */

insert  into `asad`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`Branch_no`,`Branch_code`) values (1,NULL,NULL,NULL,0,NULL,NULL);

/*Table structure for table `bankaccount` */

DROP TABLE IF EXISTS `bankaccount`;

CREATE TABLE `bankaccount` (
  `ba_id` int(255) NOT NULL AUTO_INCREMENT,
  `ba_name` varchar(255) DEFAULT NULL,
  `ba_code` int(255) DEFAULT NULL,
  `ba_account_code` int(255) DEFAULT NULL,
  PRIMARY KEY (`ba_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bankaccount` */

/*Table structure for table `bankjournallist` */

DROP TABLE IF EXISTS `bankjournallist`;

CREATE TABLE `bankjournallist` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) DEFAULT NULL,
  `branch_no` int(255) DEFAULT NULL,
  `branch_location` varchar(255) DEFAULT NULL,
  `account_no` int(255) DEFAULT NULL,
  `ac_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `bankjournallist` */

insert  into `bankjournallist`(`id`,`branch_name`,`branch_no`,`branch_location`,`account_no`,`ac_title`) values (1,'123',345,'null',0,NULL);
insert  into `bankjournallist`(`id`,`branch_name`,`branch_no`,`branch_location`,`account_no`,`ac_title`) values (2,'pak',234,'null',123,NULL);
insert  into `bankjournallist`(`id`,`branch_name`,`branch_no`,`branch_location`,`account_no`,`ac_title`) values (3,'pak',345,'null',123,NULL);
insert  into `bankjournallist`(`id`,`branch_name`,`branch_no`,`branch_location`,`account_no`,`ac_title`) values (5,'alfalah',1234,'null',3011,'ahmed');
insert  into `bankjournallist`(`id`,`branch_name`,`branch_no`,`branch_location`,`account_no`,`ac_title`) values (6,'alfalah',1234,'null',6419,'liaquat');
insert  into `bankjournallist`(`id`,`branch_name`,`branch_no`,`branch_location`,`account_no`,`ac_title`) values (7,'habib',3415,'null',6510,NULL);
insert  into `bankjournallist`(`id`,`branch_name`,`branch_no`,`branch_location`,`account_no`,`ac_title`) values (8,'abcde',611,'null',4414,NULL);

/*Table structure for table `bankpayment` */

DROP TABLE IF EXISTS `bankpayment`;

CREATE TABLE `bankpayment` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `reciept_date` date DEFAULT NULL,
  `bank_acno` int(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_title` varchar(255) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `voucher_no` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `bankpayment` */

insert  into `bankpayment`(`id`,`reciept_date`,`bank_acno`,`bank_name`,`bank_title`,`amount`,`type`,`comments`,`voucher_no`,`account_name`) values (1,'2017-06-24',6419,'alfalah','liaquat',200,NULL,'hello',NULL,NULL);
insert  into `bankpayment`(`id`,`reciept_date`,`bank_acno`,`bank_name`,`bank_title`,`amount`,`type`,`comments`,`voucher_no`,`account_name`) values (2,'2017-07-08',6419,'alfalah','liaquat',2000,NULL,'sale',NULL,'aamir');
insert  into `bankpayment`(`id`,`reciept_date`,`bank_acno`,`bank_name`,`bank_title`,`amount`,`type`,`comments`,`voucher_no`,`account_name`) values (3,'2017-07-30',6419,'alfalah','liaquat',200,NULL,'payment',NULL,NULL);
insert  into `bankpayment`(`id`,`reciept_date`,`bank_acno`,`bank_name`,`bank_title`,`amount`,`type`,`comments`,`voucher_no`,`account_name`) values (4,'2017-08-20',6419,'alfalah','liaquat',2000,NULL,'check # 2334567',NULL,NULL);

/*Table structure for table `bankreciept` */

DROP TABLE IF EXISTS `bankreciept`;

CREATE TABLE `bankreciept` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `reciept_date` date DEFAULT NULL,
  `bank_acno` int(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_title` varchar(255) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `voucher_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `bankreciept` */

insert  into `bankreciept`(`id`,`reciept_date`,`bank_acno`,`bank_name`,`bank_title`,`amount`,`type`,`comments`,`voucher_no`) values (1,'2017-06-28',6419,'alfalah','liaquat',200,NULL,'hello',NULL);

/*Table structure for table `batch` */

DROP TABLE IF EXISTS `batch`;

CREATE TABLE `batch` (
  `b_id` int(255) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(255) DEFAULT NULL,
  `bin_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `bin_id` (`bin_id`),
  CONSTRAINT `batch_ibfk_1` FOREIGN KEY (`bin_id`) REFERENCES `bin` (`bin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `batch` */

insert  into `batch`(`b_id`,`b_name`,`bin_id`) values (1,'hello batch',3);
insert  into `batch`(`b_id`,`b_name`,`bin_id`) values (2,'urea',4);
insert  into `batch`(`b_id`,`b_name`,`bin_id`) values (3,'new batch',4);
insert  into `batch`(`b_id`,`b_name`,`bin_id`) values (4,'generator',2);
insert  into `batch`(`b_id`,`b_name`,`bin_id`) values (5,'car',3);
insert  into `batch`(`b_id`,`b_name`,`bin_id`) values (6,'car parts',3);
insert  into `batch`(`b_id`,`b_name`,`bin_id`) values (7,'hiiii bathc',4);

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `b_id` int(255) NOT NULL AUTO_INCREMENT,
  `b_order_no` int(255) DEFAULT NULL,
  `b_customer_no` int(255) DEFAULT NULL,
  `b_date` varchar(255) DEFAULT NULL,
  `b_ammount` int(255) DEFAULT NULL,
  `b_quantity` int(255) DEFAULT NULL,
  `b_vol` int(255) DEFAULT NULL,
  `b_currency` int(255) DEFAULT NULL,
  `b_price` int(255) DEFAULT NULL,
  `b_material_no` int(255) DEFAULT NULL,
  `b_type` int(255) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `b_order_no` (`b_order_no`),
  KEY `b_customer_no` (`b_customer_no`),
  KEY `b_type` (`b_type`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`b_order_no`) REFERENCES `ordertable` (`order_id`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`b_customer_no`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`b_type`) REFERENCES `paymenttype` (`pt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bill` */

/*Table structure for table `billofmaterial` */

DROP TABLE IF EXISTS `billofmaterial`;

CREATE TABLE `billofmaterial` (
  `bm_id` int(255) NOT NULL AUTO_INCREMENT,
  `bm_name` varchar(255) DEFAULT NULL,
  `bm_quantity` int(255) DEFAULT NULL,
  `bm_awail_from` varchar(255) DEFAULT NULL,
  `bm_valid_to` varchar(255) DEFAULT NULL,
  `bm_measure` int(255) DEFAULT NULL,
  `bm_weight` int(255) DEFAULT NULL,
  `bm_usage_for` varchar(255) DEFAULT NULL,
  `bm_material_no` int(255) DEFAULT NULL,
  `bm_bill_of_type` int(255) DEFAULT NULL,
  PRIMARY KEY (`bm_id`),
  KEY `bm_bill_of_type` (`bm_bill_of_type`),
  CONSTRAINT `billofmaterial_ibfk_1` FOREIGN KEY (`bm_bill_of_type`) REFERENCES `billofmaterialtype` (`bmot_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `billofmaterial` */

insert  into `billofmaterial`(`bm_id`,`bm_name`,`bm_quantity`,`bm_awail_from`,`bm_valid_to`,`bm_measure`,`bm_weight`,`bm_usage_for`,`bm_material_no`,`bm_bill_of_type`) values (1,'bonnet',4,'yes','no',5,200,'yes',7,NULL);
insert  into `billofmaterial`(`bm_id`,`bm_name`,`bm_quantity`,`bm_awail_from`,`bm_valid_to`,`bm_measure`,`bm_weight`,`bm_usage_for`,`bm_material_no`,`bm_bill_of_type`) values (2,'cotton',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `billofmaterial`(`bm_id`,`bm_name`,`bm_quantity`,`bm_awail_from`,`bm_valid_to`,`bm_measure`,`bm_weight`,`bm_usage_for`,`bm_material_no`,`bm_bill_of_type`) values (3,'cables',50,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `billofmaterial`(`bm_id`,`bm_name`,`bm_quantity`,`bm_awail_from`,`bm_valid_to`,`bm_measure`,`bm_weight`,`bm_usage_for`,`bm_material_no`,`bm_bill_of_type`) values (4,'cables',200,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `billofmaterialtype` */

DROP TABLE IF EXISTS `billofmaterialtype`;

CREATE TABLE `billofmaterialtype` (
  `bmot_type` int(255) NOT NULL AUTO_INCREMENT,
  `bmot_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bmot_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billofmaterialtype` */

/*Table structure for table `bin` */

DROP TABLE IF EXISTS `bin`;

CREATE TABLE `bin` (
  `bin_id` int(255) NOT NULL AUTO_INCREMENT,
  `bin_name` varchar(255) DEFAULT NULL,
  `bin_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `bin` */

insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (1,'car ','engine');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (2,'fly wheel','car');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (3,'fertilizer','ffc used for');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (4,'parts','used ');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (5,'spare','stored');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (6,'showed','taked');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (7,'taked','blink');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (8,'diode','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (9,'transistor','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (10,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (11,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (12,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (13,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (14,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (15,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (16,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (17,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (18,'null','null');
insert  into `bin`(`bin_id`,`bin_name`,`bin_description`) values (19,'null','null');

/*Table structure for table `capitals` */

DROP TABLE IF EXISTS `capitals`;

CREATE TABLE `capitals` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `capitals` */

insert  into `capitals`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);
insert  into `capitals`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (2,'JV#53',NULL,2000,2000,NULL);
insert  into `capitals`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (3,'JV#55',NULL,100,2100,NULL);
insert  into `capitals`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (4,NULL,NULL,200,2300,NULL);
insert  into `capitals`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (5,'JV#98',NULL,124,2424,'2017-08-21');

/*Table structure for table `cash` */

DROP TABLE IF EXISTS `cash`;

CREATE TABLE `cash` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

/*Data for the table `cash` */

insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (2,'JV#53',2000,NULL,2000,NULL);
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (3,'JV#54',NULL,900,1100,NULL);
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (4,'JV#54',900,NULL,2000,NULL);
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (5,'JV#55',100,NULL,2100,NULL);
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (6,'JV#56',100,NULL,2200,'2017-07-08');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (7,'sale',200,NULL,2400,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (8,'sale',100,NULL,2500,'2017-07-08');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (9,'sale',300,NULL,2800,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (10,'sale',300,NULL,3100,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (11,'sale',400,NULL,3500,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (12,'sale',300,NULL,3800,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (13,'sale',400,NULL,4200,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (14,'sale',300,NULL,4500,'2017-07-22');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (15,'sale',100,NULL,4600,'2017-07-13');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (16,'salaries',NULL,200,4400,'2017-07-31');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (17,'salaries',NULL,200,4200,'2017-07-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (18,'JV#57',NULL,400,3800,'2017-07-07');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (19,'JV#58',200,NULL,4000,'2017-07-13');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (20,'AccountPayable',300,NULL,4300,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (21,'AccountPayable',200,NULL,4500,'2017-07-07');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (22,'AccountPayable',100,NULL,4600,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (23,'AccountRecieveable',NULL,200,4400,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (24,'AccountRecieveable',NULL,200,4200,'2017-07-06');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (25,'AccountRecieveable',NULL,100,4100,NULL);
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (26,'JV#59',1000,NULL,5100,'2017-07-13');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (27,'sale',NULL,200,4900,'2017-07-11');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (28,'sale',2000,NULL,6900,'2017-07-20');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (29,'sale',200,NULL,7100,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (30,'sale',200,NULL,7300,'2017-07-18');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (31,'sale',200,NULL,7500,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (32,'sale',200,NULL,7700,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (33,'sale',200,NULL,7900,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (34,'sale',200,NULL,8100,'2017-07-20');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (35,'sale',200,NULL,8300,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (36,'sale',200,NULL,8500,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (37,'sale',200,NULL,8700,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (38,'sale',200,NULL,8900,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (39,'sale',200,NULL,9100,'2017-07-23');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (40,'capitals',200,NULL,9300,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (41,'sale',2000,NULL,11300,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (42,'sale',200,NULL,11500,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (43,'sale',200,NULL,11700,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (44,'sale',200,NULL,11900,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (45,'sale',200,NULL,12100,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (46,'sale',200,NULL,12300,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (47,'sale',400,NULL,12700,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (48,'sale',400,NULL,13100,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (49,'salaries',NULL,500,12600,'2017-07-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (50,'salaries',NULL,2000,10600,'2017-07-12');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (51,'sale',200,NULL,10800,'2017-07-25');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (52,'sale',20,NULL,10820,'2017-07-26');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (53,'sale',20,NULL,10840,'2017-07-26');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (54,'sale',NULL,20,10820,'2017-07-25');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (55,'salaries',NULL,20,10800,'2017-07-31');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (56,'salaries',NULL,30,10770,'2017-07-25');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (57,'sale',40,NULL,10810,'2017-07-25');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (58,'sale',50,NULL,10860,'2017-07-25');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (59,'sale',60,NULL,10920,'2017-07-25');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (60,'sale',100,NULL,11020,'2017-07-25');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (61,'JV#61',NULL,2000,13020,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (62,'JV#62',NULL,200,13220,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (63,'JV#62',NULL,100,13320,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (64,'JV#85',NULL,900,14220,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (65,'JV#86',NULL,100,14320,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (66,'JV#87',NULL,200,14520,'2017-07-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (67,'JV#88',NULL,100,14620,'2017-07-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (68,'JV#89',NULL,300,14920,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (69,'JV#90',NULL,1000,15920,'2017-07-22');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (70,'sale',200,NULL,16120,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (71,'sale',200,NULL,16320,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (72,'sale',20,NULL,16340,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (73,'sale',10,NULL,16350,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (74,'sale',30,NULL,16380,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (75,'sale',20,NULL,16400,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (76,'sale',40,NULL,16440,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (77,'sale',NULL,40,16400,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (78,'sale',80,NULL,16480,'2017-07-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (79,'salaries',NULL,100,16380,'2017-07-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (80,'sale',NULL,200,16180,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (81,'sale',NULL,100,16080,'2017-07-14');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (82,'sale',20,NULL,16100,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (83,'sale',50,NULL,16150,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (84,'sale',NULL,200,15950,'2017-07-29');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (85,'salaries',NULL,200,15750,'2017-07-20');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (86,'salaries',NULL,200,15550,'2017-07-30');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (87,'cash',NULL,200,15350,'2017-07-31');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (88,NULL,200,NULL,15550,NULL);
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (89,'sale',10000,NULL,25550,'2017-07-31');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (90,'sale',NULL,200,25350,'2017-08-14');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (91,'JV#92',2000,NULL,27350,'2017-08-10');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (92,'JV#93',2000,NULL,29350,'2017-08-23');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (93,'sale',2000,NULL,31350,'2017-08-16');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (94,'sale',NULL,200,31150,'2017-08-05');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (95,'salaries',NULL,400,30750,'2017-08-17');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (96,'undefined',NULL,2000,28750,'2017-08-16');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (97,'undefined',NULL,20,28730,'2017-08-22');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (98,'undefined',NULL,2000,26730,'2017-08-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (99,'undefined',NULL,2000,24730,'2017-08-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (100,'undefined',NULL,2000,22730,'2017-08-08');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (101,'undefined',NULL,2000,20730,'2017-08-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (102,'undefined',NULL,2000,18730,'2017-08-22');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (103,'undefined',NULL,200,18530,'2017-08-14');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (104,'undefined',NULL,200,18330,'2017-08-14');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (105,'sale',NULL,200,18130,'2017-08-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (106,'undefined',NULL,2000,16130,'2017-08-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (107,'undefined',NULL,2000,14130,'2017-08-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (108,'undefined',NULL,2000,12130,'2017-08-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (109,'sale',NULL,2000,10130,'2017-08-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (110,'cash',NULL,275,9855,'2017-08-16');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (111,NULL,275,NULL,10130,NULL);
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (112,'sale',NULL,275,9855,'2017-08-10');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (113,'JV#94',NULL,2000,11855,'2017-08-17');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (114,'sale',2000,NULL,13855,'2017-08-20');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (115,'sale',2000,NULL,15855,'2017-08-20');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (116,'sale',2000,NULL,17855,'2017-08-20');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (117,'sale',NULL,987,16868,'2017-08-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (118,'sale',NULL,200,16668,'2017-08-20');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (119,'JV#96',NULL,2000,18668,'2017-08-23');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (120,'JV#97',NULL,1420,20088,'2017-08-21');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (121,'salaries',NULL,5,20083,'2017-08-15');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (122,'JV#100',NULL,7786,27869,'2017-08-22');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (123,'JV#101',7786,NULL,35655,'2017-08-24');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (124,'JV#102',NULL,181368,217023,'2017-08-17');
insert  into `cash`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (125,'JV#103',NULL,10145,227168,'2017-08-16');

/*Table structure for table `cashaccount` */

DROP TABLE IF EXISTS `cashaccount`;

CREATE TABLE `cashaccount` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `account_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `t_date` date DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

/*Data for the table `cashaccount` */

insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (1,'144',2000,NULL,NULL,NULL,'purchase boot');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (2,'2000',NULL,20000,NULL,NULL,'pakistan');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (3,'133',2000,NULL,NULL,NULL,'land');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (4,'salary',2000,NULL,NULL,NULL,'saling');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (5,'144',2000,NULL,NULL,NULL,'hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (6,'144',2000,NULL,NULL,NULL,'pak');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (7,'144',2000,NULL,NULL,NULL,'hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (8,'144',2000,NULL,NULL,NULL,'hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (9,'1',1,NULL,NULL,NULL,'hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (10,'144',2000,NULL,NULL,NULL,'hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (11,'144',2000,NULL,NULL,NULL,'hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (12,'144',2000,NULL,NULL,'2008-11-11','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (13,'144',2000,NULL,NULL,'2008-11-11','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (14,'144',2000,NULL,NULL,'0000-00-00','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (15,'aamir',2000,NULL,NULL,'2017-06-20','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (16,'salary',10000,NULL,NULL,'2017-06-24','pakistan\n');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (17,'144',2000,NULL,NULL,'2017-06-27','hi');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (18,'2000',NULL,19000,NULL,'2017-06-26','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (19,'144',2200,NULL,2200,'2017-06-28','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (20,'1444',3000,NULL,5200,'2017-06-29','ali');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (21,'1000',NULL,133,5067,'2017-06-27','ali');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (22,'133',NULL,2000,3067,'2017-06-26','hi');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (23,'capital',2000,NULL,5067,'2017-06-22','sales');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (24,'capital',2000,NULL,7067,'2017-06-22','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (25,'capital',2000,NULL,9067,'2017-06-29','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (26,'capital',NULL,1000,8067,'2017-06-29','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (27,'capital',2000,NULL,10067,'2017-06-01','sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (28,'capital',30000,NULL,40067,'2017-06-16','from partner investment');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (29,'salary',NULL,2000,38067,'2017-06-17','salary of employee');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (30,'144',2000,NULL,40067,'2017-06-02','');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (31,'capital',20000,NULL,60067,'2017-07-15','fghgfds');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (32,'146',2000,NULL,62067,'2017-06-09','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (33,'sale',2000,NULL,64067,'2017-06-08','for sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (34,'sale',2000,NULL,66067,'2017-06-29','hello it is');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (35,'sale',NULL,2900,63167,'2017-06-27','for sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (36,'sale',NULL,4000,59167,'2017-06-25','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (37,'sale',2000,NULL,61167,'2017-06-27','sale purpose');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (38,'cash',2000,NULL,63167,'2017-06-20','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (39,'sale',NULL,2000,61167,'2017-06-29','hi');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (40,'sale',2000,NULL,63167,'2017-06-30','hekllo');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (41,'sale',NULL,2000,61167,'2017-06-09','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (42,'salary',2000,NULL,63167,'2017-06-03','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (43,'salary',NULL,2000,61167,'2017-06-27','helllo');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (44,'salary',NULL,2000,59167,'2017-06-29','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (45,'salary',NULL,2000,57167,'2017-06-20','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (46,'sale',500,NULL,57667,'2017-06-13','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (47,'sale',20000,NULL,77667,'2017-06-21','balnce come from chexk');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (48,'sale',1000,NULL,-2000,'2017-06-28','sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (49,'cash',2000,NULL,0,'2017-06-19','payent came from vendor');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (50,'sale',2000,NULL,2000,'2017-06-28','payment from sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (51,'sale',200,NULL,2200,'2017-06-28','sale from customer');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (52,'cash',4000,NULL,6200,'2017-06-26','sale with cash');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (53,'cash',2000,NULL,8200,'2017-06-27','cash from sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (54,'cash',100,NULL,8300,'2017-06-21','cash from aamir');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (55,'cash',120,NULL,8420,'2017-06-29','aamir');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (56,'cash',200,NULL,8620,'2017-06-27','cash from sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (57,'cash',200,NULL,8820,'2017-06-28','cash');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (58,'cash',1000,NULL,9820,'2017-06-29','aamir');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (59,'cash',200,NULL,10020,'2017-06-27','sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (60,'cash',200,NULL,10220,'2017-06-27','sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (61,'cash',100,NULL,10320,'2017-06-28','sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (62,'cash',100,NULL,10420,'2017-06-28','ali');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (63,'cash',100,NULL,10520,'2017-06-29','sale');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (64,'cash',200,NULL,10720,'2017-06-21','xz');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (65,'cash',2000,NULL,12720,'2017-06-21','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (66,'cash',200,NULL,12920,'2017-06-26','hello');
insert  into `cashaccount`(`id`,`account_title`,`Debit`,`Credit`,`Balance`,`t_date`,`memo`) values (67,'sale',200,NULL,13120,'2017-07-06','sale');

/*Table structure for table `cashvoucher` */

DROP TABLE IF EXISTS `cashvoucher`;

CREATE TABLE `cashvoucher` (
  `cv_no` int(255) NOT NULL AUTO_INCREMENT,
  `cash_date` date DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `actype` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `voucher_no` varchar(255) DEFAULT NULL,
  `names` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cv_no`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

/*Data for the table `cashvoucher` */

insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (8,'2017-06-20','salary',2000,'payment','hello','CV#8',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (9,'2017-06-13','sale',500,'reciept','hello','CV#9',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (10,'2017-06-21','sale',20000,'reciept','balnce come from chexk','CV#10',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (11,'2017-06-28','sale',1000,'reciept','sale','CV#11',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (12,'2017-06-19','cash',2000,'reciept','payent came from vendor','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (13,'2017-06-28','sale',2000,'reciept','payment from sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (14,'2017-06-28','sale',200,'reciept','sale from customer','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (15,'2017-06-26','cash',4000,'reciept','sale with cash','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (16,'2017-06-27','cash',2000,'reciept','cash from sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (17,'2017-06-21','cash',100,'reciept','cash from aamir','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (18,'2017-06-29','cash',120,'reciept','aamir','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (19,'2017-06-27','cash',200,'reciept','cash from sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (20,'2017-06-28','cash',200,'reciept','cash','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (21,'2017-06-29','cash',1000,'reciept','aamir','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (22,'2017-06-27','cash',200,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (23,'2017-06-27','cash',200,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (24,'2017-06-28','cash',100,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (25,'2017-06-28','cash',100,'reciept','ali','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (26,'2017-06-29','cash',100,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (27,'2017-06-21','cash',200,'reciept','xz','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (28,'2017-06-21','cash',2000,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (29,'2017-06-26','cash',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (30,'2017-07-06','sale',200,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (31,'2017-07-08','sale',200,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (32,'2017-07-06','sale',200,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (33,'2017-07-08','sale',100,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (34,'2017-07-06','sale',300,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (35,'2017-07-06','sale',300,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (36,'2017-07-06','sale',400,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (37,'2017-07-06','sale',300,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (38,'2017-07-06','sale',400,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (39,'2017-07-22','sale',300,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (40,'2017-07-13','sale',100,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (41,'2017-07-31','salaries',200,'payment','expwnse','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (42,'2017-07-15','salaries',200,'payment','salary','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (43,'2017-07-06','AccountPayable',300,'reciept','payable','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (44,'2017-07-07','AccountPayable',200,'reciept','payable','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (45,'2017-07-06','AccountPayable',100,'reciept','payable','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (46,'2017-07-06','AccountRecieveable',200,'payment','recieveable','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (47,'2017-07-06','AccountRecieveable',200,'payment','recieveable','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (48,'2017-07-11','sale',200,'payment','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (49,'2017-07-20','sale',2000,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (50,'2017-07-21','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (51,'2017-07-18','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (52,'2017-07-21','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (53,'2017-07-21','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (54,'2017-07-21','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (55,'2017-07-20','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (56,'2017-07-21','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (57,'2017-07-21','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (58,'2017-07-21','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (59,'2017-07-21','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (60,'2017-07-23','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (61,'2017-07-24','capitals',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (62,'2017-07-24','sale',2000,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (63,'2017-07-24','sale',200,'reciept','helllo','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (64,'2017-07-24','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (65,'2017-07-24','sale',200,'reciept','helllo','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (66,'2017-07-24','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (67,'2017-07-24','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (68,'2017-07-24','sale',400,'reciept','runas','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (69,'2017-07-24','sale',400,'reciept','helo','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (70,'2017-07-24','salaries',500,'payment','salary','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (71,'2017-07-12','salaries',2000,'payment','salary','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (72,'2017-07-25','sale',200,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (73,'2017-07-26','sale',20,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (74,'2017-07-26','sale',20,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (75,'2017-07-25','sale',20,'payment','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (76,'2017-07-31','salaries',20,'payment','salary','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (77,'2017-07-25','salaries',30,'payment','aamir','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (78,'2017-07-25','sale',40,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (79,'2017-07-25','sale',50,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (80,'2017-07-25','sale',60,'reciept','ssale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (81,'2017-07-25','sale',100,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (82,'2017-07-29','sale',200,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (83,'2017-07-29','sale',200,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (84,'2017-07-29','sale',20,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (85,'2017-07-29','sale',10,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (86,'2017-07-29','sale',30,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (87,'2017-07-29','sale',20,'reciept','hello','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (88,'2017-07-29','sale',40,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (89,'2017-07-29','sale',40,'payment','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (90,'2017-07-21','sale',80,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (91,'2017-07-15','salaries',100,'payment','SAL','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (92,'2017-07-29','sale',200,'payment','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (93,'2017-07-14','sale',100,'payment','saling','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (94,'2017-07-29','sale',20,'reciept','sale','null',NULL);
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (95,'2017-07-29','sale',50,'reciept','sw','null','Aamir');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (96,'2017-07-29','sale',200,'payment','pay for the services','null','Hassan');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (97,'2017-07-20','salaries',200,'payment','pay to employee','null','sajjad');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (98,'2017-07-30','salaries',200,'payment','bill for','null','Ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (99,'2017-07-31','cash',200,'payment','sale','null','farhan');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (100,'2017-07-31','sale',10000,'reciept','Sale ','null','null');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (101,'2017-08-14','sale',200,'payment','sale','null','assad');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (102,'2017-08-16','sale',2000,'reciept','sale','null','null');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (103,'2017-08-05','sale',200,'payment','sale','null','hamza');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (104,'2017-08-17','salaries',400,'payment','sal','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (105,'2017-08-16','undefined',2000,'payment','ali','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (106,'2017-08-22','undefined',20,'payment','sale','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (107,'2017-08-21','undefined',2000,'payment','ali','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (108,'2017-08-15','undefined',2000,'payment','ali','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (109,'2017-08-08','undefined',2000,'payment','ali','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (110,'2017-08-15','undefined',2000,'payment','ali','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (111,'2017-08-22','undefined',2000,'payment','ali','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (112,'2017-08-14','undefined',200,'payment','ali','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (113,'2017-08-14','undefined',200,'payment','ali','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (114,'2017-08-15','sale',200,'payment','ali','null','qli');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (115,'2017-08-15','undefined',2000,'payment','ali','null','aamir');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (116,'2017-08-15','undefined',2000,'payment','ali','null','aamir');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (117,'2017-08-15','undefined',2000,'payment','ali','null','aamir');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (118,'2017-08-15','sale',2000,'payment','ali','null','aamir');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (119,'2017-08-16','cash',275,'payment','ali','null','akeel');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (120,'2017-08-10','sale',275,'payment','ali','null','akeel');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (121,'2017-08-20','sale',2000,'reciept','sale','null','null');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (122,'2017-08-20','sale',2000,'reciept','ali','null','null');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (123,'2017-08-20','sale',2000,'reciept','sale','null','null');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (124,'2017-08-21','sale',987,'payment','sale','null','ali');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (125,'2017-08-20','sale',200,'payment','sale\n','null','hamza');
insert  into `cashvoucher`(`cv_no`,`cash_date`,`account`,`amount`,`actype`,`memo`,`voucher_no`,`names`) values (126,'2017-08-15','salaries',5,'payment','sale','null','1');

/*Table structure for table `channel` */

DROP TABLE IF EXISTS `channel`;

CREATE TABLE `channel` (
  `channel_id` int(255) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `channel` */

insert  into `channel`(`channel_id`,`route`) values (1,'road');
insert  into `channel`(`channel_id`,`route`) values (2,'rail');
insert  into `channel`(`channel_id`,`route`) values (3,'postal');

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `company_id` int(255) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) DEFAULT NULL,
  `companyNo` int(255) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `companyPhone` int(255) DEFAULT NULL,
  `companyOwner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`company_id`,`companyName`,`companyNo`,`companyAddress`,`companyPhone`,`companyOwner`) values (1,'ali',12,'pak',211,'ahmazaq');
insert  into `company`(`company_id`,`companyName`,`companyNo`,`companyAddress`,`companyPhone`,`companyOwner`) values (2,'asdxf',123,'qsdf`',1,'1');
insert  into `company`(`company_id`,`companyName`,`companyNo`,`companyAddress`,`companyPhone`,`companyOwner`) values (3,'ali',45678,'mughj',4567,'alia');
insert  into `company`(`company_id`,`companyName`,`companyNo`,`companyAddress`,`companyPhone`,`companyOwner`) values (4,'ali',1123,'ahjk',123,'ali');
insert  into `company`(`company_id`,`companyName`,`companyNo`,`companyAddress`,`companyPhone`,`companyOwner`) values (5,'ali',45678,'mughj',4567,'alia');

/*Table structure for table `companyaccount` */

DROP TABLE IF EXISTS `companyaccount`;

CREATE TABLE `companyaccount` (
  `account_id` int(255) NOT NULL AUTO_INCREMENT,
  `account_title` varchar(255) DEFAULT NULL,
  `account_no` int(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `company_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `com_acc` (`company_id`),
  CONSTRAINT `com_acc` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `companyaccount` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_company_name` varchar(255) DEFAULT NULL,
  `customer_postaladdress` varchar(255) DEFAULT NULL,
  `customer_Mobile_No` int(255) DEFAULT NULL,
  `customer_bank_account` int(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`customer_name`,`customer_company_name`,`customer_postaladdress`,`customer_Mobile_No`,`customer_bank_account`) values (1,'waheed company','768','98786986968',0,0);
insert  into `customer`(`customer_id`,`customer_name`,`customer_company_name`,`customer_postaladdress`,`customer_Mobile_No`,`customer_bank_account`) values (2,'sahara textile','2000','45678978',0,0);
insert  into `customer`(`customer_id`,`customer_name`,`customer_company_name`,`customer_postaladdress`,`customer_Mobile_No`,`customer_bank_account`) values (32,'misbah limited','mix','56789',8756,89);
insert  into `customer`(`customer_id`,`customer_name`,`customer_company_name`,`customer_postaladdress`,`customer_Mobile_No`,`customer_bank_account`) values (53,'hassan limited','null','44445',0,0);
insert  into `customer`(`customer_id`,`customer_name`,`customer_company_name`,`customer_postaladdress`,`customer_Mobile_No`,`customer_bank_account`) values (54,'Shezore textile','null','2345',0,0);
insert  into `customer`(`customer_id`,`customer_name`,`customer_company_name`,`customer_postaladdress`,`customer_Mobile_No`,`customer_bank_account`) values (55,'sitara mills','null','23456',0,0);
insert  into `customer`(`customer_id`,`customer_name`,`customer_company_name`,`customer_postaladdress`,`customer_Mobile_No`,`customer_bank_account`) values (56,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `delevery` */

DROP TABLE IF EXISTS `delevery`;

CREATE TABLE `delevery` (
  `d_id` int(255) NOT NULL AUTO_INCREMENT,
  `d_description` varchar(255) DEFAULT NULL,
  `d_delevery_date` varchar(255) DEFAULT NULL,
  `d_from` varchar(255) DEFAULT NULL,
  `d_to` varchar(255) DEFAULT NULL,
  `d_weight` int(255) DEFAULT NULL,
  `route_id` int(255) DEFAULT NULL,
  `d_contact_no` varchar(255) DEFAULT NULL,
  `d_vendor_no` int(255) DEFAULT NULL,
  `d_customer_no` int(255) DEFAULT NULL,
  `d_price` int(255) DEFAULT NULL,
  `d_vechile_no` int(255) DEFAULT NULL,
  `d_driver_name` varchar(255) DEFAULT NULL,
  `vendor_id` int(255) DEFAULT NULL,
  `order_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`d_id`),
  KEY `d_vendor_no` (`d_vendor_no`),
  KEY `d_route_no` (`route_id`),
  CONSTRAINT `delevery_ibfk_1` FOREIGN KEY (`d_vendor_no`) REFERENCES `vendor` (`vendor_id`),
  CONSTRAINT `delevery_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `delevery` */

insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (1,'juice','2017-07-22','jjj','jjj',7,1,'88',1,88,77,87,'0',NULL,NULL);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (2,'juice','2017-07-25','gh','fd',67,2,'6',2,6,7,76,'0',NULL,NULL);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (3,'sales','2017-07-27','khi','pindi',7,2,'875',3,875,756578,79878,'0',NULL,NULL);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (4,'inventroy','2017-07-15','isb','khi',4,1,'87',1,87,87,78,'0',NULL,NULL);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (5,'ghq','2017-07-22','khi','ghk',2,1,'33',1,33,43,33,'0',NULL,NULL);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (6,'aa','2345678','fghj','ghjk',29,3,'456789',NULL,1,5678,1111,'0',1,NULL);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (7,'aaa','11','suk','khi',20,3,'345678',NULL,1,45678,34567,'ali',1,NULL);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (8,'aaa','2017-08-18','khi','lhr',20,3,'234567',NULL,1,2000,234,'aali',1,NULL);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (9,'sale','2017-08-18','suk','khi',200,3,'0333-3333333',NULL,1,2000,111,'ali',1,2);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (10,'aa','2017-08-23','khi','lhr',22,3,'0345-6785678',NULL,1,100,8890,'ali',1,2);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (11,'ali','2017-08-18','khoi','lhr',12,3,'3456-7895678',NULL,1,2000,1,'ali',1,19);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (12,'ghj','2017-08-22','khi','isb',2000,3,'3456-7894579',NULL,12,2000,56789,'ali',1,21);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (13,'sale','2017-08-21','suk','khi',20,3,'0345-6788967',NULL,1,20,234,'ali',1,23);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (14,'sale','2017-08-21','suk','khi',20,3,'0345-6785678',NULL,1,120,321,'ali',1,24);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (15,'sales','2017-08-22','khi','lhr',200,3,'1111-1111111',NULL,1,2000,2345,'ali',1,25);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (16,'sale for people','2017-08-23','khi','suk',2000,3,'0235-6787897',NULL,2,2000,4390,'ali',1,27);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (17,'ads','2017-08-23','suk ','suk',20,3,'0345-6784567',NULL,2,20,45678,'aamir',1,66);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (18,'aaa','2017-08-11','khi','si',20,3,'5678-5678567',NULL,2,29,2222,'aki',1,44);
insert  into `delevery`(`d_id`,`d_description`,`d_delevery_date`,`d_from`,`d_to`,`d_weight`,`route_id`,`d_contact_no`,`d_vendor_no`,`d_customer_no`,`d_price`,`d_vechile_no`,`d_driver_name`,`vendor_id`,`order_id`) values (19,'sale','2017-08-23','suk','khi',20,3,'0300-7800099',NULL,2,440,456756,'ali',1,28);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nic` varchar(100) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `cell_no` varchar(255) DEFAULT NULL,
  `pic` longblob,
  `active` tinyint(4) DEFAULT NULL,
  `qualification` varchar(20) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (1,'aa','salesuser','dsfghjk@yahoo.com','123','23456-7890456-7',NULL,'null','2345-6789456',NULL,NULL,NULL,'DataEntry','Sales And Distribution');
insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (2,'aa','ppuser','asdf@yahoo.com','123','45678-9678967-8',NULL,'null','5678-9056789',NULL,NULL,NULL,'DataEntry','Production Planning');
insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (3,'aamirali','manager','aamir@yahoo.com','123','34567-8945678-9',NULL,'null','6789-7890890',NULL,NULL,NULL,'Admin','all');
insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (4,'Hassan','mmuser','aamirmughal900@yahoo.com','123','45101-3857484-5',NULL,'null','0305-3200167',NULL,NULL,NULL,'DataEntry','Material Planning');
insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (7,'zeeshan','fuser','zeeshan@yahoo.com','123','45101-5678907-8',NULL,'Male','0300-0089000',NULL,NULL,NULL,'accountant','Finanace And Accounting');
insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (10,'marium','sales','marium@yahoo.com','123','45155-6789567-8',NULL,'Female','0300-0023333',NULL,NULL,NULL,'accountant',NULL);
insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (11,'ahmed hassan','clerk','aamir@yahoo.com','123','45678-9423456-7',NULL,'Male','0345-6784456',NULL,NULL,NULL,'DataEntry','Finanace And Accounting');
insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (12,'Imran Ali','ali','aamir@yahoo.com','123','45678-9423456-7',NULL,'Male','0345-6784456',NULL,NULL,NULL,'ceo','all');
insert  into `employee`(`employee_id`,`name`,`uname`,`email`,`password`,`nic`,`dob`,`gender`,`cell_no`,`pic`,`active`,`qualification`,`role`,`dept`) values (13,'aqeel','aqeel','aamir@yahoo.com','123','45678-7867896-7',NULL,'Male','0345-6786787',NULL,NULL,NULL,'Analyst','Sales And Distribution');

/*Table structure for table `fiscalyear` */

DROP TABLE IF EXISTS `fiscalyear`;

CREATE TABLE `fiscalyear` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `fiscalyear` */

insert  into `fiscalyear`(`id`,`startdate`,`enddate`) values (1,'2017-07-31','2017-07-24');
insert  into `fiscalyear`(`id`,`startdate`,`enddate`) values (2,'2017-07-23','2017-07-31');
insert  into `fiscalyear`(`id`,`startdate`,`enddate`) values (3,'2017-08-09','2017-08-08');
insert  into `fiscalyear`(`id`,`startdate`,`enddate`) values (4,'2017-08-27','2017-08-28');
insert  into `fiscalyear`(`id`,`startdate`,`enddate`) values (5,'2017-08-22','2017-08-21');
insert  into `fiscalyear`(`id`,`startdate`,`enddate`) values (6,'2017-08-02','2017-08-23');
insert  into `fiscalyear`(`id`,`startdate`,`enddate`) values (7,'2017-08-14','2017-08-21');

/*Table structure for table `generalledgerlist` */

DROP TABLE IF EXISTS `generalledgerlist`;

CREATE TABLE `generalledgerlist` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `ac_type` varchar(255) DEFAULT NULL,
  `ac_subtype` varchar(255) DEFAULT NULL,
  `ac_no` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;

/*Data for the table `generalledgerlist` */

insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (155,'capitals','Capital','Equity Retained Earning',144);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (156,'sale','Revenue','Sales',146);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (157,'AccountPayable','Liability','Account Payable',147);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (159,'salaries','Expenses','Salary',312);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (160,'purchases','Expenses','Purchase',313);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (162,'cash','Assests','Cash',314);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (163,'utilityexpenses','Expenses','Expenses',315);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (166,'hamza','Assests','Cash',5413);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (167,'AccountRecieveable','Assests','Account_recieveable',316);
insert  into `generalledgerlist`(`id`,`account_name`,`ac_type`,`ac_subtype`,`ac_no`) values (169,'asad','Expenses','Salary',4414);

/*Table structure for table `goodsissue` */

DROP TABLE IF EXISTS `goodsissue`;

CREATE TABLE `goodsissue` (
  `gi_id` int(255) DEFAULT NULL,
  `b_id` int(255) DEFAULT NULL,
  `gi_date` varchar(255) DEFAULT NULL,
  `bin_id` int(255) DEFAULT NULL,
  `m_quantity` int(255) DEFAULT NULL,
  `m_no` int(255) DEFAULT NULL,
  `m_price` int(255) DEFAULT NULL,
  `gi_storage_loction` varchar(255) DEFAULT NULL,
  `p_issues_id` int(255) DEFAULT NULL,
  KEY `pr_no` (`b_id`),
  KEY `o_no` (`gi_date`),
  KEY `m_type` (`bin_id`),
  KEY `b_no` (`m_no`),
  KEY `p_issues_id` (`p_issues_id`),
  CONSTRAINT `goodsissue_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `batch` (`b_id`),
  CONSTRAINT `goodsissue_ibfk_2` FOREIGN KEY (`bin_id`) REFERENCES `bin` (`bin_id`),
  CONSTRAINT `goodsissue_ibfk_3` FOREIGN KEY (`p_issues_id`) REFERENCES `partialissues` (`p_issues_id`),
  CONSTRAINT `goodsissue_ibfk_4` FOREIGN KEY (`m_no`) REFERENCES `material` (`m_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `goodsissue` */

insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,1,NULL,1,900,2,799,'6',NULL);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,2,'5',3,8,3,300,'3',NULL);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,4,'4',4,400,4,400,'4',NULL);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,3,'4',3,4,4,4,'43',NULL);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,2,2,120,'pak',65);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,7,3,450,'1',66);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,0,2,120,'1',66);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,2,2,120,'1',71);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,2,3,54,'',72);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,2,2,120,'',72);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,2,3,3400,'1',72);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,45,3,3400,'1',73);
insert  into `goodsissue`(`gi_id`,`b_id`,`gi_date`,`bin_id`,`m_quantity`,`m_no`,`m_price`,`gi_storage_loction`,`p_issues_id`) values (NULL,NULL,NULL,NULL,30,2,120,'1',73);

/*Table structure for table `goodsrecipt` */

DROP TABLE IF EXISTS `goodsrecipt`;

CREATE TABLE `goodsrecipt` (
  `gr_no` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) DEFAULT NULL,
  `gr_delevery_date` varchar(255) DEFAULT NULL,
  `po_no` int(255) DEFAULT NULL,
  `gr_quantity` int(255) DEFAULT NULL,
  `gr_stock` int(255) DEFAULT NULL,
  `pr_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`gr_no`),
  KEY `order_no` (`order_id`),
  KEY `gr_batch` (`gr_stock`),
  KEY `gr_bin` (`pr_id`),
  KEY `po_no` (`po_no`),
  CONSTRAINT `goodsrecipt_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `ordertable` (`order_id`),
  CONSTRAINT `goodsrecipt_ibfk_5` FOREIGN KEY (`pr_id`) REFERENCES `prtable` (`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `goodsrecipt` */

insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (1,1,'2016-2-2',1,4,5,323);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (2,2,'2016-2-2',2,5,7,324);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (3,2,'2016-2-2',3,6,7,323);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (4,3,'2016-2-2',4,7,7,323);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (5,3,'2016-2-2',5,88,4,324);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (6,4,'2016-2-2',3,6,5,323);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (7,5,NULL,4,5,6,324);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (8,2,'2017-08-16',2,2,1,324);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (9,2,'2017-08-16',2,2,1,324);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (10,1,'2017-08-07',1,NULL,NULL,324);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (11,1,'2017-08-22',1,NULL,NULL,327);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (12,2,'2017-08-20',2,NULL,NULL,323);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (13,1,'2017-08-09',2,NULL,NULL,326);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (14,2,'2017-08-08',1,NULL,NULL,324);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (17,44,'2017-08-14',48,NULL,NULL,344);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (18,44,'2017-08-20',1,NULL,NULL,349);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (19,2,'2017-08-21',1,NULL,NULL,349);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (20,1,'2017-08-21',2,NULL,NULL,349);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (21,2,'2017-08-13',4,NULL,NULL,345);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (22,44,'2017-08-21',12,NULL,NULL,349);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (23,44,'2017-08-21',2,NULL,NULL,349);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (24,44,'2017-08-16',2,NULL,NULL,349);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (25,44,'2017-08-21',4,NULL,NULL,354);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (26,2,'2017-08-21',3,NULL,NULL,354);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (27,56,'2017-08-21',64,NULL,NULL,355);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (28,63,'2017-08-22',63,NULL,NULL,357);
insert  into `goodsrecipt`(`gr_no`,`order_id`,`gr_delevery_date`,`po_no`,`gr_quantity`,`gr_stock`,`pr_id`) values (29,64,'2017-08-23',67,NULL,NULL,360);

/*Table structure for table `hamza` */

DROP TABLE IF EXISTS `hamza`;

CREATE TABLE `hamza` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `Branch_no` int(255) DEFAULT NULL,
  `Branch_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `hamza` */

insert  into `hamza`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`Branch_no`,`Branch_code`) values (1,NULL,NULL,NULL,0,NULL,NULL);

/*Table structure for table `inventorytodolist` */

DROP TABLE IF EXISTS `inventorytodolist`;

CREATE TABLE `inventorytodolist` (
  `intd_id` int(225) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(255) DEFAULT NULL,
  `pr_id` int(255) DEFAULT NULL,
  `active` int(4) DEFAULT NULL,
  PRIMARY KEY (`intd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `inventorytodolist` */

insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (1,'akeel',346,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (2,'akeel',347,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (3,'akeel',348,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (4,'akeel',349,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (5,'akeel',350,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (6,'akeel',351,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (7,'akeel',352,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (8,'akeel',353,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (9,'akeel',354,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (10,'akeel',354,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (11,'akeel',355,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (12,'akeel',356,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (13,'akeel',357,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (14,'ali',358,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (15,'akeel',359,1);
insert  into `inventorytodolist`(`intd_id`,`vendor_name`,`pr_id`,`active`) values (16,'akeel',360,1);

/*Table structure for table `investment` */

DROP TABLE IF EXISTS `investment`;

CREATE TABLE `investment` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `investment` */

insert  into `investment`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`) values (1,NULL,NULL,NULL,6000);
insert  into `investment`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`) values (2,NULL,NULL,30000,-24000);
insert  into `investment`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`) values (3,NULL,NULL,30000,-54000);

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `i_no` int(255) NOT NULL AUTO_INCREMENT,
  `o_no` int(255) DEFAULT NULL,
  `v_no` int(255) DEFAULT NULL,
  `i_tax` int(255) DEFAULT NULL,
  `i_total` int(255) DEFAULT NULL,
  `i_ammount` int(255) DEFAULT NULL,
  `i_description` varchar(255) DEFAULT NULL,
  `i_contact_no` int(255) DEFAULT NULL,
  `i_receved_by` int(255) DEFAULT NULL,
  `ba_no` int(255) DEFAULT NULL,
  PRIMARY KEY (`i_no`),
  KEY `o_no` (`o_no`),
  KEY `v_no` (`v_no`),
  KEY `ba_no` (`ba_no`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`o_no`) REFERENCES `ordertable` (`order_id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`v_no`) REFERENCES `vendor` (`vendor_id`),
  CONSTRAINT `invoice_ibfk_3` FOREIGN KEY (`ba_no`) REFERENCES `bankaccount` (`ba_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `invoice` */

/*Table structure for table `journalreciept` */

DROP TABLE IF EXISTS `journalreciept`;

CREATE TABLE `journalreciept` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `debit_name` varchar(255) DEFAULT NULL,
  `credit_name` varchar(255) DEFAULT NULL,
  `debit_amount` int(255) DEFAULT NULL,
  `credit_amount` int(255) DEFAULT NULL,
  `journal_no` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_no` (`journal_no`),
  CONSTRAINT `journalreciept_ibfk_1` FOREIGN KEY (`journal_no`) REFERENCES `journalvoucher` (`voucher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

/*Data for the table `journalreciept` */

insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (4,' salary',' cash',2000,2000,3);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (5,' sale',' cash',1000,2000,3);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (6,' sale',' cash',1000,2000,4);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (7,' sale',' cash',1000,500,5);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (8,' salary',' sale',2000,1000,6);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (9,' cash',' sale',2000,1000,7);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (10,' cash',' salary',2000,1000,8);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (11,' cash',' salary',2000,1000,9);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (12,' sale',' salary',2000,1000,10);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (13,' cash',' salary',2000,1000,11);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (14,' sale',' cash',2000,1000,12);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (15,' sale',' salary',2000,1000,13);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (16,' cash',' salary',2000,2000,14);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (17,' cash',' sale',2000,1800,15);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (18,' cash',' sale',100,100,16);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (19,' cash',' sale',100,100,16);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (20,' sale',' salary',500,500,17);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (21,' cash',' AccountRecieveable',200,200,17);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (22,' cash',' salary',200,200,18);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (23,' cash',' salary',200,200,19);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (24,' cash',' salary',2000,2000,20);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (25,' cash',' sale',2300,2300,21);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (26,' cash',' sale',2000,2000,22);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (27,' cash',' sale',2000,2000,23);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (28,' cash',' sale',2000,2000,24);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (29,' cash',' sale',2000,2000,25);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (30,' cash',' sale',2000,2000,26);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (31,' cash',' sale',2000,2000,27);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (32,' cash',' sale',2000,2000,28);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (33,' cash',' sale',200,200,29);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (34,' cash',' sale',2000,2000,30);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (35,' cash',' sale ',200,200,31);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (36,' AccountRecieveable',' sale',200,200,32);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (37,' cash',' sale',2000,2000,33);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (38,' cash',' sale',200,200,34);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (39,' cash',' sale',200,200,35);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (40,' cash',' sale ',2000,2000,36);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (41,' cash',' sale',200,200,37);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (42,' AccountRecieveable',' sale',200,200,38);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (43,' cash',' sale',2000,2000,39);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (44,' cash',' sale',200,200,40);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (45,' cash',' salary',200,200,41);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (46,' cash',' sale',200,200,42);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (47,' AccountRecieveable',' salary',200,100,43);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (48,' cash',' sale',200,300,43);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (49,' cash',' sale',200,200,44);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (50,' cash',' sale',200,200,45);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (51,' cash',' sale',200,200,46);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (52,' cash',NULL,200,NULL,47);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (53,NULL,' sale',NULL,200,47);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (54,' cash',NULL,2000,NULL,48);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (55,NULL,' salary',NULL,2000,48);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (56,' salary',NULL,2000,NULL,49);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (57,NULL,' AccountRecieveable',NULL,2000,49);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (58,' cash',NULL,2000,NULL,49);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (59,NULL,' sale',NULL,2000,49);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (60,' cash',NULL,1000,NULL,51);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (61,NULL,' sale',NULL,1000,51);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (62,' cash',NULL,1000,NULL,52);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (63,NULL,' sale',NULL,1000,52);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (64,' cash',NULL,2000,NULL,53);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (65,NULL,' sale',NULL,2000,53);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (66,' cash',NULL,2000,NULL,54);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (67,NULL,' capitals',NULL,2000,54);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (68,' utilityexpenses',NULL,200,NULL,54);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (69,NULL,' cash',NULL,900,54);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (70,' cash',NULL,900,NULL,55);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (71,NULL,' sale',NULL,900,55);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (72,' cash',NULL,100,NULL,56);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (73,NULL,' capitals',NULL,100,56);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (74,' cash',NULL,100,NULL,57);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (75,NULL,' sale',NULL,100,57);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (76,' salaries',NULL,400,NULL,58);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (77,NULL,' cash',NULL,400,58);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (78,' cash',NULL,200,NULL,59);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (79,NULL,' sale',NULL,200,59);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (80,' cash',NULL,1000,NULL,60);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (81,NULL,' sale',NULL,1000,60);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (82,' sale',NULL,2000,NULL,61);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (83,NULL,' salaries',NULL,2000,61);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (84,' salaries',NULL,2000,NULL,62);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (85,NULL,' cash',NULL,2000,62);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (86,' salaries',NULL,300,NULL,63);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (87,NULL,' cash',NULL,200,63);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (88,' utilityexpenses',NULL,300,NULL,86);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (89,NULL,' cash',NULL,900,86);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (90,' salaries',NULL,100,NULL,87);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (91,NULL,' cash',NULL,100,87);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (92,NULL,' cash',NULL,100,87);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (93,' salaries',NULL,200,NULL,88);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (94,' cash',NULL,NULL,200,88);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (95,' salaries',NULL,100,NULL,89);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (96,' cash',NULL,NULL,100,89);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (97,' AccountRecieveable',NULL,100,NULL,90);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (98,' purchases',NULL,100,NULL,90);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (99,' salaries',NULL,100,NULL,90);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (100,' cash',NULL,NULL,300,90);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (101,' AccountRecieveable',NULL,100,NULL,91);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (102,' purchases',NULL,300,NULL,91);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (103,' utilityexpenses',NULL,300,NULL,91);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (104,' salaries',NULL,300,NULL,91);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (105,' cash',NULL,NULL,1000,91);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (106,' salaries',NULL,200,NULL,92);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (107,' salaries',NULL,200,NULL,92);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (108,' sale',NULL,NULL,400,92);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (109,' cash',NULL,2000,NULL,93);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (110,' sale',NULL,NULL,2000,93);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (111,' cash',NULL,2000,NULL,94);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (112,' salaries',NULL,2000,NULL,94);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (113,' sale',NULL,NULL,4000,94);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (114,' salaries',NULL,2000,NULL,95);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (115,' cash',NULL,NULL,2000,95);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (116,' salaries',NULL,2290,NULL,96);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (117,' sale',NULL,NULL,2290,96);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (118,' sale',NULL,2000,NULL,97);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (119,' cash',NULL,NULL,2000,97);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (120,' sale',NULL,1420,NULL,98);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (121,' cash',NULL,NULL,1420,98);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (122,' salaries',NULL,124,NULL,99);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (123,' capitals',NULL,NULL,124,99);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (124,' salaries',NULL,2000,NULL,100);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (125,' sale',NULL,NULL,2000,100);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (126,' cash',NULL,NULL,7786,101);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (127,' cash',NULL,7786,NULL,102);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (128,' sale',NULL,NULL,7786,102);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (129,' purchases',NULL,181368,NULL,103);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (130,' cash',NULL,NULL,181368,103);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (131,' purchases',NULL,10145,NULL,104);
insert  into `journalreciept`(`id`,`debit_name`,`credit_name`,`debit_amount`,`credit_amount`,`journal_no`) values (132,' cash',NULL,NULL,10145,104);

/*Table structure for table `journalvoucher` */

DROP TABLE IF EXISTS `journalvoucher`;

CREATE TABLE `journalvoucher` (
  `voucher_no` int(255) NOT NULL AUTO_INCREMENT,
  `journal_date` date DEFAULT NULL,
  `transaction_no` varchar(255) DEFAULT NULL,
  `total` int(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `names` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`voucher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

/*Data for the table `journalvoucher` */

insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (1,'2017-09-02','2',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (2,'2017-03-09','2',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (3,'2017-06-02','12',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (4,'2017-09-02','2',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (5,'2017-06-29','JV#5',1000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (6,'2017-06-28','JV#6',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (7,'2017-06-22','JV#7',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (8,'2017-06-28','JV#8',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (9,'2017-06-26','JV#9',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (10,'2017-06-27','JV#10',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (11,'2017-06-28','JV#11',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (12,'2017-06-20','JV#12',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (13,'2017-06-30','JV#13',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (14,'2017-06-14','13',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (15,'2017-06-02','14',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (16,'2017-06-15','15',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (17,'2017-06-03','16',700,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (18,'2017-06-08','17',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (19,'2017-06-22','18',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (20,'2017-06-27','19',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (21,'2017-06-27','20',2300,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (22,'2017-06-27','21',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (23,'2017-06-27','22',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (24,'2017-06-28','23',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (25,'2017-06-29','24',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (26,'2017-06-28','25',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (27,'2017-06-28','26',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (28,'2017-06-20','27',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (29,'2017-06-20','28',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (30,'2017-06-26','29',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (31,'2017-06-21','30',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (32,'2017-06-27','31',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (33,'2017-07-20','32',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (34,'2017-06-22','33',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (35,'2017-06-28','34',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (36,'2017-06-29','35',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (37,'2017-06-20','36',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (38,'2017-06-20','37',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (39,'2017-06-20','38',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (40,'2017-06-03','39',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (41,'2017-06-02','40',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (42,'2017-06-21','41',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (43,'2017-06-28','42',400,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (44,'2017-06-03','43',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (45,'2017-06-08','44',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (46,'2017-06-28','45',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (47,'2017-06-27','46',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (48,'2017-06-27','47',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (49,'2017-06-10','JV#48',4000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (50,'2017-06-03','JV#49',0,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (51,'2017-06-28','JV#50',1000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (52,'2017-06-28','JV#51',1000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (53,'2017-07-24','JV#52',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (54,'2017-07-21','JV#53',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (55,'2017-07-13','JV#54',900,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (56,'2017-07-15','JV#55',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (57,'2017-07-08','JV#56',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (58,'2017-07-07','JV#57',400,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (59,'2017-07-13','JV#58',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (60,'2017-07-13','JV#59',1000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (61,'2017-07-13','JV#60',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (62,'2017-07-29','JV#61',2000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (63,'2017-07-29','JV#62',300,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (64,'2017-07-29','JV#63',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (65,'2017-07-29','JV#64',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (66,'2017-07-29','JV#65',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (67,'2017-07-29','JV#66',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (68,'2017-07-07','JV#67',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (69,'2017-07-29','JV#68',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (70,'2017-07-29','JV#69',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (71,'2017-07-31','JV#70',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (72,'2017-07-31','JV#71',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (73,'2017-07-29','JV#72',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (74,'2017-07-29','JV#73',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (75,'2017-07-29','JV#74',20,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (76,'2017-07-29','JV#75',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (77,'2017-07-29','JV#76',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (78,'2017-07-29','JV#77',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (79,'2017-07-29','JV#78',10,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (80,'2017-07-29','JV#79',1600,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (81,'2017-07-29','JV#80',1200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (82,'2017-07-29','JV#81',1600,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (83,'2017-07-29','JV#82',1000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (84,'2017-07-29','JV#83',500,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (85,'2017-07-29','JV#84',1000,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (86,'2017-07-29','JV#85',900,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (87,'2017-07-29','JV#86',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (88,'2017-07-15','JV#87',200,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (89,'2017-07-15','JV#88',100,NULL,NULL);
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (90,'2017-07-29','JV#89',300,'hello','aamir');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (91,'2017-07-22','JV#90',1000,'For billing and other purpose','Asadullah');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (92,'2017-07-31','JV#91',400,'group ','aqeel');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (93,'2017-08-10','JV#92',2000,'sale','aamir');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (94,'2017-08-23','JV#93',4000,'sale','ali');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (95,'2017-08-17','JV#94',2000,'salary','aamir');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (96,'2017-08-21','JV#95',2290,'sale from ','44');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (97,'2017-08-23','JV#96',2000,'cash','aamir');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (98,'2017-08-21','JV#97',1420,'sale','akeel');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (99,'2017-08-21','JV#98',124,'sale','akeel');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (100,'2017-08-22','JV#99',2000,'sales','null');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (101,'2017-08-22','JV#100',7786,'purchasing for cotton','akeel');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (102,'2017-08-24','JV#101',7786,'','akeel');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (103,'2017-08-17','JV#102',181368,'purchase from vendor ','akeel');
insert  into `journalvoucher`(`voucher_no`,`journal_date`,`transaction_no`,`total`,`comment`,`names`) values (104,'2017-08-16','JV#103',10145,'sale','waheed');

/*Table structure for table `mainproductinventory` */

DROP TABLE IF EXISTS `mainproductinventory`;

CREATE TABLE `mainproductinventory` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `po_no` int(255) DEFAULT NULL,
  `order_id` int(255) DEFAULT NULL,
  `lot_id` int(255) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `mainproductinventory` */

insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (1,2,2,2,'2017-08-31');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (2,2,2,2,'2017-08-17');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (3,2,2,2,'2017-08-17');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (4,1,1,1,'2017-08-18');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (5,48,44,48,'2017-08-17');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (6,2,2,2,'2017-08-21');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (7,2,2,2,'2017-08-21');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (8,3,3,3,'2017-08-21');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (9,64,64,255,'2017-08-21');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (10,22,22,255,'2017-08-21');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (11,45,45,255,'2017-08-17');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (12,57,57,255,'2017-08-21');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (13,2,2,255,'2017-08-14');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (14,2,2,255,'2017-08-22');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (15,2,56,255,'2017-08-15');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (17,63,66,63,'2017-08-16');
insert  into `mainproductinventory`(`id`,`po_no`,`order_id`,`lot_id`,`po_date`) values (18,67,64,67,'2017-08-07');

/*Table structure for table `mainproduction` */

DROP TABLE IF EXISTS `mainproduction`;

CREATE TABLE `mainproduction` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `po_no` int(255) DEFAULT NULL,
  `order_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `po_no` (`po_no`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `mainproduction_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ordertable` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

/*Data for the table `mainproduction` */

insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (22,1,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (23,3,3);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (24,5,6);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (25,2,7);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (26,3,NULL);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (27,NULL,NULL);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (28,1,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (29,4,3);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (30,4,3);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (31,1,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (32,1,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (33,2,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (34,14,34);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (35,14,34);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (36,14,34);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (37,16,34);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (38,16,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (39,16,34);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (40,1,35);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (41,1,35);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (42,1,41);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (43,1,41);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (44,1,41);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (45,2,42);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (46,46,42);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (47,47,1);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (48,48,44);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (49,49,44);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (50,50,44);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (51,51,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (52,52,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (53,53,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (54,54,45);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (55,55,44);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (56,56,51);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (57,57,2);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (58,58,22);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (59,59,22);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (60,60,22);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (61,61,47);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (62,62,52);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (63,63,44);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (64,64,56);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (65,64,56);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (66,66,63);
insert  into `mainproduction`(`id`,`po_no`,`order_id`) values (67,67,64);

/*Table structure for table `material` */

DROP TABLE IF EXISTS `material`;

CREATE TABLE `material` (
  `m_no` int(255) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(255) DEFAULT NULL,
  `m_weight` int(255) DEFAULT NULL,
  `m_price` int(255) DEFAULT NULL,
  `m_moving_price` int(255) DEFAULT NULL,
  `m_description` varchar(255) DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  `mt_no` int(255) DEFAULT NULL,
  PRIMARY KEY (`m_no`),
  KEY `mt_no` (`mt_no`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`mt_no`) REFERENCES `materialtype` (`mt_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `material` */

insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (2,'bonnet',20,120,125,'for bottling',0,3);
insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (3,'cotton',34,3400,45,'amir',1,2);
insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (4,'chemical',54,440,5,'amir',1,5);
insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (5,'cables',20,500,600,'pakistan',1,1);
insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (6,'airkit',43,300,23,'amir',1,6);
insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (7,'filter',434,545,34,'helllooo',1,8);
insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (8,'Gasline Kit',545,230,34,'233',1,9);
insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (9,'shed',12,2000,NULL,'used for production',1,10);
insert  into `material`(`m_no`,`m_name`,`m_weight`,`m_price`,`m_moving_price`,`m_description`,`active`,`mt_no`) values (10,'jute',3,1200,NULL,NULL,1,4);

/*Table structure for table `materialtype` */

DROP TABLE IF EXISTS `materialtype`;

CREATE TABLE `materialtype` (
  `mt_no` int(255) NOT NULL AUTO_INCREMENT,
  `mt_description` varchar(255) DEFAULT NULL,
  `mt_name` varchar(255) DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  PRIMARY KEY (`mt_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `materialtype` */

insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (1,'ali','cotton',NULL);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (2,'ssss','bales',0);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (3,'hassan','raw',1);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (4,'dewan','maize',1);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (5,'sajjad','stuff',1);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (6,'bouk','tuff',1);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (7,'amjad','iron',1);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (8,'use for home','appliance',1);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (9,'solid','drilling',1);
insert  into `materialtype`(`mt_no`,`mt_description`,`mt_name`,`active`) values (10,'used as raw','bales',1);

/*Table structure for table `movementtype` */

DROP TABLE IF EXISTS `movementtype`;

CREATE TABLE `movementtype` (
  `m_id` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `movementtype` */

/*Table structure for table `mptodolistt` */

DROP TABLE IF EXISTS `mptodolistt`;

CREATE TABLE `mptodolistt` (
  `mdid` int(255) NOT NULL AUTO_INCREMENT,
  `po_no` int(255) DEFAULT NULL,
  `order_id` int(255) DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  PRIMARY KEY (`mdid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `mptodolistt` */

insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (11,1,2,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (12,3,4,4);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (13,1,2,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (14,4,3,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (15,14,34,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (16,16,34,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (17,1,35,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (18,1,35,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (19,1,41,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (20,46,42,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (21,48,44,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (22,49,44,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (23,50,44,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (24,51,2,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (25,52,2,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (26,54,45,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (27,55,44,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (28,56,51,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (29,57,2,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (30,60,22,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (31,61,47,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (32,62,52,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (33,63,44,0);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (34,64,56,0);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (35,66,63,1);
insert  into `mptodolistt`(`mdid`,`po_no`,`order_id`,`active`) values (36,67,64,1);

/*Table structure for table `mpvendor` */

DROP TABLE IF EXISTS `mpvendor`;

CREATE TABLE `mpvendor` (
  `mpv_no` int(255) NOT NULL AUTO_INCREMENT,
  `mpv_name` varchar(255) DEFAULT NULL,
  `mpv_address` varchar(255) DEFAULT NULL,
  `mpv_contact_no` varchar(255) DEFAULT NULL,
  `mpv_fax_no` int(255) DEFAULT NULL,
  `mpv_group` varchar(255) DEFAULT NULL,
  `mpv_tax_no` int(255) DEFAULT NULL,
  `mpv_head_office` varchar(255) DEFAULT NULL,
  `mpv_account_no` int(255) DEFAULT NULL,
  PRIMARY KEY (`mpv_no`),
  KEY `mpv_account_no` (`mpv_account_no`),
  CONSTRAINT `mpvendor_ibfk_1` FOREIGN KEY (`mpv_account_no`) REFERENCES `bankaccount` (`ba_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mpvendor` */

/*Table structure for table `mtsinvoice` */

DROP TABLE IF EXISTS `mtsinvoice`;

CREATE TABLE `mtsinvoice` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) DEFAULT NULL,
  `d_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `mtsinvoice` */

insert  into `mtsinvoice`(`id`,`order_id`,`d_id`) values (1,44,0);
insert  into `mtsinvoice`(`id`,`order_id`,`d_id`) values (2,21,12);
insert  into `mtsinvoice`(`id`,`order_id`,`d_id`) values (3,21,12);
insert  into `mtsinvoice`(`id`,`order_id`,`d_id`) values (4,56,13);
insert  into `mtsinvoice`(`id`,`order_id`,`d_id`) values (5,56,14);
insert  into `mtsinvoice`(`id`,`order_id`,`d_id`) values (6,56,15);
insert  into `mtsinvoice`(`id`,`order_id`,`d_id`) values (7,66,16);

/*Table structure for table `mtsmain` */

DROP TABLE IF EXISTS `mtsmain`;

CREATE TABLE `mtsmain` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) DEFAULT NULL,
  `customer_id` int(255) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `delivery_id` int(255) DEFAULT NULL,
  `total` int(255) DEFAULT NULL,
  `invoice_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `mtsmain` */

insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (1,1,1,NULL,NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (2,1,1,NULL,NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (3,1,1,NULL,NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (4,1,1,NULL,NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (5,1,2,'2017-08-17',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (6,1,2,'2017-08-17',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (7,1,1,'2017-08-23',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (8,1,1,'2017-08-17',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (9,1,2,'2017-08-17',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (10,1,44,'2017-08-17',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (11,1,44,'2017-08-12',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (12,1,2,'2017-08-18',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (13,1,1,'2017-08-24',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (14,1,2,'2017-08-18',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (15,1,44,'2017-08-18',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (16,1,44,'2017-08-18',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (17,1,44,'2017-08-09',NULL,NULL,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (18,1,44,'2017-08-19',NULL,2290,1);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (19,44,1,'2017-08-19',NULL,46,0);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (20,20,1,'2017-08-10',NULL,458,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (21,21,1,'2017-08-19',12,0,3);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (22,44,1,'2017-08-21',NULL,2290,NULL);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (23,56,0,'2017-08-21',13,172,6);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (24,56,1,'2017-08-21',14,1088,6);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (25,56,1,'2017-08-22',15,5,6);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (26,66,2,'2017-08-23',NULL,2061,7);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (27,66,2,'2017-08-23',16,115,7);
insert  into `mtsmain`(`id`,`order_id`,`customer_id`,`po_date`,`delivery_id`,`total`,`invoice_id`) values (28,64,2,'2017-08-23',19,41220,NULL);

/*Table structure for table `orderinvoice` */

DROP TABLE IF EXISTS `orderinvoice`;

CREATE TABLE `orderinvoice` (
  `oInviceId` int(255) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `dDate` varchar(255) DEFAULT NULL,
  `dFrom` varchar(255) DEFAULT NULL,
  `dTo` varchar(255) DEFAULT NULL,
  `weight` int(255) DEFAULT NULL,
  `routeId` int(255) DEFAULT NULL,
  `contactNo` int(255) DEFAULT NULL,
  `vId` int(255) DEFAULT NULL,
  `customerNo` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `vechileNo` int(255) DEFAULT NULL,
  `driverName` varchar(255) DEFAULT NULL,
  `paymentAmount` int(255) DEFAULT NULL,
  `order_id` int(255) DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  `delivery_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`oInviceId`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `orderinvoice_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ordertable` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `orderinvoice` */

insert  into `orderinvoice`(`oInviceId`,`description`,`dDate`,`dFrom`,`dTo`,`weight`,`routeId`,`contactNo`,`vId`,`customerNo`,`price`,`vechileNo`,`driverName`,`paymentAmount`,`order_id`,`active`,`delivery_id`) values (1,'sale','09-07-2017','suk','khi',220,1,1234,1,9,12000,234,'aamir',987,1,1,NULL);
insert  into `orderinvoice`(`oInviceId`,`description`,`dDate`,`dFrom`,`dTo`,`weight`,`routeId`,`contactNo`,`vId`,`customerNo`,`price`,`vechileNo`,`driverName`,`paymentAmount`,`order_id`,`active`,`delivery_id`) values (2,'order','null','dadu','hyd',88,2,1234,2,89,5679,986,'null',9876,2,1,NULL);
insert  into `orderinvoice`(`oInviceId`,`description`,`dDate`,`dFrom`,`dTo`,`weight`,`routeId`,`contactNo`,`vId`,`customerNo`,`price`,`vechileNo`,`driverName`,`paymentAmount`,`order_id`,`active`,`delivery_id`) values (3,'pr','null','khi','dadu',222,3,1234,5,65,98876,987,'null',8776,3,0,NULL);
insert  into `orderinvoice`(`oInviceId`,`description`,`dDate`,`dFrom`,`dTo`,`weight`,`routeId`,`contactNo`,`vId`,`customerNo`,`price`,`vechileNo`,`driverName`,`paymentAmount`,`order_id`,`active`,`delivery_id`) values (4,'hr','2017-02-12','hyd','lhr',335,4,267,1,87,77655,458,'qwer',987,5,1,NULL);
insert  into `orderinvoice`(`oInviceId`,`description`,`dDate`,`dFrom`,`dTo`,`weight`,`routeId`,`contactNo`,`vId`,`customerNo`,`price`,`vechileNo`,`driverName`,`paymentAmount`,`order_id`,`active`,`delivery_id`) values (5,'order','null','hyd','pishawar',7664,5,78586,875,8777,896974,987,'null',998776,6,0,NULL);
insert  into `orderinvoice`(`oInviceId`,`description`,`dDate`,`dFrom`,`dTo`,`weight`,`routeId`,`contactNo`,`vId`,`customerNo`,`price`,`vechileNo`,`driverName`,`paymentAmount`,`order_id`,`active`,`delivery_id`) values (6,'sale','1-08-2017',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL);

/*Table structure for table `ordertable` */

DROP TABLE IF EXISTS `ordertable`;

CREATE TABLE `ordertable` (
  `order_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_id` int(255) DEFAULT NULL,
  `product_id` int(255) DEFAULT NULL,
  `delivery_date` varchar(255) DEFAULT NULL,
  `order_status` int(255) DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `ordercustomer` (`customer_id`),
  KEY `orderproduct` (`product_id`),
  CONSTRAINT `ordercustomer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `orderproduct` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

/*Data for the table `ordertable` */

insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (1,1,NULL,'2017-2-11',1,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (2,1,NULL,NULL,2,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (3,1,NULL,NULL,3,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (4,1,NULL,NULL,4,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (5,1,NULL,NULL,5,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (6,1,NULL,NULL,6,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (7,1,NULL,NULL,7,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (8,1,NULL,NULL,8,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (10,1,1,'2017-02-12',NULL,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (11,1,2,'2017-07-22',NULL,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (12,1,1,'2017-07-24',NULL,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (13,1,NULL,'',1,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (14,1,NULL,'2017-01-02',1,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (15,1,NULL,'2017-09-09',1,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (16,1,NULL,'2016-09-08',1,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (17,1,NULL,'2016-09-09',1,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (18,1,NULL,'2013-09-19',1,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (20,1,NULL,'2017-08-30',1,NULL);
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (21,1,NULL,'2017-08-31',1,'on');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (22,1,NULL,'2017-08-30',1,'on');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (23,1,NULL,'2017-08-22',1,'mtB');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (24,1,NULL,'2017-08-23',1,'null');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (25,1,NULL,'2017-08-28',1,'mts');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (26,1,NULL,'2017-08-30',1,'mtB');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (27,1,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (28,1,NULL,'2017-08-22',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (29,1,NULL,'2017-08-23',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (30,1,NULL,'2017-08-29',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (31,1,NULL,'2017-08-29',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (32,1,NULL,'2017-08-28',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (33,1,NULL,'2017-08-28',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (34,1,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (35,1,NULL,'2017-08-28',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (36,1,NULL,'2017-08-25',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (37,1,NULL,'2017-08-15',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (38,1,NULL,'2017-08-18',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (39,1,NULL,'2017-08-29',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (40,1,NULL,'2017-08-28',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (41,NULL,NULL,'2017-08-15',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (42,NULL,NULL,'2017-08-16',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (43,1,NULL,'2017-08-23',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (44,1,NULL,'2017-08-22',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (45,1,NULL,'2017-08-31',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (46,NULL,NULL,'2017-08-10',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (47,NULL,NULL,'2017-08-18',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (48,NULL,NULL,'2017-08-16',1,'null');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (49,NULL,NULL,'2017-08-21',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (50,NULL,NULL,'2017-08-29',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (51,NULL,NULL,'2017-08-19',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (52,NULL,NULL,'2017-08-21',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (53,NULL,NULL,'2017-08-21',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (54,NULL,NULL,'2017-08-21',1,'null');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (55,NULL,NULL,'2017-08-21',1,'null');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (56,NULL,NULL,'2017-08-21',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (57,NULL,NULL,'2017-08-22',1,'null');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (58,NULL,NULL,'2017-08-15',1,'maketobuy');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (59,NULL,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (60,NULL,NULL,'2017-08-22',1,'null');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (61,NULL,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (62,NULL,NULL,'2017-08-22',1,'null');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (63,NULL,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (64,NULL,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (65,NULL,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (66,NULL,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (67,NULL,NULL,'2017-08-22',1,'null');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (68,NULL,NULL,'2017-08-22',1,'maketostock');
insert  into `ordertable`(`order_id`,`customer_id`,`product_id`,`delivery_date`,`order_status`,`order_type`) values (69,NULL,NULL,'2017-08-09',1,'maketostock');

/*Table structure for table `ordertablesales` */

DROP TABLE IF EXISTS `ordertablesales`;

CREATE TABLE `ordertablesales` (
  `order_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_id` int(255) DEFAULT NULL,
  `delivery_date` varchar(255) DEFAULT NULL,
  `order_status` int(255) DEFAULT NULL,
  `ordercustomer` int(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `ordercustomer` (`ordercustomer`),
  CONSTRAINT `ordertablesales_ibfk_1` FOREIGN KEY (`ordercustomer`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordertablesales` */

/*Table structure for table `pakistan` */

DROP TABLE IF EXISTS `pakistan`;

CREATE TABLE `pakistan` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `pakistan` */

insert  into `pakistan`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);

/*Table structure for table `partialinventory` */

DROP TABLE IF EXISTS `partialinventory`;

CREATE TABLE `partialinventory` (
  `pInv_id` int(255) NOT NULL AUTO_INCREMENT,
  `m_no` int(255) DEFAULT NULL,
  `material_quantity` int(255) DEFAULT NULL,
  `b_id` int(255) DEFAULT NULL,
  `bin_id` int(255) DEFAULT NULL,
  `gr_no` int(255) DEFAULT NULL,
  `material_price` int(255) DEFAULT NULL,
  `dummy_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pInv_id`),
  KEY `bin_id` (`bin_id`),
  KEY `b_id` (`b_id`),
  KEY `gr_no` (`gr_no`),
  KEY `partialinventory_ibfk_2` (`m_no`),
  CONSTRAINT `partialinventory_ibfk_2` FOREIGN KEY (`m_no`) REFERENCES `material` (`m_no`),
  CONSTRAINT `partialinventory_ibfk_3` FOREIGN KEY (`bin_id`) REFERENCES `bin` (`bin_id`),
  CONSTRAINT `partialinventory_ibfk_4` FOREIGN KEY (`b_id`) REFERENCES `batch` (`b_id`),
  CONSTRAINT `partialinventory_ibfk_5` FOREIGN KEY (`gr_no`) REFERENCES `goodsrecipt` (`gr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

/*Data for the table `partialinventory` */

insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (46,2,0,1,2,2,400,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (47,3,0,4,5,3,400,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (48,3,0,2,4,5,99,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (49,3,0,5,4,11,450,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (50,2,0,5,4,11,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (51,2,0,5,4,11,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (52,2,0,5,4,12,400,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (53,2,0,5,4,12,400,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (54,2,0,5,4,12,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (55,2,0,4,4,12,400,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (56,2,0,5,4,12,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (57,2,0,5,4,12,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (58,2,0,5,4,12,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (59,2,0,5,4,14,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (60,2,0,4,3,17,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (61,5,2,5,4,18,500,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (62,2,0,5,4,18,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (63,5,2,5,4,19,500,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (64,2,0,5,4,19,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (65,2,0,4,3,21,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (66,5,2,5,4,23,500,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (67,2,0,5,4,24,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (68,3,0,5,4,25,54,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (69,3,0,5,4,26,54,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (70,3,0,5,4,27,54,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (71,2,0,5,4,27,120,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (72,3,0,5,4,28,3400,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (73,3,0,5,4,29,3400,NULL);
insert  into `partialinventory`(`pInv_id`,`m_no`,`material_quantity`,`b_id`,`bin_id`,`gr_no`,`material_price`,`dummy_name`) values (74,2,0,5,4,29,120,NULL);

/*Table structure for table `partialissues` */

DROP TABLE IF EXISTS `partialissues`;

CREATE TABLE `partialissues` (
  `p_issues_id` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) DEFAULT NULL,
  `pr_id` int(255) DEFAULT NULL,
  `pInv_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`p_issues_id`),
  KEY `partialissues_ibfk_2` (`order_id`),
  KEY `pr_id` (`pr_id`),
  KEY `pInv_id` (`pInv_id`),
  CONSTRAINT `partialissues_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ordertable` (`order_id`),
  CONSTRAINT `partialissues_ibfk_5` FOREIGN KEY (`pr_id`) REFERENCES `prtable` (`pr_id`),
  CONSTRAINT `partialissues_ibfk_6` FOREIGN KEY (`pInv_id`) REFERENCES `goodsrecipt` (`gr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

/*Data for the table `partialissues` */

insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (47,2,NULL,NULL);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (58,3,NULL,NULL);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (61,2,NULL,NULL);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (64,2,324,NULL);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (65,44,344,NULL);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (66,44,349,NULL);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (67,44,349,NULL);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (69,44,349,23);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (70,2,354,23);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (71,44,349,24);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (72,56,355,27);
insert  into `partialissues`(`p_issues_id`,`order_id`,`pr_id`,`pInv_id`) values (73,54,360,29);

/*Table structure for table `payable` */

DROP TABLE IF EXISTS `payable`;

CREATE TABLE `payable` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `payable` */

insert  into `payable`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);

/*Table structure for table `paymentrecipt` */

DROP TABLE IF EXISTS `paymentrecipt`;

CREATE TABLE `paymentrecipt` (
  `paymentNo` int(255) NOT NULL AUTO_INCREMENT,
  `invoiceNo` int(255) DEFAULT NULL,
  `paymentAmount` int(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paymentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `paymentrecipt` */

insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (1,12,222222,'26-07-2017','231');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (2,0,NULL,NULL,NULL);
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (3,2,9876,'25-07-2017','89');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (4,1,987,'09-07-2017','9');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (5,1,987,'09-07-2017','9');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (6,0,8776,'5-07-2017','65');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (7,4,987,'11-07-2017','87');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (8,1,987,'09-07-2017','9');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (9,1,987,'09-07-2017','2');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (10,1,987,'09-07-2017','9');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (11,4,987,'2017-02-12','87');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (12,4,987,'2017-02-12','87');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (13,3,8776,'2013-09-08','65');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (14,3,8776,'2018-09-9','65');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (15,3,5678,'2013-09-09','65');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (16,1,2290,'','44');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (17,6,5,'null','1');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (18,4,5,'null','MughalFloorMill');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (19,1,5,NULL,NULL);
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (20,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (21,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (22,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (23,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (24,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (25,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (26,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (27,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (28,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (29,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (30,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (31,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (32,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (33,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (34,4,7000,'-2017','4');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (35,7,115,'null','sahara textile');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (36,7,115,'null','sahara textile');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (37,10,115,'null','sahara textile');
insert  into `paymentrecipt`(`paymentNo`,`invoiceNo`,`paymentAmount`,`date`,`customerName`) values (38,6,10145,'null','waheed company');

/*Table structure for table `paymenttype` */

DROP TABLE IF EXISTS `paymenttype`;

CREATE TABLE `paymenttype` (
  `pt_id` int(255) NOT NULL AUTO_INCREMENT,
  `pt_credit_limit` int(255) DEFAULT NULL,
  `pt_collective_bill` int(255) DEFAULT NULL,
  `pt_bill_type` int(255) DEFAULT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paymenttype` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permission_name`) values (1,'masterdata');
insert  into `permission`(`id`,`permission_name`) values (2,'menu');
insert  into `permission`(`id`,`permission_name`) values (3,'report');
insert  into `permission`(`id`,`permission_name`) values (4,'todolist');
insert  into `permission`(`id`,`permission_name`) values (5,'dashboard');
insert  into `permission`(`id`,`permission_name`) values (6,'role');
insert  into `permission`(`id`,`permission_name`) values (7,'usersetting');
insert  into `permission`(`id`,`permission_name`) values (8,'inventory');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(255) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` int(255) DEFAULT NULL,
  `production_plant` varchar(255) DEFAULT NULL,
  `stroage_location` varchar(255) DEFAULT NULL,
  `material_group` int(255) DEFAULT NULL,
  `unit` int(255) DEFAULT NULL,
  `weight` int(255) DEFAULT NULL,
  `availability_check` int(255) DEFAULT NULL,
  `product_type_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `producttype` (`product_type_id`),
  CONSTRAINT `producttype` FOREIGN KEY (`product_type_id`) REFERENCES `producttype` (`product_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `product` */

insert  into `product`(`product_id`,`product_name`,`product_price`,`production_plant`,`stroage_location`,`material_group`,`unit`,`weight`,`availability_check`,`product_type_id`) values (1,'Cotton bales',900,NULL,NULL,NULL,NULL,8,NULL,2);
insert  into `product`(`product_id`,`product_name`,`product_price`,`production_plant`,`stroage_location`,`material_group`,`unit`,`weight`,`availability_check`,`product_type_id`) values (2,'oil',600,'jj','jj',0,8,8,NULL,3);
insert  into `product`(`product_id`,`product_name`,`product_price`,`production_plant`,`stroage_location`,`material_group`,`unit`,`weight`,`availability_check`,`product_type_id`) values (3,'maize',700,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `product`(`product_id`,`product_name`,`product_price`,`production_plant`,`stroage_location`,`material_group`,`unit`,`weight`,`availability_check`,`product_type_id`) values (4,'Lids',100,NULL,NULL,NULL,NULL,NULL,NULL,1);
insert  into `product`(`product_id`,`product_name`,`product_price`,`production_plant`,`stroage_location`,`material_group`,`unit`,`weight`,`availability_check`,`product_type_id`) values (5,'yarn',1200,NULL,NULL,NULL,NULL,NULL,NULL,2);
insert  into `product`(`product_id`,`product_name`,`product_price`,`production_plant`,`stroage_location`,`material_group`,`unit`,`weight`,`availability_check`,`product_type_id`) values (6,'cooking oil',150,NULL,NULL,NULL,NULL,NULL,NULL,3);
insert  into `product`(`product_id`,`product_name`,`product_price`,`production_plant`,`stroage_location`,`material_group`,`unit`,`weight`,`availability_check`,`product_type_id`) values (7,'margine',400,NULL,NULL,NULL,NULL,NULL,NULL,2);
insert  into `product`(`product_id`,`product_name`,`product_price`,`production_plant`,`stroage_location`,`material_group`,`unit`,`weight`,`availability_check`,`product_type_id`) values (8,'livestock feed',1100,NULL,NULL,NULL,NULL,NULL,NULL,3);

/*Table structure for table `productioninventory` */

DROP TABLE IF EXISTS `productioninventory`;

CREATE TABLE `productioninventory` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_qty` int(255) DEFAULT NULL,
  `order_no` int(255) DEFAULT NULL,
  `po_no` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `pi_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `po_no` (`po_no`),
  KEY `order_no` (`order_no`),
  CONSTRAINT `productioninventory_ibfk_1` FOREIGN KEY (`po_no`) REFERENCES `mainproduction` (`id`),
  CONSTRAINT `productioninventory_ibfk_2` FOREIGN KEY (`order_no`) REFERENCES `ordertable` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `productioninventory` */

insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (13,'oil',0,1,22,5,5);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (14,'mineral',200,2,23,300,NULL);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (15,'water',100,3,24,50,NULL);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (16,'data',100,4,26,NULL,NULL);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (17,'bonnet',2,44,48,120,NULL);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (18,'bread',30,44,48,90,1);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (19,'juice',0,56,NULL,NULL,7);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (20,'juice',0,56,NULL,NULL,8);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (21,'juice',0,NULL,NULL,NULL,9);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (22,'bread',2,22,NULL,NULL,10);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (23,'bread',2,45,NULL,NULL,11);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (25,'bread',2,2,NULL,NULL,13);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (26,'juice',0,2,NULL,NULL,13);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (27,'juice',0,56,NULL,NULL,14);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (28,'juice',0,56,NULL,NULL,15);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (30,'bales',-30,66,NULL,NULL,17);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (31,'Cotton bales',45,64,NULL,NULL,18);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (32,'Cotton bales',4,64,NULL,NULL,18);
insert  into `productioninventory`(`id`,`product_name`,`product_qty`,`order_no`,`po_no`,`price`,`pi_id`) values (33,'oil',0,64,NULL,NULL,18);

/*Table structure for table `productionorder` */

DROP TABLE IF EXISTS `productionorder`;

CREATE TABLE `productionorder` (
  `po_no` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) DEFAULT NULL,
  `po_quantity` int(255) DEFAULT NULL,
  `bm_id` int(255) DEFAULT NULL,
  `po_weight` int(255) DEFAULT NULL,
  `unit_id` int(255) DEFAULT NULL,
  `po_start_date` varchar(255) DEFAULT NULL,
  `po_end_date` varchar(255) DEFAULT NULL,
  `po_sell_doc` int(255) DEFAULT NULL,
  `po_lot_size` int(255) DEFAULT NULL,
  `po_plant` varchar(255) DEFAULT NULL,
  `pro_order_no` int(255) DEFAULT NULL,
  `po_mrp_area` varchar(255) DEFAULT NULL,
  `id` int(255) DEFAULT NULL,
  PRIMARY KEY (`po_no`),
  KEY `po_order_no` (`order_id`),
  KEY `bom_no` (`bm_id`),
  KEY `po_unit` (`unit_id`),
  KEY `po_type` (`pro_order_no`),
  KEY `productionorder_ibfk_4` (`id`),
  CONSTRAINT `productionorder_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ordertable` (`order_id`),
  CONSTRAINT `productionorder_ibfk_2` FOREIGN KEY (`bm_id`) REFERENCES `billofmaterial` (`bm_id`),
  CONSTRAINT `productionorder_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`),
  CONSTRAINT `productionorder_ibfk_4` FOREIGN KEY (`id`) REFERENCES `mainproduction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `productionorder` */

insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (1,1,5,1,56,NULL,'44','55',45,6,'5',5,'55',22);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (2,2,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (3,3,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (4,4,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (5,5,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (6,6,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (7,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (8,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (9,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (10,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (11,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (12,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (13,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (14,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (15,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (16,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,39);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (17,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (18,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,41);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (19,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,42);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (20,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,46);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (21,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,48);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (22,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (23,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (24,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,51);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (25,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (26,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,54);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (27,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,55);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (28,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,56);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (29,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,57);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (30,22,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (31,47,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (32,47,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (33,52,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (34,52,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,62);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (35,44,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,63);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (36,44,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,63);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (37,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,65);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (38,NULL,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,65);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (39,NULL,2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,66);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (40,NULL,45,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,67);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (41,NULL,50,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,67);
insert  into `productionorder`(`po_no`,`order_id`,`po_quantity`,`bm_id`,`po_weight`,`unit_id`,`po_start_date`,`po_end_date`,`po_sell_doc`,`po_lot_size`,`po_plant`,`pro_order_no`,`po_mrp_area`,`id`) values (42,NULL,20,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,67);

/*Table structure for table `productionordertype` */

DROP TABLE IF EXISTS `productionordertype`;

CREATE TABLE `productionordertype` (
  `pot_type_no` int(255) NOT NULL AUTO_INCREMENT,
  `pot_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pot_type_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productionordertype` */

/*Table structure for table `producttype` */

DROP TABLE IF EXISTS `producttype`;

CREATE TABLE `producttype` (
  `product_type_id` int(255) NOT NULL,
  `product_category_name` varchar(255) DEFAULT NULL,
  `allocation_no` int(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `producttype` */

insert  into `producttype`(`product_type_id`,`product_category_name`,`allocation_no`,`product_name`) values (1,'ele',0,'refreshment');
insert  into `producttype`(`product_type_id`,`product_category_name`,`allocation_no`,`product_name`) values (2,'hh',0,'textile');
insert  into `producttype`(`product_type_id`,`product_category_name`,`allocation_no`,`product_name`) values (3,'jjj',0,'oil');

/*Table structure for table `prtable` */

DROP TABLE IF EXISTS `prtable`;

CREATE TABLE `prtable` (
  `pr_id` int(255) NOT NULL AUTO_INCREMENT,
  `pro_oder_no` int(255) DEFAULT NULL,
  `po_no` int(255) DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  `payment_id` int(255) DEFAULT NULL,
  `vendor_id` int(255) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `Curent_date` date DEFAULT NULL,
  `partial_name` varchar(255) DEFAULT NULL,
  `order_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `po_no` (`po_no`),
  KEY `vendor_id` (`vendor_id`),
  KEY `prtable_ibfk_3` (`order_id`),
  CONSTRAINT `prtable_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  CONSTRAINT `prtable_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `ordertable` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=latin1;

/*Data for the table `prtable` */

insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (323,NULL,1,1,NULL,2,'2017-08-22',NULL,NULL,1);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (324,3,3,1,500,1,'2017-08-14','2017-08-11','name',2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (325,NULL,13,NULL,NULL,13,'2017-08-16','2017-08-08',NULL,8);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (326,NULL,13,NULL,NULL,13,'2017-08-16','2017-08-08',NULL,8);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (327,NULL,13,NULL,NULL,13,'2017-08-16','2017-08-08',NULL,8);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (328,NULL,13,NULL,NULL,13,'2017-08-16','2017-08-08',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (329,NULL,1,NULL,NULL,2,'2017-08-02','2017-08-29',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (330,NULL,2,NULL,NULL,10,'2017-08-10','2017-08-31',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (331,NULL,1,NULL,NULL,2,'2017-08-02','2017-08-29',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (332,NULL,2,NULL,NULL,2,'2017-08-09','2017-08-18',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (333,NULL,2,NULL,NULL,2,'2017-08-12','2017-08-26',NULL,1);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (334,NULL,2,NULL,NULL,10,'2017-08-23','2017-08-31',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (335,NULL,2,NULL,NULL,12,'2017-08-17','2017-08-24',NULL,3);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (336,NULL,2,NULL,NULL,2,'2017-08-04','2017-08-24',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (337,NULL,16,NULL,NULL,10,'2017-08-22','2017-08-30',NULL,34);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (338,NULL,1,NULL,NULL,10,'2017-08-18','2017-08-23',NULL,35);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (340,NULL,1,NULL,NULL,10,'2017-08-15','2017-08-15',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (343,NULL,48,NULL,NULL,10,'2017-08-23','2017-08-31',NULL,44);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (344,NULL,48,NULL,NULL,10,'2017-08-16','2017-08-16',NULL,44);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (345,NULL,1,NULL,NULL,10,'2017-08-18','2017-08-22',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (346,NULL,3,NULL,NULL,10,'2017-08-18','2017-08-18',NULL,44);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (347,NULL,57,NULL,NULL,10,'2017-08-19','2017-08-26',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (348,NULL,60,NULL,NULL,10,'2017-08-03','2017-08-19',NULL,22);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (349,NULL,14,NULL,NULL,10,'2017-08-20','2017-08-20',NULL,34);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (350,NULL,62,NULL,NULL,10,'2017-08-09','2017-08-21',NULL,52);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (351,NULL,2,NULL,NULL,10,'2017-08-14','2017-08-13',NULL,2);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (352,NULL,2,NULL,NULL,10,'2017-08-21','2017-08-28',NULL,44);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (353,NULL,2,NULL,NULL,10,'2017-08-28','2017-08-21',NULL,44);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (354,NULL,63,NULL,NULL,10,'2017-08-21','2017-08-20',NULL,44);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (355,NULL,64,NULL,NULL,10,'2017-08-14','2017-08-29',NULL,56);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (356,NULL,23,NULL,NULL,10,'2017-08-22','2017-08-22',NULL,44);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (357,NULL,66,NULL,NULL,10,'2017-08-08','2017-08-22',NULL,63);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (358,NULL,67,NULL,NULL,3,'2017-08-09','2017-08-31',NULL,64);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (359,NULL,67,NULL,NULL,10,'2017-08-23','2017-08-31',NULL,64);
insert  into `prtable`(`pr_id`,`pro_oder_no`,`po_no`,`active`,`payment_id`,`vendor_id`,`delivery_date`,`Curent_date`,`partial_name`,`order_id`) values (360,NULL,67,NULL,NULL,10,'2017-08-23','2017-08-31',NULL,64);

/*Table structure for table `purchases` */

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `purchases` */

insert  into `purchases`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);
insert  into `purchases`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (2,'JV#54',400,NULL,400,NULL);
insert  into `purchases`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (3,'JV#85',300,NULL,700,'2017-07-29');
insert  into `purchases`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (4,'JV#89',100,NULL,800,'2017-07-29');
insert  into `purchases`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (5,'JV#90',300,NULL,1100,'2017-07-22');
insert  into `purchases`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (6,'JV#102',181368,NULL,182468,'2017-08-17');
insert  into `purchases`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (7,'JV#103',10145,NULL,192613,'2017-08-16');

/*Table structure for table `purchasingrequsition` */

DROP TABLE IF EXISTS `purchasingrequsition`;

CREATE TABLE `purchasingrequsition` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `m_no` int(255) DEFAULT NULL,
  `pr_quantity` varchar(255) DEFAULT NULL,
  `total_sum` int(255) DEFAULT NULL,
  `pr_id` int(255) DEFAULT NULL,
  `material_price` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_no` (`m_no`),
  KEY `pr_id` (`pr_id`),
  CONSTRAINT `purchasingrequsition_ibfk_1` FOREIGN KEY (`m_no`) REFERENCES `material` (`m_no`),
  CONSTRAINT `purchasingrequsition_ibfk_2` FOREIGN KEY (`pr_id`) REFERENCES `prtable` (`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `purchasingrequsition` */

insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (1,2,'6',600,323,400);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (2,3,'7',300,324,450);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (3,2,'2',240,324,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (4,2,'2',240,324,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (5,5,'2',1000,335,500);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (6,2,'2',240,335,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (7,3,'4',216,336,54);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (8,2,'3',360,336,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (9,2,'1',120,338,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (10,2,'2',240,338,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (11,2,'2',240,340,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (12,2,'2',240,344,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (13,7,'2',66,345,33);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (14,2,'2',240,345,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (15,2,'2',240,346,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (16,2,'2',240,347,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (17,2,'10',1200,348,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (18,5,'2',1000,349,500);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (19,2,'2',240,349,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (20,2,'23',2760,350,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (21,3,'23',1242,350,54);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (22,2,'2',240,351,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (23,3,'4',216,351,54);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (24,3,'2',108,354,54);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (25,3,'2',108,355,54);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (26,2,'2',240,355,120);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (27,3,'2',6800,357,3400);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (28,3,'45',153000,360,3400);
insert  into `purchasingrequsition`(`id`,`m_no`,`pr_quantity`,`total_sum`,`pr_id`,`material_price`) values (29,2,'30',3600,360,120);

/*Table structure for table `recieve` */

DROP TABLE IF EXISTS `recieve`;

CREATE TABLE `recieve` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `recieve` */

insert  into `recieve`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`) values (1,NULL,NULL,NULL,1000);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `permission_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`id`,`role_name`,`permission_id`) values (1,'DataEntry',1);
insert  into `role`(`id`,`role_name`,`permission_id`) values (39,'DataEntry',2);
insert  into `role`(`id`,`role_name`,`permission_id`) values (40,'DataEntry',3);
insert  into `role`(`id`,`role_name`,`permission_id`) values (41,'DataEntry',1);
insert  into `role`(`id`,`role_name`,`permission_id`) values (42,'Admin ',1);
insert  into `role`(`id`,`role_name`,`permission_id`) values (43,'Admin',2);
insert  into `role`(`id`,`role_name`,`permission_id`) values (44,'Admin',3);
insert  into `role`(`id`,`role_name`,`permission_id`) values (45,'Admin',4);
insert  into `role`(`id`,`role_name`,`permission_id`) values (46,'Admin',5);
insert  into `role`(`id`,`role_name`,`permission_id`) values (47,'accountant',2);
insert  into `role`(`id`,`role_name`,`permission_id`) values (48,'accountant',4);
insert  into `role`(`id`,`role_name`,`permission_id`) values (49,'Admin',6);
insert  into `role`(`id`,`role_name`,`permission_id`) values (50,'Admin',7);
insert  into `role`(`id`,`role_name`,`permission_id`) values (51,'Admin',8);
insert  into `role`(`id`,`role_name`,`permission_id`) values (52,'Analyst',2);
insert  into `role`(`id`,`role_name`,`permission_id`) values (53,'Analyst',3);

/*Table structure for table `route` */

DROP TABLE IF EXISTS `route`;

CREATE TABLE `route` (
  `route_id` int(255) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `channel_id` int(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`route_id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `route` */

insert  into `route`(`route_id`,`description`,`channel_id`,`from`,`to`) values (1,'cotton',3,'dadu','khi');
insert  into `route`(`route_id`,`description`,`channel_id`,`from`,`to`) values (2,'floor',2,'dhk','khi');
insert  into `route`(`route_id`,`description`,`channel_id`,`from`,`to`) values (3,'1',1,'','');

/*Table structure for table `salaries` */

DROP TABLE IF EXISTS `salaries`;

CREATE TABLE `salaries` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `salaries` */

insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (2,'JV#54',300,NULL,300,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (3,NULL,200,NULL,500,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (4,NULL,200,NULL,700,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (5,'JV#57',400,NULL,1100,'2017-07-07');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (6,'JV#60',NULL,2000,3100,'2017-07-13');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (7,NULL,500,NULL,3600,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (8,NULL,2000,NULL,5600,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (9,NULL,20,NULL,5620,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (10,NULL,30,NULL,5650,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (11,'JV#61',2000,NULL,7650,'2017-07-29');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (12,'JV#62',300,NULL,7950,'2017-07-29');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (13,'JV#85',300,NULL,8250,'2017-07-29');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (14,'JV#86',100,NULL,8350,'2017-07-29');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (15,'JV#87',200,NULL,8550,'2017-07-15');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (16,'JV#88',100,NULL,8650,'2017-07-15');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (17,'JV#89',100,NULL,8750,'2017-07-29');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (18,'JV#90',300,NULL,9050,'2017-07-22');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (19,NULL,100,NULL,9150,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (20,NULL,200,NULL,9350,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (21,NULL,200,NULL,9550,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (22,NULL,200,NULL,9750,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (23,'JV#91',200,NULL,9950,'2017-07-31');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (24,'JV#91',200,NULL,10150,'2017-07-31');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (25,'JV#93',2000,NULL,12150,'2017-08-23');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (26,NULL,400,NULL,12550,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (27,'JV#94',2000,NULL,14550,'2017-08-17');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (28,'JV#95',2290,NULL,16840,'2017-08-21');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (29,'JV#98',124,NULL,16964,'2017-08-21');
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (30,NULL,5,NULL,16969,NULL);
insert  into `salaries`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (31,'JV#99',2000,NULL,18969,'2017-08-22');

/*Table structure for table `sale` */

DROP TABLE IF EXISTS `sale`;

CREATE TABLE `sale` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;

/*Data for the table `sale` */

insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (2,'JV#54',NULL,900,900,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (3,'JV#56',NULL,100,1000,'2017-07-08');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (13,NULL,NULL,400,1400,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (14,NULL,NULL,300,1700,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (15,NULL,NULL,1200,2900,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (16,NULL,NULL,100,3000,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (17,NULL,NULL,400,3400,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (18,'JV#58',NULL,200,3600,'2017-07-13');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (19,'JV#59',NULL,1000,4600,'2017-07-13');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (20,'JV#60',2000,NULL,6600,'2017-07-13');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (21,NULL,200,NULL,6800,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (22,NULL,NULL,2000,8800,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (23,NULL,NULL,200,9000,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (24,NULL,NULL,200,9200,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (25,NULL,NULL,200,9400,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (26,NULL,NULL,200,9600,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (27,NULL,NULL,200,9800,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (28,NULL,NULL,200,10000,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (29,NULL,NULL,200,10200,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (30,NULL,NULL,200,10400,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (31,NULL,NULL,200,10600,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (32,NULL,NULL,200,10800,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (33,NULL,NULL,200,11000,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (34,NULL,NULL,2000,13000,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (35,NULL,NULL,200,13200,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (36,NULL,NULL,200,13400,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (37,NULL,NULL,200,13600,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (38,NULL,NULL,200,13800,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (39,NULL,NULL,200,14000,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (40,NULL,NULL,400,14400,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (41,NULL,NULL,400,14800,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (42,NULL,NULL,200,15000,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (43,NULL,NULL,20,15020,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (44,NULL,NULL,20,15040,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (45,NULL,20,NULL,15060,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (46,NULL,NULL,40,15100,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (47,NULL,NULL,50,15150,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (48,NULL,NULL,60,15210,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (49,NULL,NULL,100,15310,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (50,NULL,NULL,200,15510,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (51,NULL,NULL,200,15710,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (52,NULL,NULL,20,15730,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (53,NULL,NULL,10,15740,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (54,NULL,NULL,30,15770,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (55,NULL,NULL,20,15790,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (56,NULL,NULL,40,15830,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (57,NULL,40,NULL,15870,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (58,NULL,NULL,80,15950,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (59,NULL,200,NULL,16150,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (60,NULL,100,NULL,16250,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (61,NULL,NULL,20,16270,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (62,NULL,NULL,50,16320,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (63,NULL,200,NULL,16520,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (64,'JV#91',NULL,400,16920,'2017-07-31');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (65,NULL,NULL,10000,26920,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (66,NULL,200,NULL,27120,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (67,'JV#92',NULL,2000,29120,'2017-08-10');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (68,'JV#93',NULL,4000,33120,'2017-08-23');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (69,NULL,NULL,2000,35120,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (70,NULL,200,NULL,35320,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (71,NULL,200,NULL,35520,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (72,NULL,2000,NULL,37520,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (73,NULL,275,NULL,37795,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (74,'JV#95',NULL,2290,40085,'2017-08-21');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (75,NULL,2000,NULL,42085,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (76,NULL,NULL,2000,44085,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (77,NULL,NULL,2000,46085,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (78,NULL,NULL,2000,48085,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (79,NULL,987,NULL,49072,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (80,NULL,200,NULL,49272,NULL);
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (81,'JV#96',2000,NULL,51272,'2017-08-23');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (82,'JV#97',1420,NULL,52692,'2017-08-21');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (83,'JV#99',NULL,2000,54692,'2017-08-22');
insert  into `sale`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (84,'JV#101',NULL,7786,62478,'2017-08-24');

/*Table structure for table `salestodolist` */

DROP TABLE IF EXISTS `salestodolist`;

CREATE TABLE `salestodolist` (
  `std_id` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) DEFAULT NULL,
  `active` int(4) DEFAULT NULL,
  PRIMARY KEY (`std_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `salestodolist` */

insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (1,34,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (2,35,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (3,41,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (4,42,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (5,44,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (6,45,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (7,47,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (8,51,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (9,52,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (10,56,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (11,63,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (12,64,0);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (13,65,1);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (14,66,1);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (15,68,1);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (16,69,1);
insert  into `salestodolist`(`std_id`,`order_id`,`active`) values (17,69,1);

/*Table structure for table `sellinvoice` */

DROP TABLE IF EXISTS `sellinvoice`;

CREATE TABLE `sellinvoice` (
  `productName` varchar(255) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `dId` int(255) DEFAULT NULL,
  `sInvoiceId` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sInvoiceId`),
  KEY `dId` (`dId`),
  CONSTRAINT `sellinvoice_ibfk_1` FOREIGN KEY (`dId`) REFERENCES `orderinvoice` (`oInviceId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `sellinvoice` */

insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('ddd',4,222,1,22);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('mob',110,333,2,23);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('ddd',4,222,3,24);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('mob',110,333,4,25);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('mob',11,333,4,31);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('ddd',4,222,4,32);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('mob',99,333,4,33);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('mob',4,333,6,34);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('juice',2,20,6,35);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('oil',10,20,6,36);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('oil',4,3,6,37);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('oil',4,3,6,38);
insert  into `sellinvoice`(`productName`,`quantity`,`price`,`dId`,`sInvoiceId`) values ('oil',4,3,6,39);

/*Table structure for table `shafqat` */

DROP TABLE IF EXISTS `shafqat`;

CREATE TABLE `shafqat` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `Branch_no` int(255) DEFAULT NULL,
  `Branch_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shafqat` */

/*Table structure for table `submts` */

DROP TABLE IF EXISTS `submts`;

CREATE TABLE `submts` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `mtbId` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtbId` (`mtbId`),
  CONSTRAINT `submts_ibfk_1` FOREIGN KEY (`mtbId`) REFERENCES `mtsmain` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `submts` */

insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (1,'oil',2,4,11);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (2,'oil',2,4,2);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (3,'oil',10,4,2);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (4,'oil',10,5,2);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (5,'oil',20,6,2);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (6,'oil',10,7,20);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (7,'oil',10,8,2);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (8,'oil',10,9,200);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (9,'oil',10,10,2);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (10,'oil',0,11,0);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (11,'oil',0,12,3);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (12,'oil',2,13,0);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (13,'oil',3,14,0);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (14,'oil',2,15,0);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (15,'oil',2,16,1000);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (16,'oil',4,17,3);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (17,'oil',10,18,200);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (18,'oil',2,19,20);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (19,'oil',2,20,200);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (20,'oil',2,21,0);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (21,'oil',10,22,200);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (22,'oil',30,23,5);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (23,'bread',10,24,90);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (24,'oil',10,24,5);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (25,'juice',2,25,2);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (26,'bales',2,26,900);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (27,'oil',20,27,5);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (28,'bales',30,28,900);
insert  into `submts`(`id`,`product_name`,`quantity`,`mtbId`,`price`) values (29,'oil',4,28,300);

/*Table structure for table `suborder` */

DROP TABLE IF EXISTS `suborder`;

CREATE TABLE `suborder` (
  `sub_order_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_no` int(255) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `order_id` int(255) DEFAULT NULL,
  `product_id` int(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `route_id` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `d_id` int(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sub_order_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `route_id` (`route_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `suborder_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `ordertable` (`order_id`),
  CONSTRAINT `suborder_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `suborder_ibfk_3` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`),
  CONSTRAINT `suborder_ibfk_4` FOREIGN KEY (`d_id`) REFERENCES `delevery` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

/*Data for the table `suborder` */

insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (1,2,0,1,1,'mob',NULL,333,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (2,33,4,2,2,'ddd',NULL,222,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (3,NULL,0,3,1,'mob',NULL,333,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (4,699,-1850,1,NULL,'oil',NULL,500,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (5,1,0,NULL,NULL,'sss',NULL,22,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (6,1,0,NULL,NULL,'sss',NULL,22,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (7,1,0,NULL,NULL,'sss',NULL,22,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (8,1,0,NULL,NULL,'sss',NULL,22,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (9,1,0,NULL,NULL,'sss',NULL,22,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (10,NULL,2,NULL,NULL,'juice',NULL,3000,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (11,NULL,0,NULL,NULL,'mob',NULL,333,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (12,3,3,NULL,NULL,'32',NULL,1,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (13,NULL,3,33,NULL,'1',NULL,40,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (14,NULL,0,34,NULL,'2',NULL,3,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (15,NULL,0,34,NULL,'2',NULL,3,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (16,NULL,45,35,NULL,'3',NULL,10,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (17,NULL,0,35,NULL,'2',NULL,30,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (18,NULL,2,NULL,NULL,'juice',NULL,20,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (19,NULL,0,NULL,NULL,'mob',NULL,333,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (20,NULL,2,NULL,NULL,'sss',NULL,22,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (21,NULL,0,NULL,NULL,'mob',NULL,333,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (22,NULL,2,NULL,NULL,'juice',NULL,2,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (23,NULL,0,NULL,NULL,'mob',NULL,333,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (24,NULL,1,NULL,NULL,'bread',NULL,2,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (25,NULL,40,NULL,NULL,'2',NULL,30,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (26,NULL,2,NULL,NULL,'juice',NULL,20,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (27,NULL,0,NULL,NULL,'mob',NULL,333,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (28,NULL,2,NULL,NULL,'juice',NULL,20,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (29,NULL,0,NULL,NULL,'mob',NULL,333,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (30,NULL,2,38,NULL,'juice',NULL,200,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (31,NULL,0,38,NULL,'mob',NULL,333,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (32,NULL,2,40,NULL,'juice',NULL,20,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (33,NULL,4,40,NULL,'mob',NULL,333,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (34,NULL,2,41,NULL,'1',NULL,20,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (35,NULL,2,42,NULL,'2',NULL,20,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (36,NULL,2,42,NULL,'1',NULL,20,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (37,NULL,2,42,NULL,'juice',NULL,44,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (38,NULL,10,42,NULL,'oil',NULL,200,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (39,NULL,2,43,NULL,'juice',NULL,20,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (40,NULL,10,43,NULL,'oil',NULL,2,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (41,NULL,2,44,NULL,'bread',NULL,20,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (42,NULL,10,44,NULL,'oil',NULL,1,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (43,NULL,20,45,NULL,'juice',NULL,10,NULL,'Production');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (44,NULL,9,45,NULL,'oil',NULL,20,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (45,NULL,10,47,NULL,'oil',NULL,20,NULL,'inventory');
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (46,NULL,2,51,NULL,'1',NULL,22,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (47,NULL,2,52,NULL,'1',NULL,23,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (48,NULL,34,56,NULL,'2',NULL,30,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (49,NULL,2,56,NULL,'1',NULL,3,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (50,NULL,2,63,NULL,'bales',NULL,122,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (51,NULL,2,64,NULL,'bales',NULL,30,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (52,NULL,2,65,NULL,'bales',NULL,30,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (53,NULL,2,66,NULL,'bales',NULL,300,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (54,NULL,2,68,NULL,'bales',NULL,30,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (55,NULL,3,69,NULL,'oil',NULL,40,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (56,NULL,45,69,NULL,'yarn',NULL,300,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (57,NULL,10,69,NULL,'oil',NULL,800,NULL,NULL);
insert  into `suborder`(`sub_order_id`,`customer_no`,`quantity`,`order_id`,`product_id`,`product_name`,`route_id`,`price`,`d_id`,`type`) values (58,NULL,20,69,NULL,'Cotton bales',NULL,900,NULL,NULL);

/*Table structure for table `todolist` */

DROP TABLE IF EXISTS `todolist`;

CREATE TABLE `todolist` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `vendor` varchar(255) DEFAULT NULL,
  `amount` int(255) DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  `pr_id` int(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `todolist` */

insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (1,'aamir',2000,0,23,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (2,'hamza',2000,0,22,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (3,'al',200,1,22,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (4,'hamza',200,0,2,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (5,'ali',3000,2,2,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (6,NULL,0,0,32,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (7,NULL,0,0,32,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (8,NULL,0,0,32,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (9,NULL,400,0,323,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (10,'akeel',120,0,324,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (11,'akeel',120,0,324,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (12,'87',987,0,4,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (13,'65',5678,0,3,'sale');
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (14,'',NULL,NULL,NULL,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (15,'akeel',275,0,344,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (16,'akeel',275,0,344,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (17,'44',2290,0,1,'sale');
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (18,'akeel',1420,0,349,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (19,'akeel',1420,0,349,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (20,'akeel',275,0,345,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (21,'akeel',1145,0,349,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (22,'akeel',275,0,349,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (23,'akeel',124,0,354,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (24,'akeel',124,0,354,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (25,'akeel',398,0,355,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (26,'1',5,0,6,'sale');
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (27,'MughalFloorMill',5,0,4,'sale');
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (28,'akeel',7786,0,357,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (29,'sahara textile',115,1,7,'sale');
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (30,'akeel',181368,0,360,NULL);
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (31,'sahara textile',115,1,10,'sale');
insert  into `todolist`(`id`,`vendor`,`amount`,`active`,`pr_id`,`type`) values (32,'waheed company',10145,0,6,'sale');

/*Table structure for table `trail` */

DROP TABLE IF EXISTS `trail`;

CREATE TABLE `trail` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_no` int(255) DEFAULT NULL,
  `ac_name` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `trail` */

insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (7,144,'capital',NULL,9000);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (8,145,'cash',25180,NULL);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (9,146,'sale',-19380,-52380);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (10,147,'salary',3000,NULL);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (11,148,'electricity',3200,NULL);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (12,148,'transaction',NULL,200000);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (13,150,'expn',0,NULL);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (14,158,'saless',20000,NULL);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (15,200,'cashaccount',10720,NULL);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (16,200,'AccountRecieveable',-3600,NULL);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (17,201,'AccountPayable',NULL,-2000);
insert  into `trail`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`) values (22,6419,'liaquat ',1380,NULL);

/*Table structure for table `trailbalance` */

DROP TABLE IF EXISTS `trailbalance`;

CREATE TABLE `trailbalance` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_no` int(255) DEFAULT NULL,
  `ac_name` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `gl_no` int(255) DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gl_no` (`gl_no`),
  CONSTRAINT `trailbalance_ibfk_1` FOREIGN KEY (`gl_no`) REFERENCES `generalledgerlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

/*Data for the table `trailbalance` */

insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (30,144,'capitals',NULL,2424,155,NULL);
insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (31,146,'sale',49272,62478,156,NULL);
insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (33,147,'AccountPayable',NULL,600,157,NULL);
insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (34,312,'salaries',18969,NULL,159,NULL);
insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (35,313,'purchases',192613,NULL,160,NULL);
insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (37,314,'cash',227168,NULL,162,NULL);
insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (38,315,'utilityexpenses',2800,NULL,163,NULL);
insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (39,316,'AccountRecieveable',700,NULL,167,NULL);
insert  into `trailbalance`(`id`,`ac_no`,`ac_name`,`Debit`,`Credit`,`gl_no`,`active`) values (41,4414,'asad',0,NULL,169,NULL);

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `unit_id` int(255) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) DEFAULT NULL,
  `unit` int(255) DEFAULT NULL,
  PRIMARY KEY (`unit_id`),
  KEY `unit_fk` (`unit`),
  CONSTRAINT `unit_fk` FOREIGN KEY (`unit`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `units` */

/*Table structure for table `utilityexpenses` */

DROP TABLE IF EXISTS `utilityexpenses`;

CREATE TABLE `utilityexpenses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `ac_title` varchar(255) DEFAULT NULL,
  `Debit` int(255) DEFAULT NULL,
  `Credit` int(255) DEFAULT NULL,
  `Balance` int(255) DEFAULT NULL,
  `tr_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `utilityexpenses` */

insert  into `utilityexpenses`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (1,NULL,NULL,NULL,0,NULL);
insert  into `utilityexpenses`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (2,'JV#54',200,NULL,200,NULL);
insert  into `utilityexpenses`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (3,NULL,2000,NULL,2200,NULL);
insert  into `utilityexpenses`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (4,'JV#85',300,NULL,2500,'2017-07-29');
insert  into `utilityexpenses`(`id`,`ac_title`,`Debit`,`Credit`,`Balance`,`tr_date`) values (5,'JV#90',300,NULL,2800,'2017-07-22');

/*Table structure for table `vechile` */

DROP TABLE IF EXISTS `vechile`;

CREATE TABLE `vechile` (
  `v_id` int(255) NOT NULL AUTO_INCREMENT,
  `v_no` int(255) DEFAULT NULL,
  `v_description` varchar(255) DEFAULT NULL,
  `v_owner` varchar(255) DEFAULT NULL,
  `vt_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`v_id`),
  KEY `v_type` (`vt_id`),
  CONSTRAINT `vechile_ibfk_1` FOREIGN KEY (`vt_id`) REFERENCES `vechiletype` (`vt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vechile` */

/*Table structure for table `vechiletype` */

DROP TABLE IF EXISTS `vechiletype`;

CREATE TABLE `vechiletype` (
  `vt_id` int(255) NOT NULL AUTO_INCREMENT,
  `vt_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vechiletype` */

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `vendor_id` int(255) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(255) DEFAULT NULL,
  `company_title` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `contact_number` int(255) DEFAULT NULL,
  `mobile_number` int(255) DEFAULT NULL,
  `ntn_number` int(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account` int(255) DEFAULT NULL,
  `active` int(255) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `vendor` */

insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (1,'akeel','bouk','my banl',30,40,4,NULL,NULL,0);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (2,'khan','ms','pakistan',222,222,221,'alfalah',34,1);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (3,'ali','hassan','khan',8,9,0,'meeza',0,1);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (4,'hussain','ali','pathan',8,9,0,'meezan',0,1);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (5,'saen','ali','khan',8,9,0,'meeza',0,1);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (6,'amir','ali','khan',8,9,0,'meeza',0,0);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (7,'hhhhh','ali','khan',8,9,0,'meeza',1,1);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (8,'jjjjjjjjjj','ali','khan',8,9,0,'meezan',88,0);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (9,'hh','hhh','kkk',77,8,9,'bank',99,1);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (10,'akeel','undefined','undefined',0,0,0,'undefined',0,0);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (11,'Q','Q mobile','larkana',45,92,454,'UBL',234,0);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (12,'amir','Erp','karachi',22,55,44,'Meezan',10001,1);
insert  into `vendor`(`vendor_id`,`vendor_name`,`company_title`,`company_address`,`contact_number`,`mobile_number`,`ntn_number`,`bank_name`,`bank_account`,`active`) values (13,'murtaza','murtaza','pak',345678956,3456789,98765,'alfalah',456789,1);

/*Table structure for table `vendoraccount` */

DROP TABLE IF EXISTS `vendoraccount`;

CREATE TABLE `vendoraccount` (
  `account_id` int(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_no` int(255) DEFAULT NULL,
  `vendor_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `ven_id` (`vendor_id`),
  CONSTRAINT `ven_id` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vendoraccount` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
