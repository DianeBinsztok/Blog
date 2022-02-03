-- Adminer 4.8.1 MySQL 5.5.5-10.5.13-MariaDB-0ubuntu0.21.10.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `Blog`;
CREATE DATABASE `Blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `Blog`;

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `content` longtext NOT NULL,
  `importance_level` int(11) NOT NULL DEFAULT 0 COMMENT 'Niveau d''importance de l''article, à 0 par défaut. Il peut être défini par l''auteur entre 1 et 5.',
  `authors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ARTICLES_AUTHORS_idx` (`authors_id`),
  CONSTRAINT `fk_ARTICLES_AUTHORS` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `articles` (`id`, `title`, `start_date`, `end_date`, `content`, `importance_level`, `authors_id`) VALUES
(1,	'PHP, c\'est bien',	'2021-12-02 13:18:24',	'2021-12-02 13:18:24',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	3,	1),
(2,	'Le sport, c\'est bon pour toi',	'2022-01-01 13:19:03',	'2022-01-15 13:19:03',	'Le biathlon, c\'est fatigant.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	1,	2),
(3,	'L\'administration de BDD, c\'est casse-couilles',	'2022-04-16 13:19:31',	'2022-04-30 13:19:31',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	3,	3),
(4,	'L\'aglo, c\'est important',	'2022-02-01 13:20:00',	'2022-02-07 13:20:00',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	5,	4),
(5,	'Java, c\'est bien',	'2022-05-07 13:20:31',	'2022-05-07 23:59:00',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	2,	5),
(6,	'Adminer, c\'est pratique',	'2022-06-01 13:21:06',	'2022-06-15 13:21:06',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	0,	8);

DROP TABLE IF EXISTS `articles_has_categories`;
CREATE TABLE `articles_has_categories` (
  `categories_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`categories_id`,`articles_id`),
  KEY `fk_CATEGORIES_has_ARTICLES_ARTICLES1_idx` (`articles_id`),
  KEY `fk_CATEGORIES_has_ARTICLES_CATEGORIES1_idx` (`categories_id`),
  CONSTRAINT `articles_has_categories_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `articles_has_categories_ibfk_2` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_ARTICLES1` FOREIGN KEY (`ARTICLES_ID`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_CATEGORIES1` FOREIGN KEY (`CATEGORIES_ID`) REFERENCES `CATEGORIES` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `articles_has_categories` (`categories_id`, `articles_id`) VALUES
(1,	2),
(2,	1),
(3,	3),
(3,	6),
(4,	4),
(5,	5);

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AUTHOR_ALIAS_UNIQUE` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `authors` (`id`, `alias`, `last_name`, `first_name`) VALUES
(1,	'Asterix',	'Hugo',	'Victor'),
(2,	'Superman',	'Milward',	'Richard'),
(3,	'Lucky Luke',	'Hemingway',	'Ernest'),
(4,	'Garfield',	'Martin',	'George'),
(5,	'Snoopy',	'Shelley',	'Mary'),
(6,	'Tintin',	'Asimov',	'Isaac'),
(7,	'Splinter',	'Hesse',	'Herman'),
(8,	'Matéo',	'Orwell',	'George'),
(9,	'Valentine',	'Sand',	'George');

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id`) REFERENCES `articles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`id`, `name`) VALUES
(1,	'Loisirs'),
(2,	'PHP'),
(3,	'MySQL'),
(4,	'Algo'),
(5,	'Java');

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `content` longtext NOT NULL,
  `authors_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_COMMENTS_AUTHORS1_idx` (`authors_id`),
  KEY `fk_COMMENTS_ARTICLES1_idx` (`articles_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `fk_COMMENTS_ARTICLES1` FOREIGN KEY (`ARTICLES_ID`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMMENTS_AUTHORS1` FOREIGN KEY (`AUTHORS_ID`) REFERENCES `authors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `comments` (`id`, `date`, `content`, `authors_id`, `articles_id`) VALUES
(1,	'2022-02-02 10:45:14',	'C\'est moi qui ai écrit cet article',	8,	6),
(2,	'2022-02-02 10:46:48',	'Bravo!',	3,	2),
(3,	'2022-02-02 10:47:05',	'Sans avis',	4,	1),
(4,	'2022-02-02 10:47:16',	'Sans avis',	9,	6),
(5,	'2022-02-02 10:49:57',	'Cool',	9,	3),
(6,	'2022-02-02 10:53:11',	'Je partage votre avis, mais convenez qu\'il ne s\'applique que dans le paradigme précis d\'un néo-libéralisme modéré à fort et qu\'un changement d\'axiome - au niveau politique aussi bien qu\'économique - pourrait aussi bien rendre cette hypothèse caduque. \r\nBien à vous, biatch!',	4,	5);

-- 2022-02-03 09:29:13
