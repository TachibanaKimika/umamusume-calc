/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.18 : Database - umamusume-pbl-backup
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`umamusume-pbl-backup` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `umamusume-pbl-beta`;

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

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
(10,5,'ファインモーション','感謝は指先まで込めて',3,'https://img.gamewith.jp/img/1271dc3a80da0a7c59de58ab850506cc.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_10.png'),
(11,4,'アイネスフウジン','飛び出せ、キラメケ',3,'https://img.gamewith.jp/img/0dca21adff6b375512fefe905f3d2cae.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_11.png'),
(12,4,'ウイニングチケット','B・N・Winner!!',3,'https://img.gamewith.jp/img/5509576126661a26c80c93437a40a562.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_12.png'),
(13,5,'エアシャカール','7センチの先へ',3,'https://img.gamewith.jp/img/16d78758914c82c50eaf41ea283fad35.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_13.png'),
(14,1,'ゴールドシチー','Run(my)way',3,'https://img.gamewith.jp/img/994b4a07fcc9ab11b55778c18699a2d4.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_14.png'),
(15,1,'サクラバクシンオー','はやい！うまい！はやい！',3,'https://img.gamewith.jp/img/952c937842f8d8faf273e770361f756d.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_15.png'),
(16,2,'スーパークリーク','一粒の安らぎ',3,'https://img.gamewith.jp/img/cb8f8662641f1117303e994a47dde066.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_16.png'),
(17,3,'スマートファルコン','これが私のウマドル道☆',3,'https://img.gamewith.jp/img/a67539bb98a437d97be9b07e99701753.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_17.png'),
(18,1,'ニシノフラワー','まだ小さな蕾でも',3,'https://img.gamewith.jp/img/579edba3b1bc6be60dac8c484b559fe7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_18.png'),
(19,4,'ハルウララ','うらら～な休日',3,'https://img.gamewith.jp/img/49277001cb25e6748408087080dc0af3.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_91.png'),
(20,6,'駿川たづな','ようこそ、トレセン学園へ！',3,'https://img.gamewith.jp/img/945814d818df16f7d563005cd8bbfa50.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_20.png'),
(21,1,'ビコーペガサス','必殺！Wキャロットパンチ',3,'https://img.gamewith.jp/img/1b44e3b9dfda22a19cd227291e5c5cac.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_19.png'),
(22,2,'メジロマックイーン','『エース』として',3,'https://img.gamewith.jp/img/284ddae54139fe77ce2495d26da90922.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_92.png'),
(23,2,'ライスシャワー','『幸せ』が舞う時',3,'https://img.gamewith.jp/img/1e000277011c6f461d48ffed628989ff.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_93.png'),
(24,5,'フジキセキ','やれやれ、お帰り',2,'https://img.gamewith.jp/img/51f58472d774a5d1b73099519df1d597.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_21.png'),
(25,5,'ダイワスカーレット','努力は裏切らない！',2,'https://img.gamewith.jp/img/5cebf1f6583898d8bfac76985b508804.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_22.png'),
(26,3,'ヒシアマゾン','テッペンに立て！',2,'https://img.gamewith.jp/img/7b034e90725fd6139ad1588d72bbb351.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_23.png'),
(27,4,'エアグルーヴ','副会長の一刺し',2,'https://img.gamewith.jp/img/e6b4075fbf6d4222091bd88211036a5a.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_24.png'),
(28,3,'アグネスデジタル','デジタル充電中＋',2,'https://img.gamewith.jp/img/ada20a606070bc21d0180c3bea81f5a4.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_25.png'),
(29,3,'ビワハヤヒデ','検証、開始',2,'https://img.gamewith.jp/img/d227894c4edc11c664d25dcbfbebbb6b.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_26.png'),
(30,2,'マヤノトップガン','カワイイ＋カワイイは～？',2,'https://img.gamewith.jp/img/637e7d6ddcd857c298b0e6a7b541a0d9.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_27.png'),
(31,2,'マンハッタンカフェ','雨の独奏、私の独創',2,'https://img.gamewith.jp/img/09dfc6e39607820eac3be468185829c6.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_28.png'),
(32,3,'ミホノブルボン','鍛えぬくトモ',2,'https://img.gamewith.jp/img/736dd6c952382d3b76ae6b959724ef5a.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_29.png'),
(33,3,'メジロライアン','鍛えて、応えて！',2,'https://img.gamewith.jp/img/3784bf829adc1cf0ad8cb2ebe3dad643.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_30.png'),
(34,4,'ユキノビジン','シチーガール入門＃',2,'https://img.gamewith.jp/img/86d1ff9a62c952f1f262e3fe893e5b1f.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_31.png'),
(35,5,'アグネスタキオン','生体Aに関する実験的研究',2,'https://img.gamewith.jp/img/7f82716700bfa4e6bbaacb1d195f2951.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_32.png'),
(36,1,'エイシンフラッシュ','0500・定刻通り',2,'https://img.gamewith.jp/img/c2692e005dc29769fa60a5fd6f12430f.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_33.png'),
(37,1,'ナリタタイシン','波立つキモチ',2,'https://img.gamewith.jp/img/9ee67da72c498f23a3c2daed279bbccc.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_34.png'),
(38,5,'マーベラスサンデー','マーベラス☆大作戦',2,'https://img.gamewith.jp/img/21b76368dcfaf549e31e43151e6cbecb.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_35.png'),
(39,5,'マチカネフクキタル','運の行方',2,'https://img.gamewith.jp/img/e59182677d9b5af4c366b1422cff9c29.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_36.png'),
(40,3,'オグリキャップ','『愛してもらうんだぞ』',3,'https://img.gamewith.jp/img/2f91f35a7138dcde097f45e9a42f9e89.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_94.png'),
(41,1,'スペシャルウィーク','夕焼けはあこがれの色',3,'https://img.gamewith.jp/img/0a810c1d91fa98a952e12e31ac6e5f4d.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_97.png'),
(42,1,'ツインターボ','ターボエンジン全開宣言！',3,'https://img.gamewith.jp/img/910847d404e73b5b75ff6a7c4281a900.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_98.png'),
(43,4,'メジロパーマー','バカと笑え',3,'https://img.gamewith.jp/img/1c9ef13869c0818a7930fcdf5bb5e8b7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_102.png'),
(44,4,'メイショウドトウ','幸せと背中合わせ',2,'https://img.gamewith.jp/img/3d7ed95d49a786e361af3a46c71e24b7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_37.png'),
(45,5,'メジロドーベル','目線は気にせず',2,'https://img.gamewith.jp/img/251c404348623c3d50c59492435ff8dd.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_38.png'),
(46,4,'ナイスネイチャ','…ただの水滴ですって',2,'https://img.gamewith.jp/img/488a5880b11326efc36f24e3ad7d94af.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_39.png'),
(47,4,'マチカネタンホイザ','Just keep going.',3,'https://img.gamewith.jp/img/f39e195e3bcde2adc013ca24576f1e4d.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_106.png'),
(48,1,'キタサンブラック','迫る熱に押されて',3,'https://img.gamewith.jp/img/a967e4e64c611e3143472a50b0f39e98.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_108.png'),
(49,2,'サトノダイヤモンド','その背中を越えて',3,'https://img.gamewith.jp/img/a6aa32a60d4e0f2b894af3f7fafac9d7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_109.png'),
(50,1,'キングヘイロー','一流プランニング',2,'https://img.gamewith.jp/img/69fc1b9397a7ff8abbda09c86e761284.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_40.png'),
(51,6,'桐生院葵','共に同じ道を！',2,'https://img.gamewith.jp/img/bd4c973692e71b87763c4cb5936d34e9.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_41.png'),
(52,1,'スイープトウショウ','見習い魔女と長い夜',2,'https://img.gamewith.jp/img/a0a886a7157c51b43cd1b6eb3680f5ab.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_95.png'),
(53,3,'ダイタクヘリオス','パリピ・ぱーりないと！',2,'https://img.gamewith.jp/img/0d97f10cb63007859cdf65c2054c657d.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_99.png'),
(54,5,'イクノディクタス','準備運動は怠るべからず',2,'https://img.gamewith.jp/img/0c998353e20b73dbec82e1900887936f.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_103.png'),
(55,5,'ナイスネイチャ','むじゃむじゃむじゃき',2,'https://img.gamewith.jp/img/cbdcbecc66fe60e76a626bb6fe721a24.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_107.png'),
(56,5,'ユキノビジン','ふるさと直送エール！',3,'https://img.gamewith.jp/img/1cac432914081abe5bdc5a84a0fe9a47.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_113.png'),
(57,3,'ニシノフラワー','あなたにささげる',2,'https://img.gamewith.jp/img/68e1f56641ef29ab516ac2ecec5b6633.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_114.png'),
(58,3,'ウイニングチケット','夢はホントに叶うんだ！',3,'https://img.gamewith.jp/img/0ee584bd36cfad5218fd7fbbd402fa6c.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_115.png'),
(59,3,'ヤエノムテキ','押して忍べど燃ゆるもの',3,'https://img.gamewith.jp/img/ef48fb3feef97bb17215b0e5996b4e3c.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_116.png'),
(60,2,'ゼンノロブロイ','おすすめ本、あります！',2,'https://img.gamewith.jp/img/8ebdf5b3c956f9ab2bd64d21100c0cd0.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_117.png'),
(61,2,'サクラチヨノオー','今ぞ盛りのさくら花',3,'https://img.gamewith.jp/img/f56ccb28d31c0db9d068668b52c37578.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_120.png'),
(62,4,'シーキングザパール','世界の真珠、その名は',2,'https://img.gamewith.jp/img/7b2f76c8e1cfc9075cb26f17928eb378.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_121.png'),
(63,3,'トウカイテイオー','ふたつのノーブルライト',3,'https://img.gamewith.jp/img/a7a44329d0e77abd651778c5c2c7badc.jpg','https://img.gamewith.jp/img/d7492169016ed0b41fd0cae148d8ed53.jpg'),
(64,1,'カワカミプリンセス','花嫁たるもの！！',3,'https://img.gamewith.jp/img/bb7ff7e434083096df27bd17ed6711d7.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_125.png'),
(65,4,'ヒシアケボノ','召しませふぁーすとBite！',3,'https://img.gamewith.jp/img/2077521f512ba29dc2ee30f60285b15e.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_126.png'),
(66,5,'メジロドーベル','おもい、ねがう',3,'https://img.gamewith.jp/img/459143bf8cdec51427377c1b70778fc2.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_129.png'),
(67,3,'バンブーメモリー','Head-on fight！',3,'https://img.gamewith.jp/img/0350dd72a3b881630edab04f1a8e62f0.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_130.png'),
(68,1,'シンコウウインディ','///WARNING GATE///',2,'https://img.gamewith.jp/img/8fc58e6d09aa0ae5f0da88cca2c987cc.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_131.png'),
(69,2,'ミホノブルボン','祝福はフーガ',3,'https://img.gamewith.jp/img/1f2318f56a3b6b5b0b9f454a5646201f.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_134.png'),
(70,5,'セイウンスカイ','明日は全国的に赤でしょう♪',3,'https://img.gamewith.jp/img/6c43c1d92a591528ea21e10514890d50.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_135.png'),
(71,3,'キングヘイロー','今宵、円舞曲にのせて',3,'https://img.gamewith.jp/img/f6d240281c611c3512dfdf80aeadeae6.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_136.png'),
(72,1,'ゴールドシップ','ウマ王伝説・最強になった件',3,'https://img.gamewith.jp/img/a79afbe756d5889fec5f20bfaeb32356.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_137.png'),
(73,1,'ナリタブライアン','Two Pieces',3,'https://img.gamewith.jp/img/a582abbd10fa59068d2c6452bfb8d049.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_138.png'),
(75,4,'メジロライアン','爽快！ウイニングショット！',3,'https://img.gamewith.jp/img/dca1cb8214033b9e19bbd78970dce7f8.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_139.png'),
(76,5,'メジロアルダン','その心に吹きすさぶ',2,'https://img.gamewith.jp/img/b11055e03affa9e724a94bc59f3d47cb.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_140.png'),
(77,4,'ツインターボ','集まってコンステレーション',3,'https://img.gamewith.jp/img/1a5ad4580b5840f281a71bb070a2b5be.jpg','https://img.gamewith.jp/img/500f3a72aa05140f9dcecff0e585a892.jpg'),
(78,1,'スイープトウショウ','ツメたいヒトリジメ？',3,'https://img.gamewith.jp/img/0427447fa0e86b4803f66ca4c3964ef3.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_144.png'),
(79,2,'ウイニングチケット','全力！タントラムッッ！',3,'https://img.gamewith.jp/img/696fb031996ca5a40c46aba234868c18.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_145.png'),
(80,3,'ダイワスカーレット','トライフル☆バケーション',3,'https://img.gamewith.jp/img/98eefe0bdb67bf4c666d9dd8d16a683b.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_146.png'),
(81,5,'ナイスネイチャ','願いまでは拭わない',3,'https://img.gamewith.jp/img/7b6998b794618bd6706ff95d13d1ca94.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_148.png'),
(82,2,'トーセンジョーダン','nail on Turf',2,'https://img.gamewith.jp/img/918993a2bb02e1f6bcba125a8e59143e.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_149.png'),
(83,5,'ビワハヤヒデ','響き合うストレイン',3,'https://img.gamewith.jp/img/695453426757245007118728d57ccf13.jpg','https://img.gamewith.jp/img/69ce568f4d51685f574d816cbad3fdc5.jpg'),
(84,2,'サイレンススズカ','WINNING DREAM',3,'https://img.gamewith.jp/img/82c7ad289cd5689bb924dd75c9b24492.jpg','https://img.gamewith.jp/article_tools/uma-musume/gacha/sp_151.png');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
