-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2020 a las 01:17:33
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `actividad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orientaciones`
--

CREATE TABLE `orientaciones` (
  `idOrientacion` tinyint(1) NOT NULL,
  `orientacion_sexual` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orientaciones`
--

INSERT INTO `orientaciones` (`idOrientacion`, `orientacion_sexual`) VALUES
(1, 'Heterosexual'),
(2, 'Homosexual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `nombre` varchar(120) CHARACTER SET latin1 NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `orientacion_sexual` tinyint(1) NOT NULL,
  `email` varchar(120) CHARACTER SET latin1 NOT NULL,
  `telefono` int(11) NOT NULL,
  `contrasena` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `nombre`, `fecha_nacimiento`, `orientacion_sexual`, `email`, `telefono`, `contrasena`) VALUES
(1, 'Sergio Laime', '1986-03-31', 1, 'marser1600845@gmail.com', 68047084, 'skynet6102897'),
(2, 'Gimena Paredes', '1990-10-24', 1, 'gimepare125@hotmail.com', 7859641, '123456789');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orientaciones`
--
ALTER TABLE `orientaciones`
  ADD PRIMARY KEY (`idOrientacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`),
  ADD UNIQUE KEY `idx_usuarios_email` (`email`),
  ADD UNIQUE KEY `idx_usuarios_telefono` (`telefono`),
  ADD KEY `fk_orientacion_usuario` (`orientacion_sexual`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orientaciones`
--
ALTER TABLE `orientaciones`
  MODIFY `idOrientacion` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_orientacion_usuario` FOREIGN KEY (`orientacion_sexual`) REFERENCES `orientaciones` (`idOrientacion`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
