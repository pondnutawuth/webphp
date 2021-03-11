-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2021 at 05:43 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--
CREATE DATABASE IF NOT EXISTS `bookstore` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `bookstore`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `BookID` varchar(5) COLLATE utf8_bin NOT NULL,
  `BookName` varchar(50) COLLATE utf8_bin NOT NULL,
  `TypeID` char(3) COLLATE utf8_bin NOT NULL,
  `StatusID` char(2) COLLATE utf8_bin NOT NULL,
  `Publish` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `UnitPrice` int(4) NOT NULL,
  `UnitRent` int(2) NOT NULL,
  `DayAmount` int(2) DEFAULT NULL,
  `Picture` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `BookDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Truncate table before insert `book`
--

TRUNCATE TABLE `book`;
--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `BookName`, `TypeID`, `StatusID`, `Publish`, `UnitPrice`, `UnitRent`, `DayAmount`, `Picture`, `BookDate`) VALUES
('00001', 'Doraemon', '001', '01', 'Kpn', 150, 3, 2, '-', '2021-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CustomerID` varchar(4) COLLATE utf8_bin NOT NULL,
  `CustomerName` varchar(30) COLLATE utf8_bin NOT NULL,
  `CustomerSurname` varchar(30) COLLATE utf8_bin NOT NULL,
  `CustomerAddr` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CustomerPhone` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Truncate table before insert `customer`
--

TRUNCATE TABLE `customer`;
--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerSurname`, `CustomerAddr`, `CustomerPhone`) VALUES
('0001', 'วชิร', 'แหยมนิ่ม', 'สุพรรณบุรี', '0886382012');

-- --------------------------------------------------------

--
-- Table structure for table `statusbook`
--

DROP TABLE IF EXISTS `statusbook`;
CREATE TABLE `statusbook` (
  `StatusID` char(2) COLLATE utf8_bin NOT NULL,
  `StatusName` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Truncate table before insert `statusbook`
--

TRUNCATE TABLE `statusbook`;
--
-- Dumping data for table `statusbook`
--

INSERT INTO `statusbook` (`StatusID`, `StatusName`) VALUES
('01', 'ปกติ'),
('02', 'ชำรุด'),
('03', 'ส่งซ่อม');

-- --------------------------------------------------------

--
-- Table structure for table `typebook`
--

DROP TABLE IF EXISTS `typebook`;
CREATE TABLE `typebook` (
  `TypeID` char(3) COLLATE utf8_bin NOT NULL,
  `TypeName` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Truncate table before insert `typebook`
--

TRUNCATE TABLE `typebook`;
--
-- Dumping data for table `typebook`
--

INSERT INTO `typebook` (`TypeID`, `TypeName`) VALUES
('001', 'การ์ตูน'),
('002', 'นิยาย'),
('003', 'นิตยสาร');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `TypeID` (`TypeID`),
  ADD KEY `StatusID` (`StatusID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `statusbook`
--
ALTER TABLE `statusbook`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indexes for table `typebook`
--
ALTER TABLE `typebook`
  ADD PRIMARY KEY (`TypeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `typebook` (`TypeID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`StatusID`) REFERENCES `statusbook` (`StatusID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
