-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 20, 2021 at 12:56 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mide`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_site`
--

CREATE TABLE `about_site` (
  `id` int(1) NOT NULL,
  `about` text DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `privacy_policy` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about_site`
--

INSERT INTO `about_site` (`id`, `about`, `terms`, `privacy_policy`, `created_at`, `updated_at`) VALUES
(1, '<p style=\"text-align: justify;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p style=\"text-align: justify;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humours.</p>', '<p style=\"text-align: justify;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p style=\"text-align: justify;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humours.</p>', '<p style=\"text-align: justify;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p style=\"text-align: justify;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humours.</p>', '2020-02-09 08:42:14', '2020-02-09 07:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$XH3iJ2/4W6l0342WIW0hheV6N635XmpGGbOx3dofQsq0TSgNtdKYO', '', '2020-02-13 14:03:56', '2020-02-13 13:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `admin_bank`
--

CREATE TABLE `admin_bank` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bank_name` varchar(128) NOT NULL,
  `address` text NOT NULL,
  `swift` varchar(32) NOT NULL,
  `iban` varchar(32) NOT NULL,
  `acct_no` varchar(15) NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_bank`
--

INSERT INTO `admin_bank` (`id`, `name`, `bank_name`, `address`, `swift`, `iban`, `acct_no`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Boomchart', 'Citi bank', 'Somewhere in uk', '5444', '5678876', '12345678982', 1, '2020-02-10 15:14:07', '2020-02-10 14:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `amount` double NOT NULL,
  `details` text NOT NULL,
  `type` int(2) NOT NULL,
  `seen` int(2) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `reference` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`id`, `user_id`, `amount`, `details`, `type`, `seen`, `status`, `reference`, `created_at`, `updated_at`) VALUES
(10, 26, 100, 'Acct:2590216976, Date:2020-02-01 12:15:56, CR Amt:100,\n                             Bal:202, Ref:1580559356, Desc: Bank transfer', 2, 0, 1, '1580559356', '2020-02-01 11:15:56', '2020-02-01 11:15:56'),
(11, 11, 105, 'Acct:2134742865, Date:2020-02-01 12:15:56, DR Amt:100,\n                             Bal:27493, Ref:1580559356, Desc: Bank transfer', 1, 1, 1, '1580559356', '2020-02-01 12:24:40', '2020-02-01 11:24:40'),
(12, 11, 1035, 'Acct:2134742865, Date:2020-02-02 08:05:23, DR Amt:1000,\n                            Bal:24493, Ref:1580630723, Desc: Bank transfer', 1, 1, 1, '1580630723', '2020-02-15 16:36:48', '2020-02-15 15:36:48'),
(13, 11, 299, 'Acct:2134742865, Date:2020-02-14 13:34:05, CR Amt:299,\n        Bal:21450, Ref:1581687245, Desc:fvdffd', 2, 1, 1, '1581687245', '2020-02-15 16:36:48', '2020-02-15 15:36:48'),
(14, 11, 299, 'Acct:2134742865, Date:2020-02-14 13:34:41, CR Amt:299,\n        Bal:21749, Ref:1581687281, Desc:fvdffd', 2, 1, 1, '1581687281', '2020-02-15 16:36:48', '2020-02-15 15:36:48'),
(15, 11, 299, 'Acct:2134742865, Date:2020-02-14 13:35:26, CR Amt:299,\n        Bal:22048, Ref:1581687327, Desc:fvdffd', 2, 1, 1, '1581687327', '2020-02-15 16:36:48', '2020-02-15 15:36:48'),
(16, 11, 557, 'Acct:2134742865, Date:2020-02-14 13:41:04, CR Amt:557,\n        Bal:21491, Ref:1581687665, Desc:jhsxsvhvk', 1, 1, 1, '1581687665', '2020-02-15 16:36:48', '2020-02-15 15:36:48'),
(17, 11, 1000, 'Acct:2134742865, Date:2020-02-18 10:19:26, CR Amt:1000,\n        Bal:22391, Ref:1582021167, Desc:weg', 2, 0, 1, '1582021167', '2020-02-18 09:19:26', '2020-02-18 09:19:26'),
(18, 17, 1000, 'Acct:2124747687, Date:2020-03-30 10:51:42, CR Amt:1000,\n        Bal:150883, Ref:eNYAeaBUhd, Desc: Bank transfer', 2, 0, 1, 'eNYAeaBUhd', '2020-03-30 09:51:42', '2020-03-30 09:51:42'),
(19, 11, 1050, 'Acct:2134742865, Date:2020-03-30 10:51:42, DR Amt:1000,\n        Bal:17011, Ref:eNYAeaBUhd, Desc: Bank transfer', 1, 0, 1, 'eNYAeaBUhd', '2020-03-30 09:51:42', '2020-03-30 09:51:42'),
(20, 11, 2347.4, 'Acct:2134742865, Date:2020-04-23 08:16:32, DR Amt:2134,\n                            Bal:60517.123160763, Ref:1587629792, Desc: Bank transfer', 1, 0, 0, '1587629792', '2020-04-23 07:16:32', '2020-04-23 07:16:32'),
(21, 27, 22, 'Acct:2740860446, Date:2020-04-23 09:00:13, CR Amt:22,\n        Bal:-51976, Ref:sdUA786O7Q, Desc: Bank transfer', 2, 0, 1, 'sdUA786O7Q', '2020-04-23 08:00:13', '2020-04-23 08:00:13'),
(22, 11, 23.1, 'Acct:2134742865, Date:2020-04-23 09:00:13, DR Amt:22,\n        Bal:60494.023160763, Ref:sdUA786O7Q, Desc: Bank transfer', 1, 0, 1, 'sdUA786O7Q', '2020-04-23 08:00:13', '2020-04-23 08:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `payout` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `user_id`, `plan_id`, `amount`, `payout`, `created_at`, `updated_at`) VALUES
(1, 11, 6, '959.0946033960274', '', '2020-03-30 12:48:08', '2020-03-30 11:48:08'),
(2, 11, 7, '3547.714118752434', '', '2020-03-30 13:33:17', '2020-03-30 12:33:17'),
(3, 11, 10, '132336.3097641633', '', '2020-03-30 13:31:48', '2020-03-30 12:31:48'),
(4, 21, 7, '314.3912', '', '2020-03-02 16:10:03', '0000-00-00 00:00:00'),
(5, 21, 6, '0.965739152', '', '2020-03-02 16:10:03', '0000-00-00 00:00:00'),
(6, 21, 10, '2010.1933559322', '', '2020-03-02 16:10:03', '0000-00-00 00:00:00'),
(7, 11, 11, '906.274713447003', '', '2020-03-30 12:49:23', '2020-03-30 11:49:23'),
(8, 17, 10, '100', NULL, '2020-03-06 06:09:34', '2020-03-06 06:09:34'),
(9, 11, 12, '49843', NULL, '2020-03-30 14:08:38', '2020-03-30 13:08:38'),
(10, 17, 12, '10000', NULL, '2020-03-30 13:08:38', '2020-03-30 13:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `asset_transfer`
--

CREATE TABLE `asset_transfer` (
  `id` int(32) NOT NULL,
  `ref_id` varchar(32) NOT NULL,
  `amount` varchar(32) NOT NULL,
  `sender_id` int(32) NOT NULL,
  `receiver_id` int(32) NOT NULL,
  `asset` int(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asset_transfer`
--

INSERT INTO `asset_transfer` (`id`, `ref_id`, `amount`, `sender_id`, `receiver_id`, `asset`, `created_at`, `updated_at`) VALUES
(30, 'cu1hMInWiUNc12Bn', '100', 11, 17, 10, '2020-03-06 06:06:40', '2020-03-06 06:06:40'),
(31, 'f1t9Nl5gFFYI8JY1', '100', 11, 17, 10, '2020-03-06 06:09:34', '2020-03-06 06:09:34'),
(32, 'EgR11XhWDJtVCi4l', '10000', 11, 17, 12, '2020-03-30 13:08:38', '2020-03-30 13:08:38');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `iban` varchar(32) DEFAULT NULL,
  `swift` varchar(32) DEFAULT NULL,
  `acct_no` varchar(32) DEFAULT NULL,
  `acct_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `user_id`, `name`, `address`, `iban`, `swift`, `acct_no`, `acct_name`, `created_at`, `updated_at`) VALUES
(2, 11, 'UBA', 'No. 7 Sekupang Batam, No. 7 Sekupang Batam', 'Bdbdnndjd', 'SDEGHT', '43567890475', 'Boomchart', '2020-02-01 00:11:13', '2020-01-31 23:11:13');

-- --------------------------------------------------------

--
-- Table structure for table `bank_transfer`
--

CREATE TABLE `bank_transfer` (
  `id` int(11) NOT NULL,
  `user_id` int(32) NOT NULL,
  `amount` int(32) NOT NULL,
  `details` text NOT NULL,
  `image` varchar(32) NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank_transfer`
--

INSERT INTO `bank_transfer` (`id`, `user_id`, `amount`, `details`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 50, 'sfgfff', '1569010693.png', 1, '2020-01-29 08:12:36', '0000-00-00 00:00:00'),
(3, 11, 50, 'kbkjb', '1572108075.jpg', 1, '2020-01-29 08:12:36', '0000-00-00 00:00:00'),
(4, 11, 200, 'kldfnkdnk', '1572109546.jpg', 1, '2020-01-29 08:12:36', '0000-00-00 00:00:00'),
(6, 11, 2000, 'ldkdld', '1572109768.jpg', 1, '2020-01-29 08:12:36', '0000-00-00 00:00:00'),
(7, 11, 50, 'lfvknfk', '1576804990.png', 2, '2020-02-15 08:12:47', '2020-02-15 07:12:47'),
(8, 11, 1000, 'dddd', '1580298376_user.jpg', 2, '2020-02-15 08:12:22', '2020-02-15 07:12:22'),
(9, 11, 2, 'gfhgjhfg', '1581811325_user.jpg', 0, '2020-02-15 23:02:05', '2020-02-15 23:02:05'),
(10, 11, 2, 'gfhgjhfg', '1581811421_user.jpg', 0, '2020-02-15 23:03:41', '2020-02-15 23:03:41'),
(11, 11, 100, 'qwef', '1587631821_user.jpg', 0, '2020-04-23 07:50:21', '2020-04-23 07:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+',
  `network` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountname` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountnumber` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(88) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newbalance` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `user_id`, `amount`, `type`, `network`, `phone`, `plan`, `trx`, `status`, `charge`, `accountname`, `accountnumber`, `gateway`, `method`, `details`, `ref`, `pin`, `serial`, `unit`, `remark`, `newbalance`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 61, '100', '1', 'mtn', '08031975397', NULL, 'M0RRY4Z1CF8DA2C8PZKG', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recharge was successful', NULL, NULL, '2021-02-13 19:28:20', '2021-02-13 19:28:20'),
(2, 61, '160', '1', 'glo', '08031975397', NULL, 'IIR0XW50KBQHMXZFIDTR', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recharge was successful', NULL, NULL, '2021-02-13 19:29:46', '2021-02-13 19:29:46'),
(3, 61, '100', '1', 'mtn', '08031975397', NULL, 'OMUPULCR0SIIPLQ7OYFZ', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Recharge was successful', NULL, NULL, '2021-02-17 08:13:17', '2021-02-17 08:13:17'),
(4, 61, '0', '2', 'GLO', '08031975397', 'GLO 1050 MB Data', 'ORADXSTARNXH0Y0M90QE', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Internet data subscription was successful', NULL, NULL, '2021-02-17 10:16:06', '2021-02-17 10:16:06'),
(5, 61, '0', '2', 'GLO', '08031975397', 'GLO 1050 MB Data', 'REFCPZWPBFALEWCZGTOA', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Internet data subscription was successful', NULL, NULL, '2021-02-17 10:16:53', '2021-02-17 10:16:53'),
(6, 61, '2460.00', '3', 'gotv', '2022434084', 'gotv-jolli', 'WBP7LZZTXWPRAPYZIQR4', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TV Subscription was successful on gotv gotv-jolli bouquet', NULL, NULL, '2021-02-17 12:33:36', '2021-02-17 12:33:36'),
(7, 61, '2460.00', '3', 'gotv', '2022434084', 'gotv-jolli', 'XRVETF6RFLAC96EDQ2V8', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TV Subscription was successful on gotv gotv-jolli bouquet', NULL, NULL, '2021-02-17 12:34:17', '2021-02-17 12:34:17'),
(8, 61, '1470', '4', 'Eko Electric', '202010310011859934', NULL, 'YTFFIE', '1', NULL, NULL, 'Eko Electricity is currently offline. Kindly try again in a moment.', NULL, NULL, NULL, 'YTFFIE', 'YTFFIE', 'YTFFIE', '1', 'Utility bill was paid successfully', NULL, NULL, '2021-02-17 14:12:30', '2021-02-17 14:12:30'),
(9, 31, '800.00', '3', 'gotv', '2022434084', 'gotv-smallie', 'E5QHDERRJACLT8Q0EVJ5', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TV Subscription was successful on gotv gotv-smallie bouquet', NULL, NULL, '2021-02-20 10:20:09', '2021-02-20 10:20:09'),
(10, 31, '500', '4', 'Ikeja Electric ', '45040117777', NULL, 'FQDD9A', '1', NULL, NULL, 'JOSEPH MONDAY AKANJI', NULL, NULL, NULL, 'FQDD9A', '0', '0', '1', 'Utility bill was paid successfully', NULL, NULL, '2021-02-20 10:54:43', '2021-02-20 10:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(32) NOT NULL,
  `name` text NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `mobile` varchar(32) NOT NULL,
  `zip_code` int(32) NOT NULL,
  `postal_code` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `country`, `state`, `mobile`, `zip_code`, `postal_code`, `address`, `created_at`, `updated_at`) VALUES
(3, 'Histol', 'Indonesia', 'Georgia', '43567865433567', 4365443, '3454447567', 'Hell', '2020-02-09 09:38:48', '2020-02-09 08:38:48'),
(4, 'Bilson', 'Antigua & Barbuda', 'Georgia', '13245678786', 300216, '2423', 'Sekupang Batamg', '2020-01-27 19:49:41', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(32) NOT NULL,
  `image` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` int(2) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `image`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'brand_1586430014.png', 'Capterra', 1, '2020-04-09 11:00:14', '2020-04-09 10:00:14'),
(2, 'brand_1586429998.png', 'crowd', 1, '2020-04-09 10:59:58', '2020-04-09 09:59:58'),
(3, 'brand_1586448957.png', 'Getapp', 1, '2020-04-09 16:15:57', '2020-04-09 15:15:57'),
(4, 'brand_1586429971.png', 'softwareadvice', 1, '2020-04-09 10:59:31', '2020-04-09 09:59:31'),
(5, 'brand_1586429806.png', 'trustpilot', 1, '2020-04-09 10:56:46', '2020-04-09 09:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `buyer_log`
--

CREATE TABLE `buyer_log` (
  `id` int(32) NOT NULL,
  `reference` varchar(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `plan_id` int(32) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `charge` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyer_log`
--

INSERT INTO `buyer_log` (`id`, `reference`, `user_id`, `plan_id`, `amount`, `charge`, `created_at`, `updated_at`) VALUES
(30, 'K8XRprh5ppiFMvV4', 11, 6, '7.68', '0.32', '2020-03-30 11:48:08', '2020-03-30 11:48:08'),
(31, 'RpnNUqQnhrSlZkzt', 11, 12, '71198', '2202', '2020-03-30 11:48:55', '2020-03-30 11:48:55'),
(32, '65xbtatlMFGmlO3M', 11, 10, '1530', '63.75', '2020-03-30 11:49:08', '2020-03-30 11:49:08'),
(33, 'RuUFYDhufFGcWABO', 11, 11, '222.1632', '9.2568', '2020-03-30 11:49:23', '2020-03-30 11:49:23'),
(34, 'YjLXPKGkzkXrBxlJ', 11, 12, '177995', '5505', '2020-03-30 12:15:11', '2020-03-30 12:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `chart`
--

CREATE TABLE `chart` (
  `id` int(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `balance` varchar(32) DEFAULT NULL,
  `exchange_charge` varchar(32) DEFAULT NULL,
  `buying_charge` varchar(32) DEFAULT NULL,
  `selling_charge` varchar(32) DEFAULT NULL,
  `ref_percent` double DEFAULT NULL,
  `coin` int(2) NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chart`
--

INSERT INTO `chart` (`id`, `name`, `symbol`, `price`, `balance`, `exchange_charge`, `buying_charge`, `selling_charge`, `ref_percent`, `coin`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Gold', 'XAG', '0.065327', '1836.3075', '6', '4', '2', 2, 1, 1, '2020-04-23 14:01:01', '2020-04-23 13:01:01'),
(7, 'Brazilian Real', 'BRL', '5.461698', '2487.48', '6', '4', '2', 0, 0, 1, '2020-04-23 14:01:03', '2020-04-23 13:01:03'),
(10, 'Argentine Peso', 'ARS', '66.31557', '69548.80000000002', '6', '4', '2', 0, 0, 1, '2020-04-23 14:01:05', '2020-04-23 13:01:05'),
(11, 'Euro', 'GBP', '0.810425', '18952.236800000002', '6', '4', '2', 0, 0, 1, '2020-04-23 14:01:07', '2020-04-23 13:01:07'),
(12, 'Naira', 'NGN', '389.999798', '11807', '4', '3', '5', 2, 0, 1, '2020-04-23 14:01:09', '2020-04-23 13:01:09');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `seen` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `full_name`, `mobile`, `email`, `message`, `seen`, `created_at`, `updated_at`) VALUES
(3, 'Castro Marvel', '+2349072963268', 'castrowebfirm@gmail.com', 'jbhbh', 0, '2020-01-31 16:21:57', '0000-00-00 00:00:00'),
(4, 'Castro Marvel', '+2349072963268', 'castrowebfirm@gmail.com', 'hkvvh', 0, '2020-01-31 16:21:57', '0000-00-00 00:00:00'),
(5, 'Castro Marvel', '+2349072963268', 'castrowebfirm@gmail.com', 'jjggggg', 0, '2020-01-31 16:21:57', '0000-00-00 00:00:00'),
(7, 'ddd', '22345678987654', 'i@c.com', 'arty', 0, '2020-02-24 19:03:32', '2020-02-24 19:03:32');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `country`, `currency`, `name`, `symbol`, `rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(2, 'America', 'Dollars', 'USD', '$', 1, 1, '2020-04-23 14:05:15', '2020-04-23 13:05:15'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(4, 'Argentina', 'Pesos', 'ARS', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(6, 'Australia', 'Dollars', 'AUD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(7, 'Azerbaijan', 'New Manats', 'AZN', 'ман', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(8, 'Bahamas', 'Dollars', 'BSD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(9, 'Barbados', 'Dollars', 'BBD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(11, 'Belgium', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(13, 'Bermuda', 'Dollars', 'BMD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(16, 'Botswana', 'Pula', 'BWP', 'P', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(17, 'Bulgaria', 'Leva', 'BGN', 'лв', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(18, 'Brazil', 'Reais', 'BRL', 'R$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(21, 'Cambodia', 'Riels', 'KHR', '៛', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(22, 'Canada', 'Dollars', 'CAD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(24, 'Chile', 'Pesos', 'CLP', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(26, 'Colombia', 'Pesos', 'COP', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(29, 'Cuba', 'Pesos', 'CUP', '₱', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(30, 'Cyprus', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(35, 'Egypt', 'Pounds', 'EGP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(36, 'El Salvador', 'Colones', 'SVC', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(38, 'Euro', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(40, 'Fiji', 'Dollars', 'FJD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(41, 'France', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(42, 'Ghana', 'Cedis', 'GHC', '¢', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(44, 'Greece', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(46, 'Guernsey', 'Pounds', 'GGP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(47, 'Guyana', 'Dollars', 'GYD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(53, 'India', 'Rupees', 'INR', 'Rp', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(55, 'Iran', 'Rials', 'IRR', '﷼', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(56, 'Ireland', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(58, 'Israel', 'New Shekels', 'ILS', '₪', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(59, 'Italy', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(61, 'Japan', 'Yen', 'JPY', '¥', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(62, 'Jersey', 'Pounds', 'JEP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(64, 'Korea (North)', 'Won', 'KPW', '₩', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(65, 'Korea (South)', 'Won', 'KRW', '₩', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(67, 'Laos', 'Kips', 'LAK', '₭', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(69, 'Lebanon', 'Pounds', 'LBP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(70, 'Liberia', 'Dollars', 'LRD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(73, 'Luxembourg', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(76, 'Malta', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(78, 'Mexico', 'Pesos', 'MXN', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(80, 'Mozambique', 'Meticais', 'MZN', 'MT', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(81, 'Namibia', 'Dollars', 'NAD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(82, 'Nepal', 'Rupees', 'NPR', '₨', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(84, 'Netherlands', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(85, 'New Zealand', 'Dollars', 'NZD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', 390, 0, '2020-04-23 14:05:15', '2020-04-23 13:05:15'),
(88, 'North Korea', 'Won', 'KPW', '₩', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(89, 'Norway', 'Krone', 'NOK', 'kr', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(90, 'Oman', 'Rials', 'OMR', '﷼', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(96, 'Poland', 'Zlotych', 'PLN', 'zł', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(97, 'Qatar', 'Rials', 'QAR', '﷼', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(98, 'Romania', 'New Lei', 'RON', 'lei', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(99, 'Russia', 'Rubles', 'RUB', 'руб', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(104, 'Singapore', 'Dollars', 'SGD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(105, 'Slovenia', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(107, 'Somalia', 'Shillings', 'SOS', 'S', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(108, 'South Africa', 'Rand', 'ZAR', 'R', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(109, 'South Korea', 'Won', 'KRW', '₩', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(110, 'Spain', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(114, 'Suriname', 'Dollars', 'SRD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(115, 'Syria', 'Pounds', 'SYP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(117, 'Thailand', 'Baht', 'THB', '฿', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(119, 'Turkey', 'Lira', 'TRY', 'TL', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(120, 'Turkey', 'Liras', 'TRL', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(124, 'United States of America', 'Dollars', 'USD', '$', NULL, 0, '2020-04-23 14:02:54', '2020-04-23 13:02:54'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(127, 'Vatican City', 'Euro', 'EUR', '€', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(129, 'Vietnam', 'Dong', 'VND', '₫', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(130, 'Yemen', 'Rials', 'YER', '﷼', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00'),
(132, 'India', 'Rupees', 'INR', '₹', NULL, 0, '2020-03-31 08:28:57', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `amount` varchar(191) NOT NULL,
  `payment_id` varchar(32) NOT NULL,
  `date` varchar(32) NOT NULL,
  `status` int(2) NOT NULL,
  `token` int(11) NOT NULL,
  `trans_id` text NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `user_id`, `amount`, `payment_id`, `date`, `status`, `token`, `trans_id`, `details`) VALUES
(29, 11, '100', '2', '2019-08-16 13:27:35', 0, 242331, '', ''),
(30, 11, '1000000', '2', '2019-08-29 05:18:12', 0, 1567048693, 'zMwZ8WWAasBqbeu7hmMK', 'Paid'),
(31, 11, '0', 'Bitcoin', '2019-09-06 17:55:51', 0, 1567785352, 'xpAGtoelWiDdPVgiBMGr', 'Domain purchase');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gateway_id` int(11) DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `try` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `gateway_id`, `amount`, `charge`, `usd`, `btc_amo`, `btc_wallet`, `trx`, `status`, `try`, `created_at`, `updated_at`) VALUES
(87, 11, 105, '100', '6', '1.33', '0', '', '1572789068', 0, 0, '2019-11-03 13:51:08', '2019-11-03 13:51:08'),
(88, 11, 103, '20', '2.2', '0.28', '0', '', '1573393209', 0, 0, '2019-11-10 13:40:09', '2019-11-10 13:40:09'),
(89, 11, 103, '200', '4', '2.55', '0', '', '1573394937', 0, 0, '2019-11-10 14:08:56', '2019-11-10 14:08:56'),
(90, 11, 101, '100', '3.031', '1.29', '0', '', '1574860698', 0, 0, '2019-11-27 13:18:17', '2019-11-27 13:18:17'),
(91, 11, 101, '100', '3.031', '1.29', '0', '', '1580304951', 0, 0, '2020-01-29 13:35:50', '2020-01-29 13:35:50'),
(92, 11, 501, '100', '1.5', '1.27', '0', '', 'MMmlllzaEM0Zroui', 0, 0, '2020-01-29 12:52:09', '2020-01-29 12:52:09'),
(93, 11, 501, '100', '1.5', '1.27', '0', '', 'OeB5oJDkC7JnxQFT', 0, 0, '2020-01-29 12:57:31', '2020-01-29 12:57:31'),
(94, 11, 501, '100', '1.5', '1.27', '0', '', 'Jr1lsNOGglwXinsp', 0, 0, '2020-01-29 13:03:27', '2020-01-29 13:03:27'),
(95, 11, 106, '1000', '33', '12.91', '0', '', 'kKGW1iqRTmTWHllp', 0, 0, '2020-01-29 13:04:47', '2020-01-29 13:04:47'),
(96, 11, 501, '2', '1.01', '0.04', '0', '', '8sS6DIORc1Z8kjZe', 0, 0, '2020-01-29 13:19:27', '2020-01-29 13:19:27'),
(97, 11, 501, '2', '1.01', '0.04', '0', '', 'BCD7rw5KOp2VTKZe', 0, 0, '2020-01-29 13:22:06', '2020-01-29 13:22:06'),
(98, 11, 106, '100', '6', '1.33', '0', '', 'e8gJKDqMU0zalZDC', 0, 0, '2020-01-29 13:30:40', '2020-01-29 13:30:40'),
(99, 11, 106, '100', '6', '1.33', '0', '', 'rhhWwMm8wQH09I6f', 0, 0, '2020-01-29 13:31:58', '2020-01-29 13:31:58'),
(100, 11, 501, '100', '1.5', '1.27', '0', '', 'UoSJbDqIQpPp1p9P', 0, 0, '2020-01-29 13:38:25', '2020-01-29 13:38:25'),
(101, 11, 501, '100', '1.5', '1.27', '0', '', 'zLXt2jBIwrcQkG3a', 0, 0, '2020-01-29 13:40:04', '2020-01-29 13:40:04'),
(102, 11, 501, '100', '1.5', '1.27', '0', '', '624aCkdsIg1k9bEs', 0, 0, '2020-01-29 13:49:45', '2020-01-29 13:49:45'),
(103, 11, 501, '100', '1.5', '1.27', '0', '', '3ej4ZxGmsHaVj6Ge', 0, 0, '2020-01-29 13:53:25', '2020-01-29 13:53:25'),
(104, 11, 501, '100', '1.5', '1.27', '0', '', 'Z1aiC8yVIHJ0SXbT', 0, 0, '2020-01-29 13:53:34', '2020-01-29 13:53:34'),
(105, 11, 501, '100', '1.5', '1.27', '0', '', 'EhfGNDh7ZTU6pn6A', 0, 0, '2020-01-29 13:55:14', '2020-01-29 13:55:14'),
(106, 11, 501, '100', '1.5', '1.27', '0', '', 'Mcek5x1qLHF7Ykkv', 0, 0, '2020-01-29 13:56:31', '2020-01-29 13:56:31'),
(107, 11, 501, '100', '1.5', '1.27', '0', '', 'v6TaMy0f8rTY0w9J', 0, 0, '2020-01-29 13:58:30', '2020-01-29 13:58:30'),
(108, 11, 501, '100', '1.5', '1.27', '0', '', 'VBF48U3g46gVCM7G', 0, 0, '2020-01-29 13:59:57', '2020-01-29 13:59:57'),
(109, 11, 501, '100', '1.5', '1.27', '0', '', 'J4iJuUjqZ3gJUz6m', 0, 0, '2020-01-29 14:00:07', '2020-01-29 14:00:07'),
(110, 11, 501, '100', '1.5', '1.27', '0', '', 'UYlQptUdmFQbrzcc', 0, 0, '2020-01-29 14:01:19', '2020-01-29 14:01:19'),
(111, 11, 501, '100', '1.5', '1.27', '0', '', 'HnThOEeMzbfd7cio', 0, 0, '2020-01-29 14:03:41', '2020-01-29 14:03:41'),
(112, 11, 501, '100', '1.5', '1.27', '0', '', 'zYQ1DlZu9tdAPuVF', 0, 0, '2020-01-29 14:13:53', '2020-01-29 14:13:53'),
(113, 11, 501, '100', '1.5', '1.27', '0', '', '7vUqnlPZGtbBxYyb', 0, 0, '2020-01-29 14:14:07', '2020-01-29 14:14:07'),
(114, 11, 106, '100', '6', '1.33', '0', '', 'V6r9RQl2RiFgqc6w', 0, 0, '2020-01-29 15:42:07', '2020-01-29 15:42:07'),
(115, 11, 101, '1000', '25.711', '12.82', '0', '', 'vVNTpGpViBrRAg0v', 0, 0, '2020-01-29 19:06:04', '2020-01-29 19:06:04'),
(116, 11, 102, '1000', '12', '12.65', '0', '', 'OMtvfHDow1D9upNk', 0, 0, '2020-01-29 19:08:38', '2020-01-29 19:08:38'),
(117, 11, 104, '1000', '33', '12.91', '0', '', 'eJManq6d5TtLyABM', 0, 0, '2020-01-29 19:08:59', '2020-01-29 19:08:59'),
(118, 11, 101, '20', '1.0150000000000001', '0.26', '0', '', 'xKGXX0DY5njXIU20', 0, 0, '2020-01-29 19:09:24', '2020-01-29 19:09:24'),
(119, 11, 102, '20', '2.2', '0.28', '0', '', 'Xl4syFgz1TUTtedk', 0, 0, '2020-01-29 19:12:47', '2020-01-29 19:12:47'),
(120, 11, 104, '20', '3.6', '0.3', '0', '', 'QoLddZ7HuqaR16xT', 0, 0, '2020-01-29 19:13:28', '2020-01-29 19:13:28'),
(121, 11, 101, '20', '1.0150000000000001', '0.26', '0', '', 'TnDCcNbulCgYlRMb', 0, 0, '2020-01-29 19:13:57', '2020-01-29 19:13:57'),
(122, 11, 104, '20', '3.6', '0.3', '0', '', 'wi5bhUTZqXFpAiH8', 0, 0, '2020-01-29 19:19:57', '2020-01-29 19:19:57'),
(123, 11, 102, '20', '2.2', '0.28', '0', '', 'oGo3jZ0cM3JeKbrg', 0, 0, '2020-01-29 19:20:25', '2020-01-29 19:20:25'),
(124, 11, 505, '1000', '25.71', '12.82', '0.00136791', '3PXYwHBqHr455qDctGx4RKcrfiamsP1Fnn', 'DKe96L6fNiGwsNBC', 0, 0, '2020-01-29 19:21:51', '2020-01-29 19:24:43'),
(125, 11, 501, '1000', '6', '12.58', '0', '', 'PTeQkdZlDpCEZ0rg', 0, 0, '2020-01-29 19:31:01', '2020-01-29 19:31:01'),
(126, 11, 108, '40', '4.2', '0.55', '0', '', 'C7cPwWKO3UdeQ3rC', 2, 0, '2020-01-29 19:54:41', '2020-02-15 07:04:18'),
(127, 11, 108, '1000', '33', '12.91', '0', '', '1580332281', 0, 0, '2020-01-29 21:11:21', '2020-01-29 21:11:21'),
(128, 11, 107, '1000', '33', '12.91', '0', '', 'hRR8tmMGuPOvdtJ2', 1, 0, '2020-01-29 20:15:24', '2020-02-15 06:56:06'),
(129, 11, 106, '1000', '33', '12.91', '0', '', 'uFbRVcA4zqHsJ9bv', 0, 0, '2020-01-29 20:23:00', '2020-01-29 20:23:00'),
(130, 11, 103, '20', '2.2', '0.28', '0', '', '60sdY8Btx03Qae5x', 0, 0, '2020-01-30 06:36:42', '2020-01-30 06:36:42'),
(132, 11, 103, '100', '3', '1.29', '0', '', 'a2hRUbCb6W9K2mEX', 0, 0, '2020-02-15 13:49:01', '2020-02-15 13:49:01'),
(133, 11, 107, '1000', '33', '12.91', '0', '', 'zImE6H5GHjchywA3', 0, 0, '2020-02-15 13:58:31', '2020-02-15 13:58:31'),
(134, 11, 103, '100', '3', '1.29', '0', '', 'PQuYYWeHMgZUfLN5', 0, 0, '2020-02-15 13:58:41', '2020-02-15 13:58:41'),
(135, 11, 103, '1000', '12', '12.65', '0', '', 'fQhhtbFctYKvfN57', 0, 0, '2020-02-15 22:15:31', '2020-02-15 22:15:31'),
(136, 11, 103, '200', '4', '2.55', '0', '', 'nLI3n7GOsZouZIJX', 0, 0, '2020-02-18 09:17:16', '2020-02-18 09:17:16'),
(137, 11, 501, '100', '1.5', '1.27', '0', '', 'tpp4KgBIkWsV9WPQ', 0, 0, '2020-03-30 07:28:39', '2020-03-30 07:28:39'),
(138, 11, 505, '100', '3.0300000000000002', '1.29', '0.00021000', '359mNnHf2DyYEUf6wCX5yPZVcUnuUbsUfi', 'Vbg6ipSxHXUW2Ple', 0, 0, '2020-03-30 07:35:12', '2020-03-30 07:35:21'),
(139, 11, 103, '100', '3', '1.29', '0', '', 'U62a2YpaB1mlYuMP', 0, 0, '2020-03-30 07:42:51', '2020-03-30 07:42:51'),
(140, 11, 505, '100', '3.0300000000000002', '1.29', '0', '', '2pdoeNGAvbhMQ36K', 0, 0, '2020-04-23 07:50:42', '2020-04-23 07:50:42'),
(141, 11, 103, '1000', '12', '12.65', '0', '', 'kn7H60IRMjsDThYT', 0, 0, '2020-04-23 07:54:21', '2020-04-23 07:54:21'),
(142, 11, 107, '100', '6', '1.33', '0', '', 'UegkptaMMbHfAcLB', 0, 0, '2020-04-23 10:11:56', '2020-04-23 10:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `etemplates`
--

CREATE TABLE `etemplates` (
  `id` int(10) UNSIGNED NOT NULL,
  `esender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emessage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `twilio_sid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilio_auth` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilio_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etemplates`
--

INSERT INTO `etemplates` (`id`, `esender`, `mobile`, `emessage`, `twilio_sid`, `twilio_auth`, `twilio_number`, `created_at`, `updated_at`) VALUES
(1, 'support@boomchart.com.ng', '+1234567890', '<div class=\"wrapper\" style=\"background-color: #f2f2f2;\"><br />\r\n<table class=\"layout layout--no-gutter\" style=\"border-collapse: collapse; table-layout: fixed; margin-left: auto; margin-right: auto; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;\" align=\"center\">\r\n<tbody>\r\n<tr>\r\n<td class=\"column\" style=\"padding: 0; text-align: left; vertical-align: top; color: #60666d; font-size: 14px; line-height: 21px; font-family: sans-serif; width: 600px;\"><br />\r\n<div style=\"margin-left: 20px; margin-right: 20px;\"><span style=\"font-size: large;\">Hi {{name}},<br /></span>\r\n<p><strong>{{message}}</strong></p>\r\n</div>\r\n<div style=\"margin-left: 20px; margin-right: 20px; margin-bottom: 24px;\"><br />\r\n<p class=\"size-14\" style=\"margin-top: 0; margin-bottom: 0; font-size: 14px; line-height: 21px;\">Thanks,<br /><strong>BOOMCHART</strong></p>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', 'AC590b33681d6cee2fd264805fef3f357c', '822ba44fbff66ddfd8494ce853aaaa8b', '+12562429305', '2018-01-09 23:45:09', '2020-03-31 07:31:16');

-- --------------------------------------------------------

--
-- Table structure for table `exchange_log`
--

CREATE TABLE `exchange_log` (
  `id` int(32) NOT NULL,
  `reference` varchar(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `famount` varchar(255) NOT NULL,
  `tamount` varchar(255) NOT NULL,
  `frome` int(32) NOT NULL,
  `toe` int(32) NOT NULL,
  `charge` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exchange_log`
--

INSERT INTO `exchange_log` (`id`, `reference`, `user_id`, `famount`, `tamount`, `frome`, `toe`, `charge`, `created_at`, `updated_at`) VALUES
(13, 'rNAUq4Bdgeq1vyeV', 11, '9600', '1667.5749318801', 12, 10, '0.48', '2020-03-30 12:30:38', '2020-03-30 12:30:38'),
(14, '6xxSKEEsb7kLkisn', 11, '9600', '1667.5749318801', 12, 10, '0.48', '2020-03-30 12:31:48', '2020-03-30 12:31:48'),
(15, 'Ah5rQL5CMxOJwls7', 11, '96000', '1339.2915531335', 12, 7, '0.48', '2020-03-30 12:33:17', '2020-03-30 12:33:17');

-- --------------------------------------------------------

--
-- Table structure for table `ext_transfer`
--

CREATE TABLE `ext_transfer` (
  `id` int(11) NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `user_id` int(32) NOT NULL,
  `amount` double DEFAULT NULL,
  `merchant_key` varchar(32) DEFAULT NULL,
  `success_url` text DEFAULT NULL,
  `fail_url` text DEFAULT NULL,
  `notify_url` text DEFAULT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ext_transfer`
--

INSERT INTO `ext_transfer` (`id`, `reference`, `user_id`, `amount`, `merchant_key`, `success_url`, `fail_url`, `notify_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'yY0Di9XeIu3nQIXB', 11, 1000, 'Xe98yNpmOvcPDreW', '', '', '', 1, '2020-03-31 06:23:42', '2020-03-31 05:23:42'),
(2, 'IgrRWhPizw6ujeY5', 11, 1000, 'Xe98yNpmOvcPDreW', '', '', '', 0, '2020-03-30 21:27:20', '2020-03-30 21:27:20'),
(3, 'xphUEXUzY8NDNglO', 27, 10000, 'Xe98yNpmOvcPDreW', '//www.mydomain.com/thank_you.html', '//www.mydomain.com/failed.html', '//www.mydomain.com/failed.html', 0, '2020-03-31 05:17:14', '2020-03-31 05:17:14'),
(4, 'k18ssJ9154xF6vzS', 27, 10000, 'Xe98yNpmOvcPDreW', '//www.mydomain.com/thank_you.html', '//www.mydomain.com/failed.html', '//www.mydomain.com/failed.html', 1, '2020-03-31 06:32:15', '2020-03-31 05:32:15'),
(5, 'DsHxKBBvjzFmW9Ht', 27, 10000, 'Xe98yNpmOvcPDreW', '//www.mydomain.com/thank_you.html', '//www.mydomain.com/failed.html', '//www.mydomain.com/failed.html', 2, '2020-03-31 06:45:43', '2020-03-31 05:45:43');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(32) NOT NULL,
  `question` text NOT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(43, 'What is corporate internate banking?', '<p>Corporate internet banking is a secure online banking platform that enables cutomers make transfers to anyone in the world, 24 hours a day, 7 days a week</p>', '2020-01-24 22:12:28', '0000-00-00 00:00:00'),
(44, 'Can i update my account details from any branch?', '<p>Yes account update requsests can be made at any of the branches</p>', '2020-01-24 22:12:28', '0000-00-00 00:00:00'),
(45, 'How long does it take before my account becomes inactive?', '<p>Accounts become dormant after 6 months of inactivity</p>', '2020-01-24 22:12:28', '0000-00-00 00:00:00'),
(46, 'Is it possible to open an account in the coutry and operate the account while out of the country?', '<p>Yes, the account can be operated through any of our internet banking solution.</p>', '2020-01-24 22:12:28', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `main_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateimg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minamo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maxamo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent_charge` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `main_name`, `name`, `gateimg`, `minamo`, `maxamo`, `fixed_charge`, `percent_charge`, `rate`, `val1`, `val2`, `status`, `created_at`, `updated_at`) VALUES
(101, 'PayPal', 'PayPal', 'paypal.png', '5', '1000', '0.511', '2.52', '80', 'melindadavies318@gmail.comq', '', 1, NULL, '2018-06-21 11:59:34'),
(102, 'PerfectMoney', 'Perfect Money', 'perfectmoney.png', '20', '20000', '2', '1', '80', 'U5376900', 'G079qn4Q7XATZBqyoCkBteGRg', 1, NULL, '2018-05-20 11:58:59'),
(103, 'Stripe', 'Stripe', 'stripe.png', '20', '20000', '2', '1', '80', 'U5376900', 'G079qn4Q7XATZBqyoCkBteGRg', 1, NULL, '2018-05-20 11:58:59'),
(104, 'Skrill', 'Skrill', 'skrill.png', '10', '50000', '3', '3', '80', 'demoqco@sun-fish.com', 'TheSoftKing', 1, NULL, '2018-05-20 12:01:09'),
(106, 'Voguepay', 'Voguepay', 'voguepay.png', '10', '50000', '3', '3', '80', '', 'sk_test_4eC39HqLyjWDarjtT1zdp7dc', 1, NULL, '2018-05-20 12:01:09'),
(107, 'Paystack', 'Paystack', 'paystack.png', '10', '50000', '3', '3', '80', 'pk_live_293d04f581857487ef9b5cd8cd0f843f7728c3be', NULL, 1, NULL, '2020-02-09 21:34:23'),
(108, 'Flutterwave', 'Flutterwave', 'flutterwave.png', '10', '50000', '3', '3', '80', 'FLWPUBK-9d9b4497a12c8226930c91c8cb23b81b-X', 'FLWSECK-9e6d77c844c0533ca612bef7539c2727-X', 1, NULL, '2018-05-20 12:01:09'),
(501, 'Blockchain.info', 'Blockchain', 'blockchain.png', '1', '20000', '1', '0.5', '80', 'a5f1cf3b6b418fc6304ff7e186041b73c19c2d3e16dedac6c1cafa64704d1e2e', 'xpub6CjfQJqY6Ctz1ccjTpVR7NAqKAKgJ5XDbpbxM2MTRUhznBXoE7Lo8NW749FNZheLfC9EcqAh2RRRtjbQ2ztxXJmiwVnQZNWJxgfeFSphpQM', 1, NULL, '2020-02-09 21:33:48'),
(505, 'CoinPayment - BTC', 'CoinPayment', 'coinpayment.png', '1', '50000', '0.51', '2.52', '80', '77f90f5d5cb242bec85eb1f4ec2e5cec6afee88ed0896965bb19887811040b2a', 'dDe9E59433F702a7220c8c71460500DAc023E199BF95d556d1cF4d8bE90609c0', 1, NULL, '2018-05-31 09:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `internets`
--

CREATE TABLE `internets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `network` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `internets`
--

INSERT INTO `internets` (`id`, `name`, `code`, `amount`, `price`, `network`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '100 MB - 1 day', '100', '95.5', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(2, '200 MB - 3 days', '200', '191', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(3, '350 MB - 7 days', '350', '286.5', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(4, '750 MB - 14 days', '750', '477.5', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(5, '1 GB - 1 day', '1000', '286.5', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(6, '1.5 GB - 30 days', '1500', '955', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(7, '2 GB - 1 day', '2000', '477.5', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(8, '3 GB - 30 days', '3000', '1432.5', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(9, '4.5 GB - 30 days', '4500', '1910', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(10, '6 GB - 7 days', '6000', '1432.5', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(11, '8 GB - 30 days', '8000', '2865', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(12, '11 GB - 30 days', '11000', '3820', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(13, '15 GB - 30 days', '15000', '4775', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(14, '40 GB - 30 days', '40000', '9550', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(15, '75 GB - 30 days', '75000', '14325', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26'),
(16, '110 GB - 30 days', '110000', '19100', '0', 'Airtel', 1, NULL, '2021-02-20 08:25:26', '2021-02-20 08:25:26');

-- --------------------------------------------------------

--
-- Table structure for table `int_transfer`
--

CREATE TABLE `int_transfer` (
  `id` int(32) NOT NULL,
  `ref_id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `amount` int(32) NOT NULL,
  `details` text NOT NULL,
  `status` int(2) NOT NULL,
  `type` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `int_transfer`
--

INSERT INTO `int_transfer` (`id`, `ref_id`, `user_id`, `amount`, `details`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 1573196064, 11, 200, 'Acct name:LuciferBank name:CodexAddress:Su hotel sajuma USwift:SDEGHTIban:2184657324', 0, 1, '2020-02-02 08:01:37', '0000-00-00 00:00:00'),
(2, 1573196064, 11, 35, 'Acct name:LuciferBank name:CodexAddress:Su hotel sajuma USwift:SDEGHTIban:2184657324', 1, 2, '2020-02-02 08:01:37', '0000-00-00 00:00:00'),
(3, 1573196130, 11, 100, 'Acct name:Lucifer Bank name:Codex Address:Su hotel sajuma U Swift:SDEGHT Iban:2184657324', 0, 1, '2020-02-02 08:01:37', '0000-00-00 00:00:00'),
(4, 1573196130, 11, 35, 'Acct name:Lucifer Bank name:Codex Address:Su hotel sajuma U Swift:SDEGHT Iban:2184657324', 1, 2, '2020-02-02 08:01:37', '0000-00-00 00:00:00'),
(5, 1573196224, 11, 50, 'Acct name:Lucifer, Bank name:Codex, Address:Su hotel sajuma U, Swift:SDEGHT, Iban:2184657324', 2, 1, '2020-02-02 08:01:37', '0000-00-00 00:00:00'),
(6, 1573196224, 11, 35, 'Acct name:Lucifer, Bank name:Codex, Address:Su hotel sajuma U, Swift:SDEGHT, Iban:2184657324', 1, 2, '2020-02-02 08:01:37', '0000-00-00 00:00:00'),
(7, 1579545521, 11, 235, 'Acct name:Biggy, Bank name:Codex, Address:Su hotel sajuma UI, Swift:SDEGHT, Iban:5678876', 0, 1, '2020-02-02 08:01:37', '0000-00-00 00:00:00'),
(8, 1580630723, 11, 1000, 'Acct name:eree, Bank name:Codex, Address:Su hotel sajuma UI, Swift:SDEGHT, Iban:5643456', 1, 1, '2020-02-13 14:54:38', '2020-02-13 13:54:38'),
(9, 1587629792, 11, 2134, 'Acct name:asdfg, Bank name:sdfgh, Address:sdfgh, Swift:sdfg, Iban:sadly', 0, 1, '2020-04-23 07:16:32', '2020-04-23 07:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `amount` varchar(32) NOT NULL,
  `status` int(2) NOT NULL,
  `reference` int(32) NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`id`, `user_id`, `amount`, `status`, `reference`, `details`, `created_at`, `updated_at`) VALUES
(1, 11, '4540', 2, 1579448184, 'djchdh', '2020-01-31 12:47:55', '2020-01-31 11:47:55'),
(2, 11, '1100', 2, 1579724899, 'School fees', '2020-03-30 07:23:31', '2020-03-30 06:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `id` int(32) NOT NULL,
  `image_link` varchar(128) NOT NULL,
  `image_link2` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logo`
--

INSERT INTO `logo` (`id`, `image_link`, `image_link2`, `created_at`, `updated_at`) VALUES
(1, 'images/logo_1587603901.png', 'images/favicon_1587603926.jpg', '2020-04-23 01:05:26', '2020-04-23 00:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `merchant_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `user_id`, `merchant_key`, `site_url`, `image`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(38, 11, 'Xe98yNpmOvcPDreW', 'http://localhost/bitvest', 'merchant_1585589512.png', 'Boomchart', 'Boomcharts', 1, '2020-03-30 15:59:17', '2020-03-31 06:59:51'),
(39, 11, 'r1Kn6nzk1cE63rQE', 'https://castro.com', '1585641674_user_business.jpg', 'XPhotos', 'ddf', 1, '2020-03-31 07:01:14', '2020-03-31 09:54:34');

-- --------------------------------------------------------

--
-- Table structure for table `networks`
--

CREATE TABLE `networks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `max` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `airtime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tv` int(1) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `networks`
--

INSERT INTO `networks` (`id`, `name`, `code`, `symbol`, `image`, `min`, `max`, `airtime`, `internet`, `tv`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Airtel', 'Airtel', 'airtel', 'airtel.png', '100', '435', '1', '1', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(3, 'Globacom', 'Glo', 'glo', 'glo.png', '390', '400', '1', '1', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:29'),
(4, 'MTN', 'MTN', 'mtn', 'mtn.png', '370', '400', '1', '1', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(5, '9mobile', '9mobile', '9mobile', '9mob.png', '450', '400', '1', '1', NULL, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(6, 'DSTV', 'dstv', 'Feel the difference', 'dstv.png', '450', '400', '0', '0', 1, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(7, 'GOTV', 'gotv', 'Live It Love It', 'gotv.jpg', '450', '400', '0', '0', 1, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(8, 'STARTIMES', 'startimes', 'Emjoy Digital Live', 'startimes.jpg', '450', '400', '0', '0', 1, 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(32) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `created_at` varchar(32) NOT NULL,
  `updated_at` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `status`, `created_at`, `updated_at`) VALUES
(4, 'AML Policy', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages</p>', 1, '2019-07-31 11:43:14', '2019-11-11 01:21:30'),
(6, 'Diversity', '<header>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>&nbsp;</div>\r\n</div>\r\n<div>\r\n<div>\r\n<div>\r\n<h1>Diversity</h1>\r\n<p>Individuals. Ideas. Inspiration. Yes, we\'re open</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</header>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div data-nn-conditional=\"\">\r\n<div>\r\n<p>Diversity and inclusion matter in our business. An inclusive and diverse workforce makes us better leaders and contributes to a more innovative, dynamic and, ultimately, more successful company. And, variety helps us meet the needs of our diverse client base.</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div>\r\n<div data-nn-conditional=\"\">\r\n<h2 id=\"col1textimage\">Inclusiveness</h2>\r\n<div>\r\n<p>We promote inclusion and encourage open dialogue to draw out everyone\'s opinions and perspectives. We recognize a diverse range of contributions to keep our people energetic, engaged and inspired. And we are a signatory to the UN Standards of Conduct for Business regarding tackling LGBTI discrimination around the world.</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div>\r\n<div>\r\n<div data-nn-conditional=\"\">\r\n<h2 id=\"col2textimage\">Flexibility</h2>\r\n<div>\r\n<p>We offer a modern, flexible working environment. We work where and how it\'s most appropriate according to individual, role and team requirements.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div>\r\n<div>&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 1, '2020-02-15 23:02:32', '2020-02-16 20:47:41'),
(7, 'Sponsoring', '<div class=\"pageheadline pageheadline__base\">\r\n<h2 class=\"pageheadline__title\"><span class=\"pageheadline__hl pageheadline__hl--xsmall\">The big picture</span></h2>\r\n</div>\r\n<div class=\"leadtext leadtext__base\">\r\n<div class=\"leadtext__rte\">\r\n<p>We&rsquo;re passionate about supporting the places where we live and work. Through our long-standing sponsorships of motor sports and contemporary art, we connect with communities in new and exciting ways every day. It&rsquo;s our way of understanding how the world works, one pit stop and brush stroke at a time.</p>\r\n</div>\r\n</div>', 1, '2020-02-15 23:06:08', '2020-02-15 23:06:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'ronnie@gmail.com', 'IFsbuBWs5ZgZcoQGMivzLXy8XCvOne', '2018-05-16 01:28:41', NULL),
(2, 'ronnie@gmail.com', 'fHkcBEMW78ef43pmSswx8kVHqLcgDx', '2018-05-23 00:19:47', NULL),
(3, 'ronnie@gmail.com', 'tNPjzNUcsdEYeSPCutmDy8VfbECMUY', '2018-05-23 00:28:28', NULL),
(4, 'ronniearea@gmail.com', 'GXtEiyl8MGzNwMR5tNdRCEI7dTyuVX', '2018-05-27 16:02:22', NULL),
(5, 'abirkhan75@gmail.com', 'Z6sHQHOATk5fluqi0vAJeyqzEd0ZXz', '2018-05-27 05:54:38', NULL),
(6, 'haha@haha.co', 'IDx0BrjOWN6p0FGFpmOdgG6wrdtqO2', '2018-05-28 21:20:01', NULL),
(7, 'haha@haha.co', 'dD4UFej2PEFSEmBil48SJPw1l2zUSv', '2018-05-28 21:26:54', NULL),
(8, 'haha@haha.co', 'gbchqenwrcLnZPhzdjAtpR92V8vwwm', '2018-05-28 21:51:15', NULL),
(9, 'ronniearea@gmail.com', 'aDcOh1kIodnZh7xS1PIfWsQhMpgMdz', '2018-07-07 00:17:52', NULL),
(10, 'ronniearea@gmail.com', 'f1cIXMOls67f0fZTNgrabFt2gz1Tm3', '2018-07-07 00:18:43', NULL),
(11, 'ronniearea@gmail.com', 'otlQ1ZqDnK3fG4ppUJzah8vML0hbWZ', '2018-08-10 22:45:31', NULL),
(12, 'ronniearea@gmail.com', 'voucnaTSJ9zVb68fE89HFlTxpFV5ci', '2018-11-10 06:32:43', NULL),
(13, 'user@test.com', '4eUH4Lgx90OC18eXcDnlczyHNWcr2B', '2020-01-31 10:14:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `id` int(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `percent` varchar(32) NOT NULL,
  `min_deposit` int(32) NOT NULL,
  `amount` int(32) NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`id`, `name`, `percent`, `min_deposit`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Starter pack', '10', 0, 999, 1, '2020-02-12 19:24:13', '2020-02-12 18:24:13'),
(7, 'Premium pack', '12.5', 999, 1999, 1, '2020-01-30 23:47:13', '0000-00-00 00:00:00'),
(10, 'Gold pack', '15', 1999, 2999, 1, '2020-03-31 09:17:51', '2020-03-31 08:17:51');

-- --------------------------------------------------------

--
-- Table structure for table `powers`
--

CREATE TABLE `powers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billercode` varchar(99) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(77) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `powers`
--

INSERT INTO `powers` (`id`, `name`, `symbol`, `image`, `code`, `billercode`, `type`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Eko Electric', 'PHCN', 'ekedc.png', '01', 'EKO_ELECT_PREPAID', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(2, 'Jos Electric', 'JED', 'jed2.png', '06', 'JOS_ELECT_PREPAID', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(3, 'Ikeja Electric ', 'IKEDC', 'ikedc.png', '02', 'IKEJA_ELECT_PREPAID', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:29'),
(4, 'Kano Electric', 'KEDCO', 'kedco.png', '04', 'KANO_ELECT_PREPAID', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(5, 'Port Harcourt Electric', 'PHED', 'phedc.jpg', '05', NULL, 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(6, 'Ibadan Electric', 'IBED', 'ibadan.png', '07', 'IBADAN_ELECT_PREPAID', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(7, 'Kaduna Electric', 'KAD', 'kaduna.jpg', '08', 'KADUNA_ELECT_PREPAID', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-09-29 17:48:39'),
(9, 'Abuja Electric', 'ABEL', 'abuja.jpeg', '03', 'ABUJA_ELECT_PREPAID', 'Postpaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:28'),
(13, 'Enugu Electric ', 'IKEDC', 'enugu.png', '09', 'ENUGU_ELECT_PREPAID', 'Prepaid', 1, NULL, '2018-02-15 00:36:57', '2020-04-29 11:44:29');

-- --------------------------------------------------------

--
-- Table structure for table `profits`
--

CREATE TABLE `profits` (
  `id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `plan_id` int(32) NOT NULL,
  `amount` int(32) NOT NULL,
  `profit` varchar(32) NOT NULL,
  `status` int(2) NOT NULL,
  `trx` varchar(16) NOT NULL,
  `end_date` varchar(32) NOT NULL,
  `date` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profits`
--

INSERT INTO `profits` (`id`, `user_id`, `plan_id`, `amount`, `profit`, `status`, `trx`, `end_date`, `date`, `created_at`, `updated_at`) VALUES
(84, 11, 6, 20, '5.457534246575342', 1, '1578535322', '2021-01-31 00:13:53', '2020-01-31 00:13:53', '2020-04-23 14:47:46', '2020-04-23 13:47:46'),
(86, 11, 7, 500, '221.91780821917808', 1, '1578587513', '2021-01-06 00:13:53', '2020-01-06 00:13:53', '2020-04-23 14:47:46', '2020-04-23 13:47:46'),
(87, 11, 6, 2, '0.5457534246575343', 1, 'movKAYyaKqQnArWp', '2021-01-31 00:13:53', '2020-01-31 00:13:53', '2020-04-23 14:47:46', '2020-04-23 13:47:46'),
(88, 11, 10, 2000, '1094.7945205479452', 1, 'gQgVDo7DfQ5vkALX', '2021-01-03 00:13:53', '2020-01-03 00:13:53', '2020-04-23 14:47:46', '2020-04-23 13:47:46'),
(89, 11, 6, 50, '13.643835616438356', 1, 'XzmB9IooWR5F3FvT', '2021-01-31 00:13:53', '2020-01-31 00:13:53', '2020-04-23 14:47:46', '2020-04-23 13:47:46'),
(90, 11, 6, 50, '3.9452054794520546', 1, 'gjd8gLpt6dtwzUiq', '2021-03-30 06:17:14', '2020-03-30 06:17:14', '2020-04-23 14:47:46', '2020-04-23 13:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `reply_support`
--

CREATE TABLE `reply_support` (
  `id` int(32) NOT NULL,
  `ticket_id` int(32) NOT NULL,
  `reply` text NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply_support`
--

INSERT INTO `reply_support` (`id`, `ticket_id`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(1, 888883, 'hello', 0, '2020-02-14 09:02:40', '0000-00-00 00:00:00'),
(2, 888883, 'We are working on your issue', 0, '2020-02-14 09:02:40', '0000-00-00 00:00:00'),
(3, 888883, 'hi', 0, '2020-02-14 08:20:58', '2020-02-14 08:20:58'),
(4, 888883, 'sdfg', 1, '2020-02-15 13:47:56', '2020-02-15 13:47:56'),
(5, 888883, 'sdfg', 1, '2020-02-15 13:48:46', '2020-02-15 13:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `image_link` varchar(32) DEFAULT NULL,
  `review` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `name`, `occupation`, `image_link`, `review`, `status`, `created_at`, `updated_at`) VALUES
(11, 'Jason Well', 'Forex trader', 'update_1581806819.jpg', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting', 1, '2020-02-15 22:46:59', '2020-02-15 21:46:59'),
(12, 'JacK Mill', 'Market analyst', 'update_1581806843.jpg', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting', 1, '2020-02-15 22:47:23', '2020-02-15 21:47:23'),
(13, 'Micheal Pete', 'Forex analyst', 'update_1581806792.jpg', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting', 1, '2020-02-15 22:46:32', '2020-02-15 21:46:32'),
(14, 'Big brother', 'Web developer', 'update_1581806914.jpg', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting', 1, '2020-02-15 22:48:34', '2020-02-15 21:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `amount` varchar(32) NOT NULL,
  `target` varchar(255) NOT NULL,
  `end_date` varchar(32) NOT NULL,
  `reference` int(32) NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`id`, `user_id`, `amount`, `target`, `end_date`, `reference`, `status`, `created_at`, `updated_at`) VALUES
(9, 11, '200', 'Holiday', '2020-01-31', 1579731439, 1, '2020-01-31 00:33:01', '2020-01-30 23:33:01'),
(10, 11, '20', 'Christmas', '2020-01-31', 1580153630, 1, '2020-01-31 00:33:01', '2020-01-30 23:33:01'),
(11, 11, '20', 'School fees', '2020-01-31', 1580153680, 1, '2020-01-31 00:07:11', '2020-01-30 23:07:11'),
(12, 11, '500', 'Rent', '2020-03-24', 1580219625, 1, '2020-01-31 00:33:01', '2020-01-30 23:33:01'),
(13, 11, '2000', 'School fees', '2020-02-19', 1581349123, 1, '2020-02-10 15:42:08', '2020-02-10 14:42:08');

-- --------------------------------------------------------

--
-- Table structure for table `seller_log`
--

CREATE TABLE `seller_log` (
  `id` int(32) NOT NULL,
  `reference` varchar(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `plan_id` int(32) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `charge` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller_log`
--

INSERT INTO `seller_log` (`id`, `reference`, `user_id`, `plan_id`, `amount`, `charge`, `created_at`, `updated_at`) VALUES
(26, 'LNWWHDoeGCBjUJC1', 11, 12, '1050', '18350', '2020-03-30 12:06:13', '2020-03-30 12:06:13'),
(27, 'YGqLf8ieFanP9GnF', 11, 12, '10500', '500', '2020-03-30 12:08:22', '2020-03-30 12:08:22'),
(28, 'cFcafzZXX6HbZ5t7', 11, 12, '21000', '1000', '2020-03-30 12:09:34', '2020-03-30 12:09:34');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(32) NOT NULL,
  `title` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `image` varchar(32) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `details`, `image`, `created_at`, `updated_at`) VALUES
(1, 'lorem ipsum', 'Neque viverra justo nec ultrices dui. Ut eu sem integer vitae justo eget.', 'service_1587646811.png', '2020-04-23 13:00:11', '2020-04-23 12:00:11'),
(2, 'lorem ipsum', 'Neque viverra justo nec ultrices dui. Ut eu sem integer vitae justo eget.', 'service_1587646963.png', '2020-04-23 13:02:43', '2020-04-23 12:02:43'),
(3, 'lorem ipsum', 'Neque viverra justo nec ultrices dui. Ut eu sem integer vitae justo eget.', 'service_1587647149.png', '2020-04-23 13:05:49', '2020-04-23 12:05:49'),
(4, 'lorem ipsum', 'Neque viverra justo nec ultrices dui. Ut eu sem integer vitae justo eget.', 'service_1587647073.png', '2020-04-23 13:04:33', '2020-04-23 12:04:33');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(32) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `site_name` varchar(200) DEFAULT NULL,
  `site_desc` text DEFAULT NULL,
  `tawk_id` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `mobile` varchar(128) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `gradient1` varchar(7) NOT NULL,
  `gradient2` varchar(7) NOT NULL,
  `balance_reg` int(32) DEFAULT NULL,
  `email_notify` int(2) DEFAULT NULL,
  `sms_notify` int(2) DEFAULT NULL,
  `kyc` int(2) DEFAULT NULL,
  `transfer_charge` int(32) DEFAULT NULL,
  `transfer_chargex` int(32) DEFAULT NULL,
  `upgrade_fee` varchar(200) DEFAULT NULL,
  `loan_interest` int(32) DEFAULT NULL,
  `saving_interest` int(32) DEFAULT NULL,
  `saving_charge` int(32) DEFAULT NULL,
  `merchant_charge` int(32) DEFAULT NULL,
  `bank_withdraw` int(32) DEFAULT NULL,
  `email_verification` int(2) DEFAULT NULL,
  `sms_verification` int(2) DEFAULT NULL,
  `registration` int(2) DEFAULT NULL,
  `withdraw_charge` varchar(191) DEFAULT NULL,
  `collateral_percent` int(32) DEFAULT NULL,
  `py_scheme` int(2) DEFAULT 0,
  `loan` int(2) DEFAULT 0,
  `save` int(2) DEFAULT 0,
  `asset` int(2) NOT NULL,
  `merchant` int(2) NOT NULL,
  `api` varchar(32) DEFAULT NULL,
  `key_update` varchar(32) DEFAULT NULL,
  `auto` int(2) NOT NULL,
  `clubid` varchar(66) DEFAULT NULL,
  `clubkey` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `title`, `site_name`, `site_desc`, `tawk_id`, `email`, `mobile`, `address`, `gradient1`, `gradient2`, `balance_reg`, `email_notify`, `sms_notify`, `kyc`, `transfer_charge`, `transfer_chargex`, `upgrade_fee`, `loan_interest`, `saving_interest`, `saving_charge`, `merchant_charge`, `bank_withdraw`, `email_verification`, `sms_verification`, `registration`, `withdraw_charge`, `collateral_percent`, `py_scheme`, `loan`, `save`, `asset`, `merchant`, `api`, `key_update`, `auto`, `clubid`, `clubkey`, `created_at`, `updated_at`) VALUES
(1, 'Bank, budget and earn 35x the national average.', 'Fintech', 'Start banking, budgeting, and saving up to 1.90% APY when you open an FDIC-Insured Protected Goals Account.', NULL, 'support@boomchart.com.ng', '+1234567894, +2345666666', 'Somewhere in new york london', 'FFDEE9', 'B5FFFC', 2, 0, 0, 1, 5, 10, '200', 10, 10, 3, 4, 0, 0, 0, 1, '3', 50, 1, 1, 1, 1, 1, '75ba30ed128fe217550a', '2020-04-23 14:01:52', 1, 'CK10217131', '5YD7XE88HLYGG3648Q6869G944O9SKPI8F7WLL9L0Q70ISH28826O5QECW3P426S', '2021-02-20 07:47:38', '2020-04-23 13:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(32) NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `image_link` varchar(32) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `title`, `body`, `image_link`, `status`) VALUES
(1, 'Fastest way to transfer money', 'we believe that the beauty of life lies in the little things that give us a better expression of ourselves, make us more social and connect emotionally', '1574025349.jpg', 1),
(2, 'Lorem Ipsum is simply dummy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '1572813037.jpg', 1),
(3, 'Lorem Ipsum is simply dummy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '1572813073.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(2) NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'facebook', 'https://facebook.com/', '2020-02-09 08:09:22', '2020-02-09 07:09:22'),
(2, 'instagram', 'https://instagram.com/', '2020-01-24 22:09:58', '0000-00-00 00:00:00'),
(3, 'twitter', 'https://twitter.com/', '2020-01-24 22:09:58', '0000-00-00 00:00:00'),
(4, 'skype', NULL, '2020-02-15 22:59:58', '2020-02-15 21:59:58'),
(5, 'pinterest', NULL, '2020-02-15 23:00:20', '2020-02-15 22:00:20'),
(7, 'linkedin', NULL, '2020-02-15 23:00:07', '2020-02-15 22:00:07'),
(8, 'youtube', NULL, '2020-02-15 22:59:48', '2020-02-15 21:59:48'),
(9, 'whatsapp', 'https://whatsapp.com/', '2020-02-09 08:09:38', '2020-02-09 07:09:38');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `id` int(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscriber`
--

INSERT INTO `subscriber` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'user@test.com', '2020-01-24 23:29:30', '2020-01-24 23:29:30'),
(2, 'freakboss3@gmail.com', '2020-01-24 23:32:13', '2020-01-24 23:32:13'),
(3, 'c@c.com', '2020-01-24 23:33:58', '2020-01-24 23:33:58'),
(4, 'naninick27@gmail.com', '2020-01-25 06:01:15', '2020-01-25 06:01:15'),
(5, 'inyamachidi355@gmail.com', '2020-01-25 06:12:24', '2020-01-25 06:12:24'),
(6, 'fish@castro.com', '2020-01-25 06:13:50', '2020-01-25 06:13:50');

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `id` int(32) NOT NULL,
  `subject` text NOT NULL,
  `priority` varchar(8) NOT NULL,
  `message` text NOT NULL,
  `status` int(2) NOT NULL,
  `user_id` int(32) NOT NULL,
  `ticket_id` int(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`id`, `subject`, `priority`, `message`, `status`, `user_id`, `ticket_id`, `created_at`, `updated_at`) VALUES
(5, 'Dispute Guide', 'Low', 'Hello', 0, 11, 888883, '2020-02-13 22:58:48', '0000-00-00 00:00:00'),
(7, 'Nsbsbs', 'High', 'eeweeeeeee', 0, 11, 1581775991, '2020-02-15 13:13:10', '2020-02-15 13:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(32) NOT NULL,
  `ref_id` varchar(32) NOT NULL,
  `amount` varchar(32) NOT NULL,
  `sender_id` int(32) NOT NULL,
  `receiver_id` int(32) NOT NULL,
  `status` int(2) NOT NULL,
  `type` int(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `ref_id`, `amount`, `sender_id`, `receiver_id`, `status`, `type`, `created_at`, `updated_at`) VALUES
(20, '1573405019', '25', 11, 17, 2, 1, '2019-11-10 16:56:59', '0000-00-00 00:00:00'),
(21, '1573405044', '26', 11, 17, 1, 1, '2019-11-10 16:57:23', '0000-00-00 00:00:00'),
(22, '1573405044', '5', 11, 17, 1, 2, '2019-11-10 17:01:39', '0000-00-00 00:00:00'),
(23, '1573405378', '200', 11, 17, 2, 1, '2019-11-10 17:02:58', '0000-00-00 00:00:00'),
(25, '1579359300', '105', 11, 17, 1, 1, '2020-01-18 14:55:00', '0000-00-00 00:00:00'),
(26, '1579359481', '20', 11, 17, 1, 1, '2020-01-18 14:58:01', '0000-00-00 00:00:00'),
(27, '1579364933', '2', 11, 25, 1, 1, '2020-01-18 16:28:52', '0000-00-00 00:00:00'),
(28, '1579545274', '100', 11, 17, 1, 1, '2020-01-20 18:34:33', '0000-00-00 00:00:00'),
(29, '1580559356', '100', 11, 26, 1, 1, '2020-02-01 11:15:56', '2020-02-01 11:15:56'),
(30, 'eNYAeaBUhd', '1000', 11, 17, 1, 1, '2020-03-30 09:51:42', '2020-03-30 09:51:42'),
(31, 'sdUA786O7Q', '22', 11, 27, 1, 1, '2020-04-23 08:00:13', '2020-04-23 08:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `tran_acct`
--

CREATE TABLE `tran_acct` (
  `id` int(32) NOT NULL,
  `amount` float NOT NULL,
  `type` int(2) NOT NULL,
  `ref` int(32) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(32) NOT NULL,
  `date` varchar(32) NOT NULL,
  `seen` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tran_acct`
--

INSERT INTO `tran_acct` (`id`, `amount`, `type`, `ref`, `content`, `user_id`, `date`, `seen`) VALUES
(1, 0, 1, 1573889534, 'Acct:, Date:2019-11-16 08:32:13, CR Amt:, Bal:0. Ref:1573889534', 0, '2019-11-16 08:32:13', 0),
(2, 50, 1, 1573889662, 'Acct:2134742865, Date:2019-11-16 08:34:21, CR Amt:50, Bal:5503. Ref:1573889662, Desc:master card', 11, '2019-11-16 08:34:21', 1),
(3, 50, 2, 1573889732, 'Acct:2134742865, Date:2019-11-16 08:35:32, DR Amt:50, Bal:5453, Ref:1573889732, Desc:Car expenses', 11, '2019-11-16 08:35:32', 1),
(4, 100, 1, 1573895137, 'Acct:2134742865, Date:2019-11-16 10:05:36, CR Amt:100, Bal:5553, Ref:1573895137, Desc:Mastercard', 11, '2019-11-16 10:05:36', 1),
(5, 100, 1, 1573895175, 'Acct:2134742865, Date:2019-11-16 10:06:14, CR Amt:100, Bal:5653, Ref:1573895175, Desc:Mastercard', 11, '2019-11-16 10:06:14', 1),
(6, 100, 1, 1573895244, 'Acct:2134742865, Date:2019-11-16 10:07:23, CR Amt:100, Bal:5753, Ref:1573895244, Desc:Mastercard', 11, '2019-11-16 10:07:23', 1),
(7, 100, 1, 1573895345, 'Acct:2134742865, Date:2019-11-16 10:09:04, CR Amt:100, Bal:5853, Ref:1573895345, Desc:Mastercard', 11, '2019-11-16 10:09:04', 1),
(8, 100, 1, 1573895452, 'Acct:2134742865, Date:2019-11-16 10:10:52, CR Amt:100, Bal:5953, Ref:1573895452, Desc:Mastercard', 11, '2019-11-16 10:10:52', 1),
(9, 100, 1, 1573895517, 'Acct:2134742865, Date:2019-11-16 10:11:56, CR Amt:100, Bal:6053, Ref:1573895517, Desc:Mastercard', 11, '2019-11-16 10:11:56', 1),
(10, 100, 1, 1573895571, 'Acct:2134742865, Date:2019-11-16 10:12:50, CR Amt:100, Bal:6153, Ref:1573895571, Desc:Mastercard', 11, '2019-11-16 10:12:50', 1),
(11, 200, 2, 1573895614, 'Acct:2134742865, Date:2019-11-16 10:13:33, DR Amt:200, Bal:5953, Ref:1573895614, Desc:Filmhouse', 11, '2019-11-16 10:13:33', 1),
(12, 200, 1, 1573895645, 'Acct:2134742865, Date:2019-11-16 10:14:04, CR Amt:200, Bal:6153, Ref:1573895645, Desc:Filmhouse', 11, '2019-11-16 10:14:04', 1),
(13, 200, 1, 1574019906, 'Acct:2134742865, Date:2019-11-17 20:45:06, CR Amt:200, Bal:6353, Ref:1574019906, Desc:jkdm', 11, '2019-11-17 20:45:06', 1),
(14, 200, 1, 1574023300, 'Acct:2134742865, Date:2019-11-17 21:41:39, CR Amt:200, Bal:6553, Ref:1574023300, Desc:jkdm', 11, '2019-11-17 21:41:39', 1),
(15, 1000, 2, 1574023525, 'Acct:2134742865, Date:2019-11-17 21:45:24, DR Amt:1000, Bal:5553, Ref:1574023525, Desc:transfer charges', 11, '2019-11-17 21:45:24', 1),
(16, 490, 1, 1574023605, 'Acct:2134742865, Date:2019-11-17 21:46:45, CR Amt:490, Bal:6043, Ref:1574023605, Desc:Transfer charges', 11, '2019-11-17 21:46:45', 1),
(17, 1000, 1, 1579549865, 'Acct:2134742865, Date:2020-01-20 20:51:05, CR Amt:1000, Bal:6100, Ref:1579549865, Desc:Tax bonuses', 11, '2020-01-20 20:51:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trending`
--

CREATE TABLE `trending` (
  `id` int(8) NOT NULL,
  `title` text NOT NULL,
  `details` text NOT NULL,
  `image` varchar(64) NOT NULL,
  `cat_id` int(32) NOT NULL,
  `views` int(32) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trending`
--

INSERT INTO `trending` (`id`, `title`, `details`, `image`, `cat_id`, `views`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Budget for Your Winter Trip to Cancun', '<p>It may be cold at home, but winter months are the peak season for Caribbean beaches, and for good reason: With beautiful scenery, tropical weather, and a dazzling array of adventure opportunities, a trip to sunny Mexico can be the perfect cure for the winter blues.</p>', 'post_1586438234.jpg', 2, 4, 1, '2020-04-09 15:31:20', '2020-04-09 14:31:20'),
(10, 'We are still choosing to help you grow your money and your confidence', '<p>We don&rsquo;t have a crystal ball, and can&rsquo;t predict when rates will change again, but we wanted to clearly communicate what&rsquo;s happening today. We believe that maintaining our high Protected Goals Account rates&mdash;and rewarding the choice to save&mdash;will help our customers continue to feel confident with their money.</p>', 'post_1586438334.jpg', 2, 3, 1, '2020-04-09 15:31:29', '2020-04-09 14:31:29'),
(11, 'Prioritize your savings goals based on what you really want.', '<p>You know you should be saving, but what should you save for first? Prioritizing your savings goals can be confusing. Here&rsquo;s how to sift through it all.</p>', 'post_1586438362.jpg', 2, 5, 1, '2020-04-23 00:37:33', '2020-04-22 23:37:33');

-- --------------------------------------------------------

--
-- Table structure for table `trending_cat`
--

CREATE TABLE `trending_cat` (
  `id` int(8) NOT NULL,
  `categories` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trending_cat`
--

INSERT INTO `trending_cat` (`id`, `categories`, `created_at`, `updated_at`) VALUES
(2, 'Inspiration', '2020-01-24 22:13:56', '0000-00-00 00:00:00'),
(3, 'Company', '2020-01-24 22:13:56', '0000-00-00 00:00:00'),
(4, 'Engineering', '2020-01-24 22:13:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ui_design`
--

CREATE TABLE `ui_design` (
  `id` int(11) NOT NULL,
  `s6_title` text DEFAULT NULL,
  `s7_title` text DEFAULT NULL,
  `s7_body` text DEFAULT NULL,
  `s7_image` varchar(32) DEFAULT NULL,
  `s8_image` varchar(32) DEFAULT NULL,
  `s8_title` text DEFAULT NULL,
  `s8_body` text DEFAULT NULL,
  `s9_image` varchar(32) DEFAULT NULL,
  `s9_title` text DEFAULT NULL,
  `s9_body` text DEFAULT NULL,
  `s6_body` text DEFAULT NULL,
  `s5_title` text DEFAULT NULL,
  `s5_body` text DEFAULT NULL,
  `s4_title` text DEFAULT NULL,
  `s4_body` text DEFAULT NULL,
  `s4_image` varchar(32) DEFAULT NULL,
  `s3_title` text DEFAULT NULL,
  `s3_body` text DEFAULT NULL,
  `s3_image` varchar(32) DEFAULT NULL,
  `s2_image` varchar(32) DEFAULT NULL,
  `s2_title` text DEFAULT NULL,
  `s2_body` text DEFAULT NULL,
  `s1_title` text DEFAULT NULL,
  `header_title` text DEFAULT NULL,
  `header_body` text DEFAULT NULL,
  `nav_type` int(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ui_design`
--

INSERT INTO `ui_design` (`id`, `s6_title`, `s7_title`, `s7_body`, `s7_image`, `s8_image`, `s8_title`, `s8_body`, `s9_image`, `s9_title`, `s9_body`, `s6_body`, `s5_title`, `s5_body`, `s4_title`, `s4_body`, `s4_image`, `s3_title`, `s3_body`, `s3_image`, `s2_image`, `s2_title`, `s2_body`, `s1_title`, `header_title`, `header_body`, `nav_type`, `created_at`, `updated_at`) VALUES
(1, 'An account that suits you', 'What our client say about us', 'Pulvinar neque laoreet suspendisse interdum consectetur libero id faucibus. Ac felis donec et odio pellentesque diam volutpat commodo. Tristique magna sit amet purus gravida quis blandit.', 'section4_1581766093.png', 'section8_1586432780.png', 'Reliable asset program', 'Join our program and learn to invest on asset. Earn from buying, selling and exchanging assets. Asset can also be transferred within platform. The value of asset changes every 1hour based on live market prices', 'section9_1586432802.png', 'Easy access to loan', 'We charge 10% of loaned amount as interest fee. Balance must exceed or equal to 50% of loaned amount as collateral. Participation in save 4 me & PY scheme will not be allowed until loan is paid.', 'We want to create superior value for our clients, shareholders and employees. And we want to stand out as a winner in our industry: for our expertise, advice and execution, our contribution to society, our work environment, and our business success.\r\nFintech is a registered investment platform providing digital asset investment management services to individuals. We provide a dynamic investment solution to clients in need of a self-operating portfolio, as well as a smart fund with flexible time and investment amount.', 'Build your savings without even trying.', 'Turn on Round-up Rules and start saving up effortlessly. Whenever you make a purchase, Goals make it easy to save for the things you want or want to do. There’s no need for spreadsheets or extra apps to budget and track your money.', 'Reliable asset program', 'Join our program and learn to invest on asset. Earn from buying, selling and exchanging assets. Asset can also be transferred within platform. The value of asset changes every 1hour based on live market prices', 'section3_1586429306.png', 'What are your goals?', 'Whatever stage of life you’re at, we can guide you through the opportunities and challenges you face. Your investment goals may be different, but here are some examples of the sort of questions our wealth planners can help you answer.Join our program and learn to save wisely ahead for your future. Funds won\'t be available still target date is reached.', 'section2_1586431609.png', 'section1_1586430819.png', 'Start receiving payment from any website', 'Our solutions for independent financial advisors and wealth managers include research, infrastructure and a broad range of products and services.We offers high net worth and affluent individuals around the world a complete range of tailored advice and investment services. Our spectrum ranges from investment management to estate planning and corporate finance advice, in addition to specific wealth management products and services.', 'Market leaders use app to reach their brand & business.', 'The Better Way to Control your Money', 'Join our program and learn to save wisely ahead for your future. There’s no need for spreadsheets or extra apps to budget and track your money. We want to create superior value for our clients, shareholders, and employees.', 1, '2020-04-14 12:21:44', '2020-04-14 11:21:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(32) NOT NULL,
  `image` varchar(32) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(64) NOT NULL,
  `balance` varchar(32) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `ip_address` varchar(32) NOT NULL,
  `last_login` varchar(32) DEFAULT NULL,
  `kyc_link` varchar(32) DEFAULT NULL,
  `kyc_status` int(2) NOT NULL DEFAULT 0,
  `acct_no` varchar(32) NOT NULL,
  `pin` varchar(32) NOT NULL DEFAULT '0000',
  `upgrade` int(2) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verification_code` varchar(191) NOT NULL,
  `sms_code` varchar(191) NOT NULL,
  `phone_verify` tinyint(4) NOT NULL,
  `email_verify` tinyint(4) NOT NULL,
  `email_time` datetime NOT NULL,
  `phone_time` datetime NOT NULL,
  `googlefa_secret` varchar(32) DEFAULT NULL,
  `fa_status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `image`, `email`, `name`, `balance`, `password`, `phone`, `country`, `status`, `ip_address`, `last_login`, `kyc_link`, `kyc_status`, `acct_no`, `pin`, `upgrade`, `remember_token`, `zip_code`, `address`, `city`, `created_at`, `updated_at`, `verification_code`, `sms_code`, `phone_verify`, `email_verify`, `email_time`, `phone_time`, `googlefa_secret`, `fa_status`) VALUES
(11, 'user', '1581766827_user.jpg', 'user@test.com', 'Julius Boom', '60094.02316076294', '$2y$10$Mu4K74ihiCpF8qyBKk58F.94ek4zqePxAdtkjXmr12aUOHfmNG4B6', '123456789', 'United States', 0, '::1', '2020-04-23 14:43:46', '1580485233_user.jpg', 1, '2134742865', '1234', 1, '', '300383', 'Su hotel sajuma UI', 'Georgia', '2020-01-26 16:37:07', '2020-04-23 13:43:46', '', '', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'KA7AA3NU56K3JQZ7', 1),
(17, 'Julis24', '1567960569.jpg', 'bigboss@ng.com', 'Julis Caesar', '150883', '$2y$10$HE2MiiKPyhufdFxg6SH5f.p9tX0l43YtjrSze9.hrtsATQM9Dgc9C', '+907 332 963 268', '', 0, '::1', '2019-09-07 22:51:53', '', 0, '2124747687', '0', 0, '', '', '', '', '2020-01-26 16:37:07', '2020-03-30 09:51:42', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
(24, 'dsdd', '', 'a@boom.com', 'dvds', '2', '$2y$10$Ag1P06TBBMM50igFwMDUs.zcRdlEkp3GkgV/BE8aSpEMIJqtbDYGG', '+456 787 65', '', 0, '::1', '', '', 0, '2147483647', '0', 0, '', '', '', '', '2020-01-26 16:37:07', '0000-00-00 00:00:00', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
(25, 'kjhgfd', '', 'v@boom.com', 'ghjhg', '4', '$2y$10$dfOfCsP8rfsB8iDzSTElcuFLlWcH3S3/RqOjLmrTGK./AZltMLBw2', '+567 897 654 ', '', 0, '::1', '', '', 0, '2111601879', '0', 0, '', '', '', '', '2020-01-26 16:37:07', '0000-00-00 00:00:00', '', '', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0),
(26, 'boobrr', NULL, 'user2@test.com', 'Julius32 Boom1', '102', '$2y$10$69Z26JFikl6HD5/2NqwGv.JztYOI9BNzezD7AY3jrELYc.CtbEXTO', '2345568333', NULL, 0, '::1', NULL, NULL, 0, '2590216976', '0', 0, NULL, NULL, NULL, NULL, '2020-01-31 08:21:20', '2020-02-01 11:15:56', 'YCGWL4', '7DZMKP', 1, 1, '2020-01-31 09:26:20', '2020-01-31 09:26:20', NULL, 0),
(27, 'boobee', NULL, 'freakboss3@gmail.com', 'Klaus ', '-51976', '$2y$10$Mu4K74ihiCpF8qyBKk58F.94ek4zqePxAdtkjXmr12aUOHfmNG4B6', '2345568555', NULL, 0, '::1', '2020-03-31 06:17:06', NULL, 0, '2740860446', '0', 0, NULL, NULL, NULL, NULL, '2020-01-31 08:24:59', '2020-04-23 08:00:13', 'PKQVTM', 'SNGJ46', 1, 1, '2020-01-31 09:29:59', '2020-01-31 09:29:59', NULL, 0),
(29, 'sdfdsvffdjhh', NULL, 'fnk@s.com', 'gdjhcgdvhcd', '2', '$2y$10$gJBL7.9f6HoCMEGJ3QfptuTuN4YG7TqKvFF0lnWMgb9VZ231cnFhW', '72655656754', NULL, 0, '::1', '2020-02-16 07:32:37', NULL, 0, '2667154802', '0000', 0, NULL, NULL, NULL, NULL, '2020-02-16 06:31:55', '2020-02-16 06:35:48', 'H5EMZP', 'CPRIPP', 1, 1, '2020-02-16 07:36:55', '2020-02-16 07:36:55', NULL, 0),
(30, 'trtrtr', NULL, 'h@s.com', 'freak', '2', '$2y$10$re64OostbTuv5bS1DYSWJ.qotfJpQZmLR/Qx9EzS3xkAdLzsewd.y', '67875536535', NULL, 0, '::1', NULL, NULL, 0, '2927287535', '0000', 0, NULL, NULL, NULL, NULL, '2020-03-31 10:14:48', '2020-03-31 10:15:28', '73KEG5', 'LLULRY', 1, 1, '2020-03-31 11:19:48', '2020-03-31 11:19:48', NULL, 0),
(31, 'test1234', NULL, 'test@test.com', 'Adekunle', '18700', '$2y$10$nVEdf3PGfdht3c4pd5blT.AOYFOYoYaNkaOxMwqRqgDHkSik4bM8S', '08056565656', NULL, 0, '::1', NULL, NULL, 0, '2195194439', '0000', 0, NULL, NULL, NULL, NULL, '2021-02-20 06:39:21', '2021-02-20 10:54:43', 'VO88PW', 'P0CFS4', 1, 1, '2021-02-20 07:44:21', '2021-02-20 07:44:21', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_address`
--

CREATE TABLE `wallet_address` (
  `id` int(32) NOT NULL,
  `coin_id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `address` varchar(128) NOT NULL,
  `date` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wallet_address`
--

INSERT INTO `wallet_address` (`id`, `coin_id`, `user_id`, `address`, `date`) VALUES
(10, 3, 1, '45678hfjk6789yughgjk8', '2019-07-28 22:04:33'),
(13, 3, 11, '45678hfjk6789yughgjk8', '2019-08-16 20:59:55'),
(14, 12, 11, '45678hfjk6789yughgjk8', '2019-09-15 21:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `winfo`
--

CREATE TABLE `winfo` (
  `id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `w_id` int(32) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `winfo`
--

INSERT INTO `winfo` (`id`, `user_id`, `w_id`, `details`) VALUES
(1, 10, 7, '5d687c278a3356ff31768421e77b9cdfd');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawm`
--

CREATE TABLE `withdrawm` (
  `id` int(32) NOT NULL,
  `method` varchar(128) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withdrawm`
--

INSERT INTO `withdrawm` (`id`, `method`, `status`, `created_at`, `updated_at`) VALUES
(10, 'Bitcoin	', 0, '2020-01-30 08:25:31', '0000-00-00 00:00:00'),
(11, 'Litecoin', 0, '2020-01-30 08:25:31', '0000-00-00 00:00:00'),
(12, 'Bitcoin Cash', 0, '2020-01-30 08:25:31', '0000-00-00 00:00:00'),
(14, 'Stellar', 1, '2020-02-09 14:12:15', '2020-02-09 13:12:15'),
(15, 'Dash', 1, '2020-02-09 14:12:25', '2020-02-09 13:12:25'),
(16, 'Paypal', 1, '2020-02-09 14:12:34', '2020-02-09 13:12:34'),
(17, 'Perfect money', 1, '2020-02-09 14:13:12', '2020-02-09 13:13:12'),
(18, 'Skrill', 1, '2020-02-09 14:13:07', '2020-02-09 13:13:07'),
(19, 'Payu', 1, '2020-02-09 14:13:02', '2020-02-09 13:13:02'),
(20, 'Voguepay', 1, '2020-02-09 14:12:58', '2020-02-09 13:12:58'),
(21, 'Flutter wave', 1, '2020-02-09 14:12:04', '2020-02-09 13:12:04'),
(22, 'Paystack', 1, '2020-02-09 14:03:58', '2020-02-09 13:03:58'),
(23, 'Ethereum', 1, '2020-02-09 13:11:46', '2020-02-09 13:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `w_history`
--

CREATE TABLE `w_history` (
  `id` int(32) NOT NULL,
  `reference` varchar(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  `amount` int(32) NOT NULL,
  `status` int(2) NOT NULL,
  `coin_id` varchar(32) NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `w_history`
--

INSERT INTO `w_history` (`id`, `reference`, `user_id`, `amount`, `status`, `coin_id`, `details`, `created_at`, `updated_at`) VALUES
(67, 'M2FLNRfjYhDWStB4', 11, 1000, 0, '16', 'support@boomchart.com.ng', '2020-03-30 08:04:33', '2020-03-30 07:04:33'),
(68, '1m0dcrG9mN0vieMI', 11, 3000, 0, '17', '123456677', '2020-03-30 12:35:58', '2020-03-30 12:35:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_site`
--
ALTER TABLE `about_site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_bank`
--
ALTER TABLE `admin_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference` (`reference`),
  ADD KEY `reference_2` (`reference`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_transfer`
--
ALTER TABLE `asset_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transfer`
--
ALTER TABLE `bank_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyer_log`
--
ALTER TABLE `buyer_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart`
--
ALTER TABLE `chart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etemplates`
--
ALTER TABLE `etemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchange_log`
--
ALTER TABLE `exchange_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ext_transfer`
--
ALTER TABLE `ext_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchant_key` (`merchant_key`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `internets`
--
ALTER TABLE `internets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `int_transfer`
--
ALTER TABLE `int_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `merchant_key` (`merchant_key`),
  ADD KEY `merchant_key_2` (`merchant_key`),
  ADD KEY `id` (`id`),
  ADD KEY `merchant_key_3` (`merchant_key`);

--
-- Indexes for table `networks`
--
ALTER TABLE `networks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `powers`
--
ALTER TABLE `powers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profits`
--
ALTER TABLE `profits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply_support`
--
ALTER TABLE `reply_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_log`
--
ALTER TABLE `seller_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tran_acct`
--
ALTER TABLE `tran_acct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trending`
--
ALTER TABLE `trending`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trending_cat`
--
ALTER TABLE `trending_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ui_design`
--
ALTER TABLE `ui_design`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_address`
--
ALTER TABLE `wallet_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `winfo`
--
ALTER TABLE `winfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawm`
--
ALTER TABLE `withdrawm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_history`
--
ALTER TABLE `w_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_bank`
--
ALTER TABLE `admin_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `asset_transfer`
--
ALTER TABLE `asset_transfer`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_transfer`
--
ALTER TABLE `bank_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `buyer_log`
--
ALTER TABLE `buyer_log`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `chart`
--
ALTER TABLE `chart`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `etemplates`
--
ALTER TABLE `etemplates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exchange_log`
--
ALTER TABLE `exchange_log`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ext_transfer`
--
ALTER TABLE `ext_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT for table `internets`
--
ALTER TABLE `internets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `int_transfer`
--
ALTER TABLE `int_transfer`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `networks`
--
ALTER TABLE `networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `powers`
--
ALTER TABLE `powers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `profits`
--
ALTER TABLE `profits`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `reply_support`
--
ALTER TABLE `reply_support`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `seller_log`
--
ALTER TABLE `seller_log`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tran_acct`
--
ALTER TABLE `tran_acct`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `trending`
--
ALTER TABLE `trending`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `trending_cat`
--
ALTER TABLE `trending_cat`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ui_design`
--
ALTER TABLE `ui_design`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wallet_address`
--
ALTER TABLE `wallet_address`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `winfo`
--
ALTER TABLE `winfo`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdrawm`
--
ALTER TABLE `withdrawm`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `w_history`
--
ALTER TABLE `w_history`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
