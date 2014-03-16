/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-03-16 03:56:08
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of overtime
-- ----------------------------
INSERT INTO `overtime` VALUES ('32', '1', '1/3/2014', '8', '132', 'Sent');
INSERT INTO `overtime` VALUES ('33', '1', '1/3/2014', '8', '123', 'Sent');
INSERT INTO `overtime` VALUES ('34', '1', '15/3/2014', '8', '12', 'Sent');
INSERT INTO `overtime` VALUES ('35', '1', '1/3/2014', '12', 'test', 'Pending');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pto
-- ----------------------------
INSERT INTO `pto` VALUES ('14', '1', '1/3/2014', '31/3/2014', 'testest', 'Denied');
INSERT INTO `pto` VALUES ('15', '1', '2/3/2014', '16/3/2014', 'test', 'Approved');
INSERT INTO `pto` VALUES ('16', '178', '1/3/2014', '1/3/2014', 'test', 'Approved');
INSERT INTO `pto` VALUES ('18', '168', '15/3/2014', '23/3/2014', 'test', 'Pending');
INSERT INTO `pto` VALUES ('19', '1', '15/3/2014', '15/3/2014', 'test', 'Pending');

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
) ENGINE=InnoDB AUTO_INCREMENT=2119 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('1716', '1', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1717', '2', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1718', '3', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1719', '4', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1720', '5', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1721', '6', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1722', '7', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1723', '8', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1724', '9', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1725', '10', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1726', '11', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1727', '12', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1728', '13', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1729', '14', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1730', '15', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1731', '16', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1732', '17', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1733', '18', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1734', '19', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1735', '20', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1736', '21', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1737', '22', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1738', '23', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1739', '24', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1740', '25', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1741', '26', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1742', '27', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1743', '28', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1744', '29', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1745', '30', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1746', '31', '3', '2014', 'Savulescu Adrian', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1747', '1', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1748', '2', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1749', '3', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1750', '4', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1751', '5', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1752', '6', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1753', '7', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1754', '8', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1755', '9', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1756', '10', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1757', '11', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1758', '12', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1759', '13', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1760', '14', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1761', '15', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1762', '16', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1763', '17', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1764', '18', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1765', '19', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1766', '20', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1767', '21', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1768', '22', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1769', '23', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1770', '24', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1771', '25', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1772', '26', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1773', '27', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1774', '28', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1775', '29', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1776', '30', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1777', '31', '3', '2014', 'Andrei Gheorghe', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1778', '1', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1779', '2', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1780', '3', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1781', '4', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1782', '5', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1783', '6', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1784', '7', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1785', '8', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1786', '9', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1787', '10', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1788', '11', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1789', '12', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1790', '13', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1791', '14', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1792', '15', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1793', '16', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1794', '17', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1795', '18', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1796', '19', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1797', '20', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1798', '21', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1799', '22', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1800', '23', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1801', '24', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1802', '25', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1803', '26', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1804', '27', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1805', '28', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1806', '29', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1807', '30', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1808', '31', '3', '2014', 'Petru Burca', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1809', '1', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1810', '2', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1811', '3', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1812', '4', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1813', '5', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1814', '6', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1815', '7', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1816', '8', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1817', '9', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1818', '10', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1819', '11', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1820', '12', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1821', '13', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1822', '14', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1823', '15', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1824', '16', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1825', '17', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1826', '18', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1827', '19', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1828', '20', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1829', '21', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1830', '22', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1831', '23', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1832', '24', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1833', '25', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1834', '26', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1835', '27', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1836', '28', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1837', '29', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1838', '30', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1839', '31', '3', '2014', 'Vlasceanu Florin', '1 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1840', '1', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1841', '2', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1842', '3', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1843', '4', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1844', '5', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1845', '6', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1846', '7', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1847', '8', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1848', '9', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1849', '10', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1850', '11', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1851', '12', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1852', '13', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1853', '14', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1854', '15', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1855', '16', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1856', '17', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1857', '18', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1858', '19', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1859', '20', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1860', '21', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1861', '22', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1862', '23', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1863', '24', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1864', '25', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1865', '26', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1866', '27', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1867', '28', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1868', '29', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1869', '30', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1870', '31', '3', '2014', 'Florescu Bogdan', '2 ssp shift', 'RPM SSP');
INSERT INTO `schedule` VALUES ('1871', '1', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1872', '2', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1873', '3', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1874', '4', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1875', '5', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1876', '6', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1877', '7', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1878', '8', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1879', '9', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1880', '10', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1881', '11', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1882', '12', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1883', '13', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1884', '14', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1885', '15', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1886', '16', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1887', '17', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1888', '18', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1889', '19', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1890', '20', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1891', '21', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1892', '22', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1893', '23', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1894', '24', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1895', '25', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1896', '26', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1897', '27', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1898', '28', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1899', '29', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1900', '30', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1901', '31', '3', '2014', 'Savulescu Adrian', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1902', '1', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1903', '2', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1904', '3', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1905', '4', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1906', '5', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1907', '6', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1908', '7', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1909', '8', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1910', '9', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1911', '10', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1912', '11', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1913', '12', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1914', '13', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1915', '14', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1916', '15', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1917', '16', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1918', '17', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1919', '18', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1920', '19', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1921', '20', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1922', '21', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1923', '22', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1924', '23', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1925', '24', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1926', '25', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1927', '26', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1928', '27', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1929', '28', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1930', '29', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1931', '30', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1932', '31', '3', '2014', 'Alin Patulea', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1933', '1', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1934', '2', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1935', '3', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1936', '4', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1937', '5', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1938', '6', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1939', '7', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1940', '8', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1941', '9', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1942', '10', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1943', '11', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1944', '12', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1945', '13', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1946', '14', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1947', '15', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1948', '16', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1949', '17', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1950', '18', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1951', '19', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1952', '20', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1953', '21', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1954', '22', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1955', '23', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1956', '24', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1957', '25', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1958', '26', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1959', '27', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1960', '28', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1961', '29', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1962', '30', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1963', '31', '3', '2014', 'Andreea Ifrim', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1964', '1', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1965', '2', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1966', '3', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1967', '4', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1968', '5', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1969', '6', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1970', '7', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1971', '8', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1972', '9', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1973', '10', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1974', '11', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1975', '12', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1976', '13', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1977', '14', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1978', '15', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1979', '16', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1980', '17', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1981', '18', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1982', '19', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1983', '20', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1984', '21', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1985', '22', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1986', '23', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1987', '24', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1988', '25', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1989', '26', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1990', '27', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1991', '28', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1992', '29', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1993', '30', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1994', '31', '3', '2014', 'Ionut Toma', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1995', '1', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1996', '2', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1997', '3', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1998', '4', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('1999', '5', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2000', '6', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2001', '7', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2002', '8', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2003', '9', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2004', '10', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2005', '11', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2006', '12', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2007', '13', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2008', '14', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2009', '15', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2010', '16', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2011', '17', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2012', '18', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2013', '19', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2014', '20', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2015', '21', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2016', '22', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2017', '23', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2018', '24', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2019', '25', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2020', '26', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2021', '27', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2022', '28', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2023', '29', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2024', '30', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2025', '31', '3', '2014', 'Chiriac Alexandru', '1 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2026', '1', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2027', '2', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2028', '3', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2029', '4', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2030', '5', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2031', '6', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2032', '7', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2033', '8', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2034', '9', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2035', '10', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2036', '11', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2037', '12', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2038', '13', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2039', '14', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2040', '15', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2041', '16', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2042', '17', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2043', '18', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2044', '19', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2045', '20', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2046', '21', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2047', '22', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2048', '23', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2049', '24', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2050', '25', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2051', '26', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2052', '27', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2053', '28', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2054', '29', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2055', '30', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2056', '31', '3', '2014', 'Ana Constantin', '2 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2057', '1', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2058', '2', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2059', '3', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2060', '4', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2061', '5', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2062', '6', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2063', '7', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2064', '8', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2065', '9', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2066', '10', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2067', '11', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2068', '12', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2069', '13', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2070', '14', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2071', '15', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2072', '16', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2073', '17', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2074', '18', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2075', '19', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2076', '20', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2077', '21', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2078', '22', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2079', '23', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2080', '24', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2081', '25', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2082', '26', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2083', '27', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2084', '28', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2085', '29', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2086', '30', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2087', '31', '3', '2014', 'Iancu Alexandru', '3 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2088', '1', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2089', '2', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2090', '3', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2091', '4', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2092', '5', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2093', '6', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2094', '7', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2095', '8', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2096', '9', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2097', '10', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2098', '11', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2099', '12', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2100', '13', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2101', '14', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2102', '15', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2103', '16', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2104', '17', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2105', '18', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2106', '19', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2107', '20', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2108', '21', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2109', '22', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2110', '23', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2111', '24', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2112', '25', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2113', '26', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2114', '27', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2115', '28', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2116', '29', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2117', '30', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');
INSERT INTO `schedule` VALUES ('2118', '31', '3', '2014', 'Andreea Custura', '4 Goc shift', 'RPM GOC');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shifts
-- ----------------------------
INSERT INTO `shifts` VALUES ('13', '1 Goc shift', 'from 7AM to 4PM', '1');
INSERT INTO `shifts` VALUES ('14', '2 Goc shift', 'from 10AM to 7PM', '1');
INSERT INTO `shifts` VALUES ('15', '3 Goc shift', 'from 7PM to 4AM', '1');
INSERT INTO `shifts` VALUES ('16', '4 Goc shift', 'from 10PM to 7AM', '1');
INSERT INTO `shifts` VALUES ('17', '1 ssp shift', 'from 9AM to 6PM', '2');
INSERT INTO `shifts` VALUES ('18', '2 ssp shift', 'from 6PM to 1:30AM', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Savulescu Adrian', 'asavulescu@ea.com', '0/2', '1', '1', '#aef596');
INSERT INTO `users` VALUES ('168', 'Alin Patulea', 'alpatulea', '4/5', '1', '0', '#4aa85a');
INSERT INTO `users` VALUES ('169', 'Andreea Ifrim', 'aifrim@ea.com', '4/5', '1', '0', '#b8e12b');
INSERT INTO `users` VALUES ('170', 'Ionut Toma', 'itoma@ea.com', '0/1', '1', '1', '#d387fc');
INSERT INTO `users` VALUES ('171', 'Andrei Gheorghe', 'angheorghe@ea.com', '5/6', '2', '0', '#6f9d7c');
INSERT INTO `users` VALUES ('172', 'Petru Burca', 'pburca@ea.com', '0/1', '2', '0', '#baad83');
INSERT INTO `users` VALUES ('173', 'Vlasceanu Florin', 'fvlasceanu@ea.com', '0/6', '2', '0', '#a8c4aa');
INSERT INTO `users` VALUES ('174', 'Florescu Bogdan', 'bflorescu@ea.com', '4/5', '2', '0', '#a89e82');
INSERT INTO `users` VALUES ('175', 'Chiriac Alexandru', 'achiriac@ea.com', '4/5', '1', '0', '#c6978e');
INSERT INTO `users` VALUES ('176', 'Ana Constantin', 'coana@ea.com', '4/5', '1', '0', '#aaab92');
INSERT INTO `users` VALUES ('177', 'Iancu Alexandru', 'aliancu@ea.com', '4/5', '1', '0', '#a9a6d7');
INSERT INTO `users` VALUES ('178', 'Andreea Custura', 'acustura@ea.com', '5/6', '1', '0', '#edd68f');
INSERT INTO `users` VALUES ('180', 'ewq', 'ewq', '', '1', '0', '#000000');

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
