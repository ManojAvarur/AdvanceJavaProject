-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2019 at 09:21 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE DATABASE ONLINE_QUIZ;

USE ONLINE_QUIZ;

CREATE TABLE `admins` (
  `ADMIN_USER_ID` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`ADMIN_USER_ID`, `PASSWORD`) VALUES
('manojavarur@gmail.com', 'test@123');

-- --------------------------------------------------------

--
-- Table structure for table `answered`
--

CREATE TABLE `answered` (
  `ID` int(11) NOT NULL,
  `USER_ID` varchar(50) DEFAULT NULL,
  `TOTAL_MARKS` int(11) DEFAULT NULL,
  `DONE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `ANS_ID` int(11) NOT NULL,
  `ANSWERS` varchar(250) DEFAULT NULL,
  `Q_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`ANS_ID`, `ANSWERS`, `Q_ID`) VALUES
(1, 'Structured Question Langauge', 1),
(2, 'Strong Question Language', 1),
(3, 'Structured Query Language', 1),
(5, 'SELECT', 2),
(6, 'OPEN', 2),
(7, 'GET', 2),
(8, 'SAVE', 3),
(9, 'UPDATE', 3),
(10, 'MODIFY', 3),
(11, 'DROP', 4),
(12, 'REMOVE', 4),
(13, 'DELETE', 4),
(14, 'INSERT NEW', 5),
(15, 'INSERT INTO', 5),
(16, 'ADD RECORD', 5),
(17, 'EXTRACT FristName FROM Persons', 6),
(18, 'SELECT Persons.FirestName', 6),
(19, 'SELECT FirestName FROM Persons', 6),
(20, 'SELECT [ALL] FROM Persons', 7),
(21, 'SELECT Persons', 7),
(22, 'SELECT * FROM Persons', 7),
(23, 'SELECT [ALL] FROM Persons WHERE FirestName = \"Peter\"', 8),
(24, 'SELECT [ALL] FROM Persons WHERE FirestName LIKE \"Peter\"', 8),
(25, 'SELECT * FROM Persons WHERE FirestName = \"Peter\"', 8),
(26, 'SELECT * FROM Persons WHERE FirestName = \"%a%\"', 9),
(27, 'SELECT * FROM Persons WHERE FirestName LIKE \"%a\"', 9),
(28, 'SELECT * FROM Persons WHERE FirestName LIKE \"a%\"', 9),
(29, 'TRUE', 10),
(30, 'FALSE', 10),
(31, 'BOTH', 10);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Q_ID` int(11) NOT NULL,
  `QUESTION` varchar(250) DEFAULT NULL,
  `ANS_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Q_ID`, `QUESTION`, `ANS_ID`) VALUES
(1, 'What does SQL stands for', 3),
(2, 'WHICH SQL STATEMENT IS USED TO EXTRACT DATA FROM A DATABASE ? ', 5),
(3, 'Which SQL statement is used to update data in a database?', 9),
(4, 'Which SQL statement is used to delete data from a database?', 13),
(5, 'Which SQL statement is used to insert new data in a database?', 15),
(6, 'With SQL, how do you select a column named \"FirstName\" from a table named \"Persons\"?', 19),
(7, 'With SQL, how do you select all the columns from a table named \"Persons\"?', 22),
(8, 'With SQL, how do you select all the records from a table named \"Persons\" where the value of the column \"FirstName\" is \"Peter\"?', 25),
(9, 'With SQL, how do you select all the records from a table named \"Persons\" where the value of the column \"FirstName\" starts with an \"a\"?', 28),
(10, 'The OR operator displays a record if ANY conditions listed are true. The AND operator displays a record if ALL of the conditions listed are true', 29);

-- --------------------------------------------------------

--
-- Table structure for table `unknown_answered`
--

CREATE TABLE `unknown_answered` (
  `TEMP_UID` int(11) NOT NULL,
  `MARKS` int(11) DEFAULT NULL,
  `DONEDATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `NAME`, `PASSWORD`) VALUES
('adminmanoj@gmail.com', 'admin', '123'),
('manojavarur@gmail.com', 'Manoj A M', 'test@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`ADMIN_USER_ID`);

--
-- Indexes for table `answered`
--
ALTER TABLE `answered`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`ANS_ID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`Q_ID`),
  ADD KEY `ANS_ID` (`ANS_ID`);

--
-- Indexes for table `unknown_answered`
--
ALTER TABLE `unknown_answered`
  ADD PRIMARY KEY (`TEMP_UID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answered`
--
ALTER TABLE `answered`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `ANS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Q_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `unknown_answered`
--
ALTER TABLE `unknown_answered`
  MODIFY `TEMP_UID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`ADMIN_USER_ID`) REFERENCES `users` (`USER_ID`);

--
-- Constraints for table `answered`
--
ALTER TABLE `answered`
  ADD CONSTRAINT `answered_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`ANS_ID`) REFERENCES `answers` (`ANS_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;