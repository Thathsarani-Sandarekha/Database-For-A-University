-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Apr 18, 2022 at 07:43 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caams_college`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `Course_ID` char(4) NOT NULL,
  `Course_name` varchar(100) NOT NULL,
  `Credit_Hours` int(11) NOT NULL,
  PRIMARY KEY (`Course_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Course_name`, `Credit_Hours`) VALUES
('C001', 'Artifial Intelligence and Data Science', 3000),
('C002', 'Software Engineering', 2600),
('C003', 'Bachelor of Commerce', 3000),
('C004', 'Computer Science', 2500),
('C005', 'Human Resources', 2600),
('C006', 'Business Administration', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `course_module`
--

DROP TABLE IF EXISTS `course_module`;
CREATE TABLE IF NOT EXISTS `course_module` (
  `Course_Code` char(4) NOT NULL,
  `M_Code` char(4) NOT NULL,
  KEY `Course_Code` (`Course_Code`),
  KEY `M_Code` (`M_Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_module`
--

INSERT INTO `course_module` (`Course_Code`, `M_Code`) VALUES
('C001', 'M001'),
('C001', 'M002'),
('C001', 'M003'),
('C001', 'M004'),
('C001', 'M005'),
('C002', 'M001'),
('C002', 'M003'),
('C002', 'M004'),
('C003', 'M006'),
('C004', 'M001'),
('C006', 'M007');

-- --------------------------------------------------------

--
-- Table structure for table `enrolling`
--

DROP TABLE IF EXISTS `enrolling`;
CREATE TABLE IF NOT EXISTS `enrolling` (
  `Course_ID` char(4) NOT NULL,
  `Student_ID` char(4) NOT NULL,
  `Payment_ID` char(5) NOT NULL,
  KEY `Course_ID` (`Course_ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Payment_ID` (`Payment_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrolling`
--

INSERT INTO `enrolling` (`Course_ID`, `Student_ID`, `Payment_ID`) VALUES
('C001', 'S001', 'P005'),
('C003', 'S002', 'P004'),
('C002', 'S003', 'P002'),
('C004', 'S005', 'P003'),
('C005', 'S004', 'P001');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
CREATE TABLE IF NOT EXISTS `lecturer` (
  `Lecturer_ID` char(4) NOT NULL,
  `Lecturer_name` varchar(150) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  PRIMARY KEY (`Lecturer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`Lecturer_ID`, `Lecturer_name`, `Email`, `Address`, `Gender`, `Date_of_Birth`) VALUES
('L001', 'Dr.Anne Cameron', 'anne@gmail.com', '79 Newgate Street Jump', 'F', '1973-06-27'),
('L002', 'Dr.Jackson Landon', 'Jacklan@gmail.com', '81 Bath Rd Wolferton', 'M', '1989-04-12'),
('L003', 'Dr.Sophia Riley', 'sophiary@gmail.com', '1 Scotsburn Rd Talwrn', 'F', '1965-03-13'),
('L004', 'Dr.Jacob Owen', 'owenj@gmail.com', '36 East Street Manston', 'M', '1974-09-02'),
('L005', 'Dr.Oliver David', 'davidolive@gmail.com', '69 Sandyhill Rd Fulmer', 'M', '1975-10-21'),
('L006', 'Dr.Kaylee Luke', 'lukekaye@gmail.com', '48 Southern Way North Newbald', 'F', '1989-07-18');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_contact`
--

DROP TABLE IF EXISTS `lecturer_contact`;
CREATE TABLE IF NOT EXISTS `lecturer_contact` (
  `Lecturer_ID` char(4) NOT NULL,
  `Contact_Number` char(11) NOT NULL,
  KEY `Lecturer_ID` (`Lecturer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lecturer_contact`
--

INSERT INTO `lecturer_contact` (`Lecturer_ID`, `Contact_Number`) VALUES
('L001', '07943448437'),
('L001', '07957575867'),
('L002', '07063433160'),
('L003', '07888369094'),
('L003', '07926400554'),
('L004', '07985670373'),
('L005', '07959109590');

-- --------------------------------------------------------

--
-- Table structure for table `mentoring`
--

DROP TABLE IF EXISTS `mentoring`;
CREATE TABLE IF NOT EXISTS `mentoring` (
  `New_Lecturer_ID` char(4) NOT NULL,
  `Senior_Lecturer_ID` char(4) NOT NULL,
  KEY `New_Lecturer_ID` (`New_Lecturer_ID`),
  KEY `Senior_Lecturer_ID` (`Senior_Lecturer_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mentoring`
--

INSERT INTO `mentoring` (`New_Lecturer_ID`, `Senior_Lecturer_ID`) VALUES
('L004', 'L001'),
('L005', 'L002'),
('L006', 'L003');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `M_Code` char(4) NOT NULL,
  `M_name` varchar(100) NOT NULL,
  `Semester` varchar(20) NOT NULL,
  `Credits` int(11) NOT NULL,
  `Lecturer_ID` char(4) NOT NULL,
  PRIMARY KEY (`M_Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_leader`
--

DROP TABLE IF EXISTS `module_leader`;
CREATE TABLE IF NOT EXISTS `module_leader` (
  `ML_Lecturer_ID` char(4) NOT NULL,
  `M_Code` char(4) NOT NULL,
  KEY `ML_Lecturer_ID` (`ML_Lecturer_ID`),
  KEY `M_Code` (`M_Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `module_leader`
