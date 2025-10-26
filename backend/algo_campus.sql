-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2025 at 12:57 PM
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
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `lesson_id` bigint(20) UNSIGNED NOT NULL,
  `is_completed` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_last_watched` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `course_id`, `user_id`, `chapter_id`, `lesson_id`, `is_completed`, `is_last_watched`, `created_at`, `updated_at`) VALUES
(19, 3, 1, 1, 1, 'yes', 'no', '2025-10-22 23:48:13', '2025-10-23 01:32:58'),
(20, 3, 1, 1, 2, 'yes', 'no', NULL, '2025-10-23 01:32:58'),
(21, 3, 1, 1, 3, 'yes', 'no', NULL, '2025-10-23 01:32:58'),
(22, 3, 1, 1, 4, 'yes', 'no', NULL, '2025-10-23 01:32:58'),
(23, 3, 1, 2, 8, 'no', 'yes', NULL, '2025-10-23 01:32:58'),
(24, 3, 1, 4, 16, 'no', 'no', NULL, '2025-10-23 01:32:58'),
(25, 3, 1, 5, 20, 'no', 'no', NULL, '2025-10-23 01:32:58'),
(26, 3, 1, 5, 17, 'no', 'no', NULL, '2025-10-23 01:32:58'),
(27, 3, 1, 2, 5, 'yes', 'no', NULL, '2025-10-23 01:32:58'),
(28, 3, 1, 2, 6, 'yes', 'no', NULL, '2025-10-23 01:32:58'),
(29, 3, 1, 4, 14, 'yes', 'no', NULL, '2025-10-23 01:32:58'),
(31, 3, 1, 2, 7, 'yes', 'no', NULL, '2025-10-23 01:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Core CSE', 1, '2025-10-09 06:07:34', '2025-10-09 06:07:34'),
(2, 'Programming & Development', 1, '2025-10-09 06:07:34', '2025-10-09 06:07:34'),
(3, 'Systems & Networking', 1, '2025-10-09 06:07:34', '2025-10-09 06:07:34'),
(4, 'Data & Intelligence', 1, '2025-10-09 06:07:34', '2025-10-09 06:07:34'),
(5, 'Emerging Technologies', 1, '2025-10-09 06:07:34', '2025-10-09 06:07:34'),
(6, 'Artificial intelligence', 1, '2025-10-09 08:51:17', '2025-10-09 08:51:17'),
(7, 'Theory of computation', 1, '2025-10-09 08:51:17', '2025-10-09 08:51:17'),
(8, 'Machine Learning', 1, '2025-10-09 08:51:44', '2025-10-09 08:51:44');

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chapter 1: What is Computer Science?', 3, 1000, 1, '2025-10-09 10:15:09', '2025-10-09 10:15:09'),
(2, 'Chapter 2: How Computers Work', 3, 1000, 1, '2025-10-09 10:15:19', '2025-10-09 10:15:19'),
(3, 'Chapter 3: Introduction to Algorithms', 3, 1000, 1, '2025-10-09 10:15:26', '2025-10-09 10:15:26'),
(4, 'Chapter 4: Your First Program', 3, 1000, 1, '2025-10-09 10:15:33', '2025-10-09 10:15:33'),
(5, 'Chapter 5: Problem Solving with Code', 3, 1000, 1, '2025-10-09 10:15:39', '2025-10-09 10:15:39'),
(6, 'Chapter 1: Introduction to Object-Oriented Programming', 4, 1000, 1, '2025-10-09 07:12:54', '2025-10-09 07:12:54'),
(7, 'Chapter 2: Classes and Objects', 4, 2000, 1, '2025-10-09 07:12:54', '2025-10-09 07:12:54'),
(8, 'Chapter 3: Encapsulation and Data Hiding', 4, 3000, 1, '2025-10-09 07:12:54', '2025-10-09 07:12:54'),
(9, 'Chapter 4: Inheritance and Polymorphism', 4, 4000, 1, '2025-10-09 07:12:54', '2025-10-09 07:12:54'),
(10, 'Chapter 5: Advanced OOP: Abstraction and Design Principles', 4, 5000, 1, '2025-10-09 07:12:54', '2025-10-09 07:12:54'),
(11, 'Chapter 1: Introduction to Databases and DBMS', 5, 1000, 1, '2025-10-09 07:33:32', '2025-10-09 07:33:32'),
(12, 'Chapter 2: The Relational Model and ER Diagrams', 5, 2000, 1, '2025-10-09 07:33:32', '2025-10-09 07:33:32'),
(13, 'Chapter 3: SQL Fundamentals: Querying Data', 5, 3000, 1, '2025-10-09 07:33:32', '2025-10-09 07:33:32'),
(14, 'Chapter 4: Database Design and Normalization', 5, 4000, 1, '2025-10-09 07:33:32', '2025-10-09 07:33:32'),
(15, 'Chapter 5: Transactions, Security, and Real-World Applications', 5, 5000, 1, '2025-10-09 07:33:32', '2025-10-09 07:33:32'),
(16, 'Chapter 1: Introduction to Operating Systems', 6, 1000, 1, '2025-10-09 07:47:04', '2025-10-09 07:47:04'),
(17, 'Chapter 2: Process and Thread Management', 6, 2000, 1, '2025-10-09 07:47:04', '2025-10-09 07:47:04'),
(18, 'Chapter 3: CPU Scheduling and Synchronization', 6, 3000, 1, '2025-10-09 07:47:04', '2025-10-09 07:47:04'),
(19, 'Chapter 4: Memory Management and Virtual Memory', 6, 4000, 1, '2025-10-09 07:47:04', '2025-10-09 07:47:04'),
(20, 'Chapter 5: File Systems, I/O, and Security', 6, 5000, 1, '2025-10-09 07:47:04', '2025-10-09 07:47:04'),
(21, 'Chapter 1: Introduction to Computer Networks', 7, 1000, 1, '2025-10-09 07:58:54', '2025-10-09 07:58:54'),
(22, 'Chapter 2: The OSI and TCP/IP Models', 7, 2000, 1, '2025-10-09 07:58:54', '2025-10-09 07:58:54'),
(23, 'Chapter 3: IP Addressing, Subnetting, and Routing', 7, 3000, 1, '2025-10-09 07:58:54', '2025-10-09 07:58:54'),
(24, 'Chapter 4: Application Layer Protocols (HTTP, DNS, SMTP, FTP)', 7, 4000, 1, '2025-10-09 07:58:54', '2025-10-09 07:58:54'),
(25, 'Chapter 5: Network Security and Real-World Applications', 7, 5000, 1, '2025-10-09 07:58:54', '2025-10-09 07:58:54'),
(26, 'Chapter 1: Introduction to Software Engineering', 8, 1000, 1, '2025-10-09 08:18:30', '2025-10-09 08:18:30'),
(27, 'Chapter 2: Software Development Life Cycle (SDLC) Models', 8, 2000, 1, '2025-10-09 08:18:30', '2025-10-09 08:18:30'),
(28, 'Chapter 3: Requirements Engineering and UML Modeling', 8, 3000, 1, '2025-10-09 08:18:30', '2025-10-09 08:18:30'),
(29, 'Chapter 4: Software Design, Testing, and Quality Assurance', 8, 4000, 1, '2025-10-09 08:18:30', '2025-10-09 08:18:30'),
(30, 'Chapter 5: Version Control, Agile, and DevOps Practices', 8, 5000, 1, '2025-10-09 08:18:30', '2025-10-09 08:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `cross_price` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_featured` enum('yes','no') DEFAULT 'no',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `category_id`, `level_id`, `user_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES
(3, 'Introduction to Computer Science', 1, 1, 1, 2, 'This foundational course introduces students to the core concepts of computer science, including problem-solving, algorithms, basic programming, and how computers work. Designed for absolute beginners, it provides a solid base for further studies in software development, data structures, and computational thinking.', 29.99, 49.99, 1, 'no', '1759992043-3.png', '2025-10-09 09:58:52', '2025-10-10 16:25:04'),
(4, 'Object-Oriented Programming (OOP)', 2, 2, 1, 2, 'Master the core principles of Object-Oriented Programming—including classes, objects, inheritance, polymorphism, encapsulation, and abstraction—using Python and Java examples. Build reusable, modular, and maintainable code through hands-on projects.', 39.99, 59.99, 1, 'no', '1759993753-4.png', '2025-10-09 07:00:12', '2025-10-09 11:09:13'),
(5, 'Database Management Systems', 1, 2, 1, 2, 'Master the fundamentals of Database Management Systems (DBMS)—from relational models and SQL to normalization, transactions, and database design. Learn to create, manage, and optimize databases using real-world examples with MySQL or PostgreSQL.', 34.99, 54.99, 1, 'no', '1759996466-5.png', '2025-10-09 09:59:33', '2025-10-09 12:13:27'),
(6, 'Operating Systems', 1, 2, 1, 2, 'Master the fundamentals of Database Management Systems (DBMS)—from relational models and SQL to normalization, transactions, and database design. Learn to create, manage, and optimize databases using real-world examples with MySQL or PostgreSQL.', 34.99, 54.99, 1, 'no', '1759996342-6.png', '2025-10-09 09:59:45', '2025-10-09 11:52:22'),
(7, 'Computer Networks', 3, 2, 1, 2, 'Master the fundamentals of computer networking—from the OSI and TCP/IP models to IP addressing, routing, DNS, HTTP, and network security. Learn how data travels across the internet and build foundational skills for careers in networking, cybersecurity, and cloud computing.', 35.99, 55.99, 1, 'no', '1759997590-7.png', '2025-10-09 10:00:19', '2025-10-09 12:13:11'),
(8, 'Software Engineering', 1, 2, 1, 2, 'Master the principles of software engineering—from requirements gathering and system design to testing, version control, and agile development. Learn to build reliable, maintainable, and scalable software using industry-standard tools and methodologies.', 37.99, 57.99, 1, 'no', '1759997891-8.png', '2025-10-09 10:00:34', '2025-10-09 12:18:11'),
(11, 'Secure Network Systems & Protocols', 3, 1, 1, 1, 'This course explores the principles and practices of securing modern networked systems. Students will study core networking protocols (TCP/IP, DNS, HTTP, etc.) alongside the cryptographic techniques and security mechanisms used to protect them—including TLS, IPsec, SSH, and DNSSEC. The curriculum covers threat models, common network attacks (e.g., MITM, DoS, spoofing), and defensive strategies such as firewalls, intrusion detection, network segmentation, and zero-trust architectures. Through hands-on labs, students will configure secure network services, analyze encrypted traffic, and implement real-world defenses. Designed for aspiring network engineers and cybersecurity professionals, this course provides the foundational knowledge needed to build and maintain resilient, secure communication infrastructures.', 25.56, 38.59, 1, 'no', '1761135627-11.jpg', '2025-10-22 06:11:35', '2025-10-22 06:21:47'),
(12, 'Foundations of Computation', 7, 2, 1, 1, 'This course introduces the mathematical foundations of computation, exploring what problems can—and cannot—be solved by computers. Through the study of abstract machines and formal languages, students will learn the limits of algorithmic computation, the hierarchy of computational models, and the principles underlying modern programming languages and compilers.', 45.69, 65.12, 1, 'no', '1761136073-12.png', '2025-10-22 06:24:52', '2025-10-22 06:27:53'),
(13, 'Machine Learning Foundations', 8, 1, 1, 2, 'This comprehensive course is designed to take you from a curious beginner to a confident practitioner in Machine Learning. We demystify the core concepts, algorithms, and mathematics that power modern AI. You will start with the fundamental principles of data, learning types, and model evaluation, then progress to building and tuning a wide range of models, including linear regression, decision trees, and support vector machines. The course heavily emphasizes a practical, hands-on approach, using Python and industry-standard libraries like Scikit-learn to solve real-world problems. By the end, you will have the skills to preprocess data, train, evaluate, and deploy machine learning models, and a solid foundation to tackle more advanced topics like deep learning.', 79.99, 129.99, 0, 'no', '1761198959-13.jpg', '2025-10-22 23:52:44', '2025-10-22 23:55:59');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2025-10-10 16:33:52', '2025-10-10 16:33:52'),
(2, 1, 7, '2025-10-22 10:01:51', '2025-10-22 10:01:51'),
(3, 1, 8, '2025-10-22 10:01:57', '2025-10-22 10:01:57'),
(4, 8, 3, '2025-10-22 10:19:40', '2025-10-22 10:19:40'),
(5, 4, 3, '2025-10-22 10:20:24', '2025-10-22 10:20:24'),
(6, 4, 5, '2025-10-22 10:23:30', '2025-10-22 10:23:30'),
(7, 4, 7, '2025-10-22 10:23:55', '2025-10-22 10:23:55'),
(8, 2, 3, '2025-10-22 10:44:09', '2025-10-22 10:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bangla', 1, '2025-10-09 06:09:51', '2025-10-09 06:09:51'),
(2, 'English', 1, '2025-10-09 06:09:51', '2025-10-09 06:09:51');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `chapter_id` bigint(20) UNSIGNED NOT NULL,
  `is_free_premium` enum('yes','no') NOT NULL DEFAULT 'no',
  `duration` int(11) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_premium`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lesson 1: Defining Computer Science', 1, 'yes', 4, '1760099002-1.mp4', '<p style=\"text-align: justify;\">This lesson introduces you to the fascinating world of computer science, a field far broader than simply learning to code. Computer science is the scientific study of computation, algorithms, and information processing, and it forms the foundation for almost all modern technology. In this lesson, you will learn how computer science is fundamentally about problem-solving: identifying complex challenges, analyzing them, and designing logical, efficient, and effective solutions.\nYou will explore how computer scientists think, approaching problems methodically by breaking them into smaller, manageable parts, recognizing patterns, and applying abstraction to simplify complexity. The lesson emphasizes the principles of logic and reasoning, which are crucial not only in programming but also in designing algorithms, data structures, and systems that can perform automated tasks accurately and efficiently.\nBeyond technical skills, this lesson examines how computer science shapes the world around us from developing software applications and artificial intelligence systems to managing networks, databases, and cybersecurity infrastructures. You will gain insight into the interdisciplinary nature of computer science, which overlaps with mathematics, engineering, cognitive science, and even social sciences.\nBy the end of this lesson, you will understand that computer science is not just about coding it is a way of thinking critically and creatively to solve problems, innovate, and build systems that improve lives. You will appreciate the importance of algorithms, computational thinking, and automation in designing technologies that are scalable, reliable, and intelligent. This lesson lays the groundwork for your journey into deeper topics such as programming, machine learning, artificial intelligence, and software engineering, showing you that computer science is truly a science of logic, creativity, and innovation.</p>', 1000, 1, '2025-10-09 10:16:24', '2025-10-10 17:02:22'),
