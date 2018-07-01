/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.5-10.1.19-MariaDB : Database - fanshuapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fanshuapp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fanshuapp`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `headerImg` text,
  `title` text,
  `content` text,
  `cat` varchar(45) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`headerImg`,`title`,`content`,`cat`,`userId`,`createdAt`) values (3,'../assets/article/201806280528502941.jpg','羽毛球如何把女孩子逼疯的——《轻羽飞扬！》前瞻','<p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/ac0641fe959beaf609e378adb96e615abc7894ee.jpg@1280w_264h.webp\" height=\"132\" width=\"640\"></span></p><p><br></p><p>运动题材的动画一直都是大家很喜欢的题材之一，有很多大家熟悉的作品，比如早期的《灌篮高手》、《足球小将》、《棒球英豪》、《网球王子》等等，近年来也有《黑子的篮球》、《排球少年》、《飙速宅男》、《Free！》</p><p>然而不知道大家发现没有，这些运动题材大多数都是以男性运动为主角，要是有一部以女性运动为主角的动画，那该多好啊啊啊啊！</p><p>虽然做女性向运动题材的人比较少，但是还是有的，7月新番就有一部这样的动画——《轻羽飞扬！》ヽ(✿ﾟ▽ﾟ)ノ</p><p>今天乔同学就跟大家来看看这个女生打羽毛球的动画，都有什么看点吧！</p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/4a45b5bfa56b3ac94da9ac7ea6e5911063befc85.jpg@1280w_1812h.webp\" height=\"906\" width=\"640\"></span></p><p><br></p><p>是百合嘛？是百合就看！</p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/26025f367bae2d813b51deac5ab22e867fc81db7.gif\" height=\"250\" width=\"444\"></span></p><p><br></p><p>《轻羽飞扬》动画改编自漫画家滨田浩辅于讲谈社旗下漫画杂志月刊《good!afternoon》上的同名漫画，那这部漫画大概是讲什么的呢？主要讲述羽毛球天才羽咲绫乃加入了女子高中生羽毛球部，并且向着世界第一名进军的故事。</p><p>老套路啊，很多动漫题材的都是有类似的设定，而《轻羽飞扬》不一样的地方在于主角羽咲绫乃性格上面的转变~</p><p>一开始的时候羽咲绫乃看起来非常弱小，是那种人畜无害的小女生类型╰(*°▽°*)╯没想到后面羽咲绫乃忽然变声成大魔王（羽毛球是怎么把一个女孩子逼疯了！）</p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/cbca6da7bb76381524fa917e7b4137b2145c4803.jpg@1106w_1570h.webp\" height=\"785\" width=\"553\"></span></p><p><br></p><p>果然，日本的运动还是很危（hao）险（kan）的！</p><p><strong>制作阵容</strong></p><p>动画的题材是不错，但是制作的阵容是什么样的呢？</p><p>《轻羽飞扬》的制作公司是LIDENFILMS，这家公司曾经出品过《火星异种》《山田君与7人魔女》《牙斗兽娘》，而动画监督则是江崎慎平，曾经做过《只有我不存在的城市》，这两个组合相信不会出差劲的动画！</p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/86701fc44d798b887f3966bb741bd22c0c819c13.jpg@1280w_1698h.webp\" height=\"849\" width=\"640\"></span></p><p><br></p><p>加上动画剧本的改编则是由岸本卓来接手！说道岸本卓你可能比较陌生，不过如果提起《排球少年》这样一部动画，相信你就会一下子想起来。没错岸本卓负责了《排球少年》三季加剧场版的剧本工作，可以说对运动剧本的改编是相当熟悉，这一次又会给我们什么惊喜呢？真是相当期待呢！</p><p>动画的开头是很重要的，很多时候动画开头的五分钟就会决定番剧后面的人气！而岸本卓也是一个擅长安排动画开头的人！《轻羽飞扬》一开始将会给我们展现什么呢？o(*≧▽≦)ツ┏━┓</p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/e1455324960e45908c04799b04cccb705e340955.jpg@1100w_1566h.webp\" height=\"783\" width=\"550\"></span></p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/9db997a9e4c5fbdaaed6983b397722cedc44847c.jpg@994w_1534h.webp\" height=\"767\" width=\"497\"></span></p><p><br></p><p>啊啊啊啊，还是等动画出来吧！就在7月1号了~</p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/058c8c9847f6cb65808cb99df1904f4679121635.gif\" height=\"185\" width=\"185\"></span></p><p><br></p><p>第一次见到羽毛球动画耶，会不会很生硬呢！</p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/3cff0382abd758eac8beb5c0129d7e1413b8f1fe.jpg@396w_396h.webp\" height=\"198\" width=\"198\"></span></p><p>╮(￣▽￣\")╭这个忧虑不是没有道理，羽毛球的脚法有很多种，大致分为跨步、垫步、交叉步、蹬步，而动作也有作劈、吊、挑……怎么把这些新的动作元素整合起来，这就成了动画的一大难点o(￣ヘ￣o＃)</p><p>而从目前动画的PV来看，并没有什么太大的问题，动作也都张弛有力，观感性很强！</p><p><span style=\"background-color: transparent;\"><img src=\"https://i0.hdslb.com/bfs/article/c0163bbfbd5fc48edbabfaf3ac109d8413871169.gif\" height=\"228\" width=\"383\"></span></p><p><br></p><p>还有就是动画的音效问题，羽毛球拍和羽毛球碰撞的时候发出的清脆声响、运动鞋和地板的摩擦声响，都将会影响到动画质量，还望我们的音效监督若林和弘多多加油！</p><p>（嘛！PV的音效嘎嘣脆，给劲~）</p><h2>《轻羽飞扬》整体看来非常不错的样子，作为7月新番最早的一批上线动画，期待它不俗的表现~</h2>','动漫资讯',12,'2018-06-28 11:31:04'),(4,'../assets/article/201806280538193418.jpg','吃我一波安利（校园搞笑恋爱番专题）第一波','<p>        六月份马上过去，抓住六月的小尾巴，趁机安利一下那些让人不住感叹的青春校园偶像剧，呸，是恋爱番，散发着一股青春的活力和恋爱的腐臭，无论是戴着啤酒盖般厚眼镜片的学霸，还是球场上肆意挥霍汗水的阳光BOY，还是在课座下偷偷牵手的小情侣……都可以勾起我们对校园时光的深深怀念，废话不多说，吃我一波安利！</p><h2> 《月刊少女野崎君》</h2><p><img src=\"../assets/article/201806280539261449.jpg\"></p><p class=\"ql-align-center\">《月刊少女野崎君》&nbsp;</p><p class=\"ql-align-center\">&nbsp;&nbsp;&nbsp;</p><p>       第一部安利的是《月刊少女野崎君》，看P1的画风，很容易让人觉得这是一个走小清新路线的恋爱番，那你就大错特错了，因为它的画风随时就会变成这样……（因为男主撩不过一秒P2）&nbsp;&nbsp;&nbsp;&nbsp;女主一心暗恋着男主，却几次把表白变成“粉丝见面会”，而男主也是个隐藏BUG……（还是不剧透了，自己看吧），总之这是一部假正经，真智障的校园番……</p><p><img src=\"../assets/article/201806280540032931.jpg\"></p><p class=\"ql-align-center\"> 《月刊少女野崎君》 </p><p class=\"ql-align-center\"><br></p><h2>《冰菓》</h2><p><img src=\"../assets/article/20180628054029935.jpg\"></p><p class=\"ql-align-center\"> 《冰菓》&nbsp;&nbsp;</p><p>&nbsp;     &nbsp;第二部要安利的是带有一点推理性质的《冰菓》，男主是一位十分“节能”的人，对什么事都比较冷漠，而女主则恰恰相反，异常热情，她的口头禅是“我很好奇”，对于“好奇”美少女和“节能”高智商青年之间发生的日常我也很好奇。&nbsp;&nbsp;女主的人设是学霸白富美，整部动漫的风格是日常秀智商番，之前还有《冰菓》的真人版电影，男主由“漫改小王子”山崎贤人担任，感兴趣的小伙伴可以去围观一下噢！ </p><p><img src=\"../assets/article/201806280541161559.jpg\"></p><p class=\"ql-align-center\">千反田爱瑠</p><p class=\"ql-align-center\"><br></p><h2> 《邻座的怪同学》</h2><h2><img src=\"../assets/article/201806280541322306.jpg\"> </h2><p class=\"ql-align-center\">《邻座的怪同学》</p><p>&nbsp;&nbsp;      这部番对于我个人来说是我最喜欢的一部，不仅仅因为男主炸裂的颜值和萌死人的性格（其它几部也是），而且因为它的剧情进展太太太快了，这不符合青春番都要拖几季再表白再拖几季接吻的常理呀！把观众都急死了！《怪物君》不仅第一集就表白接吻，而且后几集持续发糖，让人不禁感慨“一集就是一季呀！”（bgm超赞）&nbsp;&nbsp;&nbsp;而这部番中另一个角色大岛千鹤我也喜欢，虽然看动漫的时候，弹幕里对她的评价褒贬不一，我喜欢她是因为她给了我一种初恋的感觉，有了喜欢的人，对他会紧张，会和好朋友分享秘密，会忍不住脸红，得知他有喜欢的人也不争不抢做好自己分内的事，反观现在小三事件层出不穷，让人忍不住的去珍惜她的那份质朴。 </p><p><img src=\"../assets/article/201806280542097537.jpg\"></p><p class=\"ql-align-center\">大岛千鹤&nbsp;</p><p class=\"ql-align-center\"><br></p><p>&nbsp;        暂时先安利这三部吧，可能会有第二弹吧，校园时光对每个人来讲都是最天真最纯朴的时光，也是最怀念的时光，但是它很短暂，有些角色上总可以看到自己的影子想着“我当年也是这样！”这或许就是动漫带给我们的美好吧！&nbsp;&nbsp;希望每个人都可以在各个角色身上中找到自己最初的模样，在动漫的海洋中记住自己最美好的时光。 （有错别字或个别句子错误望指出，关于动漫或角色都为作者个人意见若有不接受者可在评论区发表自己的见解，勿喷，谢谢） 感谢每个有耐心读到最后的人，希望你们也可以记住自己最美好的校园时光。</p><p><br></p><p>作者：凉面凉凉了</p><p>https://www.bilibili.com/read/cv645436?from=category_2</p><p><br></p><h2>出处： bilibili</h2>','动漫杂谈',14,'2018-06-28 11:42:41'),(6,'../assets/article/201806300909492106.jpg','关于我的英雄学院绿谷出九原来个性的巨大脑洞（如果不是无个性DEKU原来个性最强？）','<p>没有个性的绿谷出九因为其内在的优秀品质被欧尔麦特选中，继承了ONE FOR&nbsp;ALL的他开始了在雄英的高中生活，也走上了成为NO.1英雄的道路。 </p><p><br></p><p>可是，如果绿谷不是天生的无个性，那么继承饿了父母个性的出九会拥有怎么样的个性呢，接下来就是我的脑洞时间。 </p><p><br></p><p>目前我所了解到的个性的遗传方式分为两种，第一种一种是继承父母其中一人的，第二种是父母的个性融合之后的全新个性，而第二种又有两种情况（目前up主已知的，要是有其他情况请指正），第一种像爆豪那样继承且融合了的，甘油+酸化汗=硝酸甘油=爆炸，第二种像轰那样继承但没有融合的，冰+火=半冷半燃，放火的那边只能放火，放冰的那边只能放冰。</p><p><br></p><p> 以下讨论均属脑洞且建立在绿谷出九实力强大完全开发个性的前提下，抛开单单遗传父母一人的个性，如果绿谷也是融合的全新个性的话，那么按两种情况分别来讨论，如果是第一种的，吸引+火焰=???&nbsp;&nbsp;&nbsp;&nbsp;吹火掌，当然不是，皮一下很开心，接下来是重要的脑洞，如果绿谷可以做到吸引粉尘的话，那么配合他的火焰能力就可以做到不弱于甚至强于爆豪的粉尘爆炸。</p><p><br></p><p> 这是爆豪爆炸的原理与威力</p><p><img src=\"../assets/article/201806300909589793.jpg\"></p><p><br></p><p> 这是绿谷爆炸的原理与威力</p><p><img src=\"../assets/article/201806300910047896.jpg\"></p><p><img src=\"../assets/article/201806300910076630.jpg\"></p><p><br></p><p> 可见，绿谷单凭吸附衣服（纤维）的粉尘就可以引起爆炸，如果在战斗服上做文章，可以随身携带金属粉尘的话，可以进一步提升威力，并且绿谷的粉尘爆炸可以做到二次爆炸并且可以用个性控制，更换粉尘更是可以做到产生有毒气体（怎么感觉越写越像反派），从这些角度来想，夸张的说绿谷的爆炸个性完全是爆豪的上位替代。</p><p><img src=\"../assets/article/201806300910179202.jpg\"></p><p><br></p><p> 如果说第一种你已经觉得够强了，那么你还是太低估了绿谷的可能性。我们来看第二种，如果绿谷是半吸引半火焰的话，会发生什么，我的脑洞是，龙卷风。不同于轰的个性，虽然火和冰可以相互抵消对身体的损耗，但两者的属性决定二者只能是分别攻击而不能融合，而绿谷的半吸引半火焰不仅可以用吸引增大氧气浓度来增加火焰的威力，而且，绿谷可以通过火焰引起气流上升，同时通过引力在垂直方向上相互作用产生气旋，形成龙卷核心进而形成真正的龙卷风。 </p><p><br></p><p>下面是龙卷风的形成原理 </p><p><img src=\"../assets/article/201806300910333696.jpg\"></p><p><br></p><p>进一步假设，如果绿谷可以通过操控火焰与吸引来控制龙卷风，那么绿谷就相当于可以控制火焰，引力以及龙卷风三种能力，夸张的说，完全就是夜岚稻佐（个性操纵风，在入学保送测试中赢过轰，且在临时执照第一试中瞬杀120人）个性的上位替代。</p><p><img src=\"../assets/article/201806300910453351.jpg\"></p><p><img src=\"../assets/article/201806300910491401.jpg\"></p><p> 不论绿谷的融合个性是哪种，都是目前几个最强个性的上位替代，也许作者给绿谷设定无个性也有一部分这个原因吧。 以上就是今天的脑洞，是不是突然觉得绿谷是无个性很可惜呢，如果绿谷一开始拥有超强个性的话，他会成为通行百万那样的人还是会更像咔酱呢，不过，无论怎样，他的内在品质都决定了，他是新一代的和平的象征，是善与恶的下一代中最耀眼最温柔的人。 </p><p><br></p><p>附：本人物理化学十分差劲，爆炸原理及龙卷风原理均来自网络及个人猜测，如果违反了物理化学原理的请指正。</p><p>作者：冰块脸不会笑</p><p>https://www.bilibili.com/read/cv623327?from=1001</p><h2>出处： bilibili</h2>','动漫杂谈',14,'2018-06-30 15:11:02'),(7,'../assets/article/201806300916355778.jpg','有生之年想看到的续作','<p>有生之年？我最想看到续作的动画还是这五部！</p><p><br></p><p>《天降之物》</p><p><br></p><p>被美丽的自然所包围的小镇，樱井智树是一名将“和平第一”作为座右铭的普通学生。某日从天空中掉下一位名为伊卡洛斯的女孩，他平静的日常生活开始脱轨了。自称“娱乐用万能天使”的她，将降落后见到的第一位人类，也就是智树称呼为“主人”，一部剧情相当有趣的后宫动漫。</p><p><br></p><p>《斩！赤红之瞳》</p><p><br></p><p>一个国家就如同人会逐渐腐朽，走向毁灭的一天，天若无法制裁邪恶，我等全员职业杀手团将会于黑暗之中给予消逝。出身在因帝国遭受欺压的村庄少年 塔兹米 ，怀着拯救村庄的希望，与青梅竹马共同以帝都为目标旅行前往，却在夜里遭受盗贼袭击而各自分散。在过夜的贵族家中，塔兹米于深夜里发现了他们的存在。“夜袭”的存在。</p><p><br></p><p>《约会大作战》</p><p><br></p><p>年幼时曾有被双亲抛弃的五河士道，被五河家接继的过往经历，对其他人绝望的感触非常敏锐，像是对抱持着绝望的十香在初次见面即被其所察觉。表面上看是一般所认知中极其普通的高中生，实际上却存有能透过接吻吸收精灵的力量，最初也对这样的工作踌躇犹疑，但借由与十香与四糸乃的接触之后则渐渐变得想帮助精灵们，决心以自己的意志担任与精灵沟通的角色。</p><p><br></p><p>《轻音少女》</p><p><br></p><p>一个四人女子组合在一个即将废部的轻音乐部从零开始展开音乐活动的故事。新生平泽唯在误将“轻音乐”当做了“轻便、简易的音乐”，决定申请入部。此时轻音部新成员只有秋山澪和田井中律两人，无法满足部员至少四人的最低人数要求即将废部。四名高一女生聚在了一起，故事也由此展开。</p><p><br></p><p>《冰菓》</p><p><br></p><p>以节能为座右铭的高中生折木奉太郎，加入了濒临废社的“古典文学部”。 古典文学部的社员，包括他在社里认识的好奇宝宝，也就是女主角千反田爱瑠，还有他从国中就认识的伊原摩耶花和福部里志。 对一桩桩事件展开推理的青春学园推理剧。 “我很好奇！”奉太郎因为千反田的这一句话而为之一变！</p><p><br></p><h2>当然，有了第二季不久后我们又会求第三季（除非完结）</h2>','动漫杂谈',15,'2018-06-30 15:16:55');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`account`,`password`) values (1,'12','a0bd55120e3c91d6137a7bb1477d22beb8775f51'),(12,'1234','7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),(14,'13533292441','7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),(15,'1997','7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `avatar` text,
  `userId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`id`,`name`,`avatar`,`userId`) values (2,'百变','../assets/avatar.png',12),(4,'北京烤鸭','../assets/avatar.png',14),(5,'1997','../assets/avatar.png',15),(6,'asd','../assets/avatar.png',16);

