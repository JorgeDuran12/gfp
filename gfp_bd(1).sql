-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2023 a las 17:23:08
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
(3, 'pago de tareas', 'asdmas.dmna,msdn,masnd,masnd,masdn', '#9d3939', '2023-05-19 00:00:00', '2023-05-20 10:16:00', 28);

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
  `presupuesto_anual` decimal(11,2) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `disponibles`
--

INSERT INTO `disponibles` (`id_disponible`, `periodo`, `saldo_anterior`, `ingreso`, `egreso`, `presupuesto_anual`, `estado`, `fecha_crea`, `id_usuario`) VALUES
(1, 2023, '100000.00', '3000.00', '6000.00', '0.00', 'A', '2023-05-19 12:32:33', 61),
(2, 2023, '999999999.99', '0.00', '0.00', '0.00', 'A', '2023-05-19 12:15:46', 31),
(6, 2023, '3000.00', '0.00', '0.00', '0.00', 'A', '2023-05-19 12:31:42', 61),
(8, 2023, '1000000.00', '0.00', '0.00', '0.00', 'A', '2023-05-19 12:45:03', 28),
(10, 2023, '999999999.99', '0.00', '0.00', '0.00', 'A', '2023-05-19 13:10:35', 28),
(12, 2023, '40000.00', '0.00', '0.00', '0.00', 'A', '2023-05-19 13:30:22', 28),
(13, 2023, '3000000.00', '0.00', '0.00', '0.00', 'A', '2023-05-19 13:30:38', 3),
(15, 2023, '500000.00', '0.00', '0.00', '0.00', 'A', '2023-05-19 15:06:55', 77);

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
(56, 'delassalasospino2003@gmail.com', 13, 'A', '2023-05-19 17:40:37', 73, 73),
(57, 'daniel@gmail.com', 13, 'A', '2023-05-19 17:46:55', 74, 74),
(58, 'duran3313@gmail.com', 13, 'A', '2023-05-19 18:03:01', 75, 75),
(59, 'wilfri@gmail.com', 13, 'A', '2023-05-19 18:08:18', 76, 76),
(60, 'devlassalas@gmail.com', 13, 'A', '2023-05-19 19:59:33', 77, 77);

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
(32, 'hhhh', 2, 4, '999999999.99', '2023-05-15 12:22:00', 'A', '2023-05-15 17:22:18', 28),
(33, 'hhhhhhhhhh', 2, 4, '10000.00', '2023-05-15 12:22:00', 'A', '2023-05-15 17:22:50', 28),
(34, 'jjjjjj', 1, 3, '2000.00', '2023-05-19 15:15:11', 'A', '2023-05-15 17:23:12', 28),
(35, 'asdasdcascdsac', 2, 4, '1000.00', '2023-05-19 15:17:02', 'A', '2023-05-15 17:57:57', 3),
(36, 'jjjj', 1, 3, '1000.00', '2023-05-15 13:07:00', 'A', '2023-05-15 18:07:02', 28),
(37, 'jkkkkkkkkk', 1, 4, '1111.00', '2023-05-15 13:07:00', 'A', '2023-05-15 18:07:22', 28),
(38, '651654654', 2, 3, '25156165.00', '2023-05-15 13:55:00', 'A', '2023-05-15 18:55:35', 28),
(39, 'intento 1', 2, 4, '1000.00', '2023-05-19 15:17:08', 'A', '2023-05-15 19:03:53', 3),
(40, 'intento2', 1, 3, '1000.00', '2023-05-19 15:17:15', 'A', '2023-05-15 19:04:17', 3),
(41, 'venta de un cel', 2, 3, '1500000.00', '2023-05-16 13:21:00', 'A', '2023-05-16 18:21:27', 28),
(42, 'kk', 1, 3, '10000.00', '2023-05-16 14:10:00', 'A', '2023-05-16 19:10:02', 28),
(43, 'fghdzhdf', 1, 3, '10010.00', '2023-05-17 15:22:00', 'A', '2023-05-17 20:22:56', 28),
(44, 'coufyj ', 1, 3, '100000.00', '2023-05-17 15:23:00', 'A', '2023-05-17 20:23:05', 28),
(45, 'k+\r\njoctuktf', 1, 3, '40000.00', '2023-05-17 15:23:00', 'A', '2023-05-17 20:23:12', 28),
(46, 'zzzzzhd n', 1, 3, '1410480.00', '2023-05-17 15:23:00', 'A', '2023-05-17 20:23:22', 28),
(47, 'hhsjydfsrtyetye', 1, 3, '444111.00', '2023-05-17 15:23:00', 'A', '2023-05-17 20:23:32', 28),
(48, 'ssaffffffffffffffffffffffffffffffffffffff', 1, 3, '999999999.99', '2023-05-17 15:23:00', 'A', '2023-05-17 20:23:50', 28),
(49, 'ererertetrrrrr', 1, 4, '40000.00', '2023-05-17 15:23:00', 'A', '2023-05-17 20:24:02', 28),
(50, 'hddddddddddddddddddddddddd', 1, 3, '999999999.99', '2023-05-17 15:24:00', 'A', '2023-05-17 20:24:16', 28),
(51, 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', 1, 3, '999999999.99', '2023-05-17 15:24:00', 'A', '2023-05-17 20:24:25', 28),
(54, 'uafvas dS D  VYADC fdFFffyyVV v a FVB vf  aaff qv gv   V AFV V vf avd f ad  dv dvf d fvd vf vdf fvd vvf vd v VDF V DFV F VD F  VF DV FVD VF V V  F VD FVD VVF DV FVD F D FD F DV FVD F DVF D FD VF DV FV', 1, 3, '10000.00', '2023-05-17 15:31:00', 'A', '2023-05-17 20:31:53', 28),
(55, 'Texto es un conjunto de enunciados que permite dar un mensaje coherente y ordenado, ya sea de manera escrita o a través de la palabra. Se trata de una estructura compuesta por signos y una escritura d', 2, 3, '1000.00', '2023-05-18 12:48:00', 'A', '2023-05-18 17:48:39', 28),
(56, 'comprar zapatos', 1, 4, '100000.00', '2023-05-18 13:56:36', 'A', '2023-05-18 18:28:32', 31),
(57, 'comprar ropa', 2, 4, '900000.00', '2023-05-18 13:55:00', 'A', '2023-05-18 18:55:22', 31),
(58, 'lo que sea', 1, 3, '1000.00', '2023-05-19 15:16:44', 'A', '2023-05-18 20:43:34', 67),
(59, 'hola', 2, 4, '500000.00', '2023-05-18 15:56:00', 'A', '2023-05-18 20:56:28', 65),
(60, 'pago de nomina', 2, 4, '1000000.00', '2023-05-19 12:29:00', 'A', '2023-05-19 17:29:56', 70),
(61, '34523453', 1, 4, '565436.00', '2023-05-19 13:06:00', 'A', '2023-05-19 18:06:07', 3),
(62, '21312', 2, 4, '3434234.00', '2023-05-19 13:39:00', 'A', '2023-05-19 18:39:56', 3),
(63, '12321', 2, 4, '12312.00', '2023-05-19 14:11:00', 'A', '2023-05-19 19:11:25', 3);

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
(4, 'Gerente', 'se encarga de gestionar los avances', 'A', 2, '2023-05-18 13:34:35'),
(8, 'prueba', 'prueba', 'E', 3, '2023-05-18 14:12:33'),
(9, 'prueba x2', 'haciendo lo q se conoce como la probación ', 'E', 28, '2023-05-18 14:17:56'),
(10, 'eqwe', 'dwedwe', 'E', 70, '2023-05-19 12:31:13');

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
(1, 'gfhgh', '2023-05-17', '52.00', '4', '13.00', 'A', '2023-05-19 17:59:07', 31),
(2, 'ghh', '2023-05-10', '50000.00', '41', '1219.51', 'A', '2023-05-19 18:00:57', 31),
(4, 'asdsadasdasdasd', '2023-05-19', '300000.00', '10001', '30.00', 'A', '2023-05-19 18:43:37', 3);

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
(21, '3238906836', 13, '2023-05-19 12:51:18', 'A', 3, 3),
(22, '12344123123', 13, '2023-05-19 18:03:01', 'A', 75, 75),
(23, '23423423', 13, '2023-05-19 18:08:18', 'A', 76, 76),
(24, '3238906836', 13, '2023-05-19 19:59:33', 'A', 77, 77);

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
(2, 'Safe', 'santiago', 'guerrero', 'hola', 'A', '2023-05-18 13:53:25', '', 1, 1, 9, '32323'),
(3, 'JorgeDuran12', 'Jorge Luis', 'Duran Olivares', '$2y$10$t2JV.BaqDOhhDBQZCywzHOGRx51L0nV4skNtAMXKIVWBGoHBwuh8u', 'A', '2023-05-16 12:26:44', 'x9pyYTQt9kji4RAPdEyrsNuNyZQUCG', 1, 3, 9, '1007219901'),
(28, 'Danipc', 'Daniel', 'Banquet', '$2y$10$Y.pApjdV4iGUqioYGymDPeWScJ9xWX1mE5OQhx2YRrV1mq6sqqdJ6', 'A', '2023-05-18 13:36:57', 'T38e7nEypqPVWubUlDoNnWppxlR5LY', 1, 28, 9, '11061212840'),
(31, 'Majo', 'Maria jose', 'Ramirez', '$2y$10$lJCs.OVlFG6Cno/nKGRmU.0585QD08xr.um.bIcgGEeiL5CNb8i0S', 'A', '2023-05-18 13:35:40', '', 3, 31, 9, '1043122695'),
(61, 'santo', 'santiago', 'guerrero', '$2y$10$NbLgWFT5vU0jURLiIhPbKO9VzVN67rStMlwBDCGXaYlO93Dw1qTgq', 'A', '2023-05-18 14:19:59', NULL, 1, 61, 10, '1001893022'),
(65, 'donpepe', 'prueba', 'prueeba', '$2y$10$3mu4HndER0HvMvl6Ll1FvuDf548sREge3vx/sxtwU0KTBRCPnt5oa', 'A', '2023-05-18 14:29:42', NULL, 1, 65, 9, '1000000000'),
(67, 'ever', 'ever', 'padilla', '$2y$10$raHQbzahcMczjHb/yf219OrJ.AMkMlr5pQSFE6SGjWpXfO9R8l.YO', 'A', '2023-05-18 14:56:46', NULL, 3, 67, 9, '2313213211321'),
(70, 'algo', 'algo', 'algo', '$2y$10$ZO.QuFkw1J7uiW7H5yrICOmoZQIOAjPeAPilvX5sn5UexLXpQBTHi', 'A', '2023-05-19 12:16:39', NULL, 3, 70, 9, '12323463'),
(73, 'Karl', 'Carlos', 'De las salas ', '$2y$10$oELknYrcA3.YzYy/zMLCteRwdY4a7uCMoYs6VU/C/PP20dPiAqBDe', 'A', '2023-05-19 14:05:44', 'nmegt', 3, 73, 9, '123654789'),
(74, 'hhhhhh', 'ff', 'fff', '$2y$10$M273OYRJ5RpACY6N80KXA.J4PvVmCw/WEfwUwxZ640eSfuMu1K9.W', 'A', '2023-05-19 12:46:55', NULL, 3, 74, 9, '44848484'),
(75, '123123', 'hola', 'hola', '$2y$10$cGjwg.NLd2P5nz8h.cqzCeMjKAXO.YfYjiwmz37RHKFExAzbZ1Gl.', 'A', '2023-05-19 13:03:01', NULL, 3, 75, 9, '2323123'),
(76, 'wilfri', 'rfvrv', 'rvf', '$2y$10$2yBN5XAjzHEZJs/u3GtfqearMfc7kRtj/36vtRIRIRy.OqL3j4BDO', 'A', '2023-05-19 13:08:18', NULL, 3, 76, 9, '312312312'),
(77, 'devlassalas', 'devlassalas', 'ospino', '$2y$10$O6ztChQa5AkW1oSJ8YvUz.kNnkjp45Y/SuxQtQIHotOHC2bSsHPUW', 'A', '2023-05-19 14:59:33', NULL, 3, 77, 9, '1048264406');

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
-- Estructura para la vista de `vw_parametros_det` exportada como una tabla
--
DROP TABLE IF EXISTS `vw_parametros_det`;
CREATE TABLE`vw_parametros_det`(
    `id_parametro_det` smallint(2) NOT NULL DEFAULT '0',
    `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
    `resumen` char(2) COLLATE utf8mb4_general_ci NOT NULL,
    `estado` char(1) COLLATE utf8mb4_general_ci DEFAULT 'A',
    `fecha_crea` timestamp NOT NULL DEFAULT 'current_timestamp()',
    `id_parametro_enc` smallint(2) NOT NULL,
    `id_usuario_crea` smallint(2) NOT NULL
);

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
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `disponibles`
--
ALTER TABLE `disponibles`
  MODIFY `id_disponible` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `id_email` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  MODIFY `id_fondo-emergencia` smallint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
  MODIFY `id_rol` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  MODIFY `id_saquito` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

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
