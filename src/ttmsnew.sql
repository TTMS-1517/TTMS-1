/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50520
 Source Host           : localhost:3306
 Source Schema         : ttmsnew

 Target Server Type    : MySQL
 Target Server Version : 50520
 File Encoding         : 65001

 Date: 20/01/2021 12:05:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_telnum` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登陆密码',
  `cus_vip` smallint(6) DEFAULT 0 COMMENT '说明：\r\n            0：禁用\r\n            1：启用',
  `cus_balance` decimal(10, 0) DEFAULT 1000 COMMENT '账户余额',
  `cus_paypwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付密码',
  PRIMARY KEY (`cus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('LYY','13279505680','2193560021@qq.com','liuyng01253217');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('FJW','15830599166','123456@qq.com','123456');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('ZJQ','18791307612','234567@qq.com','234567');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('ZRP','15129072144','345678@qq.com','345678');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('XZL','17764752350','567890@qq.com','567890');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('QPY','15771831001','67890@qq.com','67890');

-- ----------------------------
-- Table structure for data_dict
-- ----------------------------
DROP TABLE IF EXISTS `data_dict`;
CREATE TABLE `data_dict`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT,
  `super_dict_id` int(11) DEFAULT NULL COMMENT '父id',
  `dict_index` int(11) DEFAULT NULL COMMENT '同级顺序',
  `dict_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE,
  INDEX `FK_super_child_dict`(`super_dict_id`) USING BTREE,
  CONSTRAINT `FK_super_child_dict` FOREIGN KEY (`super_dict_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of data_dict
-- ----------------------------
INSERT INTO `data_dict` VALUES (1, NULL, 1, '数据字典', '根');
INSERT INTO `data_dict` VALUES (2, 1, 1, 'PLAYTYPE', '影片类型');
INSERT INTO `data_dict` VALUES (3, 1, 2, 'PLAYLANG', '影片语言');
INSERT INTO `data_dict` VALUES (4, 1, 3, '锁失效时间', '10');
INSERT INTO `data_dict` VALUES (5, 2, 1, 'History', '历史');
INSERT INTO `data_dict` VALUES (6, 2, 2, 'Anime', '动漫');
INSERT INTO `data_dict` VALUES (7, 2, 3, 'Drama', '生活');
INSERT INTO `data_dict` VALUES (8, 2, 4, 'Horror', '恐怖');
INSERT INTO `data_dict` VALUES (9, 2, 5, 'War', '战争');
INSERT INTO `data_dict` VALUES (10, 2, 6, 'Sci-Fi', '科幻');
INSERT INTO `data_dict` VALUES (11, 2, 7, 'Romance', '爱情');
INSERT INTO `data_dict` VALUES (12, 2, 8, 'Comedy', '喜剧');
INSERT INTO `data_dict` VALUES (13, 2, 9, 'Action', '动作');
INSERT INTO `data_dict` VALUES (14, 3, 1, 'Chinese', '国语');
INSERT INTO `data_dict` VALUES (15, 3, 2, 'English', '英语');
INSERT INTO `data_dict` VALUES (16, 3, 3, 'Japanese', '日语');
INSERT INTO `data_dict` VALUES (17, 3, 4, 'Korean', '韩语');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_id` int(11) DEFAULT NULL,
  `emp_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `emp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `emp_gender` smallint(6) DEFAULT 1 COMMENT '说明：\r\n            0：女\r\n            1：男',
  `emp_telnum` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emp_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emp_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emp_status` smallint(6) DEFAULT 1 COMMENT '说明：\r\n            0：禁用\r\n            1：启用',
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `FK_emp_position`(`dict_id`) USING BTREE,
  CONSTRAINT `FK_emp_position` FOREIGN KEY (`dict_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

INSERT INTO employee(emp_no,emp_name,emp_email,emp_pwd) VALUES('No.1','LYY','2193560021@qq.com','liuyng01253217');
INSERT INTO employee(emp_no,emp_name,emp_email,emp_pwd) VALUES('No.2','FJW','123456@qq.com','123456');
INSERT INTO employee(emp_no,emp_name,emp_email,emp_pwd) VALUES('No.3','ZJQ','234567@qq.com','234567');
INSERT INTO employee(emp_no,emp_name,emp_email,emp_pwd) VALUES('No.4','ZRP','345678@qq.com','345678');
INSERT INTO employee(emp_no,emp_name,emp_email,emp_pwd) VALUES('No.5','XZL','567890@qq.com','567890');
INSERT INTO employee(emp_no,emp_name,emp_email,emp_pwd) VALUES('No.5','QPY','67890@qq.com','67890');


-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play`  (
  `play_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_type_id` int(11) DEFAULT NULL,
  `dict_lang_id` int(11) DEFAULT NULL,
  `play_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_kind` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_introduction` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_image` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_video` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_length` int(11) DEFAULT NULL,
  `play_ticket_price` int(5) DEFAULT NULL,
  `play_status` smallint(6) DEFAULT NULL COMMENT '取值含义：\r\n            0：待安排演出\r\n            1：已安排演出\r\n            -1：下线',
  PRIMARY KEY (`play_id`) USING BTREE,
  INDEX `FK_dict_lan_play`(`dict_lang_id`) USING BTREE,
  INDEX `FK_dict_type_play`(`dict_type_id`) USING BTREE,
  CONSTRAINT `FK_dict_lan_play` FOREIGN KEY (`dict_lang_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_dict_type_play` FOREIGN KEY (`dict_type_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of play
-- ----------------------------
INSERT INTO `play` VALUES (1, 7, 14, '我和我的家乡','剧情', '电影《我和我的家乡》定档2020年国庆，延续《我和我的祖国》集体创作的方式，由张艺谋担当总监制，宁浩担任总导演，张一白担任总策划，宁浩、徐峥、陈思诚、闫非&彭大魔、邓超&俞白眉分别执导五个故事。', 'images/property/1.jpg', NULL, 120, 35, 0);
INSERT INTO `play` VALUES (2, 7, 14, '七号房的礼物','剧情', '《7号房的礼物》\r\n是由李焕庆执导，柳承龙、葛素媛、郑进永、朴信惠等主演的喜剧电影。影片讲述了蒙受不白之冤入狱的李龙久和为了给父亲洗去冤屈而不懈努力的女儿之间的故事。该片于2013年1月23日在韩国上映。并成为2013年韩国电影票房排名第一。\r\n\r\n1997年，只有6岁儿童智商的智障男子李海报海报(12张)龙久（柳承龙饰）和可爱的女儿艺胜（葛素媛饰）相依为命，生活虽然简单清贫，却充满幸福。某天，执着为女儿买美少女战士书包的龙久意外卷入一起幼童诱拐奸杀案，而死者竟是警察局长的女儿。龙久懵懂无知，搞不清状况，昏头昏脑就被投入监狱。在7号牢房中，聚集着走私犯苏杨浩、诈骗犯崔春浩、通奸犯姜万范、恐吓犯老徐和抢劫犯申奉植等五毒俱全的“社会渣滓”。龙久孩子般纯洁的心渐渐感动了这几个“大坏蛋”，他们甚至不惜冒险将艺胜带入牢房与父亲相会。黑暗冰冷的监牢内，7号牢房阳光满满。', 'images/property/5.jpg', NULL, 108, 30.00, 0);
INSERT INTO `play` VALUES (3, 9, 14, '天道王','剧情', '《天道王》\r\n是一部由缘世达国际影视文化传媒(北京)公司、奇雪文化投影城有限公司联合出品，苑本立执导，巩峥、陶红、杨钧丞、刘楚玄主演的电影。《天道王》以中国东北猎人加入抗日联军,与日军展开惨烈战斗为故事主线。主要讲述了抗战时期，东北深山老林猎人为了小家，为了国家奋起抗日英勇杀敌，为掩护东北抗联总部撤退，顽强阻击日军，谱写惊天动地抗日史诗的故事。东北抗日联军“十二烈士小孤山阻击战”和“李炮营阻击战”的原型故事；平民视角的东北猎人抗日；强情节、超反转的生死阻击。\r\n\r\n《天道王》以东北抗日联军为史料,以中国抗日战役中以少胜多最著名一次战役——“烈士山战役”为渊源,主要讲述了抗战时期,东北山野猎人奋起抗日救国,义勇军战败后猎人返山继续游猎生活,又谱写惊天动地抗日史诗的故事。 [1] 不愿做亡国奴的猎人们,1937年在抗联的感召下加入了抗联举起抗日救国大旗,成为主力,与日军斗智斗勇。1938年日军蓄谋大讨伐,猎人出身的十二名战士用生命全力阻击敌人,为抗联总部突围和群众转移赢得宝贵时间。', 'images/property/6.jpg', NULL, 125, 33.00, 0);
INSERT INTO `play` VALUES (4, 7, 14, '喜宝','剧情', '《喜宝》\r\n《喜宝》是由北京日光鼎盛影视文化有限公司、北京轴心影视文化有限公司出品的作品，王丹阳执导，郭采洁、张国柱主演。该片根据著名作家亦舒的原著同名小说改编的电影，讲述了成绩优异但家境贫寒的剑桥学生姜喜宝在飞机上认识了富家女勖聪慧，此后更是被其父亲和兄长追求，最终与其父勖存姿展开一段恋情，命运也因此彻底改变的故事。\r\n\r\n喜宝（郭采洁饰）因家庭困境中止了英国学业返回国内，在飞机上结识了单纯可爱的富家千金勖聪慧（李彦漫 饰），回国后先后遭遇了母亲过世、从未见过的父亲上门索要钱财，被房东赶出无家可归。勖家帮助喜宝摆脱了困境，同时喜宝也深陷勖家男人的感情旋涡。曾经想要很多很多爱的喜宝，忽然拥有了选择很多很多钱的机会，年轻的喜宝能否明白爱情的真谛……', 'images/property/8.jpg', NULL, 153, 42.00, 0);
INSERT INTO `play` VALUES (5, 6, 14, '姜子牙','剧情', '动画电影《姜子牙》的故事发生于封神大战后。姜子牙率领众神伐纣，赢得封神大战胜利，以为可以唤回世间安宁。然而，一切并未结束。一个偶然，姜子牙发现了原来“封神大战”之下酝酿着更大的阴谋。姜子牙开始踏上探寻真相的旅途......', 'images/property/2.jpg', NULL, 110, 40, 0);
INSERT INTO `play` VALUES (6, 7, 14, '夺冠','剧情', '2008年8月15日，北京奥运会女排比赛，中国VS美国。戴着金丝框眼镜的郎平（巩俐 饰）坐在美国队教练席上，大气沉稳，目光如电；中国队教练陈忠和（黄渤 饰）站在场边，全神贯注，面带笑容。陈忠和望向郎平，目光充满深意，不断经过的人影遮蔽了他的视线，中国女排三十余年的沉浮图景被缓缓打开……', 'images/property/3.jpg', NULL, 135, 38.00, 0);
INSERT INTO `play` VALUES (7, 7, 14, '一点就到家','剧情', '《一点就到家》\r\n是由陈可辛监制，许宏宇执导，刘昊然、彭昱畅、尹昉领衔主演的农村题材喜剧片。该片讲述了三个性格迥异的年轻人从大城市回到云南千年古寨开启创业旅程的故事。\r\n\r\n魏晋北（刘昊然 饰）、彭秀兵（彭昱畅 饰）、李绍群（尹昉 饰）三个性格迥异的年轻人从大城市回到云南千年古寨，机缘巧合下合伙干电商。三个年轻人在走弯路后，一拍即合携手开启创业之旅，他们明白了电商下乡，不仅仅是把城里面的东西卖到农村来，也是要把农村的东西卖出去。与古寨“格格不入”的他们用真诚改变了所有人，开启了一段纯真且荒诞的创业旅程。', 'images/property/7.jpg', NULL, 147, 35.00, 0);
INSERT INTO `play` VALUES (8, 13, 14, '急先锋','剧情', '中国商人秦国立在英国惨遭雇佣兵组织“北极狼”绑架，秦的女儿Fareeda（徐若晗 饰）也卷入其中，遭到追杀。千钧一发之际，急先锋国际安保团队成为他们唯一的希望，由总指挥唐焕庭（成龙饰）带领雷震宇（杨洋饰）、张凯旋（艾伦饰）、弥雅（母其弥雅饰）、神雕（朱正廷饰）等组成的急先锋行动小组，上天入地，辗转全球各地施展惊险营救。解救人质的过程中，竟发现“北极狼”背后的犯罪集团还策划了一场惊天密谋……', 'images/property/4.jpg', NULL, 108, 36.00, 0);
INSERT INTO `play` VALUES (9, 7, 14, '\r\n我在时间尽头等你','剧情', '林格（李鸿其 饰）一次次重启时空，只为与恋人邱倩（李一桐 饰）再次相遇。一生只爱一个人，希望开头是你，结尾也是你。2020年七夕最深情的告白: 我在时间尽头等你。', 'images/property/9.jpg', NULL, 115, 37.00, 0);



INSERT INTO play(play_name,play_kind,play_introduction,play_length,play_ticket_price) VALUES ('哆啦A梦：伴我同行2','剧情/动画','某天，大雄（大原惠美 配音）偶然发现了童年时奶奶为自己缝制的玩偶熊，于是央求哆啦A梦（水田山葵 配音）去往过去看望已不再人世的奶奶（宫本信子 配音），大雄与奶奶重逢之后，奶奶希望能看到大雄长大结婚时的样子.........',96 , 35);
INSERT INTO play(play_name,play_kind,play_introduction,play_length,play_ticket_price) VALUES ('寂静之地2 ','科幻/惊悚/恐怖','故事紧承上一部展开。在丈夫为保护家人牺牲后，伊芙琳（艾米莉·布朗特 饰）不得不独自带着孩子们（米莉森·西蒙斯、诺亚·尤佩 饰）面对全新的生存挑战。他们将被迫离开家园，踏上一段未知的旅途。在无声的世界里，除了要躲避“猎声怪物”的捕杀，铺满细沙的道路尽头还暗藏着新的危机。',97 ,37 );
INSERT INTO play(play_name,play_kind,play_introduction,play_length,play_ticket_price) VALUES ('九零后','纪录片','故土在战争中沦陷，大学被占领、被炸毁。一群十八九岁的青年学生，他们匆匆出发，徒步南迁，横穿湘黔滇，最终在昆明高原组建临时大学——由清华、北大、南开联合成立的西南联大........',110 ,38 );
INSERT INTO play(play_name,play_kind,play_introduction,play_length,play_ticket_price) VALUES ('匹诺曹','奇幻','改编自经典童话《木偶奇遇记》，讲述老木匠（罗伯托·贝尼尼 Roberto Benigni 饰）雕刻的木偶机缘巧合下获得生命，被木匠当作自己的儿子，并取名“匹诺曹”（费德里科·伊帕迪 Federico Ielapi 饰）。木匠耐心地教导匹诺曹，可贪玩的匹诺曹却跑到马戏团看木偶戏，并因此开启了一段离家之旅。',124, 35);
INSERT INTO play(play_name,play_kind,play_introduction,play_length,play_ticket_price) VALUES ('扫黑·决战','剧情/动作/犯罪','该片是国内首部以“扫黑除恶”行动为题材、展现全国扫黑办督办案件的影视化作品，讲述某扫黑专案组组长宋一锐带领组员由一起征地案深入调查，突破层层阻挠，与幕后的黑恶势力展开激烈斗争，最终揭开腐败官员利用公职权力充当犯罪保护伞的虚伪面具，将犯罪分子绳之以法的故事。',112,38 );
INSERT INTO play(play_name,play_kind,play_introduction,play_length,play_ticket_price) VALUES ('速度与激情9','动作/犯罪','“唐老大”多姆·托莱多（范·迪塞尔 饰）与莱蒂（米歇尔·罗德里格兹 饰）和他的儿子小布莱恩，过上了远离纷扰的平静生活。然而他们也知道，安宁之下总潜藏着危机。这一次，为了保护他所爱的人，唐老大不得不直面过去。他和伙伴们面临的是一场足以引起世界动荡的阴谋，以及一个前所未遇的一流杀手和高能车手.........',142,38);
INSERT INTO play(play_name,play_kind,play_introduction,play_length,play_ticket_price) VALUES ('悬崖之上','剧情/动作/悬疑','上世纪三十年代，四位曾在苏联接受特训的共产党特工组成任务小队，回国执行代号为“乌特拉”的秘密行动。由于叛徒的出卖，他们从跳伞降落的第一刻起， 就已置身于敌人布下的罗网之中。同志能否脱身，任务能否完成，雪一直下，立于“悬崖之上”的行动小组面临严峻考验。',120,35);
INSERT INTO play(play_name,play_kind,play_introduction,play_length,play_ticket_price) VALUES ('我要我们在一起','剧情/爱情','你有没有爱过一个人，曾经拼了命，只为和TA在一起。十年前，差生吕钦扬当众告白凌一尧，两人从校园步入社会，为了让她幸福，他不惜以命相搏。然而金钱、房子、婚姻等现实的考验，却将两人越推越远。十年长跑，他们能否还记得曾经刻在心底的约定：我要我们在一起。',105,37);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_parent` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `res_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `res_URL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`res_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `role_res_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_res_id`) USING BTREE,
  INDEX `FK_res_role`(`res_id`) USING BTREE,
  INDEX `FK_role_resource`(`role_id`) USING BTREE,
  CONSTRAINT `FK_res_role` FOREIGN KEY (`res_id`) REFERENCES `resource` (`res_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_role_resource` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale`  (
  `sale_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `sale_time` datetime DEFAULT NULL,
  `sale_payment` decimal(10, 2) DEFAULT NULL,
  `sale_change` decimal(10, 2) DEFAULT NULL,
  `sale_type` smallint(6) DEFAULT NULL COMMENT '类别取值含义：\r\n            1：销售单\r\n            -1：退款单',
  `sale_status` smallint(6) DEFAULT NULL COMMENT '销售单状态如下：\r\n            0：代付款\r\n            1：已付款',
  `sale_sort` smallint(6) DEFAULT NULL COMMENT '取值说明：\r\n            1：顾客自购/退票\r\n            0：售票员销售/退票',
  PRIMARY KEY (`sale_ID`) USING BTREE,
  INDEX `FK_customer_sale`(`cus_id`) USING BTREE,
  INDEX `FK_employee_sale`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_customer_sale` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_employee_sale` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sale_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_item`;
CREATE TABLE `sale_item`  (
  `sale_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) DEFAULT NULL,
  `sale_ID` bigint(20) DEFAULT NULL,
  `sale_item_price` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`sale_item_id`) USING BTREE,
  INDEX `FK_sale_sale_item`(`sale_ID`) USING BTREE,
  INDEX `FK_ticket_sale_item`(`ticket_id`) USING BTREE,
  CONSTRAINT `FK_sale_sale_item` FOREIGN KEY (`sale_ID`) REFERENCES `sale` (`sale_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ticket_sale_item` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `play_id` int(11) DEFAULT NULL,
  `sched_time` datetime NOT NULL,
  `sched_ticket_price` decimal(10, 2) DEFAULT NULL,
  `sched_status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`sched_id`) USING BTREE,
  INDEX `FK_play_sched`(`play_id`) USING BTREE,
  INDEX `FK_studio_sched`(`studio_id`) USING BTREE,
  CONSTRAINT `FK_play_sched` FOREIGN KEY (`play_id`) REFERENCES `play` (`play_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_studio_sched` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;



insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (2,10,"2021-5-28 09:32:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (4,10,"2021-5-28 12:52:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (5,10,"2021-5-28 19:24:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (1,11,"2021-5-28 9:24:00",37);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (3,11,"2021-5-28 14:38:00",37);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (5,11,"2021-5-28 22:24:00",37);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (2,12,"2021-5-29 10:56:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (3,12,"2021-5-29 16:24:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (4,12,"2021-5-29 23:10:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (1,13,"2021-6-1 08:10:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (1,13,"2021-6-1 12:25:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (5,13,"2021-6-1 21:17:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (1,14,"2021-5-1 11:17:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (3,14,"2021-5-1 15:23:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (4,14,"2021-5-1 19:24:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (1,15,"2021-5-21 09:24:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (5,15,"2021-5-21 15:14:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (4,15,"2021-5-21 23:36:00",38);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (4,16,"2021-4-30 09:36:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (5,16,"2021-4-30 12:46:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (5,16,"2021-4-30 24:36:00",35);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (2,17,"2021-5-20 8:46:00",37);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (5,17,"2021-5-20 11:38:00",37);
insert into schedule (studio_id,play_id,sched_time,sched_ticket_price) values (4,17,"2021-5-20 19:45:00",37);
-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_column` int(11) DEFAULT NULL,
  `seat_status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`seat_id`) USING BTREE,
  INDEX `FK_studio_seat`(`studio_id`) USING BTREE,
  CONSTRAINT `FK_studio_seat` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`studio_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for studio
-- ----------------------------
DROP TABLE IF EXISTS `studio`;
CREATE TABLE `studio`  (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `studio_row_count` int(11) DEFAULT NULL,
  `studio_col_count` int(11) DEFAULT NULL,
  `studio_introduction` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `studio_status` smallint(6) DEFAULT 1 COMMENT '说明：\r\n   0：禁用\r\n   1：启用',
  PRIMARY KEY (`studio_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of studio
-- ----------------------------
INSERT INTO `studio` VALUES (1, '1号厅', 8, 8, '1号厅', 1);
INSERT INTO `studio` VALUES (2, '激光MAX厅', 8, 8, '激光MAX厅', 1);
INSERT INTO `studio` VALUES (3, '全景声MAX厅', 10, 10, '全景声MAX厅', 1);
INSERT INTO `studio` VALUES (4, 'VIP厅', 8, 8, 'VIP厅', 1);
INSERT INTO `studio` VALUES (5, '杜比厅', 9, 9, '杜比厅', 1);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `sched_id` int(11) DEFAULT NULL,
  `ticket_price` decimal(10, 2) DEFAULT NULL,
  `ticket_status` smallint(6) DEFAULT NULL COMMENT '含义如下：\r\n            0：待销售\r\n            1：锁定\r\n            9：卖出',
  `ticket_locktime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加锁时间(下单后加锁)',
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `FK_sched_ticket`(`sched_id`) USING BTREE,
  INDEX `FK_seat_ticket`(`seat_id`) USING BTREE,
  CONSTRAINT `FK_sched_ticket` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_seat_ticket` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usr_role
-- ----------------------------
DROP TABLE IF EXISTS `usr_role`;
CREATE TABLE `usr_role`  (
  `usr_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`usr_role_id`) USING BTREE,
  INDEX `FK_role_user`(`role_id`) USING BTREE,
  INDEX `FK_user_role`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_role_user` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_role` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