/*Table structure for table `vote` */

DROP TABLE IF EXISTS `vote`;

CREATE TABLE `vote` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `voteCat` int(10) DEFAULT NULL COMMENT '1为带图的投票，2为不带图的邮票',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `vote` */

insert  into `vote`(`id`,`title`,`userId`,`voteCat`) values (25,'月刊少女野崎君 最具反差萌角色',14,1),(26,'MEGALO BOX 你觉得男主最后能打赢勇利吗？',0,2),(27,'排球少年 你最喜欢哪个学校的打球风格？',12,2),(28,'以下几部动漫中，你觉得最搞笑的是哪一部？',12,2);

/*Table structure for table `vote-user` */

DROP TABLE IF EXISTS `vote-user`;

CREATE TABLE `vote-user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL,
  `voteId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vote-user` */

/*Table structure for table `vote_user` */

DROP TABLE IF EXISTS `vote_user`;

CREATE TABLE `vote_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL,
  `voteId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `vote_user` */

insert  into `vote_user`(`id`,`userId`,`voteId`) values (1,12,25),(65,12,26),(66,12,27),(68,14,25),(69,14,26),(70,15,25),(71,12,28);

/*Table structure for table `votenoimg` */

DROP TABLE IF EXISTS `votenoimg`;

CREATE TABLE `votenoimg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item` varchar(45) DEFAULT NULL,
  `voteId` int(10) DEFAULT NULL,
  `voteNum` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `votenoimg` */

insert  into `votenoimg`(`id`,`item`,`voteId`,`voteNum`) values (3,'能',26,8),(4,'不能',26,1),(5,'乌野高校',27,0),(6,'青叶城西高校',27,0),(7,'音驹高校',27,1),(8,'伊达工业高校',27,1),(9,'白鸟泽学院',27,0),(10,'枭谷学园',27,0),(11,'齐木楠雄的灾难',28,0),(12,'月刊少女野崎君',28,0),(13,'荒川爆笑团',28,1),(14,'在下坂本，有何贵干？',28,0),(15,'阿松',28,0),(16,'a',35,0),(17,'a',36,0),(18,'a',36,0),(19,'a',37,0),(20,'d',37,0);

/*Table structure for table `votewithimg` */

DROP TABLE IF EXISTS `votewithimg`;

CREATE TABLE `votewithimg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item` varchar(45) DEFAULT NULL,
  `img` text,
  `voteId` int(10) DEFAULT NULL,
  `voteNum` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `votewithimg` */

insert  into `votewithimg`(`id`,`item`,`img`,`voteId`,`voteNum`) values (13,'野崎梅太郎','../assets/article/201806280545282090.jpg',25,2),(14,'佐仓千代','../assets/article/201806280545396556.jpg',25,32),(15,'御子柴実琴','../assets/article/201806280545525813.jpg',25,23),(16,'堀政行','../assets/article/201806280546053636.jpg',25,1),(17,'鹿岛游','../assets/article/2018062805461727.jpg',25,2),(18,'濑尾结月','../assets/article/201806280546301626.jpg',25,1),(19,'若松博隆','../assets/article/201806280546402848.jpg',25,1),(30,'a','../assets/article/201806301643466520.jpg',34,0),(31,'a','../assets/article/201806301643497246.jpg',34,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
