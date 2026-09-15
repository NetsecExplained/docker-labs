-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2018 at 11:12 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loginsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '3677b23baa08f74c28aba07f0cb6554e');

-- --------------------------------------------------------

--
-- Table structure for table `cdetails`
--

CREATE TABLE `cdetails` (
  `ID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(10) NOT NULL,
  `uimg` varchar(100) NOT NULL,
  `plan` varchar(20) NOT NULL,
  `pprice` int(11) NOT NULL,
  `proofno` varchar(30) NOT NULL,
  `proof1` varchar(30) NOT NULL,
  `proof2` varchar(30) NOT NULL,
  `caddress` varchar(200) NOT NULL,
  `haddress` varchar(200) NOT NULL,
  `rdate` date NOT NULL,
  `bdate` date NOT NULL,
  `multiLine` varchar(500) NOT NULL,
  `depatment` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cdetails`
--

INSERT INTO `cdetails` (`ID`, `fname`, `lname`, `uname`, `email`, `phone`, `uimg`, `plan`, `pprice`, `proofno`, `proof1`, `proof2`, `caddress`, `haddress`, `rdate`, `bdate`, `multiLine`, `depatment`) VALUES
(1, 'afsar', 'as', 'admin', 'afsar.sdq@gmail.com', 2147483647, '', '', 0, '', '', '', 'kda, motinagar', 'kda, motinagar', '0000-00-00', '0000-00-00', '', 'A'),
(2, 'afsar', 'as', 'admin', 'afsar.sdq@gmail.com', 2147483647, '', '', 0, '', '', '', 'kda, motinagar', 'kda, motinagar', '0000-00-00', '0000-00-00', '', 'A'),
(3, 'afsar', 'as', 'admin', 'afsar.sdq@gmail.com', 2147483647, '', '123', 1234, '12345', '', '', 'kda, motinagar', 'kda, motinagar', '1980-11-11', '1980-11-11', 'dnjfhrfbrhfvyure', 'A'),
(4, 'afsar', 'as', 'root', 'afsar.sdq@gmail.com', 2147483647, 'screencapture-silverscreen-freshdesk-a-admin-subsc', '123', 1234, '123412', '', '', 'kda, motinagar', 'kda, motinagar', '2018-12-11', '2018-12-10', 'ahdgyudfgefveywdtfe6wdfgv', 'A'),
(5, 'afsar', 'as', 'root', 'afsar.sdq@gmail.com', 2147483647, 'screencapture-silverscreen-freshdesk-a-admin-subsc', '123', 1234, '123412', '', '', 'kda, motinagar', 'kda, motinagar', '2018-12-11', '2018-12-10', 'ahdgyudfgefveywdtfe6wdfgv', 'A'),
(9, 'afsar', 'as', 'qd', 'afsar.sdq@gmail.com', 2147483647, 'screencapture-support-precisionmapper-support-home', '123', 1234, '123412', 'screencapture-silverscreen-fre', 'screencapture-silverscreen-fre', 'kda, motinagar', 'kda, motinagar', '1234-12-12', '2212-12-11', 'asdff', 'A'),
(10, 'afsar', 'as', 'qd', 'afsar.sdq@gmail.com', 2147483647, 'screencapture-support-precisionmapper-support-home', '123', 1234, '123412', 'screencapture-silverscreen-fre', 'screencapture-silverscreen-fre', 'kda, motinagar', 'kda, motinagar', '1234-12-12', '2212-12-11', 'asdff', 'A'),
(11, 'afsar', 'as', 'admin', 'afsar.sdq@gmail.com', 2147483647, 'screencapture-support-precisionmapper-support-home', '123', 1234, '123412', 'screencapture-evernote-shard-s', 'screencapture-internal-localiz', 'kda, motinagar', 'kda, motinagar', '1111-01-01', '2313-01-23', 'DBNEWF', 'A'),
(12, 'Nidhi', 'Mishra', 'nidhi', 'nidhi@gmail.com', 2147483647, 'reset.jpg', '432', 432, '12345', 'Aadhaar card.pdf', 'Aadhaar card.pdf', '129 c DTS Campus jajmau', 'Jajmau', '1234-12-11', '2345-12-04', 'wed', 'B'),
(13, 'Anshu', 'mishra', 'anshu', 'anshu@gmail.com', 16328127, 'reset.jpg', '63', 263, '63', 'Aadhaar card.pdf', 'Aadhaar card.pdf', '66A/5, Pokharpur', 'Jajmau', '5654-12-04', '3452-04-23', 'qwetftyqw', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `contactno` varchar(11) NOT NULL,
  `posting_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `contactno`, `posting_date`) VALUES
(12, 'afsar', 'as', 'afsar.sdq@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '123', '2018-09-13'),
(13, 'Afsar', 'siddiqui', 'afsar.sdq@gmail.com', '3677b23baa08f74c28aba07f0cb6554e', '8090648046', '2018-10-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cdetails`
--
ALTER TABLE `cdetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cdetails`
--
ALTER TABLE `cdetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
