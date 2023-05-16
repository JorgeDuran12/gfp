-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2023 a las 18:26:30
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
(5, 'recordatorio1', 'asdasdasdasdas', '#1174df', '2023-05-02 00:00:00', '2023-05-03 11:08:00', 59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibles`
--

CREATE TABLE `disponibles` (
  `id_disponible` smallint(2) NOT NULL,
  `periodo` year(4) NOT NULL,
  `saldo_anterior` decimal(11,2) NOT NULL,
  `ingreso` decimal(11,2) NOT NULL,
  `egreso` decimal(11,2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `disponibles`
--

INSERT INTO `disponibles` (`id_disponible`, `periodo`, `saldo_anterior`, `ingreso`, `egreso`, `estado`, `fecha_crea`, `id_usuario`) VALUES
(1, 2023, '0.00', '755000.00', '0.00', 'A', '2023-05-16 14:50:44', 59),
(2, 2023, '0.00', '1000000.00', '0.00', 'A', '2023-05-16 15:56:23', 28);

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
(32, 'iiggyysdwefsdfgs123132@gma.ccccc', 13, 'A', '2023-05-10 21:02:01', 54, 54),
(33, 'mariase3105@gmail.com', 13, 'A', '2023-05-10 16:02:26', 31, 31),
(34, 'santiagoguerreroh034@gmail.com', 13, 'A', '2023-05-11 17:24:20', 55, 55),
(35, 'dta@gmail.com', 13, 'A', '2023-05-11 17:45:56', 56, 3),
(36, 'duran1@gmail.com', 13, 'A', '2023-05-15 17:26:48', 57, 57),
(37, '1234@gmial.com', 13, 'A', '2023-05-15 17:31:37', 58, 58),
(41, 'devlassalas@gmail.com', 13, 'A', '2023-05-15 13:22:06', 1, 1),
(42, 'delassalasospino2003@gmai.com', 13, 'A', '2023-05-16 17:23:46', 59, 59),
(43, 'pepe11@gmail.com', 13, 'A', '2023-05-16 18:30:42', 60, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_emergencia`
--

CREATE TABLE `fondo_emergencia` (
  `id_fondo-emergencia` smallint(2) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(2, 'lo', 2, 2, '10000.00', '2023-05-10 12:22:15', 'A', '2023-05-09 21:19:55', 3),
(3, 'pago de cel de dani pc', 1, 2, '1000000.00', '2023-05-10 12:22:11', 'A', '2023-05-09 21:32:49', 3),
(4, '6511', 2, 2, '1651.00', '2023-05-10 12:14:26', 'A', '2023-05-10 17:13:23', 3),
(32, 'hhhh', 2, 4, '999999999.99', '2023-05-15 12:22:00', 'A', '2023-05-15 17:22:18', 28),
(33, 'hhhhhhhhhh', 2, 4, '10000.00', '2023-05-15 12:22:00', 'A', '2023-05-15 17:22:50', 28),
(34, 'jjjjjj', 1, 3, '44000.00', '2023-05-15 12:23:00', 'A', '2023-05-15 17:23:12', 28),
(35, 'asdasdcascdsac', 2, 4, '999999999.99', '2023-05-15 12:57:00', 'A', '2023-05-15 17:57:57', 3),
(36, 'jjjj', 1, 3, '1000.00', '2023-05-15 13:07:00', 'A', '2023-05-15 18:07:02', 28),
(37, 'jkkkkkkkkk', 1, 4, '1111.00', '2023-05-15 13:07:00', 'A', '2023-05-15 18:07:22', 28),
(38, '651654654', 2, 3, '25156165.00', '2023-05-15 13:55:00', 'A', '2023-05-15 18:55:35', 28),
(39, 'intento 1', 2, 4, '999999999.99', '2023-05-15 14:03:00', 'A', '2023-05-15 19:03:53', 3),
(40, 'intento2', 1, 3, '233322233.00', '2023-05-15 14:04:00', 'A', '2023-05-15 19:04:17', 3),
(41, 'venta de un cel', 2, 3, '1500000.00', '2023-05-16 13:21:00', 'A', '2023-05-16 18:21:27', 28),
(42, 'kk', 1, 3, '10000.00', '2023-05-16 14:10:00', 'A', '2023-05-16 19:10:02', 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_det`
--

CREATE TABLE `parametros_det` (
  `id_parametro_det` smallint(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `resumen` char(2) NOT NULL,
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
(9, 'Cedula de Ciudadania', 'Cc', 'A', '2023-05-01 12:45:56', 3, 1),
(10, 'Tarjeta de Identidad', 'Td', 'A', '2023-05-01 12:46:42', 3, 1),
(11, 'Pasaporte', 'Pt', 'A', '2023-05-01 12:46:47', 3, 1),
(12, 'Cedula de Extranjeria', 'Ce', 'A', '2023-05-01 12:49:34', 3, 1),
(13, 'principal', 'pr', 'A', '2023-04-21 13:39:50', 6, 1),
(14, 'secundario', 'sg', 'A', '2023-04-25 13:10:49', 6, 1),
(15, 'Numero de Identificacion Tributaria', 'NI', 'A', '2023-05-01 12:54:55', 3, 2),
(16, 'Permiso Especial de Permanencia', 'PE', 'A', '2023-05-01 12:57:25', 3, 1);

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
(1, 'Tipo de movimiento', 'A', '2023-03-01 13:24:28', 1),
(2, 'Clase de movimiento', 'A', '2023-03-01 13:24:40', 1),
(3, 'tipo_dcto', 'A', '2023-04-21 13:16:02', 1),
(6, 'prioridad', 'A', '2023-04-21 13:38:55', 1);

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
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_saquito` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'Super Administrador', 'Acceso completo en el sistema.\r\npuede gestionar usuarios, roles, grupos y otros superadministradores u administradores.\r\nDarle mantenimiento a la pagina, etc.', 'A', 1, '2023-05-15 14:41:34'),
(2, 'Administrador', 'Permiso para gestionar a todos los usuarios finales dentro del sistema\r\n', 'A', 1, '2023-05-15 14:41:34'),
(3, 'Usuario', 'Acceso a todas las herramientas que ofrece el sistema ', 'A', 1, '2023-05-15 14:41:34'),
(4, 'gerente', 'se encarga de gestionar los avances', 'A', 2, '2023-05-15 14:41:34'),
(5, 'ghjghjghjghjghjh', 'ghjghjghjghjghjghj', 'A', 3, '2023-05-15 21:17:15'),
(6, 'ffhghfghfgh', 'qweweqweqweqweqw', 'A', 28, '2023-05-16 13:03:51'),
(7, 'algo', 'dadas', 'A', 28, '2023-05-16 17:45:40');

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
(1, 'fdf', '2023-05-10', '5.00', '4', '5.00', 'A', '2023-05-15 21:10:19', 31),
(2, 'fghh', '2023-05-15', '544.00', '1', '4.00', 'A', '2023-05-15 21:12:12', 31),
(3, 'df', '2023-05-16', '56.00', '5', '56.00', 'A', '2023-05-16 19:14:00', 31),
(4, 'fg', '2023-05-31', '66663.00', '5', '65.00', 'A', '2023-05-16 19:14:32', 31),
(5, 'xfdf', '2023-05-16', '5515.00', '52', '5.00', 'A', '2023-05-16 19:36:26', 31),
(6, '423423', '2023-05-16', '234234.00', '23423', '23423.00', 'A', '2023-05-16 19:41:27', 3),
(7, 'weqeqwe', '2023-05-16', '13423423.00', '23453', '423.00', 'A', '2023-05-16 19:59:07', 31),
(8, 'daada', '2023-06-08', '343432.00', '3344', '23.00', 'A', '2023-05-16 20:04:30', 31);

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
(1, '3011559374', 13, '2023-05-15 14:32:36', 'A', 3, 3),
(3, '3238906836', 13, '2023-05-16 12:54:27', 'A', 1, 1),
(4, '3124885564', 13, '2023-05-16 13:24:50', 'A', 28, 28),
(5, '325476727', 13, '2023-05-16 18:30:42', 'A', 60, 60);

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
(1, 'devLas', 'carlos', 'de las salas', '12132', 'A', '2023-05-16 12:23:13', '', 1, 1, 9, '6565632'),
(2, 'Safe', 'santiago', 'guerrero', 'hola', 'A', '2023-05-05 13:12:26', '', 1, 1, 9, '32323'),
(3, 'JorgeDuran12', 'Jorge Luis', 'Duran Olivares', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-05-16 12:26:44', 'x9pyYTQt9kji4RAPdEyrsNuNyZQUCG', 1, 3, 9, '1007219901'),
(28, 'Danipc', 'Daniel', 'Banquet', '$2y$10$Y.pApjdV4iGUqioYGymDPeWScJ9xWX1mE5OQhx2YRrV1mq6sqqdJ6', 'A', '2023-05-16 13:25:40', 'T38e7nEypqPVWubUlDoNnWppxlR5LY', 1, 28, 9, '5535'),
(31, 'Majo', 'Maria jose', 'Ramirez', '$2y$10$lJCs.OVlFG6Cno/nKGRmU.0585QD08xr.um.bIcgGEeiL5CNb8i0S', 'A', '2023-05-10 12:20:35', '', 3, 31, 9, '21113535'),
(40, 'duran12', 'jorge', 'duran', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-05-09 15:48:06', '', 3, 40, 9, '546546546546'),
(54, 'ttt777', 'aaaaa', 'ygtgyy', '$2y$10$KJVTdsxqgJb4z3.U/wmeHuXaLZWxq8MtbqiZtUmNZO0J7XyWQvCga', 'A', '2023-05-10 16:02:01', NULL, 3, 54, 10, '10333334'),
(55, 'santo', 'santiago', 'guerrero', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-05-11 13:11:20', NULL, 3, 55, 9, '1001893022'),
(56, '42343', '354', '32423', '$2y$10$da2qZueVkfRjKBbJMLXKguGdstoMqglSwnUVbD8O2M3.r0SbuRkF2', 'E', '2023-05-16 12:18:45', NULL, 3, 3, 12, '32423'),
(57, 'JorgeDuran12', 'Jorge Luisdwdw', 'Duran Olivares', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'E', '2023-05-16 12:18:39', NULL, 1, 57, 9, '1007219901'),
(58, 'cdbdt', 'dwe3', '3e23', '$2y$10$zn9ovS1DzOB1A2G/LK5o8.g7Yq2eeLRmUVzbndDAT0gcmTL1h.X2S', 'E', '2023-05-15 12:31:53', NULL, 3, 58, 11, '1244523412312'),
(59, 'devlassalas', ' carlos', 'de las salas', '$2y$10$vON5VnMKoERF5ZnXqpjzYu5/t/sObKAuIZIEZxO9.qGsouxUhnlmu', 'A', '2023-05-16 12:23:46', NULL, 3, 59, 9, '1048264406'),
(60, 'pepe11', 'pepe', 'cabo', '$2y$10$IDfqif.6DWwqvRmWzjMzHu2piRI9NpnhFoTKUe3pPT5gMD27l1NZ6', 'A', '2023-05-16 13:30:42', NULL, 3, 60, 9, '142542484');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_parametros_det`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_parametros_det` (
`id_parametro_det` smallint(2)
,`nombre` varchar(50)
,`resumen` char(2)
,`estado` char(1)
,`fecha_crea` timestamp
,`id_parametro_enc` smallint(2)
,`id_usuario_crea` smallint(2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_parametros_det`
--
DROP TABLE IF EXISTS `vw_parametros_det`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_parametros_det`  AS SELECT `parametros_det`.`id_parametro_det` AS `id_parametro_det`, `parametros_det`.`nombre` AS `nombre`, `parametros_det`.`resumen` AS `resumen`, `parametros_det`.`estado` AS `estado`, `parametros_det`.`fecha_crea` AS `fecha_crea`, `parametros_det`.`id_parametro_enc` AS `id_parametro_enc`, `parametros_det`.`id_usuario_crea` AS `id_usuario_crea` FROM `parametros_det``parametros_det`  ;

--
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
  ADD KEY `proyeccion_saquito` (`id_saquito`),
  ADD KEY `usario_crear` (`usuario_crea`);

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
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `disponibles`
--
ALTER TABLE `disponibles`
  MODIFY `id_disponible` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `id_email` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  MODIFY `id_fondo-emergencia` smallint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  MODIFY `id_parametro_det` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `parametros_enc`
--
ALTER TABLE `parametros_enc`
  MODIFY `id_parametro_enc` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `proyeccion`
--
ALTER TABLE `proyeccion`
  MODIFY `id_proyeccion` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  MODIFY `id_saquito` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  ADD CONSTRAINT `proyeccion_saquito` FOREIGN KEY (`id_saquito`) REFERENCES `saquitos` (`id_saquito`),
  ADD CONSTRAINT `usario_crear` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

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
