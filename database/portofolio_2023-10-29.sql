# ************************************************************
# Sequel Ace SQL dump
# Version 20057
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.1.0)
# Database: portofolio
# Generation Time: 2023-10-29 03:30:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table abouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `abouts`;

CREATE TABLE `abouts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resume` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `abouts` WRITE;
/*!40000 ALTER TABLE `abouts` DISABLE KEYS */;

INSERT INTO `abouts` (`id`, `title`, `description`, `image`, `resume`, `created_at`, `updated_at`)
VALUES
	(1,'About Me','<div class=\"sub-title wow fadeInUp\" data-wow-delay=\"0.4s\" style=\"visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;\">\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos repellendus\r\n                            sapiente, quae et eos dolorum.</p>\r\n                    </div>\r\n                    <div class=\"desc wow fadeInUp\" data-wow-delay=\"0.4s\" style=\"visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;\">\r\n                        <p>Consectetur adipisicing elit. Laborum, magni libero\r\n                            similique, laboriosam, delectus reiciendis minima minus dolorem sit fuga rerum atque\r\n                            vel quaerat ipsum perspiciatis neque maxime recusandae fugit</p>\r\n                        <p>Ipsum dolor sit amet, consectetur adipisicing elit. Laborum, magni libero\r\n                            similique, laboriosam, delectus reiciendis minima minus dolorem sit fuga rerum atque\r\n                            vel quaerat ipsum perspiciatis neque maxime recusandae fugit.</p>\r\n                    </div><p></p>','/uploads/100220751FringgaAs.jpg','/uploads/27755782Lamaran_Fringga Adam Sandika.pdf','2023-02-04 09:18:47','2023-10-18 14:59:37');

/*!40000 ALTER TABLE `abouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_categories`;

CREATE TABLE `blog_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(2,'Development','development','2023-02-11 08:30:15','2023-02-11 08:30:15'),
	(3,'Graphic Design','graphic-design','2023-02-11 08:30:26','2023-02-11 08:30:26');

/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_comments`;

CREATE TABLE `blog_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comments_blog_id_foreign` (`blog_id`),
  KEY `blog_comments_parent_id_foreign` (`parent_id`),
  KEY `blog_comments_user_id_foreign` (`user_id`),
  CONSTRAINT `blog_comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `blog_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blog_comments` WRITE;
/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;

INSERT INTO `blog_comments` (`id`, `blog_id`, `parent_id`, `user_id`, `name`, `email`, `comment_text`, `created_at`, `updated_at`)
VALUES
	(16,11,NULL,NULL,'asjn','kjbsd@gmail.cxom','jds','2023-10-28 02:36:08','2023-10-28 02:36:08'),
	(17,11,NULL,NULL,'dasd','asda@gmail.com','asknda','2023-10-28 07:42:59','2023-10-28 07:42:59'),
	(18,9,NULL,NULL,'asdad','asd2@gmail.com','asdsad','2023-10-28 08:49:42','2023-10-28 08:49:42'),
	(19,9,18,NULL,'asdas','asdasd@gmail.com','asdjba','2023-10-28 09:00:09','2023-10-28 09:00:09'),
	(20,7,NULL,NULL,'ajsbdak','sanjd@gmail.com','ajsdn','2023-10-28 11:23:38','2023-10-28 11:23:38'),
	(21,7,20,NULL,'asjkdnad','sand@gmail.com','asjknd','2023-10-28 11:24:13','2023-10-28 11:24:13'),
	(22,7,20,NULL,'asdjkab','ajsdb@gmail.com','asjda','2023-10-28 11:24:34','2023-10-28 11:24:34'),
	(23,7,22,NULL,'asd','ajnsd@gmail.com','ajsdn','2023-10-28 11:25:04','2023-10-28 11:25:04'),
	(24,7,23,NULL,'jdasbnd','aksjdbn@gmail.com','asjndjs','2023-10-28 11:28:21','2023-10-28 11:28:21'),
	(25,7,24,NULL,'asdand','jasnd@gmail.com','nsad','2023-10-28 11:28:31','2023-10-28 11:28:31'),
	(26,7,25,NULL,'ajsdn','jasd@gmail.com','jasnd','2023-10-28 11:28:41','2023-10-28 11:28:41'),
	(27,7,26,NULL,'asdnasd','jansd@gmail.com','jsad','2023-10-28 11:28:51','2023-10-28 11:28:51'),
	(28,7,27,NULL,'asjndb','ajsbd@gmail.com','ansdia','2023-10-28 11:29:04','2023-10-28 11:29:04'),
	(29,10,NULL,1,'Admin123','admin@gmail.com','uhd','2023-10-29 02:57:56','2023-10-29 02:57:56'),
	(30,10,NULL,1,'Admin123','admin@gmail.com','asjdb','2023-10-29 03:02:16','2023-10-29 03:02:16'),
	(31,10,NULL,1,'Admin123','admin@gmail.com','asdsa','2023-10-29 03:02:42','2023-10-29 03:02:42'),
	(32,10,NULL,NULL,'ashjdb','ajhsbd@gmail.com','ajshbd','2023-10-29 03:03:31','2023-10-29 03:03:31'),
	(33,10,32,NULL,'asda','asda@gmail.com','ajsd','2023-10-29 03:06:04','2023-10-29 03:06:04'),
	(34,10,32,1,'Admin123','admin@gmail.com','sadasd','2023-10-29 03:11:56','2023-10-29 03:11:56'),
	(35,10,32,1,'Admin123','admin@gmail.com','asdd','2023-10-29 03:12:45','2023-10-29 03:12:45'),
	(36,10,29,1,'Admin123','admin@gmail.com','uluh','2023-10-29 03:13:17','2023-10-29 03:13:17'),
	(37,10,29,1,'Admin123','admin@gmail.com','uluh2','2023-10-29 03:13:26','2023-10-29 03:13:26'),
	(38,10,32,NULL,'asd','asd@gmail.com','makasih min','2023-10-29 03:15:37','2023-10-29 03:15:37');

/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blog_section_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_section_settings`;

CREATE TABLE `blog_section_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blog_section_settings` WRITE;
/*!40000 ALTER TABLE `blog_section_settings` DISABLE KEYS */;

