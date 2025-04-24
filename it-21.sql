-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Час створення: Квт 24 2025 р., 08:20
-- Версія сервера: 5.7.24
-- Версія PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `it-21`
--

-- --------------------------------------------------------

--
-- Структура таблиці `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('present','absent','late') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `date`, `status`) VALUES
(1, 1, '2024-04-01', 'present'),
(2, 1, '2024-04-02', 'absent'),
(3, 2, '2024-04-01', 'present'),
(4, 2, '2024-04-02', 'late'),
(5, 3, '2024-04-01', 'present'),
(6, 3, '2024-04-02', 'present'),
(7, 4, '2024-04-01', 'late'),
(8, 4, '2024-04-02', 'absent'),
(9, 5, '2024-04-01', 'absent'),
(10, 5, '2024-04-02', 'present');

-- --------------------------------------------------------

--
-- Структура таблиці `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `grades`
--

INSERT INTO `grades` (`id`, `student_id`, `subject`, `grade`) VALUES
(1, 1, 'Математика', 85),
(2, 1, 'Історія', 90),
(3, 2, 'Математика', 78),
(4, 2, 'Історія', 82),
(5, 3, 'Математика', 95),
(6, 3, 'Історія', 76),
(7, 4, 'Математика', 91),
(8, 4, 'Історія', 89),
(9, 5, 'Математика', 73),
(10, 5, 'Історія', 80);

-- --------------------------------------------------------

--
-- Структура таблиці `scholarships`
--

CREATE TABLE `scholarships` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `scholarships`
--

INSERT INTO `scholarships` (`id`, `student_id`, `amount`, `type`) VALUES
(1, 1, '1200.00', 'академічна'),
(2, 2, '1000.00', 'соціальна'),
(3, 3, '1500.00', 'академічна');

-- --------------------------------------------------------

--
-- Структура таблиці `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `group_name` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `group_name`, `birth_date`) VALUES
(1, 'Іван', 'Коваленко', 'A1', '2003-04-15'),
(2, 'Марія', 'Козак', 'A1', '2002-11-30'),
(3, 'Олег', 'Іванчук', 'B2', '2001-06-12'),
(4, 'Наталя', 'Петренко', 'B2', '2003-01-25'),
(5, 'Андрій', 'Захаренко', 'A1', '2004-03-08');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Індекси таблиці `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Індекси таблиці `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Індекси таблиці `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `scholarships`
--
ALTER TABLE `scholarships`
  ADD CONSTRAINT `scholarships_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
