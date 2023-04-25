-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-04-2023 a las 17:28:00
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

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
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id_actividad` smallint(2) NOT NULL,
  `descripcion` text NOT NULL,
  `hora_recordatorio` time NOT NULL,
  `fecha_actividad` date NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(2, 'santiagoguerreroh034', 13, 'A', '2023-04-21 14:18:23', 2, 2),
(3, 'rafaelhenao780@gmail.com', 14, 'A', '2023-04-21 14:32:29', 2, 2);

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
  `descripcion` text NOT NULL,
  `tipo_movimiento` smallint(2) NOT NULL,
  `clase_movimiento` smallint(2) NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `fecha_movimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_usuario` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimiento`, `descripcion`, `tipo_movimiento`, `clase_movimiento`, `valor`, `fecha_movimiento`, `estado`, `fecha_crea`, `id_usuario`) VALUES
(1, 'pagar cuenta onlyfans', 1, 4, '98.00', '2023-03-01 13:32:36', 'A', '2023-03-01 13:32:36', 1);

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
(1, 'Bancario', 'Ba', 'A', '2023-04-21 13:22:59', 1, 1),
(2, 'No bancario', 'Nb', 'A', '2023-04-21 13:23:04', 1, 1),
(3, 'Ingreso', 'In', 'A', '2023-04-21 13:23:09', 2, 1),
(4, 'Egreso', 'Eg', 'A', '2023-04-21 13:23:12', 2, 1),
(9, 'cedula de ciudadania', 'Cc', 'A', '2023-04-21 13:23:16', 3, 1),
(10, 'tarjeta de identidad', 'Td', 'A', '2023-04-21 13:23:24', 3, 1),
(11, 'pasaporte', 'Pt', 'A', '2023-04-21 13:27:13', 3, 1),
(12, 'cedula de estrangeria', 'Ce', 'A', '2023-04-21 13:26:32', 3, 1),
(13, 'principal', 'pr', 'A', '2023-04-21 13:39:50', 6, 1),
(14, 'segundario', 'sg', 'A', '2023-04-21 13:39:50', 6, 1);

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

--
-- Volcado de datos para la tabla `proyeccion`
--

INSERT INTO `proyeccion` (`id_proyeccion`, `fecha_cuota`, `valor_cuota`, `estado`, `fecha_crea`, `id_saquito`, `usuario_crea`) VALUES
(1, '2023-04-07', '5000.00', 'A', '2023-04-21 15:09:48', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` smallint(2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` char(1) DEFAULT 'A',
  `id_usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`, `estado`, `id_usuario_crea`) VALUES
(1, 'Super Administrador', 'Acceso completo en el sistema.\r\npuede gestionar usuarios, roles, grupos y otros superadministradores u administradores.\r\nDarle mantenimiento a la pagina, etc.', 'A', 1),
(2, 'Administrador', 'Permiso para gestionar a todos los usuarios finales dentro del sistema\r\n', 'A', 1),
(3, 'Usuario', 'Acceso a todas las herramientas que ofrece el sistema ', 'A', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saquitos`
--

CREATE TABLE `saquitos` (
  `id_saquito` smallint(2) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_inicial` date NOT NULL,
  `valor` decimal(11,2) NOT NULL,
  `numero_cuotas` tinyint(1) NOT NULL,
  `cuota` decimal(11,2) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `saquitos`
--

INSERT INTO `saquitos` (`id_saquito`, `descripcion`, `fecha_inicial`, `valor`, `numero_cuotas`, `cuota`, `estado`, `fecha_crea`, `usuario_crea`) VALUES
(1, 'asdfghjkl', '2023-04-21', '999999999.99', 8, '999999999.99', 'A', '2023-04-21 15:00:25', 2),
(2, '1234567\r\n', '2023-04-06', '90000.00', 21, '1256565.00', 'A', '2023-04-21 15:00:33', 2);

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
(1, '31445775332', 13, '2023-04-21 14:52:01', 'A', 2, 2),
(3, '3185906323', 14, '2023-04-21 14:52:08', 'A', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` smallint(2) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `contrasena` varchar(30) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `fecha_crea` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_rol` smallint(2) NOT NULL,
  `usuario_crea` smallint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `nombre`, `apellido`, `contrasena`, `estado`, `fecha_crea`, `id_rol`, `usuario_crea`) VALUES
(1, 'devLas', 'carlos', 'de las salas', '1048264406', 'A', '2023-02-28 16:44:32', 1, 1),
(2, 'santo', 'santiago', 'guerrero', '987654321', 'A', '2023-04-21 14:16:04', 1, 1);

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
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id_actividad`),
  ADD KEY `actividad_usuario` (`id_usuario`);

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
  ADD KEY `movimiento_usuario` (`id_usuario`),
  ADD KEY `movimiento-clase_parametro` (`clase_movimiento`),
  ADD KEY `movimieno-tipo_parametro` (`tipo_movimiento`);

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
  ADD KEY `roles_usuario` (`id_usuario_crea`);

--
-- Indices de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  ADD PRIMARY KEY (`id_saquito`),
  ADD KEY `usuario_c` (`usuario_crea`);

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
  ADD KEY `usuario_usuario-crea` (`usuario_crea`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id_accion` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id_actividad` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `disponibles`
--
ALTER TABLE `disponibles`
  MODIFY `id_disponible` smallint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `emails`
--
ALTER TABLE `emails`
  MODIFY `id_email` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `fondo_emergencia`
--
ALTER TABLE `fondo_emergencia`
  MODIFY `id_fondo-emergencia` smallint(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id_movimiento` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `parametros_det`
--
ALTER TABLE `parametros_det`
  MODIFY `id_parametro_det` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id_rol` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `saquitos`
--
ALTER TABLE `saquitos`
  MODIFY `id_saquito` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `id_telefono` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD CONSTRAINT `accion_usuario` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividad_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

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
  ADD CONSTRAINT `movimieno-tipo_parametro` FOREIGN KEY (`tipo_movimiento`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `movimiento-clase_parametro` FOREIGN KEY (`clase_movimiento`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `movimiento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

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
  ADD CONSTRAINT `usuario_crear` FOREIGN KEY (`id_usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `saquitos`
--
ALTER TABLE `saquitos`
  ADD CONSTRAINT `usuario_c` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `prioridad_telefono` FOREIGN KEY (`prioridad`) REFERENCES `parametros_det` (`id_parametro_det`),
  ADD CONSTRAINT `usario_crea` FOREIGN KEY (`usuario_crea`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usario_telefono` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
