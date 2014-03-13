/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-03-13 21:08:42
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
INSERT INTO `overtime` VALUES ('30', '163', '8/1/2014', '6', 'test', 'Denied');

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
INSERT INTO `pto` VALUES ('5', '163', '21/4/2013', '21/4/2013', '', 'Approved');
INSERT INTO `pto` VALUES ('6', '163', '19/4/2013', '19/4/2013', '', 'Approved');
INSERT INTO `pto` VALUES ('7', '163', '21/4/2013', '22/4/2013', '', 'Denied');
INSERT INTO `pto` VALUES ('10', '163', '10/7/2013', '11/7/2013', 'yr', 'Approved');
INSERT INTO `pto` VALUES ('11', '163', '15/1/2014', '15/1/2014', 'test', 'Approved');
INSERT INTO `pto` VALUES ('12', '163', '7/3/2014', '9/3/2014', 'mata', 'Denied');

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
) ENGINE=InnoDB AUTO_INCREMENT=941 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('816', '3', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('817', '4', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('821', '3', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('822', '4', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('823', '5', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('824', '6', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('825', '7', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('827', '9', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('828', '10', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('829', '11', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('830', '12', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('831', '13', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('833', '15', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('835', '17', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('836', '18', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('837', '19', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('838', '20', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('839', '21', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('840', '22', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('841', '23', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('842', '24', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('843', '25', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('844', '26', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('845', '27', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('846', '28', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('847', '29', '3', '2014', 'Savulescu Adrian', '4 Graveyard shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('852', '5', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('853', '6', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('854', '7', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('855', '8', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('856', '9', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('857', '10', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('858', '11', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('859', '12', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('860', '13', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('861', '14', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('862', '15', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('863', '16', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('864', '17', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('865', '18', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('866', '19', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('867', '20', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('868', '21', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('869', '22', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('870', '23', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('871', '24', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('872', '25', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('873', '26', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('874', '27', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('875', '28', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('876', '29', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('877', '30', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('878', '31', '3', '2014', 'Savulescu Adrian', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('881', '3', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('882', '4', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('883', '5', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('884', '6', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('885', '7', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('886', '8', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('887', '9', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('888', '10', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('889', '11', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('890', '12', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('891', '13', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('892', '14', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('893', '15', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('894', '16', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('895', '17', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('896', '18', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('897', '19', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('898', '20', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('899', '21', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('900', '22', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('901', '23', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('902', '24', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('903', '25', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('904', '26', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('905', '27', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('906', '28', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('907', '29', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('908', '30', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('909', '31', '3', '2014', 'teo', '1 Morning shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('910', '1', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('911', '2', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('912', '3', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('913', '4', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('914', '5', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('915', '6', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('916', '7', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('917', '8', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('918', '9', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('919', '10', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('920', '11', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('921', '12', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('922', '13', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('923', '14', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('924', '15', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('925', '16', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('928', '19', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('929', '20', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('930', '21', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('931', '22', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('932', '23', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('933', '24', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('934', '25', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('935', '26', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('936', '27', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('937', '28', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('938', '29', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('939', '30', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('940', '31', '3', '2014', 'teo', '3 Night shift', 'RPM GOC');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shifts
-- ----------------------------
INSERT INTO `shifts` VALUES ('9', '1 Morning shift', '07:00AM to 4:00PM', '1');
INSERT INTO `shifts` VALUES ('10', '2 Day shift', '10:00AM to 7:00PM', '1');
INSERT INTO `shifts` VALUES ('11', '3 Night shift', '7:00PM to 4:00AM', '1');
INSERT INTO `shifts` VALUES ('12', '4 Graveyard shift', '10:00PM to 7:00AM', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('162', 'goc', 'erttre', '0/1', '0', '1', '#000000');
INSERT INTO `users` VALUES ('163', 'Savulescu Adrian', 'asavulescu', '0/1', '1', '1', '#ff8040');
INSERT INTO `users` VALUES ('167', 'teo', 'teo', '0/1', '1', '1', '#96fb84');

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
