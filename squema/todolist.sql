-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2024 at 03:54 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `relationtbluserwhittbltodolist`
--

CREATE TABLE `relationtbluserwhittbltodolist` (
  `idrelationTblUserWhitTblToDoList` int(11) NOT NULL,
  `tblUser_idtblUser` int(11) NOT NULL,
  `tblToDoList_idtblToDoList` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcity`
--

CREATE TABLE `tblcity` (
  `idtblCity` int(11) NOT NULL,
  `cityName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcontacdata`
--

CREATE TABLE `tblcontacdata` (
  `idtblContacData` int(11) NOT NULL,
  `numberCel` varchar(45) NOT NULL,
  `zipCode` varchar(45) NOT NULL,
  `tblCity_idtblCity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpersonaldata`
--

CREATE TABLE `tblpersonaldata` (
  `idtblPersonalData` int(11) NOT NULL,
  `fullName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `eMail` varchar(45) NOT NULL,
  `tblContacData_idtblContacData` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbltodolist`
--

CREATE TABLE `tbltodolist` (
  `idtblToDoList` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `idtblUser` int(11) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `passUser` varchar(45) NOT NULL,
  `tblPersonalData_idtblPersonalData` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `relationtbluserwhittbltodolist`
--
ALTER TABLE `relationtbluserwhittbltodolist`
  ADD PRIMARY KEY (`idrelationTblUserWhitTblToDoList`),
  ADD KEY `fk_relationTblUserWhitTblToDoList_tblUser1_idx` (`tblUser_idtblUser`),
  ADD KEY `fk_relationTblUserWhitTblToDoList_tblToDoList1_idx` (`tblToDoList_idtblToDoList`);

--
-- Indexes for table `tblcity`
--
ALTER TABLE `tblcity`
  ADD PRIMARY KEY (`idtblCity`);

--
-- Indexes for table `tblcontacdata`
--
ALTER TABLE `tblcontacdata`
  ADD PRIMARY KEY (`idtblContacData`),
  ADD KEY `fk_tblContacData_tblCity_idx` (`tblCity_idtblCity`);

--
-- Indexes for table `tblpersonaldata`
--
ALTER TABLE `tblpersonaldata`
  ADD PRIMARY KEY (`idtblPersonalData`),
  ADD KEY `fk_tblPersonalData_tblContacData1_idx` (`tblContacData_idtblContacData`);

--
-- Indexes for table `tbltodolist`
--
ALTER TABLE `tbltodolist`
  ADD PRIMARY KEY (`idtblToDoList`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`idtblUser`),
  ADD UNIQUE KEY `idtblUser_UNIQUE` (`idtblUser`),
  ADD UNIQUE KEY `tblUsercol_UNIQUE` (`userName`),
  ADD KEY `fk_tblUser_tblPersonalData1_idx` (`tblPersonalData_idtblPersonalData`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcity`
--
ALTER TABLE `tblcity`
  MODIFY `idtblCity` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcontacdata`
--
ALTER TABLE `tblcontacdata`
  MODIFY `idtblContacData` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblpersonaldata`
--
ALTER TABLE `tblpersonaldata`
  MODIFY `idtblPersonalData` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbltodolist`
--
ALTER TABLE `tbltodolist`
  MODIFY `idtblToDoList` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `idtblUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relationtbluserwhittbltodolist`
--
ALTER TABLE `relationtbluserwhittbltodolist`
  ADD CONSTRAINT `fk_relationTblUserWhitTblToDoList_tblToDoList1` FOREIGN KEY (`tblToDoList_idtblToDoList`) REFERENCES `tbltodolist` (`idtblToDoList`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_relationTblUserWhitTblToDoList_tblUser1` FOREIGN KEY (`tblUser_idtblUser`) REFERENCES `tbluser` (`idtblUser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblcontacdata`
--
ALTER TABLE `tblcontacdata`
  ADD CONSTRAINT `fk_tblContacData_tblCity` FOREIGN KEY (`tblCity_idtblCity`) REFERENCES `tblcity` (`idtblCity`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblpersonaldata`
--
ALTER TABLE `tblpersonaldata`
  ADD CONSTRAINT `fk_tblPersonalData_tblContacData1` FOREIGN KEY (`tblContacData_idtblContacData`) REFERENCES `tblcontacdata` (`idtblContacData`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD CONSTRAINT `fk_tblUser_tblPersonalData1` FOREIGN KEY (`tblPersonalData_idtblPersonalData`) REFERENCES `tblpersonaldata` (`idtblPersonalData`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
