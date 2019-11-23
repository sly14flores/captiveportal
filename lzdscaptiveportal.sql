-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2019 at 08:10 AM
-- Server version: 10.3.17-MariaDB-0+deb10u1
-- PHP Version: 7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lzdscaptiveportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(10) NOT NULL,
  `student_id` int(10) DEFAULT NULL,
  `mac_address` varchar(20) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `tok` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT 0,
  `system_log` datetime DEFAULT NULL,
  `session_datetime` datetime DEFAULT NULL,
  `expiration_datetime` datetime DEFAULT NULL,
  `hours_allowed` int(11) DEFAULT NULL,
  `unlimited` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `school_years`
--

CREATE TABLE `school_years` (
  `id` int(10) NOT NULL,
  `school_year` varchar(7) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_years`
--

INSERT INTO `school_years` (`id`, `school_year`, `system_log`) VALUES
(1, '2013-14', '2018-08-27 14:28:35'),
(2, '2014-15', '2018-08-27 14:28:36'),
(3, '2015-16', '2018-08-27 14:28:36'),
(4, '2016-17', '2018-08-27 14:28:37'),
(5, '2017-18', '2018-08-27 14:28:37'),
(6, '2018-19', '2018-08-27 14:28:38'),
(7, '2019-20', '2019-11-18 14:28:38');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `property_description` varchar(50) DEFAULT NULL,
  `property_value` varchar(50) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `property_description`, `property_value`, `system_log`) VALUES
(1, 'school_year', '7', '2019-11-22 08:11:54'),
(2, 'internet_duration', '1', '2018-08-27 19:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `system_log` datetime DEFAULT NULL,
  `update_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `firstname`, `middlename`, `lastname`, `nickname`, `username`, `password`, `system_log`, `update_log`) VALUES
