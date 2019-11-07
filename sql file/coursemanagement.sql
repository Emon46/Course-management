-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 07, 2019 at 08:58 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coursemanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `email`, `password`) VALUES
('admin', 'admin@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

-- --------------------------------------------------------

--
-- Table structure for table `courselist`
--

DROP TABLE IF EXISTS `courselist`;
CREATE TABLE IF NOT EXISTS `courselist` (
  `course_name` varchar(30) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `assign_teacher_name` varchar(30) NOT NULL,
  `assign_teacher_mail` varchar(50) NOT NULL,
  PRIMARY KEY (`course_code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courselist`
--

INSERT INTO `courselist` (`course_name`, `course_code`, `assign_teacher_name`, `assign_teacher_mail`) VALUES
('web eng', 'cse433', 'md sadek ferdous', 'sadek@gmail.com'),
('data', 'cse240', 'sadek', 'sadek@gmal.com'),
('nem', 'cse233', 'aysha', 'aysha@gmail.com'),
('c++', 'cse134', 'enam', 'enam@gmail.com'),
('java', 'cse333', 'saif', 'saif@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `cse134`
--

DROP TABLE IF EXISTS `cse134`;
CREATE TABLE IF NOT EXISTS `cse134` (
  `student_name` varchar(50) NOT NULL,
  `student_reg` varchar(30) NOT NULL,
  PRIMARY KEY (`student_reg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cse134`
--

INSERT INTO `cse134` (`student_name`, `student_reg`) VALUES
('shoumik', '331038'),
('emon', '331046');

-- --------------------------------------------------------

--
-- Table structure for table `cse233`
--

DROP TABLE IF EXISTS `cse233`;
CREATE TABLE IF NOT EXISTS `cse233` (
  `student_name` varchar(50) NOT NULL,
  `student_reg` varchar(30) NOT NULL,
  PRIMARY KEY (`student_reg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cse233`
--

INSERT INTO `cse233` (`student_name`, `student_reg`) VALUES
('shoumik', '331038'),
('akash', '2015331055');

-- --------------------------------------------------------

--
-- Table structure for table `cse240`
--

DROP TABLE IF EXISTS `cse240`;
CREATE TABLE IF NOT EXISTS `cse240` (
  `student_name` varchar(50) NOT NULL,
  `student_reg` varchar(30) NOT NULL,
  PRIMARY KEY (`student_reg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cse240`
--

INSERT INTO `cse240` (`student_name`, `student_reg`) VALUES
('akash', '2015331055');

-- --------------------------------------------------------

--
-- Table structure for table `cse333`
--

DROP TABLE IF EXISTS `cse333`;
CREATE TABLE IF NOT EXISTS `cse333` (
  `student_name` varchar(50) NOT NULL,
  `student_reg` varchar(30) NOT NULL,
  PRIMARY KEY (`student_reg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cse333`
--

INSERT INTO `cse333` (`student_name`, `student_reg`) VALUES
('shoumik', '331038'),
('emon', '331046');

-- --------------------------------------------------------

--
-- Table structure for table `cse433`
--

DROP TABLE IF EXISTS `cse433`;
CREATE TABLE IF NOT EXISTS `cse433` (
  `student_name` varchar(30) NOT NULL,
  `student_reg` varchar(30) NOT NULL,
  PRIMARY KEY (`student_reg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cse433`
--

INSERT INTO `cse433` (`student_name`, `student_reg`) VALUES
('shoumik', '331038'),
('emon', '331046'),
('akash', '2015331055');

-- --------------------------------------------------------

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
CREATE TABLE IF NOT EXISTS `management` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_name` varchar(30) NOT NULL,
  `course_code` varchar(30) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `student_reg` varchar(50) NOT NULL,
  `assign_teacher` varchar(50) NOT NULL,
  `assign_teacher_mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`id`, `course_name`, `course_code`, `student_name`, `student_reg`, `assign_teacher`, `assign_teacher_mail`) VALUES
(8, 'web eng', 'cse433', 'emon', '331046', 'md sadek ferdous', 'sadek@gmail.com'),
(9, 'java', 'cse333', 'emon', '331046', 'saif', 'saif@gmail.com'),
(7, 'c++', 'cse134', 'emon', '331046', 'enam', 'enam@gmail.com'),
(10, 'web eng', 'cse433', 'akash', '2015331055', 'md sadek ferdous', 'sadek@gmail.com'),
(11, 'nem', 'cse233', 'shoumik', '331038', 'aysha', 'aysha@gmail.com'),
(12, 'nem', 'cse233', 'akash', '2015331055', 'aysha', 'aysha@gmail.com'),
(13, 'data', 'cse240', 'akash', '2015331055', 'sadek', 'sadek@gmal.com');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `reg` varchar(30) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`reg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`name`, `email`, `reg`, `password`) VALUES
('shoumik', 'shoumik@gmail.com', '331038', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
('emon', 'emon@gmail.com', '331046', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
('akash', 'akash@gmail.com', '2015331055', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
('arman', 'arman@gmail.com', '2015331060', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`name`, `email`, `password`) VALUES
('md sadek ferdous', 'sadek@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
('saiful saif', 'saif@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
