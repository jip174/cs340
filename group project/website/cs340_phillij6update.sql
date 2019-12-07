-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: classmysql.engr.oregonstate.edu:3306
-- Generation Time: Nov 07, 2019 at 03:34 PM
-- Server version: 10.3.13-MariaDB-log
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_phillij6`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `checkedout` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `checkedout`) VALUES
(1, 'NoteBook', 'Nicholas Sparks', b'1'),
(2, 'It', 'Stephen King', b'0'),
(3, 'Cujo', 'Stephen King', b'1'),
(7, 'Warriors', 'George R R Martion', b'0'),
(16, 'Scar Tissue', 'Anthony Kiedis', b'1'),
(17, 'The Lost Symbol', 'Dan Brown', b'1'),
(18, 'Iron Wolf', 'Dale Brown', b'1'),
(19, 'Orient', 'Christopher Bollen', b'0'),
(20, 'Watchers', 'Dean Koontz', b'0'),
(21, 'Lonesome Dove', 'Larry McMurty', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `transNum` int(11) NOT NULL,
  `dueDate` date NOT NULL,
  `employeeId` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `fname`, `lname`, `phone`) VALUES
(1, 'John', 'Doe', '216-554-5495'),
(2, 'Donald', 'Trump', NULL),
(3, 'Mike', 'Hunt', '555-545-7869'),
(4, 'Bill', 'Murray', '910-512-1873');

-- --------------------------------------------------------

--
-- Table structure for table `cust_books`
--

CREATE TABLE `cust_books` (
  `id` int(11) NOT NULL,
  `transNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cust_movies`
--

CREATE TABLE `cust_movies` (
  `id` int(11) NOT NULL,
  `transNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic`
--

CREATE TABLE `diagnostic` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diagnostic`
--

INSERT INTO `diagnostic` (`id`, `text`) VALUES
(1, 'MySQL is Working!');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeId`, `fname`, `lname`) VALUES
(1, 'Justin', 'Phillips'),
(2, 'John', 'Walbert');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `checkedout` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `year`, `checkedout`) VALUES
(1, 'NoteBook', 2004, b'1'),
(2, 'It', 0, b'1'),
(3, 'Cujo', 1983, b'1'),
(7, 'Titanic', 1997, b'0'),
(16, 'Star Wars: A New Hope', 1977, b'1'),
(17, 'Pulp Fiction', 1994, b'1'),
(18, 'Taxi Driver', 1976, b'0'),
(19, 'The Godfather', 1972, b'0'),
(20, 'Forrest Gump', 1994, b'1'),
(21, 'Lonesome Dove', 1989, b'1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`transNum`),
  ADD KEY `id` (`id`),
  ADD KEY `employeeId` (`employeeId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cust_books`
--
ALTER TABLE `cust_books`
  ADD KEY `id` (`id`),
  ADD KEY `transNum` (`transNum`);

--
-- Indexes for table `cust_movies`
--
ALTER TABLE `cust_movies`
  ADD KEY `id` (`id`),
  ADD KEY `transNum` (`transNum`);

--
-- Indexes for table `diagnostic`
--
ALTER TABLE `diagnostic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `transNum` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `diagnostic`
--
ALTER TABLE `diagnostic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customer` (`id`)ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`)ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cust_books`
--
ALTER TABLE `cust_books`
  ADD CONSTRAINT `cust_books_ibfk_1` FOREIGN KEY (`id`) REFERENCES `books` (`id`)ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cust_books_ibfk_2` FOREIGN KEY (`transNum`) REFERENCES `checkout` (`transNum`)ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cust_movies`
--
ALTER TABLE `cust_movies`
  ADD CONSTRAINT `cust_movies_ibfk_1` FOREIGN KEY (`id`) REFERENCES `movies` (`id`)ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cust_movies_ibfk_2` FOREIGN KEY (`transNum`) REFERENCES `checkout` (`transNum`)ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