INSERT INTO `blog_section_settings` (`id`, `title`, `sub_title`, `created_at`, `updated_at`)
VALUES
	(1,'Creative Blog Post','Earum quos animi numquam excepturi eveniet explicabo repellendus rem esse. Quae quasi odio enim.','2023-02-12 12:19:03','2023-02-12 12:21:45');

/*!40000 ALTER TABLE `blog_section_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_created_by_foreign` (`created_by`),
  CONSTRAINT `blogs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;

INSERT INTO `blogs` (`id`, `image`, `title`, `category`, `description`, `created_at`, `updated_at`, `created_by`)
VALUES
	(6,'/uploads/1914907871portfolio-9.jpg','How to Build Stronger Relationships with Your Customers',2,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','2023-02-18 05:09:43','2023-10-18 15:06:02',1),
	(7,'/uploads/454410599portfolio-8.jpg','The Future of Transportation: Exploring Alternative Methods',2,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','2023-03-18 05:10:47','2023-10-18 15:05:54',1),
	(8,'/uploads/78741112portfolio-7.jpg','5 Simple Exercises to Boost Your Productivity',3,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','2023-02-18 05:11:33','2023-10-18 15:05:46',1),
	(9,'/uploads/1531511602portfolio-6.jpg','Understanding the Basics of Cryptocurrency Trading',3,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','2023-02-18 05:13:10','2023-10-18 15:05:37',1),
	(10,'/uploads/1675380708portfolio-5.jpg','The Importance of Emotional Intelligence in the Workplace',2,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','2023-10-18 05:16:12','2023-10-18 15:05:29',1),
	(11,'/uploads/957238195101733~1.JPG','Mastering the Art of Public Speaking: Tips and Tricks',2,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','2023-02-18 05:16:28','2023-10-24 15:11:58',1);

/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(11,'Branding Design','branding-design','2023-02-18 04:31:00','2023-02-18 04:31:00'),
	(12,'User Interface','user-interface','2023-02-18 04:31:16','2023-02-18 04:31:16'),
	(13,'User Experience','user-experience','2023-02-18 04:31:57','2023-02-18 04:31:57'),
	(14,'Web Developement','web-developement','2023-02-18 04:32:08','2023-02-18 04:32:08');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contact_section_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contact_section_settings`;

CREATE TABLE `contact_section_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `contact_section_settings` WRITE;
/*!40000 ALTER TABLE `contact_section_settings` DISABLE KEYS */;

