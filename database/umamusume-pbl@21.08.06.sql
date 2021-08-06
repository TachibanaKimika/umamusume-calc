/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.18 : Database - umamusume-pbl
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`umamusume-pbl` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `umamusume-pbl`;

/*Table structure for table `skill` */

DROP TABLE IF EXISTS `skill`;

CREATE TABLE `skill` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `skill_type` int(20) DEFAULT NULL COMMENT '加速/回复/被动/固有/Debuff=>0/1/2/3/4',
  `skill_rare` int(10) DEFAULT NULL COMMENT '金/普=>0/1',
  `skill_long` int(5) DEFAULT NULL COMMENT '距离 无/短/m/中/长/沙=>0/1/2/3/4/5',
  `skill_sakusen` int(5) DEFAULT NULL COMMENT '作战 无/追/差/先/逃=>0/1/2/3/4',
  `skill_pt` int(10) DEFAULT NULL COMMENT '消耗技能点',
  `skill_dsc` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/*Data for the table `skill` */

insert  into `skill`(`id`,`skill_name`,`skill_type`,`skill_rare`,`skill_long`,`skill_sakusen`,`skill_pt`,`skill_dsc`) values 
(1,'疾風怒濤',0,0,0,1,180,'レース終盤に追い込み態勢に入り位置を上げる'),
(2,'キラーチューン',0,0,3,0,160,'レース中盤に前の方だと好位置を取りやすくなる'),
(3,'全身全霊',0,0,0,0,170,'ラストスパートで速度が上がる\n'),
(4,'先陣の心得',0,0,4,0,160,'レース中盤に大きく差をつけ先頭だとリードを保ちやすい\n'),
(5,'弧線のプロフェッサー',0,0,0,0,180,'コーナーが得意になり速度が上がる\n'),
(6,'昇り龍',0,0,0,2,180,'最終コーナーで外から追い抜くと速度が上がる\n'),
(8,'ギアチェンジ',0,0,2,0,160,'レース中盤に前の方にいると抜かしやすくなる\n'),
(10,'ハヤテ一文字',0,0,0,0,170,'直線で速度が上がる\n'),
(12,'マイルの支配者',0,0,2,0,160,'レース序盤に先頭だと差を広げやすくなる'),
(13,'脱出術',0,0,0,4,180,'レース中盤で前に行きやすくなる'),
(14,'姉御肌',0,0,2,0,120,'追い抜きが成功しやすくなる'),
(15,'迅速果断',0,0,0,2,180,'レース中盤で速度が上がる'),
(17,'電撃の煌めき',0,0,1,0,160,'レース終盤に後ろの方だとスパートしやすくなる'),
(18,'勝利への執念',0,0,3,0,160,'最終コーナーで追い抜かれると差し返しやすくなる'),
(19,'圧倒的リード',0,0,1,0,170,'レース中盤に大きく差をつけ先頭だとリードを保ちやすい'),
(20,'アガッてきた！',0,0,0,0,170,'レース中盤に追い抜くと速度が上がる'),
(21,'ノンストップガール',0,0,0,0,150,'ラストスパートで前が塞がれた時の立ち回りがうまくなる'),
(22,'スプリントターボ',0,0,1,0,160,'直線で加速力が上がる'),
(23,'決意の直滑降',0,0,0,3,120,'下り坂が少し得意になる'),
(24,'ライトニングステップ',0,0,3,0,140,'レース中盤に後ろの方にいると囲まれにくくなる'),
(25,'迫る影',0,0,0,1,180,'ラストスパートの直線で加速力が上がる'),
(26,'曲線のソムリエ',0,0,0,0,180,'華麗なコーナーワークで加速力が上がる'),
(27,'プランX',0,0,1,0,160,'レース中盤に前の方にいると抜かしやすくなる'),
(28,'アクセル全開！',0,0,2,0,160,'レース中盤に追い抜くと加速力が上がる'),
(29,'一陣の風',0,0,0,0,170,'直線で加速力が上がる'),
(30,'豪脚',0,0,2,0,160,'レース終盤に後ろの方だと追い抜く力が上がる'),
(31,'乗り換え上手',0,0,0,2,180,'レース終盤で加速力が上がる'),
(32,'努力家',0,0,0,2,120,'追い抜きが少し成功しやすくなる'),
(33,'逃亡者',0,0,0,4,180,'	最終コーナーで先頭をキープしやすくなる'),
(34,'先手必勝',0,0,0,4,120,'レース序盤で前に行きやすくなる'),
(35,'技巧派',0,0,0,3,120,'コース取りが少しスムーズになる'),
(36,'シックスセンス',0,0,0,4,110,'レース序盤に囲まれにくくなる'),
(37,'レーンの魔術師',0,0,0,0,120,'レース終盤にコース取りがうまくなる'),
(38,'注目の踊り子',0,0,0,0,120,'レース序盤にコース取りが上手くなる'),
(39,'大局観',0,0,0,2,120,'レース中盤に観察力が高まり視野を広く持てる'),
(40,'視界良好！異常なし！',0,0,0,1,110,'左右に移動すると状況を把握して視野が少し広くなる'),
(41,'千里眼',0,0,3,0,110,'レース序盤に観察力が高まり視野を広く持てる'),
(42,'コンセントレーション',0,0,0,0,140,'スタートが得意になり出遅れる時間がわずかに少なくなる'),
(43,'どこ吹く風',1,0,0,0,170,'レース中盤に囲まれると持久力が回復する'),
(44,'下校後のスペシャリスト',1,0,0,1,170,'下り坂で疲れにくくなる'),
(45,'レースプランナー',1,0,0,3,180,'レース中盤で疲れにくくなる'),
(46,'円弧のマエストロ',1,0,0,0,170,'無駄のないコーナリングで持久力が回復する'),
(47,'クールダウン',1,0,4,0,160,'直線に入ると息を入れて疲れにくくなる'),
(48,'食いしん坊',1,0,0,3,180,'レース中盤に持久力が回復する'),
(49,'好転一息',1,0,0,0,170,'直線で持久力が回復する'),
(50,'切り開く者',1,0,3,0,160,'レース中盤に先頭だと疲れにくくなる'),
(51,'じゃじゃウマ娘',1,0,0,4,180,'上り坂で疲れにくくなる'),
(52,'眠れる獅子',1,0,0,1,180,'レース中盤に脚を溜めて疲れにくくなる'),
(53,'慧眼',1,0,2,0,160,'レース序盤に後ろの方だと疲れにくくなる'),
(54,'神業ステップ',1,0,3,0,160,'左右に動いても疲れにくくなる'),
(55,'火事場のバ鹿力',1,0,4,0,160,'力を出し切った時に走る気力が復活する'),
(56,'不屈の心',1,0,0,0,170,'レース中盤に追い抜かれると持久力が回復する'),
(57,'鋼の意志',1,0,0,0,160,'レース序盤に前が詰まった時に強い意志を保ち持久力が回復する'),
(58,'余裕綽々',1,0,0,3,180,'レース序盤で疲れにくくなる'),
(59,'悩殺術',4,0,1,0,170,'レース序盤に前の方にいると後方のウマ娘が萎縮する'),
(60,'独占力',4,0,3,0,160,'レース終盤に後ろの方にいると前の速度を下げる'),
(61,'八方にらみ',4,0,0,2,180,'レース終盤に他のウマ娘が動揺する'),
(62,'魅惑のささやき',4,0,3,0,160,'レース中盤にすぐ前のウマ娘を戸惑わせる'),
(63,'奇術師',4,0,4,0,110,'レース終盤で前方のウマ娘の視野が狭くなる'),
(64,'幻惑のかく乱',4,0,0,3,110,'レース終盤に前の方にいると後方の視野が少し狭くなる'),
(65,'スーパーラッキーセブン',2,0,0,0,110,'枠番が7の時に良いことが起きる場合がある'),
(75,'内的体験',0,0,4,0,160,'最終コーナーで内ラチ側にいると速度が上がる');

