-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2021 at 03:23 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mep`
--

-- --------------------------------------------------------

--
-- Table structure for table `elev`
--

CREATE TABLE `elev` (
  `elevID` int(200) NOT NULL,
  `klasseID` int(200) NOT NULL,
  `brugernavn` varchar(200) CHARACTER SET latin1 NOT NULL,
  `password` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `klasse`
--

CREATE TABLE `klasse` (
  `klasseID` int(200) NOT NULL,
  `klassenavn` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL,
  `aargang` int(200) NOT NULL,
  `underviserID` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `underviser`
--

CREATE TABLE `underviser` (
  `underviserID` int(200) NOT NULL,
  `brugernavn` varchar(200) COLLATE latin1_danish_ci NOT NULL,
  `password` varchar(200) COLLATE latin1_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `elev`
--
ALTER TABLE `elev`
  ADD PRIMARY KEY (`elevID`),
  ADD UNIQUE KEY `brugernavn` (`brugernavn`);

--
-- Indexes for table `klasse`
--
ALTER TABLE `klasse`
  ADD PRIMARY KEY (`klasseID`);

--
-- Indexes for table `underviser`
--
ALTER TABLE `underviser`
  ADD PRIMARY KEY (`underviserID`),
  ADD UNIQUE KEY `brugernavn` (`brugernavn`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `klasse`
--
ALTER TABLE `klasse`
  ADD CONSTRAINT `klasseID_r` FOREIGN KEY (`klasseID`) REFERENCES `elev` (`elevID`);

--
-- Constraints for table `underviser`
--
ALTER TABLE `underviser`
  ADD CONSTRAINT `underviserID_r` FOREIGN KEY (`underviserID`) REFERENCES `klasse` (`klasseID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
