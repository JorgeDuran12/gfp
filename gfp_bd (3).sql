-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2023 a las 18:03:44
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gfp_bd`
--
CREATE DATABASE IF NOT EXISTS `gfp_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gfp_bd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `acciones` (
  `id_accion` smallint(2) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_usuario_crea` smallint(2) NOT NULL,
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acciones`
--

INSERT INTO `acciones` (`id_accion`, `nombre`, `descripcion`, `estado`, `id_usuario_crea`, `fecha_crea`) VALUES
(1, 'Asignación de rol', 'Asignar un rol a un usuario en especifico', 'A', 1, '2023-04-21 12:35:54'),
(2, 'Quitar rol', 'Quitar un rol a un usuario en especifico', 'A', 1, '2023-04-21 12:35:54'),
(3, 'Eliminar rol', 'Eliminar un rol especifico', 'A', 1, '2023-04-21 12:35:54'),
(4, 'Actualizar administrador', 'Actualizar información o datos de un administrador', 'A', 1, '2023-04-21 12:35:54'),
(5, 'Deshabilitar administrador', 'Deshabilitar cuenta de un administrador', 'A', 1, '2023-04-21 12:35:54'),
(6, 'Agregar rol', 'Agregar un nuevo rol ', 'A', 1, '2023-04-21 12:35:54'),
(7, 'Eliminar usuario', 'Eliminar cuenta de un usuario en especifico', 'A', 1, '2023-04-21 12:35:54'),
(8, 'Listar usuario', 'Listar y ver perfiles de todos los usuarios registrados', 'A', 1, '2023-04-21 12:35:54'),
(9, 'Crear usuario', 'Crear un usuario nuevo en el sistema', 'A', 1, '2023-04-21 12:35:54'),
(10, 'Enviar boletines informativos', 'Enviar boletines informativos de interés a todos los usuarios registrados o a uno en especifico', 'A', 1, '2023-04-21 12:35:54'),
(11, 'Restauración de cuenta', 'Restaurar cuenta eliminada de un usuario y/o administrador', 'A', 1, '2023-04-21 12:35:54'),
(12, 'Actualizar usuario', 'Actualizar información o datos de un usuario', 'A', 1, '2023-04-21 12:35:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `color` varchar(200) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `title`, `descripcion`, `color`, `start`, `end`, `id_usuario`) VALUES
(11, 'Titulo', 'Recordatorio!', '#219bc4', '2023-06-07 00:00:00', '2023-06-07 00:10:00', 82),
(13, 'Cita dermatologo', 'Ir a la cita del dermatólogo en barranquilla.', '#44d80e', '2023-06-11 00:00:00', '2023-06-12 11:12:00', 82),
(18, 'pagar pruebas TYT', 'si no las pago me la chupan', '#000000', '2023-06-09 00:00:00', '2023-06-09 07:38:00', 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibles`
--

CREATE TABLE `disponibles` (
  `id_disponible` smallint(2) NOT NULL,
  `periodo` year(4) NOT NULL,
  `saldo_anterior` decimal(11,2) NOT NULL DEFAULT 0.00,
  `ingreso` decimal(11,2) NOT NULL DEFAULT 0.00,
  `egreso` decimal(11,2) NOT NULL DEFAULT 0.00,
  `presupuesto_anual` decimal(11,2) DEFAULT 0.00,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `disponibles`
--

INSERT INTO `disponibles` (`id_disponible`, `periodo`, `saldo_anterior`, `ingreso`, `egreso`, `presupuesto_anual`, `estado`, `fecha_crea`, `id_usuario`) VALUES
(26, 2023, '10000000.00', '0.00', '200321.00', '7988679.00', 'A', '2023-06-21 15:57:03', 28),
(30, 2023, '3000000.00', '50000.00', '1490900.00', '1508800.00', 'A', '2023-06-20 16:11:44', 31),
(35, 2023, '10000000.00', '0.00', '0.00', '9844100.00', 'A', '2023-06-21 13:29:51', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emails`
--

CREATE TABLE `emails` (
  `id_email` smallint(2) NOT NULL,
  `email` varchar(200) NOT NULL,
  `prioridad` smallint(2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `emails`
--

INSERT INTO `emails` (`id_email`, `email`, `prioridad`, `estado`, `fecha_crea`, `id_usuario`, `usuario_crea`) VALUES
(1, 'duranolivaresjorgeluis1@gmail.com', 13, 'A', '2023-05-11 12:22:43', 3, 3),
(8, 'danipc@gmail.com', 13, 'A', '2023-05-08 21:13:02', 28, 28),
(33, 'mariase3105@gmail.com', 13, 'A', '2023-05-10 16:02:26', 31, 31),
(56, 'delassalasospino2003@gmail.com', 14, 'A', '2023-06-21 12:14:30', 73, 73),
(57, 'daniel@gmail.com', 13, 'A', '2023-05-19 17:46:55', 74, 74),
(58, 'duran3313@gmail.com', 13, 'A', '2023-05-19 18:03:01', 75, 75),
(59, 'wilfri@gmail.com', 13, 'A', '2023-05-19 18:08:18', 76, 76),
(60, 'delassalasospino2030@gmail.com', 13, 'A', '2023-05-29 15:27:50', 77, 77),
(62, 'dev@gmail.com', 13, 'A', '2023-05-24 17:12:39', 79, 79),
(63, 'yo@gmail.com', 13, 'A', '2023-05-25 19:22:08', 80, 80),
(65, 'delassalasospino20033@gmail.com', 14, 'A', '2023-06-07 13:30:24', 82, 82),
(66, 'santiagoguerreroh034@gmail.com', 13, 'A', '2023-05-26 17:36:13', 83, 83),
(67, 'asdasdasdasdasd@gmail.com', 13, 'A', '2023-05-26 18:21:44', 84, 84),
(85, 'rosa@gmail.com', 13, 'A', '2023-05-29 20:05:21', 86, 86),
(86, '23a@gmail.com', 13, 'A', '2023-05-29 20:11:40', 87, 87),
(88, 'krast@gmail.com', 14, 'A', '2023-05-29 20:27:10', 77, 77),
(89, 'manpower@gmail.com', 13, 'A', '2023-05-29 20:43:59', 88, 88),
(90, 'pepe11@gmail.com', 13, 'A', '2023-05-30 17:39:59', 89, 89),
(94, 'arevalosarmientokenny@gmail.com', 13, 'A', '2023-06-05 17:36:57', 90, 90),
(95, 'micorreop@gmail.com', 13, 'A', '2023-06-07 13:30:24', 82, 82),
(96, 'correoqm@gmail.com', 14, 'A', '2023-06-07 13:12:11', 82, 82),
(97, 'delassa@gmail.com', 13, 'A', '2023-06-08 15:19:41', 1, 1),
(99, 'santiago@gmail.com', 14, 'A', '2023-06-08 18:43:57', 1, 1),
(101, 'delassa1@gmail.com', 14, 'A', '2023-06-08 15:19:14', 1, 1),
(102, 'delassalasospino20031@gmail.com', 14, 'A', '2023-06-08 20:19:32', 1, 1),
(103, 'santo@gmail.com', 13, 'A', '2023-06-14 21:13:11', 92, 92);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_emergencia`
--

CREATE TABLE `fondo_emergencia` (
  `id_fondo-emergencia` smallint(2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL,
  `id_parametro_det` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fondo_emergencia`
--

INSERT INTO `fondo_emergencia` (`id_fondo-emergencia`, `fecha_registro`, `valor`, `estado`, `fecha_crea`, `id_usuario`, `id_parametro_det`, `usuario_crea`, `descripcion`) VALUES
(129, '2023-02-22', '1000.00', 'A', '2023-06-21 13:10:39', 3, 82, 3, 'Prueba'),
(130, '2023-01-02', '10000.00', 'A', '2023-06-21 18:09:57', 3, 83, 3, 'Prueba'),
(131, '2023-01-21', '1000.00', 'A', '2023-06-21 18:10:11', 3, 83, 3, 'Prueba'),
(132, '2023-02-21', '1000.00', 'A', '2023-06-21 18:10:22', 3, 83, 3, 'Prueba'),
(133, '2023-03-21', '100000.00', 'A', '2023-06-21 13:35:52', 3, 82, 3, 'Prueba'),
(134, '2023-03-24', '20000.00', 'A', '2023-06-21 13:36:00', 3, 82, 3, 'Prueba\r\n\r\n'),
(135, '2023-04-21', '10000.00', 'A', '2023-06-21 18:11:51', 3, 82, 3, 'Prueba'),
(136, '2023-04-22', '1000.00', 'A', '2023-06-21 18:12:40', 3, 82, 3, 'Prueba\r\n'),
(137, '2023-06-21', '1100.00', 'A', '2023-06-21 18:13:12', 3, 82, 3, 'Prueba'),
(138, '2023-06-23', '1500.00', 'A', '2023-06-21 18:13:23', 3, 82, 3, 'Prueba'),
(139, '2023-05-21', '100000.00', 'A', '2023-06-21 13:14:32', 3, 82, 3, 'Prueba'),
(140, '2023-07-08', '15000.00', 'A', '2023-06-21 18:13:37', 3, 82, 3, 'Prueba'),
(141, '2023-07-21', '5000.00', 'A', '2023-06-21 18:13:43', 3, 82, 3, 'Prueba'),
(142, '2023-05-23', '10000.00', 'A', '2023-06-21 13:14:28', 3, 82, 3, 'Prueba'),
(143, '2023-08-17', '11000.00', 'A', '2023-06-21 13:14:21', 3, 82, 3, 'Prueba'),
(145, '2023-06-22', '100000.00', 'A', '2023-06-21 18:23:12', 3, 83, 3, 'Sd'),
(146, '2023-06-23', '11000.00', 'A', '2023-06-21 18:24:11', 3, 82, 3, 'Cd'),
(147, '2023-06-22', '10000.00', 'A', '2023-06-21 13:36:22', 3, 82, 3, '<fd'),
(148, '2023-06-21', '10000.00', 'A', '2023-06-21 18:25:39', 3, 83, 3, 'Fdfd'),
(149, '2023-06-22', '41000.00', 'A', '2023-06-21 18:27:40', 3, 82, 3, 'Iop'),
(153, '2023-06-22', '100000.00', 'A', '2023-06-21 18:29:51', 3, 82, 3, 'Op'),
(154, '2023-06-08', '100000.00', 'A', '2023-06-21 18:29:54', 28, 82, 28, 'Lllll'),
(155, '2023-06-30', '360000.00', 'A', '2023-06-21 18:32:10', 3, 83, 3, 'Kñ'),
(156, '2023-06-23', '50000.00', 'A', '2023-06-21 18:43:55', 28, 83, 28, 'Uhg'),
(157, '2023-06-30', '15000.00', 'A', '2023-06-21 18:44:40', 28, 83, 28, 'Fd'),
(158, '2023-06-30', '15000.00', 'A', '2023-06-21 18:45:04', 28, 83, 28, 'Fd'),
(159, '2023-06-29', '100000.00', 'A', '2023-06-21 18:58:26', 28, 83, 28, 'Fdfd'),
(160, '2023-06-23', '15000.00', 'A', '2023-06-21 19:17:30', 28, 83, 28, 'Fs'),
(161, '2023-06-23', '15000.00', 'A', '2023-06-21 19:17:41', 28, 83, 28, 'Sdfsd'),
(162, '2023-06-29', '150000.00', 'A', '2023-06-21 19:19:49', 28, 83, 28, 'Fxfdsf'),
(163, '2023-06-30', '100000.00', 'A', '2023-06-21 20:57:03', 28, 82, 28, 'Rewr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimiento` smallint(2) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tipo_movimiento` smallint(2) NOT NULL,
  `clase_movimiento` smallint(2) NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `descripcion`, `tipo_movimiento`, `clase_movimiento`, `valor`, `fecha_movimiento`, `estado`, `fecha_crea`, `usuario_crea`) VALUES
(5525, 'cuota saquito', 2, 4, '400.00', '2023-06-20 13:05:05', 'A', '2023-06-20 18:05:05', 31),
(5526, 'cuota saquito', 2, 4, '500.00', '2023-06-20 13:09:53', 'A', '2023-06-20 18:09:53', 31),
(5527, 'cuota saquito', 2, 4, '20000.00', '2023-06-20 13:10:35', 'A', '2023-06-20 18:10:35', 31),
(5528, 'cuota saquito', 2, 4, '20000.00', '2023-06-20 13:12:14', 'A', '2023-06-20 18:12:14', 31),
(5529, 'Zapatos', 1, 4, '987100.00', '2023-06-20 13:18:00', 'A', '2023-06-20 18:18:27', 3),
(5530, 'Youtube Premium', 2, 4, '100000.00', '2023-06-20 13:45:00', 'A', '2023-06-20 18:45:09', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_det`
--

CREATE TABLE `parametros_det` (
  `id_parametro_det` smallint(2) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_parametro_enc` smallint(2) NOT NULL,
  `id_usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parametros_det`
--

INSERT INTO `parametros_det` (`id_parametro_det`, `nombre`, `estado`, `fecha_crea`, `id_parametro_enc`, `id_usuario_crea`) VALUES
(1, 'Bancario', 'A', '2023-06-13 12:25:58', 1, 1),
(2, 'No bancario', 'A', '2023-06-13 12:26:20', 1, 1),
(3, 'Ingreso', 'A', '2023-04-21 13:23:09', 2, 1),
(4, 'Egreso', 'A', '2023-05-11 13:45:25', 2, 1),
(9, 'Cedula de Ciudadania', 'A', '2023-05-25 13:22:56', 3, 1),
(10, 'Tarjeta de Identidad', 'A', '2023-05-25 13:22:59', 3, 1),
(11, 'Pasaporte', 'A', '2023-05-25 13:23:01', 3, 1),
(12, 'Cedula de Extranjeria', 'A', '2023-05-25 13:22:51', 3, 1),
(13, 'principal', 'A', '2023-05-25 13:22:19', 6, 1),
(14, 'secundario', 'A', '2023-05-25 13:22:22', 6, 1),
(15, 'Numero de Identificacion Tributaria', 'A', '2023-05-25 13:23:05', 3, 2),
(16, 'Permiso Especial de Permanencia', 'A', '2023-05-25 13:23:07', 3, 1),
(22, 'Gas ', 'A', '2023-06-06 12:42:12', 7, 1),
(23, 'Agua', 'A', '2023-06-06 12:42:17', 7, 1),
(24, 'Energia', 'A', '2023-06-06 12:42:15', 7, 1),
(25, 'Internet', 'A', '2023-06-06 12:42:10', 7, 1),
(28, 'Television', 'A', '2023-06-06 12:42:18', 7, 1),
(29, 'Telefonico', 'A', '2023-06-06 12:42:25', 7, 1),
(36, 'Netflix', 'A', '2023-06-06 12:40:09', 8, 1),
(37, 'Amazon Prime', 'A', '2023-06-09 12:28:41', 8, 1),
(38, 'Youtube Premium', 'A', '2023-06-09 12:28:47', 8, 1),
(39, 'Spotify', 'A', '2023-06-06 12:40:09', 8, 1),
(40, 'Disney', 'A', '2023-06-06 12:40:09', 8, 1),
(41, 'HBO', 'A', '2023-06-06 12:41:26', 8, 1),
(42, 'Star+', 'A', '2023-06-06 12:41:03', 8, 1),
(43, 'Sueter', 'A', '2023-06-06 12:44:33', 9, 1),
(53, 'Camisa', 'A', '2023-06-06 12:48:36', 9, 1),
(54, 'Zapatos', 'A', '2023-06-06 12:48:36', 9, 1),
(55, 'Accesorios', 'A', '2023-06-06 12:48:36', 9, 1),
(56, 'Pantalon', 'A', '2023-06-06 12:48:36', 9, 1),
(81, 'Pagos en linea', 'A', '2023-06-20 17:56:25', 1, 3),
(82, 'Ingreso de fondo', 'A', '2023-06-20 18:53:18', 10, 31),
(83, 'Uso del fondo', 'A', '2023-06-20 18:53:30', 10, 31),
(84, 'Presupuesto actual', 'A', '2023-06-20 19:04:13', 11, 3),
(85, 'Fondo de emergencia', 'A', '2023-06-20 19:04:29', 11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_enc`
--

CREATE TABLE `parametros_enc` (
  `id_parametro_enc` smallint(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parametros_enc`
--

INSERT INTO `parametros_enc` (`id_parametro_enc`, `nombre`, `estado`, `fecha_crea`, `id_usuario_crea`) VALUES
(1, 'Tipo de movimiento', 'A', '2023-06-09 13:53:05', 1),
(2, 'Clase de movimiento', 'A', '2023-03-01 13:24:40', 1),
(3, 'tipo_dcto', 'A', '2023-04-21 13:16:02', 1),
(6, 'prioridad', 'A', '2023-04-21 13:38:55', 1),
(7, 'Servicios Publicos', 'A', '2023-06-08 14:52:26', 1),
(8, 'Paginas de Entretenimientos', 'A', '2023-06-09 13:57:58', 1),
(9, 'Ropa', 'A', '2023-06-08 14:52:31', 1),
(10, 'Fondo de emergencia', 'A', '2023-06-20 18:52:55', 31),
(11, 'Proyeccion', 'A', '2023-06-20 19:03:59', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` smallint(2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_rol` smallint(2) NOT NULL,
  `id_accion` smallint(2) NOT NULL,
  `id_usuario_crea` smallint(2) NOT NULL,
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `estado`, `id_rol`, `id_accion`, `id_usuario_crea`, `fecha_crea`) VALUES
(1, 'A', 1, 1, 1, '2023-02-28 16:20:51'),
(2, 'A', 1, 2, 1, '2023-02-28 16:20:53'),
(3, 'A', 1, 3, 1, '2023-02-28 16:20:55'),
(4, 'A', 1, 4, 1, '2023-02-28 16:20:57'),
(5, 'A', 1, 5, 1, '2023-02-28 16:20:58'),
(6, 'A', 1, 6, 1, '2023-02-28 16:21:01'),
(7, 'A', 1, 7, 1, '2023-02-28 16:21:02'),
(8, 'A', 2, 7, 1, '2023-02-28 16:21:03'),
(9, 'A', 1, 8, 1, '2023-02-28 16:21:04'),
(10, 'A', 2, 8, 1, '2023-02-28 16:21:06'),
(11, 'A', 1, 9, 1, '2023-02-28 16:21:08'),
(12, 'A', 2, 9, 1, '2023-02-28 16:21:09'),
(13, 'A', 1, 10, 1, '2023-02-28 16:21:10'),
(14, 'A', 2, 10, 1, '2023-02-28 16:21:11'),
(15, 'A', 1, 11, 1, '2023-02-28 16:21:12'),
(16, 'A', 2, 11, 1, '2023-02-28 16:21:13'),
(17, 'A', 1, 12, 1, '2023-02-28 16:21:15'),
(18, 'A', 2, 12, 1, '2023-02-28 16:21:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyeccion`
--

CREATE TABLE `proyeccion` (
  `id_proyeccion` smallint(2) NOT NULL,
  `fecha_cuota` date NOT NULL,
  `valor_cuota` decimal(11,2) NOT NULL,
  `total` decimal(11,2) NOT NULL DEFAULT 0.00,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_saquito` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proyeccion`
--

INSERT INTO `proyeccion` (`id_proyeccion`, `fecha_cuota`, `valor_cuota`, `total`, `estado`, `fecha_crea`, `id_saquito`, `usuario_crea`) VALUES
(141, '2023-06-07', '321.00', '0.00', 'A', '2023-06-07 19:49:52', 84, 28),
(142, '2023-06-09', '400000.00', '0.00', 'E', '2023-06-20 13:06:51', 86, 31),
(143, '2023-06-09', '400000.00', '0.00', 'E', '2023-06-20 13:06:46', 86, 31),
(146, '2023-06-20', '400.00', '0.00', 'E', '2023-06-20 13:09:37', 88, 31),
(147, '2023-06-16', '500.00', '0.00', 'E', '2023-06-20 13:10:05', 89, 31),
(148, '2023-06-20', '20000.00', '0.00', 'A', '2023-06-20 18:10:35', 90, 31),
(149, '2023-06-20', '20000.00', '0.00', 'A', '2023-06-20 18:12:14', 90, 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` smallint(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `usuario_crea` smallint(2) NOT NULL,
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`, `estado`, `usuario_crea`, `fecha_crea`) VALUES
(1, 'Super Administrador', 'Acceso completo en el sistema.\r\npuede gestionar usuarios, roles, grupos y otros superadministradores u administradores.\r\nDarle mantenimiento a la pagina, etc.', 'A', 3, '2023-06-15 16:26:21'),
(2, 'Administrador', 'Permiso para gestionar a todos los usuarios finales dentro del sistema\r\n', 'A', 1, '2023-05-31 16:33:08'),
(3, 'Usuario', 'Acceso a todas las herramientas que ofrece el sistema', 'A', 3, '2023-05-31 16:33:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saquitos`
--

CREATE TABLE `saquitos` (
  `id_saquito` smallint(2) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `numero_cuota` varchar(5) NOT NULL,
  `cuota` decimal(11,2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `saquitos`
--

INSERT INTO `saquitos` (`id_saquito`, `descripcion`, `fecha_inicial`, `valor`, `numero_cuota`, `cuota`, `estado`, `fecha_crea`, `usuario_crea`) VALUES
(84, '321321321321', '2023-06-07', '321.00', '1', '321.00', 'C', '2023-06-07 14:49:53', 28),
(85, 'cell', '2023-06-09', '1000000.00', '10', '100000.00', 'A', '2023-06-09 18:05:06', 28),
(86, 'telefono', '2023-06-09', '800000.00', '2', '400000.00', 'C', '2023-06-09 13:51:20', 31),
(88, 'ghg', '2023-06-20', '400.00', '1', '400.00', 'C', '2023-06-20 13:05:06', 31),
(89, 'GHJMH', '2023-06-23', '500.00', '1', '500.00', 'C', '2023-06-20 13:09:54', 31),
(90, 'FDFV', '2023-06-20', '60000.00', '3', '20000.00', 'A', '2023-06-20 18:10:17', 31),
(91, 'kyjtk', '2023-06-22', '1000000.00', '10', '100000.00', 'A', '2023-06-20 19:00:38', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_telefono` smallint(2) NOT NULL,
  `numero` varchar(15) NOT NULL,
  `prioridad` smallint(2) NOT NULL,
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_usuario` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `numero`, `prioridad`, `fecha_crea`, `estado`, `id_usuario`, `usuario_crea`) VALUES
(18, '065165156', 13, '2023-05-19 12:36:49', 'A', 28, 28),
(19, '123456789', 13, '2023-05-19 17:40:37', 'A', 73, 73),
(20, '444888484', 13, '2023-05-19 17:46:55', 'A', 74, 74),
(21, '3011559347', 13, '2023-05-29 13:19:46', 'A', 3, 3),
(29, '134543322', 13, '2023-05-24 17:12:39', 'A', 79, 79),
(30, '654321', 13, '2023-05-24 12:17:10', 'A', 31, 31),
(31, '2314123123', 13, '2023-05-25 19:22:08', 'A', 80, 80),
(33, '3145575332', 13, '2023-05-26 17:36:13', 'A', 83, 83),
(34, '321321321321', 13, '2023-05-26 18:21:44', 'A', 84, 84),
(48, '3004042275', 13, '2023-05-29 15:06:33', 'A', 77, 77),
(57, '322165156', 13, '2023-05-29 20:05:21', 'A', 86, 86),
(58, '32423423', 13, '2023-05-29 20:11:40', 'A', 87, 87),
(60, '3004046355', 14, '2023-05-29 20:29:02', 'A', 77, 77),
(61, '3004363413', 14, '2023-05-29 20:29:11', 'A', 77, 77),
(62, '12343543', 13, '2023-05-29 20:43:59', 'A', 88, 88),
(63, '425787887', 13, '2023-05-30 17:39:59', 'A', 89, 89),
(67, '3113452298', 13, '2023-06-05 17:36:57', 'A', 90, 90),
(68, '3045555557', 14, '2023-06-07 13:10:49', 'A', 82, 82),
(69, '3184133027', 13, '2023-06-07 13:10:49', 'A', 82, 82),
(98, '3045698747', 13, '2023-06-08 15:19:03', 'A', 1, 1),
(113, '3044363414', 14, '2023-06-08 15:19:03', 'A', 1, 1),
(114, '3044363458', 14, '2023-06-08 20:18:34', 'A', 1, 1),
(115, '3012425210', 14, '2023-06-08 20:19:58', 'A', 1, 1),
(116, '3656161268186', 13, '2023-06-14 21:13:11', 'A', 92, 92),
(117, '3024446363', 14, '2023-06-15 21:02:49', 'A', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` smallint(2) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token` varchar(200) DEFAULT NULL,
  `id_rol` smallint(2) DEFAULT 3,
  `usuario_crea` smallint(2) NOT NULL,
  `tipo_documento` smallint(2) NOT NULL,
  `num_documento` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `nombre`, `apellido`, `pass`, `estado`, `fecha_crea`, `token`, `id_rol`, `usuario_crea`, `tipo_documento`, `num_documento`) VALUES
(1, 'devLas', 'carlos', 'de las salas', '$2y$10$dhKxYJJSByoImZqm.idj2.Ql2uh.29yhu5dAaojNu6dnMMNaIdHja', 'A', '2023-06-08 13:33:08', '', 1, 1, 9, '6565632'),
(2, 'Safe', 'santiago', 'guerrero', 'hola', 'E', '2023-06-15 16:26:34', '', 2, 1, 9, '32323'),
(3, 'JorgeDuran12', 'Jorge Luis', 'Duran Olivares', '$2y$10$tRxELER6t8KIt7732qm4bu8vrC/4IfydWGv4TE6RKzwyIkGu30AwC', 'A', '2023-06-13 12:20:31', 'x9pyYTQt9kji4RAPdEyrsNuNyZQUCG', 1, 3, 9, '10072199901'),
(28, 'Danipc', 'Daniel', 'Banquet', '$2y$10$Y.pApjdV4iGUqioYGymDPeWScJ9xWX1mE5OQhx2YRrV1mq6sqqdJ6', 'A', '2023-05-18 13:36:57', 'T38e7nEypqPVWubUlDoNnWppxlR5LY', 1, 28, 9, '11061212840'),
(31, 'Majo', 'Maria jose', 'Ramirez', '$2y$10$lJCs.OVlFG6Cno/nKGRmU.0585QD08xr.um.bIcgGEeiL5CNb8i0S', 'A', '2023-05-29 12:53:27', '', 1, 31, 9, '1043122695'),
(61, 'santo', 'santiago', 'guerrero', '$2y$10$NbLgWFT5vU0jURLiIhPbKO9VzVN67rStMlwBDCGXaYlO93Dw1qTgq', 'A', '2023-05-31 12:49:11', NULL, 1, 61, 10, '1001893022'),
(65, 'donpepe', 'prueba', 'prueeba', '$2y$10$3mu4HndER0HvMvl6Ll1FvuDf548sREge3vx/sxtwU0KTBRCPnt5oa', 'A', '2023-05-18 14:29:42', NULL, 1, 65, 9, '1000000000'),
(67, 'ever', 'ever', 'padilla', '$2y$10$raHQbzahcMczjHb/yf219OrJ.AMkMlr5pQSFE6SGjWpXfO9R8l.YO', 'A', '2023-05-18 14:56:46', NULL, 3, 67, 9, '2313213211321'),
(70, 'algo', 'algo', 'algo', '$2y$10$ZO.QuFkw1J7uiW7H5yrICOmoZQIOAjPeAPilvX5sn5UexLXpQBTHi', 'E', '2023-05-29 12:48:15', NULL, 3, 70, 9, '12323463'),
(73, 'Karl', 'Carlos', 'De las salas ', '$2y$10$oELknYrcA3.YzYy/zMLCteRwdY4a7uCMoYs6VU/C/PP20dPiAqBDe', 'E', '2023-05-29 12:48:18', 'nmegt', 3, 73, 9, '123654789'),
(74, 'hhhhhh', 'ff', 'fff', '$2y$10$M273OYRJ5RpACY6N80KXA.J4PvVmCw/WEfwUwxZ640eSfuMu1K9.W', 'E', '2023-05-29 12:48:21', NULL, 3, 74, 9, '44848484'),
(75, '123123', 'hola', 'hola', '$2y$10$cGjwg.NLd2P5nz8h.cqzCeMjKAXO.YfYjiwmz37RHKFExAzbZ1Gl.', 'A', '2023-06-02 12:39:24', NULL, 3, 75, 9, ''),
(76, 'wilfri', 'rfvrv', 'rvf', '$2y$10$2yBN5XAjzHEZJs/u3GtfqearMfc7kRtj/36vtRIRIRy.OqL3j4BDO', 'A', '2023-05-31 16:06:27', NULL, 3, 76, 9, '312312312'),
(77, 'devlassalas', 'devlassalas', 'ospino', '$2y$10$aIK1rchFnMevUo1.0VYDfODCRriPQFKOXFv47q6ZtWrB7hdhVIASK', 'A', '2023-05-29 13:18:08', NULL, 1, 77, 9, '1048264406'),
(79, 'duran12331', 'prueba', 'prueba ', '$2y$10$nCwEp0JwTvus2NDDKFNideGn0SpGMahH3grRNG/RtbMxrNDjHqq.u', 'A', '2023-06-01 14:59:41', NULL, 2, 79, 9, '423324324'));

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_parametros_det`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_parametros_det` (
`id_parametro_det` smallint(2)
,`nombre` varchar(200)
,`estado` char(1)
,`fecha_crea` timestamp
,`id_parametro_enc` smallint(2)
,`id_usuario_crea` smallint(2)
);

ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id_accion`),
  ADD KEY `accion_usuario` (`id_usuario_crea`);

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Indices de la tabla `disponibles`
--
ALTER TABLE `disponibles`
  ADD PRIMARY KEY (`id_disponible`),
  ADD KEY `disponible_usuario` (`id_usuario`);

--
-- Indices de la tabla `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id_email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_usuario` (`id_usuario`),
  ADD KEY `usuario_crea` (`usuario_crea`),
  ADD KEY `email_prioridad` (`prioridad`);

--
-- Indices de la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  ADD PRIMARY KEY (`id_fondo-emergencia`),
  ADD KEY `fondoEmergencia_usuario` (`id_usuario`) USING BTREE,
  ADD KEY `id_parametro_det` (`id_parametro_det`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `usuario_crea` (`usuario_crea`),
  ADD KEY `tipo_movimiento` (`tipo_movimiento`),
  ADD KEY `clase_movimiento` (`clase_movimiento`);

--
-- Indices de la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  ADD PRIMARY KEY (`id_parametro_det`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `parametro-det_parametro-enc` (`id_parametro_enc`),
  ADD KEY `parametro-det_usuario-crea` (`id_usuario_crea`);

--
-- Indices de la tabla `parametros_enc`
--
ALTER TABLE `parametros_enc`
  ADD PRIMARY KEY (`id_parametro_enc`),
  ADD KEY `parametro_usuario_crea` (`id_usuario_crea`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `permiso_accion` (`id_accion`),
  ADD KEY `permiso_rol` (`id_rol`),
  ADD KEY `permiso_usuario` (`id_usuario_crea`);

--
-- Indices de la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  ADD PRIMARY KEY (`id_proyeccion`),
  ADD KEY `id_saquito` (`id_saquito`),
  ADD KEY `usuario_crea` (`usuario_crea`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD KEY `usuario_crear` (`usuario_crea`);

--
-- Indices de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  ADD PRIMARY KEY (`id_saquito`),
  ADD KEY `usuario_crea` (`usuario_crea`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id_telefono`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `prioridad_telefono` (`prioridad`),
  ADD KEY `usario_telefono` (`id_usuario`),
  ADD KEY `usario_crea` (`usuario_crea`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuario_rol` (`id_rol`),
  ADD KEY `documento_usuario` (`tipo_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id_accion` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `disponibles`
--
ALTER TABLE `disponibles`
  MODIFY `id_disponible` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `id_email` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1189;

--
-- AUTO_INCREMENT de la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  MODIFY `id_fondo-emergencia` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5531;

--
-- AUTO_INCREMENT de la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  MODIFY `id_parametro_det` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `parametros_enc`
--
ALTER TABLE `parametros_enc`
  MODIFY `id_parametro_enc` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  MODIFY `id_proyeccion` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  MODIFY `id_saquito` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1178;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD CONSTRAINT `accion_usuario` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `disponibles`
--
ALTER TABLE `disponibles`
  ADD CONSTRAINT `disponible_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `email_prioridad` FOREIGN KEY (`prioridad`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `email_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuario_crea` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  ADD CONSTRAINT `fondoEmergencia_usuario_crea` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fondo_emergencia_ibfk_1` FOREIGN KEY (`id_parametro_det`) REFERENCES `parametros_det` (`id_parametro_det`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`tipo_movimiento`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`clase_movimiento`) REFERENCES `parametros_det` (`id_parametro_det`);

--
-- Filtros para la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  ADD CONSTRAINT `parametro-det_parametro-enc` FOREIGN KEY (`id_parametro_enc`) REFERENCES `parametros_enc` (`id_parametro_enc`),
  ADD CONSTRAINT `parametro-det_usuario-crea` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `parametros_enc`
--
ALTER TABLE `parametros_enc`
  ADD CONSTRAINT `parametro_usuario_crea` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permiso_accion` FOREIGN KEY (`id_accion`) REFERENCES `acciones` (`id_accion`),
  ADD CONSTRAINT `permiso_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  ADD CONSTRAINT `permiso_usuario` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  ADD CONSTRAINT `proyeccion_ibfk_1` FOREIGN KEY (`id_saquito`) REFERENCES `saquitos` (`id_saquito`),
  ADD CONSTRAINT `proyeccion_ibfk_2` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `usuario_crear` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `saquitos`
--
ALTER TABLE `saquitos`
  ADD CONSTRAINT `saquitos_ibfk_1` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `prioridad_telefono` FOREIGN KEY (`prioridad`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `usario_crea` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usario_telefono` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `documento_usuario` FOREIGN KEY (`tipo_documento`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
