-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 25, 2014 at 07:00 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `alias`) VALUES
(1, 'psybient');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `categories_lang`
--

INSERT INTO `categories_lang` (`id`, `id_`, `locale`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Psybient Albums', '2014-02-24 17:46:28', '2014-02-24 17:46:28');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `product_id`, `image`) VALUES
(1, 1, 'image1.png'),
(2, 1, 'images2.png'),
(3, 1, 'image3.png'),
(4, 2, 'image4.png');

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

--
-- Dumping data for table `images_lang`
--

INSERT INTO `images_lang` (`id`, `id_`, `locale`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Image 1', '2014-02-24 18:32:24', '2014-02-24 18:32:24'),
(2, 2, 'en', 'Image 2', '2014-02-24 18:32:24', '2014-02-24 18:32:24'),
(3, 3, 'en', 'Image 3', '2014-02-24 18:32:24', '2014-02-24 18:32:24'),
(4, 4, 'en', 'Image 4', '2014-02-24 18:32:24', '2014-02-24 18:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `alias`) VALUES
(1, 'main');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `menus_lang`
--

INSERT INTO `menus_lang` (`id`, `id_`, `locale`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Main menu', '2014-02-19 12:51:16', '2014-02-19 12:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `page` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page` (`page`),
  KEY `m_alias` (`mid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `mid`, `page`) VALUES
(4, 1, 'trainings'),
(5, 1, 'centers'),
(6, 1, 'contacts'),
(8, 1, 'distributors'),
(9, 1, 'prices'),
(12, 1, 'treatments'),
(13, 1, 'about-us'),
(14, 1, 'products');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items_lang`
--

CREATE TABLE IF NOT EXISTS `menu_items_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `menu_items_lang`
--

INSERT INTO `menu_items_lang` (`id`, `id_`, `locale`, `title`, `order`, `created_at`, `updated_at`) VALUES
(2, 4, 'en', 'Trainings', 2, '2014-02-25 15:18:23', '2014-02-25 15:40:44'),
(3, 5, 'en', 'Centers', 3, '2014-02-25 15:19:47', '2014-02-25 15:40:50'),
(4, 6, 'en', 'Contacts', 8, '2014-02-25 15:23:49', '2014-02-25 15:41:20'),
(5, 8, 'en', 'Distributors', 6, '2014-02-25 15:24:16', '2014-02-25 15:41:12'),
(6, 9, 'en', 'Prices', 5, '2014-02-25 15:24:47', '2014-02-25 15:41:02'),
(7, 12, 'en', 'Treatements', 4, '2014-02-25 15:25:02', '2014-02-25 15:40:57'),
(8, 13, 'en', 'About us', 7, '2014-02-25 15:25:16', '2014-02-25 15:41:17'),
(9, 14, 'en', 'Products\r\n', 1, '2014-02-25 15:39:56', '2014-02-25 15:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

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
(7, 'D_NONE', 'MSG_NOT');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

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
(7, 7, 'en', 'There are no entries found.');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `bundle`, `alias`, `data_tables`) VALUES
(1, 'cart', 'products', '["products","categories","images"]'),
(2, 'ui', 'menu', '["menus","menu_items"]');

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
  PRIMARY KEY (`id`),
  KEY `alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `alias`, `modules`) VALUES
(1, 'products', '[2]'),
(2, 'trainings', '[2]'),
(3, 'centers', '[2]'),
(4, 'treatments', '[2]'),
(5, 'prices', '[2]'),
(6, 'distributors', '[2]'),
(7, 'about-us', '[2]'),
(8, 'contacts', '[2]'),
(9, 'peelings', '[1,2]'),
(10, 'cosmeceutics', '[1,2]');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `pages_lang`
--

INSERT INTO `pages_lang` (`id`, `id_`, `locale`, `title`, `keywords`, `description`, `content`, `created_at`, `updated_at`) VALUES
(3, 1, 'en', 'Home page', 'home,page,cms', 'Home page description', '{{menu:main(id=1)}}\r\n\r\n{{menu:partial(id=2)}}\r\n\r\n{{menu:partial(id=3)}}\r\n\r\n{{menu:partial(id=4)}}\r\n\r\n{{menu:partial(id=5)}}\r\n\r\n{{menu:partial(id=6)}}', '2014-02-17 11:22:06', '2014-02-25 15:46:28'),
(5, 2, 'en', 'Trainings', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:01:49', '2014-02-25 15:25:34'),
(6, 3, 'en', 'Centers', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:01:49', '2014-02-25 15:25:37'),
(7, 4, 'en', 'Treatments', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:02:46', '2014-02-25 15:25:39'),
(8, 5, 'en', 'Prices', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:02:46', '2014-02-25 15:25:42'),
(9, 6, 'en', 'Distributors', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:03:19', '2014-02-25 15:25:44'),
(10, 7, 'en', 'About us', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:03:19', '2014-02-25 15:25:47'),
(11, 8, 'en', 'Contacts', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:04:30', '2014-02-25 15:25:48'),
(12, 9, 'en', 'Peelings', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:04:30', '2014-02-25 15:25:51'),
(13, 10, 'en', 'Cosmeceutics', 'TODO', 'TODO', '{{menu:main(id=1)}}', '2014-02-25 15:05:03', '2014-02-25 15:25:53');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `video`) VALUES
(1, 1, 'http://www.youtube.com/watch?v=9TVnnh3g-pw'),
(2, 1, 'http://www.youtube.com/watch?v=jz5QpiipaEQ');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `products_lang`
--

INSERT INTO `products_lang` (`id`, `id_`, `locale`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Supernatural Vibes', 'Psychill/Downtempo/ambient/psybient mix', '2014-02-24 17:38:06', '2014-02-24 17:38:06'),
(2, 2, 'en', 'Digital Love', 'Psychill/Downtempo/ambient/psybient mix', '2014-02-24 18:34:26', '2014-02-24 18:34:26');

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
