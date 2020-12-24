-- -------------------------------------------------------------
-- TablePlus 3.12.0(354)
--
-- https://tableplus.com/
--
-- Database: multi_auth
-- Generation Time: 2020-12-23 12:35:51.3180
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `admin_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permission_admin_id_permission_id_unique` (`admin_id`,`permission_id`),
  KEY `admin_permission_permission_id_foreign` (`permission_id`),
  CONSTRAINT `admin_permission_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admin_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_role_admin_id_foreign` (`admin_id`),
  CONSTRAINT `admin_role_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `delegates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delegates_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `papers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permission_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_role_role_id_permission_id_unique` (`role_id`,`permission_id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `admin_role` (`id`, `role_id`, `admin_id`) VALUES
('1', '1', '1');

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
('1', 'Super Admin', 'super@admin.com', '$2y$10$BBtSBr8oOP82o/ggWo4ic.pSYiQwjFhB4.2uBVQCYJzT8w/LipJsK', '1', NULL, '2020-11-27 10:16:08', '2020-11-27 10:16:08');

INSERT INTO `delegates` (`id`, `first_name`, `last_name`, `company`, `channel`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('1', 'Kevin', 'Jiang', 'EZICES', 'foreign', 'yhjiang730@icloud.com', NULL, '$2y$10$kx6erKXCF6Q7NdvtSHzbKOR8x.C6yNK6Edv1LAeU2iro8Znk.daSW', NULL, '2020-11-27 10:36:10', '2020-12-23 10:26:27');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
('1', '2014_10_12_000000_create_users_table', '1'),
('2', '2014_10_12_100000_create_password_resets_table', '1'),
('3', '2017_03_06_023521_create_admins_table', '1'),
('4', '2017_03_06_053834_create_admin_role_table', '1'),
('5', '2018_03_06_023523_create_roles_table', '1'),
('6', '2019_08_19_000000_create_failed_jobs_table', '1'),
('7', '2019_12_01_120121_create_permissions_table', '1'),
('8', '2019_12_01_163205_create_permission_role_table', '1'),
('9', '2019_12_01_163233_create_admin_permission_table', '1'),
('10', '2020_11_27_101815_create_delegates_table', '2'),
('11', '2020_12_04_114021_create_papers_table', '3');

INSERT INTO `papers` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
('1', 'Corrupti qui beatae enim perspiciatis porro suscipit veniam.', 'Quo rerum quis nihil omnis laboriosam.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('2', 'Doloribus doloribus veritatis adipisci dolores.', 'Accusamus dolorem et officiis ut et.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('3', 'Numquam quaerat qui officiis occaecati similique accusantium minima.', 'Corporis voluptas iusto reprehenderit.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('4', 'Qui sapiente aut repudiandae et tempore.', 'Excepturi nesciunt sapiente temporibus repellat aut.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('5', 'Velit accusamus ut omnis alias neque cumque.', 'Adipisci nulla magni eos ea iure sit est.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('6', 'Rerum magni alias nihil recusandae eius consequatur.', 'Tempora itaque sed corrupti perspiciatis culpa accusamus.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('7', 'Iusto maiores molestias consequatur.', 'Architecto a quo id illum.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('8', 'Amet non autem laborum ex eos et quae.', 'Similique adipisci saepe nihil.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('9', 'Nemo sunt ratione molestiae eos.', 'Dolorum magni est voluptatem.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('10', 'Praesentium odio fuga consequuntur repellat autem odio.', 'Quo et id sed aut quas aut animi.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('11', 'Maiores vel voluptates aperiam odio voluptate.', 'Autem quam est rem officia est aut saepe.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('12', 'Doloribus culpa quam ex animi dolore.', 'Odit deleniti veniam porro inventore eveniet reprehenderit molestiae.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('13', 'Amet vel voluptas qui voluptas.', 'Maiores quas unde aspernatur tenetur porro ducimus.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('14', 'Itaque libero dolores et rem qui voluptatem.', 'Repellat accusamus iusto ex aliquam quam et omnis.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('15', 'Numquam perferendis dicta nam earum quas corporis.', 'Sit enim nihil placeat autem sit vel.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('16', 'Voluptas molestiae aut omnis saepe impedit non.', 'Tempora id explicabo sit ipsum saepe quae aut qui.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('17', 'Voluptatem molestiae unde quo numquam deleniti quam.', 'Omnis ullam doloremque asperiores quos.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('18', 'Unde autem dolores laborum id est.', 'Consequatur doloribus voluptas nihil ut dolore et et.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('19', 'Illum exercitationem ullam voluptate molestiae soluta ut.', 'Amet aut at reiciendis rerum.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('20', 'Itaque aut et dolores sequi reiciendis voluptas provident.', 'Molestias rerum explicabo ipsum veniam officiis ducimus consequatur.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('21', 'Ea eum aliquid perspiciatis quas aut earum dolorem.', 'Excepturi iusto saepe sit.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('22', 'Omnis quae dolorem aut rerum quae reprehenderit.', 'Harum molestiae et iste neque.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('23', 'Aut consequatur dolorem quis maiores.', 'Rerum cupiditate quis distinctio tempore porro esse.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('24', 'Sed est minus voluptatibus vel repellendus laborum doloribus.', 'Aliquid hic possimus et ea nesciunt.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('25', 'Porro voluptatem excepturi sit ducimus dignissimos nobis cupiditate.', 'Rerum accusantium consectetur autem totam doloremque.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('26', 'Vel dolores voluptatem officia aut occaecati repellendus repellat.', 'Placeat sit sapiente assumenda id.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('27', 'Quasi ut quia eaque vero.', 'Delectus ab similique praesentium eaque deleniti similique quos.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('28', 'Quo quisquam omnis accusantium totam ut aliquam.', 'Ut enim libero ea illo distinctio.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('29', 'Qui ut et sunt natus dignissimos hic vel.', 'Eveniet nesciunt libero nihil nobis qui reiciendis.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('30', 'Non facilis molestiae est ipsa nesciunt.', 'Voluptas esse libero doloribus rerum.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('31', 'Distinctio et temporibus quia fuga a.', 'Officia magni porro quod ratione.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('32', 'Consequatur quae quia quam debitis.', 'Pariatur incidunt facilis aut labore quod quia perspiciatis officia.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('33', 'Distinctio qui aut iste molestiae et cumque.', 'Ut fugit dolores quia mollitia velit.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('34', 'Rem animi dignissimos ut porro error velit suscipit.', 'Commodi necessitatibus sapiente voluptates maiores et amet soluta sit.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('35', 'Iusto odio ipsam voluptatem enim eum ad ut.', 'Cumque veritatis ducimus officiis ad.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('36', 'Et optio libero molestias nesciunt reprehenderit aut cum.', 'Praesentium qui non debitis non soluta.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('37', 'At ullam qui sed optio recusandae.', 'Vel magnam qui aut occaecati ut non praesentium.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('38', 'Ratione porro cupiditate quia voluptatem rerum dolores atque.', 'Sed veritatis quae id non.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('39', 'A voluptas non illum nihil.', 'Laboriosam possimus sunt esse odit laborum culpa.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('40', 'Dolorem reiciendis provident quam.', 'Et pariatur neque ea ad reprehenderit magnam unde.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('41', 'Optio tenetur tempora optio modi nemo aliquam.', 'Et maxime molestiae fugit sint.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('42', 'Aspernatur doloremque hic unde aliquid.', 'Est aspernatur nesciunt omnis corrupti exercitationem esse.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('43', 'Laudantium officiis quo laudantium id harum odit eum ipsum.', 'Sit rerum deleniti itaque modi laudantium enim explicabo.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('44', 'Quibusdam deleniti aut mollitia ea.', 'Quas ea est vero omnis adipisci aut dolorum.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('45', 'Ducimus quibusdam autem accusamus.', 'Ut voluptate enim consequatur ullam recusandae.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('46', 'Pariatur nisi enim voluptas deserunt cum.', 'Amet nihil dolorum saepe aspernatur aliquid.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('47', 'Quos sint impedit natus est quos repellat omnis.', 'Non voluptatem illum maiores et.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('48', 'Qui incidunt qui accusantium at.', 'Aperiam voluptas veniam maxime consectetur reiciendis deserunt autem.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('49', 'Distinctio modi laudantium ex quos suscipit maiores.', 'Aspernatur ducimus corrupti incidunt voluptatibus dolor.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('50', 'Libero autem quo vel nihil sit et ut.', 'Magnam quasi incidunt quaerat.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('51', 'Ex aut praesentium molestias officiis est aut similique.', 'Dolorum ad corrupti voluptatibus ducimus iste et amet.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('52', 'Recusandae rerum vel provident dolor qui ipsum laborum ipsam.', 'Quis aspernatur quaerat ut dolor voluptates ea.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('53', 'Voluptates rem aut itaque ex.', 'Suscipit natus nesciunt exercitationem non est temporibus ut.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('54', 'Sint minus aspernatur esse autem.', 'Est consequatur eum soluta labore a similique nesciunt.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('55', 'Et ipsa et qui rerum.', 'Est et illo accusantium id consequatur ea velit ratione.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('56', 'Qui voluptate natus accusantium quia.', 'Error nulla culpa nisi et qui quis.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('57', 'In et consequuntur quis quaerat quam quidem temporibus.', 'Modi vero soluta facilis tempore qui.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('58', 'Vitae facere quo ab inventore.', 'Itaque quos corporis doloremque omnis et.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('59', 'Doloremque omnis odio vitae qui ea cum.', 'Fugiat facere nobis veniam.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('60', 'Voluptatibus autem voluptatem velit voluptatum.', 'Consequatur voluptatem accusantium voluptatem qui neque vitae.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('61', 'Eligendi ea aut qui ut temporibus.', 'Cumque dolores est ut distinctio.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('62', 'Quis quas molestiae architecto id.', 'Repudiandae possimus alias laborum voluptatibus quis.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('63', 'Dolorem sunt quis rerum debitis nam dicta sint.', 'Excepturi vitae quis inventore velit voluptates sed voluptatem velit.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('64', 'Autem quia ullam laboriosam sint omnis quis tempora.', 'Delectus et accusamus itaque eaque aliquid molestiae.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('65', 'Nisi labore consequuntur non optio sunt ut.', 'Ullam sed incidunt fugiat minima eos.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('66', 'Molestiae maiores omnis perferendis voluptatem voluptas.', 'Est pariatur tenetur voluptatem quaerat.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('67', 'Qui et id id aliquid quos.', 'Tenetur fugit cumque natus cum sit.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('68', 'Tempora architecto omnis neque repudiandae fugiat minima.', 'Non repellendus odio enim aut eum.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('69', 'Sit ullam reiciendis quae aspernatur autem ipsum.', 'Quo numquam asperiores in quam blanditiis.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('70', 'Dolor omnis nam rerum.', 'Quo omnis quae et repellendus.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('71', 'Est corrupti aut aut et.', 'Beatae repellat quis quisquam minus.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('72', 'Nihil illo iusto necessitatibus omnis.', 'Omnis eos velit dolorem illo facere libero et.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('73', 'Voluptas vitae minus pariatur voluptatem velit nam.', 'Consequuntur unde illo quia.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('74', 'Explicabo dignissimos sed quis illum dolorem repudiandae.', 'Quo consequatur aliquam dolorem architecto qui aut qui.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('75', 'Est cupiditate voluptatem et soluta architecto at ut hic.', 'Et qui non aliquid et totam.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('76', 'Consequatur cumque voluptas inventore ut.', 'Est praesentium omnis quas pariatur doloremque qui.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('77', 'Perferendis odio vel praesentium voluptatibus dolor aut cumque pariatur.', 'Atque explicabo laborum distinctio qui dolore doloremque.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('78', 'Vero totam culpa tenetur odit est.', 'Voluptas ducimus animi qui vitae illo natus voluptate.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('79', 'Assumenda amet et excepturi temporibus libero.', 'Nihil officiis quae et provident.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('80', 'Perferendis aut iste consectetur qui magnam.', 'Est quia rerum reiciendis voluptas.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('81', 'Nemo iure aut neque.', 'Dolorem ea sed facilis aliquid atque consectetur reiciendis.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('82', 'Qui est aut quisquam.', 'A error quod quia inventore exercitationem ratione rerum.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('83', 'Deleniti alias esse laboriosam aut rerum aperiam ipsam.', 'Unde id assumenda sit quo.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('84', 'Voluptates est impedit voluptas eaque rerum soluta.', 'Est expedita ullam consequuntur cumque.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('85', 'Possimus est accusamus voluptatum sunt quod.', 'Quo perferendis ut odio fugiat repellat vero quaerat molestias.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('86', 'Enim delectus consequuntur eum facilis.', 'Culpa quibusdam excepturi vero dolor molestiae.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('87', 'Sequi repellat nostrum laudantium voluptatem soluta.', 'Reprehenderit nisi accusantium aut nobis ea consequatur vel.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('88', 'Porro maiores debitis dolorem qui est expedita voluptates.', 'Porro esse ut architecto odit iste beatae sed.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('89', 'Eaque doloribus optio distinctio quis aut.', 'Nulla vel suscipit sit debitis et ut.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('90', 'Iste quis asperiores aut exercitationem vel dolorem.', 'Perspiciatis enim sit et debitis.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('91', 'Deleniti sint dolor dolorum eos repellat.', 'Maxime nisi ut modi consequatur voluptatem.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('92', 'Et magnam officia dolor voluptas tenetur.', 'Error et consequatur officiis accusantium.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('93', 'Repellendus sint sint eveniet eos qui.', 'Quo non aspernatur quibusdam asperiores enim cum delectus consequatur.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('94', 'Voluptate et omnis voluptas amet magni.', 'Ea aut porro odit est dolor.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('95', 'Recusandae sequi reprehenderit et ut dolores.', 'Occaecati dicta maxime aperiam voluptas quo facilis ducimus.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('96', 'Corrupti qui alias eum exercitationem deserunt alias.', 'Molestiae est sed est consequatur molestiae architecto.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('97', 'Blanditiis molestiae eos adipisci vitae aut vero occaecati magnam.', 'Odio et placeat natus corrupti.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('98', 'Quasi ullam molestiae eius quo qui.', 'Doloribus quasi et eaque voluptate et.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('99', 'Aut eos beatae iure facere.', 'Soluta culpa blanditiis aut ab sint minima consectetur accusamus.', '2020-12-04 11:51:55', '2020-12-04 11:51:55'),
('100', 'Voluptatem illum aut fugit aperiam et vitae.', 'Sed perspiciatis animi non quia accusantium et dolor.', '2020-12-04 11:51:55', '2020-12-04 11:51:55');

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
('1', '1', '1', NULL, NULL),
('2', '1', '2', NULL, NULL),
('3', '1', '3', NULL, NULL),
('4', '1', '4', NULL, NULL),
('5', '1', '5', NULL, NULL),
('6', '1', '6', NULL, NULL),
('7', '1', '7', NULL, NULL),
('8', '1', '8', NULL, NULL);

INSERT INTO `permissions` (`id`, `name`, `parent`, `created_at`, `updated_at`) VALUES
('1', 'CreateAdmin', 'Admin', '2020-11-27 10:16:08', '2020-11-27 10:16:08'),
('2', 'CreateRole', 'Role', '2020-11-27 10:16:08', '2020-11-27 10:16:08'),
('3', 'ReadAdmin', 'Admin', '2020-11-27 10:16:08', '2020-11-27 10:16:08'),
('4', 'ReadRole', 'Role', '2020-11-27 10:16:08', '2020-11-27 10:16:08'),
('5', 'UpdateAdmin', 'Admin', '2020-11-27 10:16:08', '2020-11-27 10:16:08'),
('6', 'UpdateRole', 'Role', '2020-11-27 10:16:08', '2020-11-27 10:16:08'),
('7', 'DeleteAdmin', 'Admin', '2020-11-27 10:16:08', '2020-11-27 10:16:08'),
('8', 'DeleteRole', 'Role', '2020-11-27 10:16:08', '2020-11-27 10:16:08');

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
('1', 'super', '2020-11-27 10:16:08', '2020-11-27 10:16:08');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;