-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2023 a las 14:21:22
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
(26, 2023, '10000000.00', '1000000.00', '250321.00', '2585164.00', 'A', '2023-06-21 16:12:16', 28),
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
(163, '2023-06-30', '100000.00', 'A', '2023-06-21 20:57:03', 28, 82, 28, 'Rewr'),
(164, '2023-06-22', '500000.00', 'A', '2023-06-21 21:07:02', 28, 83, 28, 'Sds'),
(165, '2023-06-23', '50000.00', 'A', '2023-06-21 21:09:51', 28, 82, 28, 'Ingreso de fondo'),
(166, '2023-06-29', '5000.00', 'A', '2023-06-21 21:12:01', 28, 83, 28, 'Hoaaaaaaaaaaaaaaaaaaa'),
(167, '2023-06-29', '8000.00', 'A', '2023-06-21 21:12:10', 28, 83, 28, 'Dasdasdasdasdasd'),
(168, '2023-06-29', '8151515.00', 'A', '2023-06-21 21:12:16', 28, 82, 28, 'Dadasd');

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
(5530, 'Youtube Premium', 2, 4, '100000.00', '2023-06-20 13:45:00', 'A', '2023-06-20 18:45:09', 28),
(5531, 'Youtube Premium', 81, 4, '50000.00', '2023-06-21 16:10:00', 'A', '2023-06-21 21:10:46', 28),
(5532, 'Me pagaron una plata', 1, 3, '1000000.00', '2023-06-21 16:11:00', 'A', '2023-06-21 21:11:13', 28);

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
(79, 'duran12331', 'prueba', 'prueba ', '$2y$10$nCwEp0JwTvus2NDDKFNideGn0SpGMahH3grRNG/RtbMxrNDjHqq.u', 'A', '2023-06-01 14:59:41', NULL, 2, 79, 9, '423324324'),
(80, 'santo', 'jorge', 'asdasdas', '$2y$10$71lOmUVRGvi7FiHath0Kz.cNtGzXA5IcxbhuqJSchHdvZ07IGbzBm', 'A', '2023-05-25 14:22:08', NULL, 3, 80, 9, '123123214'),
(81, 'santo', 'jorge', 'asdasdas', '$2y$10$PIzrLPt2Tn5l9yPqe2G0GeIhYwFs7oVtJ.zBjd.SSs7uSTQWZadB6', 'A', '2023-05-25 14:22:20', NULL, 3, 81, 9, '123123214'),
(82, 'KRast', 'Carlos', 'de las salas', '$2y$10$B00/Npo09IDOnEkbMB7yIOtbQWxezlnbMhZaYbsqNcxhef53ew3M6', 'A', '2023-06-07 13:30:03', NULL, 3, 82, 10, '1048264406'),
(83, 'santo', 'santiago', 'guerrero', '$2y$10$NbLgWFT5vU0jURLiIhPbKO9VzVN67rStMlwBDCGXaYlO93Dw1qTgq', 'A', '2023-06-08 12:28:20', NULL, 1, 83, 10, '1001893022'),
(84, 'asdasdasdasd', 'akjsdhakjsdasd', 'asdasdasdasd', '$2y$10$BZtZihUys9PAfMpP36dKV.T9q0iPfltHYFgtkBL2af7odhfSIHXfS', 'A', '2023-05-26 13:21:44', NULL, 3, 84, 10, '1321321321321'),
(86, 'Rosa Melano', 'Rosa ', 'Melano', '$2y$10$dkNfv96cLGW.FHpCBQRTV.lOuGmL30MR2m2e57UApFOHhzlPu9jF6', 'A', '2023-05-29 15:05:21', NULL, 3, 86, 11, '146'),
(87, 'Hola', 'Rosa', 'MElano', '$2y$10$EmyE/S69AeBoIq3cSS7FCu5M254h7qhrJ/1RUstbhkSwYI6JGJPya', 'A', '2023-05-29 15:11:40', NULL, 3, 87, 9, '12312312'),
(88, 'Manpower', 'Carlos ', 'De la salas ', '$2y$10$xCRKSOtp59IIpXx.XouugecQfk8OKoZgS.QiWpOcXSIzV5KgxKBqS', 'A', '2023-06-02 12:39:44', NULL, 1, 88, 9, '135434423'),
(89, 'pepe11', 'pepe', 'quintero', '$2y$10$C4IOno2gJInSaDbVVtSXRuTuUfpxZRnxkiff3FIdBYjTyEz0zGbsu', 'E', '2023-06-02 12:39:31', NULL, 3, 89, 9, '1104287484'),
(90, 'Keas_1303', 'kenny', 'arevalo', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-06-07 12:43:42', NULL, 3, 90, 9, '1043134691'),
(92, 'Santo', 'Santiago', 'Ortega', '$2y$10$dI/q34MZiKDQDKNoFr/B8uQ0WrpFqqP9xb/ZJR9YoZWohdDE33Us2', 'A', '2023-06-14 16:13:11', NULL, 3, 92, 9, '1005484152'),
(93, 'Santo', 'Santiago', 'Ortega', '$2y$10$k646E.AwwAGpXCDiJuAtM.5ZfKdKGqlubskd0UeyfKJI2kSs4loI2', 'A', '2023-06-14 16:14:32', NULL, 3, 93, 9, '1005484152'),
(94, 'Santo', 'Santiago', 'Ortega', '$2y$10$TVkI5E/hcy0TziZyZ3IWMesAyw1C20t82DC7u1kMzdnjEPIxDd/F6', 'A', '2023-06-14 16:14:32', NULL, 3, 94, 9, '1005484152'),
(95, 'Santo', 'Santiago', 'Ortega', '$2y$10$g5aJEtf6faQC4/pqZdzpVeJOMnUBWCsaB5NMQBydWma65twDTMJm6', 'A', '2023-06-14 16:14:32', NULL, 3, 95, 9, '1005484152'),
(96, 'Santo', 'Santiago', 'Ortega', '$2y$10$sbUZSFFCG6PHmlWEfAMJ0u6XNe6knwGtITpFlrSo1TUUg4LFlxJw6', 'A', '2023-06-14 16:14:32', NULL, 3, 96, 9, '1005484152'),
(97, 'Santo', 'Santiago', 'Ortega', '$2y$10$5NBNwX5t6J9mnjUz8/Pwbe1c/GonnOJaQEKq7Fl3rtpNvfIYZQG/i', 'A', '2023-06-14 16:14:32', NULL, 3, 97, 9, '1005484152'),
(98, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZgVXTkq/04NE6cMks1yaVetZO6.n8t5pAXKMNGVQ.VqPUhMlSd7ky', 'A', '2023-06-14 16:14:32', NULL, 3, 98, 9, '1005484152'),
(99, 'Santo', 'Santiago', 'Ortega', '$2y$10$qNPDwyz2m2Ejv14IjbV6oeqJOlSev/dNVo853AV//XPBq4U41f0z.', 'A', '2023-06-14 16:14:32', NULL, 3, 99, 9, '1005484152'),
(100, 'Santo', 'Santiago', 'Ortega', '$2y$10$7Hh1lOjHRu7TO0h/gpgfbu7Z2EZFYf0N2viRNUjoqGJROwXu6aEZK', 'A', '2023-06-14 16:14:32', NULL, 3, 100, 9, '1005484152'),
(101, 'Santo', 'Santiago', 'Ortega', '$2y$10$oewT9Jz47Sh3NAs//zwPZOp87lXMOk8nx3/TpOUKU9vS9pdgF4eHe', 'A', '2023-06-14 16:14:32', NULL, 3, 101, 9, '1005484152'),
(102, 'Santo', 'Santiago', 'Ortega', '$2y$10$p94ihcnbEibNnhycdY1ISeLFWTrZvrkCwzNRd1TScwQhKdTx6RphS', 'A', '2023-06-14 16:14:32', NULL, 3, 102, 9, '1005484152'),
(103, 'Santo', 'Santiago', 'Ortega', '$2y$10$mFH3yn82Fq1S3AREKnKVbOpTN3XDoniVKYwMfstoN4EbeLg88EZDa', 'A', '2023-06-14 16:14:32', NULL, 3, 103, 9, '1005484152'),
(104, 'Santo', 'Santiago', 'Ortega', '$2y$10$E01yoy/n8EITYpO7UnYlhee9wvFYcaCstbvPWYFFxUETz1tJLcVSm', 'A', '2023-06-14 16:14:32', NULL, 3, 104, 9, '1005484152'),
(105, 'Santo', 'Santiago', 'Ortega', '$2y$10$tURvd3AFYeYLHNG030/GJOGZ6D/THPjD56hVdhw7krR25e5CP2UEy', 'A', '2023-06-14 16:14:32', NULL, 3, 105, 9, '1005484152'),
(106, 'Santo', 'Santiago', 'Ortega', '$2y$10$pCvKH9JOLk7zSBxBOoSYEe5Flr5GQkR5EUwlMEwAf3w568wgtwuRi', 'A', '2023-06-14 16:14:32', NULL, 3, 106, 9, '1005484152'),
(107, 'Santo', 'Santiago', 'Ortega', '$2y$10$NP/tp7mPMhJMMJlc8ktode0wZwDfxJGxL7MzNWd0i3.sz4kAH9x16', 'A', '2023-06-14 16:14:32', NULL, 3, 107, 9, '1005484152'),
(108, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZswGeGn2FpfE5z6BbIe4Mu/AF.O2YNJU/l2HZh0qQRR9gZw0U4b/O', 'A', '2023-06-14 16:14:32', NULL, 3, 108, 9, '1005484152'),
(109, 'Santo', 'Santiago', 'Ortega', '$2y$10$uwa4hc7s6IHpSvcOwnIKSOXP0viVBMPXLf4kfKetBpdab/UaOmZ.K', 'A', '2023-06-14 16:14:32', NULL, 3, 109, 9, '1005484152'),
(110, 'Santo', 'Santiago', 'Ortega', '$2y$10$7fq3LLXRDvNxCBFjovYoHeVam8r21Eq5iK.9YCYAj4Xy2HEE.Cf.q', 'A', '2023-06-14 16:14:32', NULL, 3, 110, 9, '1005484152'),
(111, 'Santo', 'Santiago', 'Ortega', '$2y$10$21J/5GKevPvpuxxyaP1qs.xVXjNvhxOeVohjxWPGizEms1IfBdpxu', 'A', '2023-06-14 16:14:33', NULL, 3, 111, 9, '1005484152'),
(112, 'Santo', 'Santiago', 'Ortega', '$2y$10$6ienQU69JR9nAyJ58fuss.y76usEJEEk15ieuhjK9gL16umM.Uepq', 'A', '2023-06-14 16:14:33', NULL, 3, 112, 9, '1005484152'),
(113, 'Santo', 'Santiago', 'Ortega', '$2y$10$fQrVFfTUlmWAA4fR9WzKGuUYKPAlOdx56XjGI62XRTus94hAzuaOq', 'A', '2023-06-14 16:14:33', NULL, 3, 113, 9, '1005484152'),
(114, 'Santo', 'Santiago', 'Ortega', '$2y$10$6Wb8yXBnFV2..eu13tTNnu5TMSP1/aFVBRysXYPNn5xVbEI/SFKa.', 'A', '2023-06-14 16:14:33', NULL, 3, 114, 9, '1005484152'),
(115, 'Santo', 'Santiago', 'Ortega', '$2y$10$yUzD5SY9chnZGu8pxMrQKOEKSi.6ga96fb9GjPt6qRdRHf8OsezAa', 'A', '2023-06-14 16:14:33', NULL, 3, 115, 9, '1005484152'),
(116, 'Santo', 'Santiago', 'Ortega', '$2y$10$13X0fjey.MRcMOk1Ppmgf.Ivz3j8ULUddE3ECUs/7IivXsM4yNIsW', 'A', '2023-06-14 16:14:33', NULL, 3, 116, 9, '1005484152'),
(117, 'Santo', 'Santiago', 'Ortega', '$2y$10$1nHcjDIP2hY6X3k9C1f7EOVYjzZdn3A0wGyMgULPTVud5PN6bhYWW', 'A', '2023-06-14 16:14:33', NULL, 3, 117, 9, '1005484152'),
(118, 'Santo', 'Santiago', 'Ortega', '$2y$10$P7YGx2y52b.lcGsGGOGNTu.7x8D.g4EUdJZtClvcF2yT5p.XtxxOq', 'A', '2023-06-14 16:14:33', NULL, 3, 118, 9, '1005484152'),
(119, 'Santo', 'Santiago', 'Ortega', '$2y$10$N/B1bX7EsBhEEUD1Grvs0OHNT8tRzXWzj4m5GStTE8LbqAayAVaI6', 'A', '2023-06-14 16:14:33', NULL, 3, 119, 9, '1005484152'),
(120, 'Santo', 'Santiago', 'Ortega', '$2y$10$8cn8JbhUj0qILtB1M43PaecqUhvh6gxG4jezGvDYKpY90gZ4LoqzG', 'A', '2023-06-14 16:14:33', NULL, 3, 120, 9, '1005484152'),
(121, 'Santo', 'Santiago', 'Ortega', '$2y$10$tB/rl85Ly3rLuspMNpU5Y.cGXtSElOHzm57fO73qYcKNYUl4Vz9zy', 'A', '2023-06-14 16:14:33', NULL, 3, 121, 9, '1005484152'),
(122, 'Santo', 'Santiago', 'Ortega', '$2y$10$8Zad7k.MMOVIQHhZNv4h7e5A24uLz3AYduvunQg6LK5U2xIgpgVBm', 'A', '2023-06-14 16:14:33', NULL, 3, 122, 9, '1005484152'),
(123, 'Santo', 'Santiago', 'Ortega', '$2y$10$6nrt531n41V07We52kvT7O6B8Ir9nAkUQrKUHlbUmi57GSxG/jIx2', 'A', '2023-06-14 16:14:33', NULL, 3, 123, 9, '1005484152'),
(124, 'Santo', 'Santiago', 'Ortega', '$2y$10$bBoDoYrwwRmUBv/AIdka5uOgq7QRuuYEgUzJcUugkWWFhdAnkTURq', 'A', '2023-06-14 16:14:33', NULL, 3, 124, 9, '1005484152'),
(125, 'Santo', 'Santiago', 'Ortega', '$2y$10$nRJBQHJPWaWFbtL86pFgq.oTMAgEvCf6K.pfOeeBlrYfjQ4vjq6Ni', 'A', '2023-06-14 16:14:33', NULL, 3, 125, 9, '1005484152'),
(126, 'Santo', 'Santiago', 'Ortega', '$2y$10$F693oyFEZtZrZEZ2KRdzPeRDDTkKKzQ5yuaEmsdvPImKKFRQdx8J2', 'A', '2023-06-14 16:14:33', NULL, 3, 126, 9, '1005484152'),
(127, 'Santo', 'Santiago', 'Ortega', '$2y$10$vVTrdNlrCOE.V9d2CJayp.zSgp7bq2WS90DINOy7Fk47Byze965O.', 'A', '2023-06-14 16:14:33', NULL, 3, 127, 9, '1005484152'),
(128, 'Santo', 'Santiago', 'Ortega', '$2y$10$yv8k8R2QwFG15oI8Zv42DObEiI6F4gnk2awiivbXptBmoC/XFE6b.', 'A', '2023-06-14 16:14:33', NULL, 3, 128, 9, '1005484152'),
(129, 'Santo', 'Santiago', 'Ortega', '$2y$10$g4U6CYbEHitW7rtoWco3MeyDXPjHnyeP6zoxe.m5C7pxZgB6qTMVe', 'A', '2023-06-14 16:14:33', NULL, 3, 129, 9, '1005484152'),
(130, 'Santo', 'Santiago', 'Ortega', '$2y$10$qR.89fdEhASwgW4tZkBLZu69uHsto46BtOfjXalmGsrbVqHqCOL4W', 'A', '2023-06-14 16:14:33', NULL, 3, 130, 9, '1005484152'),
(131, 'Santo', 'Santiago', 'Ortega', '$2y$10$rmW/GOJ0M53E6hseaqItGuITyWHWsoOlF0rpEFxaIC1u6x7RF/eAe', 'A', '2023-06-14 16:14:33', NULL, 3, 131, 9, '1005484152'),
(132, 'Santo', 'Santiago', 'Ortega', '$2y$10$d4wsr2wrpAreElkkvcZy3O.O0exxYeHcig/WpV25MxY4fkoRZUj3y', 'A', '2023-06-14 16:14:33', NULL, 3, 132, 9, '1005484152'),
(133, 'Santo', 'Santiago', 'Ortega', '$2y$10$dsUo2Porxn8HOI9m1Or01uA.qVIP6.OL09SPB0DiD9lTJJq5YjJkm', 'A', '2023-06-14 16:14:34', NULL, 3, 133, 9, '1005484152'),
(134, 'Santo', 'Santiago', 'Ortega', '$2y$10$knO5Ufrz2YgUUMb.rQxT8uiTYchNn31UV4D86yIDQTnrYcZn5xHyy', 'A', '2023-06-14 16:14:34', NULL, 3, 134, 9, '1005484152'),
(135, 'Santo', 'Santiago', 'Ortega', '$2y$10$W.zBK5IbMmv2fMWi/ItZ0u0VuwzFWtLPItjiQ2g6ardgKK1Eeg9RC', 'A', '2023-06-14 16:14:34', NULL, 3, 135, 9, '1005484152'),
(136, 'Santo', 'Santiago', 'Ortega', '$2y$10$3yFfPqExG.5knPyZJEchROYVNI73LmYL1rFiKHVzRt.QT9dd7QO9e', 'A', '2023-06-14 16:14:34', NULL, 3, 136, 9, '1005484152'),
(137, 'Santo', 'Santiago', 'Ortega', '$2y$10$2SIxCgKM3TH6YdXcMLUWbugiAcxuomVnJJiywOHev2mxVX573A46C', 'A', '2023-06-14 16:14:34', NULL, 3, 137, 9, '1005484152'),
(138, 'Santo', 'Santiago', 'Ortega', '$2y$10$RU6sdtpLHE0wjV4yvLm2euzzR2NMwZWw/dM0qUYZ2rp..gZ4po8Cy', 'A', '2023-06-14 16:14:34', NULL, 3, 138, 9, '1005484152'),
(139, 'Santo', 'Santiago', 'Ortega', '$2y$10$.zayMU0P8YvInKuAxkJtouNQdG8JFOXXW9TLDYT6JaLtsFaQ5DcLi', 'A', '2023-06-14 16:14:34', NULL, 3, 139, 9, '1005484152'),
(140, 'Santo', 'Santiago', 'Ortega', '$2y$10$WaFvXcsvJPPwx3M6B4ztKO03dpMWrD1K3q6UZArdL67sgnLuRe9G.', 'A', '2023-06-14 16:14:34', NULL, 3, 140, 9, '1005484152'),
(141, 'Santo', 'Santiago', 'Ortega', '$2y$10$nb6/7VNALc5Qj44nrDccneCTVRHuE1o2jDFQz5QaT.aDNW3OMj5pK', 'A', '2023-06-14 16:14:34', NULL, 3, 141, 9, '1005484152'),
(142, 'Santo', 'Santiago', 'Ortega', '$2y$10$pjO57NjO7KRXIoXy2jOrge30YymxINYqLGv3MGwqJzOGfZ7jUbkbe', 'A', '2023-06-14 16:14:34', NULL, 3, 142, 9, '1005484152'),
(143, 'Santo', 'Santiago', 'Ortega', '$2y$10$9O.eKBE0vRGrZ/tUhs7B0.dJ07pvQ8JXxVahIdaggaCrV86/98IT.', 'A', '2023-06-14 16:14:34', NULL, 3, 143, 9, '1005484152'),
(144, 'Santo', 'Santiago', 'Ortega', '$2y$10$MMH8T0WYI9/cyEqe5HPE9ORcpZXFpUr16NIt9c41TAtWLMmlIMQFO', 'A', '2023-06-14 16:14:34', NULL, 3, 144, 9, '1005484152'),
(145, 'Santo', 'Santiago', 'Ortega', '$2y$10$jItN3yn6FBft4zlhUzpSd.B/aF3diratQgwiSTc4h0KEEQc817waq', 'A', '2023-06-14 16:14:34', NULL, 3, 145, 9, '1005484152'),
(146, 'Santo', 'Santiago', 'Ortega', '$2y$10$zxi5dEzIWjtK/0dr/n/9he.5o8h2RSvDNkKU.8c0lCyMWzdHEnhKe', 'A', '2023-06-14 16:14:34', NULL, 3, 146, 9, '1005484152'),
(147, 'Santo', 'Santiago', 'Ortega', '$2y$10$uQMd3UU5RbYEg.pMoIgUvOE8MRL1Tp0J4smYxBxZb4NiPwR/08xFC', 'A', '2023-06-14 16:14:34', NULL, 3, 147, 9, '1005484152'),
(148, 'Santo', 'Santiago', 'Ortega', '$2y$10$svIvaTxwydOXQOpJPOZz9eQWtC4C0lJmKJWzeh6Pu6IezN/gmZU/i', 'A', '2023-06-14 16:14:34', NULL, 3, 148, 9, '1005484152'),
(149, 'Santo', 'Santiago', 'Ortega', '$2y$10$B.uunshheiZp0cazxHLREemgw0OmsuEdYP6l3KBCXc2jljCmlrLwa', 'A', '2023-06-14 16:14:34', NULL, 3, 149, 9, '1005484152'),
(150, 'Santo', 'Santiago', 'Ortega', '$2y$10$WxDaKEauRTCNkRGp.zPX9.vwc2YGfRu.AN98mKDFE4JXKp8h5Z7iu', 'A', '2023-06-14 16:14:34', NULL, 3, 150, 9, '1005484152'),
(151, 'Santo', 'Santiago', 'Ortega', '$2y$10$iuvWAyTAkHThVtsDQjy7nO3Qchwgm82oOo7E6hT.ndTdJMuquGH7W', 'A', '2023-06-14 16:14:34', NULL, 3, 151, 9, '1005484152'),
(152, 'Santo', 'Santiago', 'Ortega', '$2y$10$DKwyOZQF41wZLMDpAYOhveJ/wzHgRV26W9vrzkZiBYyoQH2VNssCG', 'A', '2023-06-14 16:14:34', NULL, 3, 152, 9, '1005484152'),
(153, 'Santo', 'Santiago', 'Ortega', '$2y$10$Skjdfdm7I6zbqyeIT2sOYON7koFR.XBbOuJiKKt6ZOSAx1JB0YNaa', 'A', '2023-06-14 16:14:34', NULL, 3, 153, 9, '1005484152'),
(154, 'Santo', 'Santiago', 'Ortega', '$2y$10$d6yrjzRi/bvLurUie/qZ8.DDPPu5ynJo5GJ7sKn3C610smQQIPm9y', 'A', '2023-06-14 16:14:34', NULL, 3, 154, 9, '1005484152'),
(155, 'Santo', 'Santiago', 'Ortega', '$2y$10$sWbxEYN39MuEViHi8n/D5OUAw7jgp8rQdvHjHSMlysypUJFpmhCGS', 'A', '2023-06-14 16:14:35', NULL, 3, 155, 9, '1005484152'),
(156, 'Santo', 'Santiago', 'Ortega', '$2y$10$ydTPILE5ZZXf4coRicEHKODRq6HxnWo8kKrI1Aa68n30z34Cnrjwy', 'A', '2023-06-14 16:14:35', NULL, 3, 156, 9, '1005484152'),
(157, 'Santo', 'Santiago', 'Ortega', '$2y$10$nMmyQoYXA4zqOfOFxxS/Y.R0gHq5aHqbwtZC1h8i5P6QMefUx.xb2', 'A', '2023-06-14 16:14:35', NULL, 3, 157, 9, '1005484152'),
(158, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZXGwridWsHUgZ0nKizNgL.eEopWi2oi/LCD7LJEdiM/4wEIFQWJim', 'A', '2023-06-14 16:14:35', NULL, 3, 158, 9, '1005484152'),
(159, 'Santo', 'Santiago', 'Ortega', '$2y$10$JuxQlYNLViB/uMG06dfJSuzd3d9xKELWUj71osKQpH.gpec5FK0I2', 'A', '2023-06-14 16:14:35', NULL, 3, 159, 9, '1005484152'),
(160, 'Santo', 'Santiago', 'Ortega', '$2y$10$Az/NYHWRJyPodVF90YONw.IpRVoJc.RSrCJWqOjfZHtfOVcJPj5LG', 'A', '2023-06-14 16:14:35', NULL, 3, 160, 9, '1005484152'),
(161, 'Santo', 'Santiago', 'Ortega', '$2y$10$TlNd9.rJFhiqtK0rPq2GoudsFVr/W8XfEW.hZoziqW0kiCywDrmI2', 'A', '2023-06-14 16:14:35', NULL, 3, 161, 9, '1005484152'),
(162, 'Santo', 'Santiago', 'Ortega', '$2y$10$OhzvxwIo04LNqJOsvEYakOyPNSqrkBRAFk4C8YN/eU9DiAoNPmupO', 'A', '2023-06-14 16:14:35', NULL, 3, 162, 9, '1005484152'),
(163, 'Santo', 'Santiago', 'Ortega', '$2y$10$Ia1D0pkB5/mrUhm9x9wE7edgbi66UESVgNgCAt7G9j1hSvtv5g.wq', 'A', '2023-06-14 16:14:35', NULL, 3, 163, 9, '1005484152'),
(164, 'Santo', 'Santiago', 'Ortega', '$2y$10$eh.pmlDA.3/QLZgLlbCw9.vZ3uIDj3L5DDBjzeYOFvEWRzDAetXi2', 'A', '2023-06-14 16:14:35', NULL, 3, 164, 9, '1005484152'),
(165, 'Santo', 'Santiago', 'Ortega', '$2y$10$c7OmlvZrCq3FisTJ6Daqru2omjxb9d87sOLDguIVw2b7LqgnmoRpm', 'A', '2023-06-14 16:14:35', NULL, 3, 165, 9, '1005484152'),
(166, 'Santo', 'Santiago', 'Ortega', '$2y$10$F/sZSzIz62UYYiqx.URqVerSXygmmU5NEPfjlpgVcAzbxVyLHOaYW', 'A', '2023-06-14 16:14:35', NULL, 3, 166, 9, '1005484152'),
(167, 'Santo', 'Santiago', 'Ortega', '$2y$10$xa7fsxi1Wl7dLPOKCW48hu9QMBJlprWi/NXo1dS95BRqm.xYTHCXa', 'A', '2023-06-14 16:14:35', NULL, 3, 167, 9, '1005484152'),
(168, 'Santo', 'Santiago', 'Ortega', '$2y$10$BTc0RPE1VYwVE1WRqtziMeP3LJYLTVBRgXO9NmDycLAtQU/CBS87G', 'A', '2023-06-14 16:14:35', NULL, 3, 168, 9, '1005484152'),
(169, 'Santo', 'Santiago', 'Ortega', '$2y$10$adZwy3bBO18ope6ydAgub.xyfF4yZHE1EgIRMLAFGr9JqfiNRliQC', 'A', '2023-06-14 16:14:35', NULL, 3, 169, 9, '1005484152'),
(170, 'Santo', 'Santiago', 'Ortega', '$2y$10$LA456bz/sb1UrRBYauk7zOVAu6zLhPEzOhPyeB6T8iw8jVoSqO7b.', 'A', '2023-06-14 16:14:35', NULL, 3, 170, 9, '1005484152'),
(171, 'Santo', 'Santiago', 'Ortega', '$2y$10$eEuD5Hz0lz0uSw9KzDU/gOYOSm2ieFAZCCXL1xbHqxx43B5jk.V1O', 'A', '2023-06-14 16:14:35', NULL, 3, 171, 9, '1005484152'),
(172, 'Santo', 'Santiago', 'Ortega', '$2y$10$2SPUZd9Gkd7fC92BSY/Mtew9yBts7v1DfRinneufCBCh6zUxb6vqC', 'A', '2023-06-14 16:14:35', NULL, 3, 172, 9, '1005484152'),
(173, 'Santo', 'Santiago', 'Ortega', '$2y$10$QYawZgoujC/AmxxrdnYOR.bcZAkd.x96z0FKUyNOckDXYDUoCkPVS', 'A', '2023-06-14 16:14:35', NULL, 3, 173, 9, '1005484152'),
(174, 'Santo', 'Santiago', 'Ortega', '$2y$10$3.f/eCymEo/yxHYDSUwgAur6EiXf3f9b0Dz0yXoBEF.Pe4e6b8bV6', 'A', '2023-06-14 16:14:35', NULL, 3, 174, 9, '1005484152'),
(175, 'Santo', 'Santiago', 'Ortega', '$2y$10$6OnFiqkDU25EqaEstVrwiOD0qYlBcae7U8XBRW4IE5IphZlIFD6wW', 'A', '2023-06-14 16:14:35', NULL, 3, 175, 9, '1005484152'),
(176, 'Santo', 'Santiago', 'Ortega', '$2y$10$3TASBbEU8copo1p/VPwgd.LH3uWDpAxq40Cewa7fXhkrmFNcIlAVG', 'A', '2023-06-14 16:14:35', NULL, 3, 176, 9, '1005484152'),
(177, 'Santo', 'Santiago', 'Ortega', '$2y$10$B0sfIIT3x4nIg9d4V1P.vux7EeNxKGdzAvsqtda.rMBQ236E2erlm', 'A', '2023-06-14 16:14:35', NULL, 3, 177, 9, '1005484152'),
(178, 'Santo', 'Santiago', 'Ortega', '$2y$10$gx9aAsE7IUEft1NYUp9skugEmJzTWDLybadtNBBDa4rfDQxjAGS9S', 'A', '2023-06-14 16:14:35', NULL, 3, 178, 9, '1005484152'),
(179, 'Santo', 'Santiago', 'Ortega', '$2y$10$FgLgdlYEb7MfUEn1mpRmiOM7Ibo/PnmfoUAQ6NavCSTVOPty94poO', 'A', '2023-06-14 16:14:35', NULL, 3, 179, 9, '1005484152'),
(180, 'Santo', 'Santiago', 'Ortega', '$2y$10$ErgVnTjasfWE6eB8BAC.vOmzAoVd4vIefAGlEk3NN69Of.TTNchHy', 'A', '2023-06-14 16:14:35', NULL, 3, 180, 9, '1005484152'),
(181, 'Santo', 'Santiago', 'Ortega', '$2y$10$BiAayi7KcXPlQNZsFvd2euxUuwt.yC41wqvOwIBuOk5TGj4koBKNC', 'A', '2023-06-14 16:14:35', NULL, 3, 181, 9, '1005484152'),
(182, 'Santo', 'Santiago', 'Ortega', '$2y$10$4xQcrm3Z0vaUNTWBAbEzJuwohiMI6dWjn25X4j2U9bT4ZpVIqzIw2', 'A', '2023-06-14 16:14:35', NULL, 3, 182, 9, '1005484152'),
(183, 'Santo', 'Santiago', 'Ortega', '$2y$10$NCLrG.bTd0z81DEXwsCSxeoP1Nk2gDoUVrIchuh3ehIiHHYyekypy', 'A', '2023-06-14 16:14:35', NULL, 3, 183, 9, '1005484152'),
(184, 'Santo', 'Santiago', 'Ortega', '$2y$10$rTMeytar82VFP4mhXxmniOBHPIKZX0zZ/iSWdnTQF.z4KivmLcoZu', 'A', '2023-06-14 16:14:35', NULL, 3, 184, 9, '1005484152'),
(185, 'Santo', 'Santiago', 'Ortega', '$2y$10$Uup6Lao7ilOKP/wxP300euG3mu1SQo5ZnCgbG8hma4vSiwU8LdgQu', 'A', '2023-06-14 16:14:36', NULL, 3, 185, 9, '1005484152'),
(186, 'Santo', 'Santiago', 'Ortega', '$2y$10$ohlXOQQJhESj5TYPHH451ONQjfK5z.0XMwb2d8rlBCDC6j66lZ5sy', 'A', '2023-06-14 16:14:36', NULL, 3, 186, 9, '1005484152'),
(187, 'Santo', 'Santiago', 'Ortega', '$2y$10$YdvNVUJNE8xJG0qmeuiTjOlUo4fKrfYfkhjGs2owPBxBJZE5kfRq.', 'A', '2023-06-14 16:14:36', NULL, 3, 187, 9, '1005484152'),
(188, 'Santo', 'Santiago', 'Ortega', '$2y$10$xH8QxoHAbXS6NWt2/ZGOR.6WG5rE2VonXfv99GONEt/Kg0IX8iph6', 'A', '2023-06-14 16:14:36', NULL, 3, 188, 9, '1005484152'),
(189, 'Santo', 'Santiago', 'Ortega', '$2y$10$hQuANMa.il73QwnV7PpRX.1fQanRbWsCGk1syB13MyUTssN/SwwMW', 'A', '2023-06-14 16:14:36', NULL, 3, 189, 9, '1005484152'),
(190, 'Santo', 'Santiago', 'Ortega', '$2y$10$cLgJLD21YxSr5feaDfWJn.ROBR44aJRcKS1CuJfm1y2Vegba3ulNW', 'A', '2023-06-14 16:14:36', NULL, 3, 190, 9, '1005484152'),
(191, 'Santo', 'Santiago', 'Ortega', '$2y$10$aSOoJ/n2u7iOhh8qBZwoq.XmVTG3UqJu8s59UD0H/s6VfF5jEUO8m', 'A', '2023-06-14 16:14:36', NULL, 3, 191, 9, '1005484152'),
(192, 'Santo', 'Santiago', 'Ortega', '$2y$10$PpniHwQZ63h96oCjJ/RE8elrezcu8x9P/CVv8bw60lL0OKaQRxAKS', 'A', '2023-06-14 16:14:36', NULL, 3, 192, 9, '1005484152'),
(193, 'Santo', 'Santiago', 'Ortega', '$2y$10$8kTes/rUsoWA4LVQQMM1S.DsoGdsQRY3LO4tC.ly9Tl2dTdUInvuC', 'A', '2023-06-14 16:14:36', NULL, 3, 193, 9, '1005484152'),
(194, 'Santo', 'Santiago', 'Ortega', '$2y$10$pOPo7AN6crdG8.get/jsWO97ejVrqgY/XkxKWpX2k3Yz6u.KrcD1i', 'A', '2023-06-14 16:14:36', NULL, 3, 194, 9, '1005484152'),
(195, 'Santo', 'Santiago', 'Ortega', '$2y$10$BsU3f7RD3/H5AjmMpWWRBu05tOYZwDi0aTfikJfrNJrsh1Y.qLXve', 'A', '2023-06-14 16:14:36', NULL, 3, 195, 9, '1005484152'),
(196, 'Santo', 'Santiago', 'Ortega', '$2y$10$bOvYVGwsG92Uxk1IDeQL7O1QZmXY3Rx30gzYU8Ed0vl7lmVV7LWTy', 'A', '2023-06-14 16:14:36', NULL, 3, 196, 9, '1005484152'),
(197, 'Santo', 'Santiago', 'Ortega', '$2y$10$sdk1R2DHPLjCJWesPdixmeF5ZgY2JW0DMLsxyVfbVbMqMEFH7A19K', 'A', '2023-06-14 16:14:36', NULL, 3, 197, 9, '1005484152'),
(198, 'Santo', 'Santiago', 'Ortega', '$2y$10$UUdWNioQQ1OeroQVXPnlkuP26f9Uk/ATU1grQSdj3EVb4XQ6zCacC', 'A', '2023-06-14 16:14:36', NULL, 3, 198, 9, '1005484152'),
(199, 'Santo', 'Santiago', 'Ortega', '$2y$10$8WVWMG4z9j5ptHbqX9W7be/xihWxGlawpOA3vMsAkVI/qL8I7rmbm', 'A', '2023-06-14 16:14:36', NULL, 3, 199, 9, '1005484152'),
(200, 'Santo', 'Santiago', 'Ortega', '$2y$10$x1Lxyw7bLNHO4ECgtCvqROlnb1q5Y0QzPSQUVmxJ6di2nzmWePgr.', 'A', '2023-06-14 16:14:36', NULL, 3, 200, 9, '1005484152'),
(201, 'Santo', 'Santiago', 'Ortega', '$2y$10$derw0jH0sXYgaToSeMB4FeRXesSSCQ6I/EGuv.oIdVSpwfKN0EQFW', 'A', '2023-06-14 16:14:36', NULL, 3, 201, 9, '1005484152'),
(202, 'Santo', 'Santiago', 'Ortega', '$2y$10$Mx253VLhqaXVRX94gJXe4.e//JfSZrrPI0HZMAxQD9kMP2VK1l6pi', 'A', '2023-06-14 16:14:36', NULL, 3, 202, 9, '1005484152'),
(203, 'Santo', 'Santiago', 'Ortega', '$2y$10$RsHU1iPIoVntDI36UEzrN.Eb.jG.2exJWMOjOFGNzxJVBguPqb4ky', 'A', '2023-06-14 16:14:36', NULL, 3, 203, 9, '1005484152'),
(204, 'Santo', 'Santiago', 'Ortega', '$2y$10$JsR4UkgQa.w8bE3GKolH6.SmEM.AXYGmZ1T/J/O0YsiShwcWMARyq', 'A', '2023-06-14 16:14:36', NULL, 3, 204, 9, '1005484152'),
(205, 'Santo', 'Santiago', 'Ortega', '$2y$10$8LqKq00XFgekPaPYKlJ59.ZkCg0t1pnzrc/CCMRFvtwawvgtFdF2i', 'A', '2023-06-14 16:14:36', NULL, 3, 205, 9, '1005484152'),
(206, 'Santo', 'Santiago', 'Ortega', '$2y$10$BcWqNdvsqPo9RXyApTPz4.nWk6odQJpz9gaWDk6WV6tW2J5OMhdxm', 'A', '2023-06-14 16:14:36', NULL, 3, 206, 9, '1005484152'),
(207, 'Santo', 'Santiago', 'Ortega', '$2y$10$XiM81qfJZH9ZXMdRDOAkTuC/js02bLJGLRDZDpPr1l0jtyk.GkT1S', 'A', '2023-06-14 16:14:36', NULL, 3, 207, 9, '1005484152'),
(208, 'Santo', 'Santiago', 'Ortega', '$2y$10$ndvXbLicUp0LkRyZPcFYcedhm84SjVm2AHAFUoiNyiFL.NxR0dCw6', 'A', '2023-06-14 16:14:36', NULL, 3, 208, 9, '1005484152'),
(209, 'Santo', 'Santiago', 'Ortega', '$2y$10$z5AHCL8mdXxQd9CTs75nBe4IJ6EmK5p.v0G5IIECAxmAuuanrOsX6', 'A', '2023-06-14 16:14:36', NULL, 3, 209, 9, '1005484152'),
(210, 'Santo', 'Santiago', 'Ortega', '$2y$10$Z8OMkqxIbjFhE95MR1v2NO9useWIrYUEWRRsQF.qkoa3kkwD5i/uC', 'A', '2023-06-14 16:14:36', NULL, 3, 210, 9, '1005484152'),
(211, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZbPayzizK6DiKpyY6e9mueyTeY1rKUV7.CERfDUgWqR1YgDAqolKi', 'A', '2023-06-14 16:14:36', NULL, 3, 211, 9, '1005484152'),
(212, 'Santo', 'Santiago', 'Ortega', '$2y$10$WSwtkIW5dqAVqnES29ALhOggUYZCai4zB/CEVZwRWZ7u58Dc23Xwq', 'A', '2023-06-14 16:14:36', NULL, 3, 212, 9, '1005484152'),
(213, 'Santo', 'Santiago', 'Ortega', '$2y$10$hix3mOUA01IMuRKGlrVWMuOh1Gf.ard9/p3e/7VDM8P4XRMhccm4e', 'A', '2023-06-14 16:14:36', NULL, 3, 213, 9, '1005484152'),
(214, 'Santo', 'Santiago', 'Ortega', '$2y$10$sRpHcAEkGkXyGWRCDwMaHen9cdEiAcwNqwklfvZokyVxtxEpra9hO', 'A', '2023-06-14 16:14:36', NULL, 3, 214, 9, '1005484152'),
(215, 'Santo', 'Santiago', 'Ortega', '$2y$10$M4EhE2JS2eVL8zg7xBs0x.w6XZ3owVirXuFAfgRRy/b2veQsMcHFK', 'A', '2023-06-14 16:14:36', NULL, 3, 215, 9, '1005484152'),
(216, 'Santo', 'Santiago', 'Ortega', '$2y$10$kuWvlnBMUtbQAktTIyR2WewHHuVrqNNh1KyMzjlN/JjDuHHhlRMza', 'A', '2023-06-14 16:14:36', NULL, 3, 216, 9, '1005484152'),
(217, 'Santo', 'Santiago', 'Ortega', '$2y$10$Z5ejH57ZU8Yd1Di.kPaLTOLPk/BQuFy/8/OySr4/4Gsob1.w4112u', 'A', '2023-06-14 16:14:36', NULL, 3, 217, 9, '1005484152'),
(218, 'Santo', 'Santiago', 'Ortega', '$2y$10$Vuuyv//sucKUg4eiT.JSIeP7ypt3FhqECsjijDWwQFdKgj951b1MO', 'A', '2023-06-14 16:14:37', NULL, 3, 218, 9, '1005484152'),
(219, 'Santo', 'Santiago', 'Ortega', '$2y$10$pieQLcFTlM1yJYhgmao/K.9Fw5Fcv6z93iOh7S7EDNm/FGN2cj92u', 'A', '2023-06-14 16:14:36', NULL, 3, 219, 9, '1005484152'),
(220, 'Santo', 'Santiago', 'Ortega', '$2y$10$U6Q4XXMM/O.fr1c2EvW9CuUXL4QgSJSlFFlxaqFQeiMzomZ4H.v9S', 'A', '2023-06-14 16:14:36', NULL, 3, 220, 9, '1005484152'),
(221, 'Santo', 'Santiago', 'Ortega', '$2y$10$cFj7SWdYMRjl/l5dr8bgTO.u7FK0HC2su2Ri7OwSKXrBCNyVW/EN6', 'A', '2023-06-14 16:14:37', NULL, 3, 221, 9, '1005484152'),
(222, 'Santo', 'Santiago', 'Ortega', '$2y$10$SMvATnkBJb2ubZ7wYouObO.9P39wqA7fWfS..rUO5JIr3OR7wU.3G', 'A', '2023-06-14 16:14:37', NULL, 3, 222, 9, '1005484152'),
(223, 'Santo', 'Santiago', 'Ortega', '$2y$10$pbKDk4Uy4Ql46sEJImh73uOMSxO2vXD7dwvjFDQk8ncpvbEGNfciO', 'A', '2023-06-14 16:14:36', NULL, 3, 223, 9, '1005484152'),
(224, 'Santo', 'Santiago', 'Ortega', '$2y$10$JQsXlOsKMBaCbvPH5IkNmeTVrTPhX.xZQ3Lsk8GkDIj3/63AKMqXG', 'A', '2023-06-14 16:14:36', NULL, 3, 224, 9, '1005484152'),
(225, 'Santo', 'Santiago', 'Ortega', '$2y$10$UVEv/gnA9y0cL9qYT8cdt.jQFJ4COQxTSe86hXfws/vIx/e8RSAK2', 'A', '2023-06-14 16:14:36', NULL, 3, 225, 9, '1005484152'),
(226, 'Santo', 'Santiago', 'Ortega', '$2y$10$4/pAHHS7Blc2LAhcS5mGTumfpttk3PGTJ6FZXNNHWYjdDKZQ0DnLG', 'A', '2023-06-14 16:14:37', NULL, 3, 226, 9, '1005484152'),
(227, 'Santo', 'Santiago', 'Ortega', '$2y$10$YBp9mPlVIYUr1Am7e6JXUOxSvX8OYt6ZvfcutJlSU8Vs8xwYIKj9y', 'A', '2023-06-14 16:14:37', NULL, 3, 227, 9, '1005484152'),
(228, 'Santo', 'Santiago', 'Ortega', '$2y$10$2FbNfY3fTIhrCSIBGOTRIukAhehu.OGOMgIc2plt8R.BEkDvsle5K', 'A', '2023-06-14 16:14:37', NULL, 3, 228, 9, '1005484152'),
(229, 'Santo', 'Santiago', 'Ortega', '$2y$10$zrrWKY7J5s5MfaPOt1GZfuVruCPo7TNV9heYHUDXvzp7aVJikhnmm', 'A', '2023-06-14 16:14:37', NULL, 3, 229, 9, '1005484152'),
(230, 'Santo', 'Santiago', 'Ortega', '$2y$10$cCUxAsyp5Sq/h/PVj3QKiuKhocLG5hZPhM6sR.WtM6dRIn9nd2LaO', 'A', '2023-06-14 16:14:37', NULL, 3, 230, 9, '1005484152'),
(231, 'Santo', 'Santiago', 'Ortega', '$2y$10$w6nL4sXSLY1y2rJbsuFBIuifyYWNHPfo6rbkOPh3cAhZ5rSHCQdqq', 'A', '2023-06-14 16:14:37', NULL, 3, 231, 9, '1005484152'),
(232, 'Santo', 'Santiago', 'Ortega', '$2y$10$OTyxhTIE5ruqkBo4/ueUE.RBjNe8hrkw2Wb6kOZi2VLVw1yaqz6cW', 'A', '2023-06-14 16:14:37', NULL, 3, 232, 9, '1005484152'),
(233, 'Santo', 'Santiago', 'Ortega', '$2y$10$uxMEF06ro2zOyxinZ6l5bOu.LlmEcJovJnsTy/KMsPraIqv.4TLze', 'A', '2023-06-14 16:14:37', NULL, 3, 233, 9, '1005484152'),
(234, 'Santo', 'Santiago', 'Ortega', '$2y$10$AVXJrfNKTVBRRJpVJb36oONA/QoetJ5X30RuICSvdEAf43Q5VhgRe', 'A', '2023-06-14 16:14:37', NULL, 3, 234, 9, '1005484152'),
(235, 'Santo', 'Santiago', 'Ortega', '$2y$10$JVfvg6PcyZPSgqvn.X7Nu.hOoXLZkAJbLeoPEa1qQ1bF7ULDSpwBm', 'A', '2023-06-14 16:14:37', NULL, 3, 235, 9, '1005484152'),
(236, 'Santo', 'Santiago', 'Ortega', '$2y$10$83GYn.PaZ4rPzAZhRyvKe.4kmYHKcVqWQyBURtpqpuky5/PbejElG', 'A', '2023-06-14 16:14:37', NULL, 3, 236, 9, '1005484152'),
(237, 'Santo', 'Santiago', 'Ortega', '$2y$10$j7d3neqjaX5ov66FVrv40O/o73lOhD5NmSStW/i2X3cPVMFAZVDdq', 'A', '2023-06-14 16:14:37', NULL, 3, 237, 9, '1005484152'),
(238, 'Santo', 'Santiago', 'Ortega', '$2y$10$iX/rrBL/S4UGFbdlb1sjHuDwkiBCUaLBwCTOCsh0f9FFX5vyyQOG6', 'A', '2023-06-14 16:14:37', NULL, 3, 238, 9, '1005484152'),
(239, 'Santo', 'Santiago', 'Ortega', '$2y$10$hrVLWddgzS5RPaVBwSpjm.Bsh267lmyAyOjjrAjQD1QZkrjpRFBee', 'A', '2023-06-14 16:14:37', NULL, 3, 239, 9, '1005484152'),
(240, 'Santo', 'Santiago', 'Ortega', '$2y$10$dxS90i1ISJWFE9J8xRqd2u8GcksbsEw/OGIIYdERjc6u81XhToKUu', 'A', '2023-06-14 16:14:37', NULL, 3, 240, 9, '1005484152'),
(241, 'Santo', 'Santiago', 'Ortega', '$2y$10$PDnS5COIzyo9L9VtIR3l5OwEzvaqY06ujG0UrFHqDGum7.OrRhJFC', 'A', '2023-06-14 16:14:37', NULL, 3, 241, 9, '1005484152'),
(242, 'Santo', 'Santiago', 'Ortega', '$2y$10$QPSKYA0sWKILl9.yv6AsD.ezBI6erReKs6EWreq3G5pjFn6IBzt8W', 'A', '2023-06-14 16:14:37', NULL, 3, 242, 9, '1005484152'),
(243, 'Santo', 'Santiago', 'Ortega', '$2y$10$4YkSwYFSFO0EZOOOqjfts.tqXekVCZyBOyiIbrsHi3sejvHmxoTHi', 'A', '2023-06-14 16:14:37', NULL, 3, 243, 9, '1005484152'),
(244, 'Santo', 'Santiago', 'Ortega', '$2y$10$78pg8KpuPUOk.kivThq7R.41HyUrOWGCWMhEfhcIy2ZhPUFwMJZa6', 'A', '2023-06-14 16:14:37', NULL, 3, 244, 9, '1005484152'),
(245, 'Santo', 'Santiago', 'Ortega', '$2y$10$S28FVjdwIyzBnGRnf4y0nOfZr9fQ0kTd7ZaPVCBxLod9k8OmdLWLe', 'A', '2023-06-14 16:14:37', NULL, 3, 245, 9, '1005484152'),
(246, 'Santo', 'Santiago', 'Ortega', '$2y$10$m9Qir6YpTbzBqLkxQV/.D.IpPyweG5ePvE0CRMhpDK4iTMee/LIYG', 'A', '2023-06-14 16:14:37', NULL, 3, 246, 9, '1005484152'),
(247, 'Santo', 'Santiago', 'Ortega', '$2y$10$89MWGxgj5MqwWfzuIvW0UeFGHTsZKbumiUqxfTviXB6lPFbkTSABi', 'A', '2023-06-14 16:14:37', NULL, 3, 247, 9, '1005484152'),
(248, 'Santo', 'Santiago', 'Ortega', '$2y$10$jbwt7KRDKZSOB3HSby0lA.QntEmbnZg31H4/IPlSuSJDVSUtTBtO.', 'A', '2023-06-14 16:14:38', NULL, 3, 248, 9, '1005484152'),
(249, 'Santo', 'Santiago', 'Ortega', '$2y$10$o7Okd/uMAoBKAE4ouygxue/5NjVTLqS4AAXzbe1ULCOzpgrNwH7da', 'A', '2023-06-14 16:14:37', NULL, 3, 249, 9, '1005484152'),
(250, 'Santo', 'Santiago', 'Ortega', '$2y$10$IDYFljqIj1IBVitno/lCF.RYqsBtnNc5U6fVUtOicFi6ipFHaLJj.', 'A', '2023-06-14 16:14:38', NULL, 3, 250, 9, '1005484152'),
(251, 'Santo', 'Santiago', 'Ortega', '$2y$10$suJPuhlbj9SV/vJ6t./lfuUKZFh/B/.nR3RO87XXF.notD2m6COIS', 'A', '2023-06-14 16:14:38', NULL, 3, 251, 9, '1005484152'),
(252, 'Santo', 'Santiago', 'Ortega', '$2y$10$YsgB/H5.aXiGF4POWCdJO.ZTwJ6fI7nJnzAKVuHeblj1XGZG2R6MS', 'A', '2023-06-14 16:14:38', NULL, 3, 252, 9, '1005484152'),
(253, 'Santo', 'Santiago', 'Ortega', '$2y$10$BP2FQ4UPSjF0MHfu0/Eji.7FSCTowjLOLrlonG0OeEhq/HICEV4rm', 'A', '2023-06-14 16:14:38', NULL, 3, 253, 9, '1005484152'),
(254, 'Santo', 'Santiago', 'Ortega', '$2y$10$6OUQl2cUvItDPMgYs0IjZO4GQNHZLO7drVLZB/2nXXbU3CjDEKU3G', 'A', '2023-06-14 16:14:38', NULL, 3, 254, 9, '1005484152'),
(255, 'Santo', 'Santiago', 'Ortega', '$2y$10$qKZRcVjGc1jZByLNlICr2OhBN83AgOlcu4npcrN5PJ.0ijrcptwmS', 'A', '2023-06-14 16:14:38', NULL, 3, 255, 9, '1005484152'),
(256, 'Santo', 'Santiago', 'Ortega', '$2y$10$aQP0r26aDiYy2PSI6z6ubeqhaw/9uTizw5/CQkGCXnOOHbjagkcsq', 'A', '2023-06-14 16:14:38', NULL, 3, 256, 9, '1005484152'),
(257, 'Santo', 'Santiago', 'Ortega', '$2y$10$BEKDSgnmJr.dkzDK9DyFS.19oBZsObzm0D7fA2fg0Uxmr39yVF0dW', 'A', '2023-06-14 16:14:38', NULL, 3, 257, 9, '1005484152'),
(258, 'Santo', 'Santiago', 'Ortega', '$2y$10$Pqsmig2V.56l7nUd9rFj0.jHrLdF1rpmzF/KlM4ATxjIOUE69ZMd6', 'A', '2023-06-14 16:14:38', NULL, 3, 258, 9, '1005484152'),
(259, 'Santo', 'Santiago', 'Ortega', '$2y$10$cMbFU5Twqh2SuBFrvkyAh.rKfgbFmgyr8UdljS3tSMtA5I5hYqKG2', 'A', '2023-06-14 16:14:38', NULL, 3, 259, 9, '1005484152'),
(260, 'Santo', 'Santiago', 'Ortega', '$2y$10$NbMEd8hYV6BIjVDhb0IBxuK1l3lGGU/5wuXBG/Pk0WOuBzM46UfP2', 'A', '2023-06-14 16:14:38', NULL, 3, 260, 9, '1005484152'),
(261, 'Santo', 'Santiago', 'Ortega', '$2y$10$7PjeBVfMav8KGD.isKYJs.VSeRxGdj7r2o7uYyDLe3dsT2MjMOFly', 'A', '2023-06-14 16:14:38', NULL, 3, 261, 9, '1005484152'),
(262, 'Santo', 'Santiago', 'Ortega', '$2y$10$Lv/kFypQQqrTd1k4iRGaCemv4wOrQ5Stqj20xOlhUJHz8ld61B5om', 'A', '2023-06-14 16:14:38', NULL, 3, 262, 9, '1005484152'),
(263, 'Santo', 'Santiago', 'Ortega', '$2y$10$91MSuOpPtkZBTBwf/LHVjeX2tF41iUhDXpdaj7KJK56LTc/WKtFgW', 'A', '2023-06-14 16:14:38', NULL, 3, 263, 9, '1005484152'),
(264, 'Santo', 'Santiago', 'Ortega', '$2y$10$mjcI/ieTpMdcL8W.waUNfuL6VGe/iLbH8Sebk9mu0eWbb8eRj1tyG', 'A', '2023-06-14 16:14:38', NULL, 3, 264, 9, '1005484152'),
(265, 'Santo', 'Santiago', 'Ortega', '$2y$10$EkLusWQVHHLL3T8Eus6oee58Ah.nzqBihmC0utGSnhmFYftohpDPK', 'A', '2023-06-14 16:14:38', NULL, 3, 265, 9, '1005484152'),
(266, 'Santo', 'Santiago', 'Ortega', '$2y$10$cjHpT8b9Jwfj.ZoQmyk4OeJQWo81d0gyFEz4KoRyg1Kw/gfOksdLy', 'A', '2023-06-14 16:14:38', NULL, 3, 266, 9, '1005484152'),
(267, 'Santo', 'Santiago', 'Ortega', '$2y$10$Y2whL.puA0IJyKeR./.sXuQ8UDSa6Mau9wkpBKndOJE7.Km1vjrlu', 'A', '2023-06-14 16:14:38', NULL, 3, 267, 9, '1005484152'),
(268, 'Santo', 'Santiago', 'Ortega', '$2y$10$LHauQ.rZ6f0oSE4jwuUe6u.MtbVbZwoUYeONI6bzxX9ejFeIEkRR6', 'A', '2023-06-14 16:14:38', NULL, 3, 268, 9, '1005484152'),
(269, 'Santo', 'Santiago', 'Ortega', '$2y$10$3094kCrAheImYJol0jlGaOCSz4bMG8IoKeomzbnq9LF3agBnttZ5u', 'A', '2023-06-14 16:14:38', NULL, 3, 269, 9, '1005484152'),
(270, 'Santo', 'Santiago', 'Ortega', '$2y$10$KN.TtXT/S5zkcclFBJhMzuN8iIFf/rpuO.1slb.iMJaokLjVESkoe', 'A', '2023-06-14 16:14:38', NULL, 3, 270, 9, '1005484152'),
(271, 'Santo', 'Santiago', 'Ortega', '$2y$10$ttvaufaUvlPfQaubkc8bSuJ7eQmL.qV008gZnhP51qFHfC2tXP7qe', 'A', '2023-06-14 16:14:38', NULL, 3, 271, 9, '1005484152'),
(272, 'Santo', 'Santiago', 'Ortega', '$2y$10$0nOVHUc.EG0FDdoGWxLNvuseM2/gjIXPygJrpaDC5tqsAFfBuFxBi', 'A', '2023-06-14 16:14:38', NULL, 3, 272, 9, '1005484152'),
(273, 'Santo', 'Santiago', 'Ortega', '$2y$10$M5pXKm0.hwFXEKVrS6ns7.OJOXpsH0OejuP2ZI0QDk3hbgF/NkKS.', 'A', '2023-06-14 16:14:38', NULL, 3, 273, 9, '1005484152'),
(274, 'Santo', 'Santiago', 'Ortega', '$2y$10$FVDcAIxrJf4dQ7gkKTy.QOrtl2t2jnSD8yhNC71u/9aS//LxH0bKG', 'A', '2023-06-14 16:14:38', NULL, 3, 274, 9, '1005484152'),
(275, 'Santo', 'Santiago', 'Ortega', '$2y$10$DQWZ3tA9JiTfwPH/OW6neO5cvuhuml1II.4ts6afbxkwrlgIL6XGa', 'A', '2023-06-14 16:14:38', NULL, 3, 275, 9, '1005484152'),
(276, 'Santo', 'Santiago', 'Ortega', '$2y$10$g4eFWhTR.isy.Y0QanJVqOXip8tdJ/h8W7m/oSA/ps.Fr.i8g2gi2', 'A', '2023-06-14 16:14:38', NULL, 3, 276, 9, '1005484152'),
(277, 'Santo', 'Santiago', 'Ortega', '$2y$10$MdCt3kkYx8QDdKvV.KjPSeBg0QQdIM3IbGKM3/kQZ2M0VFLnmfb4K', 'A', '2023-06-14 16:14:38', NULL, 3, 277, 9, '1005484152'),
(278, 'Santo', 'Santiago', 'Ortega', '$2y$10$/L/IsHUaLajvVUcFJlGTwuJ0am83gY./WTl8OIiFkjtiJZroG3OZm', 'A', '2023-06-14 16:14:38', NULL, 3, 278, 9, '1005484152'),
(279, 'Santo', 'Santiago', 'Ortega', '$2y$10$W7AWkvnKU6kNFUepmX8NA.IBwPS/IVFTLqxW0ZGBqli/guEyYbovu', 'A', '2023-06-14 16:14:38', NULL, 3, 279, 9, '1005484152'),
(280, 'Santo', 'Santiago', 'Ortega', '$2y$10$Jc9/YMhCX8pki3QD0y76leH1xjoGRQlaLyOO9ONFr4R88NkiYTtEa', 'A', '2023-06-14 16:14:38', NULL, 3, 280, 9, '1005484152'),
(281, 'Santo', 'Santiago', 'Ortega', '$2y$10$yAGMrbDLEpttb7pMmlkTZOviEcUdjc/5bS43KV5XwSg9ulBaPekT2', 'A', '2023-06-14 16:14:38', NULL, 3, 281, 9, '1005484152'),
(282, 'Santo', 'Santiago', 'Ortega', '$2y$10$sHRVj//5MB0gGHiXNg8WMO7jAHQ3UvSpF6za1S2r0UtmTv/j0Ll.W', 'A', '2023-06-14 16:14:38', NULL, 3, 282, 9, '1005484152'),
(283, 'Santo', 'Santiago', 'Ortega', '$2y$10$tooYbvZuScR4ahg2Gt78HuNmLXXKJGwnypO5Y0EFAlQgD90CRBwDa', 'A', '2023-06-14 16:14:38', NULL, 3, 283, 9, '1005484152'),
(284, 'Santo', 'Santiago', 'Ortega', '$2y$10$tVhne.OhOJ1XYtrRgqMPQuz2WcM.Fp0oedh1qYo41h/n7IPmWTpNC', 'A', '2023-06-14 16:14:38', NULL, 3, 284, 9, '1005484152'),
(285, 'Santo', 'Santiago', 'Ortega', '$2y$10$bqcSILl9oYh5XdnCWZimkebcr4qSMpb8qo.Qq93dcBcO648wt3n6a', 'A', '2023-06-14 16:14:38', NULL, 3, 285, 9, '1005484152'),
(286, 'Santo', 'Santiago', 'Ortega', '$2y$10$a6754wABU5p0ocuOsWNlMuzL/yDMcAFBglCuRnt3AfAroY59Yx2IS', 'A', '2023-06-14 16:14:38', NULL, 3, 286, 9, '1005484152'),
(287, 'Santo', 'Santiago', 'Ortega', '$2y$10$hZaaR5dXDbyCafpatBxVDOqtkzeiWBH1C9zpvYCT6Mt63Syld0TiK', 'A', '2023-06-14 16:14:38', NULL, 3, 287, 9, '1005484152'),
(288, 'Santo', 'Santiago', 'Ortega', '$2y$10$YwByS3bCMLFjb0s0bUJ3vOiAS7LUrwE/qBjYzzFD7Z1x.Ay..UbTy', 'A', '2023-06-14 16:14:39', NULL, 3, 288, 9, '1005484152'),
(289, 'Santo', 'Santiago', 'Ortega', '$2y$10$dWK.eYFlPOtdL4JBhotus.Dj3OEhCt47lVIIDyHXfnYERmw0nMrr.', 'A', '2023-06-14 16:14:38', NULL, 3, 289, 9, '1005484152'),
(290, 'Santo', 'Santiago', 'Ortega', '$2y$10$bqt.0ZMTAGLje3i0c/peluI1656HiDSt60DJNkwPLNJZPFOjyA56e', 'A', '2023-06-14 16:14:38', NULL, 3, 290, 9, '1005484152'),
(291, 'Santo', 'Santiago', 'Ortega', '$2y$10$rq5pS76Rj3rY65peztEjnOPs4Z3xHpsvUyohil7BAX1sgBLOTgsOO', 'A', '2023-06-14 16:14:38', NULL, 3, 291, 9, '1005484152'),
(292, 'Santo', 'Santiago', 'Ortega', '$2y$10$c/dPtGFarjauZ8fVh9ZIGOgQoPlUz66mUmbv/Y6AbH0ppuQXUIhd6', 'A', '2023-06-14 16:14:38', NULL, 3, 292, 9, '1005484152'),
(293, 'Santo', 'Santiago', 'Ortega', '$2y$10$1/ikaZwhQH.Qs7LNDDKMIuHyiBEVX34v5k57yrdJGQCd0hUjaDXk2', 'A', '2023-06-14 16:14:38', NULL, 3, 293, 9, '1005484152'),
(294, 'Santo', 'Santiago', 'Ortega', '$2y$10$QCC33tQKA/S97xElYqABauU9Iu4QUVWhHYEaO.32lMYzgsnMoWKDu', 'A', '2023-06-14 16:14:39', NULL, 3, 294, 9, '1005484152'),
(295, 'Santo', 'Santiago', 'Ortega', '$2y$10$H4nESHnkN/HR0Lexk/F5VueUlCQPXGSDXKHDTclCScr/euOHn/qqa', 'A', '2023-06-14 16:14:38', NULL, 3, 295, 9, '1005484152'),
(296, 'Santo', 'Santiago', 'Ortega', '$2y$10$rGwmupaMp5zC58beEtrzee4K8xz0kS7uA8Dc22Z49Uf9X18A3Iopy', 'A', '2023-06-14 16:14:38', NULL, 3, 296, 9, '1005484152'),
(297, 'Santo', 'Santiago', 'Ortega', '$2y$10$kQudvgyXpCwI08u7cNzgUOa121cEAL8/fCI0JW1sOB6bMvbbi8Ti2', 'A', '2023-06-14 16:14:38', NULL, 3, 297, 9, '1005484152'),
(298, 'Santo', 'Santiago', 'Ortega', '$2y$10$5JFQ.LzgIyUNrpdLy.O9euqOJDzpAgueiSLChTMhdQDWzat4bNJkq', 'A', '2023-06-14 16:14:38', NULL, 3, 298, 9, '1005484152'),
(299, 'Santo', 'Santiago', 'Ortega', '$2y$10$ovWhL7n7NsIVfhSgSRspi.IaNh3wiYjJzvIX2lx8cL8e5DVx7Qwku', 'A', '2023-06-14 16:14:39', NULL, 3, 299, 9, '1005484152'),
(300, 'Santo', 'Santiago', 'Ortega', '$2y$10$gNSBwTFDidi6jXDoaPXmhe1jr1pq.8/hXmI0zk9FSd7L9MyUjdHvW', 'A', '2023-06-14 16:14:39', NULL, 3, 300, 9, '1005484152'),
(301, 'Santo', 'Santiago', 'Ortega', '$2y$10$tzQ52WW9JGyzfaPtzmxpzeQbCXhEODGg/NzK/MrhhdW51oUeembr.', 'A', '2023-06-14 16:14:39', NULL, 3, 301, 9, '1005484152'),
(302, 'Santo', 'Santiago', 'Ortega', '$2y$10$0YIruPiqBw4S/B9RPlKhd.J.n9ebK0lwzun4YEw9CBap7ha2ZyvU.', 'A', '2023-06-14 16:14:39', NULL, 3, 302, 9, '1005484152'),
(303, 'Santo', 'Santiago', 'Ortega', '$2y$10$.lWTJVVGF79f7tYJ5XH1n.ZwNntjNvVBqVXlCt0imQPHloC7AqDdO', 'A', '2023-06-14 16:14:39', NULL, 3, 303, 9, '1005484152'),
(304, 'Santo', 'Santiago', 'Ortega', '$2y$10$xGQTpNUazEa35oT9qPvnPOAboRCdJmYXEefnM9qMNd1KrJ/ZtsHTm', 'A', '2023-06-14 16:14:39', NULL, 3, 304, 9, '1005484152'),
(305, 'Santo', 'Santiago', 'Ortega', '$2y$10$sM735LkcBCSt/uHiFb/9ZO23yGcIbEpUc/Z4cdxOcXB1W98Tm8tui', 'A', '2023-06-14 16:14:39', NULL, 3, 305, 9, '1005484152'),
(306, 'Santo', 'Santiago', 'Ortega', '$2y$10$JCggWipKZCmT3m6q5MwkqubAuH8R0ilwHzsnlKYP.CU8CdZ8ndO0a', 'A', '2023-06-14 16:14:39', NULL, 3, 306, 9, '1005484152'),
(307, 'Santo', 'Santiago', 'Ortega', '$2y$10$mLSCT6PZD1uHxtzAe4cnDOnizt78K.rb2p9LgXhYK4ezfebDUWiC2', 'A', '2023-06-14 16:14:39', NULL, 3, 307, 9, '1005484152'),
(308, 'Santo', 'Santiago', 'Ortega', '$2y$10$MgWsRU6GaJHafwwP3.YTtO9hJo2W6BWuVlyFe0sQ9Y.Fj0eXx9H06', 'A', '2023-06-14 16:14:39', NULL, 3, 308, 9, '1005484152'),
(309, 'Santo', 'Santiago', 'Ortega', '$2y$10$LOLUILjkfZ9WU428P2rUcObRiGzki4niTcbyJ.FN5HUva9CXTARrC', 'A', '2023-06-14 16:14:39', NULL, 3, 309, 9, '1005484152'),
(310, 'Santo', 'Santiago', 'Ortega', '$2y$10$0aLAek2j9xWadrgSIPVYlOaZtXf0uhaRih3BYIAmdsukjBWXwYwzq', 'A', '2023-06-14 16:14:39', NULL, 3, 310, 9, '1005484152'),
(311, 'Santo', 'Santiago', 'Ortega', '$2y$10$JNTyLVHuBezgGykQLF5XG.6tpUS7NvBDnf1tM0ZaG8M494iivq6em', 'A', '2023-06-14 16:14:39', NULL, 3, 311, 9, '1005484152'),
(312, 'Santo', 'Santiago', 'Ortega', '$2y$10$N.RW7CO8Tumqu0.c17Jlgu4AGrubjUqDITvi82Su78FqlM.mzo42a', 'A', '2023-06-14 16:14:40', NULL, 3, 312, 9, '1005484152'),
(313, 'Santo', 'Santiago', 'Ortega', '$2y$10$fBFdnzwnW4iG5dRkoLBqDuvS.ZyqPT.54t8CsYa7KKPthU55KLGNa', 'A', '2023-06-14 16:14:40', NULL, 3, 313, 9, '1005484152'),
(314, 'Santo', 'Santiago', 'Ortega', '$2y$10$RhBMbJYYWhhQoI9AdPwt8e72PepVWHjCxUsH/5mYqp1s/lxPZTBLW', 'A', '2023-06-14 16:14:40', NULL, 3, 314, 9, '1005484152'),
(315, 'Santo', 'Santiago', 'Ortega', '$2y$10$28LHoqbo6x9DnX87NBZeqeh8d/CRZBIpoIuUBaHV5DHxPncRAB2ci', 'A', '2023-06-14 16:14:40', NULL, 3, 315, 9, '1005484152'),
(316, 'Santo', 'Santiago', 'Ortega', '$2y$10$qNQoJtXVtU4yFXw281Q7x.UFxV3/puKpj6ODYM5EXOx.BJvJ0L7rW', 'A', '2023-06-14 16:14:40', NULL, 3, 316, 9, '1005484152'),
(317, 'Santo', 'Santiago', 'Ortega', '$2y$10$eCi0tDqg1gykbXYoTbQ76e0GOsjVVXTL5r/2s75KZqXmYTI.yoUFy', 'A', '2023-06-14 16:14:40', NULL, 3, 317, 9, '1005484152'),
(318, 'Santo', 'Santiago', 'Ortega', '$2y$10$7RIq8jwvPqzBND57lWIFvu0K7eVswCrOaci41/ythu5V2k3Dgu3E2', 'A', '2023-06-14 16:14:40', NULL, 3, 318, 9, '1005484152'),
(319, 'Santo', 'Santiago', 'Ortega', '$2y$10$RwUCpBZvlAArcSEQVIlvZeJGlvVQifu1sLlz//JYfOA/DO4I9Pc0e', 'A', '2023-06-14 16:14:40', NULL, 3, 319, 9, '1005484152'),
(320, 'Santo', 'Santiago', 'Ortega', '$2y$10$.dzR8xJWpqpJStafBOKDN.uy3sssZLjWqGw.gdcOVGouSrZzcjdFG', 'A', '2023-06-14 16:14:40', NULL, 3, 320, 9, '1005484152'),
(321, 'Santo', 'Santiago', 'Ortega', '$2y$10$1V81xrC043li0gu/PVT3n.Np3lTdTDmsvbt9a.UJcOOhBe8v8ABrC', 'A', '2023-06-14 16:14:40', NULL, 3, 321, 9, '1005484152'),
(322, 'Santo', 'Santiago', 'Ortega', '$2y$10$c4bDvuTa3s9CDZ7bQdKhPuN6iyzJXFDVNMC98TnDrPbjC3SrKSjoO', 'A', '2023-06-14 16:14:40', NULL, 3, 322, 9, '1005484152'),
(323, 'Santo', 'Santiago', 'Ortega', '$2y$10$9DJzppKcIMcNfqnR2NCtcuSdPi5nrle7NJR9wDg6tCfF/my.YXhS6', 'A', '2023-06-14 16:14:40', NULL, 3, 323, 9, '1005484152'),
(324, 'Santo', 'Santiago', 'Ortega', '$2y$10$Iyd3IgAqUHTyJ1E6EWyXEe3sk.rT34TOq7/yr08mA4x2H5rGvsKLy', 'A', '2023-06-14 16:14:40', NULL, 3, 324, 9, '1005484152'),
(325, 'Santo', 'Santiago', 'Ortega', '$2y$10$bQl3PU7BdbTcOfZY.AXM8u./1itOzGfT/jGm0RLGXelWV4Xbemld6', 'A', '2023-06-14 16:14:40', NULL, 3, 325, 9, '1005484152'),
(326, 'Santo', 'Santiago', 'Ortega', '$2y$10$9CmasqEXECaJFoUtCRa9zOmw/dG/aGi0IJNDEdsskNJsW9zc57ZWW', 'A', '2023-06-14 16:14:40', NULL, 3, 326, 9, '1005484152'),
(327, 'Santo', 'Santiago', 'Ortega', '$2y$10$Pmv8L6pP7EvPggiwfp2ejO1.UwycQg1/0beSwgIoIfSoufuAo/lhC', 'A', '2023-06-14 16:14:40', NULL, 3, 327, 9, '1005484152'),
(328, 'Santo', 'Santiago', 'Ortega', '$2y$10$P89cTXr3sJjOSFqN0rtjLu8Jmai3LLT3VewaHJlKYZWRSzIRTNMNO', 'A', '2023-06-14 16:14:40', NULL, 3, 328, 9, '1005484152'),
(329, 'Santo', 'Santiago', 'Ortega', '$2y$10$mac04vYaZXvMo2NHMmMXPO3ubDEau7Rs51Et.upyDutcDSPVZmFxC', 'A', '2023-06-14 16:14:40', NULL, 3, 329, 9, '1005484152'),
(330, 'Santo', 'Santiago', 'Ortega', '$2y$10$DV3qEkYv9GqUbq9aT/cm2.i0vvBkSA3iwJ2n7cN3kRbsaTYuAMrmC', 'A', '2023-06-14 16:14:40', NULL, 3, 330, 9, '1005484152'),
(331, 'Santo', 'Santiago', 'Ortega', '$2y$10$gFpQAReM40mHIaMn5WWuKuUASvgKrpP29HTYF3Q0Ek04YXqmISpJu', 'A', '2023-06-14 16:14:40', NULL, 3, 331, 9, '1005484152'),
(332, 'Santo', 'Santiago', 'Ortega', '$2y$10$eG1yLCFxfiMQYLWQ2JDLk.HJ8pkcSjHtC2Gmb9XYLdStH1NBnX3.C', 'A', '2023-06-14 16:14:40', NULL, 3, 332, 9, '1005484152'),
(333, 'Santo', 'Santiago', 'Ortega', '$2y$10$zkwDDJoNHidHpp1CSmfBs.68AVH7sZkDSOvANDJr/fjMUCiJgZGYW', 'A', '2023-06-14 16:14:40', NULL, 3, 333, 9, '1005484152'),
(334, 'Santo', 'Santiago', 'Ortega', '$2y$10$iWSUyTNhcDXhwaBOw.Sqi.IEOEPtb3xOMQLNrrfYD524YoBvCww.y', 'A', '2023-06-14 16:14:40', NULL, 3, 334, 9, '1005484152'),
(335, 'Santo', 'Santiago', 'Ortega', '$2y$10$Da7F3OIiVMjQCAFt/cwLXuaz2QTjBoivq2sclvUyYGYadCI7NUC1S', 'A', '2023-06-14 16:14:40', NULL, 3, 335, 9, '1005484152'),
(336, 'Santo', 'Santiago', 'Ortega', '$2y$10$U.7QD3LGDcgOtwdOq55c8.RxhbKBRcHPp2CU/ldsC5RIJtzIuXPGO', 'A', '2023-06-14 16:14:40', NULL, 3, 336, 9, '1005484152'),
(337, 'Santo', 'Santiago', 'Ortega', '$2y$10$POS1RZmd99mbF62S9YLqhOUGswRX/AMXSa0q8LNGNuQRoXVYprCtO', 'A', '2023-06-14 16:14:40', NULL, 3, 337, 9, '1005484152'),
(338, 'Santo', 'Santiago', 'Ortega', '$2y$10$pGt7d32qyBXHYK0lsdgKkOamrkDDuHYSssmhgdURd77OQO64gJzFi', 'A', '2023-06-14 16:14:40', NULL, 3, 338, 9, '1005484152'),
(339, 'Santo', 'Santiago', 'Ortega', '$2y$10$d2WqqhlB6qe4VZdIOXJ/texHYcrGH2oTzJ73xFoPgbkCwbS4/droC', 'A', '2023-06-14 16:14:40', NULL, 3, 339, 9, '1005484152'),
(340, 'Santo', 'Santiago', 'Ortega', '$2y$10$tE7BETCzNJrk9i4OI691LOjcK7k761o5zmBS5lYsaUQkZL67bn7bG', 'A', '2023-06-14 16:14:41', NULL, 3, 340, 9, '1005484152'),
(341, 'Santo', 'Santiago', 'Ortega', '$2y$10$YlpmGZ6WczQdHYV8GHKb3OPA2ZO3UDwurn5kzZOSZg2jujkAsKS1m', 'A', '2023-06-14 16:14:41', NULL, 3, 341, 9, '1005484152'),
(342, 'Santo', 'Santiago', 'Ortega', '$2y$10$0URi2qL4BnWb8iaEyJs5v.dfmUxMy/XKbwYUbKhothYcCHq2q47OC', 'A', '2023-06-14 16:14:41', NULL, 3, 342, 9, '1005484152'),
(343, 'Santo', 'Santiago', 'Ortega', '$2y$10$AqmMym.cAlQoEVMK/LyrMOkMUnut70o8cL2efpFHYpB95QVx21lIW', 'A', '2023-06-14 16:14:41', NULL, 3, 343, 9, '1005484152'),
(344, 'Santo', 'Santiago', 'Ortega', '$2y$10$1rfUou93PuCBMxZjtpbiAO7HUYseTh0Zv8kACdXBYBussGGCAHNqK', 'A', '2023-06-14 16:14:41', NULL, 3, 344, 9, '1005484152'),
(345, 'Santo', 'Santiago', 'Ortega', '$2y$10$FJpv9pWl3VCNdoRmduN5TeCLvySHI/FSLdtSYVF7GAW.yHigxkdou', 'A', '2023-06-14 16:14:41', NULL, 3, 345, 9, '1005484152'),
(346, 'Santo', 'Santiago', 'Ortega', '$2y$10$fGGC.I76SViHtQQSZ.LYdubdV.GKPuj9TIrTreWdvgkKyyZ0dnHmK', 'A', '2023-06-14 16:14:41', NULL, 3, 346, 9, '1005484152'),
(347, 'Santo', 'Santiago', 'Ortega', '$2y$10$Wf1yiQ5leYXVwgAEDUlV4eIEmzqVRU9iNCmuz.xfUdKGza.lT6meC', 'A', '2023-06-14 16:14:41', NULL, 3, 347, 9, '1005484152'),
(348, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZkKSP6tDWuuQzxWH5Bqu/.rbx3R./9nqTMHVhZEF7JxOxJHp409KS', 'A', '2023-06-14 16:14:41', NULL, 3, 348, 9, '1005484152'),
(349, 'Santo', 'Santiago', 'Ortega', '$2y$10$paCRzEbhjRmD6GovUnz2cuW/vSOD7xV0kmO13dwppj3y110A5WC12', 'A', '2023-06-14 16:14:41', NULL, 3, 349, 9, '1005484152'),
(350, 'Santo', 'Santiago', 'Ortega', '$2y$10$mH4lPyWnPTifPn2HYnIHFOX/uJFRFySZtywQSohJXh.Wh9aQ.Jh.C', 'A', '2023-06-14 16:14:41', NULL, 3, 350, 9, '1005484152'),
(351, 'Santo', 'Santiago', 'Ortega', '$2y$10$Xkrc9NBAK6fm.uxzTU19TOahSx9D4YpcA94WL/vQ0kH3w5gTTjQ9W', 'A', '2023-06-14 16:14:41', NULL, 3, 351, 9, '1005484152'),
(352, 'Santo', 'Santiago', 'Ortega', '$2y$10$tP6VRAe1lEPd0QJdMkCS9.HeKOJyIKP8egLvIje605F07CMivq6wO', 'A', '2023-06-14 16:14:41', NULL, 3, 352, 9, '1005484152'),
(353, 'Santo', 'Santiago', 'Ortega', '$2y$10$Ck.ZbL1if1kzgtAv8Qj7jOHmheuy7hVA8wlxlVhLHuqdJfulXjor.', 'A', '2023-06-14 16:14:41', NULL, 3, 353, 9, '1005484152'),
(354, 'Santo', 'Santiago', 'Ortega', '$2y$10$d/Moe77mAnWLZyBZo4FTHuzsd4PNgb2R3Bt7l1WqIPBKlrTx7ktu6', 'A', '2023-06-14 16:14:41', NULL, 3, 354, 9, '1005484152'),
(355, 'Santo', 'Santiago', 'Ortega', '$2y$10$0TB82EdU8W25jOnH/SbeyukgaFc1cTdpaL9YFKRbZaqMDpbDFn8VG', 'A', '2023-06-14 16:14:41', NULL, 3, 355, 9, '1005484152'),
(356, 'Santo', 'Santiago', 'Ortega', '$2y$10$Z4XsnsZ3QRvuEDlDCdmA9eDurOfW87WNDt.SEd3L5GxQcsHkHHbOG', 'A', '2023-06-14 16:14:41', NULL, 3, 356, 9, '1005484152'),
(357, 'Santo', 'Santiago', 'Ortega', '$2y$10$VD6lhhgJt6jNb/LLLa0u2eoC4f1ARan4UwT9.ZhvXlGlnQqzrkWd6', 'A', '2023-06-14 16:14:41', NULL, 3, 357, 9, '1005484152'),
(358, 'Santo', 'Santiago', 'Ortega', '$2y$10$qz9r2wNThf1vsb.GS38KSu/ZLNZVhtYtZnvB0I61xIXVzNIlA3EGC', 'A', '2023-06-14 16:14:41', NULL, 3, 358, 9, '1005484152'),
(359, 'Santo', 'Santiago', 'Ortega', '$2y$10$WjbzT1z1Q5PoEmPrxze2Wec2M.p/zIY5xKGIj.JnjPsjzOKVl5DZe', 'A', '2023-06-14 16:14:41', NULL, 3, 359, 9, '1005484152'),
(360, 'Santo', 'Santiago', 'Ortega', '$2y$10$gfGfAOipFCFZZLe9TrMuke.Sc6Y2n8zHWya4UHPPKzleePvWZjK9u', 'A', '2023-06-14 16:14:41', NULL, 3, 360, 9, '1005484152'),
(361, 'Santo', 'Santiago', 'Ortega', '$2y$10$HnIKkSD4FVge4p/mjes1Iu.J4giTuYx5DKsQTiiRSbX.Qu4xAze7a', 'A', '2023-06-14 16:14:41', NULL, 3, 361, 9, '1005484152'),
(362, 'Santo', 'Santiago', 'Ortega', '$2y$10$.NOyTLgZOZT6XxESxEj9K.nC2i51BLjxn2jQAQ7V3s/vLcwoSMyd2', 'A', '2023-06-14 16:14:41', NULL, 3, 362, 9, '1005484152'),
(363, 'Santo', 'Santiago', 'Ortega', '$2y$10$I85sGRD/tF2Ezwjf/Fx1kuBnSakWmP4ABt.mIn8ceZ/FvFtExuQ0O', 'A', '2023-06-14 16:14:41', NULL, 3, 363, 9, '1005484152'),
(364, 'Santo', 'Santiago', 'Ortega', '$2y$10$Os1DLneN9FidxR43IjnJB.emCzsa56AlYONm2KM7RfmWKIEu7r7JO', 'A', '2023-06-14 16:14:41', NULL, 3, 364, 9, '1005484152'),
(365, 'Santo', 'Santiago', 'Ortega', '$2y$10$.xQTeAhg9kdbkYh.g1cROuyLWN9VhGL0r3zzfZvo.pq1VX1LKUfka', 'A', '2023-06-14 16:14:41', NULL, 3, 365, 9, '1005484152'),
(366, 'Santo', 'Santiago', 'Ortega', '$2y$10$q3YrjfM9wzQwFJTrE7yB9OmeQ5qvSr7K0GewhnEMne4vHlcw3CriC', 'A', '2023-06-14 16:14:41', NULL, 3, 366, 9, '1005484152'),
(367, 'Santo', 'Santiago', 'Ortega', '$2y$10$IwQVP4ZJ01lZ.Ww2VRnIReyDNyt1qczBQe/ynDhQmD3nxYbVfaM9y', 'A', '2023-06-14 16:14:41', NULL, 3, 367, 9, '1005484152'),
(368, 'Santo', 'Santiago', 'Ortega', '$2y$10$OHOxpxOCTq1xMtqRndVxm.6gjtqpDgstdqrXJ8zixn20yEWLAY1Bq', 'A', '2023-06-14 16:14:41', NULL, 3, 368, 9, '1005484152'),
(369, 'Santo', 'Santiago', 'Ortega', '$2y$10$R682tK8//EH/O.im7YEc6OEGbFhmV/tQSgePKW9vppTu8KEuhv29e', 'A', '2023-06-14 16:14:42', NULL, 3, 369, 9, '1005484152'),
(370, 'Santo', 'Santiago', 'Ortega', '$2y$10$E7RnxR/1hfOipG4FlJbfleOQggfnblqXhIyuL49nZDNUaOjzbQkoa', 'A', '2023-06-14 16:14:42', NULL, 3, 370, 9, '1005484152'),
(371, 'Santo', 'Santiago', 'Ortega', '$2y$10$Q5AK0Js2invhzydDzy0XneZX26HUK49NXhDlmW/Xs.dALzZj6cgY.', 'A', '2023-06-14 16:14:42', NULL, 3, 371, 9, '1005484152'),
(372, 'Santo', 'Santiago', 'Ortega', '$2y$10$l.lkPkDX650cZkcbnXQbOOvYsw5nEPbXexcAiNgrjleB9Ao9nuUOy', 'A', '2023-06-14 16:14:42', NULL, 3, 372, 9, '1005484152'),
(373, 'Santo', 'Santiago', 'Ortega', '$2y$10$FPCZ6wMOlCqjrb4TosUVQOjOd11n9BAixHC4Ll4xyh64X86/Lfdx.', 'A', '2023-06-14 16:14:42', NULL, 3, 373, 9, '1005484152'),
(374, 'Santo', 'Santiago', 'Ortega', '$2y$10$EC9MhzAIPCCTdgV5GVJG8euJHANBZkdz26ybmj07h2m6qL/psObzy', 'A', '2023-06-14 16:14:42', NULL, 3, 374, 9, '1005484152'),
(375, 'Santo', 'Santiago', 'Ortega', '$2y$10$oQbW1w6cP9/7yH.wabz1neTX5FhLZYKyU8UeXC3zUb3lOITFzm.mO', 'A', '2023-06-14 16:14:42', NULL, 3, 375, 9, '1005484152'),
(376, 'Santo', 'Santiago', 'Ortega', '$2y$10$ujziZ85v.LpSllRqmJHFb.R6C.AkJztkLwV6vSJsfkPdTpDO0TYFu', 'A', '2023-06-14 16:14:42', NULL, 3, 376, 9, '1005484152'),
(377, 'Santo', 'Santiago', 'Ortega', '$2y$10$dajrFPndQpuwLn3BV24v8uSD2ivWV0kFwKNmUebf7eP7xdBws7s1i', 'A', '2023-06-14 16:14:42', NULL, 3, 377, 9, '1005484152'),
(378, 'Santo', 'Santiago', 'Ortega', '$2y$10$XZfVSj05wUK9q7OCB34Vouzl5ykGzyN9sZbXRAeryKAn/04bQigLq', 'A', '2023-06-14 16:14:42', NULL, 3, 378, 9, '1005484152'),
(379, 'Santo', 'Santiago', 'Ortega', '$2y$10$Dh2I1upmV0IB2DKPvyZlj.nuQ9MOruJhvLxf8uceo9jFUlZnT.Dfi', 'A', '2023-06-14 16:14:42', NULL, 3, 379, 9, '1005484152');
INSERT INTO `usuarios` (`id_usuario`, `usuario`, `nombre`, `apellido`, `pass`, `estado`, `fecha_crea`, `token`, `id_rol`, `usuario_crea`, `tipo_documento`, `num_documento`) VALUES
(380, 'Santo', 'Santiago', 'Ortega', '$2y$10$WUmseEK.Q0LjGZDApI8fHe0ZKsK149kbF0jy92709dPol0MPAXOpu', 'A', '2023-06-14 16:14:43', NULL, 3, 380, 9, '1005484152'),
(381, 'Santo', 'Santiago', 'Ortega', '$2y$10$CrlokH/4E2qhN6LYz5lsluYQtuyUROasC3wg9s8UOQmqxAhf.DXdW', 'A', '2023-06-14 16:14:43', NULL, 3, 381, 9, '1005484152'),
(382, 'Santo', 'Santiago', 'Ortega', '$2y$10$eDUhx1nvOswA7vtD1ROcNOaAcL9vlZTQ/L3cVKNVUzpt23cnW4RZG', 'A', '2023-06-14 16:14:43', NULL, 3, 382, 9, '1005484152'),
(383, 'Santo', 'Santiago', 'Ortega', '$2y$10$GdxFJczcRP1z53R2DDeAFetJGrxbUIa6UKz5J.xGtr8R4laTQoQ2u', 'A', '2023-06-14 16:14:43', NULL, 3, 383, 9, '1005484152'),
(384, 'Santo', 'Santiago', 'Ortega', '$2y$10$8Gz1MRXKXTESdJaEhiKx..PRHcsmonjjRezj8kra2ft2t0o44vSde', 'A', '2023-06-14 16:14:43', NULL, 3, 384, 9, '1005484152'),
(385, 'Santo', 'Santiago', 'Ortega', '$2y$10$i39c8ZyQ1097s0n1nT9aBe4fASmFEfG4EYXNBGWMcywFtFJ6s89d.', 'A', '2023-06-14 16:14:43', NULL, 3, 385, 9, '1005484152'),
(386, 'Santo', 'Santiago', 'Ortega', '$2y$10$lHcxqVe9FGYleC4oMqGMD.MGcq29AqsOwPcpw76XhNWXzwLoE79We', 'A', '2023-06-14 16:14:43', NULL, 3, 386, 9, '1005484152'),
(387, 'Santo', 'Santiago', 'Ortega', '$2y$10$ukws7DcBbTcgIvDfqklFp.Om2dU/3VhYyweAL1xoh7SZNY4CAVJDi', 'A', '2023-06-14 16:14:43', NULL, 3, 387, 9, '1005484152'),
(388, 'Santo', 'Santiago', 'Ortega', '$2y$10$BI2rs9U8K8mo/xHRHZ5.KuaVqE2s4KuLD4w3SAgINAAD/drV.AlQm', 'A', '2023-06-14 16:14:43', NULL, 3, 388, 9, '1005484152'),
(389, 'Santo', 'Santiago', 'Ortega', '$2y$10$sg/fQ9BDhMV0CDyhvFYwKedVjErjla0GgpviJm9pHx7h34xNnYnI2', 'A', '2023-06-14 16:14:43', NULL, 3, 389, 9, '1005484152'),
(390, 'Santo', 'Santiago', 'Ortega', '$2y$10$K0.6NPZc8pFeUGyyq1ZxWuXzOW8hZAPPbnbtjTJDSq0StTz6r0ykW', 'A', '2023-06-14 16:14:43', NULL, 3, 390, 9, '1005484152'),
(391, 'Santo', 'Santiago', 'Ortega', '$2y$10$madaUvJ9X.T0zBgrYYMJbeOAY/a7BihWZKQHjlf06dhcx5R49giXu', 'A', '2023-06-14 16:14:43', NULL, 3, 391, 9, '1005484152'),
(392, 'Santo', 'Santiago', 'Ortega', '$2y$10$apQSW8JRL.bgNOQhWxLOg.DjXTmqZs.spbLmHtVF9jKQWQh228rHi', 'A', '2023-06-14 16:14:43', NULL, 3, 392, 9, '1005484152'),
(393, 'Santo', 'Santiago', 'Ortega', '$2y$10$4fXqhBHrr7PbJlcnIOKqF.ta9p/oCtjCP8wtHTuyGa0XxnauR2wNW', 'A', '2023-06-14 16:14:43', NULL, 3, 393, 9, '1005484152'),
(394, 'Santo', 'Santiago', 'Ortega', '$2y$10$xx.kWqelO1u6Fvr2QNulJ.I380YRDflMZi6h/eRtVAtNrRMS/bdU6', 'A', '2023-06-14 16:14:43', NULL, 3, 394, 9, '1005484152'),
(395, 'Santo', 'Santiago', 'Ortega', '$2y$10$PQ2dyIp3hEDYai/9xRklCOfC0s73M/DmLkNvFG9audx3yz.mZWWLG', 'A', '2023-06-14 16:14:43', NULL, 3, 395, 9, '1005484152'),
(396, 'Santo', 'Santiago', 'Ortega', '$2y$10$pTPW7fbHZEnHOxmHL2tu2OIkDusm3fCLLYZvBluqRTPvuy1GTlsl6', 'A', '2023-06-14 16:14:43', NULL, 3, 396, 9, '1005484152'),
(397, 'Santo', 'Santiago', 'Ortega', '$2y$10$xvA1tKWmINSQeWlFoYo3EehptMYu6LuBqz7upuShAsVAuOwcruLde', 'A', '2023-06-14 16:14:43', NULL, 3, 397, 9, '1005484152'),
(398, 'Santo', 'Santiago', 'Ortega', '$2y$10$ALkeTVXVfg6c3wKD8nYtEe8MrDOlu19f8ennxcMwn1n0U3Kj3Z2dy', 'A', '2023-06-14 16:14:43', NULL, 3, 398, 9, '1005484152'),
(399, 'Santo', 'Santiago', 'Ortega', '$2y$10$IR0P9MkeOgrtJlgUNtLVvOfKEmGUIPuQhgftZyws5Ym0S/XSXQ3Py', 'A', '2023-06-14 16:14:43', NULL, 3, 399, 9, '1005484152'),
(400, 'Santo', 'Santiago', 'Ortega', '$2y$10$z.kS3TG.9.qf6LbPbKd5Me6BHgNPOtXB7D4STxbNTq3L7x.aRBYy2', 'A', '2023-06-14 16:14:43', NULL, 3, 400, 9, '1005484152'),
(401, 'Santo', 'Santiago', 'Ortega', '$2y$10$XKRt7wCHASFkukomWc3Caujvt2dSmkStuRh6ys4vXT8frnngHaTcS', 'A', '2023-06-14 16:14:43', NULL, 3, 401, 9, '1005484152'),
(402, 'Santo', 'Santiago', 'Ortega', '$2y$10$gd7Hg.WYrYXzJeehs6c5kuvDf17/4f6j7cOuEFHmdBxPkchWmmLFO', 'A', '2023-06-14 16:14:43', NULL, 3, 402, 9, '1005484152'),
(403, 'Santo', 'Santiago', 'Ortega', '$2y$10$T6KbnxxPjLkajRxLRfBJQem4zbC6UGos6JKdqDIDS9HmmokWHF0cG', 'A', '2023-06-14 16:14:43', NULL, 3, 403, 9, '1005484152'),
(404, 'Santo', 'Santiago', 'Ortega', '$2y$10$kZuS1Wok3J0AceUuzoka/uN2k.xrbyUXZP1M9xHbsfscw0LqZHC/a', 'A', '2023-06-14 16:14:43', NULL, 3, 404, 9, '1005484152'),
(405, 'Santo', 'Santiago', 'Ortega', '$2y$10$IYswvQ4trv.U3VElGNgQeOha8NSMv3gyxcb2.BqGjHBOBMUcrPMxu', 'A', '2023-06-14 16:14:43', NULL, 3, 405, 9, '1005484152'),
(406, 'Santo', 'Santiago', 'Ortega', '$2y$10$nEFLCLIy2vAccLujAi86oeEL3vXeY5IK.jptc3KbCoLdGHx6F7G1C', 'A', '2023-06-14 16:14:43', NULL, 3, 406, 9, '1005484152'),
(407, 'Santo', 'Santiago', 'Ortega', '$2y$10$h1YgViCh9qdPKV362ooQaubBPxM1/2L8hLSZv49NNL4pbnJLRiAlC', 'A', '2023-06-14 16:14:43', NULL, 3, 407, 9, '1005484152'),
(408, 'Santo', 'Santiago', 'Ortega', '$2y$10$jZoNEzvO4Fs1SGBZY7f0DePdxkkp.fKUiMJEFwLGRNSOsssg2Ls1e', 'A', '2023-06-14 16:14:43', NULL, 3, 408, 9, '1005484152'),
(409, 'Santo', 'Santiago', 'Ortega', '$2y$10$p1jzV3IoZ9r2lLpWgcghiufHI9WOVDrIkd2sFCBvha6ue5BMQd1EC', 'A', '2023-06-14 16:14:43', NULL, 3, 409, 9, '1005484152'),
(410, 'Santo', 'Santiago', 'Ortega', '$2y$10$UmSCQLr.g5da9NXGMC4fNeL9OhMM8P.jEd6plY9/5EW6EN0zzoPHG', 'A', '2023-06-14 16:14:43', NULL, 3, 410, 9, '1005484152'),
(411, 'Santo', 'Santiago', 'Ortega', '$2y$10$ODcAEpCJsavF/I96SPCYwOte8FDL0p2vQPTBER1vWfAlRlr7JB4Ue', 'A', '2023-06-14 16:14:43', NULL, 3, 411, 9, '1005484152'),
(412, 'Santo', 'Santiago', 'Ortega', '$2y$10$oPMXjuAmBgPgY5lQoylTa.IHxES5Ex798UXeshrDLTZGKtcH0Rhou', 'A', '2023-06-14 16:14:43', NULL, 3, 412, 9, '1005484152'),
(413, 'Santo', 'Santiago', 'Ortega', '$2y$10$FCTpKPNVSdGw.Xl.PxAdg.wiUW29GOycOX.fNEg6WkT/GZEHkU67i', 'A', '2023-06-14 16:14:43', NULL, 3, 413, 9, '1005484152'),
(414, 'Santo', 'Santiago', 'Ortega', '$2y$10$UiPVK6xcefcAauJ3gL4BpO5Q/5noZVltEl54nznmZhcueSiJxVm.2', 'A', '2023-06-14 16:14:43', NULL, 3, 414, 9, '1005484152'),
(415, 'Santo', 'Santiago', 'Ortega', '$2y$10$/rvKcQ0hIMCk4M0DRc1EOOjD9NxawY5Ztsm0JTcDaejUFSeCR0xKS', 'A', '2023-06-14 16:14:43', NULL, 3, 415, 9, '1005484152'),
(416, 'Santo', 'Santiago', 'Ortega', '$2y$10$zveJux9zFldALISS9LO/1Ov7xGHlqPl3hTe2UbPanNfc6ewOYtzvS', 'A', '2023-06-14 16:14:43', NULL, 3, 416, 9, '1005484152'),
(417, 'Santo', 'Santiago', 'Ortega', '$2y$10$8fJYBOmgUBzFfps.bNyopOdykxE1PgSP7VmWW0iBj2eyzLhpue3Eu', 'A', '2023-06-14 16:14:43', NULL, 3, 417, 9, '1005484152'),
(418, 'Santo', 'Santiago', 'Ortega', '$2y$10$V1xXXCCRPOqrdVqK4Cehfe/fCa/WBNWHvYjy3m8N7GAskiLqUHJri', 'A', '2023-06-14 16:14:43', NULL, 3, 418, 9, '1005484152'),
(419, 'Santo', 'Santiago', 'Ortega', '$2y$10$JcwBov7n3NH2pfhNhYtJQ.Q8Y6/dPeGS/l3hjWxq4vRw/EkYj8kEW', 'A', '2023-06-14 16:14:43', NULL, 3, 419, 9, '1005484152'),
(420, 'Santo', 'Santiago', 'Ortega', '$2y$10$6DLpJwQ/8rYGG3NLrnDTuuuOis/ebGPEh8/GNBMrWV7/LH1Qo1A7m', 'A', '2023-06-14 16:14:43', NULL, 3, 420, 9, '1005484152'),
(421, 'Santo', 'Santiago', 'Ortega', '$2y$10$/h.gorEXcpNlja0ive3yk.Aiqx21PyTp5uZx.9Dnyi1bKWX8mqa3y', 'A', '2023-06-14 16:14:43', NULL, 3, 421, 9, '1005484152'),
(422, 'Santo', 'Santiago', 'Ortega', '$2y$10$kr.CuD8Sgv/QOJ70EnBwDu.iTGR4Wx0gGiVaiQ.XdvKH8HGyDyT2O', 'A', '2023-06-14 16:14:43', NULL, 3, 422, 9, '1005484152'),
(423, 'Santo', 'Santiago', 'Ortega', '$2y$10$Rf5X60XTpS/U4i7QcQ6Xo.Rv34P.vBCawQ.CmKUl/reiDzqWxQmQK', 'A', '2023-06-14 16:14:43', NULL, 3, 423, 9, '1005484152'),
(424, 'Santo', 'Santiago', 'Ortega', '$2y$10$htUk8LFnv9fMpMdyLw1Gv.IdxqxZQU7lXxMw5OyNbQqWZreTsromK', 'A', '2023-06-14 16:14:43', NULL, 3, 424, 9, '1005484152'),
(425, 'Santo', 'Santiago', 'Ortega', '$2y$10$8bER5aJpA4RtxvNrTSeNr.jARtsC09NxxTSOCJ6Q6Tq1Xm/rRsTIS', 'A', '2023-06-14 16:14:43', NULL, 3, 425, 9, '1005484152'),
(426, 'Santo', 'Santiago', 'Ortega', '$2y$10$8HYg.USDQi/D4746AiSLJ.mhBicv0s5sFbQmLG21c/8m2Vu0YKATC', 'A', '2023-06-14 16:14:43', NULL, 3, 426, 9, '1005484152'),
(427, 'Santo', 'Santiago', 'Ortega', '$2y$10$1Q80gvPDsVJniz9IBSyvyuYv0OVURL21vZiyb/yAOzl6YxrzJhFwS', 'A', '2023-06-14 16:14:43', NULL, 3, 427, 9, '1005484152'),
(428, 'Santo', 'Santiago', 'Ortega', '$2y$10$Hkp7O3zttRUnrDGxPc1qIuXEQOic4oiVsklvBzxLyaj.Ly/hqXv16', 'A', '2023-06-14 16:14:43', NULL, 3, 428, 9, '1005484152'),
(429, 'Santo', 'Santiago', 'Ortega', '$2y$10$Zp5XgAfyAacay9FZpkhC6eA4mYjcUbRwkDTJgxScVv7uZcaO6GIj.', 'A', '2023-06-14 16:14:43', NULL, 3, 429, 9, '1005484152'),
(430, 'Santo', 'Santiago', 'Ortega', '$2y$10$HXAT4dBe0RQQFMT9hdf/U.ZDznIdn5RnudpW6Xeeght8zOB2rOHU2', 'A', '2023-06-14 16:14:43', NULL, 3, 430, 9, '1005484152'),
(431, 'Santo', 'Santiago', 'Ortega', '$2y$10$XWrscT8F.AmMM.seJL9H2.bfLVkdDdVHVfT4fMlh1QNaq.RmGbwTy', 'A', '2023-06-14 16:14:43', NULL, 3, 431, 9, '1005484152'),
(432, 'Santo', 'Santiago', 'Ortega', '$2y$10$zyN/xFfZqtUX26bcuBohFejfoYmB.jTpTZQ8RVdZ.bhz2cWik6Rmq', 'A', '2023-06-14 16:14:43', NULL, 3, 432, 9, '1005484152'),
(433, 'Santo', 'Santiago', 'Ortega', '$2y$10$Jockf9zpdc/Rw.VHSeuAUeOqLzwsO.Qpi3CPZaa0FYUinZ.BW2EW.', 'A', '2023-06-14 16:14:43', NULL, 3, 433, 9, '1005484152'),
(434, 'Santo', 'Santiago', 'Ortega', '$2y$10$vRUIPIZxFZlAx/QBSIrXd.tIBy/384fa6T2T/lYvbwT3nW9.pfVgG', 'A', '2023-06-14 16:14:43', NULL, 3, 434, 9, '1005484152'),
(435, 'Santo', 'Santiago', 'Ortega', '$2y$10$cCnqAgzu.JfY8YDGAPkpieJk992CjqMGZx9H2aqW06UIv2oCxpd8u', 'A', '2023-06-14 16:14:43', NULL, 3, 435, 9, '1005484152'),
(436, 'Santo', 'Santiago', 'Ortega', '$2y$10$DKRuxxmZqXIMwWLbvg/YKuArOHDXZ/25sh6TIxPiH.X2eMJneRsSe', 'A', '2023-06-14 16:14:43', NULL, 3, 436, 9, '1005484152'),
(437, 'Santo', 'Santiago', 'Ortega', '$2y$10$RcBgR7j.aY4g8p5/TFJ7hulxSBGvsgxSiyEw5E9QEpPZ9qEw6I2Je', 'A', '2023-06-14 16:14:43', NULL, 3, 437, 9, '1005484152'),
(438, 'Santo', 'Santiago', 'Ortega', '$2y$10$U2cTBSFRrqldRf7p053x1.7l/XtGtLiCJUpUgjRXKoeBK0ytfztCG', 'A', '2023-06-14 16:14:43', NULL, 3, 438, 9, '1005484152'),
(439, 'Santo', 'Santiago', 'Ortega', '$2y$10$u.EZ3H7b6iwohGh6YOXlv.itDQEbf1EpJPQFGVhcJZUqaHGHW0IBW', 'A', '2023-06-14 16:14:43', NULL, 3, 439, 9, '1005484152'),
(440, 'Santo', 'Santiago', 'Ortega', '$2y$10$1ktJOVO4MWfVYZhvL7JMXOg.0NLCICXODOaTC4rzhtJ4m1RdisQAm', 'A', '2023-06-14 16:14:43', NULL, 3, 440, 9, '1005484152'),
(441, 'Santo', 'Santiago', 'Ortega', '$2y$10$OtmInQuNK1iyXJtjtlkT.eSHSEUw45FdaVFvZiFnNgwjzah9lBvxq', 'A', '2023-06-14 16:14:43', NULL, 3, 441, 9, '1005484152'),
(442, 'Santo', 'Santiago', 'Ortega', '$2y$10$C6ePzPaMLs/KNTfPd9aYkOcFKK/rPZW54bvcykuXHE.Nxr303nuZi', 'A', '2023-06-14 16:14:43', NULL, 3, 442, 9, '1005484152'),
(443, 'Santo', 'Santiago', 'Ortega', '$2y$10$e05E5TwS.4EWp.9ux9.cl.wYJ.BflU/tquGx5a9oJpKr51BZChuAe', 'A', '2023-06-14 16:14:43', NULL, 3, 443, 9, '1005484152'),
(444, 'Santo', 'Santiago', 'Ortega', '$2y$10$8tsEfKaLEVzf39OlQUZ8reIAkTcwXO3ANhn4ttjY3M9Wnb0UClqeS', 'A', '2023-06-14 16:14:43', NULL, 3, 444, 9, '1005484152'),
(445, 'Santo', 'Santiago', 'Ortega', '$2y$10$QmgwrasqG2igluptTBPrEeVRHFdkD5fNQA5PpSvSDpmqMlvlwYbGm', 'A', '2023-06-14 16:14:44', NULL, 3, 445, 9, '1005484152'),
(446, 'Santo', 'Santiago', 'Ortega', '$2y$10$XNQT9PZ9vP.flKj/1Wl64e7QRO8tnI4VTHH/7OrHx5/Scy.0/1Bia', 'A', '2023-06-14 16:14:44', NULL, 3, 446, 9, '1005484152'),
(447, 'Santo', 'Santiago', 'Ortega', '$2y$10$9wdY6kl//O0ZG5dcGCVC2OQ3vhZEMdut14w6HbUNb/OGQxFDzMwyO', 'A', '2023-06-14 16:14:44', NULL, 3, 447, 9, '1005484152'),
(448, 'Santo', 'Santiago', 'Ortega', '$2y$10$UXa5br0mgy9kiNmcSNpMYenvIU44eJcXSS5R8Gkfs2xvM.DwUUeim', 'A', '2023-06-14 16:14:44', NULL, 3, 448, 9, '1005484152'),
(449, 'Santo', 'Santiago', 'Ortega', '$2y$10$hHnynkNTl4kU3vUudIzROuA0pjBHgWmFlpBK1F8YiGY2eXv6FTC5O', 'A', '2023-06-14 16:14:44', NULL, 3, 449, 9, '1005484152'),
(450, 'Santo', 'Santiago', 'Ortega', '$2y$10$TO24.VinibMKNqB0r3IjmOTqdjDxyYMAjbvBPsLxWsVuGXPD7dG3a', 'A', '2023-06-14 16:14:44', NULL, 3, 450, 9, '1005484152'),
(451, 'Santo', 'Santiago', 'Ortega', '$2y$10$s6td9i/4Z8jBMwkipLi3SOx4B0dB7OxQFIsquaJmO4EXcdmbqIVza', 'A', '2023-06-14 16:14:44', NULL, 3, 451, 9, '1005484152'),
(452, 'Santo', 'Santiago', 'Ortega', '$2y$10$728BfP1kQPcQOBTP6TquRuynFkW8MO9XZ54QyCbYE2sVCzbQmdw.W', 'A', '2023-06-14 16:14:44', NULL, 3, 452, 9, '1005484152'),
(453, 'Santo', 'Santiago', 'Ortega', '$2y$10$jqrLoEJQ9tVmy392vYFrOu.ey5Si9K7fV4GMwdWhZGrADDkmebydW', 'A', '2023-06-14 16:14:44', NULL, 3, 453, 9, '1005484152'),
(454, 'Santo', 'Santiago', 'Ortega', '$2y$10$dV.oikU2HAOfpW5eCPUvneyymkmpc8NLa5eTfvee3D9e8rSj1lW4G', 'A', '2023-06-14 16:14:44', NULL, 3, 454, 9, '1005484152'),
(455, 'Santo', 'Santiago', 'Ortega', '$2y$10$2OT/amAcZ1.9scj73T.6TejXMJtM9VtQEPexywz/Dvhlw8DJJTs5u', 'A', '2023-06-14 16:14:44', NULL, 3, 455, 9, '1005484152'),
(456, 'Santo', 'Santiago', 'Ortega', '$2y$10$ldho1LoxFnv9O1sMaBOIOOwsS4FALigiAWop7TF8.YXt33R1BmKTS', 'A', '2023-06-14 16:14:44', NULL, 3, 456, 9, '1005484152'),
(457, 'Santo', 'Santiago', 'Ortega', '$2y$10$OyOSTCBwd6o11E5TuGZYtukEBdom1XOI7mLt/Jo2LPWg4uGCGEJJi', 'A', '2023-06-14 16:14:44', NULL, 3, 457, 9, '1005484152'),
(458, 'Santo', 'Santiago', 'Ortega', '$2y$10$RHQvLsZKEUiIzwNjSwqZauBCTqTrln/CBvfAQyvkpROuM91EAXWku', 'A', '2023-06-14 16:14:44', NULL, 3, 458, 9, '1005484152'),
(459, 'Santo', 'Santiago', 'Ortega', '$2y$10$fhUggapEclnw2ho3KUyPdOq2MTEJQURTDDpIlwZQNjtLuibH0kc3S', 'A', '2023-06-14 16:14:44', NULL, 3, 459, 9, '1005484152'),
(460, 'Santo', 'Santiago', 'Ortega', '$2y$10$6e.FR5qZjecHSi2rb/dDs.HIi9brVro8jnRlvLSqR62h95/Ug8UPu', 'A', '2023-06-14 16:14:44', NULL, 3, 460, 9, '1005484152'),
(461, 'Santo', 'Santiago', 'Ortega', '$2y$10$vZ1WrcJhDPW1TDBFV3sPduvq7eyXUMujzivMnaNlAznktZnWx5IJC', 'A', '2023-06-14 16:14:44', NULL, 3, 461, 9, '1005484152'),
(462, 'Santo', 'Santiago', 'Ortega', '$2y$10$8wtY2OqB4HWQz359losWZe8I9PWbZYnI/WGeeeCLWFbDCwWKfJoyy', 'A', '2023-06-14 16:14:44', NULL, 3, 462, 9, '1005484152'),
(463, 'Santo', 'Santiago', 'Ortega', '$2y$10$xtXh9oVAFiDohKOsw17eSeAmHwMaik2nx86GrR95V8x67n4uEg8Ku', 'A', '2023-06-14 16:14:44', NULL, 3, 463, 9, '1005484152'),
(464, 'Santo', 'Santiago', 'Ortega', '$2y$10$xHn3RA0lqH27WVGPGLXIzOojoVtw28JF8G/mlCFwbeMcU9WjElASu', 'A', '2023-06-14 16:14:44', NULL, 3, 464, 9, '1005484152'),
(465, 'Santo', 'Santiago', 'Ortega', '$2y$10$971e3mP22ky0SU0acPGRveiY4GhmdP2Exg1f/UrweKp0SCGilGdnW', 'A', '2023-06-14 16:14:44', NULL, 3, 465, 9, '1005484152'),
(466, 'Santo', 'Santiago', 'Ortega', '$2y$10$NOJixpoSKQO/qbEMVQbSx.VLJc5nYB6wLa2JA4xuY8lyTH9gmAGGa', 'A', '2023-06-14 16:14:44', NULL, 3, 466, 9, '1005484152'),
(467, 'Santo', 'Santiago', 'Ortega', '$2y$10$R1fl4YbWtI6q9SL2LHxC5.qUQHT44AuNThouPmk7BdB0V3w5NptNy', 'A', '2023-06-14 16:14:44', NULL, 3, 467, 9, '1005484152'),
(468, 'Santo', 'Santiago', 'Ortega', '$2y$10$vBIUv0RE4A86kDffhUdnJenKcGXns4br6a0tpB96OWrtAErsE5DTC', 'A', '2023-06-14 16:14:44', NULL, 3, 468, 9, '1005484152'),
(469, 'Santo', 'Santiago', 'Ortega', '$2y$10$nm1IuVSJ5Q3l0Q50bceJD./5zJiuQnDZE.RQDXHjYAEkJt4jFdwRK', 'A', '2023-06-14 16:14:44', NULL, 3, 469, 9, '1005484152'),
(470, 'Santo', 'Santiago', 'Ortega', '$2y$10$3v8c9aXAATlOze.1hS5TjOFEZUabqrD6CvcW40ngHqc.tBID7T.Uy', 'A', '2023-06-14 16:14:44', NULL, 3, 470, 9, '1005484152'),
(471, 'Santo', 'Santiago', 'Ortega', '$2y$10$8rAHNE8HzEpC8UqEp3/dAuR6pplwvWjz0gMDQoQwR9.hsm0Q5TAtq', 'A', '2023-06-14 16:14:44', NULL, 3, 471, 9, '1005484152'),
(472, 'Santo', 'Santiago', 'Ortega', '$2y$10$zWw4my8k29Yj4edJpVFgXOK7vZmYD6FNEKMKUN17YDpAtuQ8ynRUi', 'A', '2023-06-14 16:14:44', NULL, 3, 472, 9, '1005484152'),
(473, 'Santo', 'Santiago', 'Ortega', '$2y$10$VNw3gJGJ4yih048tPP6uNOm7PLnoGcxpsZxAPF85shKbjASfbPAkC', 'A', '2023-06-14 16:14:44', NULL, 3, 473, 9, '1005484152'),
(474, 'Santo', 'Santiago', 'Ortega', '$2y$10$/8YECS1iPb/oT8UPJrB3/upwbs1HJGWh8XdA3iBeZMXPXz.XEGH56', 'A', '2023-06-14 16:14:44', NULL, 3, 474, 9, '1005484152'),
(475, 'Santo', 'Santiago', 'Ortega', '$2y$10$z0DGQ1sTfaaAxfST5/BNzOqOHudkH82EeLwckmRVEFepCjBo2aLq6', 'A', '2023-06-14 16:14:44', NULL, 3, 475, 9, '1005484152'),
(476, 'Santo', 'Santiago', 'Ortega', '$2y$10$WYo8EJTVaNMhgDHs0kJO2eECPP852Gtr092Rkp8zJNRqd251kzQSm', 'A', '2023-06-14 16:14:44', NULL, 3, 476, 9, '1005484152'),
(477, 'Santo', 'Santiago', 'Ortega', '$2y$10$UMdaCTUb1WtPDp0ktDHppet3Ihuid2gxTf8Gklf1ueq8zh7aeyCoe', 'A', '2023-06-14 16:14:44', NULL, 3, 477, 9, '1005484152'),
(478, 'Santo', 'Santiago', 'Ortega', '$2y$10$6lHOkgIqa4KMRFZBqky5pu2Z0M4suECIU.KeNRSAO3CqvM1GQXsyC', 'A', '2023-06-14 16:14:44', NULL, 3, 478, 9, '1005484152'),
(479, 'Santo', 'Santiago', 'Ortega', '$2y$10$HAe6nLSVl.U.WppCVzlOlemHbGBljAiAN43wSAUBtT5LVWD//y8rq', 'A', '2023-06-14 16:14:44', NULL, 3, 479, 9, '1005484152'),
(480, 'Santo', 'Santiago', 'Ortega', '$2y$10$qxIF5jnYdaDCh.USq11YvOFSrwbH2lSeCJzboYNH1nghiMH/kUYGm', 'A', '2023-06-14 16:14:44', NULL, 3, 480, 9, '1005484152'),
(481, 'Santo', 'Santiago', 'Ortega', '$2y$10$LVdC/9PLjFlRU0cJWaBlJOqdhDUVRZuD25gPRUAvSmNOk8UkdEidW', 'A', '2023-06-14 16:14:44', NULL, 3, 481, 9, '1005484152'),
(482, 'Santo', 'Santiago', 'Ortega', '$2y$10$SiysdhSWyiAkLUQ.RfCUR.WxfzBvt7rkap1HAhz8UQsKAkTl.K6Du', 'A', '2023-06-14 16:14:44', NULL, 3, 482, 9, '1005484152'),
(483, 'Santo', 'Santiago', 'Ortega', '$2y$10$vvGUWaNv7YHu7lJqAZCU9e4ni2qQrj3c5sXe81V9UFRYn036v.bPi', 'A', '2023-06-14 16:14:44', NULL, 3, 483, 9, '1005484152'),
(484, 'Santo', 'Santiago', 'Ortega', '$2y$10$7noecw8IJHZE90i/KPrCI.rvnY/AckopuVTjEP8CYLhrkEciqzPqu', 'A', '2023-06-14 16:14:44', NULL, 3, 484, 9, '1005484152'),
(485, 'Santo', 'Santiago', 'Ortega', '$2y$10$NDliTANV6Pos6ixj/N1YQ.3qYY2jAlHm2pXEO/znSBLS6ZAVyuJbS', 'A', '2023-06-14 16:14:44', NULL, 3, 485, 9, '1005484152'),
(486, 'Santo', 'Santiago', 'Ortega', '$2y$10$c7jhpKX4wvdN1IzGcyauqu9MeRwglWd3HY6.G8bu74MQ4Jwk5aUq6', 'A', '2023-06-14 16:14:44', NULL, 3, 486, 9, '1005484152'),
(487, 'Santo', 'Santiago', 'Ortega', '$2y$10$z5s3sXnf/K0bgB8y48jrv.d9KsYh4UvTcCDM4/i7QP6Qyo9rkIOZO', 'A', '2023-06-14 16:14:45', NULL, 3, 487, 9, '1005484152'),
(488, 'Santo', 'Santiago', 'Ortega', '$2y$10$6w0QcKjrnjcLjyRcpjcMieKS0oQ5KTxrB6d0gQlVj.PkITv06zqym', 'A', '2023-06-14 16:14:45', NULL, 3, 488, 9, '1005484152'),
(489, 'Santo', 'Santiago', 'Ortega', '$2y$10$Im4qIUyfeQmL149H1QYFueTByzvfBVtIc0edYzhGOuW04Xjpmvfsy', 'A', '2023-06-14 16:14:45', NULL, 3, 489, 9, '1005484152'),
(490, 'Santo', 'Santiago', 'Ortega', '$2y$10$NF67dslfX0kauWed58yjZuUqmHKfglKE8oOqAMVNzEzEhqXMRfFRu', 'A', '2023-06-14 16:14:45', NULL, 3, 490, 9, '1005484152'),
(491, 'Santo', 'Santiago', 'Ortega', '$2y$10$.UBN2uZU.aB3KjLa2sdhsum7Qt.tkY16v3Td2HdQU1JSWls25TSRK', 'A', '2023-06-14 16:14:45', NULL, 3, 491, 9, '1005484152'),
(492, 'Santo', 'Santiago', 'Ortega', '$2y$10$hXUDUCOumgXBAY2mXMaY8elKfU4oIP46WhQ5jU8sNsWPqnQwuaHMS', 'A', '2023-06-14 16:14:45', NULL, 3, 492, 9, '1005484152'),
(493, 'Santo', 'Santiago', 'Ortega', '$2y$10$3PDjI/OeBFMBvxOMr9GgWO8ENQxsE1.JLSI0wjNHFA/dXHZ5CjFMS', 'A', '2023-06-14 16:14:46', NULL, 3, 493, 9, '1005484152'),
(494, 'Santo', 'Santiago', 'Ortega', '$2y$10$uVr6uRHeaUbwlenfhb7vkepbPjSpZZC6461HI/N0BgRtiuEPzp7Xe', 'A', '2023-06-14 16:14:46', NULL, 3, 494, 9, '1005484152'),
(495, 'Santo', 'Santiago', 'Ortega', '$2y$10$CUSfBZOzaT6LuzIQ1Iyae.bu8CVcTOVuZIASANrXpuMUCQ7VMreca', 'A', '2023-06-14 16:14:45', NULL, 3, 495, 9, '1005484152'),
(496, 'Santo', 'Santiago', 'Ortega', '$2y$10$CA6SFzM.DGCX/pzzbNvPA.QRoX/q.dp4iybzrf/LO8qtl9ikjl0mG', 'A', '2023-06-14 16:14:46', NULL, 3, 496, 9, '1005484152'),
(497, 'Santo', 'Santiago', 'Ortega', '$2y$10$P8F6TljSpl0ot/VHVhwvxO2udiR6Dst.bP4vEv7HXNKAPPjHsE1DO', 'A', '2023-06-14 16:14:46', NULL, 3, 497, 9, '1005484152'),
(498, 'Santo', 'Santiago', 'Ortega', '$2y$10$4LoJSEbXVppIjSyrnY6y1e8K67DCIq/1XStUIsXTNo33ux/IF1U42', 'A', '2023-06-14 16:14:46', NULL, 3, 498, 9, '1005484152'),
(499, 'Santo', 'Santiago', 'Ortega', '$2y$10$DlMPxutdGlYEj2uSx2hvFuNYSuohS8HP5oC3soorDrxwt33BFVydu', 'A', '2023-06-14 16:14:46', NULL, 3, 499, 9, '1005484152'),
(500, 'Santo', 'Santiago', 'Ortega', '$2y$10$9ReWYPe7IcPpTHQMY1mdZuUhxTPP2AIO1bpjKIYAPA/Z7OPPXjF/q', 'A', '2023-06-14 16:14:46', NULL, 3, 500, 9, '1005484152'),
(501, 'Santo', 'Santiago', 'Ortega', '$2y$10$17QfvAfZcxPs8MdAekkVP.UbDRUPTQj6/QNn6MkKAMQKH0Q3U/XB2', 'A', '2023-06-14 16:14:46', NULL, 3, 501, 9, '1005484152'),
(502, 'Santo', 'Santiago', 'Ortega', '$2y$10$YX.RV9GFhUs/X1jj46D4jeVzu39qWrH3BtJAOJ5ju1CMTdGsAZatm', 'A', '2023-06-14 16:14:46', NULL, 3, 502, 9, '1005484152'),
(503, 'Santo', 'Santiago', 'Ortega', '$2y$10$.zKqYJBkK4N6PtI035cLkOl.EIo6evCKxZ9/M6UeoBVIeo7bz.vPC', 'A', '2023-06-14 16:14:46', NULL, 3, 503, 9, '1005484152'),
(504, 'Santo', 'Santiago', 'Ortega', '$2y$10$.kxbbKKkes.YXG2nXgdsrutTcsWM681srUI3LmuXQmLUXprIMqepy', 'A', '2023-06-14 16:14:46', NULL, 3, 504, 9, '1005484152'),
(505, 'Santo', 'Santiago', 'Ortega', '$2y$10$pH4jdeGwaVx1OEPItowB6eUFMixg3ZBIUCR/95wePIY/EldGUrzI.', 'A', '2023-06-14 16:14:47', NULL, 3, 505, 9, '1005484152'),
(506, 'Santo', 'Santiago', 'Ortega', '$2y$10$u0goliMQt56qAQCD2lMkqO6/GpxGroc2C3LOrBhJyRqG6WeEGJb/W', 'A', '2023-06-14 16:14:46', NULL, 3, 506, 9, '1005484152'),
(507, 'Santo', 'Santiago', 'Ortega', '$2y$10$EvRuCqc0ILAqTFWb4uwqYu2LFfPsJURyj8SYkvqbNJYdas8XO5ED.', 'A', '2023-06-14 16:14:46', NULL, 3, 507, 9, '1005484152'),
(508, 'Santo', 'Santiago', 'Ortega', '$2y$10$LKo4JkB2XFpltHita/1LXe6plnjjeyePugl4phfjmY2kQSF.inzzC', 'A', '2023-06-14 16:14:47', NULL, 3, 508, 9, '1005484152'),
(509, 'Santo', 'Santiago', 'Ortega', '$2y$10$cTnMSBvUqy3yhaiLjvMezO9U5FaOAJhkW/sqr42ZGKC29SKcemnPS', 'A', '2023-06-14 16:14:46', NULL, 3, 509, 9, '1005484152'),
(510, 'Santo', 'Santiago', 'Ortega', '$2y$10$di/TGdgDGwdVaWDZvpuP0Ocw1ah/w.alZIQqMpvnPVC4VURjo/9Bm', 'A', '2023-06-14 16:14:46', NULL, 3, 510, 9, '1005484152'),
(511, 'Santo', 'Santiago', 'Ortega', '$2y$10$ildKIJfvw39ClXv3eDVlKuvP9yLMwbKny5oN3ekeNnwWEeAJW2aoO', 'A', '2023-06-14 16:14:46', NULL, 3, 511, 9, '1005484152'),
(512, 'Santo', 'Santiago', 'Ortega', '$2y$10$zys.lBMRhgbimZsLkhpUbO5Lbe5jlVeplRAqBVjmH8vjlVhz90xe.', 'A', '2023-06-14 16:14:46', NULL, 3, 512, 9, '1005484152'),
(513, 'Santo', 'Santiago', 'Ortega', '$2y$10$DHLJa75MjJnlqnL6ghVMS.3j8ketCK9fYrwqz.cC99fh1.RGZTica', 'A', '2023-06-14 16:14:46', NULL, 3, 513, 9, '1005484152'),
(514, 'Santo', 'Santiago', 'Ortega', '$2y$10$0rtS/oWb03lFVWWgQVSas.eJ0/AZWNTSqb8yl5s06qr0BwnoxZ7Fe', 'A', '2023-06-14 16:14:46', NULL, 3, 514, 9, '1005484152'),
(515, 'Santo', 'Santiago', 'Ortega', '$2y$10$wCseqYZQdgFTaDPexckubuYxSrh02STxFSp2Pn.fuXZzbaoBhMfrO', 'A', '2023-06-14 16:14:46', NULL, 3, 515, 9, '1005484152'),
(516, 'Santo', 'Santiago', 'Ortega', '$2y$10$nEy46Y6bcAncO1vmlbT9p.GRxF0Ee1lrsPG2SKsvOnfLsOG0Ue05O', 'A', '2023-06-14 16:14:46', NULL, 3, 516, 9, '1005484152'),
(517, 'Santo', 'Santiago', 'Ortega', '$2y$10$/w5glr9MaywV8QZLAkPAUee64p0fhZyPR7NpcTpBksETVLIDBeEXq', 'A', '2023-06-14 16:14:46', NULL, 3, 517, 9, '1005484152'),
(518, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZZF7YMDG0rijrM1WbE2dd.WBuBtt78z2mczGtP5Q.mfnj.9iEsTG.', 'A', '2023-06-14 16:14:46', NULL, 3, 518, 9, '1005484152'),
(519, 'Santo', 'Santiago', 'Ortega', '$2y$10$O/r8C5EkDSie66X/jkwaIeY5FlgjJ0wg4oPddN3N5R54bUja.c0Be', 'A', '2023-06-14 16:14:46', NULL, 3, 519, 9, '1005484152'),
(520, 'Santo', 'Santiago', 'Ortega', '$2y$10$iXLZ7H/WUPVPvDHBKNjlJO1FAW1vJzS5k2cFQEO8z6gDTUDllyO.u', 'A', '2023-06-14 16:14:46', NULL, 3, 520, 9, '1005484152'),
(521, 'Santo', 'Santiago', 'Ortega', '$2y$10$F84RRmVhkBAoB2MmyiE5tuizDZf752QrPY1673I2/I2L35HNY6RHG', 'A', '2023-06-14 16:14:46', NULL, 3, 521, 9, '1005484152'),
(522, 'Santo', 'Santiago', 'Ortega', '$2y$10$z5kT2cz5CniHlbK4G.nzXePx5/y6PFQSvQpwFXGR44DnfldV.Aq2O', 'A', '2023-06-14 16:14:47', NULL, 3, 522, 9, '1005484152'),
(523, 'Santo', 'Santiago', 'Ortega', '$2y$10$mEV.rIcNpVcQEy3alHU.A.zJ/D56LtxvGVhu/VWJqs5L/7RczfghW', 'A', '2023-06-14 16:14:47', NULL, 3, 523, 9, '1005484152'),
(524, 'Santo', 'Santiago', 'Ortega', '$2y$10$iK4huMg/fIN4.PykGp5HxO9jM9j9g4zv4EbP8qQN159mXi.k/YmqW', 'A', '2023-06-14 16:14:47', NULL, 3, 524, 9, '1005484152'),
(525, 'Santo', 'Santiago', 'Ortega', '$2y$10$C/BHRTTEcecwOfEfEFZVH.xfpF5OsC0cXE2Z5.2CD6vStK63.KmWu', 'A', '2023-06-14 16:14:47', NULL, 3, 525, 9, '1005484152'),
(526, 'Santo', 'Santiago', 'Ortega', '$2y$10$vYbty0AQFlE4pyeVovyws.uqS8AhJvGiVdU2BCpwGvqb9UdU1Sbja', 'A', '2023-06-14 16:14:47', NULL, 3, 526, 9, '1005484152'),
(527, 'Santo', 'Santiago', 'Ortega', '$2y$10$9GdA917UqiyuXbNTHehsOO3B3rgCixwtNBmKd96IlW7yYloTBh4Tm', 'A', '2023-06-14 16:14:47', NULL, 3, 527, 9, '1005484152'),
(528, 'Santo', 'Santiago', 'Ortega', '$2y$10$Nys9C6Bv2JVxSDs6rZxGmufeDmbpTx47qU3Kbjjzwj/V.xgvfnIIi', 'A', '2023-06-14 16:14:47', NULL, 3, 528, 9, '1005484152'),
(529, 'Santo', 'Santiago', 'Ortega', '$2y$10$uF/5PtbSrYJkJyowp27Wy.6Ql69nHHvekZ.A5hwhwUlaOcI4aZmm2', 'A', '2023-06-14 16:14:48', NULL, 3, 529, 9, '1005484152'),
(530, 'Santo', 'Santiago', 'Ortega', '$2y$10$aRQFJMK5ol/wt9XD7wUlA.ckU4g9aYlF/s/sD/n3XXwgJzY17PvDq', 'A', '2023-06-14 16:14:48', NULL, 3, 530, 9, '1005484152'),
(531, 'Santo', 'Santiago', 'Ortega', '$2y$10$uZKHA19qoeu7F88v4xKpb.stpcQF3ChAE8nGoSgWDYaoWxTEhdIJO', 'A', '2023-06-14 16:14:48', NULL, 3, 531, 9, '1005484152'),
(532, 'Santo', 'Santiago', 'Ortega', '$2y$10$c9lh5eSsc1JLCvSWikpxlu5u0WG8VrSRtUyFBpukNkxEtm8TnUS8y', 'A', '2023-06-14 16:14:48', NULL, 3, 532, 9, '1005484152'),
(533, 'Santo', 'Santiago', 'Ortega', '$2y$10$5JXIcaWpq8OMNZex62G3Ze.cQZ73dOUm.DnDUI6OGgrZIwUYk8trG', 'A', '2023-06-14 16:14:48', NULL, 3, 533, 9, '1005484152'),
(534, 'Santo', 'Santiago', 'Ortega', '$2y$10$OqrWga/Tk7Fh8xTKhjvuI.ou3V2U4tKxZQYhvRpdBwkaI.FDAOoAC', 'A', '2023-06-14 16:14:48', NULL, 3, 534, 9, '1005484152'),
(535, 'Santo', 'Santiago', 'Ortega', '$2y$10$YWx3olGjja9P71adMWsVCOCMKx8fhQYrUrvi5lJuIfGsbfn/L122S', 'A', '2023-06-14 16:14:48', NULL, 3, 535, 9, '1005484152'),
(536, 'Santo', 'Santiago', 'Ortega', '$2y$10$e6TMDDa7rqfxFNXvulqNdeooT7pYdEkEsGbNMyqFygTnqn2/Yj8NG', 'A', '2023-06-14 16:14:48', NULL, 3, 536, 9, '1005484152'),
(537, 'Santo', 'Santiago', 'Ortega', '$2y$10$rkhAEBxI4UpP40mVIxj64uQZAR2NJzJM8wC0D4aKK/hpKAEaesR0m', 'A', '2023-06-14 16:14:48', NULL, 3, 537, 9, '1005484152'),
(538, 'Santo', 'Santiago', 'Ortega', '$2y$10$77m0hNJDtSllv43AUC2p7e1RMPvabcdarAewd1AsbE2lW0/F/lcuO', 'A', '2023-06-14 16:14:48', NULL, 3, 538, 9, '1005484152'),
(539, 'Santo', 'Santiago', 'Ortega', '$2y$10$kOBzTBQ2EKoJf3T3NKNzReiIxbYupHwhe/zMqKarFREfEeDm4nH5u', 'A', '2023-06-14 16:14:48', NULL, 3, 539, 9, '1005484152'),
(540, 'Santo', 'Santiago', 'Ortega', '$2y$10$tRnGVMiojTT/qGqXtCWRVOZO5VSo4DlR5PGI/tvBhj3dXQrOzhmA.', 'A', '2023-06-14 16:14:48', NULL, 3, 540, 9, '1005484152'),
(541, 'Santo', 'Santiago', 'Ortega', '$2y$10$I2rPOuiTmwNergrGCp4zHu6Rm5TZcicm3MAHqmGepa6B/.HkMBSMG', 'A', '2023-06-14 16:14:48', NULL, 3, 541, 9, '1005484152'),
(542, 'Santo', 'Santiago', 'Ortega', '$2y$10$2teNoHhbQ9oxOU0bT5K3OOGJ/J20wDY5F7hbtfG8g0taIBNm39la2', 'A', '2023-06-14 16:14:48', NULL, 3, 542, 9, '1005484152'),
(543, 'Santo', 'Santiago', 'Ortega', '$2y$10$O3Jmo3W1eN4iYIN0dI3t7eDPUI3T.30X8X7e6fEFyqbGhoMqi8oxi', 'A', '2023-06-14 16:14:48', NULL, 3, 543, 9, '1005484152'),
(544, 'Santo', 'Santiago', 'Ortega', '$2y$10$WZQeThaDAm/bExvqtlnWzeahg46dW/qI7KvT02fhzvhqpFhgHjYse', 'A', '2023-06-14 16:14:48', NULL, 3, 544, 9, '1005484152'),
(545, 'Santo', 'Santiago', 'Ortega', '$2y$10$tJN.0/tmGjEuWWTWNnYLcOygG8Ydk5gpxjMGw8hCT4NaM9TdQ/iWy', 'A', '2023-06-14 16:14:48', NULL, 3, 545, 9, '1005484152'),
(546, 'Santo', 'Santiago', 'Ortega', '$2y$10$9BoB50QZpMkLqLIVbZaad.rMGjoc0sBZD1ONMBqmeTnZVPOf/aSGG', 'A', '2023-06-14 16:14:48', NULL, 3, 546, 9, '1005484152'),
(547, 'Santo', 'Santiago', 'Ortega', '$2y$10$rwMJz4iyhxVFWHsSeeHu0ebHnHi4m.zLhdU5cxIvY9OTciXoTuw2a', 'A', '2023-06-14 16:14:48', NULL, 3, 547, 9, '1005484152'),
(548, 'Santo', 'Santiago', 'Ortega', '$2y$10$Sx1hSNyoylRaCB04H/NhwuTVzXhLMk/k9JEXhI8AfQ0JMDQdbVp4.', 'A', '2023-06-14 16:14:48', NULL, 3, 548, 9, '1005484152'),
(549, 'Santo', 'Santiago', 'Ortega', '$2y$10$q7JvlJPjSli4QTxZgMKh7uhcrdopb6eQ4AezIeCeyYUQup9WJ2jpu', 'A', '2023-06-14 16:14:48', NULL, 3, 549, 9, '1005484152'),
(550, 'Santo', 'Santiago', 'Ortega', '$2y$10$0oKme9XqnQ.yaCvdiWMBE.excGLDRpDFl8RjQSYYLNJM3H1flxNVq', 'A', '2023-06-14 16:14:48', NULL, 3, 550, 9, '1005484152'),
(551, 'Santo', 'Santiago', 'Ortega', '$2y$10$LAcobugFw5BVQ8Kbc7breemne3guNLyvuKDsbylftPbyhiQKunBn.', 'A', '2023-06-14 16:14:48', NULL, 3, 551, 9, '1005484152'),
(552, 'Santo', 'Santiago', 'Ortega', '$2y$10$DWTcS3VV22PacFNYP8fQluGbRKDWSOjrkIP.jpphEHOfn3Gvwiv.i', 'A', '2023-06-14 16:14:48', NULL, 3, 552, 9, '1005484152'),
(553, 'Santo', 'Santiago', 'Ortega', '$2y$10$snVyk020VMGngLsZExvADuYkfC.7reJzJADNFQPh0qxN.Pz0Trs9u', 'A', '2023-06-14 16:14:48', NULL, 3, 553, 9, '1005484152'),
(554, 'Santo', 'Santiago', 'Ortega', '$2y$10$kkeBpwd9bJbUfZ5lIdKZPuPJG8L9APWgNzl3/0E/jg2h.xxHQQO/e', 'A', '2023-06-14 16:14:48', NULL, 3, 554, 9, '1005484152'),
(555, 'Santo', 'Santiago', 'Ortega', '$2y$10$y4LZera2eR5.EEsF/axvU.9bnwk1hdvppBV1OftakutyHs5qeI5gW', 'A', '2023-06-14 16:14:48', NULL, 3, 555, 9, '1005484152'),
(556, 'Santo', 'Santiago', 'Ortega', '$2y$10$aa1IPLbuSJ5.0bniMpxNE.I4NDTMgU7hM1q1/DflcO7Wq8K61AJ9C', 'A', '2023-06-14 16:14:48', NULL, 3, 556, 9, '1005484152'),
(557, 'Santo', 'Santiago', 'Ortega', '$2y$10$iuBaI2Bjf04SnDh8SXxtVOwRivD.JTKmEWHjmFGNvNPs.thJXxZJW', 'A', '2023-06-14 16:14:48', NULL, 3, 557, 9, '1005484152'),
(558, 'Santo', 'Santiago', 'Ortega', '$2y$10$CzhuWmM1S1f0qWOBRk7tzOMdWxC9F737UdZwRoPGYaFVQpuj6nmCe', 'A', '2023-06-14 16:14:48', NULL, 3, 558, 9, '1005484152'),
(559, 'Santo', 'Santiago', 'Ortega', '$2y$10$j01EGowTbFbxA0KllDpE3Opq8iGPSC7ApZXAdcEXg5zgK2wa8QksS', 'A', '2023-06-14 16:14:48', NULL, 3, 559, 9, '1005484152'),
(560, 'Santo', 'Santiago', 'Ortega', '$2y$10$e143/dknBdJVuPt2werAHeaiV6AQRtDdTjffZpkyNFCTWDfmGFqbC', 'A', '2023-06-14 16:14:48', NULL, 3, 560, 9, '1005484152'),
(561, 'Santo', 'Santiago', 'Ortega', '$2y$10$VH1I1O1eJue0w788Y7Iky.hmuB/6pbfraHZlE3d8PymoXTM2Lq4RG', 'A', '2023-06-14 16:14:48', NULL, 3, 561, 9, '1005484152'),
(562, 'Santo', 'Santiago', 'Ortega', '$2y$10$R9TKgiQQxHncZ67MNdYvDetKowkkIGn0.4Rxhz1BhluN2SFcG98fq', 'A', '2023-06-14 16:14:48', NULL, 3, 562, 9, '1005484152'),
(563, 'Santo', 'Santiago', 'Ortega', '$2y$10$CkzbkoMOx30ESM6OFCZwneFterRNrOfyAa0KJb2MJnNhThLL2GVeu', 'A', '2023-06-14 16:14:48', NULL, 3, 563, 9, '1005484152'),
(564, 'Santo', 'Santiago', 'Ortega', '$2y$10$GVo1SzZPH0466j5Ws8WCmuCh5E07mXeXrUaSU/aJqrEOiJJj6.M86', 'A', '2023-06-14 16:14:48', NULL, 3, 564, 9, '1005484152'),
(565, 'Santo', 'Santiago', 'Ortega', '$2y$10$N7.cNu8t.VjXAHS785kjIOHRfKC5kv3aQ5IImGwq4tX3IXW0PXTZu', 'A', '2023-06-14 16:14:48', NULL, 3, 565, 9, '1005484152'),
(566, 'Santo', 'Santiago', 'Ortega', '$2y$10$m8FlRhx503u6QXfDffq7k.WWaOv.gykIOfOA8eV.H5kr85m3nqgRm', 'A', '2023-06-14 16:14:48', NULL, 3, 566, 9, '1005484152'),
(567, 'Santo', 'Santiago', 'Ortega', '$2y$10$wVSA8VTK4qWM2jNfLdlCnec5gd3EHjt3jdz7Kj6njnleDJTeLDRbW', 'A', '2023-06-14 16:14:48', NULL, 3, 567, 9, '1005484152'),
(568, 'Santo', 'Santiago', 'Ortega', '$2y$10$y2KQ28KOkPAu747SGyg/bO0.YDcIlXLJQbczEiJHjJ5E3BBJWU9xa', 'A', '2023-06-14 16:14:48', NULL, 3, 568, 9, '1005484152'),
(569, 'Santo', 'Santiago', 'Ortega', '$2y$10$2mhwDq15l4iy5OuqHAzZeOB.VV87L7dlySoiKWlchfZwkrFXWZBhG', 'A', '2023-06-14 16:14:48', NULL, 3, 569, 9, '1005484152'),
(570, 'Santo', 'Santiago', 'Ortega', '$2y$10$TGLERmAlr/BfzDX3mme39erdmOw0exBZ4vY3B3qVSN7wDOiHtKDci', 'A', '2023-06-14 16:14:48', NULL, 3, 570, 9, '1005484152'),
(571, 'Santo', 'Santiago', 'Ortega', '$2y$10$N/H6PPedsrLrvuC1XpZ6t.HHmrv72tQGtnBKwDhbRY0DQRYxWhWPe', 'A', '2023-06-14 16:14:48', NULL, 3, 571, 9, '1005484152'),
(572, 'Santo', 'Santiago', 'Ortega', '$2y$10$ko.AH2ULzX8/hJDGmuebb.yZO6fnN.qqg25SdI/XBTDPd//yDjwsi', 'A', '2023-06-14 16:14:48', NULL, 3, 572, 9, '1005484152'),
(573, 'Santo', 'Santiago', 'Ortega', '$2y$10$HtPEXxRJvXgR.bqvoPNe3uYSSe4U4u4odaQNoeY3p8r15Ost4zphm', 'A', '2023-06-14 16:14:48', NULL, 3, 573, 9, '1005484152'),
(574, 'Santo', 'Santiago', 'Ortega', '$2y$10$nIhtZI.qfPXmn5AmQs.XFeNFXsnuAQq.rgtLWLCHyXuLdNbfUxKWu', 'A', '2023-06-14 16:14:48', NULL, 3, 574, 9, '1005484152'),
(575, 'Santo', 'Santiago', 'Ortega', '$2y$10$8YpxO9vsBSrsp2lxPKerM.hredRzE/0z7x6d6.Z1Jimd5eWKtFu8K', 'A', '2023-06-14 16:14:48', NULL, 3, 575, 9, '1005484152'),
(576, 'Santo', 'Santiago', 'Ortega', '$2y$10$ntZrB3QitMMITvV3OksM..c79CYZ.Fv1kJldzm5W69.JyoCtaxrvS', 'A', '2023-06-14 16:14:48', NULL, 3, 576, 9, '1005484152'),
(577, 'Santo', 'Santiago', 'Ortega', '$2y$10$Uf9NmAt6ICwBVsFBlJvPhOVRV0S9cjghFUjCBU9GPtX0nFziqPPkm', 'A', '2023-06-14 16:14:48', NULL, 3, 577, 9, '1005484152'),
(578, 'Santo', 'Santiago', 'Ortega', '$2y$10$KLG4xr8u7gcqMadk6UYoj.ebee3nFR0pWKUS.WxgNmgGb15659tRK', 'A', '2023-06-14 16:14:48', NULL, 3, 578, 9, '1005484152'),
(579, 'Santo', 'Santiago', 'Ortega', '$2y$10$R95u4tbi8AfqqvbvAIeX.O8Tpxn7cZZQA35D.UJF9gT/NPXmOLKZq', 'A', '2023-06-14 16:14:48', NULL, 3, 579, 9, '1005484152'),
(580, 'Santo', 'Santiago', 'Ortega', '$2y$10$tDyMXPjsIP0Zil9vgj7Oiu0BZAmn9M37cd/231WQvPm7K1xiuV1/G', 'A', '2023-06-14 16:14:48', NULL, 3, 580, 9, '1005484152'),
(581, 'Santo', 'Santiago', 'Ortega', '$2y$10$hT52w1EBbpNVz/lCB32p3O15VvLm5smW34TxQQ4Hcw1QVt8GMDJN6', 'A', '2023-06-14 16:14:48', NULL, 3, 581, 9, '1005484152'),
(582, 'Santo', 'Santiago', 'Ortega', '$2y$10$t6Y.VU7c0QD7UAEtqbRdwOSGL0ukUDxDA71VAOsnNJGPvE8M70Uoq', 'A', '2023-06-14 16:14:48', NULL, 3, 582, 9, '1005484152'),
(583, 'Santo', 'Santiago', 'Ortega', '$2y$10$bV9CBXuX9MduBwOR4fdfFuoUJt0fb7emxxvtd7IQ3I6/BWRQneHoe', 'A', '2023-06-14 16:14:48', NULL, 3, 583, 9, '1005484152'),
(584, 'Santo', 'Santiago', 'Ortega', '$2y$10$.hXlGv7Lk2Iqt8hnTNTHcON.5rvpRqqKD.tuwk22eCN2t.euh5hge', 'A', '2023-06-14 16:14:48', NULL, 3, 584, 9, '1005484152'),
(585, 'Santo', 'Santiago', 'Ortega', '$2y$10$l6pCt3WcEQyPXFnxxQRX6OylEFMXSr.T/JHFGyZMbuHHI/vPqi4Oq', 'A', '2023-06-14 16:14:48', NULL, 3, 585, 9, '1005484152'),
(586, 'Santo', 'Santiago', 'Ortega', '$2y$10$5inVbDfl0o0OYvQdrMwla.Iyelupg3M7ViNepgU6FDoqjvmbkulbq', 'A', '2023-06-14 16:14:48', NULL, 3, 586, 9, '1005484152'),
(587, 'Santo', 'Santiago', 'Ortega', '$2y$10$iPebw/ua8Rl9/yfmGY/TDOMZ.PMJuGNailEReprMdjnviLXso0bVO', 'A', '2023-06-14 16:14:48', NULL, 3, 587, 9, '1005484152'),
(588, 'Santo', 'Santiago', 'Ortega', '$2y$10$v1Op1E49Q.StlGS/b6GxTukM.i.zdjnLul9R1Cmd.XWgu1I2o8avO', 'A', '2023-06-14 16:14:48', NULL, 3, 588, 9, '1005484152'),
(589, 'Santo', 'Santiago', 'Ortega', '$2y$10$99wvFlb.YV.CdcGnBwfdaeioI.d5Zda6eQr4.9qQaBNjPHFUBEjku', 'A', '2023-06-14 16:14:48', NULL, 3, 589, 9, '1005484152'),
(590, 'Santo', 'Santiago', 'Ortega', '$2y$10$mYaOIDCn4XlutibWH1V3AOJ9sOhckQaEU/zt7J6SDYsWW489YKcFW', 'A', '2023-06-14 16:14:48', NULL, 3, 590, 9, '1005484152'),
(591, 'Santo', 'Santiago', 'Ortega', '$2y$10$AOpsRpxjQBLwsgtAkfc/ROMHBB3UYuYlpjIiGn51NiLdkkP47rhxm', 'A', '2023-06-14 16:14:48', NULL, 3, 591, 9, '1005484152'),
(592, 'Santo', 'Santiago', 'Ortega', '$2y$10$ODB.O9RRev2aDugg1pnruu50qexXA3LLbHNyJWBmwInvPnZEJMBou', 'A', '2023-06-14 16:14:48', NULL, 3, 592, 9, '1005484152'),
(593, 'Santo', 'Santiago', 'Ortega', '$2y$10$aMlGBLRkdbL6dm47M1WZhOdamA0/xjPd2yG6PEGCk.pO83zpKRtme', 'A', '2023-06-14 16:14:48', NULL, 3, 593, 9, '1005484152'),
(594, 'Santo', 'Santiago', 'Ortega', '$2y$10$iiOdQR6CrAmUPhPLTWW7keEGrw9ntHxEAuQ.MsyJE1vQQVtQRj5qS', 'A', '2023-06-14 16:14:48', NULL, 3, 594, 9, '1005484152'),
(595, 'Santo', 'Santiago', 'Ortega', '$2y$10$OHDFqaZjHEOYakpfKf6fsO5tI9xAo35z/bPauieFTrmYLTGike.eK', 'A', '2023-06-14 16:14:48', NULL, 3, 595, 9, '1005484152'),
(596, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZeFyH3hkpSmOK9wxLddjyuMgMGzwQwxDvVLETe6ZNx3esS9t2.Kp.', 'A', '2023-06-14 16:14:48', NULL, 3, 596, 9, '1005484152'),
(597, 'Santo', 'Santiago', 'Ortega', '$2y$10$0f9eD0F84bPmMmtxw4xF5.IGHqJubJeWjc8FQKzrXUvchuYJqZCce', 'A', '2023-06-14 16:14:48', NULL, 3, 597, 9, '1005484152'),
(598, 'Santo', 'Santiago', 'Ortega', '$2y$10$1jjENEqGj2Pwb.bK1wFNiu9Mw.dHt56xGzKiv.5u6q6jybjTMJ/Ci', 'A', '2023-06-14 16:14:48', NULL, 3, 598, 9, '1005484152'),
(599, 'Santo', 'Santiago', 'Ortega', '$2y$10$663ZgmHL6u22/Sx8L7Sqkuddqj3YfQ9.ccJ3.B1hCD42U1b3PXXcm', 'A', '2023-06-14 16:14:48', NULL, 3, 599, 9, '1005484152'),
(600, 'Santo', 'Santiago', 'Ortega', '$2y$10$bTKQ1ZS0G4flPETbakvSF.DMSyrNIFu6.eGtMwlcdfrVyU1x2b/UW', 'A', '2023-06-14 16:14:48', NULL, 3, 600, 9, '1005484152'),
(601, 'Santo', 'Santiago', 'Ortega', '$2y$10$ITD6YNWcU/yhrJFqYbj1zO2FxE/1CtNER4dMEMeEyXErIvwdp.s1C', 'A', '2023-06-14 16:14:48', NULL, 3, 601, 9, '1005484152'),
(602, 'Santo', 'Santiago', 'Ortega', '$2y$10$J.QFGv32OiFsVZtyCzRSK.TF6i.NoIMqItKQMx5YtzVEOWtJjv2Pu', 'A', '2023-06-14 16:14:48', NULL, 3, 602, 9, '1005484152'),
(603, 'Santo', 'Santiago', 'Ortega', '$2y$10$FMdAm.bW1uNnE46Ty8/pIODER28.ZpD4Es75cBjm.UMrLhuUrg7bm', 'A', '2023-06-14 16:14:48', NULL, 3, 603, 9, '1005484152'),
(604, 'Santo', 'Santiago', 'Ortega', '$2y$10$kXzbAJYlm6E4t.WCuwiv0.R2k9tiC/OvuG1./F2s1UTck2iWekPia', 'A', '2023-06-14 16:14:48', NULL, 3, 604, 9, '1005484152'),
(605, 'Santo', 'Santiago', 'Ortega', '$2y$10$i0VsWr0lPQkD44VjLwGCPuR1BeWS7UzxAbZkXWmPbiZ.fQ4LA332W', 'A', '2023-06-14 16:14:48', NULL, 3, 605, 9, '1005484152'),
(606, 'Santo', 'Santiago', 'Ortega', '$2y$10$SWdEY0F4J2udm3/CQq/Fo.HBdJhVNQfHuyWsLcizyXhdMzf3gs/G2', 'A', '2023-06-14 16:14:48', NULL, 3, 606, 9, '1005484152'),
(607, 'Santo', 'Santiago', 'Ortega', '$2y$10$s5ZSGVmxKynEFTiAtr0gNOj9Wt171p5CzFcmylukYltWLi50YTb.e', 'A', '2023-06-14 16:14:48', NULL, 3, 607, 9, '1005484152'),
(608, 'Santo', 'Santiago', 'Ortega', '$2y$10$jE1owGhZazBkhOtu97FwwetMq9bxPC2rNGkf2oD4T41ZLo5TrnYYO', 'A', '2023-06-14 16:14:48', NULL, 3, 608, 9, '1005484152'),
(609, 'Santo', 'Santiago', 'Ortega', '$2y$10$6wHXWEJPXPX47hiFICNx9.Ye9/w/v7J3FeEpN/MwTQ/7t4egECwWa', 'A', '2023-06-14 16:14:48', NULL, 3, 609, 9, '1005484152'),
(610, 'Santo', 'Santiago', 'Ortega', '$2y$10$n40ekhXbgX/QwG6.vjwzdev3Q1RyAAbfRpLHIpzKiOXzmXX7FyF.e', 'A', '2023-06-14 16:14:48', NULL, 3, 610, 9, '1005484152'),
(611, 'Santo', 'Santiago', 'Ortega', '$2y$10$s1NyBnDEUPM0SL/nwMR8wuejGjijm4Q.YdoLIgFzZRAhw6EonOhLy', 'A', '2023-06-14 16:14:48', NULL, 3, 611, 9, '1005484152'),
(612, 'Santo', 'Santiago', 'Ortega', '$2y$10$4eBwT2/QMzNDieWDwbZ4kud01x4j8ewaSSrmEpk27lhIjjss/ZDp2', 'A', '2023-06-14 16:14:48', NULL, 3, 612, 9, '1005484152'),
(613, 'Santo', 'Santiago', 'Ortega', '$2y$10$WK8XORB/luN.KtNbdVHjT.PJsaQ58hUDzY5cEePsc4EgA1QBTA9g.', 'A', '2023-06-14 16:14:48', NULL, 3, 613, 9, '1005484152'),
(614, 'Santo', 'Santiago', 'Ortega', '$2y$10$ar2Ov5xHqzG9wTLZ/AFyCux44CwW41gj2PjfBeqV4HpWKrDs2ikFa', 'A', '2023-06-14 16:14:48', NULL, 3, 614, 9, '1005484152'),
(615, 'Santo', 'Santiago', 'Ortega', '$2y$10$dOR99ZjdXYcvE880nHrQmuhHOMd4cV58NyOMaIkb73qsECLoCevJS', 'A', '2023-06-14 16:14:48', NULL, 3, 615, 9, '1005484152'),
(616, 'Santo', 'Santiago', 'Ortega', '$2y$10$NyuSZjxbJGl4HdAwW6BtQ.UaOJOSXdWQ3r490jFdHk3LHVIIUh6i2', 'A', '2023-06-14 16:14:48', NULL, 3, 616, 9, '1005484152'),
(617, 'Santo', 'Santiago', 'Ortega', '$2y$10$9KjboTZRQwma2Mdqiw5n/.wfWuUZLvJn.OiN5.r6Vo37Vi.cp50J.', 'A', '2023-06-14 16:14:48', NULL, 3, 617, 9, '1005484152'),
(618, 'Santo', 'Santiago', 'Ortega', '$2y$10$usO2SRxId2DATe2pJ.eM/O7epnw16s3WSQ45FOM0DeGK87Y//kzPi', 'A', '2023-06-14 16:14:48', NULL, 3, 618, 9, '1005484152'),
(619, 'Santo', 'Santiago', 'Ortega', '$2y$10$Rg4S6MmRYnzeRk/hlzCKUufSte2s9iKSOvQUivy3U9vjZKX9gu2Hm', 'A', '2023-06-14 16:14:48', NULL, 3, 619, 9, '1005484152'),
(620, 'Santo', 'Santiago', 'Ortega', '$2y$10$WSy.l60OH6MWgHTPPVtX0ete1XVzAL5IAM0T98tdlqx.zrrCuIvbW', 'A', '2023-06-14 16:14:48', NULL, 3, 620, 9, '1005484152'),
(621, 'Santo', 'Santiago', 'Ortega', '$2y$10$0ppUAKOHZ47OxYTFGYGbfOag1AKvDHnSClbXlR.JyyA.21iR8H9Pu', 'A', '2023-06-14 16:14:48', NULL, 3, 621, 9, '1005484152'),
(622, 'Santo', 'Santiago', 'Ortega', '$2y$10$EvSBuSVyTMLkiNGQ9sVPi./ctLNnlAOxb2ftMQs4.GJoSna8o4fNC', 'A', '2023-06-14 16:14:48', NULL, 3, 622, 9, '1005484152'),
(623, 'Santo', 'Santiago', 'Ortega', '$2y$10$Fbtljonb6YKalEC8dnaZsOjyCmFl/hZFCLLf2RIu1qlptV/uwaCRe', 'A', '2023-06-14 16:14:48', NULL, 3, 623, 9, '1005484152'),
(624, 'Santo', 'Santiago', 'Ortega', '$2y$10$/75tRT.TDrKfxJpTtf4PsOveRgVQPC3gOKVsX8g2FZ.XunNbWA1RO', 'A', '2023-06-14 16:14:48', NULL, 3, 624, 9, '1005484152'),
(625, 'Santo', 'Santiago', 'Ortega', '$2y$10$i3pWcYGIWW9x.AZ6y3ZWvefjnPJViS5ABRrQnbOYKN2tP8w.ei4n2', 'A', '2023-06-14 16:14:48', NULL, 3, 625, 9, '1005484152'),
(626, 'Santo', 'Santiago', 'Ortega', '$2y$10$hTzPM97VGVcTnFLFzPa82.L8L3/kQEOd34z7AG3fcml1qWyumGSc6', 'A', '2023-06-14 16:14:48', NULL, 3, 626, 9, '1005484152'),
(627, 'Santo', 'Santiago', 'Ortega', '$2y$10$xW/.hz4D/.jpXmYtmzCR.O5f5plRkJWHnKjEmPmHOhud.CFaQ6HkS', 'A', '2023-06-14 16:14:48', NULL, 3, 627, 9, '1005484152'),
(628, 'Santo', 'Santiago', 'Ortega', '$2y$10$T7VbA3bZxr2FLCWDUs2dEeGg6/n9txqcINp8op9pRVuRE3YkLB8y2', 'A', '2023-06-14 16:14:49', NULL, 3, 628, 9, '1005484152'),
(629, 'Santo', 'Santiago', 'Ortega', '$2y$10$SGsXO3DsowHVEppoN5LVYOFjp3anCt5H07HCeD0wQFbFg2L6coabO', 'A', '2023-06-14 16:14:49', NULL, 3, 629, 9, '1005484152'),
(630, 'Santo', 'Santiago', 'Ortega', '$2y$10$n/I1guofsrZx8zvobmcswOWkhpbup8EDKlxn0.35JmijZPFMvG3i2', 'A', '2023-06-14 16:14:49', NULL, 3, 630, 9, '1005484152'),
(631, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZUS7e9XQsdkhvWeLwHFro.OTqK5MUjPMdVuf1XQckM3IOKIdRtSLa', 'A', '2023-06-14 16:14:49', NULL, 3, 631, 9, '1005484152'),
(632, 'Santo', 'Santiago', 'Ortega', '$2y$10$r6edoEi8.M8FplPLYYzQPOrHXf9mZ.3x5bHJ30onA9LscA2L.OIja', 'A', '2023-06-14 16:14:49', NULL, 3, 632, 9, '1005484152'),
(633, 'Santo', 'Santiago', 'Ortega', '$2y$10$.HSytPDIaoa69a4tWIxnpO42URb1VVXTFGKuIlM22RqTJYYuPfHDC', 'A', '2023-06-14 16:14:50', NULL, 3, 633, 9, '1005484152'),
(634, 'Santo', 'Santiago', 'Ortega', '$2y$10$aLb..Hi9QfbNJ345X90gt.oesk6dEfnqTEcuUwNlqbpUl.FQszesm', 'A', '2023-06-14 16:14:50', NULL, 3, 634, 9, '1005484152'),
(635, 'Santo', 'Santiago', 'Ortega', '$2y$10$R2YJ3dX9JcFumxOUdMCLjOW8zZpikQcNIqwCgV6vxOC85o8mRSK/G', 'A', '2023-06-14 16:14:50', NULL, 3, 635, 9, '1005484152'),
(636, 'Santo', 'Santiago', 'Ortega', '$2y$10$qd8WslXO5ax4nv12smZ/teBSQmHBvCT4HgwEHkkQEKCLIRq.B2pyq', 'A', '2023-06-14 16:14:50', NULL, 3, 636, 9, '1005484152'),
(637, 'Santo', 'Santiago', 'Ortega', '$2y$10$gLuy52Co.DS5tf9KmnH7eOioccpJhUs50hYzrb.zmJ39S/7/SeLrK', 'A', '2023-06-14 16:14:50', NULL, 3, 637, 9, '1005484152'),
(638, 'Santo', 'Santiago', 'Ortega', '$2y$10$mnGOISB.7a.ya6q2vJpNVuU8env0DXVNwhagYaFv4DkHtCi8cJygK', 'A', '2023-06-14 16:14:50', NULL, 3, 638, 9, '1005484152'),
(639, 'Santo', 'Santiago', 'Ortega', '$2y$10$RdLuGoa48gUm7c11nJnxjOXjXDgTI8uHRLsyqsuQrfsiA5oSHalci', 'A', '2023-06-14 16:14:50', NULL, 3, 639, 9, '1005484152'),
(640, 'Santo', 'Santiago', 'Ortega', '$2y$10$jKOuIoZZleoEIR3E9aNgaeRneyeKabY.0IRHNisU6VEBRCQLVLjCm', 'A', '2023-06-14 16:14:50', NULL, 3, 640, 9, '1005484152'),
(641, 'Santo', 'Santiago', 'Ortega', '$2y$10$nUWqMP3aTH/xGZYZrDo7K.FHCoyX.yIWZvBmc/1mlq/LWtmdGMohG', 'A', '2023-06-14 16:14:50', NULL, 3, 641, 9, '1005484152'),
(642, 'Santo', 'Santiago', 'Ortega', '$2y$10$aG62Esuq7ck283/FHftTyu0YB2QyD7V7GGWogO.5V6XpfWYB3OzYi', 'A', '2023-06-14 16:14:50', NULL, 3, 642, 9, '1005484152'),
(643, 'Santo', 'Santiago', 'Ortega', '$2y$10$Pkbsg.UDFXErGxz35M6ZqOKLQtVuTGyhpknD3ijxDNE.VPuLiJ.iK', 'A', '2023-06-14 16:14:50', NULL, 3, 643, 9, '1005484152'),
(644, 'Santo', 'Santiago', 'Ortega', '$2y$10$Y1URsAGZwEmZyuVE5Flw2eg1JakKv7T6Hust7FtcfTN6L.O3j7eNy', 'A', '2023-06-14 16:14:50', NULL, 3, 644, 9, '1005484152'),
(645, 'Santo', 'Santiago', 'Ortega', '$2y$10$0YVqB.FkDjGv1LS2d4NdT.cV6ucA0qFeIFGptnL7.Ti91SQAlshbO', 'A', '2023-06-14 16:14:50', NULL, 3, 645, 9, '1005484152'),
(646, 'Santo', 'Santiago', 'Ortega', '$2y$10$UpGdUldn.sfCPW7J.nfAyucaVb42eFNqaplu29avlWcSSUOJEhpHS', 'A', '2023-06-14 16:14:50', NULL, 3, 646, 9, '1005484152'),
(647, 'Santo', 'Santiago', 'Ortega', '$2y$10$hl0kHR3T6phQL6tlj3QdKObQsNcI/V3QC0ahT9h1Gb/WXB5B9nyyG', 'A', '2023-06-14 16:14:50', NULL, 3, 647, 9, '1005484152'),
(648, 'Santo', 'Santiago', 'Ortega', '$2y$10$Y1wKToNOThCcbZIMRy6az.FS77IPHboeR8TdrmcZHR36pK/cq7VOi', 'A', '2023-06-14 16:14:50', NULL, 3, 648, 9, '1005484152'),
(649, 'Santo', 'Santiago', 'Ortega', '$2y$10$K4XbDx3eAFfMzI3UUi96Yu2J/4vfpYNPsVO2PfvdfnbgLSYiel07G', 'A', '2023-06-14 16:14:50', NULL, 3, 649, 9, '1005484152'),
(650, 'Santo', 'Santiago', 'Ortega', '$2y$10$fwS4JGluN/NnlX2M7IwoL.eduNDWvcK6NKgyGTOSBcpfN0.Gh2fXS', 'A', '2023-06-14 16:14:50', NULL, 3, 650, 9, '1005484152'),
(651, 'Santo', 'Santiago', 'Ortega', '$2y$10$KKMu5P5j4GtIuxmzLiiSzu/D0Tcknb5EfMgeQ..ltWGg8829nq98q', 'A', '2023-06-14 16:14:50', NULL, 3, 651, 9, '1005484152'),
(652, 'Santo', 'Santiago', 'Ortega', '$2y$10$UCuseWfM.VLYoaSymP6uc.3E3115oCeDin/2AHDJTJv7GWNh/TWCa', 'A', '2023-06-14 16:14:50', NULL, 3, 652, 9, '1005484152'),
(653, 'Santo', 'Santiago', 'Ortega', '$2y$10$3MEmTDMfdGSL38MAMh75SOxCWsliGtL9iJxLprtxDdg7BInqXLTPO', 'A', '2023-06-14 16:14:50', NULL, 3, 653, 9, '1005484152'),
(654, 'Santo', 'Santiago', 'Ortega', '$2y$10$XoCMZx6wWxh.AnzDGkRt1eC2QUJE4HHzb3RZrXkL6eC4/0A2D0tqC', 'A', '2023-06-14 16:14:50', NULL, 3, 654, 9, '1005484152'),
(655, 'Santo', 'Santiago', 'Ortega', '$2y$10$8yJzT6.aZqb34ZRjSo4Oj.J8YMJchqyhx3ymh8ZE30Uq/vGUBH/uG', 'A', '2023-06-14 16:14:50', NULL, 3, 655, 9, '1005484152'),
(656, 'Santo', 'Santiago', 'Ortega', '$2y$10$I3xMs1qzBG6j/809TfQkTOzdULVD5/xh1E4CCANwDIC393gjtNXiG', 'A', '2023-06-14 16:14:50', NULL, 3, 656, 9, '1005484152'),
(657, 'Santo', 'Santiago', 'Ortega', '$2y$10$4s72h9.WLajicl2RezBwQ.jSaeQO3w5mApNycHzdP5MOcBJChYMzi', 'A', '2023-06-14 16:14:50', NULL, 3, 657, 9, '1005484152'),
(658, 'Santo', 'Santiago', 'Ortega', '$2y$10$jIAWDPW8rIe9gGLPUHvY4.Kb6ZAQRvJyV9IW7/AMEaPu28grnnkpC', 'A', '2023-06-14 16:14:50', NULL, 3, 658, 9, '1005484152'),
(659, 'Santo', 'Santiago', 'Ortega', '$2y$10$BfjT.a5QxKk4/2i8nRdWzOTFEYOeKjqJGt/I2RoRBtlLzPDrzY2fK', 'A', '2023-06-14 16:14:50', NULL, 3, 659, 9, '1005484152'),
(660, 'Santo', 'Santiago', 'Ortega', '$2y$10$PhkksATFxCwM4uZybi1V.eTC2QGFh//JUFPRmZVJukNKH7V96hPFm', 'A', '2023-06-14 16:14:51', NULL, 3, 660, 9, '1005484152'),
(661, 'Santo', 'Santiago', 'Ortega', '$2y$10$oyHR3gIGoAagG5OvjqjSyu7eSb3euU6GOb6mek5T8by6MfBXoFls.', 'A', '2023-06-14 16:14:51', NULL, 3, 661, 9, '1005484152'),
(662, 'Santo', 'Santiago', 'Ortega', '$2y$10$pbbLvG/CYGwn.cDR3LBfN.1/M6rd5Kk7VHNusqJdDmGygXuJA9tPe', 'A', '2023-06-14 16:14:51', NULL, 3, 662, 9, '1005484152'),
(663, 'Santo', 'Santiago', 'Ortega', '$2y$10$EJQpcJ9W25Qb1btizs4ECOh7HUv7JI/5fPXb766LIE4zllVpzWIjq', 'A', '2023-06-14 16:14:51', NULL, 3, 663, 9, '1005484152'),
(664, 'Santo', 'Santiago', 'Ortega', '$2y$10$i4lDurgJ27DLb3vQxnfi5.u1/mD40hXj3f.St2qENG.5LA5v9sL6a', 'A', '2023-06-14 16:14:51', NULL, 3, 664, 9, '1005484152'),
(665, 'Santo', 'Santiago', 'Ortega', '$2y$10$ovJNyD8xksTWHY8l8y8.I.oZXogTqvqulemiKqBKWihCOADN50r9W', 'A', '2023-06-14 16:14:51', NULL, 3, 665, 9, '1005484152'),
(666, 'Santo', 'Santiago', 'Ortega', '$2y$10$UfS4h6fIzcyClZ3.RDBmceE3N1ZlxshgjmBPvzkD6wR.ryyGA6WWe', 'A', '2023-06-14 16:14:51', NULL, 3, 666, 9, '1005484152'),
(667, 'Santo', 'Santiago', 'Ortega', '$2y$10$u8VTtBrw578zxUk9nls3xegj.shHrogqnsM.LwFB8ofkaduI.JlRi', 'A', '2023-06-14 16:14:51', NULL, 3, 667, 9, '1005484152'),
(668, 'Santo', 'Santiago', 'Ortega', '$2y$10$hfWhnP4fZCcYfXkWv3Cy2eDvROimEIMGJ7V6EAxwUmRcoqy8wuh0e', 'A', '2023-06-14 16:14:51', NULL, 3, 668, 9, '1005484152'),
(669, 'Santo', 'Santiago', 'Ortega', '$2y$10$wevuOwCWZbz6q8Ik4MRz..kGy9m4MOF6mPij.HEtPlHFwpyzgdfYy', 'A', '2023-06-14 16:14:51', NULL, 3, 669, 9, '1005484152'),
(670, 'Santo', 'Santiago', 'Ortega', '$2y$10$Qmd0Vp4porx875.HNHSxGekMKSctkJ/bDS4tAnhSaCDENHmbbBmwy', 'A', '2023-06-14 16:14:51', NULL, 3, 670, 9, '1005484152'),
(671, 'Santo', 'Santiago', 'Ortega', '$2y$10$eymtzarWp/Vj0Vtp5BwMhuaYtsSql5DIttjiHAOhTB1N1eUFVgmCu', 'A', '2023-06-14 16:14:51', NULL, 3, 671, 9, '1005484152'),
(672, 'Santo', 'Santiago', 'Ortega', '$2y$10$OnscROaIyi4uIk71bDyM6.Xd2.9X.J39PaxzvAmd5IJ7Ka5TRZkA2', 'A', '2023-06-14 16:14:51', NULL, 3, 672, 9, '1005484152'),
(673, 'Santo', 'Santiago', 'Ortega', '$2y$10$OsSazpcuQPug.6SWgxm5MOZUZT1muOknUfphjqymOtteVQGIeyeoS', 'A', '2023-06-14 16:14:51', NULL, 3, 673, 9, '1005484152'),
(674, 'Santo', 'Santiago', 'Ortega', '$2y$10$xDEeoJ4Wn2bz.BaNRmwoquHFYXhQF/95vUtyhxXEwsIxSABobNqPK', 'A', '2023-06-14 16:14:51', NULL, 3, 674, 9, '1005484152'),
(675, 'Santo', 'Santiago', 'Ortega', '$2y$10$eT7T94umvGCXkIDIFiqJJ.OvjR8lFoVYf1n5DFfk/GHR5pgiF74n6', 'A', '2023-06-14 16:14:51', NULL, 3, 675, 9, '1005484152'),
(676, 'Santo', 'Santiago', 'Ortega', '$2y$10$78HStnH4BwKQ5oc.7u30K.SzhUu.VKNP.leMtd80EWYl5FzdGXfW.', 'A', '2023-06-14 16:14:51', NULL, 3, 676, 9, '1005484152'),
(677, 'Santo', 'Santiago', 'Ortega', '$2y$10$y.xOxlRrULhI.H36VEin5uqBJ41sUUxWk35Kl0xOYZ9b21MPRYFNu', 'A', '2023-06-14 16:14:51', NULL, 3, 677, 9, '1005484152'),
(678, 'Santo', 'Santiago', 'Ortega', '$2y$10$BPP1yk5RdTQI5pPOZQbEwO0pt73GELAFnF.8WbkhEXKeXOBHjoWLS', 'A', '2023-06-14 16:14:52', NULL, 3, 678, 9, '1005484152'),
(679, 'Santo', 'Santiago', 'Ortega', '$2y$10$KJK4rBrMdQPuSL9UdbPcIuSkXqR8DgjgqUoSrF3meL8BDqat5sS5K', 'A', '2023-06-14 16:14:51', NULL, 3, 679, 9, '1005484152'),
(680, 'Santo', 'Santiago', 'Ortega', '$2y$10$PXPu6hEkmfEI/CqK6FDF.ucm8WleG7cfwuMKUqA6pv35b6rhR3hw6', 'A', '2023-06-14 16:14:51', NULL, 3, 680, 9, '1005484152'),
(681, 'Santo', 'Santiago', 'Ortega', '$2y$10$2tCbOeD8HP5TK8J/sS6GsuBTbzt5vCI7qB5K9dOfzlKNUpFTLbkC.', 'A', '2023-06-14 16:14:51', NULL, 3, 681, 9, '1005484152'),
(682, 'Santo', 'Santiago', 'Ortega', '$2y$10$qT/JQ7Pf/izcrinldkX5Pu60V5rKiIqA7HEf87zA5GokTgpBXEVuS', 'A', '2023-06-14 16:14:52', NULL, 3, 682, 9, '1005484152'),
(683, 'Santo', 'Santiago', 'Ortega', '$2y$10$YAcd2YzORzrZNMFD2vCGIupx6JZ1wt.qF3YgB/VxVQtPRZY3/GARG', 'A', '2023-06-14 16:14:51', NULL, 3, 683, 9, '1005484152'),
(684, 'Santo', 'Santiago', 'Ortega', '$2y$10$pfXbm04kogwCbIBpkiBPbuXdr1wgoEQZ0h9mtPK1HGwYsIUo7MxEi', 'A', '2023-06-14 16:14:52', NULL, 3, 684, 9, '1005484152'),
(685, 'Santo', 'Santiago', 'Ortega', '$2y$10$jBH0OvYK5uImbfo8Q9jjV.bGvbdys55svYEZelZGPWek9Cos/mbIO', 'A', '2023-06-14 16:14:52', NULL, 3, 685, 9, '1005484152'),
(686, 'Santo', 'Santiago', 'Ortega', '$2y$10$L8v804LtRgBfCwtKjhZU.OhfMW/APJTBN2LfrLuWIpnOhHcYbGmM6', 'A', '2023-06-14 16:14:52', NULL, 3, 686, 9, '1005484152'),
(687, 'Santo', 'Santiago', 'Ortega', '$2y$10$lxzNaGsfkdfAhXlJC55ZW./mfXBbiI6aE6KFOZiDlLCv89aEjwyei', 'A', '2023-06-14 16:14:52', NULL, 3, 687, 9, '1005484152'),
(688, 'Santo', 'Santiago', 'Ortega', '$2y$10$Ae/.w4cnXavM.rdunYmHo.ldvzT8UzvTu1MxScPpLAgzaupmmjyw.', 'A', '2023-06-14 16:14:52', NULL, 3, 688, 9, '1005484152'),
(689, 'Santo', 'Santiago', 'Ortega', '$2y$10$lbyt9kdzS4fskpWfNzvwG.mdXfppJAa1Sz5.9/8gKibQ6rnkrIRkG', 'A', '2023-06-14 16:14:52', NULL, 3, 689, 9, '1005484152'),
(690, 'Santo', 'Santiago', 'Ortega', '$2y$10$/CwXJDdRRSttJTpxk.3Td.aK153S4IUVkQ4Eb.om264ho8JxU78Bm', 'A', '2023-06-14 16:14:52', NULL, 3, 690, 9, '1005484152'),
(691, 'Santo', 'Santiago', 'Ortega', '$2y$10$6Zcjw8O61zN/HVL5jO1.V.YmU7qsuPmgc9kQlESme6r9d47qK3RTy', 'A', '2023-06-14 16:14:52', NULL, 3, 691, 9, '1005484152'),
(692, 'Santo', 'Santiago', 'Ortega', '$2y$10$VCXqP7D/uo9oeUshsLpPYOSrxaZ/ZIaV0.Oj.mcbfnQzjrqNilAhO', 'A', '2023-06-14 16:14:52', NULL, 3, 692, 9, '1005484152');
INSERT INTO `usuarios` (`id_usuario`, `usuario`, `nombre`, `apellido`, `pass`, `estado`, `fecha_crea`, `token`, `id_rol`, `usuario_crea`, `tipo_documento`, `num_documento`) VALUES
(693, 'Santo', 'Santiago', 'Ortega', '$2y$10$ygv8veKMF2AGkIOc.vUzx.3daS9QxOJz5.0fg3mtQ1qgCtVUVPb2e', 'A', '2023-06-14 16:14:52', NULL, 3, 693, 9, '1005484152'),
(694, 'Santo', 'Santiago', 'Ortega', '$2y$10$mxGaCTIySEVPu9Pw99mXYeFHKxis97sHdgmE1VQeCykb4N2NcRVi.', 'A', '2023-06-14 16:14:52', NULL, 3, 694, 9, '1005484152'),
(695, 'Santo', 'Santiago', 'Ortega', '$2y$10$6Cgis1z0Z1vQDvTxqgIV2.0x8u1bP./g8LBquDNWVGeLa9CmwIyay', 'A', '2023-06-14 16:14:52', NULL, 3, 695, 9, '1005484152'),
(696, 'Santo', 'Santiago', 'Ortega', '$2y$10$XDHFnb9pVzfHQW5k1PNaU.ToCPW34Lvq4uqpV.vxqB.Hm9lOWmqs6', 'A', '2023-06-14 16:14:52', NULL, 3, 696, 9, '1005484152'),
(697, 'Santo', 'Santiago', 'Ortega', '$2y$10$tedtrFlsJEiUm3aOr8tZHOilahrobNoMK9UMJjaHHVWDCyUtbJheS', 'A', '2023-06-14 16:14:52', NULL, 3, 697, 9, '1005484152'),
(698, 'Santo', 'Santiago', 'Ortega', '$2y$10$SMK/ubVP07MEwAOGD4RG8e7j3RuGskssdBATz20NufJpkC0Zodndm', 'A', '2023-06-14 16:14:52', NULL, 3, 698, 9, '1005484152'),
(699, 'Santo', 'Santiago', 'Ortega', '$2y$10$qbPl/ESkG.HjM3g5Lm2WTuv0aAy5xKJyoXI.jYGLT7tKUZpKnwvLi', 'A', '2023-06-14 16:14:52', NULL, 3, 699, 9, '1005484152'),
(700, 'Santo', 'Santiago', 'Ortega', '$2y$10$1IJkPZjW/PepzbvN9mri6.OvHQUWYGvELAm6wf.V3O2SBeA/OE.ue', 'A', '2023-06-14 16:14:52', NULL, 3, 700, 9, '1005484152'),
(701, 'Santo', 'Santiago', 'Ortega', '$2y$10$04c9dhdVV47WIFishm44y..jA/w5Re6si3ZOt1uN68FsEiQqpiP3m', 'A', '2023-06-14 16:14:52', NULL, 3, 701, 9, '1005484152'),
(702, 'Santo', 'Santiago', 'Ortega', '$2y$10$Rn1CeFkZNjLrhM0RoBUXbe0eF4IucIACG/IZM3eMh52DkHmKYGrB2', 'A', '2023-06-14 16:14:53', NULL, 3, 702, 9, '1005484152'),
(703, 'Santo', 'Santiago', 'Ortega', '$2y$10$eksggRX88ifdZecEZaR1buwpRTjpaLcUjF6FLFje83VP/qK6rwiaC', 'A', '2023-06-14 16:14:53', NULL, 3, 703, 9, '1005484152'),
(704, 'Santo', 'Santiago', 'Ortega', '$2y$10$Ce1f7Hc1d3QZQC.hSpWIVeBLvHqy2Nn0UDfE1cxd/RQTDdsxNJsPq', 'A', '2023-06-14 16:14:53', NULL, 3, 704, 9, '1005484152'),
(705, 'Santo', 'Santiago', 'Ortega', '$2y$10$YAQd6k.0eZ1VgdIYCLAiFu0jNG3knYt57QHYBMNjrRz.EukLDrnLO', 'A', '2023-06-14 16:14:53', NULL, 3, 705, 9, '1005484152'),
(706, 'Santo', 'Santiago', 'Ortega', '$2y$10$1uvUmmhWc5uKS30hSJDFoe0BQbjBFPp8cTXSTBBYAT0.Ix8aZBIhS', 'A', '2023-06-14 16:14:53', NULL, 3, 706, 9, '1005484152'),
(707, 'Santo', 'Santiago', 'Ortega', '$2y$10$9QWeYtC.qSCM.pk5OIKaeO17Rkxq3nfu.A9R3E.MKjUq7aMpyZFgq', 'A', '2023-06-14 16:14:53', NULL, 3, 707, 9, '1005484152'),
(708, 'Santo', 'Santiago', 'Ortega', '$2y$10$T63S6YaYXgNRhjwG1lRvXO7ey2MpdKF/aAICkmDuF/GkmcR7CCkty', 'A', '2023-06-14 16:14:53', NULL, 3, 708, 9, '1005484152'),
(709, 'Santo', 'Santiago', 'Ortega', '$2y$10$onVohmoyC.Q0SoZrsKSEY.a7lq.aVAMC0wOEsEvoJty08jYBsvhEG', 'A', '2023-06-14 16:14:53', NULL, 3, 709, 9, '1005484152'),
(710, 'Santo', 'Santiago', 'Ortega', '$2y$10$uJvv3SOdCALpQ4kOMw5e5uHImdWOsDo4n9q856NX8PFsY.R3NaXJq', 'A', '2023-06-14 16:14:53', NULL, 3, 710, 9, '1005484152'),
(711, 'Santo', 'Santiago', 'Ortega', '$2y$10$XguyrPHYcEf5B4GX0Ws6uu7RM3exSOLLl6TcEH8HWBsLXoFcWCvn.', 'A', '2023-06-14 16:14:53', NULL, 3, 711, 9, '1005484152'),
(712, 'Santo', 'Santiago', 'Ortega', '$2y$10$EO8180HRhLNBfohhnSRHkOdoIss37WkSRW8RFBJ1nx.iNSNi7UPCi', 'A', '2023-06-14 16:14:54', NULL, 3, 712, 9, '1005484152'),
(713, 'Santo', 'Santiago', 'Ortega', '$2y$10$lSZrHkDon4jyFSMWLdTfK.WTCtbYiRNa/Zs9MZPjH1gzIUrmxuW4O', 'A', '2023-06-14 16:14:54', NULL, 3, 713, 9, '1005484152'),
(714, 'Santo', 'Santiago', 'Ortega', '$2y$10$1bu/bmTXQuGRwy2x1oYXJuVOy/T/p002igWinsXKheadta6qCoeSi', 'A', '2023-06-14 16:14:54', NULL, 3, 714, 9, '1005484152'),
(715, 'Santo', 'Santiago', 'Ortega', '$2y$10$S2lSfcz.nHBglFnBVpeGr.oHDfBt3/ZGOQk8R1Gsfl3lk4waIbbmO', 'A', '2023-06-14 16:14:54', NULL, 3, 715, 9, '1005484152'),
(716, 'Santo', 'Santiago', 'Ortega', '$2y$10$mG1Cyz0hkTVxvrE0nZ.DP..FGjfjbbXbGxvXfCWZUcYUI0EUGsGNS', 'A', '2023-06-14 16:14:54', NULL, 3, 716, 9, '1005484152'),
(717, 'Santo', 'Santiago', 'Ortega', '$2y$10$1M/B51bPyEtm1lL.2GSGjuFoUcde7ILMlUnYGw/oj6dJVAt1knV.S', 'A', '2023-06-14 16:14:54', NULL, 3, 717, 9, '1005484152'),
(718, 'Santo', 'Santiago', 'Ortega', '$2y$10$gZkZXZc2EyYzVkXohjFQ/.V.4/9Kf8JiAtejEwz5RRabdkTT0hjvS', 'A', '2023-06-14 16:14:54', NULL, 3, 718, 9, '1005484152'),
(719, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZofZOIwzRKhtQRJVsOPuQOVsxMG1nwNqRN1rUdyksKiS3RBUMM2Ky', 'A', '2023-06-14 16:14:54', NULL, 3, 719, 9, '1005484152'),
(720, 'Santo', 'Santiago', 'Ortega', '$2y$10$NNgOPZTNAy3ff44Z9V9kk.0Qs8R3fxH8teLYBUL6Lm4MNyk6O6QJK', 'A', '2023-06-14 16:14:54', NULL, 3, 720, 9, '1005484152'),
(721, 'Santo', 'Santiago', 'Ortega', '$2y$10$69VyG815D3P160/dSWbdxut..TG91MvdXezAbd83lGTteq6X42/SK', 'A', '2023-06-14 16:14:54', NULL, 3, 721, 9, '1005484152'),
(722, 'Santo', 'Santiago', 'Ortega', '$2y$10$5KrYF80sb0wsHa6d60..6.hHtUAV9yCOIDInYWfuHiBaP/wnai8sG', 'A', '2023-06-14 16:14:54', NULL, 3, 722, 9, '1005484152'),
(723, 'Santo', 'Santiago', 'Ortega', '$2y$10$hbHeqEWPNX85qHA.CoHooe7Zo32p/xHyFq6y4N2nv8hE/hAlsdGR6', 'A', '2023-06-14 16:14:54', NULL, 3, 723, 9, '1005484152'),
(724, 'Santo', 'Santiago', 'Ortega', '$2y$10$nDrplzftWkuwHw9NFncMIeoV1w2N.cojlWpfaVFPHyMsKvUD5DN.S', 'A', '2023-06-14 16:14:54', NULL, 3, 724, 9, '1005484152'),
(725, 'Santo', 'Santiago', 'Ortega', '$2y$10$S4FG8N807ZzP1PbrGPtGwOhkKFCIk1cX/muEzngRsaHLWkIh0dDk.', 'A', '2023-06-14 16:14:54', NULL, 3, 725, 9, '1005484152'),
(726, 'Santo', 'Santiago', 'Ortega', '$2y$10$dLyKVfNW6o9ykOra5bt9heCKgFvGivkgogfoe1m.otiJLNQA7htuG', 'A', '2023-06-14 16:14:54', NULL, 3, 726, 9, '1005484152'),
(727, 'Santo', 'Santiago', 'Ortega', '$2y$10$DcrbYnReLl7tMtiiYqEG9u22UuQBjiqcMGJbGCIJVScmRUuMAsN9O', 'A', '2023-06-14 16:14:54', NULL, 3, 727, 9, '1005484152'),
(728, 'Santo', 'Santiago', 'Ortega', '$2y$10$rC5BXw1MmOZqAx2Spq5pH.0KODNw4puR6eCAj.8ZEk4.CaznZX4dO', 'A', '2023-06-14 16:14:54', NULL, 3, 728, 9, '1005484152'),
(729, 'Santo', 'Santiago', 'Ortega', '$2y$10$2KweeTG/pj11SUZo7PsWVuzKRtwLhf7bWrS0BZbpfJZr1S79w1mgq', 'A', '2023-06-14 16:14:54', NULL, 3, 729, 9, '1005484152'),
(730, 'Santo', 'Santiago', 'Ortega', '$2y$10$Vwi1u8E9Wett1ZiUijegI.Qm/anmu644hY1I2NURc.qa3s42Iw6lC', 'A', '2023-06-14 16:14:54', NULL, 3, 730, 9, '1005484152'),
(731, 'Santo', 'Santiago', 'Ortega', '$2y$10$vaw6jQKJQa9rWtkjKZFk4O752IESdIyD5m1N16SA/fbLs7KeWU7GO', 'A', '2023-06-14 16:14:54', NULL, 3, 731, 9, '1005484152'),
(732, 'Santo', 'Santiago', 'Ortega', '$2y$10$BlUBJQ7tfWgO08TP9PEQ3eHiO0KyNarciDLxKIKPqIDOZMqXaG4Ey', 'A', '2023-06-14 16:14:54', NULL, 3, 732, 9, '1005484152'),
(733, 'Santo', 'Santiago', 'Ortega', '$2y$10$H/7798S5xMkmQqTafXBOJ.XzSI1ngzoiiV0PGqh.KWpm7hMc9r2XW', 'A', '2023-06-14 16:14:54', NULL, 3, 733, 9, '1005484152'),
(734, 'Santo', 'Santiago', 'Ortega', '$2y$10$EBxQEodVy5OKakZd0Mbe0eSIVJ1Y4brF05vm927jOPlpoVsB3WPgW', 'A', '2023-06-14 16:14:54', NULL, 3, 734, 9, '1005484152'),
(735, 'Santo', 'Santiago', 'Ortega', '$2y$10$whtjFwwt6uzSim7fleipQ.qLxTankcV819idhalWuTRWSGQm5QAru', 'A', '2023-06-14 16:14:54', NULL, 3, 735, 9, '1005484152'),
(736, 'Santo', 'Santiago', 'Ortega', '$2y$10$pZzeoX7Ep6ldsPnrRwlUIOCWbVvd.MEG5vH1W1epHUSm68JnRJqvC', 'A', '2023-06-14 16:14:54', NULL, 3, 736, 9, '1005484152'),
(737, 'Santo', 'Santiago', 'Ortega', '$2y$10$BjwoP6hlrssrHPBd4nh1xeLP7GeRaHEvWO.icUuVmgpz4j5GoHQrW', 'A', '2023-06-14 16:14:54', NULL, 3, 737, 9, '1005484152'),
(738, 'Santo', 'Santiago', 'Ortega', '$2y$10$5SZcQJn2KrbytlXcIPf2Yu9wOhwfiYlSzw0PdscErfMqx6b/Fzpni', 'A', '2023-06-14 16:14:54', NULL, 3, 738, 9, '1005484152'),
(739, 'Santo', 'Santiago', 'Ortega', '$2y$10$.DwUr39xn6M8y8XPNVtJRuQzLVmACFQzSeLQqOlucDyCzDgu3BD/q', 'A', '2023-06-14 16:14:54', NULL, 3, 739, 9, '1005484152'),
(740, 'Santo', 'Santiago', 'Ortega', '$2y$10$eXErbX6B71H7bh1u4QGr0u7JJWEgVKSV4jE9OvAf5FtR7Z0yKy1L2', 'A', '2023-06-14 16:14:54', NULL, 3, 740, 9, '1005484152'),
(741, 'Santo', 'Santiago', 'Ortega', '$2y$10$h2tVvXt.SCGLQZMINFwS0eeVexuMnp.W6TI6jL8Sro0IlMsCOtfQK', 'A', '2023-06-14 16:14:54', NULL, 3, 741, 9, '1005484152'),
(742, 'Santo', 'Santiago', 'Ortega', '$2y$10$h4Hai7Rlfu2dACMsbWLlIOREUuLlmWrTc91I5C9ZThKueSp1umTFS', 'A', '2023-06-14 16:14:54', NULL, 3, 742, 9, '1005484152'),
(743, 'Santo', 'Santiago', 'Ortega', '$2y$10$9GL8dQljEz6jhq0ftbItQuumV89NiOjxYeCYdCsJTw/3mAeAbcNpy', 'A', '2023-06-14 16:14:54', NULL, 3, 743, 9, '1005484152'),
(744, 'Santo', 'Santiago', 'Ortega', '$2y$10$M8ojNB6zFyokVMJ8acW3fe.BJf7ZtA4mx3lEMJMCC2/2dH.X.I6gy', 'A', '2023-06-14 16:14:54', NULL, 3, 744, 9, '1005484152'),
(745, 'Santo', 'Santiago', 'Ortega', '$2y$10$8fm/OKP19Jw4kMs1lIqqhe3i84HYeIY4uLMemi0VMgoqZuuoXN.De', 'A', '2023-06-14 16:14:54', NULL, 3, 745, 9, '1005484152'),
(746, 'Santo', 'Santiago', 'Ortega', '$2y$10$q/eaQwwueHie7ypAYbEh3.jkh.qLstY3omPl59MQXLMsg6hK/KJq.', 'A', '2023-06-14 16:14:54', NULL, 3, 746, 9, '1005484152'),
(747, 'Santo', 'Santiago', 'Ortega', '$2y$10$FmhryNa7UsL6dmpz77KvgO70Dx1b9UzmmoLWMIXYNyCtOiS3g77.a', 'A', '2023-06-14 16:14:54', NULL, 3, 747, 9, '1005484152'),
(748, 'Santo', 'Santiago', 'Ortega', '$2y$10$NAKVDDUVGWvZMKNBHg8HueydVtMY/wi2p5Q5OGeHEQ8SOf6gEnIB6', 'A', '2023-06-14 16:14:54', NULL, 3, 748, 9, '1005484152'),
(749, 'Santo', 'Santiago', 'Ortega', '$2y$10$Ao75j5Nef7VKnKgNSX.r6O3jTGhZrOnLHeLj2nfMz1pCvuo.wrV1C', 'A', '2023-06-14 16:14:54', NULL, 3, 749, 9, '1005484152'),
(750, 'Santo', 'Santiago', 'Ortega', '$2y$10$4mGq3yGAfbQoJuHNceos9uBrRvf704jL39kQQe4pKAfZGtFdywliy', 'A', '2023-06-14 16:14:54', NULL, 3, 750, 9, '1005484152'),
(751, 'Santo', 'Santiago', 'Ortega', '$2y$10$9sTdB9g3sCWjwQowFtWHVO680i/FejY/z87.MA0D40QyHZJFhcniC', 'A', '2023-06-14 16:14:54', NULL, 3, 751, 9, '1005484152'),
(752, 'Santo', 'Santiago', 'Ortega', '$2y$10$X903RY.dyPq5avz5oVrEGe2qdjCxMFMqCHtyLR6EoI.Z/S92PMtu.', 'A', '2023-06-14 16:14:54', NULL, 3, 752, 9, '1005484152'),
(753, 'Santo', 'Santiago', 'Ortega', '$2y$10$dDgA0aagF7W3LDS/.tuBveTgbmg7po7RRu5Yz2cBdv4kQqT/7GRIi', 'A', '2023-06-14 16:14:54', NULL, 3, 753, 9, '1005484152'),
(754, 'Santo', 'Santiago', 'Ortega', '$2y$10$fU1JPvQkAv7cnF/chz4um.tO9ir5Kj.2pXQ6axUuDVFEFIw0RBRBa', 'A', '2023-06-14 16:14:54', NULL, 3, 754, 9, '1005484152'),
(755, 'Santo', 'Santiago', 'Ortega', '$2y$10$rUIG15JHrAf3uVo05fvRYOrag2qboUmPnbdiyf5w6EEeCQOpogrAO', 'A', '2023-06-14 16:14:54', NULL, 3, 755, 9, '1005484152'),
(756, 'Santo', 'Santiago', 'Ortega', '$2y$10$xzo630VnbTc7hRTfBbdUJ.NR/KtSBEF5mCxxGm5.CWIW8m5nlc5BK', 'A', '2023-06-14 16:14:54', NULL, 3, 756, 9, '1005484152'),
(757, 'Santo', 'Santiago', 'Ortega', '$2y$10$Jbf7jA/U20eyn5/KCMTe/OtSHiixluXbHGmyf5JbwWuXibJV0ej46', 'A', '2023-06-14 16:14:54', NULL, 3, 757, 9, '1005484152'),
(758, 'Santo', 'Santiago', 'Ortega', '$2y$10$yAUrfcQIVALKwFX591R29uaZ8T2dhgLKBU6rI2vGJF1Ua2DOIPRLW', 'A', '2023-06-14 16:14:54', NULL, 3, 758, 9, '1005484152'),
(759, 'Santo', 'Santiago', 'Ortega', '$2y$10$v5GqkyxL1zoa9TDzxo/QVeRPg0x2FrnZn8uDaX5xwen9j4PwtF0pC', 'A', '2023-06-14 16:14:54', NULL, 3, 759, 9, '1005484152'),
(760, 'Santo', 'Santiago', 'Ortega', '$2y$10$/wxvKPOKSdQtdnYbbTyIm.uTpP4IHzR2.k7Je.4d3vmc98Hl4kUOy', 'A', '2023-06-14 16:14:54', NULL, 3, 760, 9, '1005484152'),
(761, 'Santo', 'Santiago', 'Ortega', '$2y$10$6mHtOqt4Tlsirz4zu8n5zu5REuZyMzVgy11PW9onn8eDT2I1eQ6FW', 'A', '2023-06-14 16:14:54', NULL, 3, 761, 9, '1005484152'),
(762, 'Santo', 'Santiago', 'Ortega', '$2y$10$4GYmbvIERo2uYKUtI6ljSelj2au0UX9h5YjEODyZn.JyA06M4/Fqe', 'A', '2023-06-14 16:14:54', NULL, 3, 762, 9, '1005484152'),
(763, 'Santo', 'Santiago', 'Ortega', '$2y$10$BeXM6NDzGNfJbxjZgCVTi.2cGBwsZ4d9WKSIVJclX1j7ZOlO2sUhC', 'A', '2023-06-14 16:14:54', NULL, 3, 763, 9, '1005484152'),
(764, 'Santo', 'Santiago', 'Ortega', '$2y$10$t1QRPmH1YWzHinixqn.db.PZEgHbiGicMUAPYBY4rheKEKt2BGj2y', 'A', '2023-06-14 16:14:54', NULL, 3, 764, 9, '1005484152'),
(765, 'Santo', 'Santiago', 'Ortega', '$2y$10$BwNyQsT14YmYpuuhTcriT.EhFzXZkeHDzJrnMJXIcf4vbS6dR92d6', 'A', '2023-06-14 16:14:54', NULL, 3, 765, 9, '1005484152'),
(766, 'Santo', 'Santiago', 'Ortega', '$2y$10$UGmSro/pjeJytOM3dYxuZeCByMC8No/KnKxB8okF0LeTTRSxh.ldK', 'A', '2023-06-14 16:14:54', NULL, 3, 766, 9, '1005484152'),
(767, 'Santo', 'Santiago', 'Ortega', '$2y$10$MIYGB3C7N8QHhx5sbglxve3Ftro/vbrOCi805YshmU15n6WDwvaja', 'A', '2023-06-14 16:14:54', NULL, 3, 767, 9, '1005484152'),
(768, 'Santo', 'Santiago', 'Ortega', '$2y$10$M3i2D2qzARFA8tAHCIxsqOJWkVrmPddD/aurjUJzSRkpWRU6sUvEC', 'A', '2023-06-14 16:14:54', NULL, 3, 768, 9, '1005484152'),
(769, 'Santo', 'Santiago', 'Ortega', '$2y$10$SL2wzME9bj6ht7680egMvu3ktXCryHu4e243aE1Vd66RShYP1z/ky', 'A', '2023-06-14 16:14:54', NULL, 3, 769, 9, '1005484152'),
(770, 'Santo', 'Santiago', 'Ortega', '$2y$10$zywy5VvxtL6YBQn1NHqGf.R7uqlon/GZsCBc9uZuNm6qKn76aq0Ku', 'A', '2023-06-14 16:14:54', NULL, 3, 770, 9, '1005484152'),
(771, 'Santo', 'Santiago', 'Ortega', '$2y$10$AgLd5lgjZ.YbjzJs6uNqUO90GNZdyYVp2MpNfA09iyKDW1hQpkC2.', 'A', '2023-06-14 16:14:54', NULL, 3, 771, 9, '1005484152'),
(772, 'Santo', 'Santiago', 'Ortega', '$2y$10$/IdQFtRvdaiutBBHWL3Qk.ZcTLdYOvfQFr6.F5OHaGK5pE3IC0Pw6', 'A', '2023-06-14 16:14:54', NULL, 3, 772, 9, '1005484152'),
(773, 'Santo', 'Santiago', 'Ortega', '$2y$10$FayZWzgDi.d14/wxHMX5DesxktVbINb1z3nWGm9zqN9HMPqfgq9y.', 'A', '2023-06-14 16:14:54', NULL, 3, 773, 9, '1005484152'),
(774, 'Santo', 'Santiago', 'Ortega', '$2y$10$AhN.ZcMcgMbyIkwWMMv3weKWfU3VS6XPQmKYtzjzvGHZVDy5BApf6', 'A', '2023-06-14 16:14:54', NULL, 3, 774, 9, '1005484152'),
(775, 'Santo', 'Santiago', 'Ortega', '$2y$10$z/tuafV7rPvJZnpxIW27iuvSZBO/RpkKwqy/cgcHSNl0B99zzUq3a', 'A', '2023-06-14 16:14:54', NULL, 3, 775, 9, '1005484152'),
(776, 'Santo', 'Santiago', 'Ortega', '$2y$10$bCdjlomfF0o3Xuc0YXT98O3walJhTa7w.oaz9B6Z7aeTPz57hjUAW', 'A', '2023-06-14 16:14:54', NULL, 3, 776, 9, '1005484152'),
(777, 'Santo', 'Santiago', 'Ortega', '$2y$10$zS4EOMrCwXoCsf9Zt4G0VuSbDPomak0scjvd4TqujSBn9j.8VJxBG', 'A', '2023-06-14 16:14:54', NULL, 3, 777, 9, '1005484152'),
(778, 'Santo', 'Santiago', 'Ortega', '$2y$10$F/moY5Q9p2YZ5mk9fe9s7uemaCeEM9t1jy05cLK2S7GUh7m0ED1pu', 'A', '2023-06-14 16:14:54', NULL, 3, 778, 9, '1005484152'),
(779, 'Santo', 'Santiago', 'Ortega', '$2y$10$.faey2K/qJksrVvXajNsJuUGIJB1c5Hobhs4PJshnaXYLEnQ5MQom', 'A', '2023-06-14 16:14:54', NULL, 3, 779, 9, '1005484152'),
(780, 'Santo', 'Santiago', 'Ortega', '$2y$10$5AVMdUlaEo9USvOiQ.KO7OzG/QywCc35FNiZuRADlgKWPYbWYMLMG', 'A', '2023-06-14 16:14:54', NULL, 3, 780, 9, '1005484152'),
(781, 'Santo', 'Santiago', 'Ortega', '$2y$10$/2jvSPRyoIxNWjA6ylORiOyswQnpXCLrxMGMR.1RzXCTLBQXxFcs6', 'A', '2023-06-14 16:14:54', NULL, 3, 781, 9, '1005484152'),
(782, 'Santo', 'Santiago', 'Ortega', '$2y$10$ienk29336XjO.cCjinA9quqFhuvK4VfiN09CY7BzS/yDLroICg6Qu', 'A', '2023-06-14 16:14:54', NULL, 3, 782, 9, '1005484152'),
(783, 'Santo', 'Santiago', 'Ortega', '$2y$10$EHTH7aTPs0YqfVdkgTcId.XiRtouWyjHJYL0DSvOknkqAP.GFyXJi', 'A', '2023-06-14 16:14:54', NULL, 3, 783, 9, '1005484152'),
(784, 'Santo', 'Santiago', 'Ortega', '$2y$10$gc4FlY2rTp5EudR3CWOllO85SIfYkDxs7YVoSQyOwRJ9vSRsAEuAy', 'A', '2023-06-14 16:14:54', NULL, 3, 784, 9, '1005484152'),
(785, 'Santo', 'Santiago', 'Ortega', '$2y$10$fGFiZ1Cw3t1odcpP0EMg0eHWuQoVZeLsHjX6T4q/I9KKkNAXkaC3S', 'A', '2023-06-14 16:14:54', NULL, 3, 785, 9, '1005484152'),
(786, 'Santo', 'Santiago', 'Ortega', '$2y$10$C4Un3g8ID8vPInSv18dmsemMQ./6VlCYiWWQuOa.3GFvXKoU8.Swm', 'A', '2023-06-14 16:14:54', NULL, 3, 786, 9, '1005484152'),
(787, 'Santo', 'Santiago', 'Ortega', '$2y$10$OC97K8H9eo6RtQlSO39sKemeBZMztVb4BzRl2qi.2wcsRgtv2WtuK', 'A', '2023-06-14 16:14:55', NULL, 3, 787, 9, '1005484152'),
(788, 'Santo', 'Santiago', 'Ortega', '$2y$10$8E5WJbknA65FQY6JufB4i.pDd5flueHYL0tGZVIYhFYAhHnZTMf5S', 'A', '2023-06-14 16:14:55', NULL, 3, 788, 9, '1005484152'),
(789, 'Santo', 'Santiago', 'Ortega', '$2y$10$isTABO9HdNAF1Ixmv6qip.mJcuTEq9EkrRZnGhf0Y/9A.YrHd3tGq', 'A', '2023-06-14 16:14:55', NULL, 3, 789, 9, '1005484152'),
(790, 'Santo', 'Santiago', 'Ortega', '$2y$10$AG34H2JrwfpZzCibZ6Kbd.EoVuIUyBX/mwMI7bNffQ1OSV/XIMnBq', 'A', '2023-06-14 16:14:54', NULL, 3, 790, 9, '1005484152'),
(791, 'Santo', 'Santiago', 'Ortega', '$2y$10$OhrHsyFcu0BL2I1WdiM81elXezht41TzgWpNBkKJKttwqBI5XxST.', 'A', '2023-06-14 16:14:55', NULL, 3, 791, 9, '1005484152'),
(792, 'Santo', 'Santiago', 'Ortega', '$2y$10$ynqQViq6A57.Baf7ZRyRHOdUDR662YcDb5YaLNzA8UQvmjKKLiY9K', 'A', '2023-06-14 16:14:54', NULL, 3, 792, 9, '1005484152'),
(793, 'Santo', 'Santiago', 'Ortega', '$2y$10$RhyHYqMyy/E8Z3lw1b/IZuDWdR28ID08AUX3uJgEnVchnjBqBRaGS', 'A', '2023-06-14 16:14:54', NULL, 3, 793, 9, '1005484152'),
(794, 'Santo', 'Santiago', 'Ortega', '$2y$10$yjht03ShGZ7xhY9QM2twl.4WWqtAe14xry/F.kqYB42eGV5hym9Ai', 'A', '2023-06-14 16:14:54', NULL, 3, 794, 9, '1005484152'),
(795, 'Santo', 'Santiago', 'Ortega', '$2y$10$wOoRwYBe8tio4dcDdahY0uVNyans9fWbuEn0Q1uxaxiCvjvwCOOSe', 'A', '2023-06-14 16:14:54', NULL, 3, 795, 9, '1005484152'),
(796, 'Santo', 'Santiago', 'Ortega', '$2y$10$Fqh0t2i8Eivq48qW21CM3uyT4C0UKx0b09KYe6m4R3voO3dh9gJDO', 'A', '2023-06-14 16:14:54', NULL, 3, 796, 9, '1005484152'),
(797, 'Santo', 'Santiago', 'Ortega', '$2y$10$pSsFwPqiSAs2J12sOwCJZeKuppn4OFPSKTW/jlPhyMe3yTU/VCBN6', 'A', '2023-06-14 16:14:55', NULL, 3, 797, 9, '1005484152'),
(798, 'Santo', 'Santiago', 'Ortega', '$2y$10$02zHomBUNBpuJW1xh3v5QOikAouvLnUeedQwyiIQuatWDjLxXgm/.', 'A', '2023-06-14 16:14:55', NULL, 3, 798, 9, '1005484152'),
(799, 'Santo', 'Santiago', 'Ortega', '$2y$10$jPFZ/OzJYgEkQMOSv6x/N.2fcuLR/082Zt05XKwFSkTEFoYk45cV2', 'A', '2023-06-14 16:14:55', NULL, 3, 799, 9, '1005484152'),
(800, 'Santo', 'Santiago', 'Ortega', '$2y$10$E0Ar2vMFRJIHLspDgtgP7eB36XpErwsadiHf1PijJxYjOjG8zED72', 'A', '2023-06-14 16:14:55', NULL, 3, 800, 9, '1005484152'),
(801, 'Santo', 'Santiago', 'Ortega', '$2y$10$UpoqZ9fpwpVW0HcPl30HUeWGZIcT3xTN8LV5L4yuvvorNqq7Xpfo.', 'A', '2023-06-14 16:14:55', NULL, 3, 801, 9, '1005484152'),
(802, 'Santo', 'Santiago', 'Ortega', '$2y$10$wRCe32bNQq8kkKKtOyQBpuqIg1sK466Y47m2Y3e12zBx3eULTSnzC', 'A', '2023-06-14 16:14:55', NULL, 3, 802, 9, '1005484152'),
(803, 'Santo', 'Santiago', 'Ortega', '$2y$10$AG8RFZGV2.XKSyL04dJHyORsMzzxPzfvF.hos3Q86ypdZDZwjqihG', 'A', '2023-06-14 16:14:55', NULL, 3, 803, 9, '1005484152'),
(804, 'Santo', 'Santiago', 'Ortega', '$2y$10$r2I3SXo.74rHeRmmUBdpf.JO3dWnDSQg2pmZDjpVP1Ah7uyeAfvYi', 'A', '2023-06-14 16:14:55', NULL, 3, 804, 9, '1005484152'),
(805, 'Santo', 'Santiago', 'Ortega', '$2y$10$8G0P/8VWvKp22GWrEXQIvuRgASm.QTogANnFf4lXA2VB0bWPCfhde', 'A', '2023-06-14 16:14:55', NULL, 3, 805, 9, '1005484152'),
(806, 'Santo', 'Santiago', 'Ortega', '$2y$10$zrTdp8vbgXbgCOgdAIW4YelB4hQVB1pRZq9JJzI9muvDcdIt/oSUS', 'A', '2023-06-14 16:14:55', NULL, 3, 806, 9, '1005484152'),
(807, 'Santo', 'Santiago', 'Ortega', '$2y$10$SCcvfHuvmDe7YC68IxEm1uhLXTCJI6XUjV0XUu5u4PMp5s6dIzyE6', 'A', '2023-06-14 16:14:55', NULL, 3, 807, 9, '1005484152'),
(808, 'Santo', 'Santiago', 'Ortega', '$2y$10$12TjOS70jLNMsYlzSCF4ZujcTIkl4FSLTm7kNh8WlDTGYEIR.oACi', 'A', '2023-06-14 16:14:55', NULL, 3, 808, 9, '1005484152'),
(809, 'Santo', 'Santiago', 'Ortega', '$2y$10$3HVY1FymBi0iXYCnLN.lseztpeV0CQG.dAbF7E75WUUHSmP4p0AlO', 'A', '2023-06-14 16:14:55', NULL, 3, 809, 9, '1005484152'),
(810, 'Santo', 'Santiago', 'Ortega', '$2y$10$g/Eik8d3Wk37T2dqlsy3R.OJgi5o/N9W5B5IUCiMrgPBx7NdM8pzi', 'A', '2023-06-14 16:14:55', NULL, 3, 810, 9, '1005484152'),
(811, 'Santo', 'Santiago', 'Ortega', '$2y$10$uf1Yd7A/bP1qWaVwYBCrquPAy.5WknvT/Z07lq2GzENMs4tBISsRi', 'A', '2023-06-14 16:14:55', NULL, 3, 811, 9, '1005484152'),
(812, 'Santo', 'Santiago', 'Ortega', '$2y$10$5CNk/A4DAk85u.2riBSVKO6cMdqsZCsQmSdfetlWUzPDE2DgolJp6', 'A', '2023-06-14 16:14:55', NULL, 3, 812, 9, '1005484152'),
(813, 'Santo', 'Santiago', 'Ortega', '$2y$10$Wpi6wAQIiW1T3JNUUPXquutMT2QTgNmrEUBdTeWEbu8IP6cWJEMUu', 'A', '2023-06-14 16:14:55', NULL, 3, 813, 9, '1005484152'),
(814, 'Santo', 'Santiago', 'Ortega', '$2y$10$f6tDsGrPJ6yNWiQboBEAvO6B7gtJfn1qErXowBzZp9n9jGQS191.S', 'A', '2023-06-14 16:14:55', NULL, 3, 814, 9, '1005484152'),
(815, 'Santo', 'Santiago', 'Ortega', '$2y$10$vYxFojkz5pENWPvkSm5LP./Tc/IGvqXNGxBbExTDhIaLMQO5PgjgO', 'A', '2023-06-14 16:14:55', NULL, 3, 815, 9, '1005484152'),
(816, 'Santo', 'Santiago', 'Ortega', '$2y$10$19SBDxNYm7jZEYPO8k5.juhkdY0c2LM5MBwCnfGjU0oQq6aYGtNKO', 'A', '2023-06-14 16:14:55', NULL, 3, 816, 9, '1005484152'),
(817, 'Santo', 'Santiago', 'Ortega', '$2y$10$PQ70Kg8A8JiCL4TzqgkvKusybN11F4EznSQqlQp9gnwyXqvUXdTAK', 'A', '2023-06-14 16:14:55', NULL, 3, 817, 9, '1005484152'),
(818, 'Santo', 'Santiago', 'Ortega', '$2y$10$3v384IzWVJ4HMORUJRlHVO9clbcK4vRwzqXI1S8GeAxeG.wg5KX.e', 'A', '2023-06-14 16:14:55', NULL, 3, 818, 9, '1005484152'),
(819, 'Santo', 'Santiago', 'Ortega', '$2y$10$bH6d0/s3YvRSZfIOL1FpAeYE4KnXVJXsKZLBKSCXFmHCc9lpCAoIO', 'A', '2023-06-14 16:14:55', NULL, 3, 819, 9, '1005484152'),
(820, 'Santo', 'Santiago', 'Ortega', '$2y$10$U00sB5/6bmB8U9mTcG5SzOBg4HGIDP7ghC54buAFawcBH1uQJ4iiO', 'A', '2023-06-14 16:14:55', NULL, 3, 820, 9, '1005484152'),
(821, 'Santo', 'Santiago', 'Ortega', '$2y$10$xoUFaFHCCrNFmbnmvz3X6OBuMW8PW.eacbdCD4O7JWrvdyl0Ij1WC', 'A', '2023-06-14 16:14:55', NULL, 3, 821, 9, '1005484152'),
(822, 'Santo', 'Santiago', 'Ortega', '$2y$10$FI4z1d3On.HlB0KamTh02eUdxK.gPaZqPAkOIq7IGxZHjbJ8x9Rdu', 'A', '2023-06-14 16:14:55', NULL, 3, 822, 9, '1005484152'),
(823, 'Santo', 'Santiago', 'Ortega', '$2y$10$NemGqYVrzq96TTltQ0Ye4uHjFpDdEBhpBJtnhyyrQWlBC7ph254fO', 'A', '2023-06-14 16:14:55', NULL, 3, 823, 9, '1005484152'),
(824, 'Santo', 'Santiago', 'Ortega', '$2y$10$tr8W9KF/dz9L.SBNj8qQ9Oc5MMvgWvsaHF7n5jToXNrxBijOuSuty', 'A', '2023-06-14 16:14:55', NULL, 3, 824, 9, '1005484152'),
(825, 'Santo', 'Santiago', 'Ortega', '$2y$10$Amys4TYfc.uRpLyVHD3Hf.fM1S4jc5T4QFYUCz2vEI0ScfSKQT/de', 'A', '2023-06-14 16:14:55', NULL, 3, 825, 9, '1005484152'),
(826, 'Santo', 'Santiago', 'Ortega', '$2y$10$1u2UiXLdUM.U6nqiFZzak.zVkRHGJ7StOQS/A5W6qXlInIOB5imeS', 'A', '2023-06-14 16:14:55', NULL, 3, 826, 9, '1005484152'),
(827, 'Santo', 'Santiago', 'Ortega', '$2y$10$7.zt7aMvm3QEE3RbZ7/Gce/g4UZOpMrqEE/K7Sp6sGcI4gJzRy/tG', 'A', '2023-06-14 16:14:55', NULL, 3, 827, 9, '1005484152'),
(828, 'Santo', 'Santiago', 'Ortega', '$2y$10$CHQYphhA/W9DI4b2OcR6Tu5XzLQqbZ8ZV6VjNEDhXiX9L1DSYVG8e', 'A', '2023-06-14 16:14:55', NULL, 3, 828, 9, '1005484152'),
(829, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZdwvHFMKrTWYLBcC8N7KL.LbJ5TR7v08RCKv65jS0blgMlRNg2DvW', 'A', '2023-06-14 16:14:55', NULL, 3, 829, 9, '1005484152'),
(830, 'Santo', 'Santiago', 'Ortega', '$2y$10$WUqNR4q5uOtIB1pITVgi9uN97H5UGvF7PJU2rI4EXuCAg0R1gOz0m', 'A', '2023-06-14 16:14:55', NULL, 3, 830, 9, '1005484152'),
(831, 'Santo', 'Santiago', 'Ortega', '$2y$10$wF1ywzgUICswdI1KvTRd0OBeig8VvxldCHft3tmOgx.4CMIBpM0wO', 'A', '2023-06-14 16:14:55', NULL, 3, 831, 9, '1005484152'),
(832, 'Santo', 'Santiago', 'Ortega', '$2y$10$GyVakFbpzIB2Ts/Arphu../7LJRtyXWuMfVp7zLUJkZaOiKI7nlrW', 'A', '2023-06-14 16:14:56', NULL, 3, 832, 9, '1005484152'),
(833, 'Santo', 'Santiago', 'Ortega', '$2y$10$NJuJuOdbRd.sRQJYoS5KKOM2L7PVCWs/4JcpKc8tQj9ZccgV6Ilxa', 'A', '2023-06-14 16:14:56', NULL, 3, 833, 9, '1005484152'),
(834, 'Santo', 'Santiago', 'Ortega', '$2y$10$NqBcbruaD47RBHNcDx3Brucq7sZ0kBS.PWTCP.1XaF3G7IxYZ3hHW', 'A', '2023-06-14 16:14:56', NULL, 3, 834, 9, '1005484152'),
(835, 'Santo', 'Santiago', 'Ortega', '$2y$10$KAoNNo4YSZBU66WKNSqLQOwyaf9H.5FmBZWVXcBCulPXgYz2EHknu', 'A', '2023-06-14 16:14:56', NULL, 3, 835, 9, '1005484152'),
(836, 'Santo', 'Santiago', 'Ortega', '$2y$10$wYU7KKv9K05RoOfod986RuHbQuM1j6PFcUKO5grbr9E.4THMQ/cCe', 'A', '2023-06-14 16:14:56', NULL, 3, 836, 9, '1005484152'),
(837, 'Santo', 'Santiago', 'Ortega', '$2y$10$EZN9Tacx0cRIHD44dnBotOegJ2T2WF5G/c5OmfKo1z3.4FIF28qPG', 'A', '2023-06-14 16:14:56', NULL, 3, 837, 9, '1005484152'),
(838, 'Santo', 'Santiago', 'Ortega', '$2y$10$J4L8xdac4bIejsNRE.XMOO2/8ok9nBXUu4HBUrQyvsDFTVswo6Cv2', 'A', '2023-06-14 16:14:56', NULL, 3, 838, 9, '1005484152'),
(839, 'Santo', 'Santiago', 'Ortega', '$2y$10$3KJaSlJqXzvHeS1RkxtuveJ.FH3y733gMx/CdnMwSWVNVXqiR6Hv.', 'A', '2023-06-14 16:14:56', NULL, 3, 839, 9, '1005484152'),
(840, 'Santo', 'Santiago', 'Ortega', '$2y$10$ms9gpB3AHVDoQQpYTRPTrePQ1ZmuXBNTuKDCLMUxR.ekcs0NJnqZu', 'A', '2023-06-14 16:14:56', NULL, 3, 840, 9, '1005484152'),
(841, 'Santo', 'Santiago', 'Ortega', '$2y$10$U5oBHaOBehp7IEHigOfZCOWXHwZL9gkDhqBIGurvtafCRpk1mivGK', 'A', '2023-06-14 16:14:56', NULL, 3, 841, 9, '1005484152'),
(842, 'Santo', 'Santiago', 'Ortega', '$2y$10$NTDi5twfC1Tz.yq7JtJ4puAQ9VqA1gScy58CYeTPr8S5Ili/lpiru', 'A', '2023-06-14 16:14:56', NULL, 3, 842, 9, '1005484152'),
(843, 'Santo', 'Santiago', 'Ortega', '$2y$10$f9u62tXomDusv9L4FVA38OGKf7DkYzpbICaTNJhLaZzrJaX41/uN6', 'A', '2023-06-14 16:14:56', NULL, 3, 843, 9, '1005484152'),
(844, 'Santo', 'Santiago', 'Ortega', '$2y$10$7gWqyuXH7scepVomTkNgEekzyr2uUivT84CFTCZmb1RH60O//u62.', 'A', '2023-06-14 16:14:56', NULL, 3, 844, 9, '1005484152'),
(845, 'Santo', 'Santiago', 'Ortega', '$2y$10$QbzB2syQwBRtnWHVg4QtSOXHBU3IeqNLniC/2UVd9QP2hfC32kEf.', 'A', '2023-06-14 16:14:56', NULL, 3, 845, 9, '1005484152'),
(846, 'Santo', 'Santiago', 'Ortega', '$2y$10$rcFZyzWiOtNWPSJ03sVb1..c8SwddieDLDZ0jvwBOZX23a9mNvEnm', 'A', '2023-06-14 16:14:56', NULL, 3, 846, 9, '1005484152'),
(847, 'Santo', 'Santiago', 'Ortega', '$2y$10$luz9uCLvfZA6uVOmXbgKbehddX4c.vMNrU.c8xwNDP8IYrI3JqR3W', 'A', '2023-06-14 16:14:56', NULL, 3, 847, 9, '1005484152'),
(848, 'Santo', 'Santiago', 'Ortega', '$2y$10$gzKUs6XxD32emcdkN9I5yOdBP8Fsu8fwQ1GZsmBvuHO8nptUAUmGq', 'A', '2023-06-14 16:14:56', NULL, 3, 848, 9, '1005484152'),
(849, 'Santo', 'Santiago', 'Ortega', '$2y$10$.kK5IULyGeBuIkDSC.lYfeOFGxuLb.2rjNCRolvWoddbhkzT194dC', 'A', '2023-06-14 16:14:56', NULL, 3, 849, 9, '1005484152'),
(850, 'Santo', 'Santiago', 'Ortega', '$2y$10$64XCBBBTK6rxrWmBBgcqWuMsXKRJeNiqbizcpYb6ZnYs.kkU9yUre', 'A', '2023-06-14 16:14:56', NULL, 3, 850, 9, '1005484152'),
(851, 'Santo', 'Santiago', 'Ortega', '$2y$10$vG.bAU2/u3eY/jsUfSS85OyPhvatVgvEGn9hmeQOo3U/L0SKPbHLW', 'A', '2023-06-14 16:14:56', NULL, 3, 851, 9, '1005484152'),
(852, 'Santo', 'Santiago', 'Ortega', '$2y$10$Djgl8edqtsR9pBM13LiKZ.F6Jf08xGOZgJLtPb/X8GcF/WkUdpw7y', 'A', '2023-06-14 16:14:56', NULL, 3, 852, 9, '1005484152'),
(853, 'Santo', 'Santiago', 'Ortega', '$2y$10$FbyvhstvQ8p.ATTGyM3vj.FuW5KhaGuIJLPfNqDSpSv8tU/D.2wr2', 'A', '2023-06-14 16:14:57', NULL, 3, 853, 9, '1005484152'),
(854, 'Santo', 'Santiago', 'Ortega', '$2y$10$5rnVcOGMeax2qQP7atNOluVIP5qcWIW07bfZwyBzzgnxnmodixfE6', 'A', '2023-06-14 16:14:56', NULL, 3, 854, 9, '1005484152'),
(855, 'Santo', 'Santiago', 'Ortega', '$2y$10$4yJ2C4Z0ouPRJbRj69n48OJmSznfXhbUy/vo/OlFJKNYwzx/P3EIG', 'A', '2023-06-14 16:14:56', NULL, 3, 855, 9, '1005484152'),
(856, 'Santo', 'Santiago', 'Ortega', '$2y$10$9YgN/Y1OSYhWMWX9Lv.OGukYf2BWYGR4DVPCU3gTDFkNqIvCV/Dyq', 'A', '2023-06-14 16:14:56', NULL, 3, 856, 9, '1005484152'),
(857, 'Santo', 'Santiago', 'Ortega', '$2y$10$1G/o59CGXlu4exkVsJcNIeCB/8hKSyyMIgbStP8NMmmy11fxo0OjK', 'A', '2023-06-14 16:14:57', NULL, 3, 857, 9, '1005484152'),
(858, 'Santo', 'Santiago', 'Ortega', '$2y$10$IshROIQGTZuPDoHC0v8fduMNbX8uckSIrxr9PBPwJUGRkhnUvDp3y', 'A', '2023-06-14 16:14:57', NULL, 3, 858, 9, '1005484152'),
(859, 'Santo', 'Santiago', 'Ortega', '$2y$10$X0Ya7i/I8ShmLgC1dkvvUeWBjhzfbjlInFvMCDsDjF2JtIV2/QSbC', 'A', '2023-06-14 16:14:57', NULL, 3, 859, 9, '1005484152'),
(860, 'Santo', 'Santiago', 'Ortega', '$2y$10$S9uap048lq.Cx9azxjvIu.TwE3MCpo2MPga5r.H9sM1wFiwSDWF2i', 'A', '2023-06-14 16:14:57', NULL, 3, 860, 9, '1005484152'),
(861, 'Santo', 'Santiago', 'Ortega', '$2y$10$5eknIjpXu2H87Y5EtlYjeegzDpRn8xYVkeFHIzeT2QlWIk9u56SA.', 'A', '2023-06-14 16:14:57', NULL, 3, 861, 9, '1005484152'),
(862, 'Santo', 'Santiago', 'Ortega', '$2y$10$639arKKaJC.TXsxsi1ULB.wtFW6nq8avRYJXcfgOyscTZsBxC0SKy', 'A', '2023-06-14 16:14:57', NULL, 3, 862, 9, '1005484152'),
(863, 'Santo', 'Santiago', 'Ortega', '$2y$10$lTUEjTUGcIMKbdkGeC/vmuAscf8LSPVGUhnLNNpQU6R6z3/sMiK7S', 'A', '2023-06-14 16:14:57', NULL, 3, 863, 9, '1005484152'),
(864, 'Santo', 'Santiago', 'Ortega', '$2y$10$.fkKkGn7/xQAzWyCnTs18.g/zzNQqmIEUW7ZAoWXgpuMDZiUp0Wsu', 'A', '2023-06-14 16:14:57', NULL, 3, 864, 9, '1005484152'),
(865, 'Santo', 'Santiago', 'Ortega', '$2y$10$FF3GTo98iKAJCu/3gYlRqOVlVXSnQ67KKBRus1J4ae7ZP1Zw9lasu', 'A', '2023-06-14 16:14:57', NULL, 3, 865, 9, '1005484152'),
(866, 'Santo', 'Santiago', 'Ortega', '$2y$10$7BquPteHBEpv6FQp8Ngh0.i2V6/q3ZrT3DpZQVCqX2e94a9jkep3i', 'A', '2023-06-14 16:14:57', NULL, 3, 866, 9, '1005484152'),
(867, 'Santo', 'Santiago', 'Ortega', '$2y$10$dJl1d6MqkWVEdWIfFmEUOujNl2qnvO4ll/ZFlV6p4w1bupTteO1PK', 'A', '2023-06-14 16:14:57', NULL, 3, 867, 9, '1005484152'),
(868, 'Santo', 'Santiago', 'Ortega', '$2y$10$owd1dl4oXQVJjTTsoW.v8OICFdRhxPqwM2huSDon78enj9pklmP1K', 'A', '2023-06-14 16:14:57', NULL, 3, 868, 9, '1005484152'),
(869, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZO9RFWA.mMWUQbF6Lv2WO.4SODoujTlf7/LPlHDwbR79Z0NAodCyO', 'A', '2023-06-14 16:14:58', NULL, 3, 869, 9, '1005484152'),
(870, 'Santo', 'Santiago', 'Ortega', '$2y$10$12ykgkMQ0fZ1ej5LFMnuHeFQRhid5idvtVQvstdeRFepUNp/sDW/G', 'A', '2023-06-14 16:14:57', NULL, 3, 870, 9, '1005484152'),
(871, 'Santo', 'Santiago', 'Ortega', '$2y$10$8mYKKcvlN8zRdaaSdafZP.J5T8K2PXKktTb29/WbCIM1eTkonxG5i', 'A', '2023-06-14 16:14:57', NULL, 3, 871, 9, '1005484152'),
(872, 'Santo', 'Santiago', 'Ortega', '$2y$10$xU4.JYybJRhsG3m8pQ6BTuZX2BwRZOSltzfqJ335IjOKgX.cLCHNK', 'A', '2023-06-14 16:14:57', NULL, 3, 872, 9, '1005484152'),
(873, 'Santo', 'Santiago', 'Ortega', '$2y$10$xwCDSS8g4SjaAM4Y0ljaTunXyazb8SYi86RuQaoJvyvBeR0jQR6We', 'A', '2023-06-14 16:14:57', NULL, 3, 873, 9, '1005484152'),
(874, 'Santo', 'Santiago', 'Ortega', '$2y$10$DEwGyj.J3X0YrjI.MvMg9O2k7hlyRA8C0TBGF0bYz3WintlZb/lsO', 'A', '2023-06-14 16:14:57', NULL, 3, 874, 9, '1005484152'),
(875, 'Santo', 'Santiago', 'Ortega', '$2y$10$mNureAkqIbUws64pgBw65Ou83wnPAEN7YKGKB3m38jbAj7hRjvTmS', 'A', '2023-06-14 16:14:57', NULL, 3, 875, 9, '1005484152'),
(876, 'Santo', 'Santiago', 'Ortega', '$2y$10$zS4riQoNGkh83TaNda1KcO.Ef51pNZqUpp8VpEKkTgE0oo1kGkUnu', 'A', '2023-06-14 16:14:57', NULL, 3, 876, 9, '1005484152'),
(877, 'Santo', 'Santiago', 'Ortega', '$2y$10$JGSztuY5ExOeG/e5.u0Zxe7KKLZngO1egaV6X1fSrIeBMfQq7mk9G', 'A', '2023-06-14 16:14:58', NULL, 3, 877, 9, '1005484152'),
(878, 'Santo', 'Santiago', 'Ortega', '$2y$10$iEl6ZrWp6kH23X5IstxnK.Whxe8RAJnAniwAukEwlIP/5CVReaKKe', 'A', '2023-06-14 16:14:58', NULL, 3, 878, 9, '1005484152'),
(879, 'Santo', 'Santiago', 'Ortega', '$2y$10$XwDLQmP8K3jUtLUUvvKYV.lZ5Z9oIk.sWstMIFF4KHh2ohcPnrD4u', 'A', '2023-06-14 16:14:58', NULL, 3, 879, 9, '1005484152'),
(880, 'Santo', 'Santiago', 'Ortega', '$2y$10$8rxik5jCf3H5x.toDeWuVO.AqmPw98pTrlWOYTBw8tsTd87rgEidO', 'A', '2023-06-14 16:14:58', NULL, 3, 880, 9, '1005484152'),
(881, 'Santo', 'Santiago', 'Ortega', '$2y$10$6kYLsEAx6SjW4rfsVwCbXONqZ3KFcFUc.UaMAHhBwGZN4rrruQ/Ve', 'A', '2023-06-14 16:14:58', NULL, 3, 881, 9, '1005484152'),
(882, 'Santo', 'Santiago', 'Ortega', '$2y$10$grE.YE66NppRhxwUckA25OyR44nt9eX9M9VQ2O4orJTJrmiMBfbEe', 'A', '2023-06-14 16:14:58', NULL, 3, 882, 9, '1005484152'),
(883, 'Santo', 'Santiago', 'Ortega', '$2y$10$C0ghWrUQ/9MfeKflESFHb.pZynXOXzTZbhK3zQQMtn6UkG4KEcJbC', 'A', '2023-06-14 16:14:58', NULL, 3, 883, 9, '1005484152'),
(884, 'Santo', 'Santiago', 'Ortega', '$2y$10$F1nHlmQtrWOInOSY0sfP2ecJW/OI7tz.7A9QkXGgpdF/mQ9v9vC6C', 'A', '2023-06-14 16:14:58', NULL, 3, 884, 9, '1005484152'),
(885, 'Santo', 'Santiago', 'Ortega', '$2y$10$KqSuY4rphc3Lo8VcYQTs9e/sid01QYAUVe8DheoA95HmzjfVxbxPW', 'A', '2023-06-14 16:14:58', NULL, 3, 885, 9, '1005484152'),
(886, 'Santo', 'Santiago', 'Ortega', '$2y$10$PCDOWmtnlKKOywcDQ9yt9.m5elLPQJpF069KecaF4aPX5kO.Vq3MW', 'A', '2023-06-14 16:14:58', NULL, 3, 886, 9, '1005484152'),
(887, 'Santo', 'Santiago', 'Ortega', '$2y$10$rSYF8jQTPBf28ocJSw4QWOYSBpMTk9J9rL.e1rQi3ngWPb0j.3Xoa', 'A', '2023-06-14 16:14:58', NULL, 3, 887, 9, '1005484152'),
(888, 'Santo', 'Santiago', 'Ortega', '$2y$10$blgLgySs19Zk4lVwYKK4H.T1eeI3Q0S8mpCjIH4v.NmjIxbDS1cFy', 'A', '2023-06-14 16:14:58', NULL, 3, 888, 9, '1005484152'),
(889, 'Santo', 'Santiago', 'Ortega', '$2y$10$Q8jKlMR.XMmoBL0DVlzcH.aKgomPCocoenQ1F/13tQpJwIPOSG2Xa', 'A', '2023-06-14 16:14:58', NULL, 3, 889, 9, '1005484152'),
(890, 'Santo', 'Santiago', 'Ortega', '$2y$10$SpwgHoNpFdXVXKHj2vr1g.yZHkwRrcZ07l20Y6m1XDf1LXg4mjqlO', 'A', '2023-06-14 16:14:58', NULL, 3, 890, 9, '1005484152'),
(891, 'Santo', 'Santiago', 'Ortega', '$2y$10$aBFoUYVcl18XlkSWlXH/ZeP36ov2cDzc1RZ2yTW.a9JszW8SCZAq2', 'A', '2023-06-14 16:14:58', NULL, 3, 891, 9, '1005484152'),
(892, 'Santo', 'Santiago', 'Ortega', '$2y$10$wIyNmOfEWTMsFMoZ.zDy4euohSejOjck5aF6.AlfNMX60pzB1UbOu', 'A', '2023-06-14 16:14:58', NULL, 3, 892, 9, '1005484152'),
(893, 'Santo', 'Santiago', 'Ortega', '$2y$10$KixM9lAa.GR7JOnZMvckSuEZ0asOjtI7ZChcj.4v7ad8iG88sAcAm', 'A', '2023-06-14 16:14:58', NULL, 3, 893, 9, '1005484152'),
(894, 'Santo', 'Santiago', 'Ortega', '$2y$10$1XsjXEQQ8Molws3f.sP8SeSkU70TkkFfBfQGNZITK57XrPy87hVuy', 'A', '2023-06-14 16:14:58', NULL, 3, 894, 9, '1005484152'),
(895, 'Santo', 'Santiago', 'Ortega', '$2y$10$2WZl39elWlIWaQ3.XZkN3.gjq/QPnfw9Hu0oskmB8.p0HrnZgezkW', 'A', '2023-06-14 16:14:58', NULL, 3, 895, 9, '1005484152'),
(896, 'Santo', 'Santiago', 'Ortega', '$2y$10$3.p2epTVD3cneflZH5OyPuq26ZmJJgkXMuJosI6trPfqTVDfTLTWm', 'A', '2023-06-14 16:14:58', NULL, 3, 896, 9, '1005484152'),
(897, 'Santo', 'Santiago', 'Ortega', '$2y$10$Wsgv3Qti1UCy0m8Hba8zGuyNH3mkAJsIyT3aHm.hfYg02jMI6Rfxy', 'A', '2023-06-14 16:14:58', NULL, 3, 897, 9, '1005484152'),
(898, 'Santo', 'Santiago', 'Ortega', '$2y$10$cmzp19a0A/xk8Z5g6Ouev.48rf2EdZYFhzZmwnNhdUDjyDnMzUrzi', 'A', '2023-06-14 16:14:58', NULL, 3, 898, 9, '1005484152'),
(899, 'Santo', 'Santiago', 'Ortega', '$2y$10$oFywCEJVtX0XtkQXgUVY1up5v3yXo3MpD9iyrPBL0DosLX/SR7xaa', 'A', '2023-06-14 16:14:58', NULL, 3, 899, 9, '1005484152'),
(900, 'Santo', 'Santiago', 'Ortega', '$2y$10$CsLKJFqPcG2yl5ntDrChGOxN1uxXdYxF.H3sGH6jGabncoBQdxvPG', 'A', '2023-06-14 16:14:58', NULL, 3, 900, 9, '1005484152'),
(901, 'Santo', 'Santiago', 'Ortega', '$2y$10$RL6yCcvgH6Oly.H1XuFnSuVegCZVL8uhcAFcWqUnlxKPkso7VlDpi', 'A', '2023-06-14 16:14:58', NULL, 3, 901, 9, '1005484152'),
(902, 'Santo', 'Santiago', 'Ortega', '$2y$10$tw3Iuvf2QP2YkzsIPX9XdO3hT7RswX8o1.wLOSWEI.hLxjRxn.p36', 'A', '2023-06-14 16:14:58', NULL, 3, 902, 9, '1005484152'),
(903, 'Santo', 'Santiago', 'Ortega', '$2y$10$eaZBtyXE/k.MWV9B1QmpUOQTobEYawkFq7x/T3blaJ2jO1ml0rKgm', 'A', '2023-06-14 16:14:58', NULL, 3, 903, 9, '1005484152'),
(904, 'Santo', 'Santiago', 'Ortega', '$2y$10$w4.7u9qHLQ2oX9K.w4jF3eQTOII8WfbRIG2GIbWMVfv6hVrQKWCrm', 'A', '2023-06-14 16:14:58', NULL, 3, 904, 9, '1005484152'),
(905, 'Santo', 'Santiago', 'Ortega', '$2y$10$1Nq2H5QHeiTYAFpeTv6Am.SVErkvj3KLbroA5Qw6SvQkcQYHX4U0e', 'A', '2023-06-14 16:14:58', NULL, 3, 905, 9, '1005484152'),
(906, 'Santo', 'Santiago', 'Ortega', '$2y$10$0UICYlOHXb4pZkEsTKD42.iseW6w4FSYJBduGo2TFnH2DYFDeKaBu', 'A', '2023-06-14 16:14:58', NULL, 3, 906, 9, '1005484152'),
(907, 'Santo', 'Santiago', 'Ortega', '$2y$10$AS630LqIpVDHz0yaahJmUOsicLW/PgdJDTuhgewirGE9O2bgvZCWy', 'A', '2023-06-14 16:14:58', NULL, 3, 907, 9, '1005484152'),
(908, 'Santo', 'Santiago', 'Ortega', '$2y$10$f0ZaIELlkAo9ZAFQycCti.Wb5ki1G3Z/uViTzgsiqK9S1HT.mYIcS', 'A', '2023-06-14 16:14:58', NULL, 3, 908, 9, '1005484152'),
(909, 'Santo', 'Santiago', 'Ortega', '$2y$10$KijG2hNZ5CunrsUbBdtCX.2sZYi/gcIj.QqyPJYF51uyOO72oCNSO', 'A', '2023-06-14 16:14:58', NULL, 3, 909, 9, '1005484152'),
(910, 'Santo', 'Santiago', 'Ortega', '$2y$10$atMQfRPwn2/YGjkwsbGir.XATbCfYfaOGgADhqBvYns3F5629uQ9u', 'A', '2023-06-14 16:14:58', NULL, 3, 910, 9, '1005484152'),
(911, 'Santo', 'Santiago', 'Ortega', '$2y$10$xDBaTmhwepTaMH/IFAD1leGgfkXTXChOmQVS6pBG5Yr61AAFwrzGa', 'A', '2023-06-14 16:14:58', NULL, 3, 911, 9, '1005484152'),
(912, 'Santo', 'Santiago', 'Ortega', '$2y$10$E7ylgEB.NvbS07l9QRjgUeGtz/Zeia3xz5MMERAMkj0FwckjnDph.', 'A', '2023-06-14 16:14:58', NULL, 3, 912, 9, '1005484152'),
(913, 'Santo', 'Santiago', 'Ortega', '$2y$10$POO2r.clKKRO3DYEXrXYVeAaCFnU46RfwqPBXOU1jIJ79swg48Ugi', 'A', '2023-06-14 16:14:58', NULL, 3, 913, 9, '1005484152'),
(914, 'Santo', 'Santiago', 'Ortega', '$2y$10$.1JLY0FLqnef7bvCXisz4OKUmzxFSTotarZkqDJeCfUqbSJftWPNC', 'A', '2023-06-14 16:14:58', NULL, 3, 914, 9, '1005484152'),
(915, 'Santo', 'Santiago', 'Ortega', '$2y$10$LLXo8XudUdNHpHlpYnyPgeDzIDwwiwCHEdo0.52WC4dOI/XBsWQwi', 'A', '2023-06-14 16:14:58', NULL, 3, 915, 9, '1005484152'),
(916, 'Santo', 'Santiago', 'Ortega', '$2y$10$XeqNVGF1rXoLfBBptAwFPu6BnMEGmSpW3p6tTXQb7Iq7c8tHFVcJS', 'A', '2023-06-14 16:14:58', NULL, 3, 916, 9, '1005484152'),
(917, 'Santo', 'Santiago', 'Ortega', '$2y$10$7/e/4m2DTk2HAA97H7oyietAltfG4IsX4wLXlzMoNUgPbmH68xP6u', 'A', '2023-06-14 16:14:58', NULL, 3, 917, 9, '1005484152'),
(918, 'Santo', 'Santiago', 'Ortega', '$2y$10$Y02LtldIYSPJsD9rYVcsFOnEVbPLj/iFrCnmWaDmhv2YuEO5gOKLq', 'A', '2023-06-14 16:14:58', NULL, 3, 918, 9, '1005484152'),
(919, 'Santo', 'Santiago', 'Ortega', '$2y$10$nv3mgmoys0lAqvwJiqrclOkMW1/1yCftGDZLjuhl9iTZgoT8dDCw2', 'A', '2023-06-14 16:14:58', NULL, 3, 919, 9, '1005484152'),
(920, 'Santo', 'Santiago', 'Ortega', '$2y$10$BNDutrEcSIvMgWgeLnckdO619irvaLhgDiFA0uHCNf7sgCyJO615u', 'A', '2023-06-14 16:14:58', NULL, 3, 920, 9, '1005484152'),
(921, 'Santo', 'Santiago', 'Ortega', '$2y$10$SfLmT5FGgJxXsK5IEOBf6uATjhjQn0kKnZRC7S5TuY65oZ7tWnVBa', 'A', '2023-06-14 16:14:58', NULL, 3, 921, 9, '1005484152'),
(922, 'Santo', 'Santiago', 'Ortega', '$2y$10$d5M0CL7BNKl7fKC4RduKq.yNI1cKtpKHFqa5ojwjmdmhO8MynNM2u', 'A', '2023-06-14 16:14:58', NULL, 3, 922, 9, '1005484152'),
(923, 'Santo', 'Santiago', 'Ortega', '$2y$10$1HnS3G45KhnQve/LV484ruTIiQYwBElZ9xy7j7tgGuerRP4yKP88K', 'A', '2023-06-14 16:14:58', NULL, 3, 923, 9, '1005484152'),
(924, 'Santo', 'Santiago', 'Ortega', '$2y$10$.7ID7QtysKCYvIEf.K5gDu8p5yCM.WtubKzJ9BYSvyAFhxFdFI17O', 'A', '2023-06-14 16:14:58', NULL, 3, 924, 9, '1005484152'),
(925, 'Santo', 'Santiago', 'Ortega', '$2y$10$H/WfFWSkCv7s74NYZspf6ejs8X6gZmKkvbFaD6GfQXRf2ofJNX7tG', 'A', '2023-06-14 16:14:59', NULL, 3, 925, 9, '1005484152'),
(926, 'Santo', 'Santiago', 'Ortega', '$2y$10$0yOqAA3Nl.qFHFbDcEUknuvQrkFaj0qclNtCIShrH6d1rnZsQw3.C', 'A', '2023-06-14 16:14:59', NULL, 3, 926, 9, '1005484152'),
(927, 'Santo', 'Santiago', 'Ortega', '$2y$10$GbEENzvhyIxUv4yOdqaU7.n7c4sqRcsJyLL4OejdgJF5jsg/sCXJO', 'A', '2023-06-14 16:14:59', NULL, 3, 927, 9, '1005484152'),
(928, 'Santo', 'Santiago', 'Ortega', '$2y$10$BTXsDYyo0MIkOG.pw7YdG.IIjU1DchFwfswuuesLKnbQwgO4oB0ve', 'A', '2023-06-14 16:14:59', NULL, 3, 928, 9, '1005484152'),
(929, 'Santo', 'Santiago', 'Ortega', '$2y$10$KMBo2IuYApFQyLGys3lEvO.9q04JIKSvN6iBy4Bfxtd99LHHswCSe', 'A', '2023-06-14 16:14:59', NULL, 3, 929, 9, '1005484152'),
(930, 'Santo', 'Santiago', 'Ortega', '$2y$10$qeQL5/XgsJy7QxpRDif50.xn3xpICJLBLumuf/Z0xryKXDM1QV.zC', 'A', '2023-06-14 16:14:59', NULL, 3, 930, 9, '1005484152'),
(931, 'Santo', 'Santiago', 'Ortega', '$2y$10$W2d8B82yaWZd.GizOEp8RuEGHlgqssf.QRPd6348xUPKn4ITHDOp.', 'A', '2023-06-14 16:14:59', NULL, 3, 931, 9, '1005484152'),
(932, 'Santo', 'Santiago', 'Ortega', '$2y$10$LvaKYHxtNq0EHUwlvppVLuxJw9.Eyvhch.hPWvvKoyLjKuN/QrvIO', 'A', '2023-06-14 16:14:59', NULL, 3, 932, 9, '1005484152'),
(933, 'Santo', 'Santiago', 'Ortega', '$2y$10$G.cv0B5NnpAjzFDWLloZPe6x0pnf4c/97CSLYdOnU8wbP213Wu1Me', 'A', '2023-06-14 16:14:59', NULL, 3, 933, 9, '1005484152'),
(934, 'Santo', 'Santiago', 'Ortega', '$2y$10$kAd4DP5MBZd9LXcIclb2Juz7xIrCc4YmLDkUNkPt0tCpXY4XPSo/i', 'A', '2023-06-14 16:14:59', NULL, 3, 934, 9, '1005484152'),
(935, 'Santo', 'Santiago', 'Ortega', '$2y$10$uBmtDUGpDTX9egBYhp5pWeKUvEMpS2pMbXWNiV2KkLrj2U3N/Qbqm', 'A', '2023-06-14 16:14:59', NULL, 3, 935, 9, '1005484152'),
(936, 'Santo', 'Santiago', 'Ortega', '$2y$10$lRGtIsaaAI96eeuPdO37jO/vtYRqxMlhhvX8hA9bAEqXznNUcjdoe', 'A', '2023-06-14 16:14:59', NULL, 3, 936, 9, '1005484152'),
(937, 'Santo', 'Santiago', 'Ortega', '$2y$10$1x0t03iLuQgSVhbGV25ck.NrxJy4qlwZq3QJBd3xzMTmtEJBs.AXa', 'A', '2023-06-14 16:14:59', NULL, 3, 937, 9, '1005484152'),
(938, 'Santo', 'Santiago', 'Ortega', '$2y$10$t26iRaJNmoIwhaAXW5Wo5Or5jDxDal/m3p2LAgMsIjv7V53j2XgXm', 'A', '2023-06-14 16:14:59', NULL, 3, 938, 9, '1005484152'),
(939, 'Santo', 'Santiago', 'Ortega', '$2y$10$bmMuBU/7OSvBSVrOCmeK/uXAyuBnpkJwkg3531/070CVNlIH6ZCyW', 'A', '2023-06-14 16:14:59', NULL, 3, 939, 9, '1005484152'),
(940, 'Santo', 'Santiago', 'Ortega', '$2y$10$wsOuGgPMFaPxgbsuftc6geQDE3lhI.GAQH6HRt0gzE2FPdm4F/Tbm', 'A', '2023-06-14 16:14:59', NULL, 3, 940, 9, '1005484152'),
(941, 'Santo', 'Santiago', 'Ortega', '$2y$10$l8LSiDPNtuevL/uDdFA3sOe6NNUo5axkn/wUtjMnVZUry7mWmJJ82', 'A', '2023-06-14 16:15:00', NULL, 3, 941, 9, '1005484152'),
(942, 'Santo', 'Santiago', 'Ortega', '$2y$10$KXxT9tZHoP7HSWeuBAD9fuCcFaNb4Mzvvje4dto57Mm6d1Brmj/vm', 'A', '2023-06-14 16:15:00', NULL, 3, 942, 9, '1005484152'),
(943, 'Santo', 'Santiago', 'Ortega', '$2y$10$skmim3PGXkz3IT0H/XZEEeHnW6N0x7ZcxKglU5/p3qy8Uq5aveJLy', 'A', '2023-06-14 16:15:00', NULL, 3, 943, 9, '1005484152'),
(944, 'Santo', 'Santiago', 'Ortega', '$2y$10$SbmKUFS7OY.RLXxqYq6QFejvz4plQWBIVvmmQthph8tvJOIuEedvC', 'A', '2023-06-14 16:15:00', NULL, 3, 944, 9, '1005484152'),
(945, 'Santo', 'Santiago', 'Ortega', '$2y$10$NCmmfBbwIcIAUAh8fOEmmeZyTEaWQq4MfoHgY0OD5r61JrRogT5W.', 'A', '2023-06-14 16:15:00', NULL, 3, 945, 9, '1005484152'),
(946, 'Santo', 'Santiago', 'Ortega', '$2y$10$Zc18sIejQO55R/zuTBD3suxI5Qb4VJebdagD7gYb4X5cRI4rTOXbu', 'A', '2023-06-14 16:15:00', NULL, 3, 946, 9, '1005484152'),
(947, 'Santo', 'Santiago', 'Ortega', '$2y$10$iuG7t0i/gZA/yrLrrWh6KuetxM6DpdFcMes4Ug0qECF4bxf6wwOiy', 'A', '2023-06-14 16:15:00', NULL, 3, 947, 9, '1005484152'),
(948, 'Santo', 'Santiago', 'Ortega', '$2y$10$XNZRf6ZCLH9Nrs8AHy.hvO3Yberw9aLnLM9lnCFweAM8w8tjlQ7rG', 'A', '2023-06-14 16:15:00', NULL, 3, 948, 9, '1005484152'),
(949, 'Santo', 'Santiago', 'Ortega', '$2y$10$1uKm53kZPpmkW3FHjp5nfefoyEoTYd4yNpjREenhvrtW6DUb9qAZa', 'A', '2023-06-14 16:15:01', NULL, 3, 949, 9, '1005484152'),
(950, 'Santo', 'Santiago', 'Ortega', '$2y$10$glzc/MHr46wBl4t2TH.9Ce.LdDHD3Bn4l0IUz86JSRuMafqV/3LW6', 'A', '2023-06-14 16:15:00', NULL, 3, 950, 9, '1005484152'),
(951, 'Santo', 'Santiago', 'Ortega', '$2y$10$hYUs.MkIYUVpu1.erLnzueoISEAw4mGgQDQrs5GFpLsVuDLYg255G', 'A', '2023-06-14 16:15:01', NULL, 3, 951, 9, '1005484152'),
(952, 'Santo', 'Santiago', 'Ortega', '$2y$10$FsRkkbAwFtc9jo1fmZMnD.jfAzb918XebjTvtL1ItbK/Vvvsw6stO', 'A', '2023-06-14 16:15:01', NULL, 3, 952, 9, '1005484152'),
(953, 'Santo', 'Santiago', 'Ortega', '$2y$10$YXC9nmeIIuUkXX2buKTIR.f8jYi0NURz9HkAKY6KVwGwBgxQl52ci', 'A', '2023-06-14 16:15:01', NULL, 3, 953, 9, '1005484152'),
(954, 'Santo', 'Santiago', 'Ortega', '$2y$10$k2nbLhvXQNjiChmAihaaLuMvaxcRYm8tvNk/A39GkqiyDbrGpXvHK', 'A', '2023-06-14 16:15:01', NULL, 3, 954, 9, '1005484152'),
(955, 'Santo', 'Santiago', 'Ortega', '$2y$10$COQ0E6rf/6YDe8DYNHWFpe08mm8bWfjK/ZC7KzmuGEzn14fdGI1Z6', 'A', '2023-06-14 16:15:01', NULL, 3, 955, 9, '1005484152'),
(956, 'Santo', 'Santiago', 'Ortega', '$2y$10$jAEyv6bHJDeAqJS26eAW7.BPFfkUZjRyrkHpYYtt9segJFGxlssEe', 'A', '2023-06-14 16:15:01', NULL, 3, 956, 9, '1005484152'),
(957, 'Santo', 'Santiago', 'Ortega', '$2y$10$roH7wbUaoC5VdN5nhp0d/esPV4r6u4HTnvtXvIKJpkcAwY9Ef2izi', 'A', '2023-06-14 16:15:01', NULL, 3, 957, 9, '1005484152'),
(958, 'Santo', 'Santiago', 'Ortega', '$2y$10$Uy0o4XXVgplXECC6tMPDlOtnd9aWrnGu.SCT4JGBLwSkRqHOQf/Rq', 'A', '2023-06-14 16:15:01', NULL, 3, 958, 9, '1005484152'),
(959, 'Santo', 'Santiago', 'Ortega', '$2y$10$h1rwfYtnmNUyl4hJCgYZFedZaSbDGfDp1k4AkJEsESLGi.yXaCzzq', 'A', '2023-06-14 16:15:01', NULL, 3, 959, 9, '1005484152'),
(960, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZB9ggaPmy6woaPq05qfJH.0R/84Q.NgXvg/h0ldBkTndXcmGWktuy', 'A', '2023-06-14 16:15:01', NULL, 3, 960, 9, '1005484152'),
(961, 'Santo', 'Santiago', 'Ortega', '$2y$10$Hx.uKHEE6AXgwaqDiANW/u8l8xh1BcDT.IwK9nvNHtElLTuGq2lzS', 'A', '2023-06-14 16:15:01', NULL, 3, 961, 9, '1005484152'),
(962, 'Santo', 'Santiago', 'Ortega', '$2y$10$Uv1B2J5imfZuftxEQS9YBuvdeNm4glXiydt6VOcAVDvOtTXGe5JSG', 'A', '2023-06-14 16:15:01', NULL, 3, 962, 9, '1005484152'),
(963, 'Santo', 'Santiago', 'Ortega', '$2y$10$phW0faNpGICjEqlK78b35e5jTFch0k3y5UuxOlimqwCZqAuc91Kp6', 'A', '2023-06-14 16:15:01', NULL, 3, 963, 9, '1005484152'),
(964, 'Santo', 'Santiago', 'Ortega', '$2y$10$DpO.08mXZ9ukJH21ew8douFw.tCAt.Z1SyQCNGQpJWjbN75WTF5sS', 'A', '2023-06-14 16:15:01', NULL, 3, 964, 9, '1005484152'),
(965, 'Santo', 'Santiago', 'Ortega', '$2y$10$1dsNO54DfWIzhKO/GraVJOhKU/1yzAEKTvAUjGKeiYB24R3ox1I4S', 'A', '2023-06-14 16:15:01', NULL, 3, 965, 9, '1005484152'),
(966, 'Santo', 'Santiago', 'Ortega', '$2y$10$TfCJWPSJkG2SPRK9E9enX.6xVTtICiKk8HwJ11Ve2Q6wh/PdTH8rq', 'A', '2023-06-14 16:15:01', NULL, 3, 966, 9, '1005484152'),
(967, 'Santo', 'Santiago', 'Ortega', '$2y$10$5WU1c/pEZn.ms0AupDHbSONfINv.lS/vudI3J5sXfcgDCXRjM1hqS', 'A', '2023-06-14 16:15:01', NULL, 3, 967, 9, '1005484152'),
(968, 'Santo', 'Santiago', 'Ortega', '$2y$10$HzUx1AvxWy6aO5TywtuigOpNzK56A6ycGsM3fooy4AYwQqXTFVBzK', 'A', '2023-06-14 16:15:01', NULL, 3, 968, 9, '1005484152'),
(969, 'Santo', 'Santiago', 'Ortega', '$2y$10$szkM1Bl8gJkwDSHOEyl0fO.Dv6fBgcAShNjRWoBWFOsSm/2pBKj0G', 'A', '2023-06-14 16:15:01', NULL, 3, 969, 9, '1005484152'),
(970, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZYWggEDkxn82bhmHcEkVNOyH69/otthrNW41kIeKWVRHrpkGho3J2', 'A', '2023-06-14 16:15:01', NULL, 3, 970, 9, '1005484152'),
(971, 'Santo', 'Santiago', 'Ortega', '$2y$10$xyHjBMemgCJLhqyq2nhKbOBHIEWFyVOyNOQPy9hEdpV7gmrTnDwoW', 'A', '2023-06-14 16:15:01', NULL, 3, 971, 9, '1005484152'),
(972, 'Santo', 'Santiago', 'Ortega', '$2y$10$vuxwYoTmLeqPZn6RcSrquO1WVFvM6mChf1DjuKHI60ehAXOWsosLy', 'A', '2023-06-14 16:15:01', NULL, 3, 972, 9, '1005484152'),
(973, 'Santo', 'Santiago', 'Ortega', '$2y$10$2ZYxayw0lL2YVqBGjg6OueyioSfcIHszhLRa5lHt.14nQzCDfRASi', 'A', '2023-06-14 16:15:01', NULL, 3, 973, 9, '1005484152'),
(974, 'Santo', 'Santiago', 'Ortega', '$2y$10$PsQ9amlEtDa0aaehq4XD6O/.9hnJmjC.NYTa8lK1nz539HNwq36R.', 'A', '2023-06-14 16:15:01', NULL, 3, 974, 9, '1005484152'),
(975, 'Santo', 'Santiago', 'Ortega', '$2y$10$G.6FsUEPh6KOqw/cgAGnHembURClF2G0OsW5ptW.QxCI32.IjnIN2', 'A', '2023-06-14 16:15:01', NULL, 3, 975, 9, '1005484152'),
(976, 'Santo', 'Santiago', 'Ortega', '$2y$10$6oXVpvkwYUCrR/yzQrvq4OLhfTzzIhA3XHn5jdyDF.cYTN1chWiTK', 'A', '2023-06-14 16:15:02', NULL, 3, 976, 9, '1005484152'),
(977, 'Santo', 'Santiago', 'Ortega', '$2y$10$X27LyREXv3IvgJJ0osL4eO40KuGbrRnfsp/IKQcF87Ip75sL5jEVq', 'A', '2023-06-14 16:15:02', NULL, 3, 977, 9, '1005484152'),
(978, 'Santo', 'Santiago', 'Ortega', '$2y$10$1wDtgZzIkrtsBpfu3s.KNegyYjkkAeXWknjBcI4lvVWlNIPnujHd.', 'A', '2023-06-14 16:15:02', NULL, 3, 978, 9, '1005484152'),
(979, 'Santo', 'Santiago', 'Ortega', '$2y$10$hdENzXc06Zhb5tLz8AHacehCl68IyulLRkvD10xelo5Ubap/5v8IG', 'A', '2023-06-14 16:15:01', NULL, 3, 979, 9, '1005484152'),
(980, 'Santo', 'Santiago', 'Ortega', '$2y$10$ABQraQeez.e1rgoczAMox.4em.327JuBDzR4eQjHoKJPW2TeE4UXe', 'A', '2023-06-14 16:15:01', NULL, 3, 980, 9, '1005484152'),
(981, 'Santo', 'Santiago', 'Ortega', '$2y$10$/YqFFum45WfEkGAtn5BbCuPGQyRIXBp8TUb4e8INcr7Xb2i1EZzVW', 'A', '2023-06-14 16:15:01', NULL, 3, 981, 9, '1005484152'),
(982, 'Santo', 'Santiago', 'Ortega', '$2y$10$bGRXeRjHQNedlyz.L3Rr0OAXN1MxOJ5ul9sXUe3F.3X8UGp1QJQY6', 'A', '2023-06-14 16:15:01', NULL, 3, 982, 9, '1005484152'),
(983, 'Santo', 'Santiago', 'Ortega', '$2y$10$TLPfjTuUNdHtr/P/3/JdUeVTgmVIxqOIChugJVBf5pCzx/mFh9mgu', 'A', '2023-06-14 16:15:01', NULL, 3, 983, 9, '1005484152'),
(984, 'Santo', 'Santiago', 'Ortega', '$2y$10$uSeTAouHI4V/i6XAgUUwaujqDRddzKSyUBElm5QvNj6.2owjk8I4y', 'A', '2023-06-14 16:15:02', NULL, 3, 984, 9, '1005484152'),
(985, 'Santo', 'Santiago', 'Ortega', '$2y$10$lMOFeoR3JlTMUrHiMqXeGeE7R1aY8ySWxNBuY3DUP80AMibNAB9LW', 'A', '2023-06-14 16:15:01', NULL, 3, 985, 9, '1005484152'),
(986, 'Santo', 'Santiago', 'Ortega', '$2y$10$THQ/J9BxMALygBciUL63HOKluFyl34fT19ZEaJOVJxP8lRZFyvr0i', 'A', '2023-06-14 16:15:02', NULL, 3, 986, 9, '1005484152'),
(987, 'Santo', 'Santiago', 'Ortega', '$2y$10$kdf8ECyIUL1GF0/Zh17ameVCEV6nEFJ3o3Q9idbpXa4rHJgiYfM/y', 'A', '2023-06-14 16:15:01', NULL, 3, 987, 9, '1005484152'),
(988, 'Santo', 'Santiago', 'Ortega', '$2y$10$/5IGRQk1xQ6NQeZMhVuN7.7kiJ8JEREcpPIYutt5kMQC7Euw8lLay', 'A', '2023-06-14 16:15:01', NULL, 3, 988, 9, '1005484152'),
(989, 'Santo', 'Santiago', 'Ortega', '$2y$10$dv3/isJDLlxY10BKx4kyiu2ETmffyq9asKTw4QLOtcV6YDjHnLN4i', 'A', '2023-06-14 16:15:02', NULL, 3, 989, 9, '1005484152'),
(990, 'Santo', 'Santiago', 'Ortega', '$2y$10$ph5Ouft0.ttE6rlVqHMPDu53NyVbdIpIID5ouLV96eZpWt2W/PBJi', 'A', '2023-06-14 16:15:02', NULL, 3, 990, 9, '1005484152'),
(991, 'Santo', 'Santiago', 'Ortega', '$2y$10$JfRIkkKpRQHPSKjfiIrLBuXg1te5l5pWUXLYptmGnl7oVmlBYD0qW', 'A', '2023-06-14 16:15:02', NULL, 3, 991, 9, '1005484152'),
(992, 'Santo', 'Santiago', 'Ortega', '$2y$10$Wm9ddpT9/dTR4muMYEt5pukc/kVonwhSfDg5Q0DAXCqUmlkKi6/Ai', 'A', '2023-06-14 16:15:02', NULL, 3, 992, 9, '1005484152'),
(993, 'Santo', 'Santiago', 'Ortega', '$2y$10$fFn65SA1wtt8L7qo9vUsneNODKCayMkiSkS/sQyNcwGWHJ7P4XuaC', 'A', '2023-06-14 16:15:02', NULL, 3, 993, 9, '1005484152'),
(994, 'Santo', 'Santiago', 'Ortega', '$2y$10$GuYwDeGW3Blup5bRWpqZxeIozS9kSfXljzd0Uu3diOa0eEn2lc5o.', 'A', '2023-06-14 16:15:02', NULL, 3, 994, 9, '1005484152'),
(995, 'Santo', 'Santiago', 'Ortega', '$2y$10$jiI9dV0TMhCzuUqF7Tx.5.0bFPjBDVvTmSQSOE4Ejs.cNaI80/0.2', 'A', '2023-06-14 16:15:02', NULL, 3, 995, 9, '1005484152'),
(996, 'Santo', 'Santiago', 'Ortega', '$2y$10$JYz8S9q8hCRv4N4VUolKv.iKuNXjVMiHgIb2hBy.ElkNTb2ZoPXGC', 'A', '2023-06-14 16:15:02', NULL, 3, 996, 9, '1005484152'),
(997, 'Santo', 'Santiago', 'Ortega', '$2y$10$XruL19lmnQqiBzm.ogKXCedDzbD4LWM.IJ4aImPaV8SfyRNXL0WJ2', 'A', '2023-06-14 16:15:02', NULL, 3, 997, 9, '1005484152'),
(998, 'Santo', 'Santiago', 'Ortega', '$2y$10$3gZI2gqifIpku20EAgx47.Y7cJE56GdOGpyUo/.8ocfClap2NcdC6', 'A', '2023-06-14 16:15:02', NULL, 3, 998, 9, '1005484152'),
(999, 'Santo', 'Santiago', 'Ortega', '$2y$10$S09n1vz5l9flXYq8owJwi.5CBynYPpmSAhx2Sl/.50Up3pBtu8q.y', 'A', '2023-06-14 16:15:02', NULL, 3, 999, 9, '1005484152'),
(1000, 'Santo', 'Santiago', 'Ortega', '$2y$10$LW8oBanIPDAklU4luwB5l.2/zj.3zwv.YzNN7yFhbwFEn8LVlCTy.', 'A', '2023-06-14 16:15:02', NULL, 3, 1000, 9, '1005484152'),
(1001, 'Santo', 'Santiago', 'Ortega', '$2y$10$u7pf0YE9NNGshx0e3g1lTejBKLaJrpbUqgqMvekSvpy0mzdFqxkKq', 'A', '2023-06-14 16:15:02', NULL, 3, 1001, 9, '1005484152'),
(1002, 'Santo', 'Santiago', 'Ortega', '$2y$10$bWW6NKQBEK4nJgm6lfuAAeCjvH2x6MFbKnfqMm1DqitLWidrAvgxy', 'A', '2023-06-14 16:15:02', NULL, 3, 1002, 9, '1005484152'),
(1003, 'Santo', 'Santiago', 'Ortega', '$2y$10$tLq.GkZAsz4Mb2h9dSXy7OMuBCfwj9iE0eOL7yi/xC5zwi0rXbmeC', 'A', '2023-06-14 16:15:02', NULL, 3, 1003, 9, '1005484152'),
(1004, 'Santo', 'Santiago', 'Ortega', '$2y$10$AKWPtYqp1mry1t18I.2XiucNi5sewT5h.JG2EpRlVBK8WFh.M3jdW', 'A', '2023-06-14 16:15:02', NULL, 3, 1004, 9, '1005484152'),
(1005, 'Santo', 'Santiago', 'Ortega', '$2y$10$ACJtxtLFAbNWEiQNwdsEf.kxlNt4JoEYXBZW3mtpZCmOtPoalTiEa', 'A', '2023-06-14 16:15:02', NULL, 3, 1005, 9, '1005484152');
INSERT INTO `usuarios` (`id_usuario`, `usuario`, `nombre`, `apellido`, `pass`, `estado`, `fecha_crea`, `token`, `id_rol`, `usuario_crea`, `tipo_documento`, `num_documento`) VALUES
(1006, 'Santo', 'Santiago', 'Ortega', '$2y$10$gDEBXnJoGNShnXictHZ8gOFGdpL0ADvBDoYE5J3QNMY6l1wpjYoIe', 'A', '2023-06-14 16:15:02', NULL, 3, 1006, 9, '1005484152'),
(1007, 'Santo', 'Santiago', 'Ortega', '$2y$10$NaCD/8aLu.9LApF57FFi4OweeBU6hGGCJ45nakNVVGw68O/1VFsAq', 'A', '2023-06-14 16:15:02', NULL, 3, 1007, 9, '1005484152'),
(1008, 'Santo', 'Santiago', 'Ortega', '$2y$10$MFFpSWgL3gSaeKKp0WigVuoSZrhfw3BT88g9m9QT5wemSWZYuTpEm', 'A', '2023-06-14 16:15:02', NULL, 3, 1008, 9, '1005484152'),
(1009, 'Santo', 'Santiago', 'Ortega', '$2y$10$ALl.ijt2iEo./vudsFQONO.dhF.B25OnEMUpEJpfyn/NMSaqgC34O', 'A', '2023-06-14 16:15:02', NULL, 3, 1009, 9, '1005484152'),
(1010, 'Santo', 'Santiago', 'Ortega', '$2y$10$79lvhyOk.UDFcxndKtBNsONgHKfpSrM8I4vTsQyjd1.KmooOlRhDO', 'A', '2023-06-14 16:15:02', NULL, 3, 1010, 9, '1005484152'),
(1011, 'Santo', 'Santiago', 'Ortega', '$2y$10$G6WMQlc9D43WVRsn1sSquO2CHM/Rn0BDc6DG2dzaOXn.mQrl5Vi7W', 'A', '2023-06-14 16:15:02', NULL, 3, 1011, 9, '1005484152'),
(1012, 'Santo', 'Santiago', 'Ortega', '$2y$10$ciypdNxWrlfwcYBXOYsl6ObD7JQoj9iNhQOLCfkwCCmFRzEuToqKy', 'A', '2023-06-14 16:15:02', NULL, 3, 1012, 9, '1005484152'),
(1013, 'Santo', 'Santiago', 'Ortega', '$2y$10$bX5Fg/iLc1XG4Orgg9BMgO.xs3qblsUDEVQanmFBqL5r3DyeniS7S', 'A', '2023-06-14 16:15:02', NULL, 3, 1013, 9, '1005484152'),
(1014, 'Santo', 'Santiago', 'Ortega', '$2y$10$GPpkIe1c2x0pZv0t2apd9e/BYI7bl397uUaTXuXBZu1.rwOr/RpIq', 'A', '2023-06-14 16:15:02', NULL, 3, 1014, 9, '1005484152'),
(1015, 'Santo', 'Santiago', 'Ortega', '$2y$10$GxF7ZoGyXWPLkO2ieVt0AOklV9VTk9.UbhKelclxL6Nqq1Bq6A.iK', 'A', '2023-06-14 16:15:02', NULL, 3, 1015, 9, '1005484152'),
(1016, 'Santo', 'Santiago', 'Ortega', '$2y$10$vBRGFANQ4FykooHERryRZOnBZwjEQy9867eeHiU8kiou1ve4NRIh6', 'A', '2023-06-14 16:15:02', NULL, 3, 1016, 9, '1005484152'),
(1017, 'Santo', 'Santiago', 'Ortega', '$2y$10$MkoSNSW36mdydajWA8hFB.KI/c.zQ.wOfWPG/XsWXvQSsfNDOc3ne', 'A', '2023-06-14 16:15:02', NULL, 3, 1017, 9, '1005484152'),
(1018, 'Santo', 'Santiago', 'Ortega', '$2y$10$bVkCFyETT/qXKrp5fdyZQ.XIl1SSmxfSBro9ix6zzaitPc4nhGt6u', 'A', '2023-06-14 16:15:02', NULL, 3, 1018, 9, '1005484152'),
(1019, 'Santo', 'Santiago', 'Ortega', '$2y$10$5qo/L7lqxY9aPZU9JcXIh.2XJa4zsTISL2qt780ymCx94teFK/Q8O', 'A', '2023-06-14 16:15:02', NULL, 3, 1019, 9, '1005484152'),
(1020, 'Santo', 'Santiago', 'Ortega', '$2y$10$Rvsy2PYdFz86jG1PBHXq8.FYDsemRfb4YHfz4E0sLTn7E7KIA80va', 'A', '2023-06-14 16:15:02', NULL, 3, 1020, 9, '1005484152'),
(1021, 'Santo', 'Santiago', 'Ortega', '$2y$10$aDAj3OueIECA5D5rMRQH6u1i7jlvUFWsq.j0pGoiSFK909jHZAwwm', 'A', '2023-06-14 16:15:02', NULL, 3, 1021, 9, '1005484152'),
(1022, 'Santo', 'Santiago', 'Ortega', '$2y$10$eJ85z/6sFglKtpKKT8RNg.I.mkJOUmW4bUwTvvz5eho85HVSdDwMu', 'A', '2023-06-14 16:15:02', NULL, 3, 1022, 9, '1005484152'),
(1023, 'Santo', 'Santiago', 'Ortega', '$2y$10$iwB6FeKW7j5tUTyXKWLq8u8YVAITjaZwiebVvWw8nE9XBdBWSnkkO', 'A', '2023-06-14 16:15:02', NULL, 3, 1023, 9, '1005484152'),
(1024, 'Santo', 'Santiago', 'Ortega', '$2y$10$75Dv2/N.YIktZuV41chXee9q6gC7jllqGT8TsPgMCCoKxK8AIABr.', 'A', '2023-06-14 16:15:02', NULL, 3, 1024, 9, '1005484152'),
(1025, 'Santo', 'Santiago', 'Ortega', '$2y$10$5m9K7J1Is8vXUT4jxeIDCOHmhtrlXm4LRf8Kyy2u1aKLGWHjYLPMO', 'A', '2023-06-14 16:15:02', NULL, 3, 1025, 9, '1005484152'),
(1026, 'Santo', 'Santiago', 'Ortega', '$2y$10$z/6yuCqeINd8i1Zc1lIy7eba./3Efiir61aH2gbawLLg.5f0y7.li', 'A', '2023-06-14 16:15:02', NULL, 3, 1026, 9, '1005484152'),
(1027, 'Santo', 'Santiago', 'Ortega', '$2y$10$GRkd3bzso3PWsHUrfgxuD.fPKvViKhmAbxuVOEG3NXsrc2E/keeNe', 'A', '2023-06-14 16:15:02', NULL, 3, 1027, 9, '1005484152'),
(1028, 'Santo', 'Santiago', 'Ortega', '$2y$10$e8Getqtl4NFzywYWfD7Wi.Up9qSo2mcAkxHDx9jgKHuawp2X9Tb0O', 'A', '2023-06-14 16:15:02', NULL, 3, 1028, 9, '1005484152'),
(1029, 'Santo', 'Santiago', 'Ortega', '$2y$10$MGyNxR/cU1XROPmdZEhgduLHZ.QNYqlYsjGZFBjwLdAiUe44xv6Xi', 'A', '2023-06-14 16:15:02', NULL, 3, 1029, 9, '1005484152'),
(1030, 'Santo', 'Santiago', 'Ortega', '$2y$10$BMmaD1o1P7bp2favXkFtwO1PxD/ixDDgL7ulOK3qa/okPrkans4L6', 'A', '2023-06-14 16:15:02', NULL, 3, 1030, 9, '1005484152'),
(1031, 'Santo', 'Santiago', 'Ortega', '$2y$10$8rAo2bOFcvqI6YfmfJawDOW5X.PVZgQf3T2lxz9OgqNaVi8qeYnVC', 'A', '2023-06-14 16:15:02', NULL, 3, 1031, 9, '1005484152'),
(1032, 'Santo', 'Santiago', 'Ortega', '$2y$10$PiP4FSssD7doSI1um3vXuO5LtOngN9wIKiqxGhYgU9o2iROeT.43a', 'A', '2023-06-14 16:15:02', NULL, 3, 1032, 9, '1005484152'),
(1033, 'Santo', 'Santiago', 'Ortega', '$2y$10$tIfBR8zrp1YgiTwcWMfqz.6C5CimHmq2qMrrN8ok9.o3oewWZdJwu', 'A', '2023-06-14 16:15:02', NULL, 3, 1033, 9, '1005484152'),
(1034, 'Santo', 'Santiago', 'Ortega', '$2y$10$9hXG50fQ.2aQwtNjMG0L0e8Dyp.IpC6CVJusT.7n6pqd5f7FyD8qa', 'A', '2023-06-14 16:15:02', NULL, 3, 1034, 9, '1005484152'),
(1035, 'Santo', 'Santiago', 'Ortega', '$2y$10$9jLVqYD7s45plfWJndzWceHv7ofDLrNtq.m/W1.EKGWy5AVpb1pmO', 'A', '2023-06-14 16:15:02', NULL, 3, 1035, 9, '1005484152'),
(1036, 'Santo', 'Santiago', 'Ortega', '$2y$10$LeHeo4g5vkYXlLHs8bq5teSec8vvpqy3rFXI6c4/LMr17IVZaKxdO', 'A', '2023-06-14 16:15:02', NULL, 3, 1036, 9, '1005484152'),
(1037, 'Santo', 'Santiago', 'Ortega', '$2y$10$pZpAclqpPddLH4r.Cge5kup3CCFzNHX2w6Q58RZlh7DF3uQjxQ7/S', 'A', '2023-06-14 16:15:02', NULL, 3, 1037, 9, '1005484152'),
(1038, 'Santo', 'Santiago', 'Ortega', '$2y$10$ZD0w2KqRMvTdD4cUV76KOuGplUbq0xF.OYLorjrWAcbNFbv5dZbsG', 'A', '2023-06-14 16:15:02', NULL, 3, 1038, 9, '1005484152'),
(1039, 'Santo', 'Santiago', 'Ortega', '$2y$10$5aUDrA2ec2JjV39EPv6KreOBuWU6hT8rnBg55Dq2qaH74tEReeCV2', 'A', '2023-06-14 16:15:02', NULL, 3, 1039, 9, '1005484152'),
(1040, 'Santo', 'Santiago', 'Ortega', '$2y$10$/YzmYcc/aWMtNnRCRdyrtegmujXAf1P3geLm0w0WMOS/gpwmqaffa', 'A', '2023-06-14 16:15:02', NULL, 3, 1040, 9, '1005484152'),
(1041, 'Santo', 'Santiago', 'Ortega', '$2y$10$jkyl3jUopL3N6Zlc6pdINepA5rj6zZ1G7jU7N.PJOz/G.fYr5Qe52', 'A', '2023-06-14 16:15:02', NULL, 3, 1041, 9, '1005484152'),
(1042, 'Santo', 'Santiago', 'Ortega', '$2y$10$hx7kFeGa8i1JnCWfqG3B6OWaN5GJznkXy7j1Dow182mBR0KkoMFEC', 'A', '2023-06-14 16:15:02', NULL, 3, 1042, 9, '1005484152'),
(1043, 'Santo', 'Santiago', 'Ortega', '$2y$10$AfqwyWLkmD1ESX.GciOLZu6PBG8Z.oTZeK2db6fmc.xIS9cVN1Vn2', 'A', '2023-06-14 16:15:02', NULL, 3, 1043, 9, '1005484152'),
(1044, 'Santo', 'Santiago', 'Ortega', '$2y$10$OCWHImSKa13SFqJUS0jufOpgFzC0f2cvWlkZeprUL0WQfANF2guR6', 'A', '2023-06-14 16:15:02', NULL, 3, 1044, 9, '1005484152'),
(1045, 'Santo', 'Santiago', 'Ortega', '$2y$10$sk6x93VkjubmtYZBTbpTdOs1w1qmeLbOCirPmLe0/wTcviFu/8Xq.', 'A', '2023-06-14 16:15:02', NULL, 3, 1045, 9, '1005484152'),
(1046, 'Santo', 'Santiago', 'Ortega', '$2y$10$JMg3TMQtNWh57sv6AGFZROmYOmmcOi3lFBqI/M/OduavCIXWKLkIK', 'A', '2023-06-14 16:15:02', NULL, 3, 1046, 9, '1005484152'),
(1047, 'Santo', 'Santiago', 'Ortega', '$2y$10$4QATlVJItiJodng0V/EdQuz3CzmPDPSg9Gt9U/EPM1c/BdShRaJiG', 'A', '2023-06-14 16:15:02', NULL, 3, 1047, 9, '1005484152'),
(1048, 'Santo', 'Santiago', 'Ortega', '$2y$10$BNxJzBYR4gqzfRiMgotKs.c2GcOBmhsKnbAv6FYBn3Dqm5wjV86X6', 'A', '2023-06-14 16:15:02', NULL, 3, 1048, 9, '1005484152'),
(1049, 'Santo', 'Santiago', 'Ortega', '$2y$10$XSNKwxpVLvwWwH4vzGhFmukGxP23IVgj0JN4pjzzrTnUBaa9LylWC', 'A', '2023-06-14 16:15:02', NULL, 3, 1049, 9, '1005484152'),
(1050, 'Santo', 'Santiago', 'Ortega', '$2y$10$wwVP9hyPQVfuNtGbmL0eo..yM.t/pEzrNIK8pQ52vGnMeO.AbYl2y', 'A', '2023-06-14 16:15:02', NULL, 3, 1050, 9, '1005484152'),
(1051, 'Santo', 'Santiago', 'Ortega', '$2y$10$.ylTFNQItA/U/JQP5TFFeeADvXiZOnQIVc4n.Bl4gaz/9OeKtxYTy', 'A', '2023-06-14 16:15:02', NULL, 3, 1051, 9, '1005484152'),
(1052, 'Santo', 'Santiago', 'Ortega', '$2y$10$qcM9zKSH3ikC3e31YKPx3Ok.V84z24sQ0s.Gczmn/xCAwhaHvZPuO', 'A', '2023-06-14 16:15:02', NULL, 3, 1052, 9, '1005484152'),
(1053, 'Santo', 'Santiago', 'Ortega', '$2y$10$rGIWNP23oyBhyfgqRhMly.2FlFkeC3mexlv8KekXg4obhF1xNOwHa', 'A', '2023-06-14 16:15:02', NULL, 3, 1053, 9, '1005484152'),
(1054, 'Santo', 'Santiago', 'Ortega', '$2y$10$RVmD.rWhSjSIMmD2UQdLrOXgBL2jRgPr3ZQkQK87EmxZXMwPfwi9y', 'A', '2023-06-14 16:15:02', NULL, 3, 1054, 9, '1005484152'),
(1055, 'Santo', 'Santiago', 'Ortega', '$2y$10$T/YTKKkB9UWeyulMcrN.MOe7MPwp3iD2q9CLdxd0/yQkDUzr3iJ/q', 'A', '2023-06-14 16:15:02', NULL, 3, 1055, 9, '1005484152'),
(1056, 'Santo', 'Santiago', 'Ortega', '$2y$10$x1zhh2ikrEhYbIAYP4/AeuU3fD8T.EfrzjOD/n6dYbp4BJJi25vCq', 'A', '2023-06-14 16:15:02', NULL, 3, 1056, 9, '1005484152'),
(1057, 'Santo', 'Santiago', 'Ortega', '$2y$10$GyMIQug9jhoS8KZzo/1d1.ICFnmr24vg212RNf1YpLJLkhsnedYlK', 'A', '2023-06-14 16:15:02', NULL, 3, 1057, 9, '1005484152'),
(1058, 'Santo', 'Santiago', 'Ortega', '$2y$10$hX7ccAA/TWCuLdqYEVvZnewiGGttX3d3NH7v.HNUpTFpKyg0gKfQi', 'A', '2023-06-14 16:15:02', NULL, 3, 1058, 9, '1005484152'),
(1059, 'Santo', 'Santiago', 'Ortega', '$2y$10$y9KZla5J4DQyby4Og6Jv7.mJDXjVTZnBjrJTDZ1vXfXF/WkAx.xi2', 'A', '2023-06-14 16:15:02', NULL, 3, 1059, 9, '1005484152'),
(1060, 'Santo', 'Santiago', 'Ortega', '$2y$10$qZUHoFT0nvLUma05wwkjFOTyopbnSS8.5X89G6R23syFJ2ZujC/Wi', 'A', '2023-06-14 16:15:02', NULL, 3, 1060, 9, '1005484152'),
(1061, 'Santo', 'Santiago', 'Ortega', '$2y$10$.dCu7QheHkijd40w4qIyluNb0aDJTXTP9ZnGjMvJDX5GBIkzbQewW', 'A', '2023-06-14 16:15:02', NULL, 3, 1061, 9, '1005484152'),
(1062, 'Santo', 'Santiago', 'Ortega', '$2y$10$K5Mcgd8yHHIM2Zd8o3Qd4.VcBlgN/EkOs6XfmglOnXRzHDH1Q9CJ2', 'A', '2023-06-14 16:15:02', NULL, 3, 1062, 9, '1005484152'),
(1063, 'Santo', 'Santiago', 'Ortega', '$2y$10$C2OHnnz1jX9pMRBiIEWq8.jO7soq2FLffM4qiTOnSDtCQvCRPoexG', 'A', '2023-06-14 16:15:02', NULL, 3, 1063, 9, '1005484152'),
(1064, 'Santo', 'Santiago', 'Ortega', '$2y$10$l6gg3weTgEAazXmelKpyIuPz1lOv40/Z.pVED7x7HyBZbXiZm3HGO', 'A', '2023-06-14 16:15:02', NULL, 3, 1064, 9, '1005484152'),
(1065, 'Santo', 'Santiago', 'Ortega', '$2y$10$2LPVTc0o0cdL1dZMRogKJu8/2sUwtyQeHfV0KR1GqF/G1H1.Xj7fS', 'A', '2023-06-14 16:15:02', NULL, 3, 1065, 9, '1005484152'),
(1066, 'Santo', 'Santiago', 'Ortega', '$2y$10$0WN.O4zMAxvXyQ9bCCRRL.BLQKfbS/8kgalHQIxMUqbPZyRmxJULC', 'A', '2023-06-14 16:15:02', NULL, 3, 1066, 9, '1005484152'),
(1067, 'Santo', 'Santiago', 'Ortega', '$2y$10$EHmvfjB0i92Q9wI4.tnZ4ur7DqEZFkUo/Nka0p1Wyz2K8eREhg8dK', 'A', '2023-06-14 16:15:02', NULL, 3, 1067, 9, '1005484152'),
(1068, 'Santo', 'Santiago', 'Ortega', '$2y$10$cp/1KLtIGj9R0LqUA.YfDOtXbJR1DaWwoIX8/9R.hAdUr847gjS0m', 'A', '2023-06-14 16:15:02', NULL, 3, 1068, 9, '1005484152'),
(1069, 'Santo', 'Santiago', 'Ortega', '$2y$10$qUbQcb1oa7IIrne0qN7zg.zYoTnWoytoUAdBQXFMPT5yX.IKOKwFS', 'A', '2023-06-14 16:15:02', NULL, 3, 1069, 9, '1005484152'),
(1070, 'Santo', 'Santiago', 'Ortega', '$2y$10$XrfXzByadf/vnGBbjFPnBe.v6EVO7FLGJ977FBZL4v03zxyG.LY/u', 'A', '2023-06-14 16:15:02', NULL, 3, 1070, 9, '1005484152'),
(1071, 'Santo', 'Santiago', 'Ortega', '$2y$10$9L0g.LupGF5Q0RWvGyDdLuY7C91gk3ITCbRJBrvZP6OwuQQ.1CTU.', 'A', '2023-06-14 16:15:02', NULL, 3, 1071, 9, '1005484152'),
(1072, 'Santo', 'Santiago', 'Ortega', '$2y$10$KKUljRSdy.vMFq0yMTCY0uM9Jm.YZxy3yNiv5KNjOleiQ1u2BRxbm', 'A', '2023-06-14 16:15:02', NULL, 3, 1072, 9, '1005484152'),
(1073, 'Santo', 'Santiago', 'Ortega', '$2y$10$kmbTkIpZE.O9fppD25pXbuwb3s010XHCC/4kde27EhVaSUnNPRrdC', 'A', '2023-06-14 16:15:02', NULL, 3, 1073, 9, '1005484152'),
(1074, 'Santo', 'Santiago', 'Ortega', '$2y$10$XZJkfTrK39t/U2hxO1cDcecrzXZXAp8GdWxEA1I.wTdSEzOT08P5G', 'A', '2023-06-14 16:15:02', NULL, 3, 1074, 9, '1005484152'),
(1075, 'Santo', 'Santiago', 'Ortega', '$2y$10$t3B9iQFnRWE.y45FM2D5TuHfMuvpcuNm6mRZ06OveRmmS2oF/neQa', 'A', '2023-06-14 16:15:02', NULL, 3, 1075, 9, '1005484152'),
(1076, 'Santo', 'Santiago', 'Ortega', '$2y$10$hE4vF2dGcvZx/QrdzUrgzu4ppCIZSI8zYrAzA.qV2bYDHCfpowXYi', 'A', '2023-06-14 16:15:02', NULL, 3, 1076, 9, '1005484152'),
(1077, 'Santo', 'Santiago', 'Ortega', '$2y$10$UItYYwD6PhVmjtHB1FKs/.nUEhiG/JzXrF97F3j1xUakNYULJ6WRe', 'A', '2023-06-14 16:15:02', NULL, 3, 1077, 9, '1005484152'),
(1078, 'Santo', 'Santiago', 'Ortega', '$2y$10$P5kBOq5hxE3WjtLBLqE49.Jhj6sx4DGr1cI.9DMvrixBGoQE7Hn7e', 'A', '2023-06-14 16:15:03', NULL, 3, 1078, 9, '1005484152'),
(1079, 'Santo', 'Santiago', 'Ortega', '$2y$10$5YpfWUTQ70fCZA9a0ikn4uAf4j/FdD41GsgS/vDuZJV764m7P8TyC', 'A', '2023-06-14 16:15:03', NULL, 3, 1079, 9, '1005484152'),
(1080, 'Santo', 'Santiago', 'Ortega', '$2y$10$gi6oEzRcjvwxfhDlIbAJ/u9Ob9F79cbebZ9U4O2TDsBtnZPldwl0e', 'A', '2023-06-14 16:15:03', NULL, 3, 1080, 9, '1005484152'),
(1081, 'Santo', 'Santiago', 'Ortega', '$2y$10$ycb/.ucDXN8U1Dtf9I2KgegoIcwg8K1BEigRNhM02fqDp3tmJ8ewK', 'A', '2023-06-14 16:15:03', NULL, 3, 1081, 9, '1005484152'),
(1082, 'Santo', 'Santiago', 'Ortega', '$2y$10$2/iuOev3ALX4lGHeuSB9Ouvrz/KRdIjON7gxIcxtUKwOBXqjLVXh2', 'A', '2023-06-14 16:15:03', NULL, 3, 1082, 9, '1005484152'),
(1083, 'Santo', 'Santiago', 'Ortega', '$2y$10$xYuMtxmF6B7lnmHnKW/PtOaqJlttjeEuU1EK3V.4PswMgDOgxHP2a', 'A', '2023-06-14 16:15:03', NULL, 3, 1083, 9, '1005484152'),
(1084, 'Santo', 'Santiago', 'Ortega', '$2y$10$juFFUM2eJ4VmsPWoEFir7eytvv.88v4AGIgB.IkPGnPmTR.E9xXOe', 'A', '2023-06-14 16:15:03', NULL, 3, 1084, 9, '1005484152'),
(1085, 'Santo', 'Santiago', 'Ortega', '$2y$10$S.jYrC6ySUjmVy96GM1Ipen9H18cIPUnW3f2U620cy8Xl/fHYOYY2', 'A', '2023-06-14 16:15:03', NULL, 3, 1085, 9, '1005484152'),
(1086, 'Santo', 'Santiago', 'Ortega', '$2y$10$EmhkqvTgsh8TlMFPi17G3eEpLo4wnDebNtl4DVwmtUuk4L1JZmBDy', 'A', '2023-06-14 16:15:03', NULL, 3, 1086, 9, '1005484152'),
(1087, 'Santo', 'Santiago', 'Ortega', '$2y$10$iTqQzDK4wn8VbSSsCaCJkuUjiOFG7JwowVtMCAtN.ci.FGd7uAfLa', 'A', '2023-06-14 16:15:03', NULL, 3, 1087, 9, '1005484152'),
(1088, 'Santo', 'Santiago', 'Ortega', '$2y$10$gfuSJ/U1EbVHFt1qM46SWOKD6Deu/AdG2pbjOikl.YO8Jo0/b.E76', 'A', '2023-06-14 16:15:03', NULL, 3, 1088, 9, '1005484152'),
(1089, 'Santo', 'Santiago', 'Ortega', '$2y$10$Ine5GgrbLkJ/W49r9EGuw.tAeT3AAzn9oIN2cirjoFzmvrPQnP5A.', 'A', '2023-06-14 16:15:03', NULL, 3, 1089, 9, '1005484152'),
(1090, 'Santo', 'Santiago', 'Ortega', '$2y$10$vu.fI2j7pBbBtT7XPF4Op.WULrViy47vuzRTui9out5RYLSCMgfKe', 'A', '2023-06-14 16:15:03', NULL, 3, 1090, 9, '1005484152'),
(1091, 'Santo', 'Santiago', 'Ortega', '$2y$10$m3spLxViP0pCl7xZz3jqZe4azG0wDloykTtaY4yYJDNUgh0/oWJJa', 'A', '2023-06-14 16:15:04', NULL, 3, 1091, 9, '1005484152'),
(1092, 'Santo', 'Santiago', 'Ortega', '$2y$10$z4UQgBHrDMd69Xd33.pmPeDFCJfC8w2Kx/Bml3RVvu..8lJ/1qijW', 'A', '2023-06-14 16:15:04', NULL, 3, 1092, 9, '1005484152'),
(1093, 'Santo', 'Santiago', 'Ortega', '$2y$10$R7X6ZBi/LZ3SGaiu9PgbHekKp8FvulfSYbogDX1X0KeoocflEHLjO', 'A', '2023-06-14 16:15:04', NULL, 3, 1093, 9, '1005484152'),
(1094, 'Santo', 'Santiago', 'Ortega', '$2y$10$ckZFIqehTLCu/Ps6058vxOXrD5EDL4GIXRd1kUH.koz/lVtO5bJHe', 'A', '2023-06-14 16:15:04', NULL, 3, 1094, 9, '1005484152'),
(1095, 'Santo', 'Santiago', 'Ortega', '$2y$10$7/AkyY7sH2PzYKtlbdcqS.vQS4Rfrfe3yrJ7FnnPlTwO3/ilva9yG', 'A', '2023-06-14 16:15:04', NULL, 3, 1095, 9, '1005484152'),
(1096, 'Santo', 'Santiago', 'Ortega', '$2y$10$nJ5tjhTuTooLaN4LjnZyteMgjyQbJRB2uil1SJ7V8W5QBpugCKoda', 'A', '2023-06-14 16:15:04', NULL, 3, 1096, 9, '1005484152'),
(1097, 'Santo', 'Santiago', 'Ortega', '$2y$10$Hm5QP7hxtfU27BHQ6rTmiOKVWb1LBP86X8PYETR0tv0XBXHCCu2gi', 'A', '2023-06-14 16:15:04', NULL, 3, 1097, 9, '1005484152'),
(1098, 'Santo', 'Santiago', 'Ortega', '$2y$10$OAOJIuI/HOzKj3TqPtYtSui0rAhfEfkp.F6.MuZXVTXoIJGD5CVyK', 'A', '2023-06-14 16:15:04', NULL, 3, 1098, 9, '1005484152'),
(1099, 'Santo', 'Santiago', 'Ortega', '$2y$10$FNwjZCfGjEu3whIJZqqA5.Hf4U3Jo3R.seyQ4miYBCfoNNh8V673O', 'A', '2023-06-14 16:15:04', NULL, 3, 1099, 9, '1005484152'),
(1100, 'Santo', 'Santiago', 'Ortega', '$2y$10$ufooZbcngWP33SGM14/.peIiNQuxYFKE47OmfYNJUCInmfABiTsMm', 'A', '2023-06-14 16:15:04', NULL, 3, 1100, 9, '1005484152'),
(1101, 'Santo', 'Santiago', 'Ortega', '$2y$10$Vjg/uI5UXYjUDT/9eI6TQOprKXD5QEKM2aDJC5pDKG4W9t3t8kHiG', 'A', '2023-06-14 16:15:04', NULL, 3, 1101, 9, '1005484152'),
(1102, 'Santo', 'Santiago', 'Ortega', '$2y$10$iBz2qO3TXIP/A8tmzA9tKeADC7f6qo9UxqNJmDKZ..oQ7qX.PPgLK', 'A', '2023-06-14 16:15:04', NULL, 3, 1102, 9, '1005484152'),
(1103, 'Santo', 'Santiago', 'Ortega', '$2y$10$d2QNcE6dD1pOKIEsNDNcxO13T4E0rIID9iT2jfqxaRcMjb6gzoMYy', 'A', '2023-06-14 16:15:04', NULL, 3, 1103, 9, '1005484152'),
(1104, 'Santo', 'Santiago', 'Ortega', '$2y$10$3V1CRp41WH4xypWHZjHSKebVhA994AgyQj1lDvkmr2jDf.mg/UMeu', 'A', '2023-06-14 16:15:04', NULL, 3, 1104, 9, '1005484152'),
(1105, 'Santo', 'Santiago', 'Ortega', '$2y$10$VBUuuiD73Aam8HW.OoBJj.wDBLC9bd7O2000/xGRkMtL6NQFr6AAC', 'A', '2023-06-14 16:15:04', NULL, 3, 1105, 9, '1005484152'),
(1106, 'Santo', 'Santiago', 'Ortega', '$2y$10$Y3gPNMUvqNNVsweZYWekje83koETAQJBIuyKB5QhzZduOEgZQNO5G', 'A', '2023-06-14 16:15:04', NULL, 3, 1106, 9, '1005484152'),
(1107, 'Santo', 'Santiago', 'Ortega', '$2y$10$exlbgRdOyK4o7QIKohj6COPTEpdvkfUQF6GED278PwWdqA5FE656y', 'A', '2023-06-14 16:15:04', NULL, 3, 1107, 9, '1005484152'),
(1108, 'Santo', 'Santiago', 'Ortega', '$2y$10$c7k24kHD9HMAMXmvh8F57.TYo5fVhSufCGQjt9LoRcz4UcCFBQocC', 'A', '2023-06-14 16:15:04', NULL, 3, 1108, 9, '1005484152'),
(1109, 'Santo', 'Santiago', 'Ortega', '$2y$10$WUXoh3u8smMuKryz5k/c0uHfyOlj8C6hsJ1d3RQGLGbmtvtUfudpq', 'A', '2023-06-14 16:15:04', NULL, 3, 1109, 9, '1005484152'),
(1110, 'Santo', 'Santiago', 'Ortega', '$2y$10$0hxx7mOdEVzhYUR.Y12NJ.tqIVBm.66AGlrhpW6M9HJC0wma1Y/0.', 'A', '2023-06-14 16:15:04', NULL, 3, 1110, 9, '1005484152'),
(1111, 'Santo', 'Santiago', 'Ortega', '$2y$10$h3Cke9CSNGIXv3B3P2lcTei8UP8MGfLnAvAaBnwPC5ywEDVaZ2PHy', 'A', '2023-06-14 16:15:05', NULL, 3, 1111, 9, '1005484152'),
(1112, 'Santo', 'Santiago', 'Ortega', '$2y$10$b9VrAS6BF4iiUXpL8GdyzOVDM5X5ZL9WoZSmt/uxLX2WHcOueBohC', 'A', '2023-06-14 16:15:05', NULL, 3, 1112, 9, '1005484152'),
(1113, 'Santo', 'Santiago', 'Ortega', '$2y$10$wQ5L4OpUd7XePWEat27ade.FiQnUHoefU2sSWqwnhe6mPyRcXWAWO', 'A', '2023-06-14 16:15:05', NULL, 3, 1113, 9, '1005484152'),
(1114, 'Santo', 'Santiago', 'Ortega', '$2y$10$BgRstXpPXopyfL/eyD4F2OrnN4B6tYlljzE35JyV.MXtSP99GREPW', 'A', '2023-06-14 16:15:05', NULL, 3, 1114, 9, '1005484152'),
(1115, 'Santo', 'Santiago', 'Ortega', '$2y$10$BOzwachB5yTDrwJniD8c7ed7yrSl11DOboxMo6UebnSgB24YZouMi', 'A', '2023-06-14 16:15:05', NULL, 3, 1115, 9, '1005484152');

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

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_parametros_det
--
-- Indices de la tabla `acciones`
--
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
  MODIFY `id_fondo-emergencia` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5533;

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
