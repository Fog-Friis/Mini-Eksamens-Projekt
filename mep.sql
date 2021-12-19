-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 19. 12 2021 kl. 21:33:48
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

--
-- Data dump for tabellen `elev`
--

INSERT INTO `elev` (`elevID`, `klasseID`, `brugernavn`, `password`) VALUES
(1, 123451, 'test', '937E8D5FBB48BD4949536CD65B8D35C426B80D2F830C5C308E2CDEC422AE2244'),
(2, 11125482, 'thor', 'E3B0C44298FC1C149AFBF4C8996FB92427AE41E4649B934CA495991B7852B855');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `klasse`
--

CREATE TABLE `klasse` (
  `klasseID` int(200) NOT NULL,
  `klassenavn` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_danish_ci NOT NULL,
  `skole` varchar(200) COLLATE latin1_danish_ci DEFAULT NULL,
  `underviserID` varchar(200) COLLATE latin1_danish_ci NOT NULL DEFAULT 'ingen',
  `opgaveantalklasse` int(255) NOT NULL DEFAULT '0',
  `elevAntal` int(11) DEFAULT '0',
  `elevID1` int(255) DEFAULT NULL,
  `elevID2` int(255) DEFAULT NULL,
  `elevID3` int(255) DEFAULT NULL,
  `elevID4` int(255) DEFAULT NULL,
  `elevID5` int(255) DEFAULT NULL,
  `elevID6` int(255) DEFAULT NULL,
  `elevID7` int(255) DEFAULT NULL,
  `elevID8` int(255) DEFAULT NULL,
  `elevID9` int(255) DEFAULT NULL,
  `elevID10` int(255) DEFAULT NULL,
  `elevID11` int(255) DEFAULT NULL,
  `elevID12` int(255) DEFAULT NULL,
  `elevID13` int(255) DEFAULT NULL,
  `elevID14` int(255) DEFAULT NULL,
  `elevID15` int(255) DEFAULT NULL,
  `elevID16` int(255) DEFAULT NULL,
  `elevID17` int(255) DEFAULT NULL,
  `elevID18` int(255) DEFAULT NULL,
  `elevID19` int(255) DEFAULT NULL,
  `elevID20` int(255) DEFAULT NULL,
  `elevID21` int(255) DEFAULT NULL,
  `elevID22` int(255) DEFAULT NULL,
  `elevID23` int(255) DEFAULT NULL,
  `elevID24` int(255) DEFAULT NULL,
  `elevID25` int(255) DEFAULT NULL,
  `elevID26` int(255) DEFAULT NULL,
  `elevID27` int(255) DEFAULT NULL,
  `elevID28` int(255) DEFAULT NULL,
  `elevID29` int(255) DEFAULT NULL,
  `elevID30` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `klasse`
--

INSERT INTO `klasse` (`klasseID`, `klassenavn`, `skole`, `underviserID`, `opgaveantalklasse`, `elevAntal`, `elevID1`, `elevID2`, `elevID3`, `elevID4`, `elevID5`, `elevID6`, `elevID7`, `elevID8`, `elevID9`, `elevID10`, `elevID11`, `elevID12`, `elevID13`, `elevID14`, `elevID15`, `elevID16`, `elevID17`, `elevID18`, `elevID19`, `elevID20`, `elevID21`, `elevID22`, `elevID23`, `elevID24`, `elevID25`, `elevID26`, `elevID27`, `elevID28`, `elevID29`, `elevID30`) VALUES
(11125482, 'klasseThor', 'H. C. Ørsted Lyngby', '2', 0, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46032822, 'ThorKlasse', 'H. C. Ørsted Lyngby', '2', 0, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `klasseopgaver`
--

CREATE TABLE `klasseopgaver` (
  `klasseID` int(255) NOT NULL,
  `opgaveID` int(255) NOT NULL,
  `opgavenavn` varchar(255) NOT NULL,
  `opgaveOpen` int(255) NOT NULL DEFAULT '-1',
  `karakter` varchar(255) NOT NULL DEFAULT 'ingen givet'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `klasseopgaver`
--

INSERT INTO `klasseopgaver` (`klasseID`, `opgaveID`, `opgavenavn`, `opgaveOpen`, `karakter`) VALUES
(123451, 1, 'opgave1', -1, '-1'),
(123451, 2, 'opgave2', -1, '-1');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgaverlavet`
--

CREATE TABLE `opgaverlavet` (
  `elevID` int(255) NOT NULL,
  `opgaveID` int(255) NOT NULL,
  `rigtigeSvar` int(255) NOT NULL DEFAULT '0',
  `opgaveAntal` int(255) NOT NULL DEFAULT '10',
  `karakterVis` int(255) NOT NULL DEFAULT '0',
  `SlutTid` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

--
-- Data dump for tabellen `opgavesvar1`
--

INSERT INTO `opgavesvar1` (`opgaveID`, `opgave1Svar1`, `opgave2Svar1`, `opgave3Svar1`, `opgave4Svar1`, `opgave5Svar1`, `opgave6Svar1`, `opgave7Svar1`, `opgave8Svar1`, `opgave9Svar1`, `opgave10Svar1`, `opgave11Svar1`, `opgave12Svar1`, `opgave13Svar1`, `opgave14Svar1`, `opgave15Svar1`, `opgave16Svar1`, `opgave17Svar1`, `opgave18Svar1`, `opgave19Svar1`, `opgave20Svar1`, `opgave21Svar1`, `opgave22Svar1`, `opgave23Svar1`, `opgave24Svar1`, `opgave25Svar1`) VALUES
(1, '1/2', 'x=-1, y=-1', '10', '(0;4)', 'a=0', 'y=x+15', '4+x^2', 'x=0', '7/19', 'x=1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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

--
-- Data dump for tabellen `opgavesvar2`
--

INSERT INTO `opgavesvar2` (`opgaveID`, `opgave1Svar2`, `opgave2Svar2`, `opgave3Svar2`, `opgave4Svar2`, `opgave5Svar2`, `opgave6Svar2`, `opgave7Svar2`, `opgave8Svar2`, `opgave9Svar2`, `opgave10Svar2`, `opgave11Svar2`, `opgave12Svar2`, `opgave13Svar2`, `opgave14Svar2`, `opgave15Svar2`, `opgave16Svar2`, `opgave17Svar2`, `opgave18Svar2`, `opgave19Svar2`, `opgave20Svar2`, `opgave21Svar2`, `opgave22Svar2`, `opgave23Svar2`, `opgave24Svar2`, `opgave25Svar2`) VALUES
(1, '10', 'x=1, y=1', '5', '(0;1)', 'x=0', 'y=5x+10', '2x^2', 'x=5', '10/70', 'x=0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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

--
-- Data dump for tabellen `opgavesvar3`
--

INSERT INTO `opgavesvar3` (`opgaveID`, `opgave1Svar3`, `opgave2Svar3`, `opgave3Svar3`, `opgave4Svar3`, `opgave5Svar3`, `opgave6Svar3`, `opgave7Svar3`, `opgave8Svar3`, `opgave9Svar3`, `opgave10Svar3`, `opgave11Svar3`, `opgave12Svar3`, `opgave13Svar3`, `opgave14Svar3`, `opgave15Svar3`, `opgave16Svar3`, `opgave17Svar3`, `opgave18Svar3`, `opgave19Svar3`, `opgave20Svar3`, `opgave21Svar3`, `opgave22Svar3`, `opgave23Svar3`, `opgave24Svar3`, `opgave25Svar3`) VALUES
(1, '2', 'x=1, y=-1', '-2', '(4;0)', 'y=0', 'y=-2x', '4+x^2+4x', 'x=0 v x=5', '53/70', 'x=1 v x = 0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

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

--
-- Data dump for tabellen `opgavesvar4`
--

INSERT INTO `opgavesvar4` (`opgaveID`, `opgave1Svar4`, `opgave2Svar4`, `opgave3Svar4`, `opgave4Svar4`, `opgave5Svar4`, `opgave6Svar4`, `opgave7Svar4`, `opgave8Svar4`, `opgave9Svar4`, `opgave10Svar4`, `opgave11Svar4`, `opgave12Svar4`, `opgave13Svar4`, `opgave14Svar4`, `opgave15Svar4`, `opgave16Svar4`, `opgave17Svar4`, `opgave18Svar4`, `opgave19Svar4`, `opgave20Svar4`, `opgave21Svar4`, `opgave22Svar4`, `opgave23Svar4`, `opgave24Svar4`, `opgave25Svar4`) VALUES
(1, '-2', 'x=-1, y=1', '2', '(1;0)', 'b=0', 'y=10x+5', '4+x^2+2x', 'ingen løsninger', '20/70', 'ingen løsninger', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavesvarark`
--

CREATE TABLE `opgavesvarark` (
  `opgaveID` int(255) NOT NULL,
  `opgave1Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave2Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave3Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave4Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave5Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave6Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave7Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave8Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave9Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave10Svar` int(255) DEFAULT '-1',
  `opgave11Svar` int(255) DEFAULT '-1',
  `opgave12Svar` int(255) DEFAULT '-1',
  `opgave13Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave14Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave15Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave16Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave17Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave18Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave19Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave20Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave21Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave22Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave23Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave24Svar` int(255) NOT NULL DEFAULT '-1',
  `opgave25Svar` int(255) NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `opgavesvarark`
--

INSERT INTO `opgavesvarark` (`opgaveID`, `opgave1Svar`, `opgave2Svar`, `opgave3Svar`, `opgave4Svar`, `opgave5Svar`, `opgave6Svar`, `opgave7Svar`, `opgave8Svar`, `opgave9Svar`, `opgave10Svar`, `opgave11Svar`, `opgave12Svar`, `opgave13Svar`, `opgave14Svar`, `opgave15Svar`, `opgave16Svar`, `opgave17Svar`, `opgave18Svar`, `opgave19Svar`, `opgave20Svar`, `opgave21Svar`, `opgave22Svar`, `opgave23Svar`, `opgave24Svar`, `opgave25Svar`) VALUES
(1, 1, 3, 2, 4, 4, 2, 3, 3, 3, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1),
(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `opgavetabel`
--

CREATE TABLE `opgavetabel` (
  `opgaveID` int(255) NOT NULL,
  `opgaveNavn` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `opgaveAntal` int(255) DEFAULT NULL,
  `Tid` int(11) NOT NULL DEFAULT '1440'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `opgavetabel`
--

INSERT INTO `opgavetabel` (`opgaveID`, `opgaveNavn`, `opgaveAntal`, `Tid`) VALUES
(1, 'opgave1', 10, 9999);

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

--
-- Data dump for tabellen `opgavetext`
--

INSERT INTO `opgavetext` (`opgaveID`, `opgaveTekst1`, `opgaveTekst2`, `opgaveTekst3`, `opgaveTekst4`, `opgaveTekst5`, `opgaveTekst6`, `opgaveTekst7`, `opgaveTekst8`, `opgaveTekst9`, `opgaveTekst10`, `opgaveTekst11`, `opgaveTekst12`, `opgaveTekst13`, `opgaveTekst14`, `opgaveTekst15`, `opgaveTekst16`, `opgaveTekst17`, `opgaveTekst18`, `opgaveTekst19`, `opgaveTekst20`, `opgaveTekst21`, `opgaveTekst22`, `opgaveTekst23`, `opgaveTekst24`, `opgaveTekst25`) VALUES
(1, 'Bestem linjen l, går gennem de to punkter P=(10;2) og Q=(2;-2). Bestem linjens hældningskoefficient, hvis der er en.', 'Bestem x og y når 2y+4x=2 og 3y+4x=1', 'Linjen l er givet ved y=-2x+10. Bestem linjens skæring med x-aksen.', 'Linjen l er givet ved y=-4x+4 og linjen m er givet ved y=2x-2', 'for en linje på formen y=ax+b, gælder det at den er ligefrem proportional når:\r\n', 'Bestem forskriften for den rette linje på formen: ax+b, der går gennem punkterne P=(-2;0) og Q=(1;15).\r\n', 'Bestem (2+x)^2', 'Bestem x, når -2x^2+10x=0, hvis x har en løsning.', 'Bestem 2/5+5/14 og reducer udtrykket mest muligt.', 'Bestem x når 4x^2-6x+10=0, hvis x har en løsning.', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `underviser`
--

CREATE TABLE `underviser` (
  `underviserID` int(200) NOT NULL,
  `brugernavn` varchar(200) COLLATE latin1_danish_ci NOT NULL,
  `password` varchar(200) COLLATE latin1_danish_ci NOT NULL,
  `skole` varchar(255) COLLATE latin1_danish_ci NOT NULL,
  `klasseAntal` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `underviser`
--

INSERT INTO `underviser` (`underviserID`, `brugernavn`, `password`, `skole`, `klasseAntal`) VALUES
(1, 'Thor1', '6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B', 'H. C. Ørsted Lyngby', 0),
(2, 'thortest', '9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08', 'H. C. Ørsted Lyngby', 0);

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
-- Indeks for tabel `opgaverlavet`
--
ALTER TABLE `opgaverlavet`
  ADD PRIMARY KEY (`elevID`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
