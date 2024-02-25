-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: recipeproject
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add user profile',7,'add_userprofile'),(26,'Can change user profile',7,'change_userprofile'),(27,'Can delete user profile',7,'delete_userprofile'),(28,'Can view user profile',7,'view_userprofile'),(29,'Can add recipe',8,'add_recipe'),(30,'Can change recipe',8,'change_recipe'),(31,'Can delete recipe',8,'delete_recipe'),(32,'Can view recipe',8,'view_recipe'),(33,'Can add rating',9,'add_rating'),(34,'Can change rating',9,'change_rating'),(35,'Can delete rating',9,'delete_rating'),(36,'Can view rating',9,'view_rating'),(37,'Can add comment',10,'add_comment'),(38,'Can change comment',10,'change_comment'),(39,'Can delete comment',10,'delete_comment'),(40,'Can view comment',10,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_projectapp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_projectapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `projectapp_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-02-25 04:49:02.997854','1','Max\'s-Style Filipino Fried Chicken',1,'[{\"added\": {}}]',8,1),(2,'2024-02-25 06:20:32.805931','1','admin',1,'[{\"added\": {}}]',7,1),(3,'2024-02-25 06:32:54.518308','2','sadsadsa',1,'[{\"added\": {}}]',8,1),(4,'2024-02-25 06:40:30.663919','3','qweasdas',1,'[{\"added\": {}}]',8,1),(5,'2024-02-25 07:21:02.292352','3','qwerty@gmail.com',1,'[{\"added\": {}}]',6,1),(6,'2024-02-25 07:22:30.419888','3','Spicy Chicken Noodles',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Ingredients\", \"Instructions\", \"Image\"]}}]',8,1),(7,'2024-02-25 07:24:05.291603','3','Spicy Chicken Noodles',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(8,'2024-02-25 07:26:01.273372','2','Banana Bread Bars with Brown Butter Frosting',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Ingredients\", \"Instructions\", \"Image\"]}}]',8,1),(9,'2024-02-25 07:48:34.799223','2','cedrickchu123@gmail.com',2,'[{\"changed\": {\"fields\": [\"Profile image\"]}}]',7,1),(10,'2024-02-25 09:50:10.437525','1','admin',2,'[{\"changed\": {\"fields\": [\"Profile image\"]}}]',7,1),(11,'2024-02-25 10:24:11.837457','1','admin - Banana Bread Bars with Brown Butter Frosting - 5',1,'[{\"added\": {}}]',9,1),(12,'2024-02-25 10:59:26.713289','2','qwerty - Banana Bread Bars with Brown Butter Frosting - 2',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(10,'projectapp','comment'),(9,'projectapp','rating'),(8,'projectapp','recipe'),(6,'projectapp','user'),(7,'projectapp','userprofile'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-25 04:44:54.369035'),(2,'contenttypes','0002_remove_content_type_name','2024-02-25 04:44:54.407733'),(3,'auth','0001_initial','2024-02-25 04:44:54.561774'),(4,'auth','0002_alter_permission_name_max_length','2024-02-25 04:44:54.607491'),(5,'auth','0003_alter_user_email_max_length','2024-02-25 04:44:54.619795'),(6,'auth','0004_alter_user_username_opts','2024-02-25 04:44:54.619795'),(7,'auth','0005_alter_user_last_login_null','2024-02-25 04:44:54.633306'),(8,'auth','0006_require_contenttypes_0002','2024-02-25 04:44:54.633306'),(9,'auth','0007_alter_validators_add_error_messages','2024-02-25 04:44:54.633306'),(10,'auth','0008_alter_user_username_max_length','2024-02-25 04:44:54.646551'),(11,'auth','0009_alter_user_last_name_max_length','2024-02-25 04:44:54.646551'),(12,'auth','0010_alter_group_name_max_length','2024-02-25 04:44:54.659961'),(13,'auth','0011_update_proxy_permissions','2024-02-25 04:44:54.673254'),(14,'auth','0012_alter_user_first_name_max_length','2024-02-25 04:44:54.673254'),(15,'projectapp','0001_initial','2024-02-25 04:44:54.855630'),(16,'admin','0001_initial','2024-02-25 04:44:54.953728'),(17,'admin','0002_logentry_remove_auto_add','2024-02-25 04:44:54.962207'),(18,'admin','0003_logentry_add_action_flag_choices','2024-02-25 04:44:54.967995'),(19,'projectapp','0002_recipe_rating_comment','2024-02-25 04:44:55.131168'),(20,'sessions','0001_initial','2024-02-25 04:44:55.153109');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('eegmymcfkljwvseuqp9perjg59sh3v5u','.eJxVjEsOAiEQBe_C2kwauhVwpx6ENL-gRocMzMp4d0edhW7r1auHcDz34uaWJneOYi-k2Pwyz-Ga7u-hTuMlhc61DmFufbx9rVUYTh92WNBxvfx1CreyRCwQgjdMkQkMQERSGAmUlzbHoI3KRgbYKmJtDWOmvENEn7RlCWjE8wXiXDpI:1re6Rr:fn_YZtxDdD6jGOeAhkB8t_KGdEZ0RmJLotq1-I9gb_s','2024-03-10 04:49:11.907337'),('wu08pmxea2cwpc1xeph9dybvchzm1x23','.eJxVjEsOAiEQBe_C2kwauhVwpx6ENL-gRocMzMp4d0edhW7r1auHcDz34uaWJneOYi-k2Pwyz-Ga7u-hTuMlhc61DmFufbx9rVUYTh92WNBxvfx1CreyRCwQgjdMkQkMQERSGAmUlzbHoI3KRgbYKmJtDWOmvENEn7RlCWjE8wXiXDpI:1reCDw:woFC4tFN3J2qwGdkOXaGDXb4dH1iJ7Q2zmLU4f4UA18','2024-03-10 10:59:12.693931');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectapp_comment`
--

DROP TABLE IF EXISTS `projectapp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectapp_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `recipe_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projectapp_comment_user_id_1f376fcd_fk_projectapp_user_id` (`user_id`),
  KEY `projectapp_comment_recipe_id_2a6deb24_fk_projectapp_recipe_id` (`recipe_id`),
  CONSTRAINT `projectapp_comment_recipe_id_2a6deb24_fk_projectapp_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `projectapp_recipe` (`id`),
  CONSTRAINT `projectapp_comment_user_id_1f376fcd_fk_projectapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `projectapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectapp_comment`
--

LOCK TABLES `projectapp_comment` WRITE;
/*!40000 ALTER TABLE `projectapp_comment` DISABLE KEYS */;
INSERT INTO `projectapp_comment` VALUES (8,'asdsad','2024-02-25 11:09:14.168956',1,2),(9,'asdsad','2024-02-25 11:10:22.871780',1,2),(10,'asdsad','2024-02-25 11:11:14.618151',1,2);
/*!40000 ALTER TABLE `projectapp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectapp_rating`
--

DROP TABLE IF EXISTS `projectapp_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectapp_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `recipe_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projectapp_rating_user_id_0ee3698a_fk_projectapp_user_id` (`user_id`),
  KEY `projectapp_rating_recipe_id_fc035801_fk_projectapp_recipe_id` (`recipe_id`),
  CONSTRAINT `projectapp_rating_recipe_id_fc035801_fk_projectapp_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `projectapp_recipe` (`id`),
  CONSTRAINT `projectapp_rating_user_id_0ee3698a_fk_projectapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `projectapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectapp_rating`
--

LOCK TABLES `projectapp_rating` WRITE;
/*!40000 ALTER TABLE `projectapp_rating` DISABLE KEYS */;
INSERT INTO `projectapp_rating` VALUES (1,5,'2024-02-25 10:24:11.834592',1,2),(2,2,'2024-02-25 10:59:26.713289',3,2);
/*!40000 ALTER TABLE `projectapp_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectapp_recipe`
--

DROP TABLE IF EXISTS `projectapp_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectapp_recipe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `ingredients` longtext NOT NULL,
  `instructions` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projectapp_recipe_created_by_id_101478d1_fk_projectapp_user_id` (`created_by_id`),
  CONSTRAINT `projectapp_recipe_created_by_id_101478d1_fk_projectapp_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `projectapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectapp_recipe`
--

LOCK TABLES `projectapp_recipe` WRITE;
/*!40000 ALTER TABLE `projectapp_recipe` DISABLE KEYS */;
INSERT INTO `projectapp_recipe` VALUES (1,'Max\'s-Style Filipino Fried Chicken','This is Max\'s fried chicken the way you remember it: crisp, golden brown skin revealing juicy (not dry!) patis-seasoned meat, ready to dunk in banana ketchup.','1–2 whole chickens, 900g–1kg each\r\n3–4 cups water\r\ncloves from 2 heads garlic, smashed\r\n1–2 medium-sized red onions, quartered\r\n⅓–¼ cup fish sauce\r\n2 tbsp soy sauce\r\n1 tbsp iodized salt\r\nbay leaves\r\nwhole black peppercorns\r\nparsley stalks, optional\r\nsalt & pepper\r\ngarlic powder, optional\r\nneutral oil, for deep frying','Remove backbone: Place chicken on a cutting board breast side down. Using a pair of kitchen shears (it\'s faster and safer than a knife), cut out the backbone by cutting along each side of the spine. You can keep the backbone in the freezer to boil for stocks.\r\nFlatten chicken: Flip chicken so it is skin side up. Using the base of your palm, gently press down on the breastbone to flatten the chicken. You should hear a crack if you did it correctly.\r\nClean chicken: Rinse flattened chicken with water to remove impurities. Pat dry with paper towels and set aside.\r\nPrepare poaching liquid: Fill wok or deep pot with water. Add garlic cloves, red onions, fish sauce, soy sauce, salt, bay leaves, peppercorns, and parsley stalks (if using). Bring mixture to a boil over medium-high heat.\r\nPoach chicken: Add chicken, skin side up, to the poaching liquid. Cook partially for 1 minute. Flip chicken and cook for 2 minutes. Baste chicken by pouring poaching liquid over the meat with a ladle. Flip chicken again, then cook and baste for another 2 minutes.\r\nSeason and dry chicken: Remove chicken from poaching liquid and set skin side up on a metal rack fitted over a tray. Brush fish sauce all over the chicken. Sprinkle salt, black pepper, and garlic powder (if using) all over the skin, rubbing it all over the surface of the chicken with clean hands. Store in the fridge overnight or up to 24 hours, uncovered, until chicken is dry to the touch.\r\nPrepare for frying: Add oil deep enough to go halfway up the chicken to a wok, Dutch oven, or heavy-bottomed pot. Heat oil over medium high to 340–350°F. Remove chicken from the fridge and pat dry with a paper towel.\r\nFry chicken: Add chicken skin side down to the hot oil. Fry until light golden brown, using a ladle to baste the chicken with hot oil to cook it evenly, about 3–5 minutes. Halfway through cooking, carefully flip the chicken using tongs and a spider strainer to avoid splashing. Remove from heat and set on a metal rack or heatproof plate lined with paper towels. Let rest for at least 15 minutes—you want the chicken\'s interior to cool down before frying again.\r\n Double-fry chicken: Reheat oil to 370–375°F. Add chicken to the oil skin side up. Fry and baste until skin is deep golden brown, about 5–7 minutes, flipping every 30–45 seconds for even cooking. Thickest parts of the chicken should register at least 165°F in an instant-read thermometer.\r\nServe: Place fried chicken on a chopping board and let rest. Either slice and divide into smaller pieces, or serve chicken whole on a serving plate. Serve with kamote fries and banana ketchup.','recipe_images/max_fried_chicken_mm6YCN7.png','2024-02-25 04:49:02.997854',1),(2,'Banana Bread Bars with Brown Butter Frosting','These banana bread bars with brown butter icing are moist and flavorful.','Bars:\r\n\r\n1 ½ cups white sugar\r\n\r\n1 cup sour cream\r\n\r\n½ cup butter, softened\r\n\r\n2 large eggs\r\n\r\n1 ¾ cups mashed ripe bananas\r\n\r\n2 teaspoons vanilla extract\r\n\r\n2 cups all-purpose flour\r\n\r\n1 teaspoon baking soda\r\n\r\n¾ teaspoon salt\r\n\r\n½ cup chopped walnuts (Optional)\r\n\r\nFrosting:\r\n\r\n½ cup butter\r\n\r\n4 cups confectioners\' sugar\r\n\r\n3 tablespoons milk\r\n\r\n1 ½ teaspoons vanilla extract','Preheat the oven to 350 degrees F (175 degrees C). Grease and flour a 15x10-inch jelly roll pan.\r\n\r\nMake bars: Beat together white sugar, sour cream, softened butter, and eggs in a large bowl with an electric mixer until creamy. Beat in mashed bananas and vanilla. Add flour, baking soda, and salt; mix for 1 minute. Stir in walnuts until evenly incorporated. Spread in the prepared pan.\r\n\r\nBake in the preheated oven until golden and a toothpick inserted into the center comes out clean, about 27 minutes. Place on a wire rack to cool completely.\r\n\r\nMake frosting: Melt butter in a large saucepan over medium heat until bubbling and golden brown, 3 to 5 minutes. Remove from heat. Whisk in confectioners\' sugar, milk, and vanilla until smooth.\r\n\r\nSpread frosting over cooled banana cake. Cut into bars.','recipe_images/banana_bread.png','2024-02-25 06:32:54.516308',2),(3,'Spicy Chicken Noodles','No matter what recipe they\'re used in, rice noodles are a proven crowd-pleaser. I think this spicy chicken noodles dish is perfect for using up leftover chicken, assuming it wasn\'t horribly overcooked in the first place. If you did want to use raw chicken, go ahead and chop it up, and stir-fry it for a minute or two before adding your vegetables.','1 large carrot, finely sliced or shredded\r\n\r\n2 cups shredded green cabbage\r\n\r\n1 red bell pepper, thinly sliced\r\n\r\n2 jalapeno pepper, seeded and minced\r\n\r\n½ cup chopped green onions\r\n\r\n3 cloves garlic, finely crushed\r\n½ cup chicken broth\r\n\r\n¼ cup seasoned rice vinegar\r\n\r\n1 tablespoon hoisin sauce\r\n\r\n1 tablespoon soy sauce, plus more to taste\r\n\r\n1 tablespoon ketchup\r\n\r\n1 tablespoon brown sugar\r\n\r\n1 tablespoon sriracha hot sauce, or more to taste\r\n\r\n1 teaspoon red pepper flakes\r\n1 (8 ounce) package dried rice noodles\r\n\r\n1 pinch salt\r\n\r\n8 ounces cooked chicken breast, torn into bite-size pieces\r\n\r\n1 tablespoon sesame oil\r\n\r\n1 tablespoon vegetable oil\r\n\r\n½ cup freshly chopped cilantro','Place carrots, cabbage, bell pepper, jalapeno pepper, green onions, and garlic in a mixing bowl.\r\n\r\nMix chicken broth, rice vinegar, hoisin sauce, soy sauce, ketchup, brown sugar, sriracha sauce, and red pepper flakes together in a separate mixing bowl.\r\n\r\nPlace dry rice noodles in a large mixing bowl. Cover with about 6 cups boiling water; add a pinch of salt. Stir from time to time until noodles are soft, about 10 minutes. Drain; cool with cold water. Drain thoroughly. Transfer to a mixing bowl. Add shredded chicken; drizzle with sesame oil. Toss to coat.\r\n\r\nHeat large skillet over high heat; drizzle in vegetable oil. When oil is hot (almost but not quite smoking), add the vegetable mixture. Cook and stir until vegetables are hot and steamy, 1 or 2 minutes. Pour in sauce; cook and stir over high heat until sauce starts to bubble, about 1 minute. Add noodles and chicken. Cook and stir to blend ingredients and ensure ingredients are hot, about 1 minute. Remove from heat. Add chopped cilantro; stir.','recipe_images/spicy_chicken_noodle.png','2024-02-25 06:40:30.662912',2),(4,'sadsad','asdsadsa','sadsada','asdsad','recipe_images/spicy_chicken_noodle_l0infVU.png','2024-02-25 09:28:31.274077',1);
/*!40000 ALTER TABLE `projectapp_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectapp_user`
--

DROP TABLE IF EXISTS `projectapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `first_login` tinyint(1) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `about` longtext NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectapp_user`
--

LOCK TABLES `projectapp_user` WRITE;
/*!40000 ALTER TABLE `projectapp_user` DISABLE KEYS */;
INSERT INTO `projectapp_user` VALUES (1,'pbkdf2_sha256$720000$Zcb0SMrlayIqiKkIjfZjhp$PF3lhgmIll3bvwGKM3w210EfHPuIfa6p1Le+I8Rxv2I=','2024-02-25 10:59:12.690345',1,'admin@gmail.com','admin','','09123456789',0,'2024-02-25 04:45:16.725907','',1,1),(2,'pbkdf2_sha256$720000$nHanya6U262XODQGoTsPfv$rR46Xsxj9dr1r7ZKRfjt4Kg1+HlTdhN2OpWqxQBnTMk=','2024-02-25 10:58:56.884296',0,'cedrickchu123@gmail.com','cedrickchu123@gmail.com','','09285654426',0,'2024-02-25 06:15:47.502019','',0,1),(3,'pbkdf2_sha256$720000$AbEcxyXWBkpmaStpw9U4cc$E3OM9rQ9kSMkYK83pGUOxqoFGy7FhlvU6IA3fPv6uXQ=',NULL,0,'qwerty@gmail.com','qwerty','','09123456788',0,'2024-02-25 07:21:02.025075','',0,1);
/*!40000 ALTER TABLE `projectapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectapp_user_groups`
--

DROP TABLE IF EXISTS `projectapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectapp_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectapp_user_groups_user_id_group_id_a1fa295f_uniq` (`user_id`,`group_id`),
  KEY `projectapp_user_groups_group_id_dd9f50db_fk_auth_group_id` (`group_id`),
  CONSTRAINT `projectapp_user_groups_group_id_dd9f50db_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `projectapp_user_groups_user_id_c13b1193_fk_projectapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `projectapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectapp_user_groups`
--

LOCK TABLES `projectapp_user_groups` WRITE;
/*!40000 ALTER TABLE `projectapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectapp_user_user_permissions`
--

DROP TABLE IF EXISTS `projectapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectapp_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projectapp_user_user_per_user_id_permission_id_bb1d3a14_uniq` (`user_id`,`permission_id`),
  KEY `projectapp_user_user_permission_id_72f67b7d_fk_auth_perm` (`permission_id`),
  CONSTRAINT `projectapp_user_user_permission_id_72f67b7d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `projectapp_user_user_user_id_b13cbaa2_fk_projectap` FOREIGN KEY (`user_id`) REFERENCES `projectapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectapp_user_user_permissions`
--

LOCK TABLES `projectapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `projectapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectapp_userprofile`
--

DROP TABLE IF EXISTS `projectapp_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectapp_userprofile` (
  `user_id` bigint NOT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `about_me` longtext,
  `profile_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `projectapp_userprofile_user_id_af881818_fk_projectapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `projectapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectapp_userprofile`
--

LOCK TABLES `projectapp_userprofile` WRITE;
/*!40000 ALTER TABLE `projectapp_userprofile` DISABLE KEYS */;
INSERT INTO `projectapp_userprofile` VALUES (1,'admin','admin','admin','admin',NULL,NULL,'','profile_images/11.jpg'),(2,'cedrick','chu',NULL,NULL,NULL,NULL,'','profile_images/chu.jpg');
/*!40000 ALTER TABLE `projectapp_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-25 19:25:31