(2, 'Lesson 2: A Brief History of Computing', 1, 'yes', 14, '1760099311-2.mp4', '<p style=\"text-align: justify;\">This lesson takes you on a journey through the fascinating history of computing, tracing the evolution of technology from simple manual tools to the complex digital systems that shape our world today. You will begin by exploring early devices like the abacus and mechanical calculators, which laid the foundation for understanding numbers, logic, and computation. These early inventions were critical first steps toward automating calculations and solving mathematical problems more efficiently than humans could alone.\nNext, we dive into the groundbreaking work of pioneers like Charles Babbage, who conceptualized the first programmable mechanical computer, and Ada Lovelace, who is widely recognized as the world’s first computer programmer. Their visionary ideas introduced the notion that machines could not only perform calculations but could also follow a sequence of instructions a concept central to modern computing.\nThe lesson then covers the revolutionary developments of the 20th century, including Alan Turing’s theoretical Turing Machine, which formalized the concept of algorithmic computation and remains foundational to computer science today. You will also study the advent of early electronic computers like ENIAC and UNIVAC, which transformed computing from mechanical to electronic, drastically increasing speed and complexity.\nMoving forward, you will examine the rise of programming languages, operating systems, and software engineering practices that made computers more accessible, versatile, and powerful. The history of networking and the creation of the internet highlight how global communication and information sharing became possible, laying the groundwork for today’s interconnected world.\nFinally, the lesson explores modern milestones, including the emergence of personal computers, mobile computing, cloud technologies, and artificial intelligence. You will see how AI and machine learning are transforming industries, from healthcare and finance to transportation and entertainment, demonstrating that computing continues to evolve at an unprecedented pace.\nBy the end of this lesson, you will have a comprehensive understanding of how computing has developed over centuries, the visionaries who made it possible, and how historical milestones connect to today’s technologies. This knowledge will provide context for your study of computer science, showing that every algorithm, system, and application we use today has roots in a rich and fascinating history of innovation, creativity, and scientific discovery.</p>', 1000, 1, '2025-10-09 10:16:42', '2025-10-10 17:03:41'),
(3, 'Lesson 3: Fields Within Computer Science', 1, 'no', 13, '1760099417-3.mp4', '<p data-start=\"100\" data-end=\"528\" style=\"text-align: justify;\">Computer science is a vast and diverse field, encompassing numerous sub-disciplines that each focus on different aspects of computation, problem-solving, and technology development. In this lesson, you will explore the major areas of study within computer science, understanding how each contributes to the creation and application of modern computing systems.</p>\n<p data-start=\"530\" data-end=\"914\" style=\"text-align: justify;\">One key area is <strong data-start=\"546\" data-end=\"578\">Artificial Intelligence (AI)</strong>, where machines are designed to mimic human intelligence, enabling tasks such as learning, reasoning, problem-solving, and decision-making. AI powers technologies like self-driving cars, virtual assistants, recommendation systems, and advanced robotics, making it one of the most dynamic and transformative fields in computing today.</p>\n<p data-start=\"916\" data-end=\"1271\" style=\"text-align: justify;\"><strong data-start=\"916\" data-end=\"933\">Cybersecurity</strong> is another critical sub-discipline that focuses on protecting systems, networks, and data from unauthorized access, attacks, and threats. As our reliance on digital technology grows, cybersecurity experts play a vital role in safeguarding sensitive information, ensuring privacy, and maintaining the integrity of software and networks.</p>\n<p data-start=\"1273\" data-end=\"1672\" style=\"text-align: justify;\"><strong data-start=\"1273\" data-end=\"1309\">Human-Computer Interaction (HCI)</strong> examines how people interact with computers and digital systems. This field combines elements of design, psychology, and usability engineering to create interfaces and experiences that are intuitive, efficient, and user-friendly. Innovations in HCI have made technology more accessible, from smartphones and wearables to immersive virtual reality environments.</p>\n<p data-start=\"1674\" data-end=\"2109\" style=\"text-align: justify;\"><strong data-start=\"1674\" data-end=\"1698\">Software Engineering</strong> is the discipline of designing, developing, testing, and maintaining software systems. It emphasizes best practices, methodologies, and tools to create reliable, scalable, and maintainable software that meets real-world needs. Software engineers apply principles from computer science, mathematics, and project management to develop applications ranging from simple mobile apps to complex enterprise systems.</p>\n<p data-start=\"2111\" data-end=\"2572\" style=\"text-align: justify;\">Other important fields include <strong data-start=\"2142\" data-end=\"2158\">Data Science</strong>, which focuses on extracting insights from large datasets; <strong data-start=\"2218\" data-end=\"2254\">Networks and Distributed Systems</strong>, which study communication between computers and the infrastructure of the internet; <strong data-start=\"2340\" data-end=\"2372\">Theoretical Computer Science</strong>, which investigates the fundamental limits of computation and algorithm design; and <strong data-start=\"2457\" data-end=\"2490\">Robotics and Embedded Systems</strong>, which combine hardware and software to build intelligent machines and devices.</p>\n<p data-start=\"2574\" data-end=\"3005\" style=\"text-align: justify;\">By the end of this lesson, you will gain a clear understanding of the diverse opportunities within computer science, the skills and knowledge each field requires, and how these sub-disciplines intersect to drive innovation across industries. You will appreciate that computer science is not a single skill or role but a rich ecosystem of specialties, each contributing to the creation of technologies that shape the modern world.</p>', 1000, 1, '2025-10-09 10:17:06', '2025-10-10 17:04:41'),
(4, 'Lesson 4: Computer Science in Everyday Life', 1, 'no', 5, '1760102880-4.mp4', '<p data-start=\"103\" data-end=\"491\" style=\"text-align: justify;\">Computer science is no longer confined to laboratories or tech companies—it is a driving force behind almost every aspect of modern life. In this lesson, you will explore how computer science technologies and principles influence daily activities, shape industries, and improve the way we live, work, and communicate.</p>\n<p data-start=\"493\" data-end=\"899\" style=\"text-align: justify;\">One of the most visible impacts of computer science is in <strong data-start=\"551\" data-end=\"567\">social media</strong>, where algorithms process vast amounts of data to deliver personalized content, recommendations, and advertisements. Platforms like Facebook, Instagram, and TikTok rely on advanced computing techniques, artificial intelligence, and data analysis to connect billions of people worldwide and to create engaging digital experiences.</p>\n<p data-start=\"901\" data-end=\"1213\" style=\"text-align: justify;\"><strong data-start=\"901\" data-end=\"936\">Navigation and GPS technologies</strong> are another example of computer science in action. Modern mapping systems and GPS rely on algorithms, real-time data processing, and satellite communication to provide accurate directions, traffic updates, and location-based services that guide millions of people every day.</p>\n<p data-start=\"1215\" data-end=\"1562\" style=\"text-align: justify;\">In <strong data-start=\"1218\" data-end=\"1271\">online banking and financial technology (FinTech)</strong>, computer science powers secure transactions, fraud detection, digital wallets, and mobile banking apps, enabling fast, reliable, and safe management of money. Security protocols, encryption, and authentication systems are essential to protect sensitive financial data from cyber threats.</p>\n<p data-start=\"1564\" data-end=\"1923\" style=\"text-align: justify;\"><strong data-start=\"1564\" data-end=\"1589\">Healthcare technology</strong> has been revolutionized by computer science as well. From electronic health records and telemedicine platforms to AI-driven diagnostics and wearable health monitors, computing enables faster, more accurate, and more personalized medical care. These innovations improve patient outcomes and make healthcare more accessible globally.</p>\n<p data-start=\"1925\" data-end=\"2296\" style=\"text-align: justify;\">Other areas where computer science impacts everyday life include <strong data-start=\"1990\" data-end=\"2063\">e-commerce, entertainment, smart homes, transportation, and education</strong>. Algorithms recommend products on online stores, streaming platforms deliver personalized content, smart devices automate household tasks, and educational software enables interactive learning experiences for students of all ages.</p>\n<p data-start=\"2298\" data-end=\"2789\" style=\"text-align: justify;\">By the end of this lesson, you will understand that computer science is deeply embedded in modern society, shaping the way we interact, communicate, and solve problems. It highlights how skills in computation, logic, and technology can be applied to create practical solutions that affect millions of lives. This lesson emphasizes that computer science is not just a technical field but a transformative force with far reaching effects on everyday life, innovation, and the global economy.</p>', 1000, 1, '2025-10-09 10:17:25', '2025-10-10 17:28:00'),
(5, 'Lesson 1: The Von Neumann Architecture', 2, 'no', 11, '1760187106-5.mp4', '<p data-start=\"139\" data-end=\"562\" style=\"text-align: justify;\">The Von Neumann Architecture is the foundational model for nearly all modern computers. Proposed by John von Neumann in the 1940s, this architecture provides a clear blueprint for how a computer’s core components are structured and how they communicate with each other. Understanding this model is essential for anyone studying computer science, as it explains how computers execute programs and process data efficiently.</p>\n<p data-start=\"564\" data-end=\"666\" style=\"text-align: justify;\">In the Von Neumann Architecture, a computer is typically divided into the following main components:</p>\n<ol data-start=\"668\" data-end=\"1832\" style=\"text-align: justify;\">\n<li data-start=\"668\" data-end=\"982\" style=\"\">\n<p data-start=\"671\" data-end=\"707\"><strong data-start=\"671\" data-end=\"705\">Central Processing Unit (CPU):</strong></p>\n<ul data-start=\"711\" data-end=\"982\">\n<li data-start=\"711\" data-end=\"780\">\n<p data-start=\"713\" data-end=\"780\">The brain of the computer responsible for executing instructions.</p>\n</li>\n<li data-start=\"784\" data-end=\"881\">\n<p data-start=\"786\" data-end=\"881\">Consists of the Arithmetic Logic Unit (ALU) for performing calculations and logic operations.</p>\n</li>\n<li data-start=\"885\" data-end=\"982\">\n<p data-start=\"887\" data-end=\"982\">Includes the Control Unit (CU), which directs data flow between CPU, memory, and I/O devices.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"984\" data-end=\"1284\" style=\"\">\n<p data-start=\"987\" data-end=\"1000\"><strong data-start=\"987\" data-end=\"998\">Memory:</strong></p>\n<ul data-start=\"1004\" data-end=\"1284\">\n<li data-start=\"1004\" data-end=\"1075\">\n<p data-start=\"1006\" data-end=\"1075\">Stores both program instructions and data in a single shared space.</p>\n</li>\n<li data-start=\"1079\" data-end=\"1177\">\n<p data-start=\"1081\" data-end=\"1177\">Divided into primary memory (RAM) for fast access and secondary storage for long-term storage.</p>\n</li>\n<li data-start=\"1181\" data-end=\"1284\">\n<p data-start=\"1183\" data-end=\"1284\">Sequential access to memory allows the CPU to fetch, decode, and execute instructions step by step.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1286\" data-end=\"1601\" style=\"\">\n<p data-start=\"1289\" data-end=\"1322\"><strong data-start=\"1289\" data-end=\"1320\">Input/Output (I/O) Devices:</strong></p>\n<ul data-start=\"1326\" data-end=\"1601\">\n<li data-start=\"1326\" data-end=\"1435\">\n<p data-start=\"1328\" data-end=\"1435\">Input devices (keyboard, mouse, sensors) allow the computer to receive data from the user or environment.</p>\n</li>\n<li data-start=\"1439\" data-end=\"1520\">\n<p data-start=\"1441\" data-end=\"1520\">Output devices (monitor, printer, speakers) provide results back to the user.</p>\n</li>\n<li data-start=\"1524\" data-end=\"1601\">\n<p data-start=\"1526\" data-end=\"1601\">I/O operations are coordinated by the CPU to ensure smooth communication.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1603\" data-end=\"1832\" style=\"\">\n<p data-start=\"1606\" data-end=\"1636\"><strong data-start=\"1606\" data-end=\"1634\">Buses and Communication:</strong></p>\n<ul data-start=\"1640\" data-end=\"1832\">\n<li data-start=\"1640\" data-end=\"1736\">\n<p data-start=\"1642\" data-end=\"1736\">Buses are pathways that transfer data and instructions between CPU, memory, and I/O devices.</p>\n</li>\n<li data-start=\"1740\" data-end=\"1832\">\n<p data-start=\"1742\" data-end=\"1832\">Control signals from the Control Unit ensure that data moves accurately and efficiently.</p>\n</li>\n</ul>\n</li>\n</ol>\n<p data-start=\"1834\" data-end=\"1853\" style=\"text-align: justify;\"><strong data-start=\"1834\" data-end=\"1851\">Key Concepts:</strong></p>\n<ul data-start=\"1854\" data-end=\"2288\" style=\"text-align: justify;\">\n<li data-start=\"1854\" data-end=\"1961\" style=\"\">\n<p data-start=\"1856\" data-end=\"1961\"><strong data-start=\"1856\" data-end=\"1883\">Stored-Program Concept:</strong> Instructions and data share the same memory, enabling flexible programming.</p>\n</li>\n<li data-start=\"1962\" data-end=\"2053\" style=\"\">\n<p data-start=\"1964\" data-end=\"2053\"><strong data-start=\"1964\" data-end=\"1989\">Sequential Execution:</strong> Instructions are processed one at a time in a specific order.</p>\n</li>\n<li data-start=\"2054\" data-end=\"2162\" style=\"\">\n<p data-start=\"2056\" data-end=\"2162\"><strong data-start=\"2056\" data-end=\"2083\">Von Neumann Bottleneck:</strong> Limited data transfer speed between CPU and memory can slow down processing.</p>\n</li>\n<li data-start=\"2163\" data-end=\"2288\" style=\"\">\n<p data-start=\"2165\" data-end=\"2288\"><strong data-start=\"2165\" data-end=\"2182\">Universality:</strong> Most modern computers, from desktops to smartphones, follow this architecture with minor modifications.</p>\n</li>\n</ul>\n<p data-start=\"2290\" data-end=\"2540\" style=\"text-align: justify;\">By understanding the Von Neumann Architecture, students gain insight into how modern computers work at a fundamental level, setting the stage for learning about more advanced topics like parallel computing, pipelining, and modern CPU optimizations.</p>', 1000, 1, '2025-10-09 10:20:50', '2025-10-11 17:19:33'),
(6, 'Lesson 2: Inside the CPU', 2, 'no', 18, '1760188471-6.mp4', '<p data-start=\"103\" data-end=\"492\" style=\"text-align: justify;\">The Central Processing Unit (CPU) is often referred to as the “brain” of a computer because it carries out instructions and processes data. Understanding the internal components of the CPU is essential for grasping how computers execute programs efficiently. The CPU consists of several critical parts that work together to perform computations, control operations, and manage data flow.</p>\n<ol data-start=\"494\" data-end=\"1710\" style=\"text-align: justify;\">\n<li data-start=\"494\" data-end=\"796\" style=\"\">\n<p data-start=\"497\" data-end=\"521\"><strong data-start=\"497\" data-end=\"519\">Control Unit (CU):</strong></p>\n<ul data-start=\"525\" data-end=\"796\">\n<li data-start=\"525\" data-end=\"603\">\n<p data-start=\"527\" data-end=\"603\">Directs the operation of the CPU and coordinates between other components.</p>\n</li>\n<li data-start=\"607\" data-end=\"713\">\n<p data-start=\"609\" data-end=\"713\">Fetches instructions from memory, decodes them, and sends appropriate control signals to execute them.</p>\n</li>\n<li data-start=\"717\" data-end=\"796\">\n<p data-start=\"719\" data-end=\"796\">Manages the flow of data between the CPU, memory, and input/output devices.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"798\" data-end=\"1132\" style=\"\">\n<p data-start=\"801\" data-end=\"835\"><strong data-start=\"801\" data-end=\"833\">Arithmetic Logic Unit (ALU):</strong></p>\n<ul data-start=\"839\" data-end=\"1132\">\n<li data-start=\"839\" data-end=\"946\">\n<p data-start=\"841\" data-end=\"946\">Responsible for performing all arithmetic operations (addition, subtraction, multiplication, division).</p>\n</li>\n<li data-start=\"950\" data-end=\"1046\">\n<p data-start=\"952\" data-end=\"1046\">Handles logical operations (comparisons like greater than, equal to, or Boolean operations).</p>\n</li>\n<li data-start=\"1050\" data-end=\"1132\">\n<p data-start=\"1052\" data-end=\"1132\">Works closely with the Control Unit to process data as instructed by programs.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1134\" data-end=\"1383\" style=\"\">\n<p data-start=\"1137\" data-end=\"1153\"><strong data-start=\"1137\" data-end=\"1151\">Registers:</strong></p>\n<ul data-start=\"1157\" data-end=\"1383\">\n<li data-start=\"1157\" data-end=\"1212\">\n<p data-start=\"1159\" data-end=\"1212\">Small, high-speed storage locations inside the CPU.</p>\n</li>\n<li data-start=\"1216\" data-end=\"1289\">\n<p data-start=\"1218\" data-end=\"1289\">Temporarily hold instructions, data, and addresses during processing.</p>\n</li>\n<li data-start=\"1293\" data-end=\"1383\">\n<p data-start=\"1295\" data-end=\"1383\">Examples include the Program Counter (PC), Instruction Register (IR), and Accumulator.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1385\" data-end=\"1710\" style=\"\">\n<p data-start=\"1388\" data-end=\"1435\"><strong data-start=\"1388\" data-end=\"1433\">Instruction Cycle (Fetch-Decode-Execute):</strong></p>\n<ul data-start=\"1439\" data-end=\"1710\">\n<li data-start=\"1439\" data-end=\"1508\">\n<p data-start=\"1441\" data-end=\"1508\"><strong data-start=\"1441\" data-end=\"1451\">Fetch:</strong> The Control Unit retrieves an instruction from memory.</p>\n</li>\n<li data-start=\"1512\" data-end=\"1599\">\n<p data-start=\"1514\" data-end=\"1599\"><strong data-start=\"1514\" data-end=\"1525\">Decode:</strong> The instruction is interpreted to determine the operation and operands.</p>\n</li>\n<li data-start=\"1603\" data-end=\"1710\">\n<p data-start=\"1605\" data-end=\"1710\"><strong data-start=\"1605\" data-end=\"1617\">Execute:</strong> The ALU performs the required operation, and the result is stored in a register or memory.</p>\n</li>\n</ul>\n</li>\n</ol>\n<p data-start=\"1712\" data-end=\"1731\" style=\"text-align: justify;\"><strong data-start=\"1712\" data-end=\"1729\">Key Concepts:</strong></p>\n<ul data-start=\"1732\" data-end=\"2144\" style=\"text-align: justify;\">\n<li data-start=\"1732\" data-end=\"1822\" style=\"\">\n<p data-start=\"1734\" data-end=\"1822\"><strong data-start=\"1734\" data-end=\"1764\">CPU as the Core Processor:</strong> All major computations and decision-making happen here.</p>\n</li>\n<li data-start=\"1823\" data-end=\"1920\" style=\"\">\n<p data-start=\"1825\" data-end=\"1920\"><strong data-start=\"1825\" data-end=\"1850\">Speed and Efficiency:</strong> Registers and cache memory inside the CPU allow faster data access.</p>\n</li>\n<li data-start=\"1921\" data-end=\"2030\" style=\"\">\n<p data-start=\"1923\" data-end=\"2030\"><strong data-start=\"1923\" data-end=\"1940\">Coordination:</strong> The Control Unit ensures all parts of the CPU and peripheral devices work harmoniously.</p>\n</li>\n<li data-start=\"2031\" data-end=\"2144\" style=\"\">\n<p data-start=\"2033\" data-end=\"2144\"><strong data-start=\"2033\" data-end=\"2056\">Pipeline Potential:</strong> Modern CPUs can execute multiple instructions in overlapping stages to improve speed.</p>\n</li>\n</ul>\n<p data-start=\"2146\" data-end=\"2393\" style=\"text-align: justify;\">By exploring the internal structure of the CPU, students gain a clear understanding of how computers execute programs step by step, laying the foundation for studying advanced topics like pipelining, parallelism, and CPU optimization techniques.</p>', 1000, 1, '2025-10-09 10:21:25', '2025-10-11 17:21:18'),
(7, 'Lesson 3: Memory and Storage Hierarchy', 2, 'no', 13, '1760188505-7.mp4', '<p data-start=\"110\" data-end=\"485\" style=\"text-align: justify;\">Understanding how computers store and access data is crucial for optimizing performance and designing efficient programs. The memory and storage hierarchy explains how different types of memory and storage devices are organized based on speed, cost, and capacity. Each level in the hierarchy has trade-offs between how fast it can be accessed and how much data it can hold.</p>\n<ol data-start=\"487\" data-end=\"1758\" style=\"text-align: justify;\">\n<li data-start=\"487\" data-end=\"758\" style=\"\">\n<p data-start=\"490\" data-end=\"506\"><strong data-start=\"490\" data-end=\"504\">Registers:</strong></p>\n<ul data-start=\"510\" data-end=\"758\">\n<li data-start=\"510\" data-end=\"579\">\n<p data-start=\"512\" data-end=\"579\">Located inside the CPU, registers are the fastest form of memory.</p>\n</li>\n<li data-start=\"583\" data-end=\"678\">\n<p data-start=\"585\" data-end=\"678\">They temporarily hold instructions, addresses, or data being actively processed by the CPU.</p>\n</li>\n<li data-start=\"682\" data-end=\"758\">\n<p data-start=\"684\" data-end=\"758\">Limited in number and capacity, but critical for high-speed computation.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"760\" data-end=\"1005\" style=\"\">\n<p data-start=\"763\" data-end=\"782\"><strong data-start=\"763\" data-end=\"780\">Cache Memory:</strong></p>\n<ul data-start=\"786\" data-end=\"1005\">\n<li data-start=\"786\" data-end=\"840\">\n<p data-start=\"788\" data-end=\"840\">Small, high-speed memory located close to the CPU.</p>\n</li>\n<li data-start=\"844\" data-end=\"932\">\n<p data-start=\"846\" data-end=\"932\">Stores frequently used data and instructions to reduce access time from main memory.</p>\n</li>\n<li data-start=\"936\" data-end=\"1005\">\n<p data-start=\"938\" data-end=\"1005\">Levels (L1, L2, L3) provide different balances of speed and size.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1007\" data-end=\"1257\" style=\"\">\n<p data-start=\"1010\" data-end=\"1043\"><strong data-start=\"1010\" data-end=\"1041\">Random Access Memory (RAM):</strong></p>\n<ul data-start=\"1047\" data-end=\"1257\">\n<li data-start=\"1047\" data-end=\"1115\">\n<p data-start=\"1049\" data-end=\"1115\">Main memory where programs and data are loaded during execution.</p>\n</li>\n<li data-start=\"1119\" data-end=\"1180\">\n<p data-start=\"1121\" data-end=\"1180\">Volatile memory: loses its content when the power is off.</p>\n</li>\n<li data-start=\"1184\" data-end=\"1257\">\n<p data-start=\"1186\" data-end=\"1257\">Offers a balance of speed and capacity, larger than cache but slower.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1259\" data-end=\"1531\" style=\"\">\n<p data-start=\"1262\" data-end=\"1286\"><strong data-start=\"1262\" data-end=\"1284\">Secondary Storage:</strong></p>\n<ul data-start=\"1290\" data-end=\"1531\">\n<li data-start=\"1290\" data-end=\"1357\">\n<p data-start=\"1292\" data-end=\"1357\">Includes Solid-State Drives (SSDs) and Hard Disk Drives (HDDs).</p>\n</li>\n<li data-start=\"1361\" data-end=\"1448\">\n<p data-start=\"1363\" data-end=\"1448\">SSDs are faster and more reliable than HDDs, but often more expensive per gigabyte.</p>\n</li>\n<li data-start=\"1452\" data-end=\"1531\">\n<p data-start=\"1454\" data-end=\"1531\">HDDs provide large storage capacity at lower cost but slower access speeds.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1533\" data-end=\"1758\" style=\"\">\n<p data-start=\"1536\" data-end=\"1572\"><strong data-start=\"1536\" data-end=\"1570\">Tertiary and Off-line Storage:</strong></p>\n<ul data-start=\"1576\" data-end=\"1758\">\n<li data-start=\"1576\" data-end=\"1657\">\n<p data-start=\"1578\" data-end=\"1657\">Optical disks, tapes, or cloud storage used for backup and archival purposes.</p>\n</li>\n<li data-start=\"1661\" data-end=\"1758\">\n<p data-start=\"1663\" data-end=\"1758\">Very high capacity but slow access, used for long-term storage rather than active processing.</p>\n</li>\n</ul>\n</li>\n</ol>\n<p data-start=\"1760\" data-end=\"1779\" style=\"text-align: justify;\"><strong data-start=\"1760\" data-end=\"1777\">Key Concepts:</strong></p>\n<ul data-start=\"1780\" data-end=\"2309\" style=\"text-align: justify;\">\n<li data-start=\"1780\" data-end=\"1921\" style=\"\">\n<p data-start=\"1782\" data-end=\"1921\"><strong data-start=\"1782\" data-end=\"1815\">Speed vs. Capacity Trade-off:</strong> Faster memory (like cache) is smaller and expensive, while slower memory (like HDD) is large and cheap.</p>\n</li>\n<li data-start=\"1922\" data-end=\"2038\" style=\"\">\n<p data-start=\"1924\" data-end=\"2038\"><strong data-start=\"1924\" data-end=\"1949\">Hierarchy Importance:</strong> Proper use of the memory hierarchy improves program performance and system efficiency.</p>\n</li>\n<li data-start=\"2039\" data-end=\"2200\" style=\"\">\n<p data-start=\"2041\" data-end=\"2200\"><strong data-start=\"2041\" data-end=\"2078\">Volatile vs. Non-Volatile Memory:</strong> Volatile memory requires power to retain data (RAM), while non-volatile memory retains data without power (SSDs, HDDs).</p>\n</li>\n<li data-start=\"2201\" data-end=\"2309\" style=\"\">\n<p data-start=\"2203\" data-end=\"2309\"><strong data-start=\"2203\" data-end=\"2221\">Data Locality:</strong> Modern CPUs exploit spatial and temporal locality to optimize memory access patterns.</p>\n</li>\n</ul>\n<p data-start=\"2311\" data-end=\"2614\" style=\"text-align: justify;\">By understanding the memory and storage hierarchy, students can design software and systems that maximize efficiency, reduce latency, and make better trade-offs between speed, cost, and capacity. This knowledge is fundamental for computer architecture, operating systems, and performance optimization.</p>', 1000, 1, '2025-10-09 10:22:23', '2025-10-11 17:22:29'),
(8, 'Lesson 4: How Data Moves: Buses and I/O Devices', 2, 'no', 28, '1760188539-8.mp4', '<p data-start=\"126\" data-end=\"488\" style=\"text-align: justify;\">Data movement is a critical aspect of computer operations, ensuring that information flows smoothly between the CPU, memory, and peripheral devices. This lesson explores how buses and input/output (I/O) devices facilitate communication within a computer system. Understanding these mechanisms is essential for designing efficient hardware and software systems.</p>\n<ol data-start=\"490\" data-end=\"2040\" style=\"text-align: justify;\">\n<li data-start=\"490\" data-end=\"1218\" style=\"\">\n<p data-start=\"493\" data-end=\"505\"><strong data-start=\"493\" data-end=\"503\">Buses:</strong></p>\n<ul data-start=\"509\" data-end=\"1218\">\n<li data-start=\"509\" data-end=\"651\">\n<p data-start=\"511\" data-end=\"651\"><strong data-start=\"511\" data-end=\"526\">Definition:</strong> Buses are communication pathways that transfer data, addresses, and control signals between different computer components.</p>\n</li>\n<li data-start=\"655\" data-end=\"988\">\n<p data-start=\"657\" data-end=\"678\"><strong data-start=\"657\" data-end=\"676\">Types of Buses:</strong></p>\n<ul data-start=\"684\" data-end=\"988\">\n<li data-start=\"684\" data-end=\"759\">\n<p data-start=\"686\" data-end=\"759\"><strong data-start=\"686\" data-end=\"699\">Data Bus:</strong> Carries actual data between CPU, memory, and I/O devices.</p>\n</li>\n<li data-start=\"765\" data-end=\"868\">\n<p data-start=\"767\" data-end=\"868\"><strong data-start=\"767\" data-end=\"783\">Address Bus:</strong> Specifies the memory or I/O location where data should be read from or written to.</p>\n</li>\n<li data-start=\"874\" data-end=\"988\">\n<p data-start=\"876\" data-end=\"988\"><strong data-start=\"876\" data-end=\"892\">Control Bus:</strong> Sends control signals to coordinate operations, such as read/write commands or clock signals.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"992\" data-end=\"1103\">\n<p data-start=\"994\" data-end=\"1103\"><strong data-start=\"994\" data-end=\"1008\">Bus Width:</strong> Determines how much data can be transferred at once; wider buses allow faster data transfer.</p>\n</li>\n<li data-start=\"1107\" data-end=\"1218\">\n<p data-start=\"1109\" data-end=\"1218\"><strong data-start=\"1109\" data-end=\"1123\">Bus Speed:</strong> Affects overall system performance by controlling how quickly data moves between components.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1220\" data-end=\"1480\" style=\"\">\n<p data-start=\"1223\" data-end=\"1243\"><strong data-start=\"1223\" data-end=\"1241\">Input Devices:</strong></p>\n<ul data-start=\"1247\" data-end=\"1480\">\n<li data-start=\"1247\" data-end=\"1300\">\n<p data-start=\"1249\" data-end=\"1300\">Examples: Keyboards, mice, scanners, and sensors.</p>\n</li>\n<li data-start=\"1304\" data-end=\"1386\">\n<p data-start=\"1306\" data-end=\"1386\">Function: Allow the user or environment to send data into the computer system.</p>\n</li>\n<li data-start=\"1390\" data-end=\"1480\">\n<p data-start=\"1392\" data-end=\"1480\">Operation: Data from input devices is converted into signals that the CPU can process.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1482\" data-end=\"1736\" style=\"\">\n<p data-start=\"1485\" data-end=\"1506\"><strong data-start=\"1485\" data-end=\"1504\">Output Devices:</strong></p>\n<ul data-start=\"1510\" data-end=\"1736\">\n<li data-start=\"1510\" data-end=\"1569\">\n<p data-start=\"1512\" data-end=\"1569\">Examples: Monitors, printers, speakers, and projectors.</p>\n</li>\n<li data-start=\"1573\" data-end=\"1639\">\n<p data-start=\"1575\" data-end=\"1639\">Function: Display or convey processed information to the user.</p>\n</li>\n<li data-start=\"1643\" data-end=\"1736\">\n<p data-start=\"1645\" data-end=\"1736\">Operation: Data from the CPU is transmitted via buses to output devices for presentation.</p>\n</li>\n</ul>\n</li>\n<li data-start=\"1738\" data-end=\"2040\" style=\"\">\n<p data-start=\"1741\" data-end=\"1772\"><strong data-start=\"1741\" data-end=\"1770\">Peripheral Communication:</strong></p>\n<ul data-start=\"1776\" data-end=\"2040\">\n<li data-start=\"1776\" data-end=\"1889\">\n<p data-start=\"1778\" data-end=\"1889\"><strong data-start=\"1778\" data-end=\"1812\">USB, PCI, and other interfaces</strong> enable high-speed data transfer between the computer and external devices.</p>\n</li>\n<li data-start=\"1893\" data-end=\"2040\">\n<p data-start=\"1895\" data-end=\"2040\">Modern systems use direct memory access (DMA) to allow peripherals to read/write memory without constantly using the CPU, improving efficiency.</p>\n</li>\n</ul>\n</li>\n</ol>\n<p data-start=\"2042\" data-end=\"2061\" style=\"text-align: justify;\"><strong data-start=\"2042\" data-end=\"2059\">Key Concepts:</strong></p>\n<ul data-start=\"2062\" data-end=\"2595\" style=\"text-align: justify;\">\n<li data-start=\"2062\" data-end=\"2174\" style=\"\">\n<p data-start=\"2064\" data-end=\"2174\"><strong data-start=\"2064\" data-end=\"2101\">Coordination via Control Signals:</strong> The control bus ensures correct timing and sequence of data transfers.</p>\n</li>\n<li data-start=\"2175\" data-end=\"2272\" style=\"\">\n<p data-start=\"2177\" data-end=\"2272\"><strong data-start=\"2177\" data-end=\"2202\">Data Flow Efficiency:</strong> Efficient use of buses and I/O pathways reduces system bottlenecks.</p>\n</li>\n<li data-start=\"2273\" data-end=\"2387\" style=\"\">\n<p data-start=\"2275\" data-end=\"2387\"><strong data-start=\"2275\" data-end=\"2302\">Peripheral Integration:</strong> Input and output devices expand the functionality of computers beyond computation.</p>\n</li>\n<li data-start=\"2388\" data-end=\"2595\" style=\"\">\n<p data-start=\"2390\" data-end=\"2595\"><strong data-start=\"2390\" data-end=\"2413\">Real-World Example:</strong> When typing on a keyboard, the keystroke data travels through the input bus to memory, processed by the CPU, and may appear on a monitor via the output bus almost instantaneously.</p>\n</li>\n</ul>\n<p data-start=\"2597\" data-end=\"2913\" style=\"text-align: justify;\">By understanding how data moves within a computer system and how I/O devices interact with the CPU and memory, students gain a complete picture of computer operation and performance. This knowledge lays the foundation for topics like bus architecture design, system optimization, and hardware-software integration.</p>', 1000, 1, '2025-10-09 10:22:37', '2025-10-11 17:25:53'),
(9, 'Lesson 1: What Is an Algorithm?', 3, 'no', 8, '1760249720-9.mp4', '<p data-start=\"37\" data-end=\"414\" style=\"text-align: justify;\">An algorithm is a clear, step-by-step procedure designed to solve a specific problem or perform a particular task. In computer science, algorithms form the foundation of all programming and computational thinking—they tell computers exactly what steps to follow to achieve a desired result. However, algorithms aren’t limited to computers; we use them every day in real life.</p>\n<p data-start=\"416\" data-end=\"886\" style=\"text-align: justify;\">For example, a <strong data-start=\"431\" data-end=\"441\">recipe</strong> is an algorithm for cooking a meal: it provides ingredients (inputs) and a sequence of instructions (steps) that lead to a finished dish (output). Similarly, when a <strong data-start=\"607\" data-end=\"614\">GPS</strong> gives you driving directions, it’s running an algorithm that finds the best route based on distance, traffic, and time. Even <strong data-start=\"740\" data-end=\"759\">sorting laundry</strong> by color or fabric type before washing is an algorithm—it’s a logical process that ensures efficiency and prevents mistakes.</p>\n<p data-start=\"888\" data-end=\"1334\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">In computing, algorithms can be simple, like adding two numbers, or highly complex, like detecting faces in photos or predicting weather patterns. What makes an algorithm effective is its <strong data-start=\"1076\" data-end=\"1116\">clarity, efficiency, and correctness&nbsp;</strong>it must always produce the right result in a finite number of steps. Understanding algorithms helps us think logically, break problems into smaller parts, and design solutions that both humans and machines can follow.</p>', 1000, 1, '2025-10-09 10:24:36', '2025-10-12 10:21:37'),
(10, 'Lesson 2: Representing Algorithms: Flowcharts and Pseudocode', 3, 'no', 14, '1760249855-10.mp4', '<p style=\"text-align: justify;\">Before writing actual code, programmers use tools like <strong>flowcharts</strong> and <strong>pseudocode</strong> to plan and visualize how an algorithm will work. These representations help organize thoughts, reduce errors, and make complex logic easier to understand and communicate.</p>\n<p style=\"text-align: justify;\">A <strong>flowchart</strong> is a visual diagram that uses shapes and arrows to show the sequence of steps in an algorithm. Each shape has a specific meaning—for instance, ovals represent the start or end, rectangles show processes or actions, diamonds indicate decision points (like “if” conditions), and arrows show the direction of flow. Flowcharts are excellent for getting an overall picture of how data and decisions move through a system.</p>\n<p style=\"text-align: justify;\">On the other hand, <strong>pseudocode</strong> expresses the logic of an algorithm using structured, plain-language statements that resemble real programming syntax but aren’t bound by the strict rules of any programming language. For example, instead of writing in Python or Java, you might write:</p>\n<pre style=\"text-align: justify;\"><code>IF temperature &gt; 30 THEN\n   PRINT \"It\'s a hot day\"\nELSE\n   PRINT \"It\'s a cool day\"\nEND IF\n</code></pre>\n<p style=\"text-align: justify;\">This makes the algorithm easy to read and modify before converting it into real code.</p>\n<p style=\"text-align: justify;\">Together, flowcharts and pseudocode serve as essential tools in software development—they help programmers <strong>think logically, plan effectively, and translate ideas into working programs</strong> with fewer mistakes.</p>', 1000, 1, '2025-10-09 10:24:47', '2025-10-12 10:21:52'),
(11, 'Lesson 3: Algorithm Efficiency and Big O Basics', 3, 'no', 13, '1760249932-11.mp4', '<p data-start=\"55\" data-end=\"421\" style=\"text-align: justify;\">Not all algorithms that solve a problem are equally good—some take more time or use more memory than others. <strong data-start=\"164\" data-end=\"188\">Algorithm efficiency</strong> is about measuring how well an algorithm uses computational resources like time and memory as the size of the input grows. This helps programmers choose the most effective solution for large-scale or performance-critical problems.</p>\n<p data-start=\"423\" data-end=\"717\" style=\"text-align: justify;\">One of the key ways to analyze efficiency is through <strong data-start=\"476\" data-end=\"495\">time complexity</strong>, which describes how the runtime of an algorithm changes as input size increases. To express this, computer scientists use <strong data-start=\"619\" data-end=\"637\">Big O notation</strong>, a mathematical way of classifying algorithms according to their growth rate.</p>\n<p data-start=\"719\" data-end=\"1123\" style=\"text-align: justify;\">For example, in a <strong data-start=\"737\" data-end=\"754\">linear search</strong>, where each element in a list is checked one by one until the target is found, the time it takes grows directly with the number of elements—this is called <strong data-start=\"910\" data-end=\"918\">O(n)</strong> complexity. In contrast, a <strong data-start=\"946\" data-end=\"963\">binary search</strong> works by repeatedly dividing a sorted list in half, quickly eliminating large portions of data, resulting in much faster performance&nbsp;<strong data-start=\"1097\" data-end=\"1109\">O(log n)</strong> complexity.</p>\n<p data-start=\"1125\" data-end=\"1382\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">Understanding these concepts helps developers write programs that run efficiently even when handling large datasets. By analyzing and comparing algorithms using Big O notation, programmers can make informed decisions to optimize performance and scalability.</p>', 1000, 1, '2025-10-09 10:25:00', '2025-10-12 10:22:12'),
(12, 'Lesson 4: Classic Algorithms: Searching and Sorting', 3, 'no', 22, '1760249995-12.mp4', '<p data-start=\"59\" data-end=\"405\" style=\"text-align: justify;\">Searching and sorting are two of the most fundamental types of algorithms in computer science. They form the backbone of countless applications—from finding a contact in your phone to organizing files or managing large databases. Understanding these classic algorithms helps you grasp how computers efficiently retrieve and arrange information.</p>\n<p data-start=\"407\" data-end=\"906\" style=\"text-align: justify;\">A <strong data-start=\"409\" data-end=\"432\">searching algorithm</strong> is used to find specific data within a collection. The simplest example is the <strong data-start=\"512\" data-end=\"529\">linear search</strong>, which checks each element one by one until it finds a match or reaches the end of the list. It’s easy to implement but can be slow for large datasets. A faster option, the <strong data-start=\"703\" data-end=\"720\">binary search</strong>, works only on sorted lists. It repeatedly divides the list in half, checking whether the target lies to the left or right, which drastically reduces the number of comparisons needed.</p>\n<p data-start=\"908\" data-end=\"1328\" style=\"text-align: justify;\"><strong data-start=\"908\" data-end=\"930\">Sorting algorithms</strong>, on the other hand, arrange data in a specific order (like ascending or descending). Two common examples are <strong data-start=\"1040\" data-end=\"1055\">bubble sort</strong> and <strong data-start=\"1060\" data-end=\"1078\">selection sort</strong>. In bubble sort, adjacent elements are repeatedly compared and swapped if they’re in the wrong order, “bubbling” larger elements to the end. Selection sort finds the smallest (or largest) element in each pass and places it in its correct position.</p>\n<p data-start=\"1330\" data-end=\"1610\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">While these classic algorithms may not be the fastest for very large datasets, they are essential for learning how data organization and logical thinking work in programming. Mastering them builds the foundation for understanding more advanced algorithms used in modern computing.</p>', 1000, 1, '2025-10-09 10:25:15', '2025-10-12 10:22:27'),
(13, 'Lesson 1: Setting Up Your Coding Environment', 4, 'no', 21, '1760364852-13.mp4', '<p data-start=\"52\" data-end=\"540\" style=\"text-align: justify;\">Before you begin coding, it’s important to set up a comfortable and efficient environment for writing, running, and testing your programs. In this lesson, you’ll learn how to install <strong data-start=\"235\" data-end=\"245\">Python</strong>, one of the most popular programming languages used in web development, data science, and artificial intelligence. You’ll explore how to verify the installation using the command line and understand the difference between the Python interpreter and Integrated Development Environments (IDEs).</p>\n<p data-start=\"542\" data-end=\"916\" style=\"text-align: justify;\">You’ll then set up a simple code editor such as <strong data-start=\"590\" data-end=\"598\">IDLE</strong> (Python’s built-in environment) or <strong data-start=\"634\" data-end=\"666\">Visual Studio Code (VS Code)</strong>, which provides powerful tools like syntax highlighting, code suggestions, and integrated terminals. You’ll learn how to create and save Python files (<code data-start=\"818\" data-end=\"823\">.py</code>), organize your project folders, and run scripts both through the editor and the terminal.</p>\n<p data-start=\"918\" data-end=\"1378\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">Finally, you’ll write your very first Python program — the classic <strong data-start=\"985\" data-end=\"1004\">\"Hello, World!\"</strong> — to understand how code executes, how output is displayed, and how small mistakes (syntax errors) can be fixed. This simple exercise marks the beginning of your journey into programming, helping you build confidence and comfort in using your development tools. By the end of the lesson, you’ll have a fully working setup and be ready to start coding like a real developer.</p>', 1000, 1, '2025-10-09 10:27:53', '2025-10-13 08:19:59'),
(14, 'Lesson 2: Variables and Data Types', 4, 'no', 14, '1760364974-14.mp4', '<p data-start=\"42\" data-end=\"503\" style=\"text-align: justify;\">In this lesson, you’ll learn one of the most important foundations of programming — how to store, label, and work with data using <strong data-start=\"172\" data-end=\"185\">variables</strong> and <strong data-start=\"190\" data-end=\"204\">data types</strong> in Python. A <em data-start=\"218\" data-end=\"228\">variable</em> acts like a container that holds information, such as a number, text, or a list of items. You’ll discover how to create variables with meaningful names, assign values to them, and understand the rules for naming (like not starting with numbers or using reserved keywords).</p>\n<p data-start=\"505\" data-end=\"907\" style=\"text-align: justify;\">You’ll also explore Python’s <strong data-start=\"534\" data-end=\"554\">basic data types</strong>, including integers (<code data-start=\"576\" data-end=\"581\">int</code>), floating-point numbers (<code data-start=\"608\" data-end=\"615\">float</code>), strings (<code data-start=\"627\" data-end=\"632\">str</code>), and booleans (<code data-start=\"649\" data-end=\"655\">bool</code>). Through examples, you’ll see how these data types differ and when to use each one. The lesson will cover how to perform basic mathematical operations, combine strings, and convert between types using functions like <code data-start=\"873\" data-end=\"880\">int()</code>, <code data-start=\"882\" data-end=\"891\">float()</code>, and <code data-start=\"897\" data-end=\"904\">str()</code>.</p>\n<p data-start=\"909\" data-end=\"1270\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">By experimenting with real code, you’ll learn how Python automatically detects a variable’s data type and how dynamic typing makes coding more flexible. By the end, you’ll understand how variables and data types work together to make your programs store, process, and display information efficiently — forming the building blocks for all future Python projects.</p>', 1000, 1, '2025-10-09 10:28:09', '2025-10-13 08:19:44');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_premium`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES
(15, 'Lesson 3: User Input and Basic Output', 4, 'no', 5, '1760365150-15.mp4', '<p data-start=\"45\" data-end=\"317\" style=\"text-align: justify;\">In this lesson, you’ll learn how to make your Python programs interactive by allowing users to enter data and see dynamic results. Programming becomes more engaging when users can communicate with your program — providing input and receiving meaningful output in return.</p>\n<p data-start=\"319\" data-end=\"678\" style=\"text-align: justify;\">You’ll start by exploring the <strong data-start=\"349\" data-end=\"362\"><code data-start=\"351\" data-end=\"360\">input()</code></strong> function, which lets you collect information directly from the keyboard. You’ll learn how everything entered through <code data-start=\"480\" data-end=\"489\">input()</code> is treated as a string, and how to convert it into other data types like integers or floats using <strong data-start=\"588\" data-end=\"604\">type casting</strong> (e.g., <code data-start=\"612\" data-end=\"626\">int(input())</code> or <code data-start=\"630\" data-end=\"646\">float(input())</code>) for performing calculations.</p>\n<p data-start=\"680\" data-end=\"993\" style=\"text-align: justify;\">Next, you’ll use the <strong data-start=\"701\" data-end=\"714\"><code data-start=\"703\" data-end=\"712\">print()</code></strong> function to display messages, results, and formatted text to the screen. You’ll practice combining text and variables in a single output line, learn about <strong data-start=\"870\" data-end=\"894\">string concatenation</strong> and <strong data-start=\"899\" data-end=\"912\">f-strings</strong> for cleaner formatting, and explore how to control line breaks and separators.</p>\n<p data-start=\"995\" data-end=\"1255\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">By the end of this lesson, you’ll be able to build small, interactive programs—like a greeting generator or a simple calculator—that respond intelligently to user input. These skills form the foundation for creating dynamic, user-driven applications in Python.</p>', 1000, 1, '2025-10-09 10:28:22', '2025-10-13 08:19:28'),
(16, 'Lesson 4: Control Flow: Conditionals and Loops', 4, 'no', 16, '1760365304-16.mp4', '<p data-start=\"54\" data-end=\"377\" style=\"text-align: justify;\">In this lesson, you’ll learn how to make your Python programs think and decide — controlling the flow of execution using <strong data-start=\"175\" data-end=\"201\">conditional statements</strong> and <strong data-start=\"206\" data-end=\"215\">loops</strong>. Control flow determines which parts of your code run and how many times they execute, allowing your programs to respond intelligently to different situations.</p>\n<p data-start=\"379\" data-end=\"862\" style=\"text-align: justify;\">You’ll begin with <strong data-start=\"397\" data-end=\"423\">conditional statements</strong> like <code data-start=\"429\" data-end=\"433\">if</code>, <code data-start=\"435\" data-end=\"441\">elif</code>, and <code data-start=\"447\" data-end=\"453\">else</code>, which let your program choose actions based on specific conditions. You’ll learn how to compare values using <strong data-start=\"564\" data-end=\"588\">relational operators</strong> (<code data-start=\"590\" data-end=\"594\">==</code>, <code data-start=\"596\" data-end=\"600\">!=</code>, <code data-start=\"602\" data-end=\"605\">&lt;</code>, <code data-start=\"607\" data-end=\"610\">&gt;</code>, <code data-start=\"612\" data-end=\"616\">&lt;=</code>, <code data-start=\"618\" data-end=\"622\">&gt;=</code>) and combine multiple conditions with <strong data-start=\"661\" data-end=\"682\">logical operators</strong> (<code data-start=\"684\" data-end=\"689\">and</code>, <code data-start=\"691\" data-end=\"695\">or</code>, <code data-start=\"697\" data-end=\"702\">not</code>). Real-world examples, such as checking login credentials or calculating grades, will help you understand how conditionals guide decision-making in software.</p>\n<p data-start=\"864\" data-end=\"1205\" style=\"text-align: justify;\">Next, you’ll explore <strong data-start=\"885\" data-end=\"894\">loops</strong>, which let your program repeat tasks automatically. You’ll learn about <strong data-start=\"966\" data-end=\"981\"><code data-start=\"968\" data-end=\"973\">for</code> loops</strong> (for iterating over sequences like lists or strings) and <strong data-start=\"1039\" data-end=\"1056\"><code data-start=\"1041\" data-end=\"1048\">while</code> loops</strong> (for repeating until a condition is false). You’ll also discover how to control loop behavior using keywords like <code data-start=\"1171\" data-end=\"1178\">break</code>, <code data-start=\"1180\" data-end=\"1190\">continue</code>, and <code data-start=\"1196\" data-end=\"1202\">pass</code>.</p>\n<p data-start=\"1207\" data-end=\"1426\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">By the end of this lesson, you’ll be able to write programs that make decisions, repeat operations, and handle complex logic — essential skills for building everything from simple games to real-world automation scripts.</p>', 1000, 1, '2025-10-09 10:28:55', '2025-10-13 08:21:44'),
(17, 'Lesson 1: Thinking Like a Programmer', 5, 'no', 11, '1760440260-17.mp4', '<p data-start=\"42\" data-end=\"387\" style=\"text-align: justify;\">Programming isn’t just about writing code—it’s about <em data-start=\"95\" data-end=\"142\">solving problems logically and systematically</em>. Thinking like a programmer means approaching challenges with a structured mindset: first understanding the problem deeply, then designing a clear plan, and finally building the solution step by step while testing and improving along the way.</p>\n<p data-start=\"389\" data-end=\"777\" style=\"text-align: justify;\">To begin, you must <strong data-start=\"408\" data-end=\"434\">understand the problem</strong> before jumping into coding. This means reading the task carefully, identifying what inputs are given, and determining what outputs are expected. Ask yourself: “What is the problem really asking for?” and “What are the possible edge cases or exceptions?” Understanding the full context ensures you don’t waste time solving the wrong problem.</p>\n<p data-start=\"779\" data-end=\"1069\" style=\"text-align: justify;\">Next, <strong data-start=\"785\" data-end=\"804\">plan a solution</strong> before writing a single line of code. This could involve sketching a flowchart, writing pseudocode, or outlining the logic in plain language. Planning helps you visualize how your program will behave and allows you to anticipate challenges before implementation.</p>\n<p data-start=\"1071\" data-end=\"1448\" style=\"text-align: justify;\">Once you have a plan, <strong data-start=\"1093\" data-end=\"1136\">break it into smaller, manageable steps</strong>. Large problems can feel overwhelming, but breaking them into sub-tasks makes them easier to handle. For example, if you’re creating a calculator app, focus first on reading user input, then on performing one operation, and finally on displaying the result. Each small success builds toward the final program.</p>\n<p data-start=\"1450\" data-end=\"1755\" style=\"text-align: justify;\">Finally, <strong data-start=\"1459\" data-end=\"1492\">test and refine incrementally</strong>. Don’t wait until the entire program is written to check if it works—test after every major step. This helps you identify and fix bugs early, saving time and frustration. Debugging and refining your logic are natural parts of the process, not signs of failure.</p>\n<p data-start=\"1757\" data-end=\"2035\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">Thinking like a programmer is ultimately about developing <strong data-start=\"1815\" data-end=\"1864\">patience, persistence, and clarity of thought</strong>. It trains your brain to approach complex problems logically, creatively, and efficiently—skills that go far beyond coding and apply to all areas of life and engineering.</p>', 1000, 1, '2025-10-09 10:31:45', '2025-10-14 05:11:29'),
(18, 'Lesson 2: Debugging Basics', 5, 'no', 17, '1760440518-18.mp4', '<p data-start=\"32\" data-end=\"357\" style=\"text-align: justify;\">Debugging is one of the most important skills every programmer must master. It’s the process of finding and fixing errors (called <em data-start=\"162\" data-end=\"168\">bugs</em>) in your code to make sure your program works as intended. No matter how experienced you are, bugs are inevitable—so learning how to debug effectively will save you time and frustration.</p>\n<p data-start=\"359\" data-end=\"702\" style=\"text-align: justify;\">The first step in debugging is <strong data-start=\"390\" data-end=\"419\">understanding the problem</strong>. When your program doesn’t behave as expected, don’t panic. Read the error message carefully—it often tells you what went wrong and where. For example, a <em data-start=\"574\" data-end=\"587\">SyntaxError</em> might mean you missed a parenthesis, while a <em data-start=\"633\" data-end=\"644\">TypeError</em> could mean you’re trying to use the wrong kind of data.</p>\n<p data-start=\"704\" data-end=\"1079\" style=\"text-align: justify;\">Next, <strong data-start=\"710\" data-end=\"748\">use print statements or a debugger</strong> to trace the flow of your program. Printing variable values at key points helps you see what’s happening inside your code. Modern editors like VS Code, PyCharm, or even IDLE include built-in debuggers that let you pause the program, inspect variables, and step through code line by line to pinpoint the exact source of an issue.</p>\n<p data-start=\"1081\" data-end=\"1336\" style=\"text-align: justify;\">Another key strategy is <strong data-start=\"1105\" data-end=\"1141\">testing small parts of your code</strong> separately. Instead of running your whole program and hoping it works, isolate one function or block and test it independently. This makes it easier to identify where things start to go wrong.</p>\n<p data-start=\"1338\" data-end=\"1634\" style=\"text-align: justify;\">Also, <strong data-start=\"1344\" data-end=\"1383\">read your code slowly and logically</strong>. Sometimes, the bug isn’t technical—it’s a misunderstanding of how your own logic works. Explaining your code to someone else (or even to yourself out loud—a technique called <em data-start=\"1559\" data-end=\"1582\">rubber duck debugging</em>) often helps you spot mistakes you’ve overlooked.</p>\n<p data-start=\"1636\" data-end=\"1783\" style=\"text-align: justify;\">Finally, <strong data-start=\"1645\" data-end=\"1672\">fix one thing at a time</strong> and test after each change. Making too many edits at once can create new problems and make debugging harder.</p>\n<p data-start=\"1785\" data-end=\"2022\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">Debugging teaches patience, attention to detail, and problem-solving discipline. Remember: every bug is a learning opportunity. The more time you spend debugging, the better you’ll understand how your code—and your computer—really works.</p>', 1000, 1, '2025-10-09 10:31:58', '2025-10-14 05:15:18'),
(19, 'Lesson 3: Building a Mini Project: Number Guessing Game', 5, 'no', 9, '1760440790-19.mp4', '<p style=\"text-align: justify;\">Now that you’ve learned the basics of problem-solving and debugging, it’s time to apply those skills in a fun way—by <strong>building your first mini project</strong>: a <em>Number Guessing Game</em>! This simple yet engaging project helps you practice logic, loops, conditionals, and user interaction—all fundamental programming concepts.</p>\n<p style=\"text-align: justify;\">In this project, the computer will randomly choose a number within a given range (for example, between 1 and 100), and the player’s goal is to guess that number. After each guess, the program provides feedback—telling the player whether their guess is <em>too high</em>, <em>too low</em>, or <em>correct</em>. The game continues until the player guesses the right number.</p>\n<p style=\"text-align: justify;\">To begin, <strong>plan your program</strong> step by step:</p>\n<ol style=\"text-align: justify;\">\n<li style=\"\">\n<p>Import the <code inline=\"\">random</code> module to generate a random number.</p>\n</li>\n<li style=\"\">\n<p>Ask the player to input their guess using the <code inline=\"\">input()</code> function.</p>\n</li>\n<li style=\"\">\n<p>Compare the guess with the secret number.</p>\n</li>\n<li style=\"\">\n<p>Display hints like “Too high!” or “Too low!” based on the comparison.</p>\n</li>\n<li style=\"\">\n<p>Repeat the process using a loop until the player gets it right.</p>\n</li>\n<li style=\"\">\n<p>Finally, congratulate the player and show how many attempts they took.</p>\n</li>\n</ol>\n<p style=\"text-align: justify;\">Here’s a simple Python example:</p>\n<pre style=\"text-align: justify;\"><code class=\"language-python\">import random\n\nprint(\"Welcome to the Number Guessing Game!\")\nsecret_number = random.randint(1, 100)\nattempts = 0\n\nwhile True:\n    guess = int(input(\"Guess a number between 1 and 100: \"))\n    attempts += 1\n    \n    if guess &lt; secret_number:\n        print(\"Too low! Try again.\")\n    elif guess &gt; secret_number:\n        print(\"Too high! Try again.\")\n    else:\n        print(f\"🎉 Congratulations! You guessed it in {attempts} attempts.\")\n        break\n</code></pre>\n<p style=\"text-align: justify;\">You can make this game even better by adding features—like setting a limit on the number of attempts, giving difficulty levels (Easy, Medium, Hard), or allowing the player to play again without restarting the program.</p>\n<p style=\"text-align: justify;\">Through this project, you’ll practice <strong>logical thinking, control flow, and user interaction</strong>, while also gaining confidence in writing and testing your own code. Most importantly, you’ll experience the joy of seeing your logic come to life—one line of code at a time!</p>', 1000, 1, '2025-10-09 10:32:12', '2025-10-14 05:19:50'),
(20, 'Lesson 4: From Idea to Code: Solving Real Tasks', 5, 'no', 19, '1760441059-20.mp4', '<p data-start=\"54\" data-end=\"413\" style=\"text-align: justify;\">Turning an idea into working code is what makes programming both creative and powerful. It’s the process of transforming abstract thoughts—like “I want to make a to-do list app” or “I want my program to predict student grades”—into a structured, functioning program. This lesson focuses on how to approach real-world problems systematically and confidently.</p>\n<p data-start=\"415\" data-end=\"715\" style=\"text-align: justify;\">The first step is <strong data-start=\"433\" data-end=\"465\">defining the problem clearly</strong>. Before writing any code, you need to fully understand what you’re trying to achieve. Ask questions like: <em data-start=\"572\" data-end=\"666\">What does the program need to do? Who will use it? What are the inputs and expected outputs?</em> A well-defined problem is already half solved.</p>\n<p data-start=\"717\" data-end=\"1020\" style=\"text-align: justify;\">Next, <strong data-start=\"723\" data-end=\"772\">break the problem into smaller, logical parts</strong>. For example, if you want to build a to-do list app, think of its key components: adding tasks, marking them complete, deleting them, and saving them. Each part can be developed and tested separately before combining everything into one program.</p>\n<p data-start=\"1022\" data-end=\"1231\" style=\"text-align: justify;\">Then, <strong data-start=\"1028\" data-end=\"1050\">plan your solution</strong>. You can write pseudocode or create a flowchart to visualize how data will move through your program. Planning prevents confusion later and helps you spot potential issues early.</p>\n<p data-start=\"1233\" data-end=\"1467\" style=\"text-align: justify;\">Once the plan is ready, <strong data-start=\"1257\" data-end=\"1286\">start coding step by step</strong>. Don’t aim for perfection immediately—build a basic version first (called a <em data-start=\"1363\" data-end=\"1374\">prototype</em>), then add more features gradually. This approach makes debugging and testing much easier.</p>\n<p data-start=\"1469\" data-end=\"1700\" style=\"text-align: justify;\">During development, <strong data-start=\"1489\" data-end=\"1518\">test your code frequently</strong>. After implementing each function or module, run it with sample data to make sure it behaves correctly. Catching and fixing small issues early saves a lot of time in the long run.</p>\n<p data-start=\"1702\" data-end=\"1961\" style=\"text-align: justify;\">Finally, <strong data-start=\"1711\" data-end=\"1733\">refine and improve</strong> your program. Once it works, look for ways to optimize it—make it run faster, handle more cases, or have a better interface. Refactoring (rewriting for clarity and efficiency) is an important part of professional programming.</p>\n<p data-start=\"1963\" data-end=\"2253\" data-is-last-node=\"\" data-is-only-node=\"\" style=\"text-align: justify;\">Going from idea to code teaches you to think like an engineer: combining creativity, logic, and precision. Whether you’re building a simple calculator or a machine learning model, this structured process—<em data-start=\"2167\" data-end=\"2206\">understand, plan, code, test, improve</em>—is the foundation of every successful project.</p>', 1000, 1, '2025-10-09 10:32:30', '2025-10-14 05:24:19'),
(21, 'Lesson 1: What is OOP?', 6, 'yes', 15, NULL, 'Understand the core concept of Object-Oriented Programming and how it differs from traditional programming paradigms.', 1000, 1, '2025-10-09 07:20:37', '2025-10-09 07:20:37'),
(22, 'Lesson 2: Why Use OOP? Real-World Examples', 6, 'yes', 18, NULL, 'Explore practical applications of OOP in software development, including games, banking systems, and mobile apps.', 1000, 1, '2025-10-09 07:20:37', '2025-10-09 07:20:37'),
(23, 'Lesson 3: Procedural vs. Object-Oriented Programming', 6, 'no', 22, NULL, 'Compare procedural and object-oriented approaches to problem-solving and understand when each is appropriate.', 1000, 1, '2025-10-09 07:20:37', '2025-10-09 07:20:37'),
(24, 'Lesson 4: Key Terminology: Class, Object, Method, Attribute', 6, 'no', 20, NULL, 'Learn the fundamental vocabulary of OOP—classes, objects, methods, and attributes—and how they work together.', 1000, 1, '2025-10-09 07:20:37', '2025-10-09 07:20:37'),
(25, 'Lesson 1: What is a Class?', 7, 'no', 16, NULL, '<p>Learn how a class acts as a blueprint for creating objects, defining properties and behaviors in OOP.</p>', 1000, 1, '2025-10-09 07:22:12', '2025-10-09 12:25:52'),
(26, 'Lesson 2: Creating and Using Objects', 7, 'no', 19, NULL, '<p>Discover how to instantiate objects from a class and interact with them in your code.</p>', 1000, 1, '2025-10-09 07:22:12', '2025-10-09 12:25:57'),
(27, 'Lesson 3: Instance Variables and Methods', 7, 'no', 23, NULL, 'Understand how each object holds its own data through instance variables and uses methods to perform actions.', 1000, 1, '2025-10-09 07:22:12', '2025-10-09 07:22:12'),
(28, 'Lesson 4: Hands-On: Build Your First Class in Python', 7, 'no', 25, NULL, 'Write a complete class from scratch—modeling a real-world entity like a \'BankAccount\'—and test its functionality.', 1000, 1, '2025-10-09 07:22:12', '2025-10-09 07:22:12'),
(29, 'Lesson 1: What is Encapsulation?', 8, 'no', 14, NULL, '<p>Understand encapsulation as the bundling of data and methods that operate on that data within a single unit: the class.</p>', 1000, 1, '2025-10-09 07:23:14', '2025-10-09 12:26:11'),
(30, 'Lesson 2: Public, Private, and Protected Members', 8, 'no', 17, NULL, '<p>Learn how access modifiers control visibility of class members and enforce data hiding in OOP languages.</p>', 1000, 1, '2025-10-09 07:23:14', '2025-10-09 12:26:17'),
(31, 'Lesson 3: Getters and Setters in Python and Java', 8, 'no', 21, NULL, 'Implement controlled access to private attributes using getter and setter methods, with examples in both Python and Java.', 1000, 1, '2025-10-09 07:23:14', '2025-10-09 07:23:14'),
(32, 'Lesson 4: Why Data Hiding Improves Code Security and Maintainability', 8, 'no', 20, NULL, 'Explore real-world benefits of encapsulation: reducing bugs, enabling easier updates, and preventing unintended data manipulation.', 1000, 1, '2025-10-09 07:23:14', '2025-10-09 07:23:14'),
(33, 'Lesson 1: What is Inheritance?', 9, 'no', 16, NULL, '<p>Learn how inheritance allows a new class to reuse, extend, and modify behavior defined in another class.</p>', 1000, 1, '2025-10-09 07:23:36', '2025-10-09 12:26:31'),
(34, 'Lesson 2: Method Overriding and the super() Keyword', 9, 'no', 18, NULL, NULL, 1000, 1, '2025-10-09 07:23:36', '2025-10-09 12:27:23'),
(35, 'Lesson 3: Understanding Polymorphism with Real Examples', 9, 'no', 22, NULL, 'Explore polymorphism—the ability of objects to take many forms—and how it enables flexible, reusable code.', 1000, 1, '2025-10-09 07:23:36', '2025-10-09 07:23:36'),
(36, 'Lesson 4: Building a Class Hierarchy: Animal → Dog, Cat, Bird', 9, 'no', 24, NULL, 'Apply inheritance and polymorphism by designing a practical class hierarchy that models real-world entities.', 1000, 1, '2025-10-09 07:23:36', '2025-10-09 07:23:36'),
(37, 'Lesson 1: What is Abstraction in OOP?', 10, 'no', 15, NULL, '<p>Learn how abstraction hides complex implementation details and exposes only essential features to the user.</p>', 1000, 1, '2025-10-09 07:24:10', '2025-10-09 12:26:55'),
(38, 'Lesson 2: Abstract Classes and Interfaces', 10, 'no', 19, NULL, '<p>Understand how abstract classes and interfaces enforce structure and enable polymorphism in large-scale applications.</p>', 1000, 1, '2025-10-09 07:24:10', '2025-10-09 12:27:01'),
(39, 'Lesson 3: SOLID Principles Overview', 10, 'no', 23, NULL, 'Explore the five SOLID principles of object-oriented design that lead to robust, scalable, and testable code.', 1000, 1, '2025-10-09 07:24:10', '2025-10-09 07:24:10'),
(40, 'Lesson 4: Designing Maintainable Code with OOP Best Practices', 10, 'no', 25, NULL, 'Apply encapsulation, inheritance, polymorphism, and abstraction together to write clean, reusable, and professional-grade code.', 1000, 1, '2025-10-09 07:24:10', '2025-10-09 07:24:10'),
(41, 'Lesson 1: What is a Database?', 11, 'yes', 14, NULL, 'Understand the purpose of databases in storing, organizing, and retrieving data efficiently in modern applications.', 1000, 1, '2025-10-09 07:35:42', '2025-10-09 07:35:42'),
(42, 'Lesson 2: Types of DBMS: Relational, NoSQL, Hierarchical', 11, 'yes', 16, NULL, 'Explore different database models and when to use each—relational for structured data, NoSQL for scalability, etc.', 1000, 1, '2025-10-09 07:35:42', '2025-10-09 07:35:42'),
(43, 'Lesson 3: Components of a DBMS: Storage, Query Processor, Transaction Manager', 11, 'no', 20, NULL, 'Learn how a DBMS works under the hood: storage engine, query optimizer, transaction manager, and more.', 1000, 1, '2025-10-09 07:35:42', '2025-10-09 07:35:42'),
(44, 'Lesson 4: Real-World Applications: Banking, E-commerce, Healthcare Systems', 11, 'no', 22, NULL, 'See how databases power critical systems like online banking, shopping carts, patient records, and social media platforms.', 1000, 1, '2025-10-09 07:35:42', '2025-10-09 07:35:42'),
(45, 'Lesson 1: What is the Relational Model?', 12, 'no', 15, NULL, NULL, 1000, 1, '2025-10-09 07:39:12', '2025-10-09 12:30:31'),
(46, 'Lesson 2: Entity-Relationship (ER) Diagrams Basics', 12, 'no', 18, NULL, NULL, 1000, 1, '2025-10-09 07:39:12', '2025-10-09 12:30:39'),
(47, 'Lesson 3: Cardinality and Participation Constraints', 12, 'no', 21, NULL, 'Master one-to-one, one-to-many, many-to-many relationships and how to enforce them in database design.', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 07:39:12'),
(48, 'Lesson 4: Converting ER Diagrams to Relational Tables', 12, 'no', 23, NULL, 'Translate your ER models into actual database tables with correct constraints and relationships.', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 07:39:12'),
(49, 'Lesson 1: Introduction to SQL and Basic SELECT Queries', 13, 'no', 16, NULL, '<p>Write your first SQL queries to retrieve data using SELECT, FROM, WHERE, and ORDER BY clauses.</p>', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 12:28:14'),
(50, 'Lesson 2: Filtering and Sorting Data with WHERE and ORDER BY', 13, 'no', 17, NULL, '<p>Apply conditions to filter records and sort results using ASC/DESC for meaningful data analysis.</p>', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 12:28:24'),
(51, 'Lesson 3: Aggregation Functions and GROUP BY', 13, 'no', 22, NULL, 'Use COUNT, SUM, AVG, MIN, MAX with GROUP BY to summarize data and generate reports.', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 07:39:12'),
(52, 'Lesson 4: Joins: INNER, LEFT, RIGHT, and FULL Joins', 13, 'no', 24, NULL, 'Combine data from multiple tables using different types of joins to answer complex business questions.', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 07:39:12'),
(53, 'Lesson 1: Why Normalize? Problems with Redundancy', 14, 'no', 15, NULL, NULL, 1000, 1, '2025-10-09 07:39:12', '2025-10-09 12:29:44'),
(54, 'Lesson 2: First Normal Form (1NF) and Second Normal Form (2NF)', 14, 'no', 19, NULL, NULL, 1000, 1, '2025-10-09 07:39:12', '2025-10-09 12:29:51'),
(55, 'Lesson 3: Third Normal Form (3NF) and Boyce-Codd Normal Form (BCNF)', 14, 'no', 23, NULL, 'Eliminate transitive dependencies with 3NF and understand BCNF for advanced schema refinement.', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 07:39:12'),
(56, 'Lesson 4: Denormalization: When and Why to Break the Rules', 14, 'no', 21, NULL, 'Learn when denormalizing can improve performance—and how to do it safely without sacrificing data integrity.', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 07:39:12'),
(57, 'Lesson 1: What is a Transaction? ACID Properties Explained', 15, 'no', 17, NULL, NULL, 1000, 1, '2025-10-09 07:39:12', '2025-10-09 12:29:22'),
(58, 'Lesson 2: Concurrency Control and Locking Mechanisms', 15, 'no', 20, NULL, NULL, 1000, 1, '2025-10-09 07:39:12', '2025-10-09 12:30:11'),
(59, 'Lesson 3: User Permissions, Roles, and Basic Security Practices', 15, 'no', 22, NULL, 'Implement access control by creating users, roles, and granting permissions to protect sensitive data.', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 07:39:12'),
(60, 'Lesson 4: Real-World Case Study: Designing a University Database', 15, 'no', 25, NULL, 'Apply everything learned to design a complete database system for student enrollment, courses, and grades.', 1000, 1, '2025-10-09 07:39:12', '2025-10-09 07:39:12'),
(61, 'Lesson 1: What is an Operating System?', 16, 'yes', 14, NULL, 'Understand the role of an OS as the bridge between hardware and software, managing resources and providing services to applications.', 1000, 1, '2025-10-09 07:48:48', '2025-10-09 07:48:48'),
(62, 'Lesson 2: Types of OS: Batch, Time-Sharing, Real-Time, Distributed', 16, 'yes', 16, NULL, 'Explore different operating system types and their use cases—from batch processing in mainframes to real-time systems in robotics.', 1000, 1, '2025-10-09 07:48:48', '2025-10-09 07:48:48'),
(63, 'Lesson 3: OS Architecture: Monolithic, Microkernel, Hybrid', 16, 'no', 20, NULL, 'Compare monolithic, microkernel, and hybrid architectures—understand trade-offs in performance, security, and modularity.', 1000, 1, '2025-10-09 07:48:48', '2025-10-09 07:48:48'),
(64, 'Lesson 4: Boot Process and System Calls', 16, 'no', 22, NULL, 'Learn how a computer boots up, loads the OS kernel, and how applications interact with the OS via system calls.', 1000, 1, '2025-10-09 07:48:48', '2025-10-09 07:48:48'),
(65, 'Lesson 1: What is a Process? States and PCB', 17, 'no', 15, NULL, '<p>Understand process lifecycle, states (new, ready, running, waiting, terminated), and the Process Control Block (PCB).</p>', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 12:31:05'),
(66, 'Lesson 2: Threads vs Processes: Lightweight Concurrency', 17, 'no', 18, NULL, '<p>Learn how threads enable concurrent execution within a process and compare their advantages over multi-process models.</p>', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 12:31:10'),
(67, 'Lesson 3: Context Switching and Performance Overhead', 17, 'no', 21, NULL, 'Explore how the OS switches between processes/threads and why context switching impacts system performance.', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 07:50:17'),
(68, 'Lesson 4: Inter-Process Communication (IPC): Pipes, Shared Memory, Message Queues', 17, 'no', 23, NULL, 'Implement communication between processes using pipes, shared memory, and message queues—key for building complex applications.', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 07:50:17'),
(69, 'Lesson 1: Introduction to CPU Scheduling and Queues', 18, 'no', 16, NULL, '<p>Learn the role of the scheduler, ready queue, job queue, and how processes wait for CPU time.</p>', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 12:31:25'),
(70, 'Lesson 2: Scheduling Algorithms: FCFS, SJF, Round Robin', 18, 'no', 19, NULL, '<p>Compare First-Come-First-Serve, Shortest Job First, and Round Robin algorithms with real-time examples.</p>', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 12:31:31'),
(71, 'Lesson 3: Critical Section Problem and Mutex Locks', 18, 'no', 22, NULL, 'Understand race conditions and how mutexes, semaphores, and locks ensure safe access to shared resources.', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 07:50:17'),
(72, 'Lesson 4: Deadlocks: Conditions, Prevention, and Detection', 18, 'no', 24, NULL, 'Identify the four necessary conditions for deadlock and learn strategies to prevent, avoid, or detect them.', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 07:50:17'),
(73, 'Lesson 1: Physical vs Virtual Memory', 19, 'no', 17, NULL, '<p>Understand how virtual memory abstracts physical RAM, allowing programs to run even if they exceed available memory.</p>', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 12:31:49'),
(74, 'Lesson 2: Paging and Page Tables', 19, 'no', 20, NULL, '<p>Learn how memory is divided into pages and frames, and how page tables map virtual to physical addresses.</p>', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 12:31:54'),
(75, 'Lesson 3: Segmentation and Fragmentation', 19, 'no', 23, NULL, 'Explore segmentation as an alternative to paging, and understand internal vs external fragmentation issues.', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 07:50:17'),
(76, 'Lesson 4: Demand Paging, Page Replacement Algorithms (LRU, FIFO)', 19, 'no', 25, NULL, 'Study demand paging and how algorithms like LRU and FIFO manage limited memory by swapping pages in/out.', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 07:50:17'),
(77, 'Lesson 1: File System Structure and Operations', 20, 'no', 15, NULL, '<p>Learn how files are organized, stored, and accessed—including directories, metadata, and basic operations like create, read, write, delete.</p>', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 12:32:06'),
(78, 'Lesson 2: Disk Scheduling Algorithms: FCFS, SSTF, SCAN', 20, 'no', 18, NULL, '<p>Explore how the OS schedules disk I/O requests to minimize seek time using algorithms like FCFS, SSTF, and SCAN.</p>', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 12:32:09'),
(79, 'Lesson 3: Access Control Lists (ACLs) and User Permissions', 20, 'no', 21, NULL, 'Implement file security using ACLs, user groups, and permission bits (read/write/execute) to protect sensitive data.', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 07:50:17'),
(80, 'Lesson 4: Real-World Case Study: Linux File System and Mount Points', 20, 'no', 24, NULL, 'Analyze the Linux filesystem hierarchy (/, /home, /etc, /var) and understand mounting, symbolic links, and storage management.', 1000, 1, '2025-10-09 07:50:17', '2025-10-09 07:50:17'),
(81, 'Lesson 1: What is a Computer Network?', 21, 'yes', 14, NULL, 'Understand how computers communicate over networks, from home Wi-Fi to global internet infrastructure.', 1000, 1, '2025-10-09 08:09:57', '2025-10-09 08:09:57'),
(82, 'Lesson 2: Types of Networks: LAN, WAN, MAN, PAN', 21, 'yes', 16, NULL, 'Explore different network types based on geographic scope—Local Area, Wide Area, Metropolitan, and Personal Area Networks.', 1000, 1, '2025-10-09 08:09:57', '2025-10-09 08:09:57'),
(83, 'Lesson 3: Network Topologies and Transmission Media', 21, 'no', 20, NULL, 'Learn about star, ring, mesh topologies and physical media like fiber optics, coaxial, and twisted pair cables.', 1000, 1, '2025-10-09 08:09:57', '2025-10-09 08:09:57'),
(84, 'Lesson 4: Client-Server vs Peer-to-Peer Models', 21, 'no', 22, NULL, 'Compare centralized client-server architecture with decentralized peer-to-peer models used in file sharing and blockchain.', 1000, 1, '2025-10-09 08:09:57', '2025-10-09 08:09:57'),
(85, 'Lesson 1: Overview of the OSI Model (7 Layers)', 22, 'no', 15, NULL, '<p>Learn the purpose and function of each of the 7 layers in the OSI model—from physical transmission to application services.</p>', 1000, 1, '2025-10-09 08:10:17', '2025-10-09 12:32:51'),
(86, 'Lesson 2: Understanding the TCP/IP Model (4 Layers)', 22, 'no', 18, NULL, '<p>Compare the TCP/IP model with OSI and understand how real-world protocols like IP, TCP, UDP map to its layers.</p>', 1000, 1, '2025-10-09 08:10:17', '2025-10-09 12:32:56'),
(87, 'Lesson 3: Encapsulation and Decapsulation Process', 22, 'no', 21, NULL, 'Trace how data is wrapped and unwrapped as it moves through network layers during transmission.', 1000, 1, '2025-10-09 08:10:17', '2025-10-09 08:10:17'),
(88, 'Lesson 4: Protocol Data Units (PDUs) and Service Data Units (SDUs)', 22, 'no', 23, NULL, 'Understand how data changes form at each layer using PDUs and SDUs—and why this matters for network troubleshooting.', 1000, 1, '2025-10-09 08:10:17', '2025-10-09 08:10:17'),
(89, 'Lesson 1: IPv4 Addressing and Classes (A, B, C, D, E)', 23, 'no', 16, NULL, '<p>Understand IPv4 address structure, classes, and how they define network and host portions.</p>', 1000, 1, '2025-10-09 08:10:30', '2025-10-09 12:33:09'),
(90, 'Lesson 2: Subnetting Basics: CIDR and Subnet Masks', 23, 'no', 19, NULL, '<p>Learn how to divide large networks into smaller subnets using CIDR notation and subnet masks for efficient IP allocation.</p>', 1000, 1, '2025-10-09 08:10:30', '2025-10-09 12:33:13'),
(91, 'Lesson 3: Routing Protocols: Static vs Dynamic (RIP, OSPF)', 23, 'no', 22, NULL, 'Explore how routers find the best path using static routes or dynamic protocols like RIP and OSPF.', 1000, 1, '2025-10-09 08:10:30', '2025-10-09 08:10:30'),
(92, 'Lesson 4: NAT, DHCP, and ARP Explained', 23, 'no', 24, NULL, 'Understand how NAT enables private networks to access the internet, DHCP assigns IPs automatically, and ARP maps IPs to MAC addresses.', 1000, 1, '2025-10-09 08:10:30', '2025-10-09 08:10:30'),
(93, 'Lesson 1: HTTP and HTTPS: How Websites Work', 24, 'no', 17, NULL, '<p>Learn how browsers request web pages using HTTP/HTTPS, including request/response cycles and status codes.</p>', 1000, 1, '2025-10-09 08:10:45', '2025-10-09 12:33:27'),
(94, 'Lesson 2: DNS: Domain Name System and Resolution Process', 24, 'no', 18, NULL, '<p>Understand how domain names are translated to IP addresses using recursive and iterative DNS queries.</p>', 1000, 1, '2025-10-09 08:10:45', '2025-10-09 12:33:33'),
(95, 'Lesson 3: SMTP, POP3, IMAP: Email Delivery Protocols', 24, 'no', 21, NULL, 'Explore how email is sent, received, and stored using SMTP for sending and POP3/IMAP for retrieval.', 1000, 1, '2025-10-09 08:10:45', '2025-10-09 08:10:45'),
(96, 'Lesson 4: FTP and SFTP: File Transfer Protocols', 24, 'no', 23, NULL, 'Compare FTP for unencrypted transfers with SFTP for secure file transfers over SSH.', 1000, 1, '2025-10-09 08:10:45', '2025-10-09 08:10:45'),
(97, 'Lesson 1: Common Network Threats: Malware, Phishing, DoS', 25, 'no', 15, NULL, NULL, 1000, 1, '2025-10-09 08:10:56', '2025-10-09 12:34:10'),
(98, 'Lesson 2: Firewalls, IDS, and VPNs for Protection', 25, 'no', 19, NULL, NULL, 1000, 1, '2025-10-09 08:10:56', '2025-10-09 12:34:15'),
(99, 'Lesson 3: SSL/TLS and Encryption in Network Communication', 25, 'no', 22, NULL, 'Understand how SSL/TLS secures web traffic, establishes encrypted sessions, and authenticates servers using certificates.', 1000, 1, '2025-10-09 08:10:56', '2025-10-09 08:10:56'),
(100, 'Lesson 4: Real-World Case Study: Building a Secure Home Network', 25, 'no', 25, NULL, 'Apply security principles to configure a home network with router settings, guest networks, and device isolation.', 1000, 1, '2025-10-09 08:10:56', '2025-10-09 08:10:56'),
(101, 'Lesson 1: What is Software Engineering?', 26, 'yes', 14, NULL, 'Understand how software engineering applies engineering principles to build reliable, scalable, and maintainable software systems.', 1000, 1, '2025-10-09 08:21:22', '2025-10-09 08:21:22'),
(102, 'Lesson 2: Why Software Engineering Matters: Cost, Quality, and Maintenance', 26, 'yes', 16, NULL, 'Explore real-world examples where poor software engineering led to costly failures—and why process matters more than code alone.', 1000, 1, '2025-10-09 08:21:22', '2025-10-09 08:21:22'),
(103, 'Lesson 3: Key Challenges in Software Development', 26, 'no', 20, NULL, 'Learn about scope creep, changing requirements, team communication, and technical debt—common pitfalls every software project faces.', 1000, 1, '2025-10-09 08:21:22', '2025-10-09 08:21:22'),
(104, 'Lesson 4: Role of a Software Engineer vs Programmer', 26, 'no', 22, NULL, 'Compare the responsibilities of a programmer (coding) vs a software engineer (design, architecture, testing, collaboration).', 1000, 1, '2025-10-09 08:21:22', '2025-10-09 08:21:22'),
(105, 'Lesson 1: Overview of SDLC: Phases and Deliverables', 27, 'no', 15, NULL, 'Understand the 6 phases of SDLC: Planning, Analysis, Design, Implementation, Testing, Deployment, and Maintenance.', 1000, 1, '2025-10-09 08:21:57', '2025-10-09 08:21:57'),
(106, 'Lesson 2: Waterfall Model: Pros, Cons, and When to Use It', 27, 'no', 18, NULL, 'Learn the linear, phase-gated Waterfall model and its suitability for stable, well-defined projects.', 1000, 1, '2025-10-09 08:21:57', '2025-10-09 08:21:57'),
(107, 'Lesson 3: Agile and Scrum: Iterative Development and Sprints', 27, 'no', 21, NULL, 'Explore Agile principles, Scrum roles (Product Owner, Scrum Master), and how sprints enable flexible, customer-focused development.', 1000, 1, '2025-10-09 08:21:57', '2025-10-09 08:21:57'),
(108, 'Lesson 4: Spiral, V-Model, and Hybrid Approaches', 27, 'no', 23, NULL, 'Compare risk-driven Spiral, verification-focused V-Model, and hybrid models that combine strengths of multiple methodologies.', 1000, 1, '2025-10-09 08:21:57', '2025-10-09 08:21:57'),
(109, 'Lesson 1: Types of Requirements: Functional, Non-Functional, User Stories', 28, 'no', 16, NULL, 'Differentiate between functional (what the system does) and non-functional (performance, security) requirements.', 1000, 1, '2025-10-09 08:22:30', '2025-10-09 08:22:30'),
(110, 'Lesson 2: Creating Use Case Diagrams and Actor Interactions', 28, 'no', 19, NULL, 'Learn to model system behavior using use case diagrams, actors, and scenarios to capture user goals.', 1000, 1, '2025-10-09 08:22:30', '2025-10-09 08:22:30'),
(111, 'Lesson 3: Class Diagrams and Object Relationships', 28, 'no', 22, NULL, 'Design static structure of the system using class diagrams, associations, inheritance, and multiplicity.', 1000, 1, '2025-10-09 08:22:30', '2025-10-09 08:22:30'),
(112, 'Lesson 4: Sequence and Activity Diagrams for Dynamic Behavior', 28, 'no', 24, NULL, 'Visualize object interactions over time with sequence diagrams and workflow logic with activity diagrams.', 1000, 1, '2025-10-09 08:22:30', '2025-10-09 08:22:30'),
(113, 'Lesson 1: Principles of Good Software Design: SOLID, DRY, KISS', 29, 'no', 17, NULL, 'Apply design principles like SOLID, DRY (Don’t Repeat Yourself), and KISS (Keep It Simple) to write clean, maintainable code.', 1000, 1, '2025-10-09 08:22:50', '2025-10-09 08:22:50'),
(114, 'Lesson 2: Unit Testing and Test-Driven Development (TDD)', 29, 'no', 18, NULL, 'Write automated unit tests before code (TDD) to ensure correctness and drive design decisions.', 1000, 1, '2025-10-09 08:22:50', '2025-10-09 08:22:50'),
(115, 'Lesson 3: Integration, System, and Acceptance Testing', 29, 'no', 21, NULL, 'Test components together (integration), full system behavior (system), and business requirements (acceptance).', 1000, 1, '2025-10-09 08:22:50', '2025-10-09 08:22:50'),
(116, 'Lesson 4: Code Reviews, Metrics, and Continuous Integration', 29, 'no', 23, NULL, 'Improve quality through peer reviews, code metrics (coverage, cyclomatic complexity), and CI pipelines.', 1000, 1, '2025-10-09 08:22:50', '2025-10-09 08:22:50'),
(117, 'Lesson 1: Introduction to Git: Repositories, Commits, Branches', 30, 'no', 15, NULL, 'Learn basic Git commands: init, add, commit, branch, merge—and how to manage code history effectively.', 1000, 1, '2025-10-09 08:23:11', '2025-10-09 08:23:11'),
(118, 'Lesson 2: Collaborating with GitHub/GitLab: Pull Requests and Code Reviews', 30, 'no', 19, NULL, 'Work with teams using pull requests, forks, and code review workflows on platforms like GitHub or GitLab.', 1000, 1, '2025-10-09 08:23:11', '2025-10-09 08:23:11'),
(119, 'Lesson 3: Agile Ceremonies: Daily Standups, Sprint Planning, Retrospectives', 30, 'no', 22, NULL, 'Participate in Agile rituals that keep teams aligned, productive, and continuously improving.', 1000, 1, '2025-10-09 08:23:11', '2025-10-09 08:23:11'),
(120, 'Lesson 4: DevOps Pipeline: CI/CD, Automation, and Deployment Strategies', 30, 'no', 25, NULL, 'Build end-to-end automation pipelines for building, testing, and deploying software using tools like Jenkins, Docker, and Kubernetes.', 1000, 1, '2025-10-09 08:23:11', '2025-10-09 08:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Beginner', 1, '2025-10-09 06:08:53', '2025-10-09 06:08:53'),
(2, 'Intermediate', 1, '2025-10-09 06:08:53', '2025-10-09 06:08:53'),
(3, 'Advanced', 1, '2025-10-09 06:08:53', '2025-10-09 06:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_05_113528_create_categories_table', 1),
(5, '2025_09_05_113912_create_languages_table', 1),
(6, '2025_09_05_114009_create_levels_table', 1),
(7, '2025_09_05_114147_create_courses_table', 1),
(8, '2025_09_05_120019_create_outcomes_table', 1),
(9, '2025_09_05_120054_create_requirments_table', 1),
(10, '2025_09_05_124855_create_chapters_table', 1),
(11, '2025_09_05_125309_create_lessons_table', 1),
(12, '2025_09_06_144851_create_enrollments_table', 1),
(13, '2025_09_06_144929_create_activities_table', 1),
(14, '2025_09_06_144950_create_reviews_table', 1),
(15, '2025_09_06_145932_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `outcomes`
--

CREATE TABLE `outcomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `outcomes`
--

INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 3, 'Understand the fundamentals of algorithms and computational thinking.', 1000, '2025-10-09 10:12:53', '2025-10-09 10:12:53'),
(2, 3, 'Write and debug simple programs using a high-level language (e.g., Python).', 1000, '2025-10-09 10:13:03', '2025-10-09 10:13:03'),
(3, 3, 'Explain how data is represented and stored in computer systems.', 1000, '2025-10-09 10:13:10', '2025-10-09 10:13:10'),
(4, 3, 'Apply basic problem-solving strategies to real-world computing challenges.', 1000, '2025-10-09 10:13:17', '2025-10-09 10:13:17'),
(5, 4, 'Understand and apply the four pillars of OOP: encapsulation, inheritance, polymorphism, and abstraction.', 1000, '2025-10-09 07:05:57', '2025-10-09 07:05:57'),
(6, 4, 'Design and implement reusable classes and objects in Python or Java to model real-world entities.', 1000, '2025-10-09 07:05:57', '2025-10-09 07:05:57'),
(7, 4, 'Use inheritance and method overriding to build flexible and maintainable code hierarchies.', 1000, '2025-10-09 07:05:57', '2025-10-09 07:05:57'),
(8, 4, 'Solve programming problems by organizing code into modular, testable, and scalable object-oriented structures.', 1000, '2025-10-09 07:05:57', '2025-10-09 07:05:57'),
(9, 5, 'Understand the core concepts of relational databases, including tables, keys, schemas, and relationships.', 1000, '2025-10-09 07:30:21', '2025-10-09 07:30:21'),
(10, 5, 'Write efficient SQL queries to retrieve, insert, update, and delete data using real database systems like MySQL or PostgreSQL.', 1000, '2025-10-09 07:30:21', '2025-10-09 07:30:21'),
(11, 5, 'Design normalized database schemas using ER modeling and apply normalization rules (1NF, 2NF, 3NF) to eliminate redundancy.', 1000, '2025-10-09 07:30:21', '2025-10-09 07:30:21'),
(12, 5, 'Implement database transactions, enforce ACID properties, and apply basic security and indexing techniques for performance.', 1000, '2025-10-09 07:30:21', '2025-10-09 07:30:21'),
(13, 6, 'Understand the core functions of an operating system: process management, memory management, file systems, and I/O handling.', 1000, '2025-10-09 07:44:38', '2025-10-09 07:44:38'),
(14, 6, 'Explain how processes and threads are scheduled, synchronized, and managed using real-world scheduling algorithms.', 1000, '2025-10-09 07:44:38', '2025-10-09 07:44:38'),
(15, 6, 'Analyze memory allocation techniques including paging, segmentation, and virtual memory.', 1000, '2025-10-09 07:44:38', '2025-10-09 07:44:38'),
(16, 6, 'Evaluate security and protection mechanisms used by modern operating systems like Linux and Windows.', 1000, '2025-10-09 07:44:38', '2025-10-09 07:44:38'),
(17, 7, 'Explain the layered architecture of the OSI and TCP/IP models and the role of each layer in data communication.', 1000, '2025-10-09 07:57:52', '2025-10-09 07:57:52'),
(18, 7, 'Configure IP addressing, subnetting, and understand how routers and switches forward data across networks.', 1000, '2025-10-09 07:57:52', '2025-10-09 07:57:52'),
(19, 7, 'Analyze common application-layer protocols including HTTP, DNS, SMTP, and FTP and how they enable internet services.', 1000, '2025-10-09 07:57:52', '2025-10-09 07:57:52'),
(20, 7, 'Identify network security threats and apply basic defenses such as firewalls, encryption, and secure protocols (SSL/TLS).', 1000, '2025-10-09 07:57:52', '2025-10-09 07:57:52'),
(21, 8, 'Apply the software development life cycle (SDLC) phases: requirements, design, implementation, testing, deployment, and maintenance.', 1000, '2025-10-09 08:16:55', '2025-10-09 08:16:55'),
(22, 8, 'Design software systems using UML diagrams including use case, class, sequence, and activity diagrams.', 1000, '2025-10-09 08:16:55', '2025-10-09 08:16:55'),
(23, 8, 'Implement version control workflows using Git and collaborate effectively using platforms like GitHub or GitLab.', 1000, '2025-10-09 08:16:55', '2025-10-09 08:16:55'),
(24, 8, 'Develop and execute test plans using unit testing, integration testing, and test-driven development (TDD) practices.', 1000, '2025-10-09 08:16:55', '2025-10-09 08:16:55'),
(25, 11, 'Explain core networking protocols (TCP/IP, DNS, HTTP, etc.) and their security implications.', 0, '2025-10-22 06:17:49', '2025-10-22 06:19:02'),
(26, 11, 'Apply cryptographic techniques (encryption, digital signatures, key exchange) to secure network communications.', 1, '2025-10-22 06:18:01', '2025-10-22 06:19:02'),
(27, 11, 'Analyze and configure industry-standard security protocols such as TLS, IPsec, SSH, and DNSSEC.', 2, '2025-10-22 06:18:08', '2025-10-22 06:19:02'),
(28, 11, 'Identify common network-based threats (e.g., MITM, DoS, spoofing, packet sniffing) and their countermeasures.', 3, '2025-10-22 06:18:16', '2025-10-22 06:19:02'),
(30, 12, 'Understand and classify formal languages using the Chomsky hierarchy (regular, context-free, context-sensitive, recursively enumerable).', 1000, '2025-10-22 06:25:43', '2025-10-22 06:25:43'),
(31, 12, 'Design and analyze finite automata, pushdown automata, and Turing machines for given computational problems.', 1000, '2025-10-22 06:25:52', '2025-10-22 06:25:52'),
(32, 12, 'Prove whether a language is regular or context-free using pumping lemmas and closure properties.', 1000, '2025-10-22 06:25:59', '2025-10-22 06:25:59'),
(33, 12, 'Identify undecidable and non-computable problems (e.g., the Halting Problem) and explain their implications for computer science.', 1000, '2025-10-22 06:26:04', '2025-10-22 06:26:04'),
(34, 13, 'Articulate Core Concepts: Explain the different types of machine learning (supervised, unsupervised, reinforcement) and key terminology like features, labels, training, and testing.', 1000, '2025-10-22 23:54:04', '2025-10-22 23:54:04'),
(35, 13, 'Preprocess Data Effectively: Clean, normalize, and transform raw datasets into a suitable format for machine learning models using Python\'s Pandas and NumPy libraries.', 1000, '2025-10-22 23:54:10', '2025-10-22 23:54:10'),
(36, 13, 'Build and Train Models: Implement a variety of machine learning algorithms including Linear/Logistic Regression, K-Nearest Neighbors (KNN), Decision Trees, and Support Vector Machines (SVM) using Scikit-learn.', 1000, '2025-10-22 23:54:17', '2025-10-22 23:54:17'),
(37, 13, 'Evaluate and Tune Models: Critically assess model performance using appropriate metrics (e.g., accuracy, precision, recall, F1-score, MSE) and apply techniques like cross-validation and hyperparameter tuning to improve results.', 1000, '2025-10-22 23:54:23', '2025-10-22 23:54:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', '77f4daa90dbf3c18d374045a979c506448d2c241bfb43429d37ace36aa07ad84', '[\"*\"]', '2025-10-08 14:20:32', NULL, '2025-10-07 23:14:30', '2025-10-08 14:20:32'),
(2, 'App\\Models\\User', 1, 'token', '99b41c5de820bbb8a07a3fe4d86d18687d997b69d7792fcdcd58f1c03ea426d9', '[\"*\"]', NULL, NULL, '2025-10-08 13:53:37', '2025-10-08 13:53:37'),
(3, 'App\\Models\\User', 1, 'token', '574f0d28720b7aadbd2013b3b74b0af1f15cc29323bdb55f17b87956ba973048', '[\"*\"]', NULL, NULL, '2025-10-08 13:53:53', '2025-10-08 13:53:53'),
(4, 'App\\Models\\User', 1, 'token', 'ff355384b10670d77e64230548754e7cb910e32b8584bc5579f2a3df6729b7b4', '[\"*\"]', NULL, NULL, '2025-10-08 13:53:55', '2025-10-08 13:53:55'),
(5, 'App\\Models\\User', 1, 'token', 'b886665e6b4e3740f30245eeda05171bab9e91d71b501a5811f36c207c06d03e', '[\"*\"]', '2025-10-22 10:24:04', NULL, '2025-10-08 13:54:02', '2025-10-22 10:24:04'),
(6, 'App\\Models\\User', 1, 'token', '8290a5bbf75dfa7bef537d6d2dd9c74226cdc067a95dd6a443461fbb2c52a392', '[\"*\"]', NULL, NULL, '2025-10-08 14:19:29', '2025-10-08 14:19:29'),
(7, 'App\\Models\\User', 1, 'token', '208363291d0628bdcc0a07df4c5395ce4e1e7834d2aac79b92fd0801902717d5', '[\"*\"]', '2025-10-08 15:26:31', NULL, '2025-10-08 14:20:27', '2025-10-08 15:26:31'),
(8, 'App\\Models\\User', 1, 'token', '4d680ceab32a79b97c01850eaa88bf1e3a21bebbb7686386282341dd62e5cab1', '[\"*\"]', '2025-10-09 12:36:57', NULL, '2025-10-08 15:17:07', '2025-10-09 12:36:57'),
(9, 'App\\Models\\User', 1, 'token', '2a604024481e558f8b2e358da72e0ac3ddebef44dc3cdc511ac347a3360a5515', '[\"*\"]', '2025-10-09 13:05:14', NULL, '2025-10-09 13:04:44', '2025-10-09 13:05:14'),
(10, 'App\\Models\\User', 1, 'token', 'ca48e9d6649eb5d534fa10c7bde348c585610c6f8e3721ac781f7cfdab815e44', '[\"*\"]', '2025-10-09 13:09:50', NULL, '2025-10-09 13:09:42', '2025-10-09 13:09:50'),
(11, 'App\\Models\\User', 1, 'token', '72c57eb3c924759a3e19d7440325a9f254aa8e362d79916354567544358b093d', '[\"*\"]', '2025-10-22 05:59:57', NULL, '2025-10-09 14:05:24', '2025-10-22 05:59:57'),
(12, 'App\\Models\\User', 1, 'token', '0d7bac9a1e06b6aad2ffed02ce4e9e214547bc33ba79ee3379daa858743a6e73', '[\"*\"]', '2025-10-22 10:01:57', NULL, '2025-10-22 06:04:16', '2025-10-22 10:01:57'),
(13, 'App\\Models\\User', 8, 'token', '7afb57bc73f5ff82ab4ed0b5b95302db0bae00a5c2c2684948ec902f340eeed8', '[\"*\"]', '2025-10-22 10:19:40', NULL, '2025-10-22 10:19:29', '2025-10-22 10:19:40'),
(14, 'App\\Models\\User', 4, 'token', 'e18c50a22c042b439cabb34016a50315c6f894a1541d7458accaabf293fa07bc', '[\"*\"]', '2025-10-22 10:39:18', NULL, '2025-10-22 10:20:16', '2025-10-22 10:39:18'),
(15, 'App\\Models\\User', 2, 'token', '1626f2499e42d8d6b8eedb9e175a772cead71c071b0b3b0c07c9af755a078115', '[\"*\"]', '2025-10-22 10:45:29', NULL, '2025-10-22 10:43:56', '2025-10-22 10:45:29'),
(16, 'App\\Models\\User', 8, 'token', '7ca7b29f004d15842412b1550ce8b110f7393a958aa3dccc2f4df00e316da4db', '[\"*\"]', '2025-10-22 11:05:05', NULL, '2025-10-22 10:45:29', '2025-10-22 11:05:05'),
(17, 'App\\Models\\User', 4, 'token', 'd7ab43ef3fae3f4222b89c706e066fe7cb4327aa59a1d8a591ac93c57475f008', '[\"*\"]', '2025-10-22 11:08:22', NULL, '2025-10-22 11:07:20', '2025-10-22 11:08:22'),
(18, 'App\\Models\\User', 1, 'token', '65813f589eeb904e49f88bd10a83d62708f2e52b7f770b80137cbad8bac80527', '[\"*\"]', '2025-10-22 11:08:43', NULL, '2025-10-22 11:08:22', '2025-10-22 11:08:43'),
(19, 'App\\Models\\User', 2, 'token', '21d5eab6078188e0d1b0beffcecb1cf776c01c26ec8100ec26aae50173767833', '[\"*\"]', '2025-10-22 11:09:07', NULL, '2025-10-22 11:08:33', '2025-10-22 11:09:07'),
(20, 'App\\Models\\User', 3, 'token', '734b2736cbac0af5a598b703fa66fb47d519d6fd709bbd290ad5e6ad514236a1', '[\"*\"]', NULL, NULL, '2025-10-22 11:09:01', '2025-10-22 11:09:01'),
(21, 'App\\Models\\User', 1, 'token', 'e49e87ebef805cb2076ac321b11952a28c8e4fd7695bd6874e941d2d1fc33bed', '[\"*\"]', NULL, NULL, '2025-10-22 23:43:59', '2025-10-22 23:43:59'),
(22, 'App\\Models\\User', 1, 'token', '5b60d6129d57b3fb7f87f31e59ba80c52dcba7b23a6a211d4c5cfe1055faa1bc', '[\"*\"]', NULL, NULL, '2025-10-22 23:44:25', '2025-10-22 23:44:25'),
(23, 'App\\Models\\User', 2, 'token', '2aa5b815cd0c1e90ca7f66158d642e60622047393beb906c662371bcfc74eb27', '[\"*\"]', NULL, NULL, '2025-10-22 23:44:36', '2025-10-22 23:44:36'),
(24, 'App\\Models\\User', 1, 'token', 'cb508f4d89180cdc1b4f7ce008a93730c5535d6b3f2c0c42f443e916357358f8', '[\"*\"]', '2025-10-23 00:35:18', NULL, '2025-10-22 23:44:46', '2025-10-23 00:35:18'),
(25, 'App\\Models\\User', 1, 'token', 'c00d584e54b404989891c2a734a94e0d5678ccdbcac24f839426f0a817ec4c7e', '[\"*\"]', '2025-10-26 05:46:31', NULL, '2025-10-23 00:34:47', '2025-10-26 05:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `requirments`
--

CREATE TABLE `requirments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requirments`
--

INSERT INTO `requirments` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 3, 'No prior programming experience required.', 1000, '2025-10-09 10:13:27', '2025-10-09 10:13:27'),
(2, 3, 'Access to a computer with internet connection.', 1000, '2025-10-09 10:13:35', '2025-10-09 10:13:35'),
(3, 3, 'Basic math skills (high school level).', 1000, '2025-10-09 10:13:41', '2025-10-09 10:13:41'),
(4, 3, 'Enthusiasm to learn and experiment with technology.', 1000, '2025-10-09 10:13:54', '2025-10-09 10:13:54'),
(5, 4, 'Basic understanding of programming fundamentals (variables, loops, conditionals).', 1000, '2025-10-09 07:07:33', '2025-10-09 07:07:33'),
(6, 4, 'Familiarity with a high-level programming language such as Python, Java, or C++.', 1000, '2025-10-09 07:07:33', '2025-10-09 07:07:33'),
(7, 4, 'Completion of an introductory programming course (e.g., \"Introduction to Computer Science\").', 1000, '2025-10-09 07:07:33', '2025-10-09 07:07:33'),
(8, 4, 'A code editor (e.g., VS Code, PyCharm) and Python/Java installed on your computer.', 1000, '2025-10-09 07:07:33', '2025-10-09 07:07:33'),
(9, 5, 'Basic understanding of computer systems and file storage concepts.', 1000, '2025-10-09 07:31:57', '2025-10-09 07:31:57'),
(10, 5, 'Familiarity with fundamental programming concepts (variables, loops, conditionals).', 1000, '2025-10-09 07:31:57', '2025-10-09 07:31:57'),
(11, 5, 'No prior database experience required—this course starts from the basics.', 1000, '2025-10-09 07:31:57', '2025-10-09 07:31:57'),
(12, 5, 'Access to a computer with internet to install and use a free database system (e.g., MySQL, PostgreSQL, or SQLite).', 1000, '2025-10-09 07:31:57', '2025-10-09 07:31:57'),
(13, 6, 'Basic understanding of computer architecture (CPU, memory, storage).', 1000, '2025-10-09 07:44:26', '2025-10-09 07:44:26'),
(14, 6, 'Familiarity with fundamental programming concepts (preferably in C or Python).', 1000, '2025-10-09 07:44:26', '2025-10-09 07:44:26'),
(15, 6, 'Completion of an introductory computer science or systems course.', 1000, '2025-10-09 07:44:26', '2025-10-09 07:44:26'),
(16, 6, 'Access to a computer capable of running Linux (via VM or dual boot) for optional hands-on labs.', 1000, '2025-10-09 07:44:26', '2025-10-09 07:44:26'),
(17, 7, 'Basic understanding of computer systems and how software interacts with hardware.', 1000, '2025-10-09 07:57:52', '2025-10-09 07:57:52'),
(18, 7, 'Familiarity with fundamental programming or scripting (helpful but not required).', 1000, '2025-10-09 07:57:52', '2025-10-09 07:57:52'),
(19, 7, 'Completion of an introductory computer science or operating systems course.', 1000, '2025-10-09 07:57:52', '2025-10-09 07:57:52'),
(20, 7, 'Access to a computer with internet to use network simulation tools like Wireshark or Cisco Packet Tracer (optional but recommended).', 1000, '2025-10-09 07:57:52', '2025-10-09 07:57:52'),
(21, 8, 'Basic programming experience in any language (e.g., Python, Java, or C++).', 1000, '2025-10-09 08:16:55', '2025-10-09 08:16:55'),
(22, 8, 'Familiarity with fundamental data structures and algorithms.', 1000, '2025-10-09 08:16:55', '2025-10-09 08:16:55'),
(23, 8, 'Understanding of basic command-line usage and file management.', 1000, '2025-10-09 08:16:55', '2025-10-09 08:16:55'),
(24, 8, 'Access to a computer with internet to install development tools (IDE, Git, etc.).', 1000, '2025-10-09 08:16:55', '2025-10-09 08:16:55'),
(25, 11, 'A computer with internet access.', 1, '2025-10-22 06:18:55', '2025-10-22 06:19:16'),
(26, 11, 'Basic understanding of computer networks (e.g., OSI model, IP addressing, routing).', 0, '2025-10-22 06:19:13', '2025-10-22 06:19:16'),
(27, 11, 'Introductory cybersecurity or networking coursework', 1000, '2025-10-22 06:19:26', '2025-10-22 06:19:26'),
(28, 11, 'Willingness to engage in hands-on labs and critical analysis of security scenarios.', 1000, '2025-10-22 06:19:34', '2025-10-22 06:19:34'),
(29, 12, 'Basic knowledge of discrete mathematics (sets, logic, functions, proofs).', 1000, '2025-10-22 06:26:17', '2025-10-22 06:26:17'),
(30, 12, 'Familiarity with mathematical reasoning and proof techniques (e.g., induction, contradiction).', 1000, '2025-10-22 06:26:24', '2025-10-22 06:26:24'),
(31, 12, 'Introductory programming experience (helpful but not mandatory).', 1000, '2025-10-22 06:26:30', '2025-10-22 06:26:30'),
(32, 12, 'Access to a computer for optional simulations or visualization tools (e.g., JFLAP).', 1000, '2025-10-22 06:26:38', '2025-10-22 06:26:38'),
(33, 13, 'Programming Proficiency: Basic knowledge of Python programming (variables, loops, functions, basic data structures like lists and dictionaries).', 1000, '2025-10-22 23:53:25', '2025-10-22 23:53:25'),
(34, 13, 'Mathematical Background: Familiarity with high school-level algebra (concepts of variables, equations, graphs) and basic statistics (mean, median, standard deviation). A brief refresher will be provided.', 1000, '2025-10-22 23:53:34', '2025-10-22 23:53:34'),
(35, 13, 'Software & Tools: A computer with internet access and the ability to install free software (Python, Jupyter Notebook, and necessary libraries via pip/conda). Detailed setup instructions will be provided.', 1000, '2025-10-22 23:53:41', '2025-10-22 23:53:41'),
(36, 13, 'Mindset: A problem-solving attitude and willingness to engage with both theoretical concepts and hands-on coding exercises.', 1000, '2025-10-22 23:53:50', '2025-10-22 23:53:50');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `course_id`, `rating`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 3, 5, 'I really enjoyed the Introduction to Computer Science course! It was super clear and beginner-friendly, with great examples that made complex ideas easy to understand. I learned the basics of algorithms, programming, and problem-solving in a fun way. Perfect course for anyone just starting out in CS!', 1, '2025-10-15 10:38:48', '2025-10-22 10:38:48'),
(2, 2, 3, 4, 'Great intro course! Everything was explained step by step, and the Python examples made learning really easy. I had zero coding background, but now I feel confident to move on to more advanced topics. Totally worth it!', 1, '2025-10-12 10:45:16', '2025-10-22 10:45:16'),
(3, 8, 3, 4, 'Awesome course for beginners! The lessons were short and clear, and I loved how it covered both theory and practical coding. It really helped me understand how computers and algorithms work. Highly recommend!', 1, '2025-10-22 10:46:05', '2025-10-22 10:46:05'),
(4, 4, 5, 5, 'its a good course', 1, '2025-10-22 11:07:47', '2025-10-22 11:07:47'),
(5, 4, 7, 4, 'begginer friendly', 1, '2025-10-22 11:08:03', '2025-10-22 11:08:03');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('qyzvZ7RoKc8Yuz4rSpponcEYtQhtGymWkf6pWxvI', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidllrajU4WHljZWdmMTF5SllCbzhFUUJNaERLVjRxbG9qejExUVR0MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759916990),
('XARHFGWnIUmbpDcqAbXsELWea6G1vtb6zZDRfDP2', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmF3dDRLTGdQdEV3UDhaQVpmdFY4a3hFNlRqbElmdk11VjFqb0ZMSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1759864439);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Akbar Sami', 'mdsami6251@gmail.com', NULL, '$2y$12$c8SlSQ2CDd1.Ivnhxfub/eneDNbxEOSYU/BV1YEqnkJlvODl9ueq6', NULL, '2025-10-07 23:14:24', '2025-10-08 15:27:31'),
(2, 'Sakib Chowdhury', 'mdsami6252@gmail.com', NULL, '$2y$12$cE8DgJBllNX3frFd3BDKPuC6yzezs4lH9hy0rQKgWoMxVfO5usiYm', NULL, '2025-10-22 06:01:44', '2025-10-22 06:01:44'),
(3, 'Afifa Hoque', 'afifa@gmail.com', NULL, '$2y$12$cyn1Vo.Ja0eXke6utr31cuI19dRC/SXVvULi7Up0HZPGqGDnm8bAa', NULL, '2025-10-22 06:02:39', '2025-10-22 06:02:39'),
(4, 'Habibul Saikat', 'habibulsaikat@gmail.com', NULL, '$2y$12$Y1L0Jno159i50cAQ1odPrej6Lhrcz9cYXJ9YLKxOzZd.kg8hA5rSG', NULL, '2025-10-22 06:02:59', '2025-10-22 06:02:59'),
(5, 'Ruhul Amin', 'ruhulamin@gmail.com', NULL, '$2y$12$7HpuF2PVinX3nprVUH3zkuCUb3ApJv2f82wbwu4C3vJPZXbjEzm6e', NULL, '2025-10-22 06:03:15', '2025-10-22 06:03:15'),
(6, 'Ariful Islam', 'arifulislam@gmail.com', NULL, '$2y$12$YDo7.OOe60mx59t.1AHPuOOmhuiCJp8Emxx6CiD2fV10sGDa4KRpe', NULL, '2025-10-22 06:03:32', '2025-10-22 06:03:32'),
(7, 'Rakibul Hoque', 'rakibulhoque@gmail.com', NULL, '$2y$12$mnqo.22GC2k8va0OQnjiwezGkC4NqA01TXFVOxdtB8GXzl0UcX68y', NULL, '2025-10-22 06:03:53', '2025-10-22 06:03:53'),
(8, 'Ibrahim Masud', 'ibrahimmasud@gmail.com', NULL, '$2y$12$52e8TFBzej/yg6Xh3bonzuMExyPMVjjfCS66fHCZ9LnUmp2mLWmva', NULL, '2025-10-22 06:04:12', '2025-10-22 06:04:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_course_id_foreign` (`course_id`),
  ADD KEY `activities_user_id_foreign` (`user_id`),
  ADD KEY `activities_chapter_id_foreign` (`chapter_id`),
  ADD KEY `activities_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_course_id_foreign` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_category_id_foreign` (`category_id`),
  ADD KEY `courses_level_id_foreign` (`level_id`),
  ADD KEY `courses_user_id_foreign` (`user_id`),
  ADD KEY `courses_language_id_foreign` (`language_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_user_id_foreign` (`user_id`),
  ADD KEY `enrollments_course_id_foreign` (`course_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_chapter_id_foreign` (`chapter_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outcomes`
--
ALTER TABLE `outcomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `outcomes_course_id_foreign` (`course_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `requirments`
--
ALTER TABLE `requirments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requirments_course_id_foreign` (`course_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_course_id_foreign` (`course_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `outcomes`
--
ALTER TABLE `outcomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `requirments`
--
ALTER TABLE `requirments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `outcomes`
--
ALTER TABLE `outcomes`
  ADD CONSTRAINT `outcomes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requirments`
--
ALTER TABLE `requirments`
  ADD CONSTRAINT `requirments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
