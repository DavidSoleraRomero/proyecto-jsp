-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2024 a las 19:07:46
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `CodEmp` int(11) NOT NULL,
  `NomEmp` varchar(45) NOT NULL,
  `ApeEmp` varchar(90) NOT NULL,
  `Cargo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`CodEmp`, `NomEmp`, `ApeEmp`, `Cargo`) VALUES
(8, 'David', 'Solera Romero', 'Desarrollador'),
(11, 'Juan Antonio', 'García', 'Project Manager'),
(13, 'Adrián', 'Solera Romero', 'Desarrollador'),
(15, 'Sebastián', 'Solera Suárez', 'Camionero'),
(16, 'María Remedios', 'Romero Trujillo', 'Limpiadora'),
(17, 'José Luis', 'Hidalgo Olmedo', 'Técnico informático'),
(18, 'Alba', 'García Postigo', 'Bióloga'),
(19, 'David', 'Lanzas Aguilar', 'Desarrollador'),
(20, 'Félix', 'Martín Aguilar', 'Desarrollador'),
(21, 'Adrián', 'Solera Romero', 'Contable');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `CodUsu` int(11) NOT NULL,
  `NomUsu` varchar(45) NOT NULL,
  `ConUsu` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`CodUsu`, `NomUsu`, `ConUsu`) VALUES
(6, 'davidsolera', '123456'),
(7, 'adriansr', '123456'),
(11, 'juanarrow', 'juan'),
(23, 'davidsolerakl', 'kllk'),
(25, 'juanarrow2', 'kljklj'),
(31, 'ignacio', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`CodEmp`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CodUsu`),
  ADD UNIQUE KEY `uq_username` (`NomUsu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `CodEmp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `CodUsu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