INSERT INTO `contact_section_settings` (`id`, `title`, `sub_title`, `created_at`, `updated_at`)
VALUES
	(1,'Lets Work Together','Earum quos animi numquam excepturi eveniet explicabo repellendus rem esse. Quae quasi odio enim.','2023-02-13 13:04:14','2023-02-13 13:05:41');

/*!40000 ALTER TABLE `contact_section_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table experiences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `experiences`;

CREATE TABLE `experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;

INSERT INTO `experiences` (`id`, `image`, `title`, `description`, `phone`, `email`, `created_at`, `updated_at`)
VALUES
	(1,'/uploads/1615502151banner_search.jpg','5 Years Experiences on Design & Development.','<div class=\"desc wow fadeInUp\" data-wow-delay=\"0.4s\" style=\"visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;\">\r\n                        <p>Lorem ipsum dolor sit amet consectetur.\r\n                            voluptate dignissimos recusandae omnis delectus quas incidunt\r\n                            inventore placeat ea illo totam consequuntur odio.</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo fugit officia itaque\r\n                            soluta minus officiis, atque, debitis ipsa ipsum, adipisci delectus eaque cum\r\n                            laudantium incidunt ex hic laboriosam similique rerum.</p>\r\n                    </div><p></p>','+1111-111-111','rabins@gmail.com','2023-02-08 13:32:32','2023-10-18 15:03:40');

/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table feedback
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;

INSERT INTO `feedback` (`id`, `name`, `position`, `description`, `created_at`, `updated_at`)
VALUES
	(2,'Reilly Harding','Managing Director, DevignEdge','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat.','2023-02-09 12:15:09','2023-02-09 12:15:09'),
	(3,'White Castaneda','Managing Director, DevignEdge','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat.</p>','2023-02-09 12:15:41','2023-02-09 12:15:41'),
	(4,'Barrera Ramsey','orem ipsum','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat.</p>','2023-02-09 12:16:40','2023-02-18 04:58:54');

/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table feedback_section_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `feedback_section_settings`;

CREATE TABLE `feedback_section_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `feedback_section_settings` WRITE;
/*!40000 ALTER TABLE `feedback_section_settings` DISABLE KEYS */;

INSERT INTO `feedback_section_settings` (`id`, `title`, `sub_title`, `created_at`, `updated_at`)
VALUES
	(1,'Our client Feedback','Earum quos animi numquam excepturi eveniet explicabo repellendus rem esse. Quae quasi odio enim.','2023-02-09 10:52:40','2023-02-09 10:55:37');

/*!40000 ALTER TABLE `feedback_section_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table footer_contact_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `footer_contact_infos`;

CREATE TABLE `footer_contact_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `footer_contact_infos` WRITE;
/*!40000 ALTER TABLE `footer_contact_infos` DISABLE KEYS */;

INSERT INTO `footer_contact_infos` (`id`, `address`, `phone`, `email`, `created_at`, `updated_at`)
VALUES
	(1,'17232 Broadway Suite 308, Jackson Heights, 11372, NY, United States.','+1347-430-9510','mrfringga@gmail.com','2023-02-14 11:40:05','2023-10-25 14:32:00');

/*!40000 ALTER TABLE `footer_contact_infos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table footer_help_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `footer_help_links`;

CREATE TABLE `footer_help_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `footer_help_links` WRITE;
/*!40000 ALTER TABLE `footer_help_links` DISABLE KEYS */;

INSERT INTO `footer_help_links` (`id`, `name`, `url`, `created_at`, `updated_at`)
VALUES
	(4,'Privacy Policy','#','2023-02-15 10:42:18','2023-02-15 10:42:18'),
	(5,'404 Page','#','2023-02-15 10:42:28','2023-02-15 10:42:28'),
	(6,'Terms','#','2023-02-15 10:42:39','2023-02-15 10:42:39'),
	(7,'Documentation','#','2023-02-15 10:42:49','2023-02-15 10:42:49');

