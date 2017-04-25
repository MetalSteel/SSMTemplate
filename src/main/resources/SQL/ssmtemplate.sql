/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.23-log : Database - ssmtemplate
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmtemplate` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssmtemplate`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `account` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `mark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`account`,`password`,`mark`) values (1,'root','123456','超级管理员');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(24) NOT NULL COMMENT '姓名',
  `sex` char(8) NOT NULL COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '生日',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `mark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`id`,`name`,`sex`,`age`,`birthday`,`address`,`mark`) values (1,'王刚','男',22,'2017-04-22 14:08:54','山东省','超级管理员'),(2,'刘备','男',35,'2017-04-22 00:00:00','安徽省','汉中王1'),(3,'孙尚香','女',23,'2016-06-06 14:09:11','苏州市','刘备老婆/孙权妹妹'),(4,'关羽','男',34,'2017-04-22 15:16:42','陕西省','大将军'),(6,'赵云','男',28,'1994-04-01 00:00:00','辽宁省','骠骑大将军'),(7,'马超','男',33,'2017-04-06 00:00:00','甘肃省','锦衣大将军'),(8,'魏延','男',33,'2017-04-08 00:00:00','蜀国','不可重用'),(9,'关平','男',44,'2017-04-12 00:00:00','蜀国','关羽的儿子'),(10,'关索','男',22,'2017-04-11 00:00:00','蜀国','关羽的亲儿子'),(11,'曹操','男',22,'2017-04-11 00:00:00','魏国','厉害'),(12,'夏侯渊','男',55,'2017-04-06 00:00:00','魏国','曹操的亲戚'),(13,'阿斗','男',33,'2017-04-07 00:00:00','四川','刘备的儿子，被摔傻'),(14,'貂蝉','女',22,'2017-04-19 00:00:00','三国','三国美女'),(15,'孙权','男',44,'2017-04-13 00:00:00','吴国','吴国的老大'),(16,'盖伦','男',22,'2017-04-06 00:00:00','LOL','大保健'),(18,'剑圣','男',33,'2017-04-03 00:00:00','英雄联盟','你的剑就是我的剑');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
