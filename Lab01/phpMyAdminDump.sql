-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 22, 2014 at 06:45 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `db_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `Model`
--

CREATE TABLE `Model` (
  `archived` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `modelID` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`modelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Model`
--


-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `orderID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `modelID` int(11) NOT NULL,
  `recieverID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `recieverID` (`recieverID`),
  KEY `modelID` (`modelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Order`
--


-- --------------------------------------------------------

--
-- Table structure for table `Reciever`
--

CREATE TABLE `Reciever` (
  `account` varchar(200) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `archived` int(11) NOT NULL,
  `recieverID` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  PRIMARY KEY (`recieverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Reciever`
--


-- --------------------------------------------------------

--
-- Table structure for table `Warehouse`
--

CREATE TABLE `Warehouse` (
  `name` varchar(200) NOT NULL,
  `modelID` int(11) NOT NULL,
  `warehouseID` int(11) NOT NULL,
  PRIMARY KEY (`warehouseID`),
  KEY `modelID` (`modelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Warehouse`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `Order`
--
ALTER TABLE `Order`
  ADD CONSTRAINT `Order_ibfk_2` FOREIGN KEY (`recieverID`) REFERENCES `Reciever` (`recieverID`),
  ADD CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`modelID`) REFERENCES `Model` (`modelID`);

--
-- Constraints for table `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD CONSTRAINT `Warehouse_ibfk_1` FOREIGN KEY (`modelID`) REFERENCES `Model` (`modelID`);
