-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 15, 2018 at 06:00 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravelvue`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_13_071857_add_membertype_to_users', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membertype` enum('admin','user','coordinator') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `membertype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test1', 'peter@peter.com', '$2y$10$Kok9TL79xMqDr3oOkZROj.Oz0fcoTI/ozrob4mKwdYvqxXGLI4GHG', 'admin', NULL, '2018-02-12 02:25:22', '2018-02-12 02:25:22'),
(2, 'bedros2', 'peter2@peter.com', '$2y$10$4N8fyTEKBmLlpp2bLbpbF.u113W1vRY/5tBgJJiIcusiqFCnQjP4W', 'admin', NULL, '2018-02-12 02:29:41', '2018-02-12 02:29:41'),
(3, 'jhjjhg', 'hgh@wer.ll', '$2y$10$nxpoyMDnSzHHayjdLkrVwOn4XMEfOG0NC0SgtY1rfo48IGVoPqnIS', 'admin', NULL, '2018-02-12 02:49:47', '2018-02-12 02:49:47'),
(4, 'reerwer', 'erre@wer.lggfd', '$2y$10$.hzAF.vZTro5WhXtkOf2deHA5vk0f/mOoEn.7kJA48iQGr11HD3uK', 'admin', NULL, '2018-02-12 03:04:57', '2018-02-12 03:04:57'),
(5, '87876', '1@1.com', '$2y$10$79byDHILqLZDESpCDANS2uahL3b7.7uTdnHm965V8Ki39YfQ8INTG', 'admin', NULL, '2018-02-12 06:17:47', '2018-02-12 06:17:47'),
(24, 'user1', 'user@user.com', '$2y$10$1OtQxNTk.fddGDTVLJ7fLOrlwtD4.WP8NTIy5jwDNp8FdknHu6ZEi', 'user', NULL, '2018-02-13 05:13:31', '2018-02-13 05:13:31'),
(25, 'user2', 'user2@user.com', '$2y$10$djtnDWGefX9jkSIAYvMt3.jJfXp7De7sJ7LHHXVrmHxS3bSdFLWlq', 'user', NULL, '2018-02-13 05:16:10', '2018-02-13 05:16:10'),
(26, 'admin1', 'admin@admin.com', '$2y$10$DTTJXXHz8fb0SkG.2m0pDeO7v1hwVE2bNJL9xFqikoSTBZ5TwW9bq', 'admin', NULL, '2018-02-13 05:16:33', '2018-02-13 05:16:33'),
(27, 'coord1', 'cord@cord.com', '$2y$10$cTWFtX/wdGhsq4tnEufbb.5N3epN3W4FTnxaA87zIO/s0OzsKLFQO', 'coordinator', NULL, '2018-02-13 05:17:00', '2018-02-13 05:17:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
