-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2015 at 03:34 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `city_bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE IF NOT EXISTS `bus` (
  `idbus` varchar(5) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `Other_details` varchar(30) NOT NULL,
  PRIMARY KEY (`idbus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_schedule`
--

CREATE TABLE IF NOT EXISTS `bus_schedule` (
  `idbus` varchar(5) NOT NULL,
  `idschedule` int(11) NOT NULL,
  KEY `idbus` (`idbus`),
  KEY `idschedule` (`idschedule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_stop`
--

CREATE TABLE IF NOT EXISTS `bus_stop` (
  `idstop` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `suburb` varchar(40) NOT NULL,
  PRIMARY KEY (`idstop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus_stop`
--

INSERT INTO `bus_stop` (`idstop`, `name`, `latitude`, `longitude`, `suburb`) VALUES
('B12', 'Shangai street (Geme', -22.52018082, 17.06271082, 'Gemeende'),
('B124', 'Parliament Gardens', -22.5667843, 17.08695917, 'Klein Windhoek'),
('B125', 'Robert Mugabe bus st', -22.571897506713867, 17.088489532470703, 'Robert Mugabe'),
('B126', 'Robert Mugabe bus st', -22.577430725097656, 17.0915470123291, 'Robert Mugabe'),
('B127', 'Marua mall bus stop', -22.581628799438477, 17.092727661132812, 'Marua mall'),
('B131', 'Klein Windhoek 1', -22.5667973, 17.10174627, 'Klein Windhoek'),
('B132', 'Klein Windhoek 2', -22.5617628, 17.09813455, 'Klein Windhoek'),
('B135', 'Rhino park', -22.54549719, 17.07521193, 'Rhino Park'),
('B137', 'KFC bus stop', -22.569366455078125, 17.0822696685791, 'CBD'),
('B141', 'Nandos', -22.57950439, 17.08178963, 'Southern Industrial Area'),
('B142', 'Air Namibia (Right)', -22.57576153, 17.0810247, 'CBD'),
('B143', 'Roman Catholic Hospi', -22.564250946044922, 17.080936431884766, 'CBD'),
('B15', 'Damara bus stop', -22.522953033447266, 17.055789947509766, 'Damara location'),
('B16 ', 'SWAPO Headquarters', -22.53258781, 17.06482565, 'Katutura Central'),
('B17', 'Katutura hospital', -22.5, 17, 'Katutura-Central'),
('B18', 'Miami service', -22.52789912, 17.05629283, 'Herero location'),
('B19', 'Namcol Yetu Yama', -22.52652169, 17.04810573, 'Soweto'),
('B20', 'John Otto Soccer Fie', -22.52210988, 17.03758658, 'Wanaheda'),
('B3', 'Herero bus stop', -22.527984619140625, 17.053117752075195, 'Herero location'),
('B38', 'Ramtex', -22.54337011, 17.03453975, 'Khomasdal'),
('B4', 'Engen Service', -22.53233268, 17.04952635, 'Single Quarters'),
('B47', 'Ramatex', -22.554549292, 17.03138162, 'Otjomuise'),
('B49', 'Rocky Crest 1', -22.57762163, 17.05629283, 'Rocky Crest'),
('B5', 'CCN bus stop', -22.314266204833984, 17.023405075073242, 'Soweto'),
('B6', 'Otjikaendu bus stop', -22.524642944335938, 17.040145874023438, 'Wanaheda location'),
('B64', 'Circle (Academia)', -22.60725863, 17.06908581, 'Academia'),
('B67', 'Unam', -22.61358161, 17.06009536, 'Academia'),
('B7', 'Wanaheda bus stop', -22.517393112182617, 17.04051399230957, 'Wanaheda'),
('B8', 'A Shipena bus stop', -22.514413833618164, 17.04323387145996, 'Soweto'),
('B9', 'Golgota bus stop', -22.515127182006836, 17.052745819091797, 'Golgota 13');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `iddriver` int(6) NOT NULL,
  `idbus` varchar(5) NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `middlename` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `postal_address` varchar(100) NOT NULL,
  `residential_address` varchar(100) NOT NULL,
  `employeeid` int(10) NOT NULL,
  PRIMARY KEY (`iddriver`),
  UNIQUE KEY `iddriver` (`iddriver`),
  KEY `idbus` (`idbus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE IF NOT EXISTS `route` (
  `idroute` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`idroute`),
  KEY `idroute` (`idroute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`idroute`, `name`, `price`) VALUES
('1/01', 'Prosp + Cimbebasia +', 6),
('1/02', 'Robert + Mugabe Katu', 6),
('1/03', 'Prosp + Cimbebasia +', 6);

-- --------------------------------------------------------

--
-- Table structure for table `route_stop`
--

CREATE TABLE IF NOT EXISTS `route_stop` (
  `idroute` int(11) NOT NULL,
  `idstop` varchar(5) NOT NULL,
  KEY `idroute_2` (`idroute`),
  KEY `idstop` (`idstop`),
  KEY `idroute_3` (`idroute`),
  KEY `idroute_4` (`idroute`),
  KEY `idroute` (`idroute`),
  KEY `idstop_2` (`idstop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `idschedule` int(11) NOT NULL,
  `origin_stop_id` varchar(5) NOT NULL,
  `destination_stop_id` varchar(5) NOT NULL,
  `depature` datetime NOT NULL,
  `arrival` datetime NOT NULL,
  PRIMARY KEY (`idschedule`),
  KEY `origin_stop_id` (`origin_stop_id`),
  KEY `destination_stop_id` (`destination_stop_id`),
  KEY `idschedule` (`idschedule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_schedule`
--
ALTER TABLE `bus_schedule`
  ADD CONSTRAINT `bus_schedule_ibfk_1` FOREIGN KEY (`idbus`) REFERENCES `bus` (`idbus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bus_schedule_ibfk_2` FOREIGN KEY (`idschedule`) REFERENCES `schedule` (`idschedule`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`idbus`) REFERENCES `bus` (`idbus`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`origin_stop_id`) REFERENCES `bus_stop` (`idstop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`destination_stop_id`) REFERENCES `bus_stop` (`idstop`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
