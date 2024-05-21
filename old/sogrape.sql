-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 21, 2023 at 04:00 PM
-- Server version: 8.0.20
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sogrape`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(57, '2014_10_12_000000_create_users_table', 1),
(58, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(59, '2019_08_19_000000_create_failed_jobs_table', 1),
(60, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(61, '2023_10_23_161934_create_products_table', 1),
(62, '2023_10_24_093853_create_brands_table', 1),
(63, '2023_10_24_100900_create_sources_table', 1),
(64, '2023_10_24_134945_create_product_entries_table', 1),
(65, '2023_10_25_100201_add_img_to_products_table', 2),
(66, '2023_10_25_193648_laratrust_setup_tables', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int NOT NULL,
  `harvest_year` int DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `name`, `brand`, `sub_brand`, `capacity`, `harvest_year`, `img`) VALUES
('5601012001310', '2023-10-24 21:22:31', '2023-10-25 09:13:29', 'Mateus Sparkling Brut Rosé', 'Mateus', NULL, 750, NULL, 'https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dwb34c4e57/images/col/434/4342301-frente.jpg?sw=2000&sh=2000'),
('5601012004427', '2023-10-25 07:50:43', '2023-10-25 09:14:50', 'Trinca Bolotas Tinto', 'Herdade do Peso', 'Trinca Bolotas', 750, 2021, 'https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dw78b3a78c/images/col/547/5471317-frente.jpg?sw=2000&sh=2000'),
('5601012011500', '2023-10-24 14:13:07', '2023-10-25 09:15:06', 'Mateus Rosé Original', 'Mateus', NULL, 750, NULL, 'https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dwa4148cdf/images/col/205/2050174-frente.jpg?sw=2000&sh=2000'),
('5601012011920', '2023-10-24 15:08:11', '2023-10-25 09:44:46', 'Papa Figos Branco', 'Casa Ferreirinha', 'Papa Figos', 750, 2022, 'https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dw65f388a2/images/col/627/6274693-frente.jpg?sw=2000&sh=2000'),
('5601096334328', '2023-10-25 08:25:32', '2023-10-25 09:15:37', 'Casal Garcia Sparkling Espumante Rosé', 'Casal Garcia', NULL, 750, NULL, 'https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dwff861e16/images/col/569/5694889-frente.jpg?sw=2000&sh=2000'),
('5601142192636', '2023-10-25 08:22:16', '2023-10-25 09:15:55', 'Lancers Vinho Rosé', 'Lancers', NULL, 750, NULL, 'https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dw7f105161/images/col/205/2050017-frente.jpg?sw=2000&sh=2000'),
('5601989979476', '2023-10-25 12:49:38', '2023-10-25 12:49:38', 'Defesa do Esporão Alentejo Vinho Branco', 'Defesa do Esporão', NULL, 750, NULL, 'https://www.auchan.pt/dw/image/v2/BFRC_PRD/on/demandware.static/-/Sites-auchan-pt-master-catalog/default/dw5ff1983f/images/hi-res/000049306.jpg'),
('5601989981820', '2023-10-25 08:54:53', '2023-10-25 09:16:11', 'Defesa do Esporão Tinto', 'Esporão', NULL, 750, NULL, 'https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dwb730a2ee/images/col/536/5369128-frente.jpg?sw=2000&sh=2000'),
('5603977006433', '2023-10-25 12:13:14', '2023-10-25 12:14:56', 'Diálogo DOC Douro Vinho Branco', 'Diálogo', NULL, 750, NULL, 'https://www.vinha.pt/wp-content/uploads/2015/05/100369.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_entries`
--

