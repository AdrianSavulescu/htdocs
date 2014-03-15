/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-03-15 05:31:34
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `departments`
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', 'RPM GOC');
INSERT INTO `departments` VALUES ('2', 'RPM SSP');

-- ----------------------------
-- Table structure for `overtime`
-- ----------------------------
DROP TABLE IF EXISTS `overtime`;
CREATE TABLE `overtime` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `hours` int(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of overtime
-- ----------------------------

-- ----------------------------
-- Table structure for `pto`
-- ----------------------------
DROP TABLE IF EXISTS `pto`;
CREATE TABLE `pto` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) DEFAULT NULL,
  `date_from` varchar(255) DEFAULT NULL,
  `date_to` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pto
-- ----------------------------

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `day` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `shift` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1432 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('1360', '17', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1361', '18', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1362', '19', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1363', '20', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1364', '21', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1365', '22', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1366', '23', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1367', '24', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1368', '25', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1369', '26', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1370', '27', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1371', '28', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1372', '29', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1373', '30', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1374', '31', '3', '2014', 'Savulescu Adrian', '1st Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1391', '17', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1392', '18', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1393', '19', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1394', '20', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1395', '21', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1396', '22', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1397', '23', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1398', '24', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1399', '25', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1400', '26', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1401', '27', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1402', '28', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1403', '29', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1404', '30', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1405', '31', '3', '2014', 'Savulescu Adrian', '3rd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1406', '1', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1407', '2', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1408', '3', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1409', '4', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1410', '5', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1411', '6', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1412', '7', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1413', '8', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1414', '9', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1415', '10', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1416', '11', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1417', '12', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1418', '13', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1419', '14', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1420', '15', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1421', '16', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1422', '17', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1423', '18', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1424', '19', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1425', '20', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1426', '21', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1427', '22', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1428', '23', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1429', '24', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1430', '25', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1431', '26', '3', '2014', 'Savulescu Adrian', '2nd Shift', 'RPM GOC');

-- ----------------------------
-- Table structure for `shifts`
-- ----------------------------
DROP TABLE IF EXISTS `shifts`;
CREATE TABLE `shifts` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `department_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shifts
-- ----------------------------
INSERT INTO `shifts` VALUES ('13', '1st Shift', 'from 7AM to 4PM', '2');
INSERT INTO `shifts` VALUES ('14', '2nd Shift', 'from 10AM to 7PM', '1');
INSERT INTO `shifts` VALUES ('15', '3rd Shift', 'from 7PM to 4AM', '1');
INSERT INTO `shifts` VALUES ('16', '4th Shift', 'from 10PM to 7AM', '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `weekend_days` varchar(255) NOT NULL,
  `department_id` int(255) NOT NULL,
  `admin` tinyint(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Savulescu Adrian', 'asavulescu@ea.com', '0/2', '1', '1', '#aef596');
INSERT INTO `users` VALUES ('168', 'Alin Patulea', 'alpatulea', '4/5', '1', '0', '#4aa85a');
INSERT INTO `users` VALUES ('169', 'Andreea Ifrim', 'aifrim@ea.com', '4/5', '1', '0', '#b8e12b');
INSERT INTO `users` VALUES ('170', 'Ionut Toma', 'itoma@ea.com', '0/1', '1', '1', '#d387fc');
INSERT INTO `users` VALUES ('171', 'Andrei Gheorghe', 'angheorghe@ea.com', '5/6', '1', '0', '#6f9d7c');
INSERT INTO `users` VALUES ('172', 'Petru Burca', 'pburca@ea.com', '0/1', '1', '0', '#baad83');
INSERT INTO `users` VALUES ('173', 'Vlasceanu Florin', 'fvlasceanu@ea.com', '0/6', '1', '0', '#a8c4aa');
INSERT INTO `users` VALUES ('174', 'Florescu Bogdan', 'bflorescu@ea.com', '4/5', '1', '0', '#a89e82');
INSERT INTO `users` VALUES ('175', 'Chiriac Alexandru', 'achiriac@ea.com', '4/5', '1', '0', '#c6978e');
INSERT INTO `users` VALUES ('176', 'Ana Constantin', 'coana@ea.com', '4/5', '1', '0', '#aaab92');
INSERT INTO `users` VALUES ('177', 'Iancu Alexandru', 'aliancu@ea.com', '4/5', '1', '0', '#a9a6d7');
INSERT INTO `users` VALUES ('178', 'Andreea Custura', 'acustura@ea.com', '5/6', '1', '0', '#edd68f');

-- ----------------------------
-- Table structure for `users_session`
-- ----------------------------
DROP TABLE IF EXISTS `users_session`;
CREATE TABLE `users_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_session
-- ----------------------------
INSERT INTO `users_session` VALUES ('9', '22', 'cfff0ba656f504b9085e31ba66fa5cae0f74224e1a6929ea9d169ba4829dd393');
INSERT INTO `users_session` VALUES ('10', '143', '45e7daca30fdfe8818423fa7618c7909d83058a41290ef50c240bc5141577a4c');

-- ----------------------------
-- Table structure for `vouchers`
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_id` int(50) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `returned` varchar(255) DEFAULT NULL,
  `sent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vouchers
-- ----------------------------
INSERT INTO `vouchers` VALUES ('11', '1', 'ear', '123123', 'Yes', 'Yes');
