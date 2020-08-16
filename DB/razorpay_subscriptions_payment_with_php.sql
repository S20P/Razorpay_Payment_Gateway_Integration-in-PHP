-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 16, 2020 at 03:03 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `razorpay_subscriptions_payment_with_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL COMMENT 'PRIMARY_KEY',
  `plan_id` varchar(100) DEFAULT NULL,
  `name` varchar(255) NOT NULL COMMENT 'package name',
  `description` tinytext,
  `amount` varchar(200) NOT NULL DEFAULT '',
  `currency` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'plan' COMMENT 'plan',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0=inactive, 1=active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `plan_id`, `name`, `description`, `amount`, `currency`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Test', 'Description for the 7 days plan', '1000', 'INR', 'weekly', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, NULL, 'Test', 'Description for the 30 days plan', '2000', 'INR', 'monthly', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `plan_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscription_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `current_start` datetime NOT NULL,
  `current_end` datetime NOT NULL,
  `quantityd` int(11) NOT NULL DEFAULT '1',
  `currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `user_id`, `plan_id`, `subscription_id`, `current_start`, `current_end`, `quantityd`, `currency`, `payer_email`, `payment_status`) VALUES
(7, 0, 'plan_FRQpWT06XutSQS', 'sub_FRQpXCPYswaI2k', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'INR', '', 'created');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRIMARY_KEY', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
