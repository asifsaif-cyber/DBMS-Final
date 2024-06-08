-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 07:19 AM
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
-- Database: `ctams`
--

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE `agencies` (
  `agency_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `director_id` int(11) NOT NULL,
  `head_office` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `hotline` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`agency_id`, `name`, `director_id`, `head_office`, `location`, `hotline`, `email`) VALUES
(1, 'AB Group', 1, 'Dhaka Branch', 'Polton, Dhaka', '202050', 'abgroup@gmail.com'),
(2, 'XY Travels', 2, 'Mirpur Branch', 'Mirpur-10, Dhaka', '334567', 'xytravels@gmail.com'),
(3, 'Safe Travels', 3, 'Gazipur Branch', 'Abdullahpur, Gazipur', '908075', 'safetravels@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `agency_review`
--

CREATE TABLE `agency_review` (
  `ar_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `rating` enum('Very Bad','Bad','Average','Good','Very good') NOT NULL,
  `comments` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agency_review`
--

INSERT INTO `agency_review` (`ar_id`, `customer_id`, `agency_id`, `rating`, `comments`) VALUES
(1, 1, 1, 'Very good', 'Very good service.'),
(2, 2, 3, 'Good', 'Very good services.');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `agents_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`agents_id`, `name`, `agency_id`, `contact`, `email`) VALUES
(1, 'Asif', 1, '2198309127', 'asif@gmail.com'),
(2, 'Saif', 2, '30471042', 'saif@gmail.com'),
(3, 'Hasan', 3, '0347203709723', 'hasan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `name`, `agency_id`, `address`, `contact`) VALUES
(3, 'Chattogram Branch', 1, 'Chattogram city, Chattogram', '89732474'),
(4, 'Dhaka Branch', 1, 'Polton, Dhaka', '202050'),
(5, 'Barishal Branch', 1, 'Nothullabad, Barishal', '0217410');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `package_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `package_id`, `address`, `contact`, `email`) VALUES
(1, 'Ayesha Akter', 2, 'chandpur', '18263912', 'ayakter@bu.ac.bd'),
(2, 'Salma', 1, 'Jhinaidah', '3824792323', 'salma@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `director_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`director_id`, `name`, `contact`, `email`) VALUES
(1, 'Md Aslam', '0197836191', 'aslam@gmail.com'),
(2, 'Fahim Ahmed', '0179163922', 'fahim@gmail.com'),
(3, 'Mizanur Rahman', '01591239861', 'mizanur@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `guides`
--

CREATE TABLE `guides` (
  `guide_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `experiences` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guides`
--

INSERT INTO `guides` (`guide_id`, `name`, `phone`, `email`, `experiences`, `group_id`) VALUES
(1, 'Sabbir', '0914710', 'sabbir@gmail.com', 'leading group 56 times.', 1),
(2, 'Imran', '01795835248', 'imran@gmail.com', 'guiding groups accorss the country.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotle_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `manager` varchar(50) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotle_id`, `name`, `manager`, `contact`, `address`, `email`) VALUES
(1, 'Rest Point', 'Ifterkhar', '912740993', 'Cox-bazar,Chattogram', 'restpoint@gmail.com'),
(2, 'Sky View Inn', 'Sabbira', '21984741', 'Bandarban', 'skyviewinn@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `package_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `destination` varchar(200) NOT NULL,
  `cost` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`package_id`, `name`, `agency_id`, `destination`, `cost`) VALUES
(1, 'Bandarban Tour', 1, 'Bandarban', 7000.00),
(2, 'Cox-bazar Tour', 3, 'Cox-bazar', 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `package_info`
--

CREATE TABLE `package_info` (
  `info_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `starting_point` varchar(50) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL,
  `transport_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_info`
--

INSERT INTO `package_info` (`info_id`, `package_id`, `starting_point`, `duration`, `description`, `transport_id`, `hotel_id`) VALUES
(1, 1, 'Dhaka', '3 Days, 2 Nights', 'Bandarban er Bandar Dorshan.', 2, 2),
(2, 2, 'Dhaka', '4 Days, 3 Nights', 'Sweet moments', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_review`
--

CREATE TABLE `package_review` (
  `pr_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `rating` enum('Very Bad','Bad','Average','Good','Very good') NOT NULL,
  `comments` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_review`
--

INSERT INTO `package_review` (`pr_id`, `customer_id`, `package_id`, `rating`, `comments`) VALUES
(1, 1, 2, 'Very good', 'Was the best experience.'),
(2, 2, 1, 'Very good', 'All the Bandars were very cute.');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `method` varchar(20) NOT NULL,
  `payment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `customer_id`, `amount`, `method`, `payment_date`, `reference`) VALUES
(1, 1, 5000.00, 'Bkash', '2024-06-08 10:24:36', 'idn839udn2io'),
(2, 2, 6000.00, 'Nagad', '2024-06-08 10:24:36', '893edn23udj');

-- --------------------------------------------------------

--
-- Table structure for table `tour_group`
--

CREATE TABLE `tour_group` (
  `group_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `package_id` int(11) NOT NULL,
  `descriptions` varchar(200) NOT NULL,
  `max_members` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tour_group`
--

INSERT INTO `tour_group` (`group_id`, `name`, `package_id`, `descriptions`, `max_members`) VALUES
(1, 'group 1', 1, 'happy journey', 15),
(2, 'group 2', 2, 'have a safe travel', 20);

-- --------------------------------------------------------

--
-- Table structure for table `transportation`
--

CREATE TABLE `transportation` (
  `transport_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `starting_point` varchar(30) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `hotline` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transportation`
--

INSERT INTO `transportation` (`transport_id`, `company_name`, `type`, `starting_point`, `destination`, `hotline`) VALUES
(1, 'SR Travel', 'Bus', 'Dhaka', 'Coxbazar', '0917413'),
(2, 'Himalay Express', 'Bus', 'Dhaka', 'Bandarban', '27230479');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `director_id` (`director_id`);

--
-- Indexes for table `agency_review`
--
ALTER TABLE `agency_review`
  ADD PRIMARY KEY (`ar_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`agents_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`director_id`);

--
-- Indexes for table `guides`
--
ALTER TABLE `guides`
  ADD PRIMARY KEY (`guide_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotle_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Indexes for table `package_info`
--
ALTER TABLE `package_info`
  ADD PRIMARY KEY (`info_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `transport_id` (`transport_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `package_review`
--
ALTER TABLE `package_review`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `tour_group`
--
ALTER TABLE `tour_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `transportation`
--
ALTER TABLE `transportation`
  ADD PRIMARY KEY (`transport_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agency_review`
--
ALTER TABLE `agency_review`
  MODIFY `ar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `agents_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `director_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guides`
--
ALTER TABLE `guides`
  MODIFY `guide_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package_info`
--
ALTER TABLE `package_info`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `package_review`
--
ALTER TABLE `package_review`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tour_group`
--
ALTER TABLE `tour_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transportation`
--
ALTER TABLE `transportation`
  MODIFY `transport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agencies`
--
ALTER TABLE `agencies`
  ADD CONSTRAINT `agencies_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`);

--
-- Constraints for table `agency_review`
--
ALTER TABLE `agency_review`
  ADD CONSTRAINT `agency_review_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `agency_review_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`);

--
-- Constraints for table `agents`
--
ALTER TABLE `agents`
  ADD CONSTRAINT `agents_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`);

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`);

--
-- Constraints for table `guides`
--
ALTER TABLE `guides`
  ADD CONSTRAINT `guides_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `tour_group` (`group_id`);

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`);

--
-- Constraints for table `package_info`
--
ALTER TABLE `package_info`
  ADD CONSTRAINT `package_info_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`),
  ADD CONSTRAINT `package_info_ibfk_2` FOREIGN KEY (`transport_id`) REFERENCES `transportation` (`transport_id`),
  ADD CONSTRAINT `package_info_ibfk_3` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotle_id`);

--
-- Constraints for table `package_review`
--
ALTER TABLE `package_review`
  ADD CONSTRAINT `package_review_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`),
  ADD CONSTRAINT `package_review_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `tour_group`
--
ALTER TABLE `tour_group`
  ADD CONSTRAINT `tour_group_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`package_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
