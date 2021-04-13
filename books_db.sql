-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.22 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for books_db
CREATE DATABASE IF NOT EXISTS `books_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `books_db`;

-- Dumping structure for table books_db.book_tb
CREATE TABLE IF NOT EXISTS `book_tb` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(200) NOT NULL DEFAULT 'some',
  `category_id` int NOT NULL DEFAULT '0',
  `writer_id` int NOT NULL DEFAULT '0',
  `publication_year` varchar(50) NOT NULL DEFAULT 'some',
  `img_url` varchar(50) NOT NULL DEFAULT 'some',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table books_db.book_tb: ~0 rows (approximately)
/*!40000 ALTER TABLE `book_tb` DISABLE KEYS */;
INSERT INTO `book_tb` (`book_id`, `book_name`, `category_id`, `writer_id`, `publication_year`, `img_url`) VALUES
	(1, 'The Stuble Art of Not Giving F*ck', 3, 8, '2018', 'stuble-art-of-no-give.jpg'),
	(3, 'The Badass Mafia Queen', 1, 3, '2012', 'sample-cover.jpg'),
	(4, 'Old Book Bilble', 5, 5, '1190', 'cover-bible.jpg'),
	(5, 'Belajar Kotlin', 2, 2, '2018', 'kotlinbook.jpg'),
	(6, 'Book Title: Tagline Goes Here', 3, 1, '2011', 'sampling-book-cover.png'),
	(7, 'Belajar VSCode', 2, 2, '2018', 'vs-code.jpg'),
	(8, 'Atasi Malasmu Dengan Buku INI!', 3, 1, '2021', 'my-book-cover.jpg');
/*!40000 ALTER TABLE `book_tb` ENABLE KEYS */;

-- Dumping structure for table books_db.category_tb
CREATE TABLE IF NOT EXISTS `category_tb` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT 'Some Book',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table books_db.category_tb: ~12 rows (approximately)
/*!40000 ALTER TABLE `category_tb` DISABLE KEYS */;
INSERT INTO `category_tb` (`category_id`, `category_name`) VALUES
	(1, 'Novel'),
	(2, 'Teknologi'),
	(3, 'Self Development'),
	(4, 'Sejarah'),
	(5, 'Religion'),
	(6, 'Entertainment'),
	(7, 'Shoping'),
	(8, 'Inggris'),
	(9, 'Majalah'),
	(10, 'Koran'),
	(11, 'Kitab'),
	(12, 'Biografi');
/*!40000 ALTER TABLE `category_tb` ENABLE KEYS */;

-- Dumping structure for table books_db.writer_tb
CREATE TABLE IF NOT EXISTS `writer_tb` (
  `writer_id` int NOT NULL AUTO_INCREMENT,
  `writter_name` varchar(50) NOT NULL DEFAULT 'Some Name',
  PRIMARY KEY (`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table books_db.writer_tb: ~6 rows (approximately)
/*!40000 ALTER TABLE `writer_tb` DISABLE KEYS */;
INSERT INTO `writer_tb` (`writer_id`, `writter_name`) VALUES
	(1, 'Joshua Chistianto'),
	(2, 'Indrico Jowensen'),
	(3, 'Evelyn Natania'),
	(4, 'Hayam Wuruk'),
	(5, 'Bernadette IV'),
	(8, 'Mark Manson'),
	(9, 'Garit Dewana');
/*!40000 ALTER TABLE `writer_tb` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
