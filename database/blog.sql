-- Adminer 4.8.1 MySQL 5.5.5-10.5.13-MariaDB-0ubuntu0.21.10.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `Blog`;
CREATE DATABASE `Blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `Blog`;

DROP TABLE IF EXISTS `ARTICLES`;
CREATE TABLE `ARTICLES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(45) NOT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `CONTENT` longtext NOT NULL,
  `IMPORTANCE_LEVEL` int(11) NOT NULL DEFAULT 0 COMMENT 'Niveau d''importance de l''article, à 0 par défaut. Il peut être défini par l''auteur entre 1 et 5.',
  `AUTHORS_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_ARTICLES_AUTHORS_idx` (`AUTHORS_ID`),
  CONSTRAINT `fk_ARTICLES_AUTHORS` FOREIGN KEY (`AUTHORS_ID`) REFERENCES `AUTHORS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ARTICLES` (`ID`, `TITLE`, `START_DATE`, `END_DATE`, `CONTENT`, `IMPORTANCE_LEVEL`, `AUTHORS_ID`) VALUES
(1,	'PHP, c\'est bien',	'2021-12-02 13:18:24',	'2021-12-02 13:18:24',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	3,	1),
(2,	'Le sport, c\'est bon pour toi',	'2022-01-01 13:19:03',	'2022-01-15 13:19:03',	'Le biathlon, c\'est fatigant.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	1,	2),
(3,	'L\'administration de BDD, c\'est casse-couilles',	'2022-04-16 13:19:31',	'2022-04-30 13:19:31',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	3,	3),
(4,	'L\'aglo, c\'est important',	'2022-02-01 13:20:00',	'2022-02-07 13:20:00',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	5,	4),
(5,	'Java, c\'est bien',	'2022-05-07 13:20:31',	'2022-05-07 23:59:00',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	2,	5),
(6,	'Adminer, c\'est pratique',	'2022-06-01 13:21:06',	'2022-06-15 13:21:06',	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',	0,	8);

DROP TABLE IF EXISTS `AUTHORS`;
CREATE TABLE `AUTHORS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ALIAS` varchar(45) NOT NULL,
  `LAST_NAME` varchar(45) NOT NULL,
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AUTHOR_ALIAS_UNIQUE` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `AUTHORS` (`ID`, `ALIAS`, `LAST_NAME`, `FIRST_NAME`) VALUES
(1,	'Asterix',	'Hugo',	'Victor'),
(2,	'Superman',	'Milward',	'Richard'),
(3,	'Lucky Luke',	'Hemingway',	'Ernest'),
(4,	'Garfield',	'Martin',	'George'),
(5,	'Snoopy',	'Shelley',	'Mary'),
(6,	'Tintin',	'Asimov',	'Isaac'),
(7,	'Splinter',	'Hesse',	'Herman'),
(8,	'Matéo',	'Orwell',	'George'),
(9,	'Valentine',	'Sand',	'George');

DROP TABLE IF EXISTS `CATEGORIES`;
CREATE TABLE `CATEGORIES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `CATEGORIES` (`ID`, `NAME`) VALUES
(1,	'Loisirs'),
(2,	'PHP'),
(3,	'MySQL'),
(4,	'Algo'),
(5,	'Java');

DROP TABLE IF EXISTS `CATEGORIES_has_ARTICLES`;
CREATE TABLE `CATEGORIES_has_ARTICLES` (
  `CATEGORIES_ID` int(11) NOT NULL,
  `ARTICLES_ID` int(11) NOT NULL,
  PRIMARY KEY (`CATEGORIES_ID`,`ARTICLES_ID`),
  KEY `fk_CATEGORIES_has_ARTICLES_ARTICLES1_idx` (`ARTICLES_ID`),
  KEY `fk_CATEGORIES_has_ARTICLES_CATEGORIES1_idx` (`CATEGORIES_ID`),
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_ARTICLES1` FOREIGN KEY (`ARTICLES_ID`) REFERENCES `ARTICLES` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_CATEGORIES1` FOREIGN KEY (`CATEGORIES_ID`) REFERENCES `CATEGORIES` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `CATEGORIES_has_ARTICLES` (`CATEGORIES_ID`, `ARTICLES_ID`) VALUES
(1,	2),
(2,	1),
(3,	3),
(3,	6),
(4,	4),
(5,	5);

DROP TABLE IF EXISTS `COMMENTS`;
CREATE TABLE `COMMENTS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `CONTENT` longtext NOT NULL,
  `AUTHORS_ID` int(11) NOT NULL,
  `ARTICLES_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_COMMENTS_AUTHORS1_idx` (`AUTHORS_ID`),
  KEY `fk_COMMENTS_ARTICLES1_idx` (`ARTICLES_ID`),
  CONSTRAINT `fk_COMMENTS_ARTICLES1` FOREIGN KEY (`ARTICLES_ID`) REFERENCES `ARTICLES` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMMENTS_AUTHORS1` FOREIGN KEY (`AUTHORS_ID`) REFERENCES `AUTHORS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `COMMENTS` (`ID`, `DATE`, `CONTENT`, `AUTHORS_ID`, `ARTICLES_ID`) VALUES
(1,	'2022-02-02 10:45:14',	'C\'est moi qui ai écrit cet article',	8,	6),
(2,	'2022-02-02 10:46:48',	'Bravo!',	3,	2),
(3,	'2022-02-02 10:47:05',	'Sans avis',	4,	1),
(4,	'2022-02-02 10:47:16',	'Sans avis',	9,	6),
(5,	'2022-02-02 10:49:57',	'Cool',	9,	3),
(6,	'2022-02-02 10:53:11',	'Je partage votre avis, mais convenez qu\'il ne s\'applique que dans le paradigme précis d\'un néo-libéralisme modéré à fort et qu\'un changement d\'axiome - au niveau politique aussi bien qu\'économique - pourrait aussi bien rendre cette hypothèse caduque. \r\nBien à vous, biatch!',	4,	5);

-- 2022-02-03 09:12:06
