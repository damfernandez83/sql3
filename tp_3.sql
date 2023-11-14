-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-11-2023 a las 01:08:28
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `codo_a_codo`
--


--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `apellidos` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellidos`) VALUES
('20000000', 'Juan Carlos', 'Palorna'),
('20000001', 'Miguel', 'Asargut'),
('20000002', 'Carlos', 'Manuk'),
('20000003', 'Ricardo', 'Petruza'),
('20000004', 'Michael', 'Landon'),
('20000005', 'Pablo', 'Alarcón'),
('20000006', 'Jean Claude', 'Rusiñol'),
('20000007', 'Homero', 'Adams'),
('20000008', 'Ignacio', 'Copanni'),
('20000009', 'Guillermo', 'Del Toro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `concepto` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `clientes_dni` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `clientes_dni`) VALUES
(1, 'zapatillas', '20000000'),
(2, 'vestidos', '20000001'),
(3, 'sandalias', '20000002'),
(4, 'pantalones', '20000003'),
(5, 'polleras', '20000004'),
(6, 'medias', '20000005'),
(7, 'calzones', '20000006'),
(8, 'bikini', '20000007'),
(9, 'bermudas', '20000008'),
(10, 'gorro', '20000009');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `numero` bigint(20) UNSIGNED NOT NULL,
  `compras_id` bigint(20) UNSIGNED NOT NULL,
  `producto` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `importe` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 1, 'Nike Air Max', 50000),
(2, 2, 'Floreado', 10000),
(3, 3, 'Sin taco cuero', 30000),
(4, 4, 'Jean Rectos', 15000),
(5, 5, 'Lisa con tablas', 5000),
(6, 6, '3/4 a rombos', 1000),
(7, 7, 'Boxer liso', 5000),
(8, 8, 'Estampado fluorescen', 10000),
(9, 9, 'Cargo con bolsillos', 8000),
(10, 10, 'Lana con polar', 2000);

--
-- Índices para tablas volcadas
--

-
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  MODIFY `numero` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`);

--
-- Filtros para la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD CONSTRAINT `lineascompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