/*Table structure for table `supportcard` */

DROP TABLE IF EXISTS `supportcard`;

CREATE TABLE `supportcard` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `spc_attribute` int(5) DEFAULT NULL COMMENT '速度-1,...,朋友-6',
  `spc_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `spc_secname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `spc_rare` int(5) DEFAULT NULL COMMENT 'R-1;SR-2;SSR-3',
  `spc_img` varchar(100) DEFAULT NULL,
  `spc_icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

/*Data for the table `supportcard` */

insert  into `supportcard`(`id`,`spc_attribute`,`spc_name`,`spc_secname`,`spc_rare`,`spc_img`,`spc_icon`) values 
(1,4,'スペシャルウィーク','日本一のステージを',3,'https://img.gamewith.jp/img/a68466cdef58b0d87a0893c306a53ce8.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_1.png'),
(2,1,'サイレンススズカ','輝く景色の、その先に',3,'https://img.gamewith.jp/img/4218db57fe94ef33188577231029ff63.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_2.png'),
(3,1,'トウカイテイオー','夢は掲げるものなのだっ！',3,'https://img.gamewith.jp/img/271cfa908203c6d43de931619e2966da.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_3.png'),
(4,2,'ゴールドシップ','不沈艦の進撃',3,'https://img.gamewith.jp/img/260241b684553d4564ea03f65d990aac.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_4.png'),
(5,3,'ウオッカ','ロード・オブ・ウオッカ',3,'https://img.gamewith.jp/img/bdea10472621cb94e18cb24fc7db47e5.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_5.png'),
(6,4,'グラスワンダー','千紫万紅にまぎれぬ一凛',3,'https://img.gamewith.jp/img/bc9820ace04b649ddca79485b26529d4.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_6.png'),
(7,3,'エルコンドルパサー','パッションチャンピオーナ！',3,'https://img.gamewith.jp/img/371ba3cc6079381bfc4d5f38c54096ec.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_7.png'),
(8,2,'セイウンスカイ','待望の大謀',3,'https://img.gamewith.jp/img/3201a45ddc7da46ebaf7cddfa19827dc.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_8.png'),
(9,2,'タマモクロス','天をも切り裂くイナズマ娘！',3,'https://img.gamewith.jp/img/afbea271fc9b558886807595fafd8569.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_9.png'),
(10,5,'ファインモーション','感謝は指先まで込めて',3,NULL,NULL),
(11,4,'アイネスフウジン','飛び出せ、キラメケ',3,'https://img.gamewith.jp/img/0dca21adff6b375512fefe905f3d2cae.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_11.png'),
(12,4,'ウイニングチケット','B・N・Winner!!',3,'https://img.gamewith.jp/img/5509576126661a26c80c93437a40a562.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_12.png'),
(13,5,'エアシャカール','7センチの先へ',3,NULL,NULL),
(14,1,'ゴールドシチー','Run(my)way',3,'https://img.gamewith.jp/img/994b4a07fcc9ab11b55778c18699a2d4.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_14.png'),
(15,1,'サクラバクシンオー','はやい！うまい！はやい！',3,'https://img.gamewith.jp/img/952c937842f8d8faf273e770361f756d.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_15.png'),
(16,2,'スーパークリーク','一粒の安らぎ',3,'https://img.gamewith.jp/img/cb8f8662641f1117303e994a47dde066.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_16.png'),
(17,3,'スマートファルコン','これが私のウマドル道☆',3,'https://img.gamewith.jp/img/a67539bb98a437d97be9b07e99701753.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_17.png'),
(18,1,'ニシノフラワー','まだ小さな蕾でも',3,'https://img.gamewith.jp/img/579edba3b1bc6be60dac8c484b559fe7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_18.png'),
(19,4,'ハルウララ','うらら～な休日',3,'https://img.gamewith.jp/img/49277001cb25e6748408087080dc0af3.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_91.png'),
(20,6,'駿川たづな','ようこそ、トレセン学園へ！',3,NULL,NULL),
(21,1,'ビコーペガサス','必殺！Wキャロットパンチ',3,'https://img.gamewith.jp/img/1b44e3b9dfda22a19cd227291e5c5cac.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_19.png'),
(22,2,'メジロマックイーン','『エース』として',3,'https://img.gamewith.jp/img/284ddae54139fe77ce2495d26da90922.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_92.png'),
(23,2,'ライスシャワー','『幸せ』が舞う時',3,'https://img.gamewith.jp/img/1e000277011c6f461d48ffed628989ff.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_93.png'),
(24,5,'フジキセキ','やれやれ、お帰り',2,NULL,NULL),
(25,5,'ダイワスカーレット','努力は裏切らない！',2,NULL,NULL),
(26,3,'ヒシアマゾン','テッペンに立て！',2,'https://img.gamewith.jp/img/7b034e90725fd6139ad1588d72bbb351.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_23.png'),
(27,4,'エアグルーヴ','副会長の一刺し',2,'https://img.gamewith.jp/img/e6b4075fbf6d4222091bd88211036a5a.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_24.png'),
(28,3,'アグネスデジタル','デジタル充電中＋',2,'https://img.gamewith.jp/img/ada20a606070bc21d0180c3bea81f5a4.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_25.png'),
(29,3,'ビワハヤヒデ','検証、開始',2,'https://img.gamewith.jp/img/d227894c4edc11c664d25dcbfbebbb6b.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_26.png'),
(30,2,'マヤノトップガン','カワイイ＋カワイイは～？',2,'https://img.gamewith.jp/img/637e7d6ddcd857c298b0e6a7b541a0d9.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_27.png'),
(31,2,'マンハッタンカフェ','雨の独奏、私の独創',2,'https://img.gamewith.jp/img/09dfc6e39607820eac3be468185829c6.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_28.png'),
(32,3,'ミホノブルボン','鍛えぬくトモ',2,'https://img.gamewith.jp/img/736dd6c952382d3b76ae6b959724ef5a.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_29.png'),
(33,3,'メジロライアン','鍛えて、応えて！',2,'https://img.gamewith.jp/img/3784bf829adc1cf0ad8cb2ebe3dad643.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_30.png'),
(34,4,'ユキノビジン','シチーガール入門＃',2,'https://img.gamewith.jp/img/86d1ff9a62c952f1f262e3fe893e5b1f.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_31.png'),
(35,5,'アグネスタキオン','生体Aに関する実験的研究',2,NULL,NULL),
(36,1,'エイシンフラッシュ','0500・定刻通り',2,'https://img.gamewith.jp/img/c2692e005dc29769fa60a5fd6f12430f.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_33.png'),
(37,1,'ナリタタイシン','波立つキモチ',2,'https://img.gamewith.jp/img/9ee67da72c498f23a3c2daed279bbccc.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_34.png'),
(38,5,'マーベラスサンデー','マーベラス☆大作戦',2,NULL,NULL),
(39,5,'マチカネフクキタル','運の行方',2,NULL,NULL),
(40,3,'オグリキャップ','『愛してもらうんだぞ』',3,'https://img.gamewith.jp/img/2f91f35a7138dcde097f45e9a42f9e89.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_94.png'),
(41,1,'スペシャルウィーク','夕焼けはあこがれの色',3,'https://img.gamewith.jp/img/0a810c1d91fa98a952e12e31ac6e5f4d.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_97.png'),
(42,1,'ツインターボ','ターボエンジン全開宣言！',3,'https://img.gamewith.jp/img/910847d404e73b5b75ff6a7c4281a900.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_98.png'),
(43,4,'メジロパーマー','バカと笑え',3,'https://img.gamewith.jp/img/1c9ef13869c0818a7930fcdf5bb5e8b7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_102.png'),
(44,4,'メイショウドトウ','幸せと背中合わせ',2,'https://img.gamewith.jp/img/3d7ed95d49a786e361af3a46c71e24b7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_37.png'),
(45,5,'メジロドーベル','目線は気にせず',2,NULL,NULL),
(46,4,'ナイスネイチャ','…ただの水滴ですって',2,'https://img.gamewith.jp/img/488a5880b11326efc36f24e3ad7d94af.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_39.png'),
(47,4,'マチカネタンホイザ','Just keep going.',3,'https://img.gamewith.jp/img/f39e195e3bcde2adc013ca24576f1e4d.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_106.png'),
(48,1,'キタサンブラック','迫る熱に押されて',3,'https://img.gamewith.jp/img/a967e4e64c611e3143472a50b0f39e98.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_108.png'),
(49,2,'サトノダイヤモンド','その背中を越えて',3,'https://img.gamewith.jp/img/a6aa32a60d4e0f2b894af3f7fafac9d7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_109.png'),
(50,1,'キングヘイロー','一流プランニング',2,'https://img.gamewith.jp/img/69fc1b9397a7ff8abbda09c86e761284.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_40.png'),
(51,6,'桐生院葵','共に同じ道を！',2,NULL,NULL),
(52,1,'スイープトウショウ','見習い魔女と長い夜',2,'https://img.gamewith.jp/img/a0a886a7157c51b43cd1b6eb3680f5ab.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_95.png'),
(53,3,'ダイタクヘリオス','パリピ・ぱーりないと！',2,'https://img.gamewith.jp/img/0d97f10cb63007859cdf65c2054c657d.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_99.png'),
(54,5,'イクノディクタス','準備運動は怠るべからず',2,NULL,NULL),
(55,5,'ナイスネイチャ','むじゃむじゃむじゃき',2,NULL,NULL),
(56,5,'ユキノビジン','ふるさと直送エール！',3,NULL,NULL),
(57,3,'ニシノフラワー','あなたにささげる',2,'https://img.gamewith.jp/img/68e1f56641ef29ab516ac2ecec5b6633.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_114.png'),
(58,3,'ウイニングチケット','夢はホントに叶うんだ！',3,'https://img.gamewith.jp/img/0ee584bd36cfad5218fd7fbbd402fa6c.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_115.png'),
(59,3,'ヤエノムテキ','押して忍べど燃ゆるもの',3,'https://img.gamewith.jp/img/ef48fb3feef97bb17215b0e5996b4e3c.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_116.png'),
(60,2,'ゼンノロブロイ','おすすめ本、あります！',2,'https://img.gamewith.jp/img/8ebdf5b3c956f9ab2bd64d21100c0cd0.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_117.png'),
(61,2,'サクラチヨノオー','今ぞ盛りのさくら花',3,'https://img.gamewith.jp/img/f56ccb28d31c0db9d068668b52c37578.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_120.png'),
(62,4,'シーキングザパール','世界の真珠、その名は',2,'https://img.gamewith.jp/img/7b2f76c8e1cfc9075cb26f17928eb378.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_121.png'),
(63,3,'トウカイテイオー','ふたつのノーブルライト',3,'https://img.gamewith.jp/img/a7a44329d0e77abd651778c5c2c7badc.jpg','https://img.gamewith.jp/img/d7492169016ed0b41fd0cae148d8ed53.jpg'),
(64,1,'カワカミプリンセス','花嫁たるもの！！',3,'https://img.gamewith.jp/img/bb7ff7e434083096df27bd17ed6711d7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_125.png'),
(65,4,'ヒシアケボノ','召しませふぁーすとBite！',3,'https://img.gamewith.jp/img/2077521f512ba29dc2ee30f60285b15e.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_126.png'),
(66,5,'メジロドーベル','おもい、ねがう',3,NULL,NULL),
(67,3,'バンブーメモリー','Head-on fight！',3,'https://img.gamewith.jp/img/0350dd72a3b881630edab04f1a8e62f0.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_130.png'),
(68,1,'シンコウウインディ','///WARNING GATE///',2,'https://img.gamewith.jp/img/8fc58e6d09aa0ae5f0da88cca2c987cc.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_131.png'),
(69,2,'ミホノブルボン','祝福はフーガ',3,'https://img.gamewith.jp/img/1f2318f56a3b6b5b0b9f454a5646201f.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_134.png'),
(70,5,'セイウンスカイ','明日は全国的に赤でしょう♪',3,NULL,NULL),
(71,3,'キングヘイロー','今宵、円舞曲にのせて',3,'https://img.gamewith.jp/img/f6d240281c611c3512dfdf80aeadeae6.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_136.png'),
(72,1,'ゴールドシップ','ウマ王伝説・最強になった件',3,'https://img.gamewith.jp/img/a79afbe756d5889fec5f20bfaeb32356.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_137.png'),
(73,1,'ナリタブライアン','Two Pieces',3,'https://img.gamewith.jp/img/a582abbd10fa59068d2c6452bfb8d049.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_138.png'),
(75,4,'メジロライアン','爽快！ウイニングショット！',3,'https://img.gamewith.jp/img/dca1cb8214033b9e19bbd78970dce7f8.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_139.png'),
(76,5,'メジロアルダン','その心に吹きすさぶ',2,NULL,NULL),
(77,4,'ツインターボ','集まってコンステレーション',3,'https://img.gamewith.jp/img/1a5ad4580b5840f281a71bb070a2b5be.jpg','https://img.gamewith.jp/img/500f3a72aa05140f9dcecff0e585a892.jpg'),
(78,1,'スイープトウショウ','ツメたいヒトリジメ？',3,'https://img.gamewith.jp/img/0427447fa0e86b4803f66ca4c3964ef3.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_144.png'),
(79,2,'ウイニングチケット','全力！タントラムッッ！',3,'https://img.gamewith.jp/img/696fb031996ca5a40c46aba234868c18.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_145.png'),
(80,3,'ダイワスカーレット','トライフル☆バケーション',3,'https://img.gamewith.jp/img/98eefe0bdb67bf4c666d9dd8d16a683b.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_146.png');

/*Table structure for table `supportcard_stu` */

DROP TABLE IF EXISTS `supportcard_stu`;

CREATE TABLE `supportcard_stu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `spc_id` int(10) DEFAULT NULL,
  `spc_lv` int(10) DEFAULT NULL,
  `spc_youujo` int(10) DEFAULT NULL COMMENT '友情',
  `spc_yaruki` int(10) DEFAULT NULL COMMENT 'やる気',
  `spc_tore` int(10) DEFAULT NULL COMMENT 'トレ効果',
  `spc_bonasu_pt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '▼各種ステータスボーナス',
  `spc_tokuitu` int(5) DEFAULT NULL,
  `spc_kizuna` int(5) DEFAULT NULL COMMENT '初期絆ゲージ',
  `spc_init_stu` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '初期賢さ',
  `spc_race` int(5) DEFAULT NULL COMMENT 'レースボーナス',
  `spc_fan` int(5) DEFAULT NULL COMMENT 'ファン数ボーナス',
  `spc_hit_lv` int(5) DEFAULT NULL COMMENT 'ヒントLv',
  `spc_hit_ritu` int(5) DEFAULT NULL COMMENT 'ヒント発生率',
  `spc_reduce_suta` int(5) DEFAULT NULL,
  `spc_reduce_shipai` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

/*Data for the table `supportcard_stu` */

insert  into `supportcard_stu`(`id`,`spc_id`,`spc_lv`,`spc_youujo`,`spc_yaruki`,`spc_tore`,`spc_bonasu_pt`,`spc_tokuitu`,`spc_kizuna`,`spc_init_stu`,`spc_race`,`spc_fan`,`spc_hit_lv`,`spc_hit_ritu`,`spc_reduce_suta`,`spc_reduce_shipai`) values 
(66,53,40,20,52,0,'0,0,0,0,0,0',75,23,'0,0,20,0,0,0',8,18,2,30,0,0),
(67,52,45,30,40,5,'0,0,0,0,0,1',50,25,'0,0,0,0,0,0',5,15,0,0,0,0),
(68,26,40,41,37,0,'0,0,0,0,0,0',46,23,'0,0,20,0,0,0',10,13,0,0,0,0),
(69,36,45,20,65,5,'1,0,0,0,0,0',35,25,'0,0,0,0,0,0',5,0,2,40,0,0),
(70,58,45,32,15,5,'0,0,1,0,0,0',35,42,'0,0,0,0,0,0',0,0,2,40,0,0),
(71,48,50,25,30,15,'0,0,1,0,0,0',116,35,'0,0,0,0,0,0',5,15,2,30,0,0),
(72,10,50,38,30,15,'0,0,0,0,1,0',35,15,'0,0,0,0,35,0',10,20,0,0,0,0),
(73,70,50,35,0,10,'2,0,0,0,0,0',20,30,'0,0,0,0,20,0',0,0,2,30,0,0),
(74,16,50,38,0,15,'0,1,0,0,0,0',62,30,'0,20,0,0,0,0',10,20,0,0,0,0),
(75,59,50,20,40,10,'0,0,1,0,0,0',20,20,'0,0,0,0,0,0',10,15,4,60,0,0),
(76,40,50,20,60,10,'0,0,2,0,0,0',35,25,'0,0,20,0,0,0',0,0,2,40,0,0),
(77,21,50,25,0,20,'1,0,0,0,0,0',62,30,'0,0,0,0,0,0',10,20,0,0,0,0),
(78,3,50,32,60,0,'0,0,1,0,0,0',35,25,'20,0,0,0,0,0',10,15,2,40,0,0),
(81,5,30,38,30,0,'0,0,0,0,0,0',80,20,'0,0,0,0,0,0',5,10,0,0,0,0),
(82,5,50,49,40,0,'0,0,1,0,0,0',98,25,'0,0,0,0,0,0',5,15,3,40,0,0),
(83,72,50,25,20,10,'0,0,1,0,0,1',0,20,'0,0,0,0,0,0',0,0,3,60,0,0),
(84,55,45,20,30,15,'0,0,0,0,1,0',0,30,'0,0,0,0,20,0',5,15,0,0,0,0),
(85,60,40,32,37,5,'0,0,0,0,0,0',60,20,'0,20,0,0,0,0',0,0,2,47,0,0),
(86,34,45,20,30,5,'0,0,1,1,0,0',60,25,'0,0,0,20,0,0',0,0,3,50,0,0),
(87,30,45,38,20,10,'0,0,0,0,0,1',62,0,'0,30,0,0,0,0',5,15,0,0,0,0),
(88,9,30,15,20,10,'0,0,0,0,0,0',0,25,'0,20,0,0,0,0',5,10,2,40,0,0),
(89,22,45,28,30,0,'0,1,0,1,0,0',50,20,'0,20,0,0,0,0',5,10,1,5,0,0),
(90,8,30,25,45,0,'0,0,0,0,0,0',80,20,'0,0,0,0,0,0',5,10,0,0,0,0),
(91,15,35,28,33,0,'1,0,0,0,0,0',40,36,'16,0,0,0,0,0',6,16,0,0,0,0),
(92,15,50,32,40,10,'1,0,0,0,0,0',50,40,'20,0,0,0,0,0',10,20,0,0,0,0),
(93,33,45,20,45,5,'0,1,0,0,0,0',0,25,'0,0,0,0,0,0',10,10,3,50,0,0),
(94,28,45,32,30,10,'0,0,0,0,0,1',0,30,'0,0,40,0,0,0',5,15,2,40,0,0),
(95,17,35,16,45,0,'0,1,1,0,0,0',25,21,'0,0,20,0,0,0',0,0,2,33,0,0),
(96,41,50,35,30,5,'1,0,0,0,0,0',30,10,'0,0,0,0,0,0',10,10,0,0,0,0),
(97,18,35,16,38,6,'1,0,0,0,0,0',0,42,'0,0,0,0,0,0',5,11,2,42,0,0),
(98,8,50,35,55,0,'0,1,0,0,0,0',98,25,'0,0,0,0,0,0',5,15,3,40,0,0),
(99,68,45,38,30,5,'1,0,0,0,0,0',35,15,'25,0,0,0,0,0',10,20,0,0,0,0),
(100,42,50,20,75,10,'1,0,0,0,0,0',35,25,'0,0,0,0,0,0',5,0,2,40,0,0),
(101,64,50,30,30,0,'1,0,1,0,0,0',35,30,'45,0,0,0,0,0',10,20,0,0,0,0),
(102,20,30,0,0,0,'0,0,0,0,0,0',0,25,'0,0,0,0,0,0',0,0,0,0,20,30),
(103,50,40,20,30,5,'1,0,0,0,0,0',60,23,'20,0,0,0,0,0',0,0,2,47,0,0),
(104,7,30,26,30,0,'0,0,0,0,0,0',62,20,'0,0,15,0,0,0',5,15,0,0,0,0),
(105,58,50,32,30,5,'0,0,1,0,0,0',35,45,'0,0,0,0,0,0',0,0,2,40,0,0),
(106,53,45,20,55,0,'0,0,1,0,0,0',80,25,'0,0,20,0,0,0',10,20,2,30,0,0),
(107,78,50,49,0,0,'1,0,0,0,0,1',65,0,'25,0,0,0,0,0',10,20,0,0,0,0),
(108,79,30,15,35,0,'0,1,0,0,0,0',0,25,'0,0,0,0,0,0',0,0,2,20,0,0),
(109,79,50,20,45,0,'0,1,0,1,0,0',0,35,'0,0,0,0,0,0',10,15,3,50,0,0),
(110,80,50,25,0,10,'0,0,1,0,0,0',20,15,'0,0,50,0,0,0',0,0,3,40,0,0),
(111,59,30,15,30,10,'0,0,0,0,0,0',20,0,'0,0,0,0,0,0',0,0,2,40,0,0);

/*Table structure for table `supportcard_stu_user` */

DROP TABLE IF EXISTS `supportcard_stu_user`;

CREATE TABLE `supportcard_stu_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `spc_id` int(10) DEFAULT NULL,
  `spc_lv` int(10) DEFAULT NULL,
  `spc_youujo` int(10) DEFAULT NULL COMMENT '友情',
  `spc_yaruki` int(10) DEFAULT NULL COMMENT 'やる気',
  `spc_tore` int(10) DEFAULT NULL COMMENT 'トレ効果',
  `spc_bonasu_pt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '▼各種ステータスボーナス',
  `spc_tokuitu` int(5) DEFAULT NULL,
  `spc_kizuna` int(5) DEFAULT NULL COMMENT '初期絆ゲージ',
  `spc_init_stu` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '初期賢さ',
  `spc_race` int(5) DEFAULT NULL COMMENT 'レースボーナス',
  `spc_fan` int(5) DEFAULT NULL COMMENT 'ファン数ボーナス',
  `spc_hit_lv` int(5) DEFAULT NULL COMMENT 'ヒントLv',
  `spc_hit_ritu` int(5) DEFAULT NULL COMMENT 'ヒント発生率',
  `spc_reduce_suta` int(5) DEFAULT NULL,
  `spc_reduce_shipai` int(5) DEFAULT NULL,
  `spc_uuid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

