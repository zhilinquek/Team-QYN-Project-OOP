-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2026 at 07:05 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tuitiondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `student_id` int(11) NOT NULL,
  `subjects_picked` varchar(255) NOT NULL,
  `total_fees` double NOT NULL,
  `paid_fees` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`student_id`, `subjects_picked`, `total_fees`, `paid_fees`) VALUES
(101, 'MATEMATIK, SAINS', 240, 240),
(102, 'BM, BI, MATEMATIK', 360, 300),
(103, 'SEJARAH', 120, 50),
(104, 'BM, BI, MATEMATIK, SEJARAH, SAINS', 600, 600),
(105, 'MATEMATIK', 120, 120),
(106, 'BM, SAINS', 240, 240),
(107, 'BI, SEJARAH', 240, 0),
(108, 'MATEMATIK, SEJARAH', 240, 100),
(109, 'BM, BI', 240, 240),
(110, 'MATEMATIK, SAINS', 240, 150),
(111, 'BI, SAINS', 240, 120);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `class_day` varchar(20) NOT NULL,
  `class_time` varchar(20) NOT NULL,
  `subject` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `class_day`, `class_time`, `subject`) VALUES
(1, 'Monday', '08:00 PM', 'MATEMATIK'),
(2, 'Tuesday', '04:00 PM', 'BI');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `attendance` int(11) NOT NULL,
  `marks` double NOT NULL,
  `status` varchar(15) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_name`, `attendance`, `marks`, `status`) VALUES
(101, 'Ali Bin Ahmad', 92, 85.5, 'Active'),
(102, 'Siti Nuraliza', 88, 92, 'Active'),
(103, 'Arun Kumar', 65, 74, 'Active'),
(104, 'Mei Ling', 95, 63.5, 'Active'),
(105, 'Muhammad Faiz', 70, 48, 'Active'),
(106, 'Divya Pillay', 81, 52, 'Active'),
(107, 'Chong Wei', 50, 35, 'Active'),
(108, 'Nurul Huda', 90, 22.5, 'Active'),
(109, 'Jason Foo', 78, 67, 'Active'),
(110, 'Amanda Tan', 84, 81, 'Active'),
(111, 'Alex Tan', 90, 85, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `tutor_id` int(11) NOT NULL,
  `tutor_name` varchar(100) NOT NULL,
  `subject` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutors`
--

INSERT INTO `tutors` (`tutor_id`, `tutor_name`, `subject`) VALUES
(1, 'Mr. John', 'MATEMATIK'),
(2, 'Ms. Sarah', 'BI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`tutor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
