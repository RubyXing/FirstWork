/*
 Navicat Premium Data Transfer

 Source Server         : Xingqilin
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : wndata

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 26/03/2020 13:51:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cdetails
-- ----------------------------
DROP TABLE IF EXISTS `cdetails`;
CREATE TABLE `cdetails`  (
  `did` int(5) NOT NULL COMMENT '详情id，details',
  `dlessons` int(5) NULL DEFAULT NULL COMMENT '课程节数',
  `dsmaller` int(5) NULL DEFAULT NULL COMMENT '课程小点',
  `dscore` double(2, 1) NULL DEFAULT NULL COMMENT '综合评分',
  `dimgaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程图文地址',
  `lessonpage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表jsp页面地址',
  PRIMARY KEY (`did`) USING BTREE,
  CONSTRAINT `cdetails_ibfk_1` FOREIGN KEY (`did`) REFERENCES `courselist` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdetails
-- ----------------------------
INSERT INTO `cdetails` VALUES (1, 60, 283, 4.9, 'https://7n.w3cschool.cn/attachments/image/20190626/1561533040466127.png', 'htmlweike.jsp');
INSERT INTO `cdetails` VALUES (2, 32, 32, 4.6, 'staticfront/img/xiaobaiHTML.png', 'xiaobaihtml.jsp');
INSERT INTO `cdetails` VALUES (3, 64, 64, 4.6, 'staticfront/img/qianduanjingping.png', 'perfecthtml.jsp');
INSERT INTO `cdetails` VALUES (4, 82, 407, 4.8, 'https://7n.w3cschool.cn/attachments/image/20190626/1561541347126493.png', 'cssweike.jsp');
INSERT INTO `cdetails` VALUES (5, 29, 29, 4.4, 'https://7n.w3cschool.cn/attachments/image/20190626/1561541347126493.png', 'cssxiaobai.jsp');
INSERT INTO `cdetails` VALUES (6, 10, 51, 4.8, 'https://atts.w3cschool.cn/attachments/image/20190920/1568961428973566.png', 'javainterview.jsp');
INSERT INTO `cdetails` VALUES (7, 48, 184, 4.6, 'https://atts.w3cschool.cn/attachments/image/20191203/1575339206870664.png', 'jspweike.jsp');
INSERT INTO `cdetails` VALUES (8, 44, 44, 4.8, 'https://atts.w3cschool.cn/attachments/image/20191121/1574319429798090.png', 'phpintendays.jsp');
INSERT INTO `cdetails` VALUES (9, 60, 60, 4.4, 'https://atts.w3cschool.cn/attachments/image/20191121/1574319429798090.png', 'phpjinjie.jsp');
INSERT INTO `cdetails` VALUES (10, 55, 339, 4.9, 'https://7n.w3cschool.cn/attachments/image/20190626/1561542793930162.png', 'javascriptweike.jsp');
INSERT INTO `cdetails` VALUES (11, 26, 125, 4.7, 'https://atts.w3cschool.cn/attachments/image/20190730/1564474553797766.png', 'jqueryweike.jsp');
INSERT INTO `cdetails` VALUES (12, 27, 223, 4.8, 'https://7n.w3cschool.cn/attachments/image/20190715/1563176967180491.png', 'bootstrapweike.jsp');
INSERT INTO `cdetails` VALUES (13, 22, 151, 4.4, 'https://atts.w3cschool.cn/attachments/image/20191112/1573542277137487.png', 'vueweike.jsp');
INSERT INTO `cdetails` VALUES (14, 46, 263, 4.8, 'https://atts.w3cschool.cn/attachments/image/20191224/1577155525404940.png', 'cweike.jsp');
INSERT INTO `cdetails` VALUES (15, 21, 21, 3.0, 'https://atts.w3cschool.cn/attachments/image/20200107/1578364241367946.png', 'springboot.jsp');
INSERT INTO `cdetails` VALUES (16, 14, 14, 3.3, 'https://atts.w3cschool.cn/attachments/image/20200107/1578364241367946.png', 'spring4.jsp');
INSERT INTO `cdetails` VALUES (17, 43, 417, 4.8, 'https://atts.w3cschool.cn/attachments/image/20200107/1578364241367946.png', 'springweike.jsp');
INSERT INTO `cdetails` VALUES (18, 20, 114, 4.8, 'https://atts.w3cschool.cn/attachments/image/20200117/1579229559825488.png', 'mysqlweike.jsp');

-- ----------------------------
-- Table structure for courselist
-- ----------------------------
DROP TABLE IF EXISTS `courselist`;
CREATE TABLE `courselist`  (
  `cid` int(5) NOT NULL COMMENT '课程ID',
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `cdirection` int(5) NULL DEFAULT NULL COMMENT '课程方向',
  `ctype` int(5) NULL DEFAULT NULL COMMENT '课程类型',
  `clabe` int(5) NULL DEFAULT NULL COMMENT '课程标签',
  `ccondition` int(3) NULL DEFAULT NULL COMMENT '课程条件',
  `cdescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `cimgaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `cparticipate` double(5, 2) NULL DEFAULT NULL COMMENT '课程参与人数',
  `cprice` double(10, 2) NULL DEFAULT NULL COMMENT '课程价格',
  `crebate` double(10, 2) NULL DEFAULT NULL COMMENT '课程折扣',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courselist
-- ----------------------------
INSERT INTO `courselist` VALUES (1, 'HTML微课（含HTML5）', 101, 201, 301, 402, 'HTML之于编程犹如数字之于文明', 'https://7n.w3cschool.cn/attachments/image/201910/big_56875_1378947.jpg?t=1571206351', 96.50, 39.00, 1.00);
INSERT INTO `courselist` VALUES (2, '小白学前端：HTML零基础入门', 101, 201, 301, 402, '小白学前端第一站，快速掌握HTML知识', 'https://7n.w3cschool.cn/attachments/image/201910/big_97433_87959.png?t=1572420085', 10.00, 29.00, 1.00);
INSERT INTO `courselist` VALUES (3, '前端精品课：HTML+CSS入门', 101, 201, 301, 403, '前端精品课：HTML+CSS入门', 'https://7n.w3cschool.cn/attachments/image/201904/big_97421_87959.png?t=1556273799', 0.67, 96.00, 0.80);
INSERT INTO `courselist` VALUES (4, 'CSS微课', 101, 202, 301, 402, '想给网站化个妆？学好CSS就够了', 'https://7n.w3cschool.cn/attachments/image/201910/big_57222_1378947.jpg?t=1571206672', 27.50, 39.00, 1.00);
INSERT INTO `courselist` VALUES (5, '小白学前端：简单易懂的CSS教程', 101, 202, 302, 402, '小白学前端第二站，轻松掌握CSS知识', 'https://7n.w3cschool.cn/attachments/image/201903/big_97437_87959.png?t=1551446811', 3.60, 29.00, 1.00);
INSERT INTO `courselist` VALUES (6, 'JAVA面试 基础题应知应会', 102, 208, 301, 402, '5讲搞定JAVA面试必考点，主力突破面试', 'https://7n.w3cschool.cn/attachments/image/201909/big_100148_87959.png?t=1568961395', 2.20, 19.00, 1.00);
INSERT INTO `courselist` VALUES (7, 'JSP 微课', 102, 208, 301, 402, '初阶Java工程师必备技术|JSP为HTML提供动态响应', 'https://7n.w3cschool.cn/attachments/image/201912/big_100200_87959.png?t=1575339581', 1.10, 59.00, 0.80);
INSERT INTO `courselist` VALUES (8, '10天学会PHP', 102, 207, 302, 401, '10天PHP零基础学习', 'https://7n.w3cschool.cn/attachments/image/201910/big_92581_87959.jpg?t=1571125890', 52.80, 0.00, 1.00);
INSERT INTO `courselist` VALUES (9, 'PHP进阶：Laravel入门到实战', 102, 207, 302, 403, 'PHP进阶学习：Laravel入门', 'https://7n.w3cschool.cn/attachments/image/201910/big_91498_87959.jpg?t=1571125946', 0.83, 98.00, 0.50);
INSERT INTO `courselist` VALUES (10, 'JavaScript微课', 101, 203, 301, 402, 'Web前端开发者必学语言之一', 'https://7n.w3cschool.cn/attachments/image/201910/big_57421_1378947.jpg?t=1571276745', 56.40, 39.00, 1.00);
INSERT INTO `courselist` VALUES (11, 'jQuery微课', 101, 204, 301, 402, '简介，易学的JavaScript框架', 'https://7n.w3cschool.cn/attachments/image/201910/big_57416_1378947.jpg?t=1571291877', 9.00, 29.00, 1.00);
INSERT INTO `courselist` VALUES (12, 'Bootstrap3微课', 101, 205, 301, 402, '前端开发必修课，10小时搞定', 'https://7n.w3cschool.cn/attachments/image/201910/big_97283_1378947.jpg?t=1571303239', 1.30, 39.00, 1.00);
INSERT INTO `courselist` VALUES (13, 'Vue 2.X微课', 101, 206, 301, 402, '代码块案例丰富，知识点图文呈现', 'https://7n.w3cschool.cn/attachments/image/202001/big_100019_87959.png?t=1578105020', 1.30, 29.00, 1.00);
INSERT INTO `courselist` VALUES (14, 'C语言微课', 102, 209, 301, 402, '263个知识点+实操练习，快速掌握C语言', 'https://7n.w3cschool.cn/attachments/image/201912/big_100233_87959.png?t=1577153138', 4.90, 49.00, 1.00);
INSERT INTO `courselist` VALUES (15, 'SpringBoot', 102, 210, 302, 402, 'springboot视频教程', 'https://7n.w3cschool.cn/attachments/image/201812/big_97298_18.png?t=1544098902', 0.95, 69.00, 1.00);
INSERT INTO `courselist` VALUES (16, '14小节快速入门spring4.0', 102, 211, 302, 403, 'spring4.0x快速入门', 'https://7n.w3cschool.cn/attachments/image/201812/big_97299_18.png?t=1544100542', 0.31, 39.00, 0.60);
INSERT INTO `courselist` VALUES (17, 'spring入门微课', 102, 211, 301, 402, '简要介绍IOC和bean容器的概念和简单实用', 'https://7n.w3cschool.cn/attachments/image/201912/big_100228_87959.png?t=1577449737', 1.90, 59.00, 1.00);
INSERT INTO `courselist` VALUES (18, 'MySql微课', 103, 212, 301, 402, 'MySQL是web世界中使用最广泛的数据库服务器', 'https://7n.w3cschool.cn/attachments/image/202001/big_100242_87959.png?t=1579168506', 1.80, 49.00, 1.00);

-- ----------------------------
-- Table structure for ctag
-- ----------------------------
DROP TABLE IF EXISTS `ctag`;
CREATE TABLE `ctag`  (
  `tid` int(5) NOT NULL COMMENT '标签id',
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `topid` int(5) NULL DEFAULT NULL COMMENT '父标签ID',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ctag
-- ----------------------------
INSERT INTO `ctag` VALUES (101, '前端开发', 0);
INSERT INTO `ctag` VALUES (102, '后端开发', 0);
INSERT INTO `ctag` VALUES (103, '数据库', 0);
INSERT INTO `ctag` VALUES (104, '计算机原理', 0);
INSERT INTO `ctag` VALUES (105, '其他', 0);
INSERT INTO `ctag` VALUES (201, 'HTML', 101);
INSERT INTO `ctag` VALUES (202, 'CSS', 101);
INSERT INTO `ctag` VALUES (203, 'JavaScript', 101);
INSERT INTO `ctag` VALUES (204, 'jQuery', 101);
INSERT INTO `ctag` VALUES (205, 'Bootstrap', 101);
INSERT INTO `ctag` VALUES (206, 'Vue.js', 101);
INSERT INTO `ctag` VALUES (207, 'PHP', 102);
INSERT INTO `ctag` VALUES (208, 'Java', 102);
INSERT INTO `ctag` VALUES (209, 'C', 102);
INSERT INTO `ctag` VALUES (210, 'SpringBoot', 102);
INSERT INTO `ctag` VALUES (211, 'Spring', 102);
INSERT INTO `ctag` VALUES (212, 'MySQL', 103);
INSERT INTO `ctag` VALUES (213, 'SQL', 103);
INSERT INTO `ctag` VALUES (214, 'MongoDB', 103);
INSERT INTO `ctag` VALUES (215, '计算机原理', 104);
INSERT INTO `ctag` VALUES (216, '工具', 104);
INSERT INTO `ctag` VALUES (217, '云计算', 105);
INSERT INTO `ctag` VALUES (301, '编程微课', NULL);
INSERT INTO `ctag` VALUES (302, '视频课程', NULL);
INSERT INTO `ctag` VALUES (303, '订阅专栏', NULL);
INSERT INTO `ctag` VALUES (304, '编程实战', NULL);
INSERT INTO `ctag` VALUES (305, '课程包', NULL);
INSERT INTO `ctag` VALUES (401, '免费课程', NULL);
INSERT INTO `ctag` VALUES (402, '会员免费课程', NULL);
INSERT INTO `ctag` VALUES (403, '会员特价', NULL);

-- ----------------------------
-- Table structure for ldetail
-- ----------------------------
DROP TABLE IF EXISTS `ldetail`;
CREATE TABLE `ldetail`  (
  `lid` int(5) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `oid` int(5) NULL DEFAULT NULL COMMENT '订单id',
  `cid` int(5) NULL DEFAULT NULL COMMENT '课程id',
  `lnum` int(5) NULL DEFAULT NULL COMMENT '数量',
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `cimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `lprice` double(10, 2) NULL DEFAULT NULL COMMENT '订单价格',
  PRIMARY KEY (`lid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ldetail
-- ----------------------------
INSERT INTO `ldetail` VALUES (1, 1, 1, 1, 'HTML微课（含HTML5）', 'https://7n.w3cschool.cn/attachments/image/201910/big_56875_1378947.jpg?t=1571206351', 0.00);
INSERT INTO `ldetail` VALUES (2, 1, 2, 1, '小白学前端：HTML零基础入门', 'https://7n.w3cschool.cn/attachments/image/201910/big_97433_87959.png?t=1572420085', 0.00);
INSERT INTO `ldetail` VALUES (3, 1, 3, 1, '前端精品课：HTML+CSS入门', 'https://7n.w3cschool.cn/attachments/image/201904/big_97421_87959.png?t=1556273799', 61.44);
INSERT INTO `ldetail` VALUES (4, 2, 4, 1, 'CSS微课', 'https://7n.w3cschool.cn/attachments/image/201910/big_57222_1378947.jpg?t=1571206672', 0.00);
INSERT INTO `ldetail` VALUES (5, 2, 9, 1, 'PHP进阶：Laravel入门到实战', 'https://7n.w3cschool.cn/attachments/image/201910/big_91498_87959.jpg?t=1571125946', 39.20);
INSERT INTO `ldetail` VALUES (16, 61857, 3, 1, '前端精品课：HTML+CSS入门', 'https://7n.w3cschool.cn/attachments/image/201904/big_97421_87959.png?t=1556273799', 76.80);
INSERT INTO `ldetail` VALUES (17, 61857, 1, 1, 'HTML微课（含HTML5）', 'https://7n.w3cschool.cn/attachments/image/201910/big_56875_1378947.jpg?t=1571206351', 39.00);
INSERT INTO `ldetail` VALUES (18, 61857, 9, 1, 'PHP进阶：Laravel入门到实战', 'https://7n.w3cschool.cn/attachments/image/201910/big_91498_87959.jpg?t=1571125946', 49.00);
INSERT INTO `ldetail` VALUES (19, 32025, 3, 1, '前端精品课：HTML+CSS入门', 'https://7n.w3cschool.cn/attachments/image/201904/big_97421_87959.png?t=1556273799', 76.80);
INSERT INTO `ldetail` VALUES (20, 32025, 2, 1, '小白学前端：HTML零基础入门', 'https://7n.w3cschool.cn/attachments/image/201910/big_97433_87959.png?t=1572420085', 29.00);

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`  (
  `lid` int(5) NOT NULL COMMENT '订单id',
  `uid` int(5) NULL DEFAULT NULL COMMENT '用户id',
  `ldate` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `omoney` double(10, 2) NULL DEFAULT 0.00 COMMENT '总金额',
  `lstate` int(2) NULL DEFAULT NULL COMMENT '付款状态',
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `orderlist_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES (1, 3, '2020-03-25 12:12:06', 61.44, 0);
INSERT INTO `orderlist` VALUES (2, 3, '2020-03-25 10:09:35', 57.92, 1);
INSERT INTO `orderlist` VALUES (32025, 1, '2020-03-26 13:42:36', 0.00, 0);
INSERT INTO `orderlist` VALUES (61857, 3, '2020-03-26 13:42:25', 0.00, 0);

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar`  (
  `sid` int(5) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `uid` int(5) NULL DEFAULT NULL COMMENT '用户id',
  `cid` int(5) NULL DEFAULT NULL COMMENT '课程id',
  `snum` int(5) NULL DEFAULT 1 COMMENT '课程数量，可赠送',
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`  (
  `cno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('3-105', '计算机导论', '825');
INSERT INTO `t_course` VALUES ('3-106', '英语', '856');
INSERT INTO `t_course` VALUES ('3-107', '日语', '856');
INSERT INTO `t_course` VALUES ('3-108', '法语', '856');
INSERT INTO `t_course` VALUES ('3-245', '操作系统', '804');
INSERT INTO `t_course` VALUES ('6-166', '数字电路', '856');
INSERT INTO `t_course` VALUES ('9-888', '高等数学', '831');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score`  (
  `sno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` decimal(4, 1) NOT NULL,
  `sLevel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('103', '3-245', 86.0, NULL);
INSERT INTO `t_score` VALUES ('105', '3-245', 75.0, NULL);
INSERT INTO `t_score` VALUES ('109', '3-245', 68.0, NULL);
INSERT INTO `t_score` VALUES ('103', '3-105', 92.0, NULL);
INSERT INTO `t_score` VALUES ('105', '3-105', 88.0, NULL);
INSERT INTO `t_score` VALUES ('109', '3-105', 76.0, NULL);
INSERT INTO `t_score` VALUES ('103', '6-166', 85.0, NULL);
INSERT INTO `t_score` VALUES ('105', '6-166', 79.0, NULL);
INSERT INTO `t_score` VALUES ('109', '6-166', 81.0, NULL);
INSERT INTO `t_score` VALUES ('101', '3-245', 75.0, '及格');
INSERT INTO `t_score` VALUES ('102', '3-245', 55.0, '不及格');

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`  (
  `sno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `home` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blood` enum('A','B','AB','O','-') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('101', '李军', '男', '1976-02-20', '湖北武汉', 'A');
INSERT INTO `t_student` VALUES ('103', '陆君', '男', '1974-06-03', '四川成都', 'B');
INSERT INTO `t_student` VALUES ('105', '匡明', '男', '1975-10-02', '浙江杭州', 'B');
INSERT INTO `t_student` VALUES ('107', '王丽', '女', '1976-01-23', '湖北武汉', 'A');
INSERT INTO `t_student` VALUES ('108', '曾华', '男', '1977-09-01', '浙江杭州', 'A');
INSERT INTO `t_student` VALUES ('109', '王芳', '女', '1975-02-10', '四川成都', 'B');
INSERT INTO `t_student` VALUES ('112', 'aaa', '女', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher`  (
  `tno` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `prof` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('804', '李诚', '男', '1958-12-02', '副教授', '计算机系');
INSERT INTO `t_teacher` VALUES ('825', '王萍', '女', '1972-05-05', '助教', '计算机系');
INSERT INTO `t_teacher` VALUES ('831', '刘冰', '女', '1977-08-14', '助教', '电子工程系');
INSERT INTO `t_teacher` VALUES ('856', '张旭', '男', '1969-03-12', '讲师', '电子工程系');
INSERT INTO `t_teacher` VALUES ('900', '张旭', '女', '2020-02-15', '讲话', '工程系');

-- ----------------------------
-- Table structure for testdate
-- ----------------------------
DROP TABLE IF EXISTS `testdate`;
CREATE TABLE `testdate`  (
  `date` date NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testdate
-- ----------------------------
INSERT INTO `testdate` VALUES ('2020-03-20', NULL);
INSERT INTO `testdate` VALUES ('2020-03-20', NULL);
INSERT INTO `testdate` VALUES ('2020-03-20', 'abc');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int(5) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uvip` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'BBB', '654321', '987654321@qq.com', '12345679812', 0);
INSERT INTO `users` VALUES (3, 'xing', '123456', '123456789@qq.com', '12345678910', 1);
INSERT INTO `users` VALUES (4, 'ABC', '123456', '321456789@qq.com', '13649851241', 0);
INSERT INTO `users` VALUES (5, 'CBA', '654321', '321789654@qq.com', '13342251643', 1);

-- ----------------------------
-- Procedure structure for getleavel
-- ----------------------------
DROP PROCEDURE IF EXISTS `getleavel`;
delimiter ;;
CREATE PROCEDURE `getleavel`(IN `n_sco` double,OUT `n_lev` varchar(30))
BEGIN
	IF n_sco<60
	THEN SET n_lev='不及格';
	ELSEIF n_sco<80
	THEN SET n_lev='及格';
	ELSE
	SET n_lev='优秀';
	END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for pro1
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro1`;
delimiter ;;
CREATE PROCEDURE `pro1`(IN `p_up` char(10))
BEGIN
	UPDATE t_student SET sname='aaa' WHERE t_student.sno=p_up; 
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table t_score
-- ----------------------------
DROP TRIGGER IF EXISTS `chleavel`;
delimiter ;;
CREATE TRIGGER `chleavel` BEFORE INSERT ON `t_score` FOR EACH ROW BEGIN
	CALL getleavel(NEW.score,@level);
	SET NEW.sLevel=@level;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
