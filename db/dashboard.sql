/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : dashboard

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-03-16 06:18:32
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
  `user_id` varchar(255) DEFAULT NULL,
  `shift_id` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2615 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('2181', '1', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2182', '2', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2183', '3', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2184', '4', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2185', '5', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2186', '6', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2187', '7', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2188', '8', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2189', '9', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2190', '10', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2191', '11', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2192', '12', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2193', '13', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2194', '14', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2195', '15', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2196', '16', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2197', '17', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2198', '18', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2199', '19', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2200', '20', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2201', '21', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2202', '22', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2203', '23', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2204', '24', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2205', '25', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2206', '26', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2207', '27', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2208', '28', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2209', '29', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2210', '30', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2211', '31', '3', '2014', '1', '17', '2');
INSERT INTO `schedule` VALUES ('2212', '1', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2213', '2', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2214', '3', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2215', '4', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2216', '5', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2217', '6', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2218', '7', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2219', '8', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2220', '9', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2221', '10', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2222', '11', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2223', '12', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2224', '13', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2225', '14', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2226', '15', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2227', '16', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2228', '17', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2229', '18', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2230', '19', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2231', '20', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2232', '21', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2233', '22', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2234', '23', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2235', '24', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2236', '25', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2237', '26', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2238', '27', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2239', '28', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2240', '29', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2241', '30', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2242', '31', '3', '2014', '171', '18', '2');
INSERT INTO `schedule` VALUES ('2243', '1', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2244', '2', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2245', '3', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2246', '4', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2247', '5', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2248', '6', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2249', '7', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2250', '8', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2251', '9', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2252', '10', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2253', '11', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2254', '12', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2255', '13', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2256', '14', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2257', '15', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2258', '16', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2259', '17', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2260', '18', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2261', '19', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2262', '20', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2263', '21', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2264', '22', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2265', '23', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2266', '24', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2267', '25', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2268', '26', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2269', '27', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2270', '28', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2271', '29', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2272', '30', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2273', '31', '3', '2014', '172', '17', '2');
INSERT INTO `schedule` VALUES ('2274', '1', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2275', '2', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2276', '3', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2277', '4', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2278', '5', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2279', '6', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2280', '7', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2281', '8', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2282', '9', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2283', '10', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2284', '11', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2285', '12', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2286', '13', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2287', '14', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2288', '15', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2289', '16', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2290', '17', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2291', '18', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2292', '19', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2293', '20', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2294', '21', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2295', '22', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2296', '23', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2297', '24', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2298', '25', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2299', '26', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2300', '27', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2301', '28', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2302', '29', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2303', '30', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2304', '31', '3', '2014', '173', '18', '2');
INSERT INTO `schedule` VALUES ('2305', '1', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2306', '2', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2307', '3', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2308', '4', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2309', '5', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2310', '6', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2311', '7', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2312', '8', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2313', '9', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2314', '10', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2315', '11', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2316', '12', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2317', '13', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2318', '14', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2319', '15', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2320', '16', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2321', '17', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2322', '18', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2323', '19', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2324', '20', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2325', '21', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2326', '22', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2327', '23', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2328', '24', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2329', '25', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2330', '26', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2331', '27', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2332', '28', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2333', '29', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2334', '30', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2335', '31', '3', '2014', '174', '17', '2');
INSERT INTO `schedule` VALUES ('2336', '1', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2337', '2', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2338', '3', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2339', '4', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2340', '5', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2341', '6', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2342', '7', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2345', '10', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2346', '11', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2347', '12', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2348', '13', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2349', '14', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2350', '15', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2351', '16', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2352', '17', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2353', '18', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2354', '19', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2355', '20', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2356', '21', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2357', '22', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2358', '23', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2359', '24', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2360', '25', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2361', '26', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2362', '27', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2363', '28', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2364', '29', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2365', '30', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2366', '31', '3', '2014', '1', '13', '1');
INSERT INTO `schedule` VALUES ('2367', '1', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2369', '3', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2370', '4', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2371', '5', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2372', '6', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2373', '7', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2374', '8', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2376', '10', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2377', '11', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2378', '12', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2380', '14', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2381', '15', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2382', '16', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2383', '17', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2384', '18', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2385', '19', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2386', '20', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2387', '21', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2388', '22', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2389', '23', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2390', '24', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2391', '25', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2392', '26', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2393', '27', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2394', '28', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2395', '29', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2396', '30', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2397', '31', '3', '2014', '168', '14', '1');
INSERT INTO `schedule` VALUES ('2398', '1', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2399', '2', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2400', '3', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2401', '4', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2402', '5', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2403', '6', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2404', '7', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2405', '8', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2406', '9', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2407', '10', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2408', '11', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2409', '12', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2410', '13', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2411', '14', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2412', '15', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2413', '16', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2414', '17', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2415', '18', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2416', '19', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2417', '20', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2418', '21', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2419', '22', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2420', '23', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2421', '24', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2422', '25', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2423', '26', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2424', '27', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2425', '28', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2426', '29', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2427', '30', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2428', '31', '3', '2014', '169', '15', '1');
INSERT INTO `schedule` VALUES ('2429', '1', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2430', '2', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2431', '3', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2432', '4', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2433', '5', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2434', '6', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2435', '7', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2436', '8', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2437', '9', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2438', '10', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2439', '11', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2440', '12', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2441', '13', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2442', '14', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2443', '15', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2444', '16', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2445', '17', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2446', '18', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2447', '19', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2448', '20', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2449', '21', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2450', '22', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2451', '23', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2452', '24', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2453', '25', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2454', '26', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2455', '27', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2456', '28', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2457', '29', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2458', '30', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2459', '31', '3', '2014', '170', '16', '1');
INSERT INTO `schedule` VALUES ('2460', '1', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2461', '2', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2462', '3', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2463', '4', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2464', '5', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2465', '6', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2466', '7', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2467', '8', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2468', '9', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2469', '10', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2470', '11', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2472', '13', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2473', '14', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2474', '15', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2475', '16', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2476', '17', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2477', '18', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2478', '19', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2479', '20', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2480', '21', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2481', '22', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2482', '23', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2483', '24', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2484', '25', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2485', '26', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2486', '27', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2487', '28', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2488', '29', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2489', '30', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2490', '31', '3', '2014', '175', '13', '1');
INSERT INTO `schedule` VALUES ('2491', '1', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2492', '2', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2493', '3', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2494', '4', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2495', '5', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2496', '6', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2497', '7', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2498', '8', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2500', '10', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2501', '11', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2503', '13', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2505', '15', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2507', '17', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2508', '18', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2509', '19', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2510', '20', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2511', '21', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2512', '22', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2513', '23', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2514', '24', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2515', '25', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2516', '26', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2517', '27', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2518', '28', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2519', '29', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2520', '30', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2521', '31', '3', '2014', '176', '14', '1');
INSERT INTO `schedule` VALUES ('2522', '1', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2523', '2', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2524', '3', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2525', '4', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2526', '5', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2527', '6', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2528', '7', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2529', '8', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2530', '9', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2531', '10', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2532', '11', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2533', '12', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2534', '13', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2535', '14', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2536', '15', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2537', '16', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2538', '17', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2539', '18', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2540', '19', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2541', '20', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2542', '21', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2543', '22', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2544', '23', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2545', '24', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2546', '25', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2547', '26', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2548', '27', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2549', '28', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2550', '29', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2551', '30', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2552', '31', '3', '2014', '177', '15', '1');
INSERT INTO `schedule` VALUES ('2553', '1', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2554', '2', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2555', '3', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2556', '4', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2557', '5', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2558', '6', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2559', '7', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2560', '8', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2561', '9', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2562', '10', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2563', '11', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2564', '12', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2565', '13', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2566', '14', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2567', '15', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2568', '16', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2569', '17', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2570', '18', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2571', '19', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2572', '20', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2573', '21', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2574', '22', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2575', '23', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2576', '24', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2577', '25', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2578', '26', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2579', '27', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2580', '28', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2581', '29', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2582', '30', '3', '2014', '178', '16', '1');
INSERT INTO `schedule` VALUES ('2583', '31', '3', '2014', '178', '16', '1');

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
INSERT INTO `shifts` VALUES ('13', 'Morning shift', 'from 7AM to 4PM', '1');
INSERT INTO `shifts` VALUES ('14', 'Day shift', 'from 10AM to 7PM', '1');
INSERT INTO `shifts` VALUES ('15', 'Night shift', 'from 7PM to 4AM', '1');
INSERT INTO `shifts` VALUES ('16', 'Graveyard shift', 'from 10PM to 7AM', '1');
INSERT INTO `shifts` VALUES ('17', 'Day shift', 'from 9AM to 6PM', '2');
INSERT INTO `shifts` VALUES ('18', 'Night shift', 'from 6PM to 1:30AM', '2');

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