--

INSERT INTO `module_leader` (`ML_Lecturer_ID`, `M_Code`) VALUES
('L003', 'M001'),
('L004', 'M002'),
('L001', 'M003'),
('L005', 'M004'),
('L002', 'M005'),
('L006', 'M006');

-- --------------------------------------------------------

--
-- Table structure for table `part_time`
--

DROP TABLE IF EXISTS `part_time`;
CREATE TABLE IF NOT EXISTS `part_time` (
  `PT_Student_ID` char(4) NOT NULL,
  `Occupation` varchar(50) NOT NULL,
  KEY `PT_Student_ID` (`PT_Student_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `part_time`
--

INSERT INTO `part_time` (`PT_Student_ID`, `Occupation`) VALUES
('S003', 'Cashier'),
('S005', 'Cleaner'),
('S007', 'Uber Rider');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `Payment_ID` char(4) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Payment_Type` varchar(50) NOT NULL,
  `Paid_Date` date NOT NULL,
  PRIMARY KEY (`Payment_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Amount`, `Payment_Type`, `Paid_Date`) VALUES
('P001', 120000, 'Online', '2021-03-12'),
('P002', 150000, 'Online', '2021-05-18'),
('P003', 200000, 'Online', '2021-08-23'),
('P004', 230000, 'Online', '2021-10-12'),
('P005', 320000, 'Online', '2021-09-14');

-- --------------------------------------------------------

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `Sport_ID` char(5) NOT NULL,
  `Sport_name` varchar(50) NOT NULL,
  PRIMARY KEY (`Sport_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sport`
--

INSERT INTO `sport` (`Sport_ID`, `Sport_name`) VALUES
('SP01', 'Badminton'),
('SP02', 'Tennis'),
('SP03', 'Basketball'),
('SP04', 'Baseball'),
('SP05', 'Volleyball'),
('SP06', 'Swimming');

-- --------------------------------------------------------

--
-- Table structure for table `sport_full_time`
--

DROP TABLE IF EXISTS `sport_full_time`;
CREATE TABLE IF NOT EXISTS `sport_full_time` (
  `FT_Student_ID` char(4) NOT NULL,
  `Sport_ID` char(5) NOT NULL,
  KEY `FT_Student_ID` (`FT_Student_ID`),
  KEY `Sport_ID` (`Sport_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sport_full_time`
--

INSERT INTO `sport_full_time` (`FT_Student_ID`, `Sport_ID`) VALUES
('S001', 'SP03'),
('S002', 'SP02'),
('S004', 'SP05'),
('S006', 'SP01'),
('S008', 'SP01');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `Student_ID` char(4) NOT NULL,
  `Student_name` varchar(150) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Full_or_Part_Time` char(4) DEFAULT NULL,
  `Year_Enrolled` int(11) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Student_name`, `Email`, `Address`, `Gender`, `Date_of_Birth`, `Full_or_Part_Time`, `Year_Enrolled`) VALUES
('S001', 'Emma', 'emma@gmail.com', '37 Great Western Road Longfleet', 'F', '1998-10-23', 'Full', 2021),
('S002', 'Hardin', 'hardin@gmail.com', '49 Lammas Street Great Ashfield', 'M', '1999-08-12', 'Full', 2021),
('S003', 'Layla', 'layla@gmail.com', '97 Fox Lane Boarshead', 'F', '1998-03-09', 'Part', 2021),
('S004', 'Gabriella', 'gabriella@gmail.com', '15 st Omers Road Hoarwathy', 'F', '1998-04-10', 'Full', 2020),
('S005', 'Nicholas', 'nicholas@gmail.com', '50 Ponteland Rd Howgill', 'M', '1999-05-18', 'Part', 2021),
('S006', 'Hailey', 'haily@gmail.com', '31 Crown Street London', 'F', '1998-07-21', 'Full', 2021),
('S007', 'Liam', 'liam@gmail.com', '10 City Walls Rd Chebsey', 'M', '1998-07-13', 'Part', 2021),
('S008', 'Ellie', 'ellie@gmail.com', '71 Broomfield Place', 'F', '1998-11-16', 'Full', 2021);

-- --------------------------------------------------------

--
-- Table structure for table `student_contact`
--

DROP TABLE IF EXISTS `student_contact`;
CREATE TABLE IF NOT EXISTS `student_contact` (
  `Student_ID` char(4) NOT NULL,
  `Contact_Number` char(11) NOT NULL,
  KEY `Student_ID` (`Student_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student_contact`
--

INSERT INTO `student_contact` (`Student_ID`, `Contact_Number`) VALUES
('S001', '07912487027'),
('S001', '07939454788'),
('S002', '07724040962'),
('S003', '07924221836'),
('S004', '07948634086');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