(27, 'Clar Reneith', NULL, 'Balimbin', 'Clar', 'clar', 'clar', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `enrollment_id` int(10) DEFAULT NULL,
  `school_id` varchar(20) NOT NULL,
  `enrollment_school_year` int(11) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `system_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `enrollment_id`, `school_id`, `enrollment_school_year`, `last_name`, `first_name`, `middle_name`, `date_of_birth`, `system_log`) VALUES
(1, 2668, '19000101', 7, 'Almirol', 'Daniela Athena Rgace', 'Casem', '2014-09-26', '2019-11-18 16:00:06'),
(2, 2653, '19000102', 7, 'Altuhaini', 'Deeyalah Ali', 'Riñon', '2015-08-18', '2019-11-18 16:00:06'),
(3, 2654, '19000103', 7, 'Altuhaini', 'Liannah Ali', 'Riñon', '2015-08-18', '2019-11-18 16:00:06'),
(4, 2687, '19000104', 7, 'Baculi', 'Reece Jon Benjamin', 'Acosta', '2014-04-13', '2019-11-18 16:00:06'),
(5, 2648, '19000105', 7, 'Baraquio', 'Danielle Maylee', 'Sayago', '2015-10-01', '2019-11-18 16:00:06'),
(6, 2544, '19000106', 7, 'Bayan', 'Adynna Yzabelle', 'Almodovar', '2015-10-17', '2019-11-18 16:00:06'),
(7, 2525, '19000107', 7, 'Capitan', 'Precious Grace', 'Arcena', '2014-09-21', '2019-11-18 16:00:07'),
(8, 2709, '19000108', 7, 'Carbonell', 'Faith Leyanah', 'Ubungen', '2014-12-12', '2019-11-18 16:00:07'),
(9, 2792, '19000109', 7, 'Carig', 'Zeun Denver', 'Encarnacion', '2015-02-19', '2019-11-18 16:00:07'),
(10, 2762, '19000110', 7, 'De Guzman', 'John Kiezer', 'Cariaga', '2015-02-23', '2019-11-18 16:00:07'),
(11, 2549, '19000111', 7, 'Delmendo', 'Lawreen Bree', 'Sondia', '2015-01-23', '2019-11-18 16:00:07'),
(12, 2566, '19000112', 7, 'Galinato', 'Jeiosdeity', 'Nebres', '2014-12-20', '2019-11-18 16:00:07'),
(13, 2824, '19000113', 7, 'Gaudia', 'Franchesca Jereian', 'Cariaga', '2015-06-02', '2019-11-18 16:00:07'),
(14, 2765, '19000114', 7, 'Higoy', 'Jhayce Mark Brayden', 'Flores', '2014-09-12', '2019-11-18 16:00:07'),
(15, 2581, '19000115', 7, 'Llarinas', 'Angelo', 'Acosta', '2014-09-08', '2019-11-18 16:00:08'),
(16, 2697, '19000116', 7, 'Noble', 'Megan', 'Peralta', '2016-06-26', '2019-11-18 16:00:08'),
(17, 2696, '19000117', 7, 'Noble', 'Nathan', 'Peralta', '2015-08-08', '2019-11-18 16:00:08'),
(18, 2592, '19000118', 7, 'Olivos', 'Aome Nixian Joon', 'Torreliza', '2015-06-03', '2019-11-18 16:00:08'),
(19, 2571, '19000119', 7, 'Tandog', 'Grachelle', 'Alicay', '2015-12-13', '2019-11-18 16:00:08'),
(20, 2918, '19000120', 7, 'Tria', 'Eleese Symphony Faith', 'Aguilar', '2015-04-20', '2019-11-18 16:00:08'),
(21, 2920, '19000121', 7, 'Tria', 'Erinn Harmony Hope', 'Aguilar', '2015-04-20', '2019-11-18 16:00:08'),
(22, 2529, '19000201', 7, 'Alabado', 'Akhira Kyla', 'Abat', '2014-04-09', '2019-11-18 16:00:09'),
(23, 2897, '19000202', 7, 'Almodovar', 'Geanella Lourenne', 'Gamueda', '2015-01-20', '2019-11-18 16:00:09'),
(24, 2952, '19000203', 7, 'Anicete', 'Ethan Mchale', 'Novela', '2014-10-01', '2019-11-18 16:00:09'),
(25, 2609, '19000204', 7, 'Antipolo', 'Vyrxzavier Fumio', 'Eslava', '2014-12-11', '2019-11-18 16:00:09'),
(26, 2626, '19000205', 7, 'Arce', 'Lucas Emmanuel', 'Familaran', '2014-05-06', '2019-11-18 16:00:09'),
(27, 2759, '19000206', 7, 'Bolima', 'Philippe Luis', '-', '2014-02-15', '2019-11-18 16:00:09'),
(28, 2847, '19000207', 7, 'Bulosan', 'Sophia Allison', 'Calipjo', '2015-03-06', '2019-11-18 16:00:09'),
(29, 2763, '19000208', 7, 'Cariaga', 'James Bryan', 'Lim', '2014-04-18', '2019-11-18 16:00:10'),
(30, 2591, '19000209', 7, 'Casugay', 'Ziana Aizelle', 'Orejudos', '2013-10-18', '2019-11-18 16:00:10'),
(31, 2915, '19000210', 7, 'Coleman', 'Arleenthara Jessie Keesenio Alaska', 'Licudan', '2014-09-18', '2019-11-18 16:00:10'),
(32, 2860, '19000211', 7, 'Comia', 'Prince Titus', 'Gaon', '2014-03-13', '2019-11-18 16:00:10'),
(33, 2726, '19000212', 7, 'Delfinado', 'Citadel Kayeleigh', 'Bayatin', '2014-09-08', '2019-11-18 16:00:10'),
(34, 2536, '19000213', 7, 'Galima', 'JB Angelo', 'Cacho', '2014-08-18', '2019-11-18 16:00:10'),
(35, 2574, '19000214', 7, 'Gatchalian', 'Alexandrea', 'Merino', '2014-03-27', '2019-11-18 16:00:10'),
(36, 2722, '19000215', 7, 'Hufalar', 'Liam Grey', 'Cardinez', '2014-11-02', '2019-11-18 16:00:10'),
(37, 2618, '19000216', 7, 'Licudan', 'Ma. Madelyn', 'Cayabyab', '2013-10-23', '2019-11-18 16:00:11'),
(38, 2857, '19000217', 7, 'Lomboy', 'Rhein Jhay', 'Flora', '2014-02-27', '2019-11-18 16:00:11'),
(39, 2750, '19000218', 7, 'Macadenden', 'Nathalie Jade', 'Almoite', '2014-10-22', '2019-11-18 16:00:11'),
(40, 2664, '19000219', 7, 'Monta', 'Jeremaiah', 'Almoite', '2014-09-15', '2019-11-18 16:00:11'),
(41, 2949, '19000220', 7, 'Murillo', 'Prince Ziam', 'Dulay', '2014-08-25', '2019-11-18 16:00:11'),
(42, 2907, '19000221', 7, 'Nares', 'Jen Stacy Gil', 'Tanguilig', '2014-12-27', '2019-11-18 16:00:11'),
(43, 2698, '19000222', 7, 'Noble', 'April Rose', 'Peralta', '2014-04-03', '2019-11-18 16:00:12'),
(44, 2494, '19000223', 7, 'Oredina', 'Syd Ronald Verril', 'Ganuelas', '2014-02-26', '2019-11-18 16:00:13'),
(45, 2783, '19000224', 7, 'Pascua', 'Jan Kaiser', 'Rovillos', '2014-01-05', '2019-11-18 16:00:14'),
(46, 2583, '19001001', 7, 'Abello', 'Niel Riley', 'Angyang', '2013-10-09', '2019-11-18 16:08:08'),
(47, 2569, '19001002', 7, 'Almoite', 'Jhairyne Eigelle', 'Gacayan', '2013-01-12', '2019-11-18 16:00:16'),
(48, 2554, '19001003', 7, 'Ami', 'Feia Seine', 'Tadios', '2012-09-22', '2019-11-18 16:00:17'),
(49, 2534, '19001004', 7, 'Ancheta', 'Denese Leigh', 'Almodovar', '2013-07-23', '2019-11-18 16:00:17'),
(50, 2674, '19001005', 7, 'Badua', 'Athena Lianne', 'Gutierrez', '2012-12-18', '2019-11-18 16:00:17'),
(51, 2540, '19001006', 7, 'Badua', 'Ayeiza Margaux', 'Santos', '2013-03-19', '2019-11-18 16:00:17'),
(52, 2785, '19001007', 7, 'Baradi', 'Dave', 'Cardinez', '2012-12-04', '2019-11-18 16:00:18'),
(53, 2948, '19001008', 7, 'Bautista', 'Rham John', 'Mendoza', '2013-06-23', '2019-11-18 16:00:18'),
(54, 2590, '19001009', 7, 'Bucsit', 'Althea Channelle', 'Abat', '2013-05-24', '2019-11-18 16:00:18'),
(55, 2576, '19001010', 7, 'Cardinez', 'Aliah Nicole Mariae', 'Bernaldo', '2012-12-27', '2019-11-18 16:00:18'),
(56, 2807, '19001011', 7, 'Chan', 'Ashley Nicole', 'Ballasiw', '2013-03-03', '2019-11-18 16:00:18'),
(57, 2945, '19001012', 7, 'Cidro, Jr.', 'Jason', 'Estrera', '2012-10-20', '2019-11-18 16:00:18'),
(58, 2577, '19001013', 7, 'Custodio', 'Brennan James', 'Pulvinar', '2013-02-08', '2019-11-18 16:00:18'),
(59, 2587, '19001014', 7, 'Dasalla', 'Ralph Justine', 'Peralta', '2012-10-08', '2019-11-18 16:00:19'),
(60, 2757, '19001015', 7, 'De Guzman', 'Aliya Keith', 'Cariaga', '2012-08-25', '2019-11-18 16:00:19'),
(61, 2707, '19001016', 7, 'De Leon', 'Haryl Aldris', 'Iguana', '2012-10-03', '2019-11-18 16:00:19'),
(62, 2802, '19001017', 7, 'De Mesa', 'Ravie Ramviell', 'Unida', '2012-12-20', '2019-11-18 16:00:19'),
(63, 2615, '19001018', 7, 'Dueñas', 'Jaylord Jhazz', 'Joaquin', '2013-04-17', '2019-11-18 16:00:19'),
(64, 2516, '19001019', 7, 'Fernandez', 'Zach Daelinn', 'Trinidad', '2013-07-09', '2019-11-18 16:00:19'),
(65, 2798, '19001020', 7, 'Fontanilla', 'Aaron Jhay', 'Perez', '2013-07-09', '2019-11-18 16:00:19'),
(66, 2921, '19001021', 7, 'Gaetos', 'Clara Jamila', 'Eugenio', '2012-09-10', '2019-11-18 16:00:19'),
(67, 2934, '19001022', 7, 'Galima', 'Julliana Reyzel', 'Rulloda', '2013-06-22', '2019-11-18 16:00:20'),
(68, 2673, '19001023', 7, 'Maglaque', 'Aaron Micho', 'Gutierrez', '2013-05-24', '2019-11-18 16:00:20'),
(69, 2766, '19001024', 7, 'Mamaat', 'Alice Margaux Dominique', 'Milanes', '2012-11-19', '2019-11-18 16:00:20'),
(70, 2633, '19001025', 7, 'Nebres', 'Amira Fayez', 'Campos', '2013-08-21', '2019-11-18 16:00:20'),
(71, 2877, '19001026', 7, 'Nuñez', 'Altheo Deron', 'Carbonell', '2013-08-08', '2019-11-18 16:00:20'),
(72, 2578, '19001027', 7, 'Olivar', 'Kevin Marion', 'Pulvinar', '2013-02-02', '2019-11-18 16:00:20'),
(73, 2855, '19001028', 7, 'Oredina', 'Ma. Louisse Margahrette', 'Madayag', '2013-06-08', '2019-11-18 16:00:20'),
(74, 2784, '19001029', 7, 'Orejudos', 'Sophia Ann', 'Marcella', '2012-10-30', '2019-11-18 16:00:21'),
(75, 2745, '19001030', 7, 'Orejudos', 'Zhiander Zuez', 'Lopez', '2012-12-04', '2019-11-18 16:00:21'),
(76, 2621, '19001031', 7, 'Pacheco', 'Antonio Agapito', 'Arbollente', '2013-03-18', '2019-11-18 16:00:21'),
(77, 2870, '19001032', 7, 'Pajarit', 'Earl Zach Yosef', 'Gapas', '2012-02-21', '2019-11-18 16:00:21'),
(78, 2537, '19001033', 7, 'Palabay', 'King Ydnar', 'Santos', '2012-05-05', '2019-11-18 16:00:21'),
(79, 2723, '19001034', 7, 'Pescasio', 'Lloyd', 'Hufalar', '2013-06-18', '2019-11-18 16:00:21'),
(80, 2539, '19001035', 7, 'Pras', 'Allyka Angel', 'Almoite', '2012-08-30', '2019-11-18 16:00:21'),
(81, 2548, '19001036', 7, 'Rivera Jr.', 'Dennis', 'Navarro', '2012-09-24', '2019-11-18 16:00:21'),
(82, 2716, '19001037', 7, 'Sagun', 'Reanne May', 'Valmonte', '2013-05-23', '2019-11-18 16:00:22'),
(83, 2595, '19001038', 7, 'Sebastian', 'Diana Faye', 'Andaya', '2013-04-01', '2019-11-18 16:00:22'),
(84, 2803, '19001039', 7, 'Tadina', 'John Kyzier', 'Ortiza', '2013-05-18', '2019-11-18 16:00:22'),
(85, 2955, '19001040', 7, 'Valdez', 'Tishka Yziah', 'Layacan', '2013-02-01', '2019-11-18 16:00:22'),
(86, 2624, '19001041', 7, 'Velasco', 'Sean Aeroc', 'Tabafunda', '2012-12-04', '2019-11-18 16:00:22'),
(87, 2778, '19001042', 7, 'Zaghloul', 'Sara', 'Cabanban', '2013-03-23', '2019-11-18 16:00:22'),
(88, 2631, '19002001', 7, 'Almirol', 'Denise Kathleen', 'Julaton', '2012-04-09', '2019-11-18 16:00:22'),
(89, 2898, '19002002', 7, 'Almodovar', 'Guenella Louresse', 'Gamueda', '2012-08-03', '2019-11-18 16:00:23'),
(90, 2736, '19002003', 7, 'Balagot', 'Dylan', 'Parong', '2012-03-12', '2019-11-18 16:00:23'),
(91, 2942, '19002004', 7, 'Balasoto', 'Exzekarl Vynz', 'Cidro', '2010-12-12', '2019-11-18 16:00:23'),
(92, 2660, '19002005', 7, 'Bautista', 'Gero Lorenzo', 'Perez', '2012-02-22', '2019-11-18 16:00:23'),
(93, 2622, '19002006', 7, 'Bravo', 'Samantha Llory', 'Ader', '2012-04-20', '2019-11-18 16:00:23'),
(94, 2936, '19002007', 7, 'Bueno, Jr.', 'Roy', 'Valmores', '2011-12-27', '2019-11-18 16:00:23'),
(95, 2846, '19002008', 7, 'Bulosan', 'Jon Davoughn', 'Calipjo', '2011-11-16', '2019-11-18 16:00:23'),
(96, 2782, '19002009', 7, 'Caccam', 'Jhen Ciam', 'Carig', '2012-08-30', '2019-11-18 16:00:24'),
(97, 2776, '19002010', 7, 'Espero', 'Florain Angelina', 'Estepa', '2012-07-29', '2019-11-18 16:00:24'),
(98, 2627, '19002011', 7, 'Familaran', 'Chloe Raine', 'Cadwising', '2012-04-12', '2019-11-18 16:00:24'),
(99, 2790, '19002012', 7, 'Fontanilla', 'Adam Vincent', 'Milanes', '2011-12-25', '2019-11-18 16:00:24'),
(100, 2875, '19002013', 7, 'Gabua', 'Aediel Dane Yvon', 'Pablo', '2012-04-03', '2019-11-18 16:00:24'),
(101, 2808, '19002014', 7, 'Gacutan', 'Raijin Santy', 'Gaudia', '2012-06-06', '2019-11-18 16:00:24'),
(102, 2904, '19002015', 7, 'Galima', 'Nesejucel', 'Cariaso', '2011-09-05', '2019-11-18 16:00:24'),
(103, 2848, '19002016', 7, 'Gallano', 'Floriano Graceson III', 'Obillo', '2012-07-05', '2019-11-18 16:00:24'),
(104, 2599, '19002017', 7, 'Jalop', 'Ejichelken Zelkie', 'Padilla', '2012-07-27', '2019-11-18 16:00:25'),
(105, 2834, '19002018', 7, 'Janecek', 'Andrea', 'Baluyut', '2012-01-11', '2019-11-18 16:00:25'),
(106, 2810, '19002019', 7, 'Julaton', 'Lawrence Vane', 'Bucsit', '2011-12-26', '2019-11-18 16:00:25'),
(107, 2800, '19002020', 7, 'Karganilla', 'Khira', 'Nanit', '2011-11-14', '2019-11-18 16:00:25'),
(108, 2594, '19002021', 7, 'Lapeña', 'Raphael Mikaela', 'Ami', '2012-01-22', '2019-11-18 16:00:25'),
(109, 2742, '19002022', 7, 'Llarenas', 'Thea Charisse', 'Tabutol', '2012-05-03', '2019-11-18 16:00:25'),
(110, 2754, '19002023', 7, 'Madayag', 'Leah Grace Maxine', 'Cariaga', '2012-09-25', '2019-11-18 16:00:25'),
(111, 2737, '19002024', 7, 'Micu', 'Jaycel Cristian', 'Llarenas', '2012-08-17', '2019-11-18 16:00:26'),
(112, 2584, '19002025', 7, 'Mosuela', 'Constantino Andrei', 'San Miguel', '2012-06-19', '2019-11-18 16:00:26'),
(113, 2799, '19002026', 7, 'Murao', 'Jubal Joseph', 'Batario', '2012-03-25', '2019-11-18 16:00:26'),
(114, 2939, '19002027', 7, 'Murillo', 'Princess Zi', 'Dulay', '2011-12-31', '2019-11-18 16:00:26'),
(115, 2739, '19002028', 7, 'Quiray', 'Zhedlee Monic', 'Ricanor', '2011-11-16', '2019-11-18 16:00:26'),
(116, 2796, '19002029', 7, 'Rodriguez', 'Keith Harvey', 'Tano', '2011-11-19', '2019-11-18 16:00:26'),
(117, 2641, '19002030', 7, 'Salapare', 'Christha Louise', 'Espe', '2011-08-06', '2019-11-18 16:00:26'),
(118, 2927, '19002031', 7, 'Soriano', 'Lorraine Nicolle', 'Oyam', '2012-10-02', '2019-11-18 16:00:27'),
(119, 2597, '19002032', 7, 'Vicente', 'Christer Kent', 'Acosta', '2011-11-16', '2019-11-18 16:00:27'),
(120, 2719, '19002033', 7, 'Villanueva', 'Eliezer', 'Hufalar', '2011-05-10', '2019-11-18 16:00:27'),
(121, 2652, '19003001', 7, 'Aban', 'Rej Jahn Floyd', 'Urbi', '2010-11-16', '2019-11-18 16:00:27'),
(122, 2528, '19003002', 7, 'Abat', 'Katrina Cassandra', 'Fumbuena', '2011-08-19', '2019-11-18 16:00:27'),
(123, 2885, '19003003', 7, 'Acosta', 'Jay Ivan', 'Subang', '2011-04-10', '2019-11-18 16:00:27'),
(124, 2703, '19003004', 7, 'Ancheta', 'Kylie Nicole', 'Nicanor', '2011-06-08', '2019-11-18 16:00:27'),
(125, 2889, '19003005', 7, 'Badua', 'Zia Jheiezel', 'Mostrales', '2010-11-08', '2019-11-18 16:00:27'),
(126, 2878, '19003006', 7, 'Carbonell', 'Aquisha Haleigh', 'Acosta', '2011-07-20', '2019-11-18 16:00:28'),
(127, 2868, '19003007', 7, 'Cuatriz', 'Angelica Kate', 'Sagun', '2011-05-01', '2019-11-18 16:00:28'),
(128, 2611, '19003008', 7, 'Dumale', 'Aseel Ahmed', 'Amistoso', '2011-09-07', '2019-11-18 16:00:28'),
(129, 2691, '19003009', 7, 'Galera', 'Nicole Rei', 'Balbin', '2010-12-02', '2019-11-18 16:00:28'),
(130, 2879, '19003010', 7, 'Karganilla', 'Jeroel', 'Buccat', '2010-10-12', '2019-11-18 16:00:28'),
(131, 2774, '19003011', 7, 'Kumar', 'Kein Andrei', 'Nebres', '2011-03-07', '2019-11-18 16:00:28'),
(132, 2828, '19003012', 7, 'Licudan III', 'Lance Adrian', 'Gaddao', '2011-08-05', '2019-11-18 16:00:28'),
(133, 2636, '19003013', 7, 'Ligoyligoy', 'Anne Chenel', 'Valmores', '2011-02-25', '2019-11-18 16:00:29'),
(134, 2886, '19003014', 7, 'Llarinas', 'Angelyn Mhae', 'Acosta', '2011-06-03', '2019-11-18 16:00:29'),
(135, 2620, '19003015', 7, 'Opinion', 'Zyd Arah Jyll', 'Morales', '2011-11-30', '2019-11-18 16:00:29'),
(136, 2843, '19003016', 7, 'Pisco', 'Isaiah Mishael', 'Valmores', '2011-07-24', '2019-11-18 16:00:29'),
(137, 2666, '19003017', 7, 'Quinonez', 'Gabrielle Nichole', 'De Castro', '2011-03-26', '2019-11-18 16:00:29'),
(138, 2849, '19003018', 7, 'Ramos', 'Ivan Denzel', 'Viernes', '2011-07-01', '2019-11-18 16:00:29'),
(139, 2913, '19003019', 7, 'Siy', 'Paulo Anthonio', 'Concignado', '2007-07-28', '2019-11-18 16:00:29'),
(140, 2830, '19003020', 7, 'Tapon', 'Jondirk Steven', 'Romulo', '2011-10-01', '2019-11-18 16:00:30'),
(141, 2735, '19003021', 7, 'Tavas', 'Leahcim Krizha June', 'Dumaguin', '2011-06-08', '2019-11-18 16:00:30'),
(142, 2650, '19004001', 7, 'Aban', 'Rhianna Janielle Faye', 'Urbi', '2009-11-19', '2019-11-18 16:00:30'),
(143, 2695, '19004002', 7, 'Abril', 'Heinessey', 'Padilla', '2010-03-07', '2019-11-18 16:00:30'),
(144, 2613, '19004003', 7, 'Antonio', 'Ethan Josef', 'Yllera', '2009-10-19', '2019-11-18 16:00:30'),
(145, 2779, '19004004', 7, 'Arquero', 'Liam Jagger', 'Agtarap', '2010-06-18', '2019-11-18 16:00:30'),
(146, 2728, '19004005', 7, 'Belleza', 'Althea Zeianah', 'Legaspi', '2010-05-27', '2019-11-18 16:00:30'),
(147, 2637, '19004006', 7, 'Beriña', 'Ma. Jamaica', 'Callejo', '2010-06-01', '2019-11-18 16:00:31'),
(148, 2661, '19004007', 7, 'Bugaing', 'Japheth Dave', 'Julaton', '2010-08-06', '2019-11-18 16:00:31'),
(149, 2818, '19004008', 7, 'Buraga', 'Paul Xendrix', 'Delmendo', '2010-06-07', '2019-11-18 16:00:31'),
(150, 2781, '19004009', 7, 'Caccam', 'Jane Margarette', 'Carig', '2010-10-11', '2019-11-18 16:00:31'),
(151, 2526, '19004010', 7, 'Capitan', 'Mc. Laurence Andrei', 'Borbe', '2009-12-22', '2019-11-18 16:00:31'),
(152, 2804, '19004011', 7, 'Cardinez', 'King Carmelo', 'Narnola', '2009-09-17', '2019-11-18 16:00:31'),
(153, 2789, '19004012', 7, 'Correlo', 'JM Weine Adriane', 'Encarnacion', '2010-11-04', '2019-11-18 16:00:31'),
(154, 2585, '19004013', 7, 'Dasalla', 'Aira Nicole', 'Peralta', '2009-11-04', '2019-11-18 16:00:31'),
(155, 2902, '19004014', 7, 'Dumale', 'Carmelee Miel', 'Morato', '2010-05-30', '2019-11-18 16:00:32'),
(156, 2814, '19004015', 7, 'Fernandez', 'Sabrina Joyce', 'Espiloy', '2010-05-04', '2019-11-18 16:00:32'),
(157, 2839, '19004016', 7, 'Fortuna', 'Seth Adam', 'Dumale', '2009-01-09', '2019-11-18 16:00:32'),
(158, 2669, '19004017', 7, 'Gacayan', 'Zyrille', 'Hernandez', '2010-09-05', '2019-11-18 16:00:32'),
(159, 2820, '19004018', 7, 'Gaudia', 'Carl Adrian', 'Cariaga', '2010-02-20', '2019-11-18 16:00:32'),
(160, 2617, '19004019', 7, 'Licudan', 'Dan Eleizar', 'Cayabyab', '2010-02-14', '2019-11-18 16:00:32'),
(161, 2702, '19004020', 7, 'Licudan', 'Neil Christopher', 'Sibayan', '2010-01-13', '2019-11-18 16:00:32'),
(162, 2773, '19004021', 7, 'Licudine', 'Danielle Anicah', 'Nebres', '2009-11-26', '2019-11-18 16:00:33'),
(163, 2605, '19004022', 7, 'Macasaet', 'Gabriel', 'Mayo', '2010-03-16', '2019-11-18 16:00:33'),
(164, 2607, '19004023', 7, 'Macasaet', 'Michael', 'Mayo', '2010-03-16', '2019-11-18 16:00:33'),
(165, 2589, '19004024', 7, 'Navarette', 'Denver', 'Mendoza', '2010-04-03', '2019-11-18 16:00:33'),
(166, 2694, '19004025', 7, 'Oloresisimo', 'Xyrien Jasen', 'Aclinin', '2010-10-12', '2019-11-18 16:00:33'),
(167, 2672, '19004026', 7, 'Pajimola', 'Kristine Mhevic', 'Gutierrez', '2010-01-25', '2019-11-18 16:00:33'),
(168, 2616, '19004027', 7, 'Palabay', 'Ira Kay', 'Santos', '2009-09-26', '2019-11-18 16:00:33'),
(169, 2724, '19004028', 7, 'Pescasio', 'Michelle Joy', 'Hufalar', '2010-01-20', '2019-11-18 16:00:34'),
(170, 2713, '19004029', 7, 'Rodriguez', 'Kathleen May', 'Carig', '2010-05-10', '2019-11-18 16:00:34'),
(171, 2914, '19004030', 7, 'Siy', 'Julio Orlhando', 'Consignado', '2009-11-28', '2019-11-18 16:00:34'),
(172, 2864, '19004031', 7, 'Valmores', 'Day Alexandria', 'Cachero', '2010-01-19', '2019-11-18 16:00:34'),
(173, 2956, '19004032', 7, 'Velasco', 'Lyoel Kenneth', 'Martinez', '2010-04-08', '2019-11-18 16:00:34'),
(174, 2625, '19004033', 7, 'Velasco', 'Miyuki Elaine', 'Tabafunda', '2010-04-14', '2019-11-18 16:00:34'),
(175, 2858, '19004034', 7, 'Vera', 'Sunrise Andrei Lee', 'Panergo', '2010-05-23', '2019-11-18 16:00:34'),
(176, 2704, '19005001', 7, 'Afroilan', 'Flaubert Gixchel', 'Posadas', '2009-03-31', '2019-11-18 16:00:34'),
(177, 2822, '19005002', 7, 'Almoite', 'Cyrel Kaiser', 'Tindugan', '2008-11-13', '2019-11-18 16:00:35'),
(178, 2551, '19005003', 7, 'Aquino', 'Kryzelle Keith', 'Negrillo', '2009-10-15', '2019-11-18 16:00:35'),
(179, 2555, '19005004', 7, 'Balubar', 'Jaliyiah Krishna Leatrix', 'Obra', '2009-12-02', '2019-11-18 16:00:35'),
(180, 2786, '19005005', 7, 'Baradi', 'James', 'Cardinez', '2008-12-15', '2019-11-18 16:00:35'),
(181, 2806, '19005006', 7, 'Bonete', 'RJ', 'Ballasiw', '2008-12-31', '2019-11-18 16:00:35'),
(182, 2787, '19005007', 7, 'Buccat', 'Glynneth Grace', '-', '2009-09-12', '2019-11-18 16:00:35'),
(183, 2819, '19005008', 7, 'Buen', 'Shanaia Chloe', 'Acoba', '2009-02-09', '2019-11-18 16:00:35'),
(184, 2862, '19005009', 7, 'Colesio', 'Joran Benedict', 'Sobrepeña', '2009-01-07', '2019-11-18 16:00:36'),
(185, 2859, '19005010', 7, 'Comia', 'Kryztiel Titus', 'Gaon', '2009-03-20', '2019-11-18 16:00:36'),
(186, 2946, '19005011', 7, 'Estrera', 'Princess Joy', 'Avanzado', '2009-02-19', '2019-11-18 16:00:36'),
(187, 2815, '19005012', 7, 'Fernandez', 'Mel Deon', 'Espiloy', '2008-12-20', '2019-11-18 16:00:36'),
(188, 2890, '19005013', 7, 'Fontanilla', 'Jethro CJ', 'Carrera', '2009-09-07', '2019-11-18 16:00:36'),
(189, 2642, '19005014', 7, 'Gagni IV', 'Rufino Florenzar', 'Caramat', '2009-08-05', '2019-11-18 16:00:36'),
(190, 2671, '19005015', 7, 'Hernandez', 'Audry', 'Sabado', '2009-07-09', '2019-11-18 16:00:36'),
(191, 2826, '19005016', 7, 'Lapitan', 'Franz Andrei', 'Carig', '2009-03-27', '2019-11-18 16:00:37'),
(192, 2909, '19005017', 7, 'Murao', 'Ghaea Chloe Nickole', 'Cariaso', '2008-11-22', '2019-11-18 16:00:37'),
(193, 2746, '19005018', 7, 'Murao', 'Jao Bhennyz', 'Avecilla', '2009-07-07', '2019-11-18 16:00:37'),
(194, 2841, '19005019', 7, 'Neri', 'Czedrick Uriel', 'Saranquin', '2009-09-28', '2019-11-18 16:00:37'),
(195, 2926, '19005020', 7, 'Oyam', 'Alexandria Danielle', 'Rafael', '2008-12-27', '2019-11-18 16:00:37'),
(196, 2874, '19005021', 7, 'Robin', 'Cassidy Rose', 'Villanueva', '2009-07-25', '2019-11-18 16:00:37'),
(197, 2892, '19005022', 7, 'Salamanca', 'Cyan Zefyre', 'Unabia', '2009-06-29', '2019-11-18 16:00:37'),
(198, 2911, '19005023', 7, 'Sarmiento', 'Liana', 'Soberano', '2009-11-10', '2019-11-18 16:00:38'),
(199, 2639, '19005024', 7, 'Sayago', 'Stephen Harper', 'Gañola', '2009-01-14', '2019-11-18 16:00:38'),
(200, 2593, '19005025', 7, 'Sobrepeña', 'Nikkita Jade', '-', '2009-03-01', '2019-11-18 16:00:38'),
(201, 2630, '19005026', 7, 'Tangalin', 'Precious Wendelle', 'Mengarajal', '2009-06-09', '2019-11-18 16:00:38'),
(202, 2793, '19005027', 7, 'Taningco', 'Kami Kase', 'Buen', '2008-08-24', '2019-11-18 16:00:38'),
(203, 2638, '19005028', 7, 'Valdez', 'Alexander John Lee', 'Salud', '2009-10-29', '2019-11-18 16:00:38'),
(204, 2919, '19006001', 7, 'Arceo', 'Kurt Brian', 'Bautista', '2008-10-17', '2019-11-18 16:00:38'),
(205, 2711, '19006002', 7, 'Bautista', 'Aiziah Jillian', 'Abenoja', '2008-06-12', '2019-11-18 16:00:38'),
(206, 2869, '19006003', 7, 'Bodoy', 'Theodinn Cyrl', 'Obra', '2008-10-28', '2019-11-18 16:00:39'),
(207, 2680, '19006004', 7, 'Cabungan', 'Czar Erlwen', 'Abobo', '2008-02-23', '2019-11-18 16:00:39'),
(208, 2944, '19006005', 7, 'Cidro', 'Jin Harry', 'Varona', '2007-01-23', '2019-11-18 16:00:39'),
(209, 2715, '19006006', 7, 'Cortez', 'Ylron Kyle', 'Cardines', '2008-02-04', '2019-11-18 16:00:39'),
(210, 2602, '19006007', 7, 'Crisanto', 'Sheryll Erica', 'Gurion', '2008-10-13', '2019-11-18 16:00:39'),
(211, 2928, '19006008', 7, 'Dacanay', 'Marriz Ysabel', 'Rabon', '2008-01-17', '2019-11-18 16:00:39'),
(212, 2756, '19006009', 7, 'De Guzman', 'Marck Jay', 'Cariaga', '2008-08-18', '2019-11-18 16:00:39'),
(213, 2699, '19006010', 7, 'Delmendo', 'Crixan Aisen', 'Antolin', '2008-09-02', '2019-11-18 16:00:40'),
(214, 2683, '19006011', 7, 'Difuntorum', 'Zach Franche', 'Valmores', '2008-07-03', '2019-11-18 16:00:40'),
(215, 2867, '19006012', 7, 'Dumale', 'Jayron', 'Derit', '2008-08-14', '2019-11-18 16:00:40'),
(216, 2643, '19006013', 7, 'Gagni', 'Niña Jade', 'Caramat', '2007-03-07', '2019-11-18 16:00:40'),
(217, 2601, '19006014', 7, 'Jalop', 'Ejichelsea Diane', 'Padilla', '2008-07-13', '2019-11-18 16:00:40'),
(218, 2908, '19006015', 7, 'Julaton', 'Viel Audrey Nicole', 'Bio', '2008-11-25', '2019-11-18 16:00:40'),
(219, 2896, '19006016', 7, 'Julaton', 'Zyra Alexis', 'Dela Cruz', '2008-02-19', '2019-11-18 16:00:40'),
(220, 2880, '19006017', 7, 'Karganilla', 'Jimmuel', 'Buccat', '2007-11-11', '2019-11-18 16:00:41'),
(221, 2811, '19006018', 7, 'Lorenzo', 'Dar Philip', 'Estolas', '2008-05-25', '2019-11-18 16:00:41'),
(222, 2925, '19006019', 7, 'Lorica', 'Cassandra Ashleyn', 'Flores', '2007-12-07', '2019-11-18 16:00:41'),
(223, 2883, '19006020', 7, 'Macula', 'Jennikris Lillou', 'Peñamora', '2008-01-04', '2019-11-18 16:00:41'),
(224, 2817, '19006021', 7, 'Navor', 'Mikaela', 'Flores', '2007-09-11', '2019-11-18 16:00:41'),
(225, 2881, '19006022', 7, 'Nicer', 'Charles Nellie', 'Buccat', '2008-11-19', '2019-11-18 16:00:41'),
(226, 2693, '19006023', 7, 'Oloresisimo', 'Rizia Julienne', 'Aclinin', '2008-09-01', '2019-11-18 16:00:41'),
(227, 2646, '19006024', 7, 'Padua', 'Louis Alexander', 'Salvosa', '2008-06-22', '2019-11-18 16:00:42'),
(228, 2651, '19006025', 7, 'Perol', 'Mikyla Jureen', 'Ancheta', '2008-11-09', '2019-11-18 16:00:42'),
(229, 2717, '19006026', 7, 'Sagun', 'Russel John', 'Valmonte', '2008-06-08', '2019-11-18 16:00:42'),
(230, 2893, '19006027', 7, 'Salamanca', 'Ryden Angelo', 'Unabia', '2007-12-29', '2019-11-18 16:00:42'),
(231, 2619, '19006028', 7, 'Salazar', 'Israeleigh Dave', 'Tabubuca', '2008-08-06', '2019-11-18 16:00:42'),
(232, 2538, '19006029', 7, 'Tabtab', 'Bernard Caleb', 'Santos', '2008-04-21', '2019-11-18 16:00:42'),
(233, 2788, '19006030', 7, 'Urgel', 'Lanze Alexandrea', '-', '2007-10-16', '2019-11-18 16:00:42'),
(234, 2720, '19006031', 7, 'Vega', 'Rachel', 'Hufalar', '2007-10-10', '2019-11-18 16:00:42'),
(235, 2560, '19006032', 7, 'Villano', 'Roanne Denise', 'Reyes', '2007-10-09', '2019-11-18 16:00:43'),
(236, 2565, '19007001', 7, 'Abuluyan', 'Steven Sky', 'Gurion', '2007-08-07', '2019-11-18 16:00:43'),
(237, 2462, '19007002', 7, 'Acopra', 'John Alvin', 'Pineda', '2007-09-14', '2019-11-18 16:00:43'),
(238, 2753, '19007003', 7, 'Albaciete', 'Harvey', 'Cabatu', '2007-09-28', '2019-11-18 16:00:43'),
(239, 2519, '19007004', 7, 'Alviar', 'Ashley Nicole', 'Buton', '2007-08-16', '2019-11-18 16:00:43'),
(240, 2455, '19007005', 7, 'Bellen', 'Klexzell Josh', 'Almarez', '2006-11-02', '2019-11-18 16:00:43'),
(241, 2517, '19007006', 7, 'Bongolan', 'John Je', 'Tadije', '2007-12-18', '2019-11-18 16:00:43'),
(242, 2518, '19007007', 7, 'Cabansag', 'Lawrence Anthony', 'Arcega', '2006-11-03', '2019-11-18 16:00:44'),
(243, 2458, '19007008', 7, 'Cariaso', 'John Marvin', 'Bucalbos', '2006-11-02', '2019-11-18 16:00:44'),
(244, 2550, '19007009', 7, 'Cavaneyro', 'Euseph Angelo', 'Dulay', '2006-11-22', '2019-11-18 16:00:44'),
(245, 2465, '19007010', 7, 'Corpuz', 'Joe Aldrin', 'Pabustan', '2007-09-08', '2019-11-18 16:00:44'),
(246, 2460, '19007011', 7, 'De Guzman', 'Kyle Joshua', 'Cariaga', '2006-05-11', '2019-11-18 16:00:44'),
(247, 2827, '19007012', 7, 'De La Cruz', 'John Crester Lee', 'Acosta', '2006-07-20', '2019-11-18 16:00:44'),
(248, 2727, '19007013', 7, 'Delfinado', 'Czreen Kriz', 'Bayatin', '2007-01-23', '2019-11-18 16:00:44'),
(249, 2469, '19007014', 7, 'Dilim', 'King Randolf', 'Sarmiento', '2007-08-15', '2019-11-18 16:00:45'),
(250, 2457, '19007015', 7, 'Dumale', 'Jonas Aaron', 'Derit', '2007-07-03', '2019-11-18 16:00:45'),
(251, 2464, '19007016', 7, 'Eslava', 'Ralph Lourenz', '-', '2005-04-19', '2019-11-18 16:00:45'),
(252, 2470, '19007017', 7, 'Espejo', 'Raesha Yzabel', 'Bishara', '2006-12-08', '2019-11-18 16:00:45'),
(253, 2836, '19007018', 7, 'Espero', 'Reneil Andre', 'Guillergan', '2007-06-30', '2019-11-18 16:00:45'),
(254, 2463, '19007019', 7, 'Ferrer', 'Honeymae Lakiezha', 'Ancheta', '2007-03-11', '2019-11-18 16:00:45'),
(255, 2684, '19007020', 7, 'Ferrera', 'Yael Anthony', 'Valmores', '2007-05-25', '2019-11-18 16:00:45'),
(256, 2777, '19007021', 7, 'Flores', 'Cyrus Marc', 'Culan-culan', '2006-12-03', '2019-11-18 16:00:46'),
(257, 2933, '19007022', 7, 'Galima', 'Juline Ffezaj', 'Rolyoda', '2007-06-24', '2019-11-18 16:00:46'),
(258, 2459, '19007023', 7, 'Galima', 'Lord Lawrence', 'Cariaso', '2007-03-22', '2019-11-18 16:00:46'),
(259, 2535, '19007024', 7, 'Gonzales', 'John Rhenz', 'Tuliao', '2007-08-17', '2019-11-18 16:00:46'),
(260, 2474, '19007025', 7, 'Gonzales', 'Kendrick', 'Barti', '2006-09-26', '2019-11-18 16:00:46'),
(261, 2764, '19007026', 7, 'Higoy', 'Marc Dassel Bjay', 'Flores', '2007-02-22', '2019-11-18 16:00:46'),
(262, 2563, '19007027', 7, 'Ilar', 'John Reymark', 'Buen', '2006-12-12', '2019-11-18 16:00:46'),
(263, 2835, '19007028', 7, 'Janecek', 'Frank Karl', 'Baluyot', '2005-12-06', '2019-11-18 16:00:47'),
(264, 2454, '19007029', 7, 'Macuroy', 'Joen Dayne', 'Carig', '2007-11-02', '2019-11-18 16:00:47'),
(265, 2856, '19007030', 7, 'Mangaoang', 'Stella Rollaine', 'Balboa', '2007-09-05', '2019-11-18 16:00:47'),
(266, 2452, '19007031', 7, 'Manila', 'Maria Angelica', 'Ayson', '2006-11-26', '2019-11-18 16:00:47'),
(267, 2453, '19007032', 7, 'Manila', 'Rhenz', 'Ayson', '2005-04-27', '2019-11-18 16:00:47'),
(268, 2752, '19007033', 7, 'Martinez', 'Humphrey', 'Cabatu', '2006-12-28', '2019-11-18 16:00:47'),
(269, 2456, '19007034', 7, 'Pal-et', 'Scott Lance', 'Illahi', '2007-04-03', '2019-11-18 16:00:47'),
(270, 2461, '19007035', 7, 'Parchamento', 'Elizabeth', 'Madayag', '2006-08-27', '2019-11-18 16:00:47'),
(271, 2468, '19007036', 7, 'Resurreccion', 'Kristal Jade', 'Lacbao', '2006-12-13', '2019-11-18 16:00:48'),
(272, 2466, '19007037', 7, 'Ynalvez', 'Cherry', 'Guiang', '2007-01-28', '2019-11-18 16:00:48'),
(273, 2960, '19007038', 7, 'Pineda', 'James Orlan', 'Camba', '2007-04-30', '2019-11-18 16:00:48'),
(274, 2965, '19007039', 7, 'Moreno', 'John Erwayne', 'Pajarit', '2007-05-16', '2019-11-18 16:00:48'),
(275, 2580, '19008001', 7, 'Almirol', 'Ashera Mhaxelyn', 'Valin', '2006-01-04', '2019-11-18 16:00:48'),
(276, 2686, '19008002', 7, 'Apilado', 'Ryssa Clarisse', 'Esmao', '2006-01-26', '2019-11-18 16:00:48'),
(277, 2558, '19008003', 7, 'Balubar', 'Lyka Joy', 'Obra', '2006-01-24', '2019-11-18 16:00:49'),
(278, 2917, '19008004', 7, 'Banayos', 'Jeus', 'Carig', '2006-10-05', '2019-11-18 16:00:49'),
(279, 2623, '19008005', 7, 'Bravo', 'Elaijah Llory', 'Ader', '2006-10-07', '2019-11-18 16:00:49'),
(280, 2937, '19008006', 7, 'Briones', 'Duane Art', 'Velasco', '2005-12-05', '2019-11-18 16:00:49'),
(281, 2708, '19008007', 7, 'Cardinez', 'Melvin', 'Gagnao', '2006-08-21', '2019-11-18 16:00:49'),
(282, 2924, '19008008', 7, 'Cargue', 'Kurt Daryll', 'C.', '2005-06-21', '2019-11-18 16:00:49'),
(283, 2831, '19008009', 7, 'Carig', 'Maru Joaquin', 'Romulo', '2006-09-22', '2019-11-18 16:00:49'),
(284, 2888, '19008010', 7, 'Casugay', 'Klein Josh Aldrey', 'Orejudos', '2006-03-16', '2019-11-18 16:00:49'),
(285, 2943, '19008011', 7, 'Cidro', 'Jacel', 'Varona', '2006-03-30', '2019-11-18 16:00:50'),
(286, 2685, '19008012', 7, 'Daganta', 'Harvey', 'Laigo', '2005-11-18', '2019-11-18 16:00:50'),
(287, 2632, '19008013', 7, 'Dauz', 'Clidehn Sher', 'Murao', '2006-01-17', '2019-11-18 16:00:50'),
(288, 2761, '19008014', 7, 'Espero', 'Gabriel Louis', 'Mariñas', '2006-04-03', '2019-11-18 16:00:50'),
(289, 2950, '19008015', 7, 'Esperon', 'Christina Sophia', 'Alforque', '2005-06-13', '2019-11-18 16:00:50'),
(290, 2741, '19008016', 7, 'Llarenas', 'Mae Jenesis', 'Tabutol', '2005-08-30', '2019-11-18 16:00:50'),
(291, 2606, '19008017', 7, 'Macasaet', 'Heart Daines', 'Mayo', '2006-02-14', '2019-11-18 16:00:50'),
(292, 2649, '19008018', 7, 'Molina', 'Reign Margarithe', 'Encarnacion', '2005-10-20', '2019-11-18 16:00:51'),
(293, 2656, '19008019', 7, 'Nerida', 'Ashley Hope', 'Marquez', '2005-12-12', '2019-11-18 16:00:51'),
(294, 2647, '19008020', 7, 'Opetina', 'Ednard Andrei', 'Gañola', '2006-03-29', '2019-11-18 16:00:51'),
(295, 2679, '19008021', 7, 'Orodio', 'Ghreaven John', 'Parong', '2005-11-05', '2019-11-18 16:00:51'),
(296, 2604, '19008022', 7, 'Pagaduan', 'Maddoxx', 'Tomines', '2005-05-22', '2019-11-18 16:00:51'),
(297, 2705, '19008023', 7, 'Pajimola', 'Jaschly', 'Posadas', '2006-01-08', '2019-11-18 16:00:51'),
(298, 2730, '19008024', 7, 'Pandakila', 'Eitan Jeuel', 'Boado', '2006-08-21', '2019-11-18 16:00:51'),
(299, 2775, '19008025', 7, 'Quitoriano', 'Patrick Alexander', 'Regacho', '2005-11-30', '2019-11-18 16:00:52'),
(300, 2954, '19008026', 7, 'Rina', 'Gabriell Carl Gian', 'Obillo', '2006-03-19', '2019-11-18 16:00:52'),
(301, 2805, '19008027', 7, 'Tamayo', 'Assher Nathan', 'Cabanban', '2005-07-20', '2019-11-18 16:00:52'),
(302, 2640, '19008028', 7, 'Tiu', 'Khouny Caeth', 'Camalig', '2005-10-29', '2019-11-18 16:00:52'),
(303, 2865, '19008029', 7, 'Valmores', 'Ray Andre', 'Cachero', '2006-08-17', '2019-11-18 16:00:52'),
(304, 2598, '19008030', 7, 'Vicente', 'Devin Clark', 'Acosta', '2006-08-18', '2019-11-18 16:00:52'),
(305, 2718, '19008031', 7, 'Villanueva', 'Cyrel Fiona', 'Hufalar', '2006-09-02', '2019-11-18 16:00:52'),
(306, 2861, '19008032', 7, 'Virola', 'Clark Marwin', 'Dela Torre', '2005-12-14', '2019-11-18 16:00:52'),
(307, 2629, '19008033', 7, 'Zhong', 'Nishon Roy', 'Ancheta', '2006-10-19', '2019-11-18 16:00:53'),
(308, 2964, '19008034', 7, 'Bucsit', 'Ethan Japheth Chirstin', 'Zarcilla', '2002-09-07', '2019-11-18 16:00:53'),
(309, 2700, '19009001', 7, 'Alfiler', 'Allen Khenje', 'Osis', '2005-03-22', '2019-11-18 16:00:53'),
(310, 2658, '19009002', 7, 'Almoite', 'Julio', 'Oreine', '2005-02-01', '2019-11-18 16:00:53'),
(311, 2692, '19009003', 7, 'Andrada', 'John Edward', 'Orbeso', '2005-02-06', '2019-11-18 16:00:53'),
(312, 2657, '19009004', 7, 'Badua', 'Airiz Precious', 'Areola', '2005-09-19', '2019-11-18 16:00:53'),
(313, 2556, '19009005', 7, 'Balubar', 'Lalaine Mia Jeanne', 'Obra', '2005-01-05', '2019-11-18 16:00:53'),
(314, 2887, '19009006', 7, 'Callos, Jr.', 'Rodrigo', 'Galima', '2005-06-08', '2019-11-18 16:00:54'),
(315, 2916, '19009007', 7, 'Casibang', 'Joanne', 'Banayos', '2005-10-27', '2019-11-18 16:00:54'),
(316, 2582, '19009008', 7, 'Catalan', 'Aqui', 'Bandoy', '2005-07-26', '2019-11-18 16:00:54'),
(317, 2930, '19009009', 7, 'Dacanay', 'Mark Izaiah', 'Rabon', '2005-02-03', '2019-11-18 16:00:54'),
(318, 2586, '19009010', 7, 'Dasalla', 'Ciara Mae', 'Peralta', '2005-02-07', '2019-11-18 16:00:54'),
(319, 2725, '19009011', 7, 'Delfinado', 'Charisse Keesha', 'Bayatin', '2004-10-29', '2019-11-18 16:00:54'),
(320, 2894, '19009012', 7, 'Domondon II', 'Onofre', 'Suyat', '2004-12-09', '2019-11-18 16:00:54'),
(321, 2813, '19009013', 7, 'Fernandez', 'Samantha', 'Espiloy', '2004-07-27', '2019-11-18 16:00:55'),
(322, 2922, '19009014', 7, 'Madayag', 'Djaunathan Albert', 'Sotto', '2006-03-08', '2019-11-18 16:00:55'),
(323, 2733, '19009015', 7, 'Medrano', 'Mark Justin', 'Velasco', '2004-12-08', '2019-11-18 16:00:55'),
(324, 2663, '19009016', 7, 'Menguita', 'Ayen Dana', 'Calub', '2004-11-24', '2019-11-18 16:00:55'),
(325, 2655, '19009017', 7, 'Oreiro', 'Jaqueline', 'Fagela', '2004-10-03', '2019-11-18 16:00:55'),
(326, 2884, '19009018', 7, 'Peñamora', 'John Reynold', 'Cañedo', '2004-05-04', '2019-11-18 16:00:55'),
(327, 2794, '19009019', 7, 'Santos', 'Deiv Irysh', 'Cabigao', '2005-05-10', '2019-11-18 16:00:55'),
(328, 2682, '19009020', 7, 'Saranquin', 'Yvan Louis', 'Licudan', '2004-10-18', '2019-11-18 16:00:55'),
(329, 2677, '19009021', 7, 'Sevilleja', 'John Astrid', 'Patacsil', '2005-06-08', '2019-11-18 16:00:56'),
(330, 2801, '19009022', 7, 'Soriano', 'Juliana Nihcole', 'Licudan', '2005-10-31', '2019-11-18 16:00:56'),
(331, 2873, '19009023', 7, 'Valdivia', 'Chealsea', 'Nebres', '2005-03-12', '2019-11-18 16:00:56'),
(332, 2579, '19009024', 7, 'Vergara', 'Aldrich Yuan', 'Valin', '2004-11-04', '2019-11-18 16:00:56'),
(333, 2690, '19009025', 7, 'Vizon', 'Sophia Kristalyn May', 'Almodovar', '2005-05-07', '2019-11-18 16:00:56'),
(334, 2959, '19009026', 7, 'Orejudos', 'Harren', 'Lopez', '2004-12-12', '2019-11-18 16:00:56'),
(335, 2962, '19009027', 7, 'Bañez', 'George Will', 'Gatchalian', '2004-03-27', '2019-11-18 16:00:56'),
(336, 2963, '19009028', 7, 'Domondon', 'Gaily Aria', 'Patiag', '2004-09-16', '2019-11-18 16:00:57'),
(337, 2966, '19009029', 7, 'Co', 'Zesha Zeus', 'Arbollente', '2005-03-22', '2019-11-18 16:00:57'),
(338, 2923, '19010001', 7, 'Abril', 'Keithly', '-', '2003-12-27', '2019-11-18 16:00:57'),
(339, 2689, '19010002', 7, 'Almodovar', 'Reina Jasmine', 'Macaballug', '2004-01-06', '2019-11-18 16:00:57'),
(340, 2675, '19010003', 7, 'Andrada', 'James Rodrick', 'Orbeso', '2002-09-16', '2019-11-18 16:00:57'),
(341, 2546, '19010004', 7, 'Arquero', 'Jesus Jalord', 'Offemaria', '2003-06-20', '2019-11-18 16:00:57'),
(342, 2751, '19010005', 7, 'Arreola', 'Kyle Vincent', 'Sobremonte', '2004-06-28', '2019-11-18 16:00:57'),
(343, 2734, '19010006', 7, 'Badua', 'Jovany Lex', 'Aban', '2004-11-06', '2019-11-18 16:00:58'),
(344, 2557, '19010007', 7, 'Balala', 'Jermie', 'Balmonte', '2004-08-19', '2019-11-18 16:00:58'),
(345, 2832, '19010008', 7, 'Bambico', 'Archimedes', 'Maniego', '2002-07-26', '2019-11-18 16:00:58'),
(346, 2681, '19010009', 7, 'Bautista', 'Regina Joy', 'Cabungan', '2004-06-22', '2019-11-18 16:00:58'),
(347, 2676, '19010010', 7, 'Bergado', 'Shane Denise', 'Buen', '2003-09-04', '2019-11-18 16:00:58'),
(348, 2731, '19010011', 7, 'Boado', 'Elijah Nathan', 'Taningco', '2004-06-07', '2019-11-18 16:00:58'),
(349, 2670, '19010012', 7, 'Buccat', 'Kristine', 'Obra', '2004-03-10', '2019-11-18 16:00:58'),
(350, 2497, '19010013', 7, 'Cabagbag', 'Mia May', 'Garcia', '2003-06-03', '2019-11-18 16:00:58'),
(351, 2780, '19010014', 7, 'Cabanban', 'Iver Christian', 'Agtarap', '2003-12-12', '2019-11-18 16:00:59'),
(352, 2932, '19010015', 7, 'Cagunot', 'Dan Joseph', 'Murao', '2003-12-29', '2019-11-18 16:00:59'),
(353, 2662, '19010016', 7, 'Carig', 'Irezze Christelle', 'Pelagio', '2004-11-13', '2019-11-18 16:00:59'),
(354, 2891, '19010017', 7, 'Catuira', 'James David', 'Caoagas', '2004-04-04', '2019-11-18 16:00:59'),
(355, 2659, '19010018', 7, 'Colastre', 'Dashiel Jourdann', 'Almodovar', '2003-08-23', '2019-11-18 16:00:59'),
(356, 2829, '19010019', 7, 'De Castro', 'Jet Renier', 'Laranang', '2004-09-23', '2019-11-18 16:00:59'),
(357, 2906, '19010020', 7, 'De Leon', 'John Pathrick', 'Sagum', '2003-06-14', '2019-11-18 16:00:59'),
(358, 2953, '19010021', 7, 'Dulay', 'Steven Miguel', 'Santos', '2003-10-03', '2019-11-18 16:01:00'),
(359, 2901, '19010022', 7, 'Dumale', 'Lency Eunice', 'Morato', '2003-09-12', '2019-11-18 16:01:00'),
(360, 2644, '19010023', 7, 'Gagni', 'Kyla Pearl', 'Caramat', '2003-07-03', '2019-11-18 16:01:00'),
(361, 2600, '19010024', 7, 'Jalop', 'Ejichelle Christinsen', 'Padilla', '2003-12-23', '2019-11-18 16:01:00'),
(362, 2701, '19010025', 7, 'Licudan', 'Christian Miguel', 'Sibayan', '2003-09-01', '2019-11-18 16:01:00'),
(363, 2740, '19010026', 7, 'Llarenas', 'Jullian Rheign', 'Tabutol', '2003-11-25', '2019-11-18 16:01:00'),
(364, 2665, '19010027', 7, 'Marticio', 'Jayson Lars', 'Opeña', '2003-11-28', '2019-11-18 16:01:00'),
(365, 2559, '19010028', 7, 'Mayo', 'Mikhael Alfonso', 'Alviar', '2003-12-27', '2019-11-18 16:01:01'),
(366, 2816, '19010029', 7, 'Ocampo', 'Flora Joy', 'Espada', '2004-06-09', '2019-11-18 16:01:01'),
(367, 2935, '19010030', 7, 'Padilla', 'Billie Jane', 'Donor', '2003-07-20', '2019-11-18 16:01:01'),
(368, 2596, '19010031', 7, 'Padilla', 'Yvan Angelo', 'Marzo', '2004-04-12', '2019-11-18 16:01:01'),
(369, 2645, '19010032', 7, 'Padua', 'Alexa Luisa', 'Salvosa', '2004-08-28', '2019-11-18 16:01:01'),
(370, 2772, '19010033', 7, 'Ponce', 'Cherrie Joy', 'Hufana', '2004-01-21', '2019-11-18 16:01:01'),
(371, 2912, '19010034', 7, 'Quintilitisca', 'Tom', 'Gaudia', '2004-11-20', '2019-11-18 16:01:01'),
(372, 2769, '19010035', 7, 'Raguindin', 'Rhemar', 'Rivera', '2002-11-05', '2019-11-18 16:01:02'),
(373, 2714, '19010036', 7, 'Rodriguez', 'Kate  Pauline', 'Carig', '2004-11-13', '2019-11-18 16:01:02'),
(374, 2812, '19010037', 7, 'Suriben', 'Sean Edward', 'Sy', '2004-09-11', '2019-11-18 16:01:02'),
(375, 2612, '19010038', 7, 'Taningco', 'Justine Harvey', 'Pepito', '2004-04-30', '2019-11-18 16:01:02'),
(376, 2567, '19010039', 7, 'Villanueva', 'Mark Francis', 'Oximana', '2003-09-09', '2019-11-18 16:01:02'),
(377, 2821, '19010040', 7, 'Zabate', 'Harry Justine', 'Udtohan', '2004-08-01', '2019-11-18 16:01:02'),
(378, 2628, '19010041', 7, 'Zhong', 'Nico Roy', 'Ancheta', '2003-12-26', '2019-11-18 16:01:02'),
(379, 2561, '19011001', 7, 'Acosta', 'Allan Carl', 'Caricungan', '2003-10-31', '2019-11-18 16:01:03'),
(380, 2506, '19011002', 7, 'Acosta', 'Angelica', 'Espejo', '2003-04-27', '2019-11-18 16:01:03'),
(381, 2501, '19011003', 7, 'Alminiana', 'Erika Joy', 'Tablac', '2003-08-24', '2019-11-18 16:01:03'),
(382, 2547, '19011004', 7, 'Alminiana', 'Shasney', 'Sabado', '2003-08-02', '2019-11-18 16:01:03'),
(383, 2931, '19011005', 7, 'Almoite III', 'Daniel Danilo', 'Hufano', '2002-11-25', '2019-11-18 16:01:03'),
(384, 2527, '19011006', 7, 'Arabe', 'Ezekiah Jhel', 'Esperon', '2003-07-03', '2019-11-18 16:01:03'),
(385, 2541, '19011007', 7, 'Azares', 'Carl Joshua', 'Elan', '2002-11-04', '2019-11-18 16:01:03'),
(386, 2493, '19011008', 7, 'Baesa', 'Edrie', 'Opeña', '2003-04-25', '2019-11-18 16:01:04'),
(387, 2608, '19011009', 7, 'Bala', 'Leslie Anne', 'Ugot', '2003-08-27', '2019-11-18 16:01:04'),
(388, 2484, '19011010', 7, 'Bautista', 'Debbie Ruth', 'Buton', '2003-06-17', '2019-11-18 16:01:04'),
(389, 2509, '19011011', 7, 'Bautista Jr.', 'Sonny', 'Macadenden', '2002-10-15', '2019-11-18 16:01:04'),
(390, 2545, '19011012', 7, 'Bayan', 'Andrhey', 'Ocning', '2003-09-19', '2019-11-18 16:01:04'),
(391, 2957, '19011013', 7, 'Bonete', 'Joron', 'Ballasiw', '2003-02-18', '2019-11-18 16:01:04'),
(392, 2938, '19011014', 7, 'Briones', 'Jan Dexer', 'Velasco', '2003-03-24', '2019-11-18 16:01:04'),
(393, 2588, '19011015', 7, 'Buen', 'Jimuel Ismael', 'Valenzuela', '2001-02-07', '2019-11-18 16:01:05'),
(394, 2570, '19011016', 7, 'Cabidog', 'Mcxandar', 'Sibayan', '2003-05-05', '2019-11-18 16:01:05'),
(395, 2871, '19011017', 7, 'Cajes', 'Samuel Rey', 'Apostol', '2002-12-28', '2019-11-18 16:01:05'),
(396, 2610, '19011018', 7, 'Coloma', 'Anthony', 'Dagang', '2001-03-03', '2019-11-18 16:01:05'),
(397, 2863, '19011019', 7, 'De Leon', 'Joshua', 'Urpiano', '2003-07-14', '2019-11-18 16:01:05'),
(398, 2478, '19011020', 7, 'Domondon', 'Reign Althea', '-', '2003-05-21', '2019-11-18 16:01:05'),
(399, 2530, '19011021', 7, 'Espada', 'Rodah', 'Balloging', '2002-11-13', '2019-11-18 16:01:05'),
(400, 2744, '19011022', 7, 'Espejo', 'Shakiro', 'Patacsil', '2002-10-19', '2019-11-18 16:01:06'),
(401, 2505, '19011023', 7, 'Farro', 'Maria Helena', '-', '2002-12-26', '2019-11-18 16:01:06'),
(402, 2512, '19011024', 7, 'Fontanilla', 'Gelyn', 'Malano', '2003-05-15', '2019-11-18 16:01:06'),
(403, 2500, '19011025', 7, 'Gumanid', 'Princess Nicole', 'Colico', '2003-02-09', '2019-11-18 16:01:06'),
(404, 2940, '19011026', 7, 'Javier', 'Jann Khen', 'Muyna', '2002-11-30', '2019-11-18 16:01:06'),
(405, 2543, '19011027', 7, 'Lacsamana', 'Jordan Kyle', 'Montemayor', '2003-11-16', '2019-11-18 16:01:06'),
(406, 2507, '19011028', 7, 'Magsino', 'KM Ullysses', 'Perez', '2003-05-01', '2019-11-18 16:01:06'),
(407, 2825, '19011029', 7, 'Manangan', 'Mark Jeffrey', 'Delmendo', '2002-10-22', '2019-11-18 16:01:07'),
(408, 2498, '19011030', 7, 'Manglicmot', 'Jessica', 'Asuncion', '2001-02-18', '2019-11-18 16:01:07'),
(409, 2678, '19011031', 7, 'Marquez', 'Chris Allen', 'Liwanag', '2003-08-17', '2019-11-18 16:01:07'),
(410, 2572, '19011032', 7, 'Murao', 'Jhan Kendrick', 'Galanto', '2003-07-27', '2019-11-18 16:01:07'),
(411, 2480, '19011033', 7, 'Navalta', 'John Raphael', 'San Miguel', '2001-12-28', '2019-11-18 16:01:07'),
(412, 2479, '19011034', 7, 'Nebres', 'Axl Rose Michael', 'Calusa', '2002-09-08', '2019-11-18 16:01:07'),
(413, 2882, '19011035', 7, 'Nebres', 'Kristopher Ray', 'Valmores', '2002-09-26', '2019-11-18 16:01:07'),
(414, 2667, '19011036', 7, 'Nebres', 'Rovic Xarex', 'Pineda', '2002-10-28', '2019-11-18 16:01:07'),
(415, 2910, '19011037', 7, 'Nebrida', 'James Rinedict', 'Bisco', '2002-10-13', '2019-11-18 16:01:08'),
(416, 2833, '19011038', 7, 'Negrillo', 'Lyka Mae', 'Jimenez', '2002-11-06', '2019-11-18 16:01:08'),
(417, 2575, '19011039', 7, 'Ogana', 'Samuel', 'Gabriel', '2002-12-04', '2019-11-18 16:01:08'),
(418, 2531, '19011040', 7, 'Opeña', 'Rose Evette', 'Ordinario', '2003-03-28', '2019-11-18 16:01:08'),
(419, 2483, '19011041', 7, 'Orpiano', 'Ren Francis', 'Avecilla', '2002-10-09', '2019-11-18 16:01:08'),
(420, 2895, '19011042', 7, 'Orteza', 'Niña Angela', 'Dela Cruz', '2002-12-28', '2019-11-18 16:01:08'),
(421, 2503, '19011043', 7, 'Pacleb', 'Julius', '-', '1999-11-25', '2019-11-18 16:01:08'),
(422, 2502, '19011044', 7, 'Partible', 'Rouel', 'Tabucol', '2002-07-23', '2019-11-18 16:01:09'),
(423, 2475, '19011045', 7, 'Pudiquet', 'Renalyn', 'Villar', '2003-08-14', '2019-11-18 16:01:09'),
(424, 2485, '19011046', 7, 'Ramos', 'Fleur Chirsten', 'Morales', '2003-04-19', '2019-11-18 16:01:09'),
(425, 2477, '19011047', 7, 'Ramos', 'Lhord Darren', '-', '2002-07-03', '2019-11-18 16:01:09'),
(426, 2476, '19011048', 7, 'Reyes', 'John Mark April', 'Almirol', '2003-04-12', '2019-11-18 16:01:09'),
(427, 2499, '19011049', 7, 'Sibayan', 'Angelica', 'Natividad', '2002-10-04', '2019-11-18 16:01:09'),
(428, 2573, '19011050', 7, 'Sibayan', 'Mickel', '-', '2003-04-02', '2019-11-18 16:01:09'),
(429, 2947, '19011051', 7, 'Soliman', 'Aira janel', 'Retuya', '2002-10-09', '2019-11-18 16:01:10'),
(430, 2553, '19011052', 7, 'Tesoro', 'Ma. Chrisanta Faith', 'Tactaquin', '2003-08-25', '2019-11-18 16:01:10'),
(431, 2482, '19011053', 7, 'Tria', 'Jonn Erik Von', 'Aguilar', '2002-07-29', '2019-11-18 16:01:10'),
(432, 2866, '19011054', 7, 'Valmores', 'Raynard Lance', 'Cachero', '2003-05-22', '2019-11-18 16:01:10'),
(433, 2542, '19011055', 7, 'Vendillo', 'Aubrey', 'Orejudos', '2002-12-17', '2019-11-18 16:01:10'),
(434, 2770, '19011056', 7, 'Vengazo', 'Jann Marc', 'Ordoño', '2003-07-25', '2019-11-18 16:01:10'),
(435, 2603, '19012001', 7, 'Badua', 'Riza', 'Ojano', '2001-12-31', '2019-11-18 16:01:10'),
(436, 2823, '19012002', 7, 'Bambico', 'Rojan Kentrick', 'Ducusin', '2002-04-20', '2019-11-18 16:01:11'),
(437, 2850, '19012003', 7, 'Barrameda', 'Jairus Yvan', 'Menguita', '2001-12-19', '2019-11-18 16:01:11'),
(438, 2712, '19012004', 7, 'Bautista', 'Cheska Mae', 'Abenoja', '2002-05-19', '2019-11-18 16:01:11'),
(439, 2851, '19012005', 7, 'Bautista', 'Jonas', 'Jolipas', '2002-07-21', '2019-11-18 16:01:11'),
(440, 2845, '19012006', 7, 'Bucsit', 'Kristine Mae', '-', '2002-10-15', '2019-11-18 16:01:11'),
(441, 2791, '19012007', 7, 'Cabidog', 'Darreilyn', 'Sibayan', '2001-07-26', '2019-11-18 16:01:11'),
(442, 2842, '19012008', 7, 'Cajayon', 'Shawie Ann', 'Nacis', '2001-11-01', '2019-11-18 16:01:11'),
(443, 2844, '19012009', 7, 'Castro', 'Angelika', 'Ancheta', '2002-07-17', '2019-11-18 16:01:11'),
(444, 2522, '19012010', 7, 'Centeno', 'Krychelle Ann', 'Maganis', '2002-02-02', '2019-11-18 16:01:12'),
(445, 2524, '19012011', 7, 'De Guzman', 'Jhon', 'Juan', '2002-06-21', '2019-11-18 16:01:12'),
(446, 2903, '19012012', 7, 'Del Rosario', 'Francis', '-', '2000-07-09', '2019-11-18 16:01:12'),
(447, 2900, '19012013', 7, 'Espero', 'Florence', 'Lubian', '2001-08-28', '2019-11-18 16:01:12'),
(448, 2797, '19012014', 7, 'Fontanilla', 'Kyrie Elleison', 'Morales', '2002-01-31', '2019-11-18 16:01:12'),
(449, 2951, '19012015', 7, 'Gañola', 'John Karl', 'Abellera', '2002-06-21', '2019-11-18 16:01:12'),
(450, 2521, '19012016', 7, 'Ibañez', 'Dave', 'Malano', '2001-09-28', '2019-11-18 16:01:12'),
(451, 2552, '19012017', 7, 'Japson', 'Kevin Yves', 'Nicol', '2001-09-02', '2019-11-18 16:01:13'),
(452, 2710, '19012018', 7, 'Licudan', 'Lovely Shane', 'Magno', '2002-08-10', '2019-11-18 16:01:13'),
(453, 2532, '19012019', 7, 'Manglicmot', 'Abegail', 'Espiritu', '2001-09-07', '2019-11-18 16:01:13'),
(454, 2905, '19012020', 7, 'Marticio', 'Julie Ness', 'Galima', '2001-10-24', '2019-11-18 16:01:13'),
(455, 2738, '19012021', 7, 'Murao', 'Marcnell', 'Faniega', '2001-10-03', '2019-11-18 16:01:13'),
(456, 2520, '19012022', 7, 'Nares', 'Mike Angelo', 'Casuga', '2002-09-05', '2019-11-18 16:01:13'),
(457, 2853, '19012023', 7, 'Negrillo', 'Ray Charles', 'Agujetas', '2002-09-23', '2019-11-18 16:01:13'),
(458, 2876, '19012024', 7, 'Neola', 'Rachelle Anne', 'Nebrida', '2002-06-06', '2019-11-18 16:01:14'),
(459, 2767, '19012025', 7, 'Nuncio', 'Nicole Ashley', 'Borja', '2002-05-22', '2019-11-18 16:01:14'),
(460, 2840, '19012026', 7, 'Oreiro', 'Inicris', 'Licudan', '2001-10-02', '2019-11-18 16:01:14'),
(461, 2837, '19012027', 7, 'Oreiro', 'Patrisha Ann', 'Karganilla', '2001-10-02', '2019-11-18 16:01:14'),
(462, 2899, '19012028', 7, 'Orejudos', 'Judy-Ann', 'Lopez', '2001-07-18', '2019-11-18 16:01:14'),
(463, 2852, '19012029', 7, 'Pacleb', 'Ezekiel', 'Suing', '2002-04-12', '2019-11-18 16:01:14'),
(464, 2872, '19012030', 7, 'Paulo', 'Ericson', 'Villano', '2002-09-08', '2019-11-18 16:01:14'),
(465, 2634, '19012031', 7, 'Peria', 'Mark Gabriell', 'Cabie', '2002-02-08', '2019-11-18 16:01:15'),
(466, 2635, '19012032', 7, 'Peria', 'Mark Lemuel', 'Cabie', '2002-02-08', '2019-11-18 16:01:15'),
(467, 2941, '19012034', 7, 'Reyes', 'Haruto', 'Andrade', '2001-06-28', '2019-11-18 16:01:15'),
(468, 2854, '19012035', 7, 'Riña', 'Carlrene Graobele', 'Obillo', '2002-11-15', '2019-11-18 16:01:15'),
(469, 2533, '19012036', 7, 'Sales', 'Mildred', 'Gaetos', '2002-07-19', '2019-11-18 16:01:15'),
(470, 2795, '19012037', 7, 'Santos', 'Dustin Ivan', 'Cabigao', '2001-06-10', '2019-11-18 16:01:15'),
(471, 2614, '19012038', 7, 'Sibayan', 'Chanda Mae', 'Macadenden', '2000-11-28', '2019-11-18 16:01:15'),
(472, 2768, '19012039', 7, 'Silva', 'Nicole Cate', '-', '2002-03-21', '2019-11-18 16:01:16'),
(473, 2838, '19012040', 7, 'Tabor', 'Joy', 'Obaña', '2002-07-12', '2019-11-18 16:01:16'),
(474, 2760, '19012041', 7, 'Urpiano', 'Marvin Yanni', 'Cariaso', '2001-09-12', '2019-11-18 16:01:16'),
(475, 2758, '19012042', 7, 'Vega', 'Ferie', 'Nebrida', '2002-06-02', '2019-11-18 16:01:16'),
(476, 2721, '19012043', 7, 'Ventura', 'Blaire Ashley', 'Esperon', '2001-12-08', '2019-11-18 16:01:16'),
(477, 2961, '19012044', 7, 'Galvez', 'Kay-C', 'Lontok', '2002-03-25', '2019-11-18 16:01:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `school_years`
--
ALTER TABLE `school_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=478;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