CREATE TABLE `product_entries` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `discount` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_entries`
--

INSERT INTO `product_entries` (`id`, `created_at`, `updated_at`, `price`, `discount`, `url`, `product_id`, `store_name`, `product_name`, `currency`, `location`) VALUES
(3, '2023-10-24 16:27:48', '2023-10-24 16:27:48', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(4, '2023-10-24 16:35:25', '2023-10-24 16:35:25', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(5, '2023-10-24 16:35:25', '2023-10-24 16:35:25', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(6, '2023-10-24 16:35:25', '2023-10-24 16:35:25', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(7, '2023-10-24 16:35:25', '2023-10-24 16:35:25', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(8, '2023-10-24 16:35:25', '2023-10-24 16:35:25', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(9, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(10, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(11, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(12, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(13, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 6.19, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(14, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(15, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(16, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(17, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(18, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(19, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(20, '2023-10-25 08:53:11', '2023-10-25 08:53:11', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(21, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(22, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(23, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(24, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(25, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 6.19, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(26, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(27, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(28, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(29, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(30, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(31, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(32, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(33, '2023-10-25 09:45:00', '2023-10-25 09:45:00', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601096334328', '5601096334328', 'Continente', 'Casal Garcia Sparkling Espumante Rosé Meio Seco', '€', NULL),
(34, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(35, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(36, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(37, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(38, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 6.19, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(39, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(40, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(41, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(42, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(43, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(44, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(45, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(46, '2023-10-25 12:05:47', '2023-10-25 12:05:47', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601096334328', '5601096334328', 'Continente', 'Casal Garcia Sparkling Espumante Rosé Meio Seco', '€', NULL),
(47, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(48, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(49, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(50, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(51, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 6.19, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(52, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(53, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(54, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(55, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(56, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(57, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(58, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(59, '2023-10-25 12:07:20', '2023-10-25 12:07:20', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601096334328', '5601096334328', 'Continente', 'Casal Garcia Sparkling Espumante Rosé Meio Seco', '€', NULL),
(60, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(61, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(62, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(63, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(64, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 6.19, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(65, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(66, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(67, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(68, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(69, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(70, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(71, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(72, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601096334328', '5601096334328', 'Continente', 'Casal Garcia Sparkling Espumante Rosé Meio Seco', '€', NULL),
(73, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 3.99, 0, 'https://www.continente.pt/pesquisa/?q=5601142192636', '5601142192636', 'Continente', 'Lancers Vinho Rosé', '€', NULL),
(74, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 3.15, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-lancers-75-cl/item_10811.html?id=36&cat=0&pc=15601142192636', '5601142192636', 'Garrafeira Soares', 'Vinho Rosé Lancers 75 Cl', '€', NULL),
(75, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 3.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601142192636', '5601142192636', 'El Corte Inglés', 'Lancers Vinho Rosé garrafa 75 cl', '€', NULL),
(76, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 4.99, 1, 'https://www.continente.pt/pesquisa/?q=5601989981820', '5601989981820', 'Continente', 'Defesa do Esporão Regional Alentejano Vinho Tinto', '€', NULL),
(77, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 6.49, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-esporao-vinha-da-defesa-75-cl/item_10014.html?id=36&cat=0&pc=15601989981820', '5601989981820', 'Garrafeira Soares', 'Vinho Tinto Esporão Vinha Da Defesa 75 Cl', '€', NULL),
(78, '2023-10-25 12:21:18', '2023-10-25 12:21:18', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601989981820', '5601989981820', 'El Corte Inglés', 'Defesa do Esporão Vinho Tinto do Alentejo garrafa 75 cl', '€', NULL),
(79, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(80, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(81, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(82, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(83, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 6.19, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(84, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(85, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(86, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(87, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(88, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(89, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(90, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(91, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601096334328', '5601096334328', 'Continente', 'Casal Garcia Sparkling Espumante Rosé Meio Seco', '€', NULL),
(92, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 3.99, 0, 'https://www.continente.pt/pesquisa/?q=5601142192636', '5601142192636', 'Continente', 'Lancers Vinho Rosé', '€', NULL),
(93, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 3.15, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-lancers-75-cl/item_10811.html?id=36&cat=0&pc=15601142192636', '5601142192636', 'Garrafeira Soares', 'Vinho Rosé Lancers 75 Cl', '€', NULL),
(94, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 3.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601142192636', '5601142192636', 'El Corte Inglés', 'Lancers Vinho Rosé garrafa 75 cl', '€', NULL),
(95, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 4.99, 1, 'https://www.continente.pt/pesquisa/?q=5601989981820', '5601989981820', 'Continente', 'Defesa do Esporão Regional Alentejano Vinho Tinto', '€', NULL),
(96, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 6.49, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-esporao-vinha-da-defesa-75-cl/item_10014.html?id=36&cat=0&pc=15601989981820', '5601989981820', 'Garrafeira Soares', 'Vinho Tinto Esporão Vinha Da Defesa 75 Cl', '€', NULL),
(97, '2023-10-25 13:13:36', '2023-10-25 13:13:36', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601989981820', '5601989981820', 'El Corte Inglés', 'Defesa do Esporão Vinho Tinto do Alentejo garrafa 75 cl', '€', NULL),
(98, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(99, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(100, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(101, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(102, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.19, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(103, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(104, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(105, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(106, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(107, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(108, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(109, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(110, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601096334328', '5601096334328', 'Continente', 'Casal Garcia Sparkling Espumante Rosé Meio Seco', '€', NULL),
(111, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 3.99, 0, 'https://www.continente.pt/pesquisa/?q=5601142192636', '5601142192636', 'Continente', 'Lancers Vinho Rosé', '€', NULL),
(112, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 3.15, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-lancers-75-cl/item_10811.html?id=36&cat=0&pc=15601142192636', '5601142192636', 'Garrafeira Soares', 'Vinho Rosé Lancers 75 Cl', '€', NULL),
(113, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 3.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601142192636', '5601142192636', 'El Corte Inglés', 'Lancers Vinho Rosé garrafa 75 cl', '€', NULL),
(114, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 4.99, 1, 'https://www.continente.pt/pesquisa/?q=5601989979476', '5601989979476', 'Continente', 'Defesa do Esporão Regional Alentejano Vinho Branco', '€', NULL),
(115, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.49, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-esporao-vinha-da-defesa-75-cl/item_10562.html?id=36&cat=0&pc=15601989979476', '5601989979476', 'Garrafeira Soares', 'Vinho Branco Esporão Vinha Da Defesa 75 Cl', '€', NULL),
(116, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601989979476', '5601989979476', 'El Corte Inglés', 'Defesa do Esporão Vinho Branco do Alentejo garrafa 75 cl', '€', NULL),
(117, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 4.99, 1, 'https://www.continente.pt/pesquisa/?q=5601989981820', '5601989981820', 'Continente', 'Defesa do Esporão Regional Alentejano Vinho Tinto', '€', NULL),
(118, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 6.49, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-esporao-vinha-da-defesa-75-cl/item_10014.html?id=36&cat=0&pc=15601989981820', '5601989981820', 'Garrafeira Soares', 'Vinho Tinto Esporão Vinha Da Defesa 75 Cl', '€', NULL),
(119, '2023-10-25 13:50:48', '2023-10-25 13:50:48', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601989981820', '5601989981820', 'El Corte Inglés', 'Defesa do Esporão Vinho Tinto do Alentejo garrafa 75 cl', '€', NULL),
(120, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(121, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(122, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(123, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(124, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 5.88, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(125, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 5.59, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(126, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(127, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(128, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(129, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(130, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(131, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(132, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601096334328', '5601096334328', 'Continente', 'Casal Garcia Sparkling Espumante Rosé Meio Seco', '€', NULL),
(133, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 5.75, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-casal-garcia-rose-75-cl/item_1149.html?id=36&cat=0&pc=15601096334328', '5601096334328', 'Garrafeira Soares', 'Espumante Casal Garcia Rose 75 Cl', '€', NULL),
(134, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 2.99, 1, 'https://www.continente.pt/pesquisa/?q=5601142192636', '5601142192636', 'Continente', 'Lancers Vinho Rosé', '€', NULL),
(135, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 3.15, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-lancers-75-cl/item_10811.html?id=36&cat=0&pc=15601142192636', '5601142192636', 'Garrafeira Soares', 'Vinho Rosé Lancers 75 Cl', '€', NULL),
(136, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 3.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601142192636', '5601142192636', 'El Corte Inglés', 'Lancers Vinho Rosé garrafa 75 cl', '€', NULL),
(137, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 4.99, 1, 'https://www.continente.pt/pesquisa/?q=5601989979476', '5601989979476', 'Continente', 'Defesa do Esporão Regional Alentejano Vinho Branco', '€', NULL),
(138, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 6.49, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-esporao-vinha-da-defesa-75-cl/item_10562.html?id=36&cat=0&pc=15601989979476', '5601989979476', 'Garrafeira Soares', 'Vinho Branco Esporão Vinha Da Defesa 75 Cl', '€', NULL),
(139, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 4.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601989979476', '5601989979476', 'El Corte Inglés', 'Defesa do Esporão Vinho Branco do Alentejo garrafa 75 cl', '€', NULL),
(140, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 4.99, 1, 'https://www.continente.pt/pesquisa/?q=5601989981820', '5601989981820', 'Continente', 'Defesa do Esporão Regional Alentejano Vinho Tinto', '€', NULL),
(141, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 6.49, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-esporao-vinha-da-defesa-75-cl/item_10014.html?id=36&cat=0&pc=15601989981820', '5601989981820', 'Garrafeira Soares', 'Vinho Tinto Esporão Vinha Da Defesa 75 Cl', '€', NULL),
(142, '2023-11-20 12:38:39', '2023-11-20 12:38:39', 4.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601989981820', '5601989981820', 'El Corte Inglés', 'Defesa do Esporão Vinho Tinto do Alentejo garrafa 75 cl', '€', NULL),
(143, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012001310', '5601012001310', 'Continente', 'Mateus Sparkling Espumante Rosé Bruto', '€', NULL),
(144, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 6.69, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-mateus-rose-75-cl/item_1127.html?id=36&cat=0&pc=15601012001310', '5601012001310', 'Garrafeira Soares', 'Espumante Mateus Rosé 75 Cl', '€', NULL),
(145, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 6.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012001310', '5601012001310', 'El Corte Inglés', 'Mateus Espumante Sparkling Rosé Bruto garrafa 75 cl', '€', NULL),
(146, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012004427', '5601012004427', 'Continente', 'Trinca Bolotas Regional Alentejano Vinho Tinto', '€', NULL),
(147, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 5.88, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-trinca-bolotas-75-cl/item_10039.html?id=36&cat=0&pc=15601012004427', '5601012004427', 'Garrafeira Soares', 'Vinho Tinto Trinca Bolotas 75 Cl', '€', NULL),
(148, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 5.59, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012004427', '5601012004427', 'El Corte Inglés', 'Trinca Bolotas Vinho Tinto Regional do Alentejo garrafa 75 cl', '€', NULL),
(149, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 4.49, 0, 'https://www.continente.pt/pesquisa/?q=5601012011500', '5601012011500', 'Continente', 'Mateus Vinho Rosé', '€', NULL),
(150, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 3.59, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-mateus-75-cl/item_10807.html?id=36&cat=0&pc=15601012011500', '5601012011500', 'Garrafeira Soares', 'Vinho Rosé Mateus 75 Cl', '€', NULL),
(151, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 4.49, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011500', '5601012011500', 'El Corte Inglés', 'Mateus Vinho Rosé garrafa 75 cl', '€', NULL),
(152, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 7.99, 0, 'https://www.continente.pt/pesquisa/?q=5601012011920', '5601012011920', 'Continente', 'Papa Figos DOC Douro Vinho Branco', '€', NULL),
(153, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 7.29, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-douro-papa-figos-75-cl/item_10769.html?id=36&cat=0&pc=15601012011920', '5601012011920', 'Garrafeira Soares', 'Vinho Branco Douro Papa Figos 75 Cl', '€', NULL),
(154, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 7.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601012011920', '5601012011920', 'El Corte Inglés', 'Papa Figos Vinho Branco do Douro garrafa 75 cl', '€', NULL),
(155, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 6.99, 0, 'https://www.continente.pt/pesquisa/?q=5601096334328', '5601096334328', 'Continente', 'Casal Garcia Sparkling Espumante Rosé Meio Seco', '€', NULL),
(156, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 5.75, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-casal-garcia-rose-75-cl/item_1149.html?id=36&cat=0&pc=15601096334328', '5601096334328', 'Garrafeira Soares', 'Espumante Casal Garcia Rose 75 Cl', '€', NULL),
(157, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 2.99, 1, 'https://www.continente.pt/pesquisa/?q=5601142192636', '5601142192636', 'Continente', 'Lancers Vinho Rosé', '€', NULL),
(158, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 3.15, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-rose-lancers-75-cl/item_10811.html?id=36&cat=0&pc=15601142192636', '5601142192636', 'Garrafeira Soares', 'Vinho Rosé Lancers 75 Cl', '€', NULL),
(159, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 3.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601142192636', '5601142192636', 'El Corte Inglés', 'Lancers Vinho Rosé garrafa 75 cl', '€', NULL),
(160, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 4.99, 1, 'https://www.continente.pt/pesquisa/?q=5601989979476', '5601989979476', 'Continente', 'Defesa do Esporão Regional Alentejano Vinho Branco', '€', NULL),
(161, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 6.49, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-branco-esporao-vinha-da-defesa-75-cl/item_10562.html?id=36&cat=0&pc=15601989979476', '5601989979476', 'Garrafeira Soares', 'Vinho Branco Esporão Vinha Da Defesa 75 Cl', '€', NULL),
(162, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 4.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601989979476', '5601989979476', 'El Corte Inglés', 'Defesa do Esporão Vinho Branco do Alentejo garrafa 75 cl', '€', NULL),
(163, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 4.99, 1, 'https://www.continente.pt/pesquisa/?q=5601989981820', '5601989981820', 'Continente', 'Defesa do Esporão Regional Alentejano Vinho Tinto', '€', NULL),
(164, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 6.49, 0, 'https://www.garrafeirasoares.pt/pt/portugal/vinhos/vinho-tinto-esporao-vinha-da-defesa-75-cl/item_10014.html?id=36&cat=0&pc=15601989981820', '5601989981820', 'Garrafeira Soares', 'Vinho Tinto Esporão Vinha Da Defesa 75 Cl', '€', NULL),
(165, '2023-11-21 14:59:27', '2023-11-21 14:59:27', 4.99, 0, 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term=5601989981820', '5601989981820', 'El Corte Inglés', 'Defesa do Esporão Vinho Tinto do Alentejo garrafa 75 cl', '€', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Administrator', '2023-10-25 18:44:20', '2023-10-25 18:44:20'),
(2, 'brand-manager', 'Brand Manager', NULL, '2023-10-25 18:44:31', '2023-10-25 18:44:31'),
(3, 'user', 'User', NULL, '2023-10-25 18:45:16', '2023-10-25 18:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`, `team_id`) VALUES
(1, 1, 'App\\Models\\User', NULL),
(3, 2, 'App\\Models\\User', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'admin@email.com', NULL, '$2y$10$ldmz8yOFwlSPe7ME/vk6qOLgXBkbDziTJLw3IPPVt2SnQ19vbAyAe', NULL, '2023-10-24 14:12:53', '2023-10-25 18:48:56'),
(2, 'Sarah', 'user@email.com', NULL, '$2y$10$as0wxQkVjP356DW4yXU8auhvWkUCzFDu/MN.4kWOaKyPtEoQsMGNO', NULL, '2023-10-25 18:49:49', '2023-10-25 18:49:49'),
(3, 'sogrape', 'sogrape@email.com', NULL, '$2y$10$ldmz8yOFwlSPe7ME/vk6qOLgXBkbDziTJLw3IPPVt2SnQ19vbAyAe', NULL, '2023-11-20 12:36:57', '2023-11-20 12:36:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD UNIQUE KEY `permission_user_user_id_permission_id_user_type_team_id_unique` (`user_id`,`permission_id`,`user_type`,`team_id`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_user_team_id_foreign` (`team_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_entries`
--
ALTER TABLE `product_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_entries_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD UNIQUE KEY `role_user_user_id_role_id_user_type_team_id_unique` (`user_id`,`role_id`,`user_type`,`team_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_team_id_foreign` (`team_id`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teams_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_entries`
--
ALTER TABLE `product_entries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_user_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_entries`
--
ALTER TABLE `product_entries`
  ADD CONSTRAINT `product_entries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
