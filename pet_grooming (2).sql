-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2025 at 01:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_grooming`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` varchar(10) NOT NULL,
  `pet_id` varchar(10) NOT NULL,
  `service_id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `status` enum('Pending','Confirmed','In Progress','Completed','Cancelled') DEFAULT 'Pending',
  `special_instructions` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `pet_id`, `service_id`, `user_id`, `booking_date`, `booking_time`, `status`, `special_instructions`, `created_at`) VALUES
('B002', 'P005', 2, 'O004', '2025-07-27', '10:00:00', 'Pending', '', '2025-07-13 15:02:36'),
('B003', 'P006', 1, 'O007', '2025-07-27', '10:00:00', 'Completed', '', '2025-07-13 15:10:11'),
('B006', 'P009', 1, 'O004', '2025-07-25', '10:00:00', 'Pending', '', '2025-07-13 15:51:22'),
('B007', 'P010', 1, 'O003', '2025-07-19', '10:00:00', 'Pending', '', '2025-07-13 15:53:39'),
('B008', 'P011', 1, 'O008', '2025-07-19', '10:00:00', 'Pending', '', '2025-07-13 15:57:00'),
('B017', 'P020', 1, 'O003', '2025-07-18', '10:00:00', 'Pending', '', '2025-07-13 17:13:51');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_id` varchar(10) NOT NULL,
  `booking_id` varchar(10) DEFAULT NULL,
  `service_mode` enum('Walk-in','Pickup & Delivery') NOT NULL,
  `pickup_address` text DEFAULT NULL,
  `pickup_time` time DEFAULT NULL,
  `status` enum('Pending','Confirmed','In Progress','Completed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`delivery_id`, `booking_id`, `service_mode`, `pickup_address`, `pickup_time`, `status`, `created_at`) VALUES
('D002', 'B002', 'Walk-in', NULL, NULL, 'Pending', '2025-07-13 15:02:36'),
('D003', 'B003', 'Pickup & Delivery', NULL, NULL, 'Pending', '2025-07-13 15:10:11'),
('D006', 'B006', 'Walk-in', NULL, NULL, 'Pending', '2025-07-13 15:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `pet_id` varchar(10) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `special_notes` text DEFAULT NULL
) ;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pet_id`, `user_id`, `name`, `type`, `breed`, `age`, `special_notes`) VALUES
('P002', 'O001', 'Milo', 'Cat', 'British Short Hair', 2, ''),
('P003', 'O001', 'Fluffy', 'Cat', 'Persian', 2, 'Allergic to strong shampoo'),
('P005', 'O004', 'Loki', 'Cat', 'Persian', 3, 'allergic'),
('P006', 'O007', 'Kitty', 'Cat', 'Brittish shorthair', 3, 'allergic'),
('P008', 'O007', 'Cally', 'Cat', 'Brittish Shorthair', 3, 'Allergic'),
('P009', 'O004', 'Lowkey', 'Cat', 'American Shorthair', 3, 'Allergic'),
('P010', 'O003', 'maya', 'Dog', 'poodle', 4, 'shy'),
('P011', 'O008', 'mia', 'Dog', 'poodle', 3, 'no'),
('P012', 'O003', 'mimi', 'Cat', 'british short hair', 3, 'shy'),
('P013', 'O003', 'momo', 'Cat', 'british short hair', 2, 'shy'),
('P014', 'O003', 'kiki', 'Cat', 'british short hair', 3, 'shy'),
('P015', 'O001', 'ginger', 'Dog', 'husky', 3, 'shy'),
('P016', 'O001', 'lala', 'Dog', 'poodle', 2, 'shy'),
('P017', 'O001', 'mingming', 'Dog', 'husky', 2, 'shy'),
('P020', 'O003', 'lilo', 'Dog', 'poodle', 3, 'shy'),
('P022', 'O003', 'mimo', 'Dog', 'poodle', 2, '-'),
('P027', 'O004', 'Garry', 'Cat', 'Persian', 3, 'allergic'),
('P039', 'O004', 'charlie', 'Cat', 'persian', 3, 'allergic'),
('P043', 'O009', 'Gabriela', 'Cat', 'Persian', 1, 'Hates loud noises');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_type` enum('Basic Grooming','Full Grooming') NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00
) ;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_type`, `description`, `price`) VALUES
(1, 'Basic Grooming', 'Quick in-store grooming', 50.00),
(2, 'Full Grooming', 'Complete grooming ', 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_type` enum('Pet Owner','Staff') NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `user_type`, `phone`, `address`, `created_at`) VALUES
('O001', 'sakura', '12345', 'sakura@gmail.com', 'Pet Owner', '0123456789', 'Tokyo Street, KL', '2025-07-02 17:18:32'),
('O002', 'Luna', 'mypassword123', 'luna@example.com', 'Pet Owner', '0123456789', '123 Pet Street', '2025-07-12 14:05:10'),
('O003', 'sara', '1234', 'sara@gmail.com', 'Pet Owner', '0123456789', '123 pet street', '2025-07-12 14:06:42'),
('O004', 'irdina', '12345', 'irdina@gmail.com', 'Pet Owner', '01164541454', 'Taman Jaya', '2025-07-12 14:10:16'),
('O005', 'aminah', '12345', 'aminah@gmail.com', 'Pet Owner', '01234562976', 'Taman Jaya', '2025-07-12 15:50:52'),
('O006', 'sally', '12345', 'sally@gmail.com', 'Pet Owner', '01116141245', 'Taman Jaya', '2025-07-12 16:29:05'),
('O007', 'hazim', '12345', 'hazim@gmail.com', 'Pet Owner', '0123456789', 'Taman Jaya', '2025-07-13 14:50:14'),
('O008', 'lia', '1234', 'lia@gmail.com', 'Pet Owner', '0123456789', 'melaka street', '2025-07-13 15:51:38'),
('O009', 'Muna', '09876', 'Muna@gmail.com', 'Pet Owner', '0123456789', 'Taman Indah,KL', '2025-07-18 08:24:07'),
('S001', 'staffJohn', '12345', 'johnstaff@gmail.com', 'Staff', '0198888888', 'Petaling Jaya', '2025-07-02 17:19:15'),
('S002', 'Mila', '1234', 'mila@gmail.com', 'Staff', '0123456789', 'melaka street', '2025-07-13 15:09:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `pet_id` (`pet_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `bookings_user_fk` (`user_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `pets_user_fk` (`user_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unique_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`),
  ADD CONSTRAINT `bookings_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
