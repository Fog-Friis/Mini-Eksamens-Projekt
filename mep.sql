-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 08. 12 2021 kl. 07:10:24
-- Serverversion: 5.7.14
-- PHP-version: 5.6.25

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
-- Struktur-dump for tabellen `elev`
--

CREATE TABLE `elev` (
  `elevID` int(200) NOT NULL,
  `klasseID` int(200) NOT NULL,
  `brugernavn` varchar(200) CHARACTER SET latin1 NOT NULL,
  `password` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `klasse`
--

CREATE TABLE `klasse` (
  `klasseID` int(200) NOT NULL,
  `klassenavn` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL,
  `aargang` int(200) NOT NULL,
  `underviserID` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavesvar1`
--

CREATE TABLE `opgavesvar1` (
  `opgaveID` int(255) NOT NULL,
  `opgave1Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave2Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave3Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave4Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave5Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave6Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave7Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave8Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave9Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave10Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave11Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave12Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave13Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave14Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave15Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave16Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave17Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave18Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave19Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave20Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave21Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave22Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave23Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave24Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave25Svar1` varchar(255) COLLATE latin1_danish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavesvar2`
--

CREATE TABLE `opgavesvar2` (
  `opgaveID` int(255) NOT NULL,
  `opgave1Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave2Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave3Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave4Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave5Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave6Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave7Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave8Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave9Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave10Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave11Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave12Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave13Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave14Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave15Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave16Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave17Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave18Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave19Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave20Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave21Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave22Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave23Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave24Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave25Svar2` varchar(255) COLLATE latin1_danish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavesvar3`
--

CREATE TABLE `opgavesvar3` (
  `opgaveID` int(255) NOT NULL,
  `opgave1Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave2Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave3Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave4Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave5Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave6Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave7Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave8Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave9Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave10Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave11Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave12Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave13Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave14Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave15Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave16Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave17Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave18Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave19Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave20Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave21Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave22Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave23Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave24Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave25Svar3` varchar(255) COLLATE latin1_danish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavesvar4`
--

CREATE TABLE `opgavesvar4` (
  `opgaveID` int(255) NOT NULL,
  `opgave1Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave2Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave3Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave4Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave5Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave6Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave7Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave8Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave9Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave10Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave11Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave12Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave13Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave14Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave15Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave16Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave17Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave18Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave19Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave20Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave21Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave22Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave23Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave24Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgave25Svar4` varchar(255) COLLATE latin1_danish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavesvarark`
--

CREATE TABLE `opgavesvarark` (
  `opgaveID` int(255) NOT NULL,
  `opgave1Svar` int(255) NOT NULL,
  `opgave2Svar` int(255) NOT NULL,
  `opgave3Svar` int(255) NOT NULL,
  `opgave4Svar` int(255) NOT NULL,
  `opgave5Svar` int(255) NOT NULL,
  `opgave6Svar` int(255) NOT NULL,
  `opgave7Svar` int(255) NOT NULL,
  `opgave8Svar` int(255) NOT NULL,
  `opgave9Svar` int(255) NOT NULL,
  `opgave10Svar` int(255) NOT NULL,
  `opgave11Svar` int(255) NOT NULL,
  `opgave12Svar` int(255) NOT NULL,
  `opgave13Svar` int(255) NOT NULL,
  `opgave14Svar` int(255) NOT NULL,
  `opgave15Svar` int(255) NOT NULL,
  `opgave16Svar` int(255) NOT NULL,
  `opgave17Svar` int(255) NOT NULL,
  `opgave18Svar` int(255) NOT NULL,
  `opgave19Svar` int(255) NOT NULL,
  `opgave20Svar` int(255) NOT NULL,
  `opgave21Svar` int(255) NOT NULL,
  `opgave22Svar` int(255) NOT NULL,
  `opgave23Svar` int(255) NOT NULL,
  `opgave24Svar` int(255) NOT NULL,
  `opgave25Svar` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavetabel`
--

CREATE TABLE `opgavetabel` (
  `opgaveID` int(255) NOT NULL,
  `opgaveNavn` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveAntal` int(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavetext`
--

CREATE TABLE `opgavetext` (
  `opgaveID` int(255) NOT NULL,
  `opgaveTekst1` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst2` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst3` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst4` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst5` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst6` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst7` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst8` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst9` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst10` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst11` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst12` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst13` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst14` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst15` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst16` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst17` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst18` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst19` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst20` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst21` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst22` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst23` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst24` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveTekst25` varchar(255) COLLATE latin1_danish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `underviser`
--

CREATE TABLE `underviser` (
  `underviserID` int(200) NOT NULL,
  `brugernavn` varchar(200) COLLATE latin1_danish_ci NOT NULL,
  `password` varchar(200) COLLATE latin1_danish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `elev`
--
ALTER TABLE `elev`
  ADD PRIMARY KEY (`elevID`),
  ADD UNIQUE KEY `brugernavn` (`brugernavn`);

--
-- Indeks for tabel `klasse`
--
ALTER TABLE `klasse`
  ADD PRIMARY KEY (`klasseID`);

--
-- Indeks for tabel `opgavesvar2`
--
ALTER TABLE `opgavesvar2`
  ADD PRIMARY KEY (`opgaveID`);

--
-- Indeks for tabel `opgavesvar3`
--
ALTER TABLE `opgavesvar3`
  ADD PRIMARY KEY (`opgaveID`);

--
-- Indeks for tabel `opgavesvar4`
--
ALTER TABLE `opgavesvar4`
  ADD PRIMARY KEY (`opgaveID`);

--
-- Indeks for tabel `opgavesvarark`
--
ALTER TABLE `opgavesvarark`
  ADD PRIMARY KEY (`opgaveID`);

--
-- Indeks for tabel `opgavetabel`
--
ALTER TABLE `opgavetabel`
  ADD PRIMARY KEY (`opgaveID`),
  ADD UNIQUE KEY `opgaveNavn` (`opgaveNavn`);

--
-- Indeks for tabel `opgavetext`
--
ALTER TABLE `opgavetext`
  ADD PRIMARY KEY (`opgaveID`);

--
-- Indeks for tabel `underviser`
--
ALTER TABLE `underviser`
  ADD PRIMARY KEY (`underviserID`),
  ADD UNIQUE KEY `brugernavn` (`brugernavn`);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `klasse`
--
ALTER TABLE `klasse`
  ADD CONSTRAINT `klasseID_r` FOREIGN KEY (`klasseID`) REFERENCES `elev` (`elevID`);

--
-- Begrænsninger for tabel `underviser`
--
ALTER TABLE `underviser`
  ADD CONSTRAINT `underviserID_r` FOREIGN KEY (`underviserID`) REFERENCES `klasse` (`klasseID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
