-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-12-2023 a las 03:42:07
-- Versión del servidor: 8.0.31
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `citamedica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `scheduled_date` date NOT NULL,
  `scheduled_time` time NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint UNSIGNED NOT NULL,
  `patient_id` bigint UNSIGNED NOT NULL,
  `specialty_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Reservada',
  PRIMARY KEY (`id`),
  KEY `appointments_doctor_id_foreign` (`doctor_id`),
  KEY `appointments_patient_id_foreign` (`patient_id`),
  KEY `appointments_specialty_id_foreign` (`specialty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `appointments`
--

INSERT INTO `appointments` (`id`, `scheduled_date`, `scheduled_time`, `type`, `description`, `doctor_id`, `patient_id`, `specialty_id`, `created_at`, `updated_at`, `status`) VALUES
(1, '2023-10-24', '13:28:37', 'Operacion', 'Occaecati velit rerum labore et.', 43, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(2, '2023-07-28', '05:28:05', 'Operacion', 'Doloribus dicta ullam autem amet ex commodi.', 49, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(3, '2023-06-22', '23:57:17', 'Consulta', 'Minus est odit earum vitae.', 42, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(4, '2023-09-19', '15:32:59', 'Operacion', 'Nam quos reiciendis beatae.', 18, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(5, '2023-01-20', '18:12:29', 'Operacion', 'Quas dicta rem est.', 45, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(6, '2023-09-01', '15:18:55', 'Operacion', 'Libero maiores dolore delectus cumque doloremque ea.', 10, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(7, '2023-09-02', '18:14:49', 'Consulta', 'Consectetur enim voluptatibus maxime.', 13, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(8, '2023-11-14', '15:53:54', 'Examen', 'Autem facilis iure vero consequatur esse cupiditate.', 47, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(9, '2023-04-13', '09:21:07', 'Examen', 'Qui adipisci fuga accusantium incidunt qui.', 26, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(10, '2023-05-01', '21:09:01', 'Examen', 'Quia eos laudantium maiores quas voluptates.', 14, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(11, '2023-05-22', '04:51:57', 'Examen', 'In eos accusantium ea dolorum est est.', 26, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(12, '2023-03-01', '17:56:17', 'Operacion', 'Voluptatem sequi voluptatum est similique et quasi.', 19, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(13, '2023-06-24', '17:09:51', 'Consulta', 'Modi cupiditate ab alias est esse soluta.', 7, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(14, '2022-12-07', '12:49:00', 'Examen', 'Quae esse iusto ad deleniti iusto.', 8, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(15, '2023-07-13', '16:00:18', 'Operacion', 'Quia debitis est rem sunt animi enim.', 17, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(16, '2023-09-21', '07:07:22', 'Operacion', 'Nesciunt non dolorem qui quia voluptas.', 24, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(17, '2023-08-29', '20:35:53', 'Consulta', 'Animi minima quia inventore sit rerum veniam.', 22, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(18, '2023-10-26', '02:44:13', 'Consulta', 'Molestias cupiditate molestiae reiciendis aut consequatur.', 6, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(19, '2023-08-29', '02:30:25', 'Examen', 'Voluptas natus unde sed soluta alias.', 9, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(20, '2022-11-28', '13:57:22', 'Operacion', 'Est est ratione molestiae ea veniam.', 17, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(21, '2023-09-19', '11:57:42', 'Consulta', 'Nam nam rerum amet quibusdam accusantium dicta.', 29, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(22, '2023-05-27', '21:12:57', 'Examen', 'Rerum nemo labore autem dolores.', 50, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(23, '2023-02-08', '20:27:04', 'Operacion', 'Aut voluptatem quam laudantium eveniet tenetur.', 32, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(24, '2023-04-14', '14:34:35', 'Examen', 'Doloremque necessitatibus minus dolor quia voluptas.', 51, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(25, '2023-07-09', '06:26:26', 'Operacion', 'Porro occaecati necessitatibus minima soluta.', 39, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(26, '2023-05-26', '02:48:53', 'Operacion', 'Non suscipit ratione dolores voluptate sit.', 16, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(27, '2023-03-16', '08:20:30', 'Consulta', 'Corrupti iste autem quam est voluptatem qui.', 16, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(28, '2023-08-01', '00:39:01', 'Operacion', 'Officiis libero ipsam voluptatum autem numquam.', 27, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(29, '2023-05-26', '16:28:44', 'Examen', 'Id a facere quasi odio assumenda quia.', 8, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(30, '2023-01-10', '23:23:35', 'Consulta', 'Sed labore ad a.', 40, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(31, '2023-03-09', '06:25:38', 'Operacion', 'Quis explicabo et consequatur.', 23, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(32, '2023-02-19', '09:42:40', 'Examen', 'Magnam quia earum quidem.', 45, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(33, '2022-12-08', '03:22:15', 'Consulta', 'Aut veritatis quaerat nihil non.', 27, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(34, '2023-05-19', '12:51:44', 'Consulta', 'Quod rerum omnis facere laborum facilis.', 14, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(35, '2023-01-30', '18:15:40', 'Examen', 'Qui eos aut eveniet esse ratione nam.', 7, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(36, '2023-06-28', '23:59:32', 'Examen', 'Eos et vero quis deleniti et.', 45, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(37, '2023-05-27', '13:58:57', 'Operacion', 'Praesentium aut voluptas non aspernatur sint.', 21, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(38, '2022-12-04', '16:44:41', 'Operacion', 'Repellat aut voluptates culpa eveniet.', 51, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(39, '2023-09-27', '23:34:54', 'Consulta', 'Architecto et porro et.', 22, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(40, '2022-11-18', '16:58:08', 'Consulta', 'Aut quasi quisquam consequatur excepturi qui eos.', 4, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(41, '2022-12-24', '16:44:29', 'Consulta', 'Eos ut non quod est ut.', 9, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(42, '2022-12-21', '10:59:42', 'Operacion', 'Alias praesentium illum eveniet.', 39, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(43, '2023-05-20', '21:29:28', 'Examen', 'Alias consectetur esse aut minus culpa.', 27, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(44, '2023-10-23', '21:00:20', 'Examen', 'Repudiandae quia tenetur sed.', 31, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(45, '2023-01-08', '01:36:51', 'Examen', 'Velit voluptatem autem rem vel et.', 19, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(46, '2023-07-26', '22:27:06', 'Examen', 'Ut et aliquam optio qui dolorem reprehenderit.', 49, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(47, '2023-03-05', '04:02:08', 'Consulta', 'Alias deleniti praesentium veniam molestiae cupiditate laboriosam.', 8, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(48, '2023-10-09', '06:02:15', 'Operacion', 'Voluptas officia praesentium enim.', 3, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(49, '2023-01-02', '07:22:13', 'Examen', 'Quis natus beatae error rem ipsa.', 24, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(50, '2023-09-09', '16:58:51', 'Examen', 'Est hic eum voluptates ducimus voluptate vitae.', 29, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(51, '2023-03-04', '15:11:01', 'Examen', 'Est recusandae libero ab eum.', 46, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(52, '2023-01-01', '01:16:03', 'Consulta', 'Eos ex voluptas placeat repudiandae provident.', 40, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(53, '2023-11-08', '05:55:15', 'Consulta', 'Suscipit et nihil amet.', 44, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(54, '2023-05-04', '19:39:01', 'Consulta', 'Nihil atque nihil dolores mollitia repudiandae assumenda.', 7, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(55, '2022-12-11', '12:04:07', 'Examen', 'Voluptatem libero mollitia sapiente.', 15, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(56, '2023-04-16', '09:36:10', 'Examen', 'Magnam nobis et non et beatae.', 18, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(57, '2023-03-01', '02:29:43', 'Operacion', 'Sint amet ut sit.', 42, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(58, '2023-01-22', '14:02:08', 'Operacion', 'Tenetur perferendis voluptas ut repellendus.', 3, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(59, '2023-02-10', '02:29:40', 'Operacion', 'Voluptatem aliquam reprehenderit cumque quisquam.', 4, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(60, '2023-05-10', '02:46:49', 'Consulta', 'Minima ea nemo rerum.', 7, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(61, '2022-11-27', '10:16:08', 'Consulta', 'Eos rerum perspiciatis vitae.', 3, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(62, '2022-11-21', '11:38:58', 'Examen', 'Provident ipsam qui natus aliquid.', 36, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(63, '2023-11-11', '03:30:03', 'Examen', 'Laborum a eligendi non.', 29, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(64, '2023-04-03', '05:52:11', 'Examen', 'Aut aliquid harum aut voluptas quae.', 15, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(65, '2023-05-17', '03:45:20', 'Consulta', 'Soluta sunt tempore in suscipit.', 26, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(66, '2023-08-08', '23:51:32', 'Examen', 'Suscipit eligendi quod eum nisi voluptas.', 9, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(67, '2023-07-03', '08:29:48', 'Examen', 'Commodi vel et illum pariatur sit omnis.', 34, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(68, '2022-12-17', '19:17:34', 'Operacion', 'Autem earum ea quia dolorem.', 24, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(69, '2023-03-30', '00:41:57', 'Examen', 'In molestias qui eum cupiditate.', 9, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(70, '2023-09-10', '17:28:24', 'Operacion', 'Tenetur est temporibus minima in accusantium.', 43, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(71, '2023-02-07', '22:13:15', 'Examen', 'Enim rerum fugit minus vel.', 27, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(72, '2022-12-28', '23:17:25', 'Examen', 'Iste ipsa modi recusandae quia.', 22, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(73, '2023-01-02', '02:02:44', 'Examen', 'Eum officia qui tempora rerum voluptatem numquam.', 11, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(74, '2023-02-22', '00:29:46', 'Examen', 'Aliquid sapiente commodi dolores reprehenderit quia sit.', 19, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(75, '2023-02-16', '09:49:24', 'Operacion', 'Et natus molestiae earum.', 23, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(76, '2023-08-29', '00:08:01', 'Examen', 'Et doloremque harum magni.', 16, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(77, '2023-10-03', '22:22:53', 'Examen', 'Perferendis optio molestias inventore et.', 44, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(78, '2023-08-27', '19:17:59', 'Operacion', 'Aut veniam quasi nesciunt pariatur necessitatibus ducimus.', 44, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(79, '2023-07-11', '00:04:26', 'Consulta', 'Voluptas non modi quis mollitia quia.', 27, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(80, '2023-03-04', '19:18:49', 'Operacion', 'Minus et quia debitis consequatur qui.', 16, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(81, '2023-10-09', '06:00:04', 'Examen', 'Aut ab ut molestiae.', 49, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(82, '2023-08-22', '07:19:41', 'Examen', 'Qui culpa vero quasi non laboriosam quia quo.', 20, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(83, '2023-01-24', '02:48:22', 'Examen', 'Nulla tempore dolores deleniti.', 32, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(84, '2023-08-17', '17:58:55', 'Examen', 'Unde ipsum beatae necessitatibus sint.', 32, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(85, '2023-08-22', '08:52:07', 'Consulta', 'Porro quia non sunt.', 8, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(86, '2023-08-25', '11:22:48', 'Consulta', 'Maiores consequuntur odio tempora.', 12, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(87, '2023-10-08', '11:01:22', 'Consulta', 'Quia porro temporibus eum totam.', 34, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(88, '2023-09-18', '08:41:19', 'Operacion', 'Consectetur repellendus expedita nesciunt enim.', 50, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(89, '2023-06-19', '11:27:03', 'Operacion', 'Quo rerum fuga voluptatem cupiditate.', 13, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(90, '2023-11-10', '12:48:41', 'Examen', 'Illo quasi voluptatibus et vel magnam qui.', 33, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(91, '2023-04-10', '20:36:05', 'Consulta', 'Suscipit libero sit laborum unde consequatur ut.', 31, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(92, '2023-08-07', '20:34:20', 'Examen', 'Animi neque aperiam omnis voluptates.', 43, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(93, '2023-04-16', '21:23:30', 'Examen', 'Quos at placeat vel.', 5, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(94, '2023-01-16', '04:46:02', 'Operacion', 'Iure id consectetur mollitia autem.', 10, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(95, '2023-10-15', '18:04:16', 'Consulta', 'Perferendis quod quae nihil.', 15, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(96, '2023-01-23', '01:08:18', 'Operacion', 'Dolore maiores officia ut delectus sapiente.', 3, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(97, '2023-08-04', '00:30:36', 'Examen', 'Id quasi eius accusantium quas et dicta qui.', 4, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(98, '2023-08-27', '13:25:08', 'Examen', 'Magni praesentium vero nisi eveniet.', 31, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(99, '2023-10-08', '16:16:42', 'Examen', 'Aliquam praesentium ullam sequi id.', 29, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(100, '2023-03-19', '18:48:21', 'Examen', 'Natus sint voluptas voluptatem vel officia soluta.', 24, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(101, '2022-11-19', '18:06:33', 'Operacion', 'Quasi fuga exercitationem voluptas dolorem sunt.', 21, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(102, '2023-09-19', '04:49:00', 'Consulta', 'Dolores perferendis repellat libero eum minima ducimus.', 16, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(103, '2023-10-13', '17:12:15', 'Operacion', 'Quibusdam ea enim corporis id et omnis.', 16, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(104, '2022-12-10', '18:02:37', 'Examen', 'Rerum quas delectus doloribus soluta.', 35, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(105, '2023-06-12', '08:19:31', 'Operacion', 'Vitae quisquam accusantium natus voluptatum in cumque.', 35, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(106, '2023-02-11', '17:52:02', 'Consulta', 'Voluptatem qui et repellendus.', 13, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(107, '2023-10-22', '15:15:17', 'Operacion', 'Amet et aut sed enim.', 39, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(108, '2023-10-31', '09:35:05', 'Operacion', 'Quod itaque animi et vitae et.', 10, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(109, '2023-02-09', '00:22:07', 'Consulta', 'Tempora a sit amet.', 21, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(110, '2023-03-16', '04:43:00', 'Examen', 'Rem omnis perferendis laborum.', 4, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(111, '2023-06-23', '00:45:02', 'Operacion', 'Consequatur ut soluta laudantium.', 12, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(112, '2023-03-18', '02:59:06', 'Operacion', 'Facere perferendis numquam in.', 46, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(113, '2023-07-09', '02:19:04', 'Consulta', 'Ut sint aliquid et eligendi voluptas.', 29, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(114, '2023-01-28', '19:20:54', 'Examen', 'Dicta perspiciatis labore ad in eos.', 32, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(115, '2023-05-25', '04:34:50', 'Consulta', 'Cupiditate est corporis est doloremque dolor aut.', 48, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(116, '2023-03-08', '14:25:31', 'Consulta', 'Dicta ut aspernatur aut.', 33, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(117, '2023-07-18', '17:35:17', 'Consulta', 'Non deleniti sed esse.', 15, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(118, '2022-12-03', '09:53:46', 'Examen', 'Rem dolorum et enim cum repellat corporis.', 46, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(119, '2023-01-02', '17:18:19', 'Operacion', 'Commodi officiis fuga excepturi.', 41, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(120, '2022-12-14', '02:11:15', 'Consulta', 'Cum enim incidunt beatae vel.', 38, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(121, '2023-06-08', '19:32:05', 'Operacion', 'Quia quos est nihil iure.', 26, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(122, '2023-10-26', '15:27:02', 'Consulta', 'Doloremque sed ut maiores corporis ipsum.', 30, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(123, '2022-12-16', '03:40:44', 'Examen', 'Molestiae optio ea non vel ducimus harum.', 20, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(124, '2023-08-18', '02:45:07', 'Examen', 'Alias debitis repellendus minus possimus.', 42, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(125, '2023-10-04', '16:44:14', 'Examen', 'Optio quaerat quibusdam consectetur totam.', 32, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(126, '2022-12-24', '05:41:54', 'Operacion', 'Incidunt et ullam repudiandae dolorem.', 48, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(127, '2022-12-06', '04:53:00', 'Operacion', 'Voluptas reprehenderit vitae vel necessitatibus nihil.', 50, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(128, '2023-01-09', '06:12:47', 'Operacion', 'Accusantium explicabo aut perferendis est.', 24, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(129, '2023-10-19', '19:44:18', 'Consulta', 'Atque et dolores qui et alias.', 51, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(130, '2023-08-22', '10:33:01', 'Operacion', 'Aut ut expedita minima sapiente recusandae.', 5, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(131, '2023-06-05', '09:23:53', 'Operacion', 'Aut temporibus velit eos reiciendis.', 37, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(132, '2022-11-22', '14:10:05', 'Operacion', 'Et officia hic veritatis.', 36, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(133, '2023-06-24', '14:12:27', 'Examen', 'Error aliquam corporis sint quo.', 50, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(134, '2023-09-10', '23:37:31', 'Operacion', 'Sunt et a alias repudiandae pariatur.', 48, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(135, '2023-03-09', '19:04:33', 'Examen', 'Eum eum aut quo excepturi et.', 3, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(136, '2022-12-25', '18:40:04', 'Consulta', 'Fugit nam quia incidunt id.', 17, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(137, '2023-06-03', '07:05:06', 'Consulta', 'Vero iure amet recusandae animi nulla.', 29, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(138, '2023-02-03', '17:01:10', 'Consulta', 'Nihil beatae sed unde similique.', 14, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(139, '2023-10-21', '01:58:26', 'Consulta', 'Officia quo sint saepe et in itaque.', 30, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(140, '2023-07-24', '12:17:15', 'Consulta', 'Illum deleniti molestiae facilis id.', 3, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(141, '2023-05-28', '06:02:23', 'Operacion', 'Explicabo deserunt cupiditate dignissimos eum possimus.', 49, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(142, '2023-03-21', '17:38:40', 'Operacion', 'Eum omnis corporis sapiente.', 3, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(143, '2023-04-01', '14:21:17', 'Consulta', 'Dolor voluptatum hic voluptas atque totam.', 6, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(144, '2023-04-21', '15:16:33', 'Operacion', 'Rerum nesciunt rem itaque quam inventore.', 28, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(145, '2023-07-01', '21:55:30', 'Consulta', 'Aut quae temporibus dolorem placeat necessitatibus reprehenderit excepturi.', 28, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(146, '2023-02-20', '00:26:35', 'Operacion', 'Nesciunt repellat eius qui.', 24, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(147, '2023-03-23', '08:10:52', 'Consulta', 'Tempora quia maxime reiciendis dolore qui eum.', 19, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(148, '2023-03-08', '19:46:43', 'Examen', 'Placeat eaque eveniet fugit et aut voluptates.', 47, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(149, '2023-05-31', '14:05:10', 'Consulta', 'Dolores ex voluptas ad nemo.', 37, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(150, '2023-06-18', '14:55:17', 'Operacion', 'Voluptas minus ea illo veritatis tempora.', 19, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(151, '2022-12-19', '14:57:45', 'Operacion', 'Id rem tempore ut aut nihil ut.', 21, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(152, '2023-06-20', '18:04:32', 'Operacion', 'Nihil in voluptas corrupti.', 27, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(153, '2023-02-20', '20:48:16', 'Consulta', 'Vero et molestias nihil sequi suscipit.', 44, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(154, '2023-08-11', '12:17:33', 'Consulta', 'Nesciunt velit nesciunt labore reiciendis.', 23, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(155, '2023-07-16', '12:58:52', 'Operacion', 'Reprehenderit fugit doloremque facere deserunt hic.', 42, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(156, '2023-04-17', '02:13:33', 'Operacion', 'Voluptas magnam earum nulla.', 49, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(157, '2023-04-24', '07:04:42', 'Operacion', 'Quibusdam mollitia et numquam.', 14, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(158, '2023-06-05', '21:21:56', 'Operacion', 'Error et ipsum earum ea delectus odio enim.', 50, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(159, '2023-08-08', '09:45:25', 'Examen', 'Magnam est alias consequatur cumque.', 18, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(160, '2023-02-22', '12:20:37', 'Operacion', 'Est sunt aliquam provident.', 6, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(161, '2023-04-30', '17:30:35', 'Examen', 'Ab veniam eos facere est.', 8, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(162, '2023-08-18', '13:42:22', 'Consulta', 'Laboriosam voluptatibus temporibus qui modi.', 34, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(163, '2023-04-02', '09:08:58', 'Examen', 'Ut molestiae aut et nam quis.', 43, 2, 4, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(164, '2023-05-01', '03:56:09', 'Operacion', 'Expedita porro id voluptates.', 39, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(165, '2023-02-04', '17:44:50', 'Consulta', 'Vel consequatur vero rerum vitae qui quo.', 33, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(166, '2023-02-02', '23:04:19', 'Operacion', 'Repellat ut iste in dolorum.', 42, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(167, '2023-10-23', '18:43:05', 'Examen', 'Recusandae quam qui quam pariatur.', 16, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(168, '2022-12-09', '20:15:25', 'Operacion', 'Nisi aut dolore omnis soluta dolores.', 19, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(169, '2023-06-14', '05:07:51', 'Examen', 'Tempora voluptate molestiae earum dolorem.', 32, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(170, '2023-11-10', '01:10:23', 'Operacion', 'Nam consequatur velit libero quibusdam maxime.', 45, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(171, '2023-03-11', '18:45:18', 'Consulta', 'Amet at quod eos et magni animi.', 23, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(172, '2023-04-22', '18:20:58', 'Examen', 'Debitis voluptas consequuntur enim laboriosam tempora libero sed.', 36, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(173, '2023-01-10', '08:09:35', 'Examen', 'Sit velit eaque facere.', 21, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(174, '2023-11-01', '17:27:11', 'Consulta', 'Quo quia dolores rem et excepturi atque.', 20, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(175, '2022-12-04', '18:03:06', 'Examen', 'Voluptas eum placeat porro aliquam provident.', 3, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(176, '2023-04-26', '08:10:00', 'Operacion', 'Porro labore iste et dolor cum voluptatem.', 11, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(177, '2023-05-07', '16:32:06', 'Examen', 'Illo est ut consequatur harum.', 13, 2, 5, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(178, '2023-01-21', '12:34:30', 'Examen', 'Et et et impedit enim iure explicabo.', 27, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(179, '2023-11-12', '14:40:33', 'Operacion', 'Incidunt porro dolore dolorum quia.', 10, 2, 2, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(180, '2023-04-17', '17:50:53', 'Consulta', 'Est in dicta asperiores.', 31, 2, 1, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(181, '2023-03-28', '21:01:59', 'Examen', 'Ab quis voluptatem quae sunt et.', 28, 2, 6, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Atendida'),
(182, '2022-11-26', '18:43:05', 'Examen', 'Iste sit odit sit assumenda.', 22, 2, 7, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(183, '2023-07-29', '02:05:21', 'Operacion', 'Autem ab ea dignissimos.', 26, 2, 3, '2023-11-15 07:43:45', '2023-11-15 07:43:45', 'Cancelada'),
(184, '2022-12-30', '16:06:53', 'Examen', 'Dolores omnis est eius quia laborum et.', 10, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(185, '2023-07-08', '23:32:50', 'Operacion', 'Corporis atque praesentium autem exercitationem dicta.', 49, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(186, '2022-11-18', '05:42:59', 'Examen', 'Et omnis et molestias nam soluta mollitia.', 3, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(187, '2023-01-09', '01:06:47', 'Operacion', 'Perspiciatis molestias odit qui est ducimus perspiciatis.', 46, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(188, '2022-11-24', '20:50:08', 'Examen', 'Voluptatum voluptates rerum accusamus dolorem libero eveniet.', 13, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(189, '2023-05-10', '18:31:25', 'Operacion', 'Aliquid doloremque commodi et.', 33, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(190, '2023-04-23', '18:28:44', 'Consulta', 'Cumque earum sint dolore veniam aspernatur.', 14, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(191, '2023-04-14', '10:19:52', 'Operacion', 'Quasi fugiat sequi culpa ea.', 28, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(192, '2023-06-15', '06:30:07', 'Operacion', 'Provident sapiente et quos iure quia sed.', 29, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(193, '2023-05-17', '11:25:46', 'Operacion', 'Eligendi incidunt porro voluptatem non.', 14, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(194, '2023-09-20', '10:48:54', 'Consulta', 'Alias consequatur assumenda qui omnis incidunt quas.', 21, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(195, '2023-05-11', '04:44:37', 'Consulta', 'Aut delectus et voluptatum eum.', 26, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(196, '2023-05-08', '17:38:22', 'Operacion', 'Nobis voluptas ut autem in.', 41, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(197, '2023-11-09', '15:16:10', 'Operacion', 'Voluptatem aliquid odio nulla iste eveniet.', 14, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(198, '2023-08-15', '21:59:14', 'Consulta', 'Omnis voluptatem rerum quis omnis.', 36, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(199, '2023-11-14', '04:19:05', 'Examen', 'Repudiandae veritatis aut aperiam consequuntur non.', 8, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(200, '2022-12-22', '06:46:05', 'Operacion', 'Culpa et dolor et labore molestiae optio.', 23, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(201, '2023-08-24', '13:26:04', 'Operacion', 'Pariatur quia adipisci nobis ab nihil.', 4, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(202, '2022-12-24', '02:57:23', 'Examen', 'Rerum voluptatem ut illo dignissimos.', 18, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(203, '2023-07-14', '15:39:53', 'Operacion', 'Est at est et magnam debitis.', 14, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(204, '2022-12-12', '08:04:44', 'Consulta', 'Soluta laborum voluptate ipsa est dolorum ipsa.', 25, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(205, '2023-01-23', '21:38:49', 'Operacion', 'Nihil autem occaecati in vel nostrum.', 42, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(206, '2023-04-17', '13:42:39', 'Consulta', 'Voluptas ut sit voluptas quae ducimus et.', 47, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(207, '2023-08-26', '13:02:00', 'Operacion', 'Atque eum eos est est.', 50, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(208, '2023-04-08', '11:35:45', 'Operacion', 'Ipsam quis sunt atque totam.', 49, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(209, '2023-02-05', '16:55:12', 'Operacion', 'Laboriosam quam minima ipsa architecto.', 11, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(210, '2022-11-18', '08:58:09', 'Examen', 'Omnis voluptatem saepe est expedita iste.', 3, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(211, '2023-08-28', '00:27:28', 'Examen', 'Aliquid quis pariatur vel.', 16, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(212, '2023-10-01', '05:04:43', 'Consulta', 'Sit rem dolor vel et dolorem.', 29, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(213, '2023-08-13', '04:32:49', 'Examen', 'Consequatur nobis praesentium corporis non.', 46, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(214, '2023-01-31', '18:03:53', 'Operacion', 'Non rerum molestiae non.', 48, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(215, '2023-04-23', '10:02:24', 'Consulta', 'Sint dolorem a natus.', 30, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(216, '2023-08-21', '07:58:46', 'Examen', 'Ut voluptatem corrupti tenetur.', 29, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(217, '2023-06-20', '17:23:19', 'Examen', 'Doloribus magni rem eligendi.', 19, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(218, '2023-10-15', '04:29:05', 'Examen', 'Nam quia quia voluptas.', 37, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(219, '2023-10-15', '02:39:34', 'Examen', 'Quis accusamus vel ut qui et.', 4, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(220, '2023-09-27', '02:19:42', 'Examen', 'Culpa velit saepe consequatur corporis non.', 30, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(221, '2023-08-02', '12:59:14', 'Examen', 'Officiis doloremque aut et maiores earum iusto.', 40, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(222, '2023-02-03', '13:14:54', 'Consulta', 'Ab voluptatum sed qui asperiores.', 38, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(223, '2023-09-09', '23:52:28', 'Operacion', 'Doloribus itaque quis quibusdam possimus modi.', 49, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(224, '2023-11-12', '15:54:17', 'Consulta', 'Voluptas consequatur vero architecto.', 21, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(225, '2023-02-19', '14:42:51', 'Examen', 'Aut tempore animi fugit.', 27, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(226, '2022-12-09', '10:43:15', 'Examen', 'Recusandae dolore est molestias consequuntur debitis.', 14, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(227, '2023-05-27', '21:42:50', 'Operacion', 'Impedit dolorem consequatur et consequatur fuga incidunt.', 33, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(228, '2023-04-12', '11:30:34', 'Operacion', 'Nostrum omnis unde praesentium quia.', 22, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(229, '2023-10-26', '07:58:28', 'Consulta', 'Ut est et sint animi aut.', 22, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(230, '2023-07-31', '23:45:39', 'Operacion', 'Iusto distinctio vel dolor voluptatem.', 36, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(231, '2023-03-29', '02:22:57', 'Operacion', 'Molestias itaque non quis.', 33, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(232, '2023-01-29', '22:24:05', 'Examen', 'Voluptatem praesentium placeat et veritatis.', 45, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(233, '2023-11-13', '17:55:58', 'Consulta', 'Quisquam et nemo nemo voluptates numquam qui.', 31, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(234, '2023-03-06', '20:53:43', 'Operacion', 'Eveniet corporis et at odio.', 19, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(235, '2023-06-03', '02:17:40', 'Consulta', 'Rem sed id et pariatur aut.', 41, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(236, '2023-01-27', '13:29:16', 'Examen', 'Repellendus labore perferendis qui dignissimos porro cupiditate.', 12, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(237, '2022-12-21', '18:42:16', 'Consulta', 'Maiores atque qui iure voluptas officiis.', 15, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(238, '2023-02-19', '13:26:08', 'Consulta', 'Fugiat et maiores velit deserunt placeat.', 38, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(239, '2022-12-24', '16:27:13', 'Examen', 'Et occaecati aliquid in odio eaque est.', 22, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(240, '2023-06-26', '12:52:53', 'Operacion', 'Qui repudiandae voluptatem est.', 22, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(241, '2022-12-04', '00:00:34', 'Consulta', 'Numquam in nesciunt dolorem velit et itaque.', 27, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(242, '2023-08-22', '12:49:40', 'Examen', 'Dolorem sed voluptatem sit quasi.', 44, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(243, '2023-07-02', '09:28:38', 'Consulta', 'Est facilis aut veritatis et sed consectetur.', 10, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(244, '2023-10-16', '13:10:10', 'Operacion', 'In praesentium dignissimos labore.', 28, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(245, '2023-08-04', '13:28:31', 'Examen', 'Ratione totam accusantium et aperiam.', 44, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(246, '2023-05-17', '21:56:06', 'Consulta', 'Non repellendus sit ab.', 6, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(247, '2023-02-14', '21:42:29', 'Consulta', 'Qui dignissimos eveniet est.', 21, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(248, '2023-04-27', '14:49:55', 'Examen', 'Laudantium magni quae ut iure sapiente.', 17, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(249, '2022-12-13', '06:06:01', 'Consulta', 'Illo repellendus magnam pariatur temporibus occaecati hic.', 12, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(250, '2022-11-21', '05:35:10', 'Operacion', 'Suscipit rerum similique doloribus et quis corrupti.', 36, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(251, '2023-08-25', '17:42:37', 'Operacion', 'Maiores sit voluptas libero esse repellendus pariatur.', 35, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(252, '2023-05-17', '02:45:11', 'Consulta', 'Hic molestiae libero qui officia mollitia.', 22, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(253, '2023-02-05', '05:42:23', 'Operacion', 'Ex delectus est impedit harum.', 4, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(254, '2022-11-24', '06:57:43', 'Examen', 'Neque sit ut perferendis magnam.', 35, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(255, '2023-04-25', '10:04:15', 'Operacion', 'Accusantium veniam sed porro eaque repellendus.', 28, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(256, '2023-05-14', '21:19:40', 'Examen', 'Est labore ipsam quod.', 12, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(257, '2023-03-03', '03:17:24', 'Operacion', 'Magnam amet iste beatae est est.', 17, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(258, '2023-09-16', '14:44:21', 'Consulta', 'Quia nihil exercitationem voluptatibus.', 32, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(259, '2022-12-28', '05:31:29', 'Examen', 'Explicabo exercitationem et dignissimos id quae soluta.', 11, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(260, '2023-07-13', '17:36:58', 'Consulta', 'Quisquam ullam nostrum quaerat et.', 27, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(261, '2023-07-30', '08:16:07', 'Examen', 'Excepturi eius totam quidem in quia.', 20, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(262, '2023-09-11', '01:33:46', 'Operacion', 'Rerum omnis et et at in.', 28, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(263, '2023-02-27', '13:00:32', 'Operacion', 'Ut laboriosam amet consequuntur nemo.', 17, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(264, '2023-04-24', '19:07:42', 'Consulta', 'Excepturi provident nulla autem.', 33, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(265, '2023-07-06', '05:47:58', 'Consulta', 'Iure illum culpa nostrum culpa et.', 14, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(266, '2023-02-25', '06:21:44', 'Examen', 'Perferendis voluptates adipisci est ducimus cumque molestiae.', 14, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(267, '2023-07-27', '06:05:22', 'Consulta', 'Earum nesciunt quia et ut qui.', 47, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(268, '2023-05-31', '21:12:04', 'Operacion', 'Eligendi nemo magnam eos impedit eum corporis.', 39, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(269, '2023-06-05', '04:58:43', 'Operacion', 'Ut ipsa veritatis debitis dolor reprehenderit omnis.', 43, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(270, '2023-04-02', '17:35:11', 'Operacion', 'Rem suscipit labore eos eveniet quo.', 37, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(271, '2023-06-25', '01:56:41', 'Operacion', 'Accusantium quia rem ex sed.', 37, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(272, '2023-06-05', '21:11:37', 'Examen', 'Tempora placeat et quia quia rem.', 41, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(273, '2022-12-26', '01:30:13', 'Operacion', 'Enim impedit aut possimus vero quis.', 29, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(274, '2023-02-24', '19:13:00', 'Operacion', 'Eius id provident ut consequatur enim in.', 19, 2, 4, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(275, '2023-02-26', '16:31:35', 'Examen', 'Incidunt dolore ut voluptatem molestiae.', 8, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(276, '2023-02-06', '22:55:06', 'Examen', 'Laudantium voluptatem quia debitis.', 4, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(277, '2022-12-01', '20:15:18', 'Operacion', 'Adipisci ullam dolorum illum eum vitae.', 41, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(278, '2023-11-06', '11:18:18', 'Operacion', 'Sapiente doloremque asperiores voluptatem.', 45, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(279, '2023-07-12', '16:07:08', 'Consulta', 'Et est eum error blanditiis.', 6, 2, 5, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(280, '2023-07-28', '21:12:24', 'Operacion', 'Quae quas quam delectus occaecati.', 32, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(281, '2023-09-02', '08:23:50', 'Consulta', 'Necessitatibus similique sunt quo sit illo.', 45, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(282, '2023-04-05', '22:37:57', 'Consulta', 'Quasi ut officia autem.', 12, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(283, '2023-09-18', '00:50:25', 'Consulta', 'Eos ipsa consequatur doloremque consequatur et.', 34, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(284, '2023-03-07', '20:47:24', 'Examen', 'Quaerat sunt qui ullam illum harum.', 41, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(285, '2022-12-03', '11:39:19', 'Operacion', 'Tenetur at labore aut dolor aut.', 31, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(286, '2023-07-14', '00:06:35', 'Examen', 'Ad est et veniam hic.', 12, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(287, '2022-11-29', '06:01:31', 'Examen', 'Aut nesciunt atque rerum voluptatem.', 32, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(288, '2023-10-27', '15:39:48', 'Operacion', 'Dolor recusandae qui aut.', 45, 2, 2, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(289, '2023-03-29', '14:34:09', 'Examen', 'Facere rerum id et doloribus earum.', 42, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(290, '2023-02-19', '05:26:31', 'Consulta', 'Molestiae magnam corrupti rerum sed.', 3, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(291, '2023-10-05', '16:35:13', 'Examen', 'Recusandae asperiores aut suscipit quidem omnis rem.', 27, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(292, '2023-04-16', '22:22:53', 'Examen', 'Voluptatum possimus qui accusantium magni.', 48, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(293, '2022-12-16', '08:25:27', 'Operacion', 'Blanditiis quo repudiandae ducimus asperiores.', 41, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(294, '2023-09-17', '04:52:52', 'Examen', 'Accusamus ex eligendi est et rem.', 7, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(295, '2023-01-15', '17:28:25', 'Consulta', 'Culpa et nemo dolores sed ut quisquam.', 15, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(296, '2023-02-04', '02:59:43', 'Operacion', 'Similique voluptate ipsam voluptates ipsum est.', 15, 2, 7, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(297, '2023-04-10', '12:34:55', 'Operacion', 'Voluptates et nobis eum.', 45, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada'),
(298, '2023-05-19', '07:29:50', 'Consulta', 'Nisi dolor eius asperiores labore.', 10, 2, 1, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(299, '2023-02-07', '22:25:49', 'Operacion', 'Quidem facere eos eos nihil.', 33, 2, 3, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Atendida'),
(300, '2022-12-30', '22:41:43', 'Consulta', 'Non totam officiis aut.', 5, 2, 6, '2023-11-15 07:43:46', '2023-11-15 07:43:46', 'Cancelada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancelled_appointments`
--

DROP TABLE IF EXISTS `cancelled_appointments`;
CREATE TABLE IF NOT EXISTS `cancelled_appointments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `justification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_by_id` bigint UNSIGNED NOT NULL,
  `appointment_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cancelled_appointments_cancelled_by_foreign` (`cancelled_by_id`),
  KEY `cancelled_appointments_appointment_id_foreign` (`appointment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeos`
--

DROP TABLE IF EXISTS `chequeos`;
CREATE TABLE IF NOT EXISTS `chequeos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_id` bigint UNSIGNED NOT NULL,
  `tooth_number` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `doctor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chequeos_patient_id_foreign` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `chequeos`
--

INSERT INTO `chequeos` (`id`, `patient_id`, `tooth_number`, `date`, `time`, `doctor`, `observaciones`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2023-11-15', '01:11:01', '5', 'tamos bien', '2023-11-15 07:45:01', '2023-11-15 07:45:01'),
(2, 2, 1, '2023-11-15', '02:11:33', '10', 'porque si', '2023-11-15 08:24:33', '2023-11-15 08:24:33'),
(3, 2, 1, '2023-11-15', '03:11:55', '14', NULL, '2023-11-15 09:23:55', '2023-11-15 09:23:55'),
(4, 2, 1, '2023-11-15', '03:11:33', '6', 'gola mundo', '2023-11-15 09:38:33', '2023-11-15 09:38:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiales`
--

DROP TABLE IF EXISTS `historiales`;
CREATE TABLE IF NOT EXISTS `historiales` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo_expediente` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `nombre_paciente` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

DROP TABLE IF EXISTS `horarios`;
CREATE TABLE IF NOT EXISTS `horarios` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `day` smallint UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `morning_start` time NOT NULL,
  `morning_end` time NOT NULL,
  `afternoon_start` time NOT NULL,
  `afternoon_end` time NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `horarios_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `day`, `active`, `morning_start`, `morning_end`, `afternoon_start`, `afternoon_end`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 0, 1, '08:00:00', '10:00:00', '15:00:00', '17:00:00', 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(2, 1, 0, '07:00:00', '07:00:00', '14:00:00', '14:00:00', 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(3, 2, 0, '07:00:00', '07:00:00', '14:00:00', '14:00:00', 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(4, 3, 0, '07:00:00', '07:00:00', '14:00:00', '14:00:00', 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(5, 4, 0, '07:00:00', '07:00:00', '14:00:00', '14:00:00', 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(6, 5, 0, '07:00:00', '07:00:00', '14:00:00', '14:00:00', 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(7, 6, 0, '07:00:00', '07:00:00', '14:00:00', '14:00:00', 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(18, '2014_10_12_000000_create_users_table', 1),
(19, '2014_10_12_100000_create_password_resets_table', 1),
(20, '2019_08_19_000000_create_failed_jobs_table', 1),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(22, '2022_03_05_232951_create_specialties_table', 1),
(23, '2022_05_18_041836_create_horarios_table', 1),
(24, '2022_06_13_023339_create_specialty_user_table', 1),
(25, '2022_07_19_180807_create_appointments_table', 1),
(26, '2022_08_13_000357_add_status_to_appointments', 1),
(27, '2022_08_28_201142_create_cancelled_appointments_table', 1),
(28, '2022_08_28_212415_rename_cancelled_by_in_cancelled_appointments_table', 1),
(29, '2023_10_11_014727_create_teeth_table', 1),
(30, '2023_10_12_030958_create_patients_table', 1),
(31, '2023_10_15_033426_create_chequeos_table', 1),
(32, '2023_10_25_014459_add_status_to_users_table', 1),
(33, '2023_10_27_040047_create_notifications_table', 1),
(34, '2023_11_10_033045_create_historiales_table', 1),
(35, '2023_11_15_014145_radiografias', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `radiografias`
--

DROP TABLE IF EXISTS `radiografias`;
CREATE TABLE IF NOT EXISTS `radiografias` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `chequeo_id` int NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `radiografias`
--

INSERT INTO `radiografias` (`id`, `chequeo_id`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 1, '1700014663.png', '2023-11-15 08:17:43', '2023-11-15 08:17:43'),
(3, 1, '1700014821.jpg', '2023-11-15 08:20:21', '2023-11-15 08:20:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialties`
--

DROP TABLE IF EXISTS `specialties`;
CREATE TABLE IF NOT EXISTS `specialties` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `specialties`
--

INSERT INTO `specialties` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, '', 'Anestesiología dental', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(2, '', 'Odontología de salud pública', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(3, '', 'Endodoncia', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(4, '', 'Patología oral y maxilofacial', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(5, '', 'Radiología oral y maxilofacial', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(6, '', 'Cirugía oral y maxilofacial', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(7, '', 'Medicina oral', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(8, '', 'Ortodoncia y ortopedia dentofacial', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(9, '', 'Especialista en dolor orofacial', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(10, '', 'Odontología pediátrica', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(11, '', 'Periodoncia', '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(12, '', 'Prostodoncia', '2023-11-15 07:43:44', '2023-11-15 07:43:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `specialty_user`
--

DROP TABLE IF EXISTS `specialty_user`;
CREATE TABLE IF NOT EXISTS `specialty_user` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `specialty_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `specialty_user_user_id_foreign` (`user_id`),
  KEY `specialty_user_specialty_id_foreign` (`specialty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `specialty_user`
--

INSERT INTO `specialty_user` (`id`, `user_id`, `specialty_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(2, 5, 1, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(3, 6, 1, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(4, 7, 1, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(5, 8, 2, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(6, 9, 2, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(7, 10, 2, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(8, 11, 2, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(9, 12, 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(10, 13, 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(11, 14, 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(12, 15, 3, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(13, 16, 4, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(14, 17, 4, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(15, 18, 4, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(16, 19, 4, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(17, 20, 5, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(18, 21, 5, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(19, 22, 5, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(20, 23, 5, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(21, 24, 6, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(22, 25, 6, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(23, 26, 6, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(24, 27, 6, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(25, 28, 7, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(26, 29, 7, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(27, 30, 7, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(28, 31, 7, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(29, 32, 8, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(30, 33, 8, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(31, 34, 8, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(32, 35, 8, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(33, 36, 9, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(34, 37, 9, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(35, 38, 9, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(36, 39, 9, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(37, 40, 10, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(38, 41, 10, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(39, 42, 10, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(40, 43, 10, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(41, 44, 11, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(42, 45, 11, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(43, 46, 11, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(44, 47, 11, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(45, 48, 12, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(46, 49, 12, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(47, 50, 12, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(48, 51, 12, '2023-11-15 07:43:44', '2023-11-15 07:43:44'),
(49, 3, 12, '2023-11-15 07:43:44', '2023-11-15 07:43:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teeth`
--

DROP TABLE IF EXISTS `teeth`;
CREATE TABLE IF NOT EXISTS `teeth` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `chequeo_id` int NOT NULL,
  `tooth_number` int NOT NULL,
  `icono` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `teeth`
--

INSERT INTO `teeth` (`id`, `chequeo_id`, `tooth_number`, `icono`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, 34, 'X', 'blue', '2023-11-15 07:45:01', '2023-11-15 07:45:01'),
(2, 1, 38, 'X', 'blue', '2023-11-15 07:45:01', '2023-11-15 07:45:01'),
(3, 1, 42, 'X', 'blue', '2023-11-15 07:45:01', '2023-11-15 07:45:01'),
(4, 2, 48, 'circulo', 'red', '2023-11-15 08:24:33', '2023-11-15 08:24:33'),
(5, 2, 45, 'circulo', 'blue', '2023-11-15 08:24:33', '2023-11-15 08:24:33'),
(6, 3, 33, '↺', 'blue', '2023-11-15 09:23:55', '2023-11-15 09:23:55'),
(7, 3, 38, '○', 'blue', '2023-11-15 09:23:55', '2023-11-15 09:23:55'),
(8, 3, 41, 'X', 'blue', '2023-11-15 09:23:55', '2023-11-15 09:23:55'),
(9, 3, 42, '🡢', 'blue', '2023-11-15 09:23:55', '2023-11-15 09:23:55'),
(10, 3, 43, '🡡', 'blue', '2023-11-15 09:23:55', '2023-11-15 09:23:55'),
(11, 3, 48, '║', 'red', '2023-11-15 09:23:55', '2023-11-15 09:23:55'),
(12, 3, 21, '🡠', 'red', '2023-11-15 09:23:55', '2023-11-15 09:23:55'),
(13, 4, 18, 'X', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(14, 4, 17, '○', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(15, 4, 16, '🡢', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(16, 4, 15, '🡡', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(17, 4, 14, '↺', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(18, 4, 13, 'X', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(19, 4, 12, '○', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(20, 4, 11, '🡢', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(21, 4, 28, '🡡', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(22, 4, 27, '↺', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(23, 4, 26, 'circulo', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(24, 4, 25, '║', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(25, 4, 24, '🡠', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(26, 4, 23, '🡣', 'red', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(27, 4, 31, 'circulo', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(28, 4, 22, '║', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(29, 4, 32, '🡠', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33'),
(30, 4, 33, '🡣', 'blue', '2023-11-15 09:38:33', '2023-11-15 09:38:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dui` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edad` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licencia` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `red_social` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `musica` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profesion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alteraciones` text COLLATE utf8mb4_unicode_ci,
  `como_conocio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `historial` text COLLATE utf8mb4_unicode_ci,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `dui`, `edad`, `licencia`, `address`, `phone`, `imagen`, `whatsapp`, `red_social`, `musica`, `profesion`, `alteraciones`, `como_conocio`, `historial`, `role`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'nathaly', 'nathaly@gmail.com', '2023-11-15 07:43:43', '$2y$10$uLN4kOM32m.h7CkNwedPJuo4qhI7CaUo4C1bIsyHJptUP8CEBw/EO', '0400000712', '22', NULL, 'Av. Universitaria', '0968000009', '', '', '', '', '', '', '', '', 'admin', NULL, '2023-11-15 07:43:43', '2023-11-15 07:43:43', 'activo'),
(2, 'Paciente1', 'paciente1@gmail.com', '2023-11-15 07:43:43', '$2y$10$a.WYJyBRoywAKv03zWoP/OzBl6L/Zr0PYy.eElL8y3kypbzRR7oZ6', '23123123', '34', NULL, NULL, '7611868870', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'paciente', NULL, '2023-11-15 07:43:44', '2023-11-15 09:56:49', 'activo'),
(3, 'Medico 1', 'medico1@gmail.com', '2023-11-15 07:43:44', '$2y$10$hFsYoXptZUbBiTSZt7cNIO89VIYVLppNct/iWd6QTSjTeNmq7.ZuC', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', 'doctor', NULL, '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(4, 'Faye Williamson DDS', 'delaney92@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '41593289', '54481340', '1650', '594 Alexandrea Parks\nSouth Jodychester, MI 46615', '800-975-2836', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'CAlRU9UQZI', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(5, 'Dorothy Parisian Sr.', 'hamill.kristy@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '89136730', '31826825', '4932', '1321 Carroll Turnpike Apt. 623\nEast Kaylah, NM 55345', '877.347.1682', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'fiOpR0GzJC', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(6, 'Shannon Windler II', 'octavia33@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '95557012', '38980472', '9282', '24341 Dominique Loaf Apt. 992\nRomanfurt, RI 81109', '(888) 927-1512', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'cKehEHNBSr', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(7, 'Mr. Boyd Abbott MD', 'volkman.barton@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '39518667', '91399968', '2473', '53903 Mante Place\nTurcottefurt, MT 25135', '(877) 658-8614', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'uDBYz8UDtm', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(8, 'Lenna Feil', 'dena.marquardt@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '40860999', '16398716', '3592', '244 Hilario Branch\nSouth Haydentown, NM 45716', '1-844-283-8665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'XOzBXaUgwd', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(9, 'Izaiah Boyer', 'vonrueden.maynard@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '83474443', '52588183', '6582', '4770 Kayden Prairie\nBernhardberg, ME 76195-2744', '866-827-7422', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'NmaO0F8CYH', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(10, 'Maverick Jacobs', 'quitzon.loyce@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '27689142', '40396057', '3331', '59786 Kuphal Locks Suite 149\nNorth Orahaven, WV 30725', '(877) 799-6578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', '8euQ7kZ9Kc', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(11, 'Herbert Prohaska PhD', 'kiehn.mose@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '69601397', '90653930', '3063', '9468 Kaylie Crossroad Apt. 689\nNorth Ebonyburgh, IL 28553', '844.452.0743', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', '3mjeOpRaXp', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(12, 'Santiago Dickens II', 'cole.floy@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '35362089', '83335297', '2660', '85523 Kerluke Lane Suite 820\nHellerside, NE 88547', '855-808-5648', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'PIMMJAYndg', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(13, 'Dulce Carter', 'jacobson.norberto@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '27352700', '36309923', '7352', '602 Ada Islands\nNew Cullenborough, WV 16394', '(888) 696-6055', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', '5WpTSg0J6y', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(14, 'Prof. Tyrique Schiller III', 'dach.amya@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '63913190', '24998183', '4960', '783 Winston Locks\nNicolaside, KY 20600', '800.579.6608', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'SO2AaJ67gU', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(15, 'Theodore Anderson', 'lucas.purdy@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '72323247', '61188829', '9420', '53894 Genoveva Underpass\nLake Dimitri, OH 68836', '(877) 801-3070', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'AzU18ba6i2', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(16, 'Maximillian Roob', 'brant.moen@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '61634401', '34617200', '3599', '55237 Gideon Mount Apt. 957\nLilamouth, UT 33448', '1-866-940-9529', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'e6mjxYG0cZ', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(17, 'Miss Audie Collins PhD', 'arice@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '75372015', '26109072', '1436', '67214 Hartmann Junction\nNorth Thomasborough, NM 85154-0235', '1-800-330-2214', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'hZuNEiCTXB', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(18, 'Lorenza Haag Jr.', 'hand.edgar@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '47784875', '53722204', '4763', '38372 Sigrid Keys Suite 642\nIgnaciochester, MN 40918', '(866) 720-5472', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'gfAsPmDSQd', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(19, 'Deshawn Funk', 'adalberto.jerde@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '21627644', '25019327', '7050', '9958 Prosacco Forges\nGregoriaton, NE 48442', '877.366.6697', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'MtY5wtBMiP', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(20, 'Lambert Bruen', 'bmoore@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '37255183', '68765049', '7495', '588 Maryam Orchard\nAlanaburgh, OK 38115-6344', '(888) 664-0379', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'iEBbKRF6oY', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(21, 'Una Nader Sr.', 'ebeier@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '28226324', '18993976', '2882', '382 Terence Prairie\nNorth Dahlia, SC 95259-0408', '1-877-338-7923', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'vKzCVvJoxG', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(22, 'Michael Luettgen', 'tprice@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '43782442', '76024372', '3876', '4645 Hahn Land\nNicolettetown, ND 33532-7286', '(877) 908-6521', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'pci9vAOGqJ', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(23, 'Della Schaden', 'ismael.lindgren@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '72614066', '13930514', '1733', '314 Mia Streets Apt. 667\nNorth Kayli, NV 57372-1604', '877-237-1464', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'rtEiH4G5VD', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(24, 'Mona O\'Reilly', 'orpha62@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '49365282', '50704750', '9918', '7904 Wiza Tunnel\nGottliebfurt, LA 85899', '1-800-974-0989', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'tb5ZDuIgr7', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(25, 'Lucy Hauck Jr.', 'kassulke.maudie@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '39867127', '77303730', '2653', '84066 Stokes Plains\nWest Claraside, VT 32722', '1-888-708-1005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'ymD6CFVNUk', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(26, 'Dr. Frankie Boehm', 'karine.fahey@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '93151899', '87797591', '7647', '1772 Kiehn Junctions Suite 910\nPort Jodyberg, UT 12507', '888.628.6021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'EzKaIZRqRH', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(27, 'Deborah Balistreri', 'nettie75@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '35563781', '68361358', '7412', '2880 Heaney Island Apt. 685\nNorth Brain, VA 06548-3196', '800.443.9382', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'wC5W9UBrOr', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(28, 'Prof. Henri Collins PhD', 'cremin.sebastian@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '36180523', '71603780', '1318', '581 Gaylord Corner Apt. 502\nPort Sandyburgh, FL 32569-1051', '1-866-659-0692', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'Nbhzo3oMcy', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(29, 'Barbara Strosin Sr.', 'mariela.wiza@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '72950310', '33601228', '3475', '890 Barry Plains Suite 996\nNew Dedric, CO 05256', '844-299-8942', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', '2JMC5eSvJC', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(30, 'Maurine Gleichner', 'collier.lucas@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '73092096', '29326919', '9983', '48916 Turcotte Garden\nNorth Nelle, NE 87420', '(877) 885-2632', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'R41bjzONKc', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(31, 'Ms. Tiana Wintheiser DVM', 'emil.fritsch@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '34525877', '16977637', '7433', '302 Hailee Green Suite 728\nNew Aditya, CT 98150', '1-877-620-4933', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'e7XUcR7sOY', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(32, 'Ryan Schiller', 'hkemmer@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '53825011', '34376198', '4165', '832 Dominic Skyway\nEast Hopeville, MD 17532-6921', '(855) 370-1436', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'quDj5xyTjj', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(33, 'Glenda Block Sr.', 'sherwood.mcclure@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '33033804', '68203244', '7057', '1404 Peter Green\nEast Doraport, NE 79627', '(844) 277-2862', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'tuGtha2PZ8', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(34, 'Elsa Abernathy', 'freddy80@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '62677850', '46527746', '6881', '424 Karen Place Apt. 631\nNew Seamusville, NH 70591', '(888) 382-6244', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'vpVXPstjjg', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(35, 'Prof. Kacie Runte', 'akoss@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '71385183', '19295823', '8548', '1345 Easter Cape Suite 146\nKellyville, DE 68722', '800.660.2811', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'peAtXEEmiv', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(36, 'Prof. Lamont Robel', 'wade.wuckert@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '94567161', '84374551', '7341', '744 Fisher Trail Apt. 260\nSouth Lyla, OK 43941-1979', '888.408.5469', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', '9WAgHjNpEv', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(37, 'Urban Renner III', 'rodriguez.lauryn@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '43101284', '28019131', '9687', '59985 Klocko Gateway\nSchmelerfurt, IA 63903', '844.695.4307', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'lHtvv0R65Q', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(38, 'Krystina Gulgowski', 'judd.harber@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '24462151', '16059076', '8170', '14498 Wehner Summit Apt. 299\nArleneside, PA 51311', '(800) 469-7852', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'niRsS6gjfQ', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(39, 'Bennie Labadie III', 'mitchell.violette@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '59472615', '87923033', '8541', '69931 Reynolds Hollow\nBrettchester, CO 00157-4866', '800.987.1046', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'Fq4bNRnZrb', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(40, 'Viviane Walker', 'alyson66@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '10093462', '73415154', '2876', '28705 Cummerata Pine\nRatkehaven, MI 18207-5720', '800-923-8637', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', '9qrqZqjQ7H', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(41, 'Alfreda Corkery', 'lubowitz.zora@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '81469222', '78929659', '4897', '209 Sarina Plain\nKleinchester, NV 06233-7451', '877.989.1683', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'wlP5qPh1aF', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(42, 'Mrs. Aglae Larkin Jr.', 'greenholt.shaina@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '70844728', '45091759', '1202', '946 Leuschke Loop\nWest Sigmund, WA 81305-2659', '877.344.8527', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', '2BmvCcDuyE', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(43, 'Rodger Wehner V', 'xwalsh@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '46193494', '76416670', '8176', '40721 Kub Lane Suite 149\nGleichnerfort, VT 97912', '800.357.6191', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'yJJ2P4DS0b', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(44, 'Pattie Maggio DDS', 'bradley24@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '28862512', '31092173', '1339', '170 Auer Roads Suite 285\nBorerfurt, DE 27811', '844-996-8655', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'VnkEBo7dln', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(45, 'Mazie Kuhlman', 'smoore@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '96969179', '60268405', '6196', '6050 Khalid Prairie Apt. 027\nNorth Linnie, NE 24207-3879', '1-866-696-1653', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'xNPuP8OyPS', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(46, 'Miss Jennyfer Hintz III', 'ryann58@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '63336802', '36789497', '9415', '152 Raphaelle Orchard\nSwiftfort, GA 37111', '866.868.3457', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'DyByUbrWKQ', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(47, 'Mortimer Huels', 'hirthe.max@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '45530282', '21667750', '2022', '133 Berge Trace Apt. 459\nKlockoborough, KS 32130-4288', '(888) 688-6771', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'X7amsoa9fX', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(48, 'Zella Hayes DVM', 'rhianna.walker@example.org', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '81449170', '94412909', '2527', '90339 Kaylie Villages Apt. 427\nKeeblerchester, NM 50809-2430', '1-888-375-6551', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'qomMMIdPNl', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(49, 'Dr. Alanna Kuphal', 'bette.fisher@example.com', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '44247645', '38301930', '7749', '47530 Klocko Forks\nLeannonshire, AR 77935', '(844) 774-0554', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'bnWBIP5ui2', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(50, 'Rasheed Yundt', 'littel.julius@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '22896457', '83559933', '7993', '71161 Ona Way Suite 881\nRempelville, ID 53606', '(888) 577-1971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', 'zo3f8tQITr', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo'),
(51, 'Darby Morar', 'toney04@example.net', '2023-11-15 07:43:44', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '88302405', '72104688', '4777', '897 Hamill Squares Apt. 721\nAufderharland, CT 92306-0879', '844-497-0726', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'doctor', '67ApjkRaUM', '2023-11-15 07:43:44', '2023-11-15 07:43:44', 'activo');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
