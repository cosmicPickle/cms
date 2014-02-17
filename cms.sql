-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Време на генериране: 
-- Версия на сървъра: 5.6.12-log
-- Версия на PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- БД: `cms`
--
CREATE DATABASE IF NOT EXISTS `cms` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `cms`;

-- --------------------------------------------------------

--
-- Структура на таблица `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Схема на данните от таблица `messages`
--

INSERT INTO `messages` (`id`, `tag`, `type`, `text`) VALUES
(1, 'P_FOUND', 'MSG_ERR', 'Page not found.'),
(2, 'E_UKNW', 'MSG_ERR', 'An uknown error has occured.');

-- --------------------------------------------------------

--
-- Структура на таблица `messages_lang`
--

CREATE TABLE IF NOT EXISTS `messages_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_` int(11) NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_` (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура на таблица `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `modules` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Схема на данните от таблица `pages`
--

INSERT INTO `pages` (`id`, `alias`, `title`, `keywords`, `description`, `template`, `content`, `modules`, `created_at`, `updated_at`) VALUES
(1, 'home-page', 'Home page', 'home,page,cms', 'This is the home page of the cms', 'layout', '<b> This is a content </b>', 'products', '2014-02-15 11:40:25', '2014-02-16 10:53:46');

-- --------------------------------------------------------

--
-- Структура на таблица `pages_lang`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `messages_lang`
--
ALTER TABLE `messages_lang`
  ADD CONSTRAINT `messages_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `messages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения за таблица `pages_lang`
--
ALTER TABLE `pages_lang`
  ADD CONSTRAINT `pages_lang_ibfk_1` FOREIGN KEY (`id_`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