/*Data for the table `supportcard_stu_user` */

insert  into `supportcard_stu_user`(`id`,`spc_id`,`spc_lv`,`spc_youujo`,`spc_yaruki`,`spc_tore`,`spc_bonasu_pt`,`spc_tokuitu`,`spc_kizuna`,`spc_init_stu`,`spc_race`,`spc_fan`,`spc_hit_lv`,`spc_hit_ritu`,`spc_reduce_suta`,`spc_reduce_shipai`,`spc_uuid`) values 
(112,64,50,30,30,0,'1,0,1,0,0,0',35,30,'45,0,0,0,0,0',10,20,0,0,0,0,123456789),
(113,64,50,30,30,0,'1,0,1,0,0,0',35,30,'45,0,0,0,0,0',10,20,0,0,0,0,NULL),
(114,21,50,25,0,20,'1,0,0,0,0,0',62,30,'0,0,0,0,0,0',10,20,0,0,0,0,NULL);

/*Table structure for table `uma` */

DROP TABLE IF EXISTS `uma`;

CREATE TABLE `uma` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uma_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uma_secname` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `uma` */

insert  into `uma`(`id`,`uma_name`,`uma_secname`) values 
(1,'メジロライアン','ストレート・ライン'),
(2,'アグネスタキオン','tach-nology'),
(3,'ウイニングチケット','Go To Winning!'),
(4,'サクラバクシンオー','サクラ、すすめ！'),
(5,'ハルウララ','うららん一等賞♪'),
(6,'マチカネフクキタル','運気上昇☆幸福万来'),
(7,'ナイスネイチャ','ポインセチア・リボン'),
(8,'キングヘイロー','キング・オブ・エメラルド'),
(9,'ゴールドシップ','レッドストライフ'),
(10,'ウオッカ','ワイルドトップギア'),
(11,'ダイワスカーレット','トップ・オブ・ブルー'),
(12,'グラスワンダー','岩穿つ青'),
(13,'エルコンドルパサー','エル☆Número 1'),
(14,'エアグルーヴ','エンプレスロード'),
(15,'マヤノトップガン','すくらんぶる☆ゾーン'),
(16,'スーパークリーク','マーマリングストリーム'),
(17,'スペシャルウィーク','スペシャルドリーマー'),
(18,'サイレンススズカ','サイレントイノセンス'),
(19,'トウカイテイオー','トップ・オブ・ジョイフル'),
(20,'マルゼンスキー','フォーミュラオブルージュ'),
(21,'オグリキャップ','スターライトビート'),
(22,'タイキシャトル','ワイルド・フロンティア'),
(23,'メジロマックイーン','エレガンス・ライン'),
(24,'シンボリルドルフ','ロード・オブ・エンペラー'),
(25,'ライスシャワー','ローゼスドリーム'),
(26,'テイエムオペラオー','オー・ソレ・スーオ！'),
(27,'ミホノブルボン','MB-19890425\r\n'),
(28,'ビワハヤヒデ','pf.Victory formula...\r\n'),
(29,'トウカイテイオー','ビヨンド・ザ・ホライズン'),
(30,'メジロマックイーン','エンド・オブ・スカイ'),
(31,'カレンチャン','フィーユ・エクレール'),
(32,'ナリタタイシン','Nevertheless'),
(33,'スマートファルコン','あぶそりゅーと☆LOVE'),
(34,'ナリタブライアン','Maverick'),
(35,'マヤノトップガン','サンライト・ブーケ'),
(36,'エアグルーヴ','クエルクス・キウィーリス'),
(37,'セイウンスカイ','あおぐもサミング'),
(38,'ヒシアマゾン','アマゾネス・ラピス'),
(39,'グラスワンダー','セイントジェード・ヒーラー'),
(40,'エルコンドルパサー','ククルカン・モンク'),
(41,'フジキセキ','シューティンスタァ・ルヴュ'),
(42,'ゴールドシチー','オーセンティック/1928'),
(43,'スペシャルウィーク','ほっぴん♪ビタミンハート'),
(44,'マルゼンスキー','ぶっとび☆さまーナイト');

/*Table structure for table `umasingle` */

DROP TABLE IF EXISTS `umasingle`;

CREATE TABLE `umasingle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uma_name` int(10) DEFAULT NULL,
  `uma_speed` int(10) DEFAULT NULL,
  `uma_stamina` int(10) DEFAULT NULL,
  `uma_power` int(10) DEFAULT NULL,
  `uma_grit` int(10) DEFAULT NULL,
  `uma_intelligence` int(10) DEFAULT NULL,
  `uma_total` int(10) DEFAULT NULL,
  `uma_ranknum` int(10) DEFAULT NULL,
  `uma_rank` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uma_sc1` int(5) DEFAULT NULL,
  `uma_sc2` int(5) DEFAULT NULL,
  `uma_sc3` int(5) DEFAULT NULL,
  `uma_sc4` int(5) DEFAULT NULL,
  `uma_sc5` int(5) DEFAULT NULL,
  `uma_sc6` int(5) DEFAULT NULL,
  `uma_scl1` int(5) DEFAULT NULL,
  `uma_scl2` int(5) DEFAULT NULL,
  `uma_scl3` int(5) DEFAULT NULL,
  `uma_scl4` int(5) DEFAULT NULL,
  `uma_scl5` int(5) DEFAULT NULL,
  `uma_scl6` int(5) DEFAULT NULL,
  `uma_wheninsert` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uma_skill` json DEFAULT NULL,
  `uma_user_id` int(20) DEFAULT NULL,
  `uma_others` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

/*Data for the table `umasingle` */

insert  into `umasingle`(`id`,`uma_name`,`uma_speed`,`uma_stamina`,`uma_power`,`uma_grit`,`uma_intelligence`,`uma_total`,`uma_ranknum`,`uma_rank`,`uma_sc1`,`uma_sc2`,`uma_sc3`,`uma_sc4`,`uma_sc5`,`uma_sc6`,`uma_scl1`,`uma_scl2`,`uma_scl3`,`uma_scl4`,`uma_scl5`,`uma_scl6`,`uma_wheninsert`,`uma_skill`,`uma_user_id`,`uma_others`) values 
(27,7,847,580,982,255,328,2992,9120,'B+',48,58,41,36,5,59,30,40,50,45,30,50,'2021-05-12 04:16:12',NULL,NULL,NULL),
(29,14,940,621,1067,307,471,3406,11118,'A',28,33,41,36,5,48,45,45,50,45,30,50,'2021-05-12 18:01:32',NULL,NULL,NULL),
(30,14,836,796,848,340,290,3110,10709,'A',58,33,41,48,5,59,40,45,50,30,30,50,'2021-05-12 23:54:58',NULL,NULL,NULL),
(31,19,1023,883,716,470,414,3506,11722,'A',36,48,41,52,30,16,45,30,50,40,45,50,'2021-05-13 00:49:43',NULL,NULL,NULL),
(32,21,1179,630,1099,259,370,3537,12135,'A+',58,28,41,36,5,48,40,45,50,50,30,50,'2021-05-13 12:05:12',NULL,NULL,NULL),
(33,12,1107,678,932,286,438,3441,11040,'A',58,28,41,36,5,48,40,45,50,45,30,50,'2021-05-13 14:28:59',NULL,NULL,NULL),
(34,9,755,914,819,330,366,3184,9932,'B+',28,30,33,58,5,16,45,45,45,40,30,50,'2021-05-13 23:49:56',NULL,NULL,NULL),
(35,24,1026,747,698,377,470,3318,10494,'A',58,48,41,36,5,20,40,30,50,45,30,50,'2021-05-14 18:44:28',NULL,NULL,NULL),
(36,24,1132,703,710,406,412,3363,11424,'A',30,48,41,36,5,20,45,30,50,45,30,50,'2021-05-14 21:59:09',NULL,NULL,NULL),
(37,21,834,636,866,296,574,3206,10306,'A',36,48,41,33,58,10,45,30,50,45,40,50,'2021-05-15 01:05:18',NULL,NULL,NULL),
(38,21,1171,605,913,415,535,3639,12037,'A',36,45,41,58,33,48,45,45,50,40,45,50,'2021-05-15 12:00:38',NULL,NULL,NULL),
(39,12,993,660,865,262,605,3385,10852,'A',36,45,41,58,33,48,45,45,50,40,45,50,'2021-05-15 14:57:12',NULL,NULL,NULL),
(40,18,1033,609,745,369,649,3405,10899,'A',36,45,41,58,33,48,45,45,50,40,45,50,'2021-05-16 03:46:32',NULL,NULL,NULL),
(41,24,889,1071,623,485,412,3480,11227,'A',36,48,41,20,30,16,45,30,50,30,45,50,'2021-05-16 13:31:00',NULL,NULL,NULL),
(42,12,1200,760,854,310,453,3577,12048,'A',36,20,41,45,30,16,45,30,50,45,45,50,'2021-05-16 17:31:16',NULL,NULL,NULL),
(43,9,554,1174,783,400,536,3447,11576,'A',33,20,28,45,30,16,45,30,45,45,45,50,'2021-05-16 21:05:55',NULL,NULL,NULL),
(44,14,924,678,938,326,431,3297,10715,'A',36,28,41,20,33,48,45,45,50,30,45,50,'2021-05-16 22:32:37',NULL,NULL,NULL),
(45,5,753,563,730,1151,481,3678,11336,'A',34,47,51,51,30,1,45,50,45,40,45,50,'2021-05-17 01:27:17',NULL,NULL,NULL),
(46,5,710,540,638,855,521,3264,9163,'B+',34,39,51,20,30,43,45,50,45,30,50,50,'2021-05-17 03:33:23',NULL,NULL,NULL),
(47,10,1142,597,902,298,355,3294,10613,'A',33,36,28,41,52,48,45,45,40,50,40,50,'2021-05-17 13:09:38',NULL,NULL,NULL),
(48,12,1200,760,854,310,453,3577,12048,'A',33,20,28,41,52,48,45,30,45,50,40,50,'2021-05-17 17:00:14',NULL,NULL,NULL),
(49,24,990,1059,495,444,410,3398,11219,'A',30,20,36,41,52,16,45,30,45,50,40,50,'2021-05-18 00:35:13',NULL,NULL,NULL),
(50,15,1086,935,552,391,355,3319,10895,'A',8,20,36,41,52,16,30,30,45,50,40,50,'2021-05-18 11:59:50',NULL,NULL,NULL),
(51,24,1022,990,464,381,567,3424,11034,'A',30,20,36,41,52,16,45,30,45,50,40,50,'2021-05-18 16:01:40',NULL,NULL,NULL),
(54,14,997,866,776,398,394,3431,11071,'A',36,28,41,20,33,48,45,45,50,30,45,50,'2021-05-21 02:16:05',NULL,NULL,NULL),
(55,7,997,737,851,315,399,3299,10689,'A',36,41,30,28,33,48,45,50,45,45,45,50,'2021-05-24 03:50:41',NULL,NULL,NULL),
(56,10,1190,622,1162,281,357,3612,12054,'A',58,33,36,41,28,48,45,45,45,50,45,50,'2021-05-25 18:48:32',NULL,NULL,NULL),
(57,22,1200,638,783,247,471,3339,10826,'A',58,33,15,41,28,48,45,45,35,50,45,50,'2021-05-27 01:39:58',NULL,NULL,NULL),
(59,15,1033,1007,432,581,446,3499,11345,'A',20,8,19,41,36,16,30,30,50,50,45,50,'2021-05-30 02:00:03',NULL,NULL,NULL),
(60,13,1200,639,759,370,477,3445,11750,'A',36,45,41,30,20,48,45,45,50,45,30,50,'2021-05-30 02:07:06',NULL,NULL,NULL),
(63,24,856,1134,513,454,469,3426,11268,'A',36,48,41,30,20,16,45,30,50,45,30,50,'2021-06-02 00:47:31',NULL,NULL,NULL),
(64,13,861,883,532,409,536,3221,10291,'A',41,36,20,30,45,16,50,45,30,45,45,50,'2021-06-02 00:56:53',NULL,NULL,NULL),
(65,24,868,897,618,455,426,3264,10950,'A',41,36,20,30,48,16,50,45,30,45,30,50,'2021-06-02 01:52:28',NULL,NULL,NULL),
(66,24,859,1013,550,457,387,3266,10065,'A',41,36,20,30,52,16,50,45,30,45,40,50,'2021-06-02 19:26:56',NULL,NULL,NULL),
(67,13,1200,647,692,366,644,3549,12175,'A+',41,36,20,30,45,48,50,45,30,45,45,50,'2021-06-03 02:03:33',NULL,NULL,NULL),
(68,21,1037,586,984,284,394,3285,10801,'A',41,36,20,48,58,5,50,45,30,30,45,50,'2021-06-03 15:31:09',NULL,NULL,NULL),
(69,29,1051,1009,568,399,360,3387,11690,'A',41,36,20,48,30,16,50,45,30,30,45,45,'2021-06-03 18:56:35',NULL,NULL,NULL),
(71,9,1068,1067,717,407,343,3602,11711,'A',36,48,41,30,20,16,45,30,50,30,30,50,'2021-06-04 20:32:23',NULL,NULL,NULL),
(72,7,1045,639,962,300,329,3275,10853,'A',41,36,20,28,58,48,50,45,30,45,45,50,'2021-06-05 14:06:17',NULL,NULL,NULL),
(75,36,814,708,1082,258,347,3209,10496,'A',41,48,58,18,36,5,50,30,45,35,45,50,'2021-06-06 22:19:27',NULL,NULL,NULL),
(76,35,1012,877,547,363,496,3295,10244,'A',41,48,8,18,36,16,50,30,30,35,45,50,'2021-06-07 02:09:56',NULL,NULL,NULL),
(77,35,1166,948,488,422,579,3603,12059,'A',41,48,8,18,36,16,50,30,30,35,45,50,'2021-06-07 12:33:00',NULL,NULL,NULL),
(78,19,1190,942,499,504,380,3515,11910,'A',48,36,41,20,30,16,30,45,50,30,45,50,'2021-06-07 19:39:05',NULL,NULL,NULL),
(80,19,1070,995,482,502,435,3484,11225,'A',41,48,30,57,36,16,50,30,45,35,45,50,'2021-06-08 20:32:20',NULL,NULL,NULL),
(82,37,1056,906,609,383,684,3638,11565,'A',52,48,55,41,30,16,40,30,45,50,45,50,'2021-06-10 20:54:02',NULL,NULL,NULL),
(84,21,1058,540,684,261,569,3112,11021,'A',55,48,18,41,58,5,45,30,35,50,45,50,'2021-06-11 19:19:12',NULL,NULL,NULL),
(85,5,1200,646,966,352,393,3557,11422,'A',52,20,28,41,58,48,40,30,45,50,45,50,'2021-06-12 20:28:35',NULL,NULL,NULL),
(86,22,1200,450,747,317,588,3302,10723,'A',52,55,15,41,58,48,45,45,35,50,45,50,'2021-06-12 20:29:57',NULL,NULL,NULL),
(87,8,926,597,1025,253,360,3161,9985,'B+',33,52,58,5,28,48,45,45,45,30,45,50,'2021-06-12 20:55:44',NULL,NULL,NULL),
(88,37,976,1046,491,375,377,3265,10580,'A',48,52,41,22,30,16,30,45,50,40,40,50,'2021-06-13 16:32:52',NULL,NULL,NULL),
(91,37,942,727,820,264,574,3327,10582,'A',5,41,52,58,17,48,30,50,45,45,35,50,'2021-06-13 21:49:07',NULL,NULL,NULL),
(92,12,972,625,880,234,508,3219,10258,'A',66,52,48,36,58,40,50,45,30,45,45,50,'2021-06-22 01:50:01',NULL,NULL,NULL),
(93,19,1200,1198,538,439,357,3732,13143,'A+',30,48,52,41,22,16,45,30,45,50,40,50,'2021-06-22 01:54:20',NULL,NULL,NULL),
(94,35,1187,908,531,342,451,3419,11628,'A',51,48,52,41,22,16,45,30,45,50,40,50,'2021-06-22 01:55:22',NULL,NULL,NULL),
(95,2,1079,825,629,375,529,3437,11156,'A',30,48,52,41,22,16,45,30,45,50,40,50,'2021-06-22 01:56:16',NULL,NULL,NULL),
(96,37,1173,589,761,351,518,3392,11341,'A',36,48,52,41,5,40,45,30,45,50,30,50,'2021-06-22 02:01:53',NULL,NULL,NULL),
(97,4,1175,426,605,313,842,3361,11425,'A',55,48,52,10,20,59,45,30,45,30,30,50,'2021-06-22 02:03:21',NULL,NULL,NULL),
(98,12,1187,640,1028,240,465,3560,12024,'A',58,36,52,5,48,40,45,45,45,30,30,50,'2021-06-22 02:05:04',NULL,NULL,NULL),
(99,22,1187,535,838,269,475,3304,10763,'A',15,58,52,5,48,21,35,45,45,30,30,50,'2021-06-22 02:07:07',NULL,NULL,NULL),
(100,18,1068,417,620,1006,878,3989,12228,'A+',47,34,19,66,55,11,50,45,50,50,45,50,'2021-06-22 02:08:50',NULL,NULL,NULL),
(101,37,1195,587,725,301,479,3287,10757,'A',48,52,5,58,20,21,30,45,30,45,30,50,'2021-06-28 22:00:07',NULL,NULL,NULL),
(102,37,1200,591,574,354,798,3517,11728,'A',18,48,55,52,45,21,35,30,45,45,45,50,'2021-06-28 22:12:25',NULL,NULL,NULL),
(103,37,1186,588,738,316,496,3324,11100,'A',20,48,17,52,58,3,30,30,35,45,45,50,'2021-06-28 22:18:32',NULL,NULL,NULL),
(104,4,1200,451,472,284,887,3294,11476,'A',48,55,45,52,20,21,30,45,45,45,30,50,'2021-06-28 22:33:18',NULL,NULL,NULL),
(105,12,1200,615,887,286,352,3340,11075,'A',48,26,17,52,20,21,30,40,35,45,30,50,'2021-06-28 22:46:07',NULL,NULL,NULL),
(106,16,1117,848,526,446,435,3372,11311,'A',20,52,30,22,48,21,30,45,45,40,30,50,'2021-06-28 22:47:53',NULL,NULL,NULL),
(107,21,1027,645,859,275,424,3230,10653,'A',48,20,5,58,41,3,30,30,30,45,50,50,'2021-06-28 22:52:12',NULL,NULL,NULL),
(108,37,1010,618,831,255,445,3159,10281,'A',36,52,26,20,58,48,45,45,40,30,45,50,'2021-07-08 14:08:23',NULL,NULL,NULL),
(109,35,959,953,566,479,468,3425,10803,'A',36,52,60,22,8,48,45,45,40,45,30,50,'2021-07-08 14:09:53',NULL,NULL,NULL),
(110,18,1139,432,508,1134,735,3948,13126,'A+',47,34,66,55,19,11,50,45,50,45,50,50,'2021-07-08 14:12:16',NULL,NULL,NULL),
(111,18,1147,482,635,1200,643,4107,13522,'A+',47,34,66,25,19,11,50,45,50,45,50,50,'2021-07-08 14:12:59',NULL,NULL,NULL),
(112,8,1200,471,1049,315,357,3392,12034,'A',15,52,26,36,58,48,35,45,40,45,45,50,'2021-07-08 14:16:11',NULL,NULL,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_uuid` int(30) NOT NULL,
  `user_group` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_password`,`user_uuid`,`user_group`) values 
(31,'onachinene','453051f7e7706513cb419041f2c83f6df00bea0b8345e44273667237fd9a6593',203621836,'admin'),
(32,'test','45c4771dcd1cbd65babf3dd8cd70fed56d428fe708183ba1d146f0ad153773d7',123456789,'user'),
(33,'yuzu','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',142412242,'user'),
(34,'qqq','453051f7e7706513cb419041f2c83f6df00bea0b8345e44273667237fd9a6593',123456781,'user'),
(35,'cnmTest','7e00056baed3217a27b3cc1e4371d4975ad62236af2c80abac71c113db57431b',999999999,'user'),
(36,'cnmTest1','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',999999998,'user');

/*Table structure for table `util_table` */

DROP TABLE IF EXISTS `util_table`;

CREATE TABLE `util_table` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name_id` int(5) DEFAULT NULL,
  `categ_name` char(20) DEFAULT NULL,
  `util_name` char(20) DEFAULT NULL,
  `util_name_sec` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `util_table` */

insert  into `util_table`(`id`,`name_id`,`categ_name`,`util_name`,`util_name_sec`) values 
(1,1,'spc_attribute','スビート',NULL),
(2,2,'spc_attribute','スタミナ',NULL),
(3,3,'spc_attribute','パワー',NULL),
(4,4,'spc_attribute','根性',NULL),
(5,5,'spc_attribute','賢さ',NULL),
(6,6,'spc_attribute','友人',NULL),
(7,1,'ゴミ','ゴミ',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
