-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2022 at 07:04 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` int(11) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Author` varchar(20) NOT NULL,
  `Price` int(11) DEFAULT 0,
  `Quantity` int(11) DEFAULT 0
) ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_book`
--

CREATE TABLE `issue_book` (
  `ISBN` int(11) DEFAULT NULL,
  `SID` int(11) DEFAULT NULL,
  `IssueDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `SID` int(11) DEFAULT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `IssueDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `return_book`
--

CREATE TABLE `return_book` (
  `SID` int(11) DEFAULT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `ReturnDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `SID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Course` varchar(20) NOT NULL,
  `Branch` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `issue_book`
--
ALTER TABLE `issue_book`
  ADD KEY `Fk1` (`ISBN`),
  ADD KEY `Fk2` (`SID`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD KEY `Fk12` (`SID`),
  ADD KEY `Fk22` (`ISBN`);

--
-- Indexes for table `return_book`
--
ALTER TABLE `return_book`
  ADD KEY `Fk11` (`SID`),
  ADD KEY `Fk21` (`ISBN`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`SID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issue_book`
--
ALTER TABLE `issue_book`
  ADD CONSTRAINT `Fk1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `Fk2` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`);

--
-- Constraints for table `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `Fk12` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`),
  ADD CONSTRAINT `Fk22` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`);

--
-- Constraints for table `return_book`
--
ALTER TABLE `return_book`
  ADD CONSTRAINT `Fk11` FOREIGN KEY (`SID`) REFERENCES `student` (`SID`),
  ADD CONSTRAINT `Fk21` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
