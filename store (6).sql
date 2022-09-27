-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2022 at 11:48 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Fruits', 1, NULL, '2022-01-03 07:59:00', '2022-01-03 07:59:00'),
(2, 'Beauty', 2, NULL, '2022-01-03 08:30:06', '2022-01-03 08:30:06'),
(3, 'Pharmacy', 3, NULL, '2022-01-03 08:33:16', '2022-01-03 08:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'this product will have a comment', 14, 1, '2022-01-03 08:43:58', '2022-01-03 08:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `date`, `discount_percentage`, `product_id`, `created_at`, `updated_at`) VALUES
(40, '2021-01-01', 30, 14, '2022-01-03 08:26:19', '2022-01-03 08:26:19'),
(41, '2022-12-01', 50, 14, '2022-01-03 08:26:19', '2022-01-03 08:26:19'),
(42, '2022-02-01', 70, 14, '2022-01-03 08:26:19', '2022-01-03 08:26:19'),
(43, '2021-01-01', 30, 15, '2022-01-03 08:27:20', '2022-01-03 08:27:20'),
(44, '2021-12-01', 50, 15, '2022-01-03 08:27:20', '2022-01-03 08:27:20'),
(45, '2022-01-01', 70, 15, '2022-01-03 08:27:20', '2022-01-03 08:27:20'),
(46, '2021-09-01', 30, 16, '2022-01-03 08:28:20', '2022-01-03 08:28:20'),
(47, '2021-10-01', 50, 16, '2022-01-03 08:28:20', '2022-01-03 08:28:20'),
(48, '2021-11-01', 70, 16, '2022-01-03 08:28:20', '2022-01-03 08:28:20'),
(49, '2021-10-01', 30, 17, '2022-01-03 08:28:57', '2022-01-03 08:28:57'),
(50, '2021-11-01', 50, 17, '2022-01-03 08:28:57', '2022-01-03 08:28:57'),
(51, '2021-12-01', 70, 17, '2022-01-03 08:28:57', '2022-01-03 08:28:57'),
(52, '2021-10-01', 30, 18, '2022-01-03 08:31:26', '2022-01-03 08:31:26'),
(53, '2022-01-01', 50, 18, '2022-01-03 08:31:26', '2022-01-03 08:31:26'),
(54, '2022-02-01', 70, 18, '2022-01-03 08:31:26', '2022-01-03 08:31:26'),
(55, '2021-10-01', 30, 19, '2022-01-03 08:32:12', '2022-01-03 08:32:12'),
(56, '2021-12-01', 50, 19, '2022-01-03 08:32:12', '2022-01-03 08:32:12'),
(57, '2022-01-01', 70, 19, '2022-01-03 08:32:12', '2022-01-03 08:32:12'),
(58, '2021-10-01', 30, 20, '2022-01-03 08:34:01', '2022-01-03 08:34:01'),
(59, '2021-12-01', 50, 20, '2022-01-03 08:34:01', '2022-01-03 08:34:01'),
(60, '2022-01-01', 70, 20, '2022-01-03 08:34:01', '2022-01-03 08:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 19, 3, '2022-01-03 08:36:38', '2022-01-03 08:36:38'),
(2, 14, 3, '2022-01-03 08:36:51', '2022-01-03 08:36:51'),
(3, 14, 1, '2022-01-03 08:42:13', '2022-01-03 08:42:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2021_12_01_154717_create_categories_table', 1),
(11, '2021_12_02_190142_create_products_table', 1),
(12, '2021_12_26_202656_create_discounts_table', 1),
(13, '2022_01_02_222914_create_views_table', 1),
(14, '2022_01_02_232046_create_comments_table', 1),
(15, '2022_01_03_001808_create_likes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('5cbf0b769e4b4ea0dae6a9886a5a8288d11f4bf87a77d50ef588ae304ba19345b4190ee56f899fda', 2, '9544402c-bb7b-440a-b271-4887be6c56a6', 'LeaveMeAlone', '[]', 0, '2022-01-03 08:29:41', '2022-01-03 08:29:41', '2023-01-03 10:29:41'),
('657b8db487cae40dab7fbbdbf06e17c718ad7bdb38ab4134e29893e121e00ff82d583cd5f7d824a4', 3, '9544402c-bb7b-440a-b271-4887be6c56a6', 'LeaveMeAlone', '[]', 0, '2022-01-03 07:58:14', '2022-01-03 07:58:14', '2023-01-03 09:58:14'),
('6ecdd25e2cb5a392d9ef4e0ed6a011c8286ad181bcf4a37e8d7f8d599bfcee46de58328b449154f9', 1, '9544402c-bb7b-440a-b271-4887be6c56a6', 'LeaveMeAlone', '[]', 0, '2022-01-03 07:58:31', '2022-01-03 07:58:31', '2023-01-03 09:58:31'),
('80dd564e45bb7a1540ff61a83a45cfd9f41cfc02baab934efae258999822ff9f912b228f625353fb', 2, '9544402c-bb7b-440a-b271-4887be6c56a6', 'LeaveMeAlone', '[]', 0, '2022-01-03 07:57:43', '2022-01-03 07:57:43', '2023-01-03 09:57:43'),
('8d2376cf0b8d2521e1c88d2044e2af995dbe8e6808de6a9ff446b72536e36d41930433bae886798b', 3, '9544402c-bb7b-440a-b271-4887be6c56a6', 'LeaveMeAlone', '[]', 0, '2022-01-03 08:32:50', '2022-01-03 08:32:50', '2023-01-03 10:32:50'),
('e12ac120c527a6ac558f2eaed2af0c0bf3ce1cdcda2ca89e3fb0c5fa447484507d38ea95b51f5e55', 1, '9544402c-bb7b-440a-b271-4887be6c56a6', 'LeaveMeAlone', '[]', 0, '2022-01-03 07:56:38', '2022-01-03 07:56:38', '2023-01-03 09:56:38'),
('f20e5ec05b9090a4329771deb1845bb691e968f878744f1d4d22ef62e8f599a5d72d1c02daf6956f', 1, '9544402c-bb7b-440a-b271-4887be6c56a6', 'LeaveMeAlone', '[]', 0, '2022-01-03 08:41:57', '2022-01-03 08:41:57', '2023-01-03 10:41:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9544402c-bb7b-440a-b271-4887be6c56a6', NULL, 'Laravel Personal Access Client', 'O0xKJDuRLQW9agH5xB9b422n7EasrSDTAxOBOdJX', NULL, 'http://localhost', 1, 0, 0, '2022-01-03 07:54:30', '2022-01-03 07:54:30'),
('9544402d-06b9-440d-ac83-58b973836fd4', NULL, 'Laravel Password Grant Client', 'ttttDkRZTbdnatRIaWCNTRkW4hyeaAsv4htAIT8w', 'users', 'http://localhost', 0, 1, 0, '2022-01-03 07:54:30', '2022-01-03 07:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9544402c-bb7b-440a-b271-4887be6c56a6', '2022-01-03 07:54:30', '2022-01-03 07:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exp_date` date NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `current_price` int(11) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image_url`, `exp_date`, `category_id`, `user_id`, `quantity`, `current_price`, `price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(14, 'Banana', 'http://Store.test/storage/images/6n2cfhxkjJzKJKD3DER1jwD79wNdkv4nmHV3am7s.png', '2022-05-10', 1, 1, 450, 2100, 3000, NULL, '2022-01-03 08:26:19', '2022-01-03 08:26:19'),
(15, 'Apple', 'http://Store.test/storage/images/fyjEj6ddC9dSFkWjGm7QTyF7HNvTohiXM9UpTM63.png', '2022-02-10', 1, 1, 500, 450, 1500, NULL, '2022-01-03 08:27:20', '2022-01-03 08:27:20'),
(16, 'Strawberry', 'http://Store.test/storage/images/jlwAbcg8UFneT3cxItER8DSuZDhJXXhxXDkwzTSL.png', '2021-12-10', 1, 1, 450, 600, 2000, '2022-01-03 08:29:03', '2022-01-03 08:28:20', '2022-01-03 08:29:03'),
(17, 'Strawberry', 'http://Store.test/storage/images/84XiNGZLCd6vlWY9EB8ajjXep98JgWY9ym1K0Bsf.png', '2022-01-10', 1, 1, 450, 600, 2000, NULL, '2022-01-03 08:28:57', '2022-01-03 08:28:57'),
(18, 'Eyeliner', 'http://Store.test/storage/images/IThp3XoXzFK5fM3zW6ZtqYSTycvvkb77vXHyvOhz.png', '2022-03-10', 2, 2, 450, 600, 1200, NULL, '2022-01-03 08:31:26', '2022-01-03 08:31:26'),
(19, 'Eyeshadow', 'http://Store.test/storage/images/FoxPLxSqecT6xKJWTgrL85PHXhpquMldCwfRBlbh.png', '2022-03-10', 2, 2, 60, 480, 1600, NULL, '2022-01-03 08:32:12', '2022-01-03 08:32:12'),
(20, 'Broffeen', 'http://Store.test/storage/images/q2ZHN8SaZtL4MKkMW57zluCSGncJlUFBnpuiKPUv.png', '2022-03-10', 2, 3, 60, 105, 350, NULL, '2022-01-03 08:34:01', '2022-01-03 08:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_img_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile_img_url`, `phone`, `facebook_url`, `whatsapp_url`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ali', 'ali@gmail.com', NULL, '$2y$10$V2i.hQGXFt8kXaBmQjrP/.QlybM4YdbvzYCNfrMYVFg.CwnMA6XTC', 'http://Store.test/storage/images/0z7bJ4NckQiRBCQxd1ghqqyYJKRycxvvP64Z0jwL.png', '093455342', 'http:\\\\ali\\\\facbook.com', '+96393455342', NULL, '2022-01-03 07:56:38', '2022-01-03 07:56:38'),
(2, 'Naser', 'naser@gmail.com', NULL, '$2y$10$TJAwMUZ69e2mF/G7/iZAMeDG3LLvpEBJsGq8z910etWCBOODPYfYm', 'http://Store.test/storage/images/aWbCsqpO7JiqgEOu4FLueeDnruSBu9Vl0lvAMLvj.png', '093455342', 'http://naser//facebooke.com', '+96393455342', NULL, '2022-01-03 07:57:43', '2022-01-03 07:57:43'),
(3, 'Mohammed', 'mohammed@gmail.com', NULL, '$2y$10$23Mc7I1v.Z60kXAbF4bCBOdc/keP7CfBaQ9btxofiDEkTXSVYwLFC', 'http://Store.test/storage/images/uBVHpHaqNtbYd9gxSBZtOF561SQDKop8K10GIOmo.png', '093455342', 'http://mohammed//facebooke.com', '+96393455342', NULL, '2022-01-03 07:58:14', '2022-01-03 07:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 14, 3, '2022-01-03 08:36:18', '2022-01-03 08:36:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_product_id_foreign` (`product_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_product_id_foreign` (`product_id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views_product_id_foreign` (`product_id`),
  ADD KEY `views_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
