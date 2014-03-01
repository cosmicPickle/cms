-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2014 at 10:19 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cms`
--
CREATE DATABASE IF NOT EXISTS `cms` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `cms`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `alias`) VALUES
(2, 'peelings'),
(3, 'cosmeceutics'),
(4, 'hair-mobile-prothesis'),
(5, 'hair-fixed-prothesis'),
(6, 'hair-meso-protocol'),
(7, 'vials-and-ampoules'),
(8, 'derma-rollers');

-- --------------------------------------------------------

--
-- Table structure for table `categories_lang`
--

CREATE TABLE IF NOT EXISTS `categories_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `categories_lang`
--

INSERT INTO `categories_lang` (`id`, `id_`, `locale`, `name`, `created_at`, `updated_at`) VALUES
(2, 2, 'en', 'Peelings', '2014-02-27 10:22:27', '2014-02-27 10:22:27'),
(3, 3, 'en', 'Cosmeceutics', '2014-02-27 10:22:27', '2014-02-27 10:22:27'),
(4, 4, 'en', 'Hair mobile prothesis', '2014-02-27 10:22:27', '2014-02-27 10:22:27'),
(5, 5, 'en', 'Hair fixed prothesis', '2014-02-27 10:22:27', '2014-02-27 10:22:27'),
(6, 6, 'en', 'Hair meso protocol', '2014-02-27 10:22:27', '2014-02-27 10:22:27'),
(7, 7, 'en', 'Vials and ampoules', '2014-02-27 10:22:27', '2014-02-27 10:22:27'),
(8, 8, 'en', 'DermaRollers', '2014-02-27 10:22:27', '2014-02-27 10:22:27');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `product_id`, `image`, `main`) VALUES
(5, 3, 'aging-peel-(principal).png', 1),
(6, 3, 'aging-peel-(vial).png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `images_lang`
--

CREATE TABLE IF NOT EXISTS `images_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `alias`) VALUES
(5, 'body-care\r\n'),
(3, 'hair-care'),
(6, 'light-systems\r\n'),
(1, 'main'),
(4, 'meso-care'),
(2, 'skin-care');

-- --------------------------------------------------------

--
-- Table structure for table `menus_lang`
--

CREATE TABLE IF NOT EXISTS `menus_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `menus_lang`
--

INSERT INTO `menus_lang` (`id`, `id_`, `locale`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Main menu', '2014-02-19 12:51:16', '2014-02-19 12:51:16'),
(2, 2, 'en', 'SKINcare', '2014-02-26 14:59:18', '2014-02-26 14:59:18'),
(3, 3, 'en', 'HAIRcare', '2014-02-26 14:59:18', '2014-02-26 14:59:18'),
(4, 4, 'en', 'MESOcare', '2014-02-26 14:59:39', '2014-02-26 14:59:39'),
(5, 5, 'en', 'BODYcare', '2014-02-26 14:59:39', '2014-02-26 14:59:39'),
(6, 6, 'en', 'LIGHTsystems', '2014-02-26 14:59:52', '2014-02-26 14:59:52');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `page` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page` (`page`),
  KEY `m_alias` (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `mid`, `page`, `order`) VALUES
(4, 1, 'trainings', 2),
(5, 1, 'centers', 3),
(6, 1, 'contacts', 8),
(8, 1, 'distributors', 6),
(9, 1, 'prices', 5),
(12, 1, 'treatments', 4),
(13, 1, 'about-us', 7),
(14, 1, 'products', 1),
(15, 2, 'peelings', 0),
(16, 2, 'cosmeceutics', 0),
(17, 2, 'lift-in-station-19-in-1', 0),
(18, 2, 'lift-in-oxygen', 0),
(19, 2, 'lift-in-rf', 0),
(20, 3, 'hair-mobile-prothesis', 0),
(21, 3, 'hair-fixed-prothesis', 0),
(22, 3, 'hair-meso-protocol', 0),
(23, 4, 'vials-and-ampoules', 0),
(24, 4, 'derma-rollers', 0),
(25, 4, 'mesobrase-7-in-1', 0),
(26, 4, 'dermagun-meso', 0),
(27, 5, 'liposculpt-cream', 0),
(28, 5, 'slim-in-sclupt', 0),
(29, 5, 'slim-in-cavisclupt', 0),
(30, 5, 'slim-in-presso', 0),
(31, 5, 'femin-in-sclupt', 0),
(32, 6, 'light-in-workstation', 0),
(33, 6, 'light-in-co2-frax', 0),
(34, 6, 'light-in-diode', 0),
(35, 6, 'light-in-pdt', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items_lang`
--

CREATE TABLE IF NOT EXISTS `menu_items_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `menu_items_lang`
--

INSERT INTO `menu_items_lang` (`id`, `id_`, `locale`, `title`, `created_at`, `updated_at`) VALUES
(2, 4, 'en', 'Trainings', '2014-02-25 15:18:23', '2014-02-25 15:40:44'),
(3, 5, 'en', 'Centers', '2014-02-25 15:19:47', '2014-02-25 15:40:50'),
(4, 6, 'en', 'Contacts', '2014-02-25 15:23:49', '2014-02-25 15:41:20'),
(5, 8, 'en', 'Distributors', '2014-02-25 15:24:16', '2014-02-25 15:41:12'),
(6, 9, 'en', 'Prices', '2014-02-25 15:24:47', '2014-02-25 15:41:02'),
(7, 12, 'en', 'Treatements', '2014-02-25 15:25:02', '2014-02-25 15:40:57'),
(8, 13, 'en', 'About us', '2014-02-25 15:25:16', '2014-02-25 15:41:17'),
(9, 14, 'en', 'Products\r\n', '2014-02-25 15:39:56', '2014-02-25 15:40:40'),
(10, 15, 'en', 'Peelings', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(11, 16, 'en', 'Cosmeceutics', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(12, 17, 'en', 'LIFT''in Station 19 in 1 ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(13, 18, 'en', 'LIFT''in Oxygen ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(14, 19, 'en', 'DUET RF ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(15, 20, 'en', 'Hair mobile prothesis', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(16, 21, 'en', 'Hair fixed prothesis', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(17, 22, 'en', 'Hair meso protocol', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(18, 23, 'en', 'Vials and ampoules', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(19, 24, 'en', 'DermaROLLERS', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(20, 25, 'en', 'MESOBRASE 7 in 1 ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(21, 26, 'en', 'DERMAGUN meso ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(22, 27, 'en', 'Liposculpt cream', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(23, 28, 'en', 'SLIM''in Sculpt ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(24, 29, 'en', 'SLIM''in CaviSculpt ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(25, 30, 'en', 'SLIM''in Presso ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(26, 31, 'en', 'FEMIN''in Sculpt ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(27, 32, 'en', 'LIGHT''in Workstation ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(28, 33, 'en', 'LIGHT''in CO2 Frax ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(29, 34, 'en', 'LIGHT''in Diode ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17'),
(30, 35, 'en', 'LIGHT''in PDT ™', '2014-02-26 15:11:17', '2014-02-26 15:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `tag`, `type`) VALUES
(1, 'P_FOUND', 'MSG_ERR'),
(2, 'E_UKNW', 'MSG_ERR'),
(3, 'P_NONE', 'MSG_NOT'),
(4, 'M_FOUND', 'MSG_ERR'),
(5, 'T_FOUND', 'MSG_ERR'),
(6, 'D_FOUND', 'MSG_ERR'),
(7, 'D_NONE', 'MSG_NOT'),
(8, 'MAIL_OK', 'MSG_OK'),
(9, 'MAIL_ERR', 'MSG_ERR');

-- --------------------------------------------------------

--
-- Table structure for table `messages_lang`
--

CREATE TABLE IF NOT EXISTS `messages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `messages_lang`
--

INSERT INTO `messages_lang` (`id`, `id_`, `locale`, `text`) VALUES
(1, 1, 'en', 'Page not found.'),
(2, 2, 'en', 'Uknown error has occured.'),
(3, 3, 'en', 'No pages matching the search criteria.'),
(4, 4, 'en', 'Module not found.'),
(5, 5, 'en', 'Table not found.'),
(6, 6, 'en', 'Entry not found.'),
(7, 7, 'en', 'There are no entries found.'),
(8, 8, 'en', 'The mail was send successfully.'),
(9, 9, 'en', 'There was an error sending your email. Please try again later.');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bundle` varchar(128) NOT NULL,
  `alias` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data_tables` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `bundle`, `alias`, `data_tables`) VALUES
(1, 'cart', 'products', '["products","categories","images"]'),
(2, 'ui', 'menu', '["menus","menu_items"]'),
(3, 'forms', 'contact', '');

-- --------------------------------------------------------

--
-- Table structure for table `modules_lang`
--

CREATE TABLE IF NOT EXISTS `modules_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `modules_lang`
--

INSERT INTO `modules_lang` (`id`, `id_`, `locale`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Products', 'This is the module that handles display of products.', '2014-02-17 13:23:35', '2014-02-21 13:19:48'),
(2, 2, 'en', 'Menu', 'This is the module that will handle displaying menus.', '2014-02-19 12:38:20', '2014-02-19 13:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `modules` text COLLATE utf8_unicode_ci NOT NULL,
  `layout` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `alias`, `modules`, `layout`) VALUES
(1, 'products', '[2]', '{{menu:main(id=1)}} \r\n{{menu:custom}} \r\n<content>'),
(2, 'trainings', '[2]', '{{menu:main(id=1)}} <content>'),
(3, 'centers', '[2]', '{{menu:main(id=1)}} <content>'),
(4, 'treatments', '[2]', '{{menu:main(id=1)}} <content>'),
(5, 'prices', '[2]', '{{menu:main(id=1)}} <content>'),
(6, 'distributors', '[2]', '{{menu:main(id=1)}} <content>'),
(7, 'about-us', '[2]', '{{menu:main(id=1)}} <content>'),
(8, 'contacts', '[2,3]', '{{menu:main(id=1)}} {{contact:default}} <content>'),
(9, 'peelings', '[1,2]', '{{menu:main(id=1)}}{{products:listing(category=2)}}<content>'),
(10, 'cosmeceutics', '[1,2]', '{{menu:main(id=1)}} <content>'),
(11, 'lift-in-station-19-in-1', '[2]', '{{menu:main(id=1)}} <content>'),
(12, 'lift-in-oxygen', '[2]', '{{menu:main(id=1)}} <content>'),
(13, 'lift-in-rf', '[2]', '{{menu:main(id=1)}} <content>'),
(14, 'hair-mobile-prothesis', '[1,2]', '{{menu:main(id=1)}} <content>'),
(15, 'hair-fixed-prothesis', '[1,2]', '{{menu:main(id=1)}} <content>'),
(16, 'hair-meso-protocol', '[1,2]', '{{menu:main(id=1)}} <content>'),
(17, 'vials-and-ampoules', '[1,2]', '{{menu:main(id=1)}} <content>'),
(18, 'derma-rollers', '[1,2]', '{{menu:main(id=1)}} <content>'),
(19, 'mesobrase-7-in-1', '[2]', '{{menu:main(id=1)}} <content>'),
(20, 'dermagun-meso', '[2]', '{{menu:main(id=1)}} <content>'),
(21, 'liposculpt-cream', '[2]', '{{menu:main(id=1)}} <content>'),
(22, 'slim-in-sclupt', '[2]', '{{menu:main(id=1)}} <content>'),
(23, 'slim-in-cavisclupt', '[2]', '{{menu:main(id=1)}} <content>'),
(24, 'slim-in-presso', '[2]', '{{menu:main(id=1)}} <content>'),
(25, 'femin-in-sclupt', '[2]', '{{menu:main(id=1)}} <content>'),
(26, 'light-in-workstation', '[2]', '{{menu:main(id=1)}} <content>'),
(27, 'light-in-co2-frax', '[2]', '{{menu:main(id=1)}} <content>'),
(28, 'light-in-diode', '[2]', '{{menu:main(id=1)}} <content>'),
(29, 'light-in-pdt', '[2]', '{{menu:main(id=1)}} <content>');

-- --------------------------------------------------------

--
-- Table structure for table `pages_lang`
--

CREATE TABLE IF NOT EXISTS `pages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pages_id` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Dumping data for table `pages_lang`
--

INSERT INTO `pages_lang` (`id`, `id_`, `locale`, `title`, `keywords`, `description`, `content`, `created_at`, `updated_at`) VALUES
(3, 1, 'en', 'Home page', 'home,page,cms', 'Home page description', '', '2014-02-17 11:22:06', '2014-02-27 10:44:31'),
(5, 2, 'en', 'Trainings', 'TODO', 'TODO', '', '2014-02-25 15:01:49', '2014-02-27 09:41:33'),
(6, 3, 'en', 'Centers', 'TODO', 'TODO', '', '2014-02-25 15:01:49', '2014-02-27 09:41:33'),
(7, 4, 'en', 'Treatments', 'TODO', 'TODO', '', '2014-02-25 15:02:46', '2014-02-27 09:41:33'),
(8, 5, 'en', 'Prices', 'TODO', 'TODO', '', '2014-02-25 15:02:46', '2014-02-27 09:41:33'),
(9, 6, 'en', 'Distributors', 'TODO', 'TODO', '', '2014-02-25 15:03:19', '2014-02-27 09:41:33'),
(10, 7, 'en', 'About us', 'TODO', 'TODO', '', '2014-02-25 15:03:19', '2014-02-27 09:41:33'),
(11, 8, 'en', 'Contacts', 'TODO', 'TODO', '', '2014-02-25 15:04:30', '2014-02-27 09:41:33'),
(12, 9, 'en', 'Peelings', 'TODO', 'TODO', '', '2014-02-25 15:04:30', '2014-02-27 09:41:33'),
(13, 10, 'en', 'Cosmeceutics', 'TODO', 'TODO', '', '2014-02-25 15:05:03', '2014-02-27 09:41:33'),
(16, 11, 'en', 'LIFT''in Station 19 in 1 ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(17, 12, 'en', 'LIFT''in Oxygen ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(18, 13, 'en', 'DUET RF ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(19, 14, 'en', 'Hair mobile prothesis', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(20, 15, 'en', 'Hair fixed prothesis', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(21, 16, 'en', 'Hair meso protocol', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(22, 17, 'en', 'Vials and ampoules', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(23, 18, 'en', 'DermaROLLERS', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(24, 19, 'en', 'MESOBRASE 7 in 1 ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(25, 20, 'en', 'DERMAGUN meso ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(26, 21, 'en', 'Liposculpt cream', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(27, 22, 'en', 'SLIM''in Sculpt ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(28, 23, 'en', 'SLIM''in CaviSculpt ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(29, 24, 'en', 'SLIM''in Presso ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(30, 25, 'en', 'FEMIN''in Sculpt ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(31, 26, 'en', 'LIGHT''in Workstation ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(32, 27, 'en', 'LIGHT''in CO2 Frax ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(33, 28, 'en', 'LIGHT''in Diode ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33'),
(34, 29, 'en', 'LIGHT''in PDT ™', 'TODO', 'TODO', '', '2014-02-26 14:33:50', '2014-02-27 09:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `video` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `video`) VALUES
(3, 2, 'http://www.youtube.com/watch?v=8pw4UCk7YAk');

-- --------------------------------------------------------

--
-- Table structure for table `products_lang`
--

CREATE TABLE IF NOT EXISTS `products_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `products_lang`
--

INSERT INTO `products_lang` (`id`, `id_`, `locale`, `title`, `description`, `created_at`, `updated_at`) VALUES
(3, 3, 'en', 'Aging peel', 'PROPERTIES\r\nAging peel is a chemoexfoliant combining pyruvic and lactic acid in a gellified hydroalcoholic solution at pH‹1.0. After the application of Aging peel the skin increases in luminosity, softness and brilliance.\r\nPyruvic acid is an alpha-keto acid with keratolytic, antimicrobial and sebostatic characteristics. Its high acidity and small molecular size enable it easily penetrate the skin particularly lipophilic areas.\r\nLactic acid is a keratolytic which causes thickening of epidermis and dermis thereby increasing hyaluronic acid concentration in the extracellular matrix, thus giving the skin firmness and hydration.\r\nINDICATIONS \r\nIndicated for the treatment of skins with aging signs like fine and deep wrinkles or hyperpigmentations. It is also useful for treating acne, actinic and fine seborrheic keratosis. Aging peel is recommended for Fitzpatrick phototypes I to IV. The professional shall assess the suitability of application on patients with phototypes V and VI.\r\nHOW TO USE\r\nOn celan dry skin, apply degreasing solution to eliminate the acid mantle. RAHAL Skincare® Pre-peel Degreasing solution is recommended. Protect eyes wit gauze soaked in water prior to applying Aging peel. Contact lens users should remove lenses prior to treatment. \r\nPour 2,5ml into the dose cup and gently apply the peeling with a cotton ball over the area of skin to be treated, distributing it homogenously. Recommended application time of Aging peel is 3 minutes maximum. Under no circumstance should treatment be prolonged should patient start suffering from a generalised intense itching or severe discomfort. Aging peel may also be applied to the body with 3 minutes maximum exposure, except the neck which is 2 minutes.\r\nOnce time is up, wash skin with abundant water and apply DR. RAHAL Skincare® neutralising solution Post peel Solution. Spray treated area generously; leave to act for a few minutes then wash area with saline solution or cold water. \r\n48 hours after treatment, the patient may wash the area with a mild syndet. Daily application of high SPF photoprotectors against UVA and UVB radiation is compulsory 48 hours after the peeling session and for at least six months after treatment completion. RAHAL Skincare® Dermatological Sunscreen SPF50 is particularly indicated for this function.\r\nAfter the peeling, the application of dermocesmetics like DR. RAHAL Skincare® Post procedure Skin Repair, which smoothes and regenerates the skin is essential to favour re-epithelialisation and hydration.\r\nTREATMENT CYCLE: Application protocol is a cycle of six successive applications with a 2 week rest period depending on individual’s skin type and characteristics. An annual application recommended as maintenance.\r\n', '2014-02-27 12:56:19', '2014-02-27 12:56:19');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories_lang`
--
ALTER TABLE `categories_lang`
  ADD CONSTRAINT `categories_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `categories_lang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images_lang`
--
ALTER TABLE `images_lang`
  ADD CONSTRAINT `images_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus_lang`
--
ALTER TABLE `menus_lang`
  ADD CONSTRAINT `menus_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_2` FOREIGN KEY (`page`) REFERENCES `pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_items_ibfk_3` FOREIGN KEY (`mid`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items_lang`
--
ALTER TABLE `menu_items_lang`
  ADD CONSTRAINT `menu_items_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages_lang`
--
ALTER TABLE `messages_lang`
  ADD CONSTRAINT `messages_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modules_lang`
--
ALTER TABLE `modules_lang`
  ADD CONSTRAINT `modules_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pages_lang`
--
ALTER TABLE `pages_lang`
  ADD CONSTRAINT `pages_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_lang`
--
ALTER TABLE `products_lang`
  ADD CONSTRAINT `products_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
