/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : mo

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 07/08/2023 14:08:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for movieman
-- ----------------------------
DROP TABLE IF EXISTS `movieman`;
CREATE TABLE `movieman`  (
  `mmId` int NOT NULL AUTO_INCREMENT,
  `mId` int NOT NULL,
  `mmImg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mmName` char(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mmRole` char(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`mmId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movieman
-- ----------------------------
INSERT INTO `movieman` VALUES (1, 1, 'imgs/movieman/zhuzhuxia.jpg', 'GGBond', '导演');
INSERT INTO `movieman` VALUES (2, 1, 'imgs/movieman/xiaodaidai.jpg', 'XiaoDai', '演员');

-- ----------------------------
-- Table structure for movies
-- ----------------------------
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies`  (
  `mId` int NOT NULL AUTO_INCREMENT,
  `mName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mImg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mYear` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mClass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mAddr` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mLong` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `mInfo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tId` int NOT NULL,
  `mScore` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`mId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO `movies` VALUES (1, '封神第一部：朝歌风云', 'imgs/fengshen.jpg', '2023-07-20', '动作 / 战争 / 奇幻 / 古装', '中国大陆', '148分钟', '商王殷寿（费翔 饰）勾结狐妖妲己（娜然 饰），暴虐无道，引发天谴。昆仑仙人姜子牙（黄渤 饰）携“封神榜”下山，寻找天下共主，以救苍生。西伯侯之子姬发（于适 饰）逐渐发现殷寿的本来面目，反出朝歌。各方势力暗流涌动，风云变幻端倪初显……', 1, '7.8');
INSERT INTO `movies` VALUES (2, '热烈', 'imgs/relie.jpg', '2023-07-28', '剧情 / 喜剧', '中国大陆', '124分钟', '舞老炮儿丁雷（黄渤 饰），偶遇卖艺少年陈烁（王一博 饰），丁雷忽悠陈烁加入自己经营的舞团。舞团内高手如云，性格各异，与陈烁碰撞出不同的火花，笑料不断。陈烁热烈追梦，期待着上场的机会，却发现丁雷邀请他其实另有目的，而丁雷和陈烁，也都将面对接二连三的沉重打击，他们能否逆风翻盘，回击人生难题？', 1, '7.3');
INSERT INTO `movies` VALUES (3, '巨齿鲨2：深渊', 'imgs/juchisha.jpg', '2023-08-04', '动作 / 科幻 / 冒险', '美国 / 中国大陆', '119分钟', '海洋霸主巨齿鲨，今夏再掀狂澜！乔纳斯·泰勒（杰森·斯坦森 饰）与科学家张九溟（吴京 饰）双雄联手，进入海底7000米深渊执行探索任务。他们意外遭遇史前巨兽海洋霸主巨齿鲨群的攻击，还将对战凶猛危险的远古怪兽群。惊心动魄的深渊冒险，巨燃巨爽的深海大战一触即发……', 1, '1');
INSERT INTO `movies` VALUES (4, '雪豹和她的朋友们', 'imgs/xuebaohetadepengyoumen.jpg', '2023-08-04', '纪录片', '中国大陆', '85分钟', '这是一部你从未见过的雪豹电影，这不仅仅是一部关于雪豹的电影。在包括三位藏族牧民在内的摄影团队六年的努力下，电影以独特的视角为我们呈现了神秘的“雪山之王”的故事。作为雪域高原的顶级掠食者，雪豹的生存并不容易，严酷的环境，求偶的竞争，繁衍的艰难……这些最真实的场景都被一一记录。越艰难的岁月越需要朋友，藏狐、鼠兔、藏棕熊、藏羚羊、斑头雁、高山兀鹫从陆地到天空，一直陪伴着雪豹；当地的牧民则给雪豹以最好的护卫。有了这些朋友，雪豹也不再显得孤单。\r\n　　本片里有我们从未如此近距离地观察到过的野生动物的生活，它们那么野性又灵动，在用尽全力绽放出璀璨的生命光芒。', 1, '1');
INSERT INTO `movies` VALUES (5, '芭比 Barbie', 'imgs/babi.jpg', '2023-07-21', '喜剧 / 奇幻 / 冒险', '加拿大 / 美国', '114分钟', '在芭比乐园里，各种各样的芭比和肯每天都过着童话般100%完美的生活。但是某一天，芭比（玛格特·罗比 Margot Robbie 饰）发现自己的生活开始有了变化——比如她的一天不再一帆风顺，她开始思考死亡的意义，甚至她的双脚也不再是完美的高跟鞋形——她竟然脚掌落地了！接连出现的不完美打破了芭比乐园的平静，意识到存在感危机的芭比被迫前往真实世界探寻真相，肯（瑞恩·高斯林 Ryan Gosling 饰）也一路同行，一场大冒险就此开启。', 1, '8.3');
INSERT INTO `movies` VALUES (6, '长安三万里', 'imgs/changansanwanli.jpg', '2023-07-08', '动画 / 历史', '中国大陆', '168分钟', '安史之乱爆发后数年，吐蕃大军攻打西南。大唐节度使高适交战不利，长安岌岌可危。困守孤城的高适向监军太监回忆起自己与李白的一生往事。', 1, '8.2');
INSERT INTO `movies` VALUES (7, '八角笼中', 'imgs/bajiaolongzhong.jpg', '2023-07-06', '剧情 / 动作', '中国大陆', '117分钟', '电影讲述了向腾辉（王宝强 饰）倾注心血想把当地无人照料的孩子培养成才，这让生活本没有出路的孩子们看到了一丝通向未来的曙光。然而，随着往日的表演视频被爆出，这些“残忍、血腥”的画面刺激了不明真相的人们的神经。一夜之间，舆论开始发酵。向腾辉的生活、孩子们的前途都陷入到人们以善良为名编织的大网中，让他们难以挣脱，重回泥沼，关于未来，他们的“出路”又将在哪……', 1, '7.5');
INSERT INTO `movies` VALUES (8, '命案', 'imgs/mingan.jpg', '2023-04-20', '剧情 / 犯罪', '中国香港', '108分钟', '一心帮凤姐化解“死劫”的命理大师（林家栋 饰），因凤姐独自离开而无法阻止她被残杀的命运。正当大师悲痛莫名之际却机缘巧合遇上送错外卖的茶餐厅少东（杨乐文 饰），并挑起了少东与生俱来的杀戮冲动。大师算出少东将会因杀人而犯牢狱之灾，少东害怕再陷囹圄，求大师帮忙改命。曾目睹少东杀猫的老差骨（吴延烨 饰）坚信少东是天生的心理变态，甩不掉嗜血本性，大师却认为既是天生，那错的不是少东，是命运！大师使尽风水术数、中西玄学，但总是人算不如天算，铩羽而归…黔驴技穷之际，老差骨步步进逼、凶手虎视眈眈、还有年轻凤姐（伍咏诗 饰）的致命诱惑，令少东的杀念越加炽烈，执刀就要踏上杀戮之路。而大师也频临精神崩溃，命中注定的大劫将至！\r\n　　一切皆是命，半点不由人？', 2, '7.3');
INSERT INTO `movies` VALUES (9, '我爱你!', 'imgs/woaini.jpg', '2023-06-21', '剧情 / 爱情 / 家庭', '中国大陆 / 中国香港', '116分钟', '空巢老人常为戒（倪大红 饰）和拾废品的孤寡老太李慧如（惠英红 饰）不打不相识，却渐渐互生情愫；年迈的谢定山（梁家辉 饰）、赵欢欣（叶童 饰）夫妻俩靠收卖废品为生，妻子赵欢欣更是一直深受疾病的困扰……四位老人，两对爱人，在步入生命终章之时，他们用力而纯粹地相爱。哪怕不再有明天，也要对彼此说出那句“我爱你！”。\r\n　　故事改编自韩国同名漫画。', 2, '7.9');
INSERT INTO `movies` VALUES (10, '来自收容所的爱', 'imgs/laizishourongsuodeai.jpg', '2022-10-24', '历史 / 战争', '日本', '134分钟', '讲述1945年日本投降后，被关押在战俘营的男子与自己的妻子怀抱着对爱的坚持，期待重逢的故事。', 2, '6.1');
INSERT INTO `movies` VALUES (11, '换命天堂', 'imgs/huangmingtiantang.jpg', '2023-07-27', '动作 / 科幻 / 惊悚', '德国', '117分钟', '妻子为偿还沉重的债务被迫放弃了40年寿命，这名男子也因此看到了自己供职的操纵时间的生物技术公司黑暗的一面。', 2, '6.7');
INSERT INTO `movies` VALUES (12, '三个火枪手：达达尼昂', 'imgs/sangehuopaoshou.jpg', '2023-04-05', '动作 / 历史 / 冒险', '法国', '121分钟', 'From the Louvre to Buckingham Palace, to the gutters of Paris to the siege of La Rochelle… In a kingdom divided by religious wars and under threat of British invasion, a handful of men and women will cross swords and tie their fate to that of France.', 2, '7.0');
INSERT INTO `movies` VALUES (13, '长相思', 'imgs/changxiangsi.jpg', '2023-07-24', '爱情 / 奇幻 / 古装', '中国大陆', '45分钟', '大荒内，人、神、妖混居，西炎、辰荣、皓翎三国鼎立。流落大荒的皓翎国王姬玖瑶（小夭）历经百年颠沛之苦，不但失去了身份，也失去了容貌，在清水镇落脚，成为了“无处可去、无人可依、无力自保”的玟小六。他悬壶为生恣意不羁。曾与小夭青梅竹马的西炎国王孙玱玹去了皓翎国做质子，即使寄人篱下、隐忍蛰伏，为了寻找小夭走遍大荒，来到清水镇。清水镇的日子平淡温馨，玟小六意外救了垂危的青丘公子涂山璟，朝夕相处中二人情愫渐生；玟小六又与九头妖相柳不打不相识，惺惺相惜结为知己。玟小六和玱玹相见不相识，几经波折，才终与玱玹相认，恢复王姬身份。为了一统天下，玱玹舍私情要王座，相柳守义战死、小夭帮助玱玹完成大业后，与涂山璟隐逸江湖。思而不得的玱玹将所有精力都放在了治理国家上，因为他知道，只要天下太平，他的小夭就能够幸福安康。', 3, '1');
INSERT INTO `movies` VALUES (14, '莲花楼', 'imgs/lianhualou.jpg', '2023-07-23', '剧情 / 悬疑 / 武侠 / 古装', '中国大陆', '45分钟', '该剧改编自藤萍的小说《吉祥纹莲花楼》。讲述了闻名武林的四顾门门主李相夷（成毅 饰）在一次大战后身受重伤，从此退隐江湖成为淡泊名利的“假神医”李莲花，在遇到新交方多病与旧敌笛飞声后重新卷入江湖的故事。江湖暗流涌动，疑团扑朔迷离，抽丝剥茧方能断出真相，一段荡气回肠的侠义情即将热血展开。', 3, '1');
INSERT INTO `movies` VALUES (15, '附身', 'imgs/fushen.jpg', '2023-07-28', '悬疑 / 恐怖', '日本', '60分钟', '山森めぐみによるマンガ「憑きそい」をもとにした本作。霊感が強い主人公・山川めぐみが、趣味の占いをきっかけにさまざまな人と出会い、恐怖体験に巻き込まれていくさまが描かれる。', 3, '1');
INSERT INTO `movies` VALUES (16, '这个美好的世界', 'imgs/zhegemeihaodeshijie.jpg', '2023-07-20', '剧情 / 喜剧', '日本', '60分钟', '若村麻由美将挑战一人分饰两角，讲述了在超市做兼职的家庭主妇滨冈妙子意外成为著名女演员若菜绢代替身的故事。妙子是一名和丈夫儿子一起生活的平凡主妇，而某一天，女演员若菜绢代的事务所的工作人员找上了她。若菜绢代因周刊杂志的丑闻而失踪，事务所希望长相和声音都一模一样的她可以冒充若菜。该剧前半部分描绘了主妇冒充女演员的闹剧，后半部分则展现了主角在面对娱乐圈与一般社会的不正与矛盾时所面临的困难和挑战。', 3, '6.5');
INSERT INTO `movies` VALUES (17, '惊奇的传闻2', 'imgs/jingqidechuanwen.jpg', '2023-07-29', '悬疑 / 奇幻', '韩国', '60分钟', '驱魔面馆凭借着新的力量与新晋员工，继续对抗以人类为食的邪灵。', 3, '7.0');
INSERT INTO `movies` VALUES (18, '快乐再出发', 'imgs/kuailezaichufa.jpg', '2022-07-05', '音乐 / 真人秀', '中国大陆', '87分钟', '《快乐再出发》是由芒果TV和大千影业联合出品的一档音乐旅行真人秀节目，在节目中，陈楚生、陆虎、苏醒、王栎鑫、王铮亮、张远六位哥哥再次集结，合体开启新旅程。他们在旅途中，经历过荒岛求生，体验过海边露营，也在剧组打工客串挣盒饭……有惊喜，有欢笑，更有感动。\r\n　　节目组针对快男们对自己团综的策划，结合实际预算“降级”处理， \"凑”出一次圆梦之旅。边走边唱成固定项目，快男们将自主设计这迟到的15年的团综，在高度自由向度下，将如何把自己安排的明明白白，这注定是一场充满离谱和意外的爆笑之旅。', 4, '9.6');
INSERT INTO `movies` VALUES (19, '种地吧', 'imgs/zhongdiba.jpg', '2023-02-04', '真人秀', '中国大陆', '90分钟', '该劳作纪实互动节目由陈少熙、何浩楠、蒋敦豪、李耕耘、李昊、鹭卓、王一珩、赵小童、卓沅、赵一博组成“种地小队”。节目真实记录10位年轻人，踏踏实实地用190天时间，在142亩土地上，播种、灌溉、施肥、收获。节目中成员们随着麦子一同成长，最终见证一粒麦子变成麦田，看到自己耕作的土地变成诗歌图园，以此传递“认真做好一件事”这种态度的实际意义和人生价值。', 4, '8.9');
INSERT INTO `movies` VALUES (20, '奔跑吧！兄弟', 'imgs/benpaoba.jpg', '2015-01-30', '喜剧', '中国大陆', '88分钟', '有这样一个传说，很久很久以前，雨林在孔雀公主的庇护下，生活着虎人和鹿人两个部落，直到某天黑虎挑起战争。惨烈的搏杀过后，虎人落败，黑虎死亡，但他的仇恨却穿越时空来到了21世纪。新年伊始，脱胎自韩国《Running Man》的大型综艺竞技娱乐节目、并由浙江卫视节目中心和韩国SBS电视台联合制作的《奔跑吧兄弟》创下了超高收视率，此番节目组》向忙着各自事业的团员们发出召集令，熊黛林、王宝强、杨颖、谢依霖、李晨、郑恺、王祖蓝在导游伊一的带领下集结三亚。但是这是一次极为凶险的旅程，跑男团的背叛者隐藏其中，相机而动，时刻准备将所有人的快乐摧毁无形……', 4, '3.6');
INSERT INTO `movies` VALUES (21, '快乐的大人', 'imgs/kuailededaren.jpg', '2023-06-26', '真人秀', '中国大陆', '100分钟', '节目以沈月、王敬轩、吴宇恒、周彦辰为核心的原生好友圈为主，通过让嘉宾自行策划并制作自己的节目为切口，共同寻找当代年轻人“快乐生活”的秘诀，鼓励更多年轻人一起做快乐的大人。', 4, '9.3');
INSERT INTO `movies` VALUES (22, '全员加速中', 'imgs/quanyuanjiasuzhong.jpg', '2015-11-06', '真人秀', '中国大陆', '105分钟', '湖南卫视第四季度周五大型创意实境游戏秀，中国版饥饿游戏。该节目引进自日本富士电视台的综艺游戏节目《全员逃走中》。', 4, '8.7');
INSERT INTO `movies` VALUES (23, '我在岛屿读书', 'imgs/wozaidaoyudushu.jpg', '2022-11-10', '真人秀', '中国大陆', '55分钟', '该节目是一档外景纪实类读书节目，邀请写书人、出书人、爱书人作为主要嘉宾，共同前往一座远离喧嚣的岛屿。在这里，他们生活、相处、读书、写作，享受阅读带来的乐趣和意义。节目用有意思、接地气的内容，将好的书目、好的阅读方式以及嘉宾关于读书写作有意义的思考呈现给观众和用户，拉近普通人与“阅读”的距离。', 4, '9.1');

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `tId` int NOT NULL AUTO_INCREMENT,
  `tName` char(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, '影院热映');
INSERT INTO `types` VALUES (2, '热门电影');
INSERT INTO `types` VALUES (3, '近期热门剧集');
INSERT INTO `types` VALUES (4, '近期热门综艺节目');
INSERT INTO `types` VALUES (5, '畅销图书');
INSERT INTO `types` VALUES (6, '热门单曲榜');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uId` int NOT NULL AUTO_INCREMENT,
  `uName` char(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `uPwd` char(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `uToken` char(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `uMovieSys` int NOT NULL,
  `uBookSys` int NOT NULL,
  `uMusicSys` int NOT NULL,
  `uMovieMark` int NOT NULL,
  `uBookMark` int NOT NULL,
  `uMusicMark` int NOT NULL,
  PRIMARY KEY (`uId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'lisi', '123456', '123123123', 4, 5, 6, 7, 8, 9);
INSERT INTO `users` VALUES (2, 'root', '123', '1691312409', 0, 0, 0, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
