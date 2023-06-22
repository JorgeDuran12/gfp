-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2023 a las 17:36:29
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

DROP TABLE IF EXISTS `acciones`;
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

DROP TABLE IF EXISTS `agenda`;
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

DROP TABLE IF EXISTS `disponibles`;
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
(22, 2023, '10.00', '21.00', '367.00', '-336.00', 'A', '2023-06-06 14:57:51', 3),
(23, 2023, '3000000.00', '0.00', '1180000.00', '1820000.00', 'A', '2023-06-06 15:07:41', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emails`
--

DROP TABLE IF EXISTS `emails`;
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
(56, 'delassalasospino2003@gmail.com', 13, 'A', '2023-05-19 17:40:37', 73, 73),
(57, 'daniel@gmail.com', 13, 'A', '2023-05-19 17:46:55', 74, 74),
(58, 'duran3313@gmail.com', 13, 'A', '2023-05-19 18:03:01', 75, 75),
(59, 'wilfri@gmail.com', 13, 'A', '2023-05-19 18:08:18', 76, 76),
(60, 'delassalasospino2030@gmail.com', 13, 'A', '2023-05-29 15:27:50', 77, 77),
(62, 'dev@gmail.com', 13, 'A', '2023-05-24 17:12:39', 79, 79),
(63, 'yo@gmail.com', 13, 'A', '2023-05-25 19:22:08', 80, 80),
(65, 'delassalasospino20033@gmail.com', 13, 'A', '2023-05-25 19:26:00', 82, 82),
(66, 'santiagoguerreroh034@gmail.com', 13, 'A', '2023-05-26 17:36:13', 83, 83),
(67, 'asdasdasdasdasd@gmail.com', 13, 'A', '2023-05-26 18:21:44', 84, 84),
(85, 'rosa@gmail.com', 13, 'A', '2023-05-29 20:05:21', 86, 86),
(86, '23a@gmail.com', 13, 'A', '2023-05-29 20:11:40', 87, 87),
(88, 'krast@gmail.com', 14, 'A', '2023-05-29 20:27:10', 77, 77),
(89, 'manpower@gmail.com', 13, 'A', '2023-05-29 20:43:59', 88, 88),
(90, 'pepe11@gmail.com', 13, 'A', '2023-05-30 17:39:59', 89, 89),
(94, 'arevalosarmientokenny@gmail.com', 13, 'A', '2023-06-05 17:36:57', 90, 90),
(95, 'micorreop@gmail.com', 14, 'A', '2023-06-05 18:22:10', 82, 82),
(96, 'correoqm@gmail.com', 14, 'A', '2023-06-05 19:08:05', 82, 82);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_emergencia`
--

DROP TABLE IF EXISTS `fondo_emergencia`;
CREATE TABLE `fondo_emergencia` (
  `id_fondo-emergencia` smallint(2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fondo_emergencia`
--

INSERT INTO `fondo_emergencia` (`id_fondo-emergencia`, `fecha_registro`, `valor`, `estado`, `fecha_crea`, `id_usuario`, `usuario_crea`) VALUES
(1, '2023-07-05', '21312321.00', 'A', '2023-06-06 19:56:15', 3, 3),
(2, '2023-06-06', '10000.00', 'A', '2023-06-06 19:57:46', 28, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
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
(394, 'intento 2', 1, 4, '10.00', '2023-06-06 14:17:00', 'A', '2023-06-06 19:17:18', 3),
(395, 'intento 2', 2, 3, '10.00', '2023-06-06 14:18:00', 'A', '2023-06-06 19:18:09', 3),
(396, 'cuota saquito', 2, 4, '5.00', '2023-06-06 14:18:57', 'A', '2023-06-06 19:18:57', 3),
(397, 'cuota saquito', 2, 4, '3.00', '2023-06-06 14:21:31', 'A', '2023-06-06 19:21:31', 3),
(398, 'jkhkjhkjhkjhkjh', 1, 4, '1.00', '2023-06-06 14:22:00', 'A', '2023-06-06 19:22:32', 3),
(399, 'cuota saquito', 2, 4, '5.00', '2023-06-06 14:25:13', 'A', '2023-06-06 19:25:13', 3),
(400, 'cuota saquito', 2, 4, '5.00', '2023-06-06 14:25:30', 'A', '2023-06-06 19:25:30', 3),
(401, 'cuota saquito', 2, 4, '5.00', '2023-06-06 14:25:55', 'A', '2023-06-06 19:25:55', 3),
(402, 'cuota saquito', 2, 4, '600000.00', '2023-06-06 14:27:27', 'A', '2023-06-06 19:27:27', 31),
(403, 'aopsdjfsiopdufoisduf', 2, 3, '11.00', '2023-06-06 14:39:00', 'A', '2023-06-06 19:39:27', 3),
(404, 'cuota saquito', 2, 4, '10.00', '2023-06-06 14:39:55', 'A', '2023-06-06 19:39:55', 3),
(405, 'cuota saquito', 2, 4, '500000.00', '2023-06-06 14:47:36', 'A', '2023-06-06 19:47:36', 31),
(406, 'cuota saquito', 2, 4, '20.00', '2023-06-06 14:48:29', 'A', '2023-06-06 19:48:29', 3),
(407, 'cuota saquito', 2, 4, '321.00', '2023-06-06 14:57:51', 'A', '2023-06-06 19:57:51', 3),
(408, 'cuota saquito', 2, 4, '40000.00', '2023-06-06 15:07:32', 'A', '2023-06-06 20:07:32', 31),
(409, 'cuota saquito', 2, 4, '40000.00', '2023-06-06 15:07:41', 'A', '2023-06-06 20:07:41', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_det`
--

DROP TABLE IF EXISTS `parametros_det`;
CREATE TABLE `parametros_det` (
  `id_parametro_det` smallint(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `resumen` varchar(3) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_parametro_enc` smallint(2) NOT NULL,
  `id_usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parametros_det`
--
INSERT INTO `parametros_det` (`id_parametro_det`, `nombre`, `resumen`, `estado`, `fecha_crea`, `id_parametro_enc`, `id_usuario_crea`) VALUES
(1, 'Bancario', 'Ba', 'A', '2023-05-11 13:45:16', 1, 1),
(2, 'No bancario', 'Nb', 'A', '2023-05-11 13:45:32', 1, 1),
(3, 'Ingreso', 'In', 'A', '2023-04-21 13:23:09', 2, 1),
(4, 'Egreso', 'Eg', 'A', '2023-05-11 13:45:25', 2, 1),
(9, 'Cedula de Ciudadania', 'C.C', 'A', '2023-05-25 13:22:56', 3, 1),
(10, 'Tarjeta de Identidad', 'T.I', 'A', '2023-05-25 13:22:59', 3, 1),
(11, 'Pasaporte', 'P.T', 'A', '2023-05-25 13:23:01', 3, 1),
(12, 'Cedula de Extranjeria', 'C.E', 'A', '2023-05-25 13:22:51', 3, 1),
(13, 'principal', 'P', 'A', '2023-05-25 13:22:19', 6, 1),
(14, 'secundario', 'S', 'A', '2023-05-25 13:22:22', 6, 1),
(15, 'Numero de Identificacion Tributaria', 'NIT', 'A', '2023-05-25 13:23:05', 3, 2),
(16, 'Permiso Especial de Permanencia', 'P.E', 'A', '2023-05-25 13:23:07', 3, 1),

(22, 'Gas ', 'sp', 'A', '2023-06-06 12:42:12', 7, 1),
(23, 'Agua', 'ra', 'A', '2023-06-06 12:42:17', 7, 1),
(24, 'Energia', 're', 'A', '2023-06-06 12:42:15', 7, 1),
(25, 'Internet', 'ri', 'A', '2023-06-06 12:42:10', 7, 1),
(28, 'Television', 'rt', 'A', '2023-06-06 12:42:18', 7, 1),
(29, 'Telefonico', 'rt', 'A', '2023-06-06 12:42:25', 7, 1),
(36, 'Netflix', 'nt', 'A', '2023-06-06 12:40:09', 8, 1),
(37, 'Amazon_prime', 'ap', 'A', '2023-06-06 12:40:09', 8, 1),
(38, 'Youtube_premium', 'yp', 'A', '2023-06-06 12:43:08', 8, 1),
(39, 'Spotify', 'sp', 'A', '2023-06-06 12:40:09', 8, 1),
(40, 'Disney', 'dn', 'A', '2023-06-06 12:40:09', 8, 1),
(41, 'HBO', 'hb', 'A', '2023-06-06 12:41:26', 8, 1),
(42, 'Star+', 'st', 'A', '2023-06-06 12:41:03', 8, 1),
(43, 'Sueter', 'st', 'A', '2023-06-06 12:44:33', 9, 1),
(53, 'Camisa', 'cm', 'A', '2023-06-06 12:48:36', 9, 1),
(54, 'Zapatos', 'zp', 'A', '2023-06-06 12:48:36', 9, 1),
(55, 'Accesorios', 'acc', 'A', '2023-06-06 12:48:36', 9, 1),
(56, 'Pantalon', 'pt', 'A', '2023-06-06 12:48:36', 9, 1),
(81, 'Pagos en linea', '', 'A', '2023-06-20 17:56:25', 1, 3),
(82, 'Ingreso de fondo', '', 'A', '2023-06-20 18:53:18', 10, 31),
(83, 'Uso del fondo', '', 'A', '2023-06-20 18:53:30', 10, 31),
(84, 'Presupuesto actual', '', 'A', '2023-06-20 19:04:13', 11, 3),
(85, 'Fondo de emergencia', '', 'A', '2023-06-20 19:04:29', 11, 3);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_enc`
--

DROP TABLE IF EXISTS `parametros_enc`;
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
(1, 'Tipo de movimiento', 'A', '2023-03-01 13:24:28', 1),
(2, 'Clase de movimiento', 'A', '2023-03-01 13:24:40', 1),
(3, 'tipo_dcto', 'A', '2023-04-21 13:16:02', 1),
(6, 'prioridad', 'A', '2023-04-21 13:38:55', 1),
(7, 'servicios_publicos', 'A', '2023-06-06 12:33:11', 1),
(8, 'paginas_entretenimiento', 'A', '2023-06-06 12:35:04', 1),
(9, 'ropa', 'A', '2023-06-06 12:43:43', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
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

DROP TABLE IF EXISTS `proyeccion`;
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
(118, '2023-06-06', '5.00', '0.00', 'A', '2023-06-06 19:18:57', 63, 3),
(119, '2023-06-06', '3.00', '0.00', 'A', '2023-06-06 19:21:31', 64, 3),
(120, '2023-06-06', '5.00', '0.00', 'A', '2023-06-06 19:25:13', 65, 3),
(121, '2023-06-06', '5.00', '0.00', 'A', '2023-06-06 19:25:30', 65, 3),
(122, '2023-06-06', '5.00', '0.00', 'A', '2023-06-06 19:25:55', 65, 3),
(123, '2023-06-06', '600000.00', '0.00', 'A', '2023-06-06 19:27:27', 66, 31),
(124, '2023-06-06', '10.00', '0.00', 'A', '2023-06-06 19:39:55', 68, 3),
(125, '2023-06-06', '500000.00', '0.00', 'A', '2023-06-06 19:47:36', 67, 31),
(126, '2023-06-06', '20.00', '0.00', 'A', '2023-06-06 19:48:29', 69, 3),
(127, '2023-06-06', '321.00', '0.00', 'A', '2023-06-06 19:57:51', 70, 3),
(128, '2023-06-06', '40000.00', '0.00', 'A', '2023-06-06 20:07:32', 72, 31),
(129, '2023-06-06', '40000.00', '0.00', 'A', '2023-06-06 20:07:41', 72, 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
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
(1, 'Super Administrador', 'Acceso completo en el sistema.\r\npuede gestionar usuarios, roles, grupos y otros superadministradores u administradores.\r\nDarle mantenimiento a la pagina, etc.', 'A', 3, '2023-05-31 15:23:24'),
(2, 'Administrador', 'Permiso para gestionar a todos los usuarios finales dentro del sistema\r\n', 'A', 1, '2023-05-31 16:33:08'),
(3, 'Usuario', 'Acceso a todas las herramientas que ofrece el sistema', 'A', 3, '2023-05-31 16:33:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saquitos`
--

DROP TABLE IF EXISTS `saquitos`;
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
(63, 'saquito 1', '2023-06-06', '5.00', '1', '5.00', 'C', '2023-06-06 14:18:58', 3),
(64, 'inetnto 2', '2023-06-06', '3.00', '1', '3.00', 'C', '2023-06-06 14:24:34', 3),
(65, 'inetnto 3', '2023-06-06', '15.00', '3', '5.00', 'C', '2023-06-06 14:25:56', 3),
(66, 'telefono', '2023-06-06', '600000.00', '2', '300000.00', 'C', '2023-06-06 14:27:28', 31),
(67, 'fhuuh', '2023-06-06', '500000.00', '2', '250000.00', 'C', '2023-06-06 14:47:38', 31),
(68, 'inetnto 12', '2023-06-06', '10.00', '1', '10.00', 'C', '2023-06-06 14:39:55', 3),
(69, 'intento 15', '2023-06-06', '20.00', '2', '10.00', 'C', '2023-06-06 14:48:30', 3),
(70, 'asdasdasd', '2023-06-06', '321.00', '3', '107.00', 'C', '2023-06-06 14:57:52', 3),
(71, 'ajsghdjasghdjhagsd', '2023-06-06', '10.00', '2', '5.00', 'A', '2023-06-06 20:06:30', 3),
(72, 'tefefgdfg', '2023-06-16', '80000.00', '2', '40000.00', 'C', '2023-06-06 15:07:42', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
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
(68, '3045555557', 14, '2023-06-05 14:39:08', 'A', 82, 82),
(69, '3184133027', 13, '2023-06-05 14:39:08', 'A', 82, 82),
(70, '3052322603', 14, '2023-06-05 19:40:49', 'A', 82, 82);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
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
(1, 'devLas', 'carlos', 'de las salas', '12132', 'A', '2023-06-02 12:39:16', '', 1, 1, 9, '6565632'),
(2, 'Safe', 'santiago', 'guerrero', 'hola', 'E', '2023-05-31 16:05:09', '', 2, 1, 9, '32323'),
(3, 'JorgeDuran12', 'Jorge Luis', 'Duran Olivares', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-05-31 13:45:29', 'x9pyYTQt9kji4RAPdEyrsNuNyZQUCG', 1, 3, 9, '10072199901'),
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
(82, 'krasterr', 'carlos', 'de las salas', '$2y$10$B00/Npo09IDOnEkbMB7yIOtbQWxezlnbMhZaYbsqNcxhef53ew3M6', 'A', '2023-06-02 14:56:40', NULL, 3, 82, 9, '1048264406'),
(83, 'santo', 'santiago', 'guerrero', '$2y$10$sy3dlueCx7EsHqvL.xz2XuU0nQSt1.ZCytA.Udam2UjTkQzlnMLD.', 'A', '2023-05-26 12:45:30', NULL, 1, 83, 10, '1001893022'),
(84, 'asdasdasdasd', 'akjsdhakjsdasd', 'asdasdasdasd', '$2y$10$BZtZihUys9PAfMpP36dKV.T9q0iPfltHYFgtkBL2af7odhfSIHXfS', 'A', '2023-05-26 13:21:44', NULL, 3, 84, 10, '1321321321321'),
(86, 'Rosa Melano', 'Rosa ', 'Melano', '$2y$10$dkNfv96cLGW.FHpCBQRTV.lOuGmL30MR2m2e57UApFOHhzlPu9jF6', 'A', '2023-05-29 15:05:21', NULL, 3, 86, 11, '146'),
(87, 'Hola', 'Rosa', 'MElano', '$2y$10$EmyE/S69AeBoIq3cSS7FCu5M254h7qhrJ/1RUstbhkSwYI6JGJPya', 'A', '2023-05-29 15:11:40', NULL, 3, 87, 9, '12312312'),
(88, 'Manpower', 'Carlos ', 'De la salas ', '$2y$10$xCRKSOtp59IIpXx.XouugecQfk8OKoZgS.QiWpOcXSIzV5KgxKBqS', 'A', '2023-06-02 12:39:44', NULL, 1, 88, 9, '135434423'),
(89, 'pepe11', 'pepe', 'quintero', '$2y$10$C4IOno2gJInSaDbVVtSXRuTuUfpxZRnxkiff3FIdBYjTyEz0zGbsu', 'E', '2023-06-02 12:39:31', NULL, 3, 89, 9, '1104287484'),
(90, 'Keas_1303', 'kenny', 'arevalo', '$2y$10$.vGEH260cAwt2pqUWd/NdeeBnkwOCsqknTIp1wh1JmU32H/RpLNIu', 'A', '2023-06-05 12:36:57', NULL, 3, 90, 9, '1043134691');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_parametros_det`
-- (Véase abajo para la vista actual)

CREATE TABLE `vw_parametros_det` (
`id_parametro_det` smallint(2)
,`nombre` varchar(50)
,`resumen` varchar(3)
,`estado` char(1)
,`fecha_crea` timestamp
,`id_parametro_enc` smallint(2)
,`id_usuario_crea` smallint(2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_parametros_det`

-- Índices para tablas volcadas
--

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
  ADD KEY `fondoEmergencia_usuario` (`id_usuario`) USING BTREE;

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
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `disponibles`
--
ALTER TABLE `disponibles`
  MODIFY `id_disponible` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `id_email` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  MODIFY `id_fondo-emergencia` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT de la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  MODIFY `id_parametro_det` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `parametros_enc`
--
ALTER TABLE `parametros_enc`
  MODIFY `id_parametro_enc` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  MODIFY `id_proyeccion` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  MODIFY `id_saquito` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

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
  ADD CONSTRAINT `fondoEmergencia_usuario_crea` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

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