/*!40000 ALTER TABLE `footer_help_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table footer_infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `footer_infos`;

CREATE TABLE `footer_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copy_right` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `powered_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `footer_infos` WRITE;
/*!40000 ALTER TABLE `footer_infos` DISABLE KEYS */;

INSERT INTO `footer_infos` (`id`, `info`, `copy_right`, `powered_by`, `created_at`, `updated_at`)
VALUES
	(1,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum, libero.','Copyright 2023 Rabins. All Rights Reserved.','|   2022 - 2023','2023-02-14 10:24:58','2023-10-25 14:29:22');

/*!40000 ALTER TABLE `footer_infos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table footer_social_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `footer_social_links`;

CREATE TABLE `footer_social_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `footer_social_links` WRITE;
/*!40000 ALTER TABLE `footer_social_links` DISABLE KEYS */;

INSERT INTO `footer_social_links` (`id`, `icon`, `url`, `created_at`, `updated_at`)
VALUES
	(2,'fab fa-facebook-f','https://facebook.com','2023-02-15 10:31:14','2023-02-15 10:31:14'),
	(3,'fab fa-linkedin-in','https://websolutionus.com/','2023-02-15 10:31:48','2023-02-15 10:31:48');

/*!40000 ALTER TABLE `footer_social_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table footer_useful_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `footer_useful_links`;

CREATE TABLE `footer_useful_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `footer_useful_links` WRITE;
/*!40000 ALTER TABLE `footer_useful_links` DISABLE KEYS */;

INSERT INTO `footer_useful_links` (`id`, `name`, `url`, `created_at`, `updated_at`)
VALUES
	(3,'Home','#','2023-02-15 10:41:01','2023-02-15 10:41:01'),
	(4,'About','#','2023-02-15 10:41:11','2023-02-15 10:41:11'),
	(5,'Portfolio','#','2023-02-15 10:41:20','2023-02-15 10:41:20'),
	(6,'Blog','#','2023-02-15 10:41:34','2023-02-15 10:41:34');

/*!40000 ALTER TABLE `footer_useful_links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table general_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `general_settings`;

CREATE TABLE `general_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `general_settings` WRITE;
/*!40000 ALTER TABLE `general_settings` DISABLE KEYS */;

INSERT INTO `general_settings` (`id`, `logo`, `footer_logo`, `favicon`, `created_at`, `updated_at`)
VALUES
	(1,'/uploads/1035062070logo.png','/uploads/1072897890favicon.png','/uploads/811496730logo.png','2023-10-18 15:07:33','2023-10-18 15:07:33');

/*!40000 ALTER TABLE `general_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table heroes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `heroes`;

CREATE TABLE `heroes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `btn_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;

INSERT INTO `heroes` (`id`, `title`, `sub_title`, `btn_text`, `btn_url`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'Hi, I am Fringga Adam Sandika','Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque at, aperiam corrupti earum quasi, porro voluptatem commodi eos laboriosam nam quis nostrum, molestiae nesciunt dolore.','Hire Me','#','/uploads/245334041Hero.png','2023-01-30 09:57:26','2023-10-18 14:58:38');

/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2023_01_30_051517_create_heroes_table',2),
	(6,'2023_01_31_074915_create_typer_titles_table',3),
	(7,'2023_02_02_073050_create_services_table',4),
	(9,'2023_02_04_052439_create_abouts_table',5),
	(10,'2023_02_05_040548_create_categories_table',6),
	(12,'2023_02_05_093752_create_portfolio_items_table',7),
	(13,'2023_02_06_092714_create_portfolio_settings_table',8),
	(14,'2023_02_06_094305_create_portfolio_section_settings_table',9),
	(15,'2023_02_07_073815_create_skill_section_settings_table',10),
	(16,'2023_02_08_034942_create_skill_items_table',11),
	(18,'2023_02_08_105722_create_experienaces_table',12),
	(19,'2023_02_09_044602_create_feedback_table',13),
	(20,'2023_02_09_093837_create_feedback_section_settings_table',14),
	(21,'2023_02_11_041736_create_blog_categories_table',15),
	(22,'2023_02_11_072154_create_blogs_table',16),
	(23,'2023_02_12_110801_create_blog_section_settings_table',17),
	(24,'2023_02_13_115308_create_contact_section_settings_table',18),
	(25,'2023_02_14_035621_create_footer_social_links_table',19),
	(26,'2023_02_14_090943_create_footer_infos_table',20),
	(27,'2023_02_14_102504_create_footer_contact_infos_table',21),
	(28,'2023_02_15_041536_create_footer_useful_links_table',22),
	(29,'2023_02_15_064041_create_footer_help_links_table',23),
	(30,'2023_02_16_042610_create_general_settings_table',24),
	(31,'2023_02_16_063957_create_seo_settings_table',25),
	(33,'2023_10_27_132123_create_qualifications_table',26),
	(34,'2023_10_28_012500_create_blog_comments_table',27),
	(35,'2023_10_28_074520_add_create_by_to_blogs_table',28),
	(36,'2023_10_29_025929_add_column_user_id_to_blog_comments_table',29);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;

INSERT INTO `password_resets` (`email`, `token`, `created_at`)
VALUES
	('admin@gmail.com','$2y$10$5TVGoFW3Oek2bTMwGZhfwuRi9BMJvXvs5mCPmAvaFwDT9fuFaSfHa','2023-10-21 04:54:30');

/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table portfolio_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `portfolio_items`;

CREATE TABLE `portfolio_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `client` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `portfolio_items` WRITE;
/*!40000 ALTER TABLE `portfolio_items` DISABLE KEYS */;

INSERT INTO `portfolio_items` (`id`, `image`, `title`, `category_id`, `description`, `client`, `website`, `created_at`, `updated_at`)
VALUES
	(6,'/uploads/167552570910.jpg','Cloud Computing',11,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis voluptate aspernatur similique officia nihil exercitationem qui corporis iste assumenda eum quaerat? Porro amet repellat molestias eos iusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam ipsa nihil minima odio vitae, architecto totam, praesentium impedit excepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','websolutionus','https://websolutionus.com','2023-02-18 04:40:20','2023-10-18 15:02:55'),
	(7,'/uploads/8474288788.jpg','Artificial Intelligence',11,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis voluptate aspernatur similique officia nihil exercitationem qui corporis iste assumenda eum quaerat? Porro amet repellat molestias eos iusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam ipsa nihil minima odio vitae, architecto totam, praesentium impedit excepturi ipsam.<br><br>Process Story<br><br>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis, voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.<br><br>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat sit soluta .<br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla, consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod. Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti .<br></p>','websolutionus','https://websolutionus.com','2023-02-18 04:46:30','2023-10-18 15:02:24'),
	(8,'/uploads/2009349997.jpg','Quantum Computing',12,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','websolutionus','https://websolutionus.com','2023-02-18 04:50:11','2023-10-18 15:02:16'),
	(9,'/uploads/7325646185.jpg','Data Analytics',12,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','websolutionus','https://websolutionus.com','2023-02-18 04:50:43','2023-10-18 15:02:08'),
	(10,'/uploads/2834679915.jpg','Cyber Security',13,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','websolutionus','https://websolutionus.com','2023-02-18 04:51:25','2023-10-18 15:01:59'),
	(11,'/uploads/5239746834.jpg','Blockchain Technology',14,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','websolutionus','https://websolutionus.com','2023-02-18 04:52:40','2023-10-18 15:01:51'),
	(12,'/uploads/20177708333.jpg','Augmented Reality',14,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','websolutionus','https://websolutionus.com','2023-02-18 04:54:24','2023-10-18 15:01:41'),
	(13,'/uploads/17159428502.jpg','Virtual Reality',12,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','websolutionus','https://websolutionus.com','2023-02-18 04:54:51','2023-10-18 15:00:46'),
	(14,'/uploads/5105219322.jpg','Machine Learning',12,'<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Autem porro\r\n ex repellat nobis maxime odio et, dolore fuga excepturi culpa, officiis\r\n voluptate aspernatur similique officia nihil exercitationem qui \r\ncorporis iste assumenda eum quaerat? Porro amet repellat molestias eos \r\niusto suscipit quos ex beatae aut voluptate deserunt dicta esse ullam \r\nipsa nihil minima odio vitae, architecto totam, praesentium impedit \r\nexcepturi ipsam.</p><p><br></p><h3>Process Story</h3>\r\n                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Soluta et veniam omnis,\r\n                                voluptatem qui dolorem nulla provident totam saepe, odit quibusdam dignissimos tempora\r\n                                autem ut illo obcaecati ducimus sint repudiandae! Hic eos nam aperiam fugit?\r\n                                Perspiciatis explicabo ab harum. Sed ducimus veniam voluptatibus qui ea, atque sint eum\r\n                                quae molestiae quod officiis, at enim ab necessitatibus laborum! Dolores necessitatibus\r\n                                a earum perspiciatis ut consectetur corrupti omnis cum fugit, explicabo dolorem\r\n                                similique deleniti inventore natus! Quaerat sit soluta enim at reiciendis?.</p>\r\n                            <ul class=\"dots-list\"><li>First refinement become it over a may an that harmonic every away.</li><li>Clarinet she or here, separated hides. With work a and so pay different chooses\r\n                                    answer.</li><li>Never analyzed the of boss\'s films death, heaven cache name any judgment, all.</li></ul>\r\n                            <p>Hic eos nam aperiam fugit? Perspiciatis explicabo ab harum. Sed ducimus veniam\r\n                                voluptatibus qui ea, atque sint eum quae molestiae quod officiis, at enim ab\r\n                                necessitatibus laborum! Dolores necessitatibus a earum perspiciatis ut consectetur\r\n                                corrupti omnis cum fugit, explicabo dolorem similique deleniti inventore natus! Quaerat\r\n                                sit soluta .</p>\r\n                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo animi libero suscipit\r\n                                praesentium perferendis possimus, ex dicta eius ea soluta sunt. Sapiente nulla,\r\n                                consequuntur ipsam saepe ad numquam blanditiis fugiat animi. Harum fugit incidunt\r\n                                nostrum eligendi doloremque vero possimus illum consequuntur quae sint officia\r\n                                repudiandae porro maxime cupiditate dolor magnam totam sit natus id neque quod.\r\n                                Molestias illo repudiandae laudantium illum perspiciatis nisi quasi amet corrupti\r\n                                .</p><p></p>','websolutionus','https://websolutionus.com','2023-02-18 04:55:35','2023-10-18 15:00:36');

/*!40000 ALTER TABLE `portfolio_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table portfolio_section_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `portfolio_section_settings`;

CREATE TABLE `portfolio_section_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `portfolio_section_settings` WRITE;
/*!40000 ALTER TABLE `portfolio_section_settings` DISABLE KEYS */;

INSERT INTO `portfolio_section_settings` (`id`, `title`, `sub_title`, `created_at`, `updated_at`)
VALUES
	(1,'Latest Portfolio','Earum quos animi numquam excepturi eveniet explicabo repellendus rem esse. Quae quasi odio enim.','2023-02-06 11:02:44','2023-02-06 12:09:04');

/*!40000 ALTER TABLE `portfolio_section_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table portfolio_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `portfolio_settings`;

CREATE TABLE `portfolio_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table qualifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qualifications`;

CREATE TABLE `qualifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'experience',
  `organization_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `qualifications` WRITE;
/*!40000 ALTER TABLE `qualifications` DISABLE KEYS */;

INSERT INTO `qualifications` (`id`, `type`, `organization_name`, `address`, `start_date`, `end_date`, `description`, `created_at`, `updated_at`)
VALUES
	(10,'education','edu1','edu1','2023-10-01','2023-10-28','<p>snksjnd</p>','2023-10-28 11:15:03','2023-10-28 11:15:03'),
	(11,'experience','exp1','exp1','2023-10-01','2023-10-28','<p>asjhdb</p>','2023-10-28 11:15:26','2023-10-28 11:15:26'),
	(12,'education','edu2','edu2','2023-10-31',NULL,'<p>ajsb</p>','2023-10-28 11:15:56','2023-10-28 11:15:56');

/*!40000 ALTER TABLE `qualifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table seo_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seo_settings`;

CREATE TABLE `seo_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `seo_settings` WRITE;
/*!40000 ALTER TABLE `seo_settings` DISABLE KEYS */;

INSERT INTO `seo_settings` (`id`, `title`, `description`, `keywords`, `created_at`, `updated_at`)
VALUES
	(1,'Rabins | Personal Portfolio HTML Template','Obcaecati nisi tenet','Nesciunt delectus, fsadf','2023-02-16 07:50:52','2023-02-16 07:55:51');

/*!40000 ALTER TABLE `seo_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;

INSERT INTO `services` (`id`, `name`, `description`, `created_at`, `updated_at`)
VALUES
	(3,'Branding Design','Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum quos animi numquam excepturi eveniet explicabo repellendus rem esse. Quae quasi odio enim.','2023-02-04 04:54:24','2023-02-04 04:54:24'),
	(4,'User Interface','Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum quos animi numquam excepturi eveniet explicabo repellendus rem esse. Quae quasi odio enim.','2023-02-04 04:54:51','2023-02-04 04:54:51'),
	(5,'User Experience','Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum quos animi numquam excepturi eveniet explicabo repellendus rem esse. Quae quasi odio enim.','2023-02-04 04:55:13','2023-02-04 04:55:13');

/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table skill_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skill_items`;

CREATE TABLE `skill_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `percent` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `skill_items` WRITE;
/*!40000 ALTER TABLE `skill_items` DISABLE KEYS */;

INSERT INTO `skill_items` (`id`, `name`, `percent`, `created_at`, `updated_at`)
VALUES
	(2,'Web Design',80,'2023-02-08 07:32:20','2023-02-08 07:32:20'),
	(3,'Graphic Design',70,'2023-02-08 07:32:34','2023-02-08 07:32:34'),
	(4,'Web Developement',90,'2023-02-08 07:32:50','2023-02-08 07:32:50'),
	(6,'Analytical Abilities',50,'2023-02-08 07:33:19','2023-02-08 07:33:19'),
	(7,'Problem Solbing',80,'2023-02-08 07:33:32','2023-02-08 07:33:32');

/*!40000 ALTER TABLE `skill_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table skill_section_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skill_section_settings`;

CREATE TABLE `skill_section_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `skill_section_settings` WRITE;
/*!40000 ALTER TABLE `skill_section_settings` DISABLE KEYS */;

INSERT INTO `skill_section_settings` (`id`, `title`, `sub_title`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'Skills','Earum quos animi numquam excepturi eveniet explicabo repellendus rem esse. Quae quasi odio enim.','/uploads/18460745844.jpg','2023-02-07 09:06:03','2023-10-18 15:03:10');

/*!40000 ALTER TABLE `skill_section_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typer_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typer_titles`;

CREATE TABLE `typer_titles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `typer_titles` WRITE;
/*!40000 ALTER TABLE `typer_titles` DISABLE KEYS */;

INSERT INTO `typer_titles` (`id`, `title`, `created_at`, `updated_at`)
VALUES
	(4,'I\'m ui/ux designer.','2023-02-01 10:23:51','2023-02-01 10:23:51'),
	(5,'Let\'s work together.','2023-02-01 10:24:17','2023-02-01 10:24:17'),
	(6,'I  can create awesome stuff.','2023-02-01 10:24:36','2023-02-01 10:24:36'),
	(7,'I am a developer','2023-02-01 10:25:22','2023-02-01 10:25:22');

/*!40000 ALTER TABLE `typer_titles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin123','admin@gmail.com','2023-01-25 05:12:08','$2y$10$m.F1SsX8ExPdEVgsY.uhIuUei.0.judc9V1Tdlxg8rAuNp9N54NT2','YZx5AmuTkQPt2cD4ARwKrjXkmI9ZD8aUNCXJYkIi4zM3YYZ1SW18IjH1w5ex','2023-01-25 05:12:08','2023-01-28 11:52:04');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
