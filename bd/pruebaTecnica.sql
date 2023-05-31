-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 31-05-2023 a las 12:17:39
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
-- Base de datos: `pruebaTecnica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id` int(11) NOT NULL,
  `codigoSegmento` int(11) NOT NULL,
  `nombreSegmento` varchar(200) NOT NULL,
  `codigoFamilia` int(11) NOT NULL,
  `NombreFamilia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id`, `codigoSegmento`, `nombreSegmento`, `codigoFamilia`, `NombreFamilia`) VALUES
(1, 10, 'Material Vivo Vegetal y Animal, Accesorios y Suministros', 100, 'Animales vivos'),
(2, 10, 'Material Vivo Vegetal y Animal, Accesorios y Suministros', 1011, 'Productos para animales domésticos'),
(3, 10, 'Material Vivo Vegetal y Animal, Accesorios y Suministros', 1012, 'Comida de animales'),
(4, 10, 'Material Vivo Vegetal y Animal, Accesorios y Suministros ', 1013, 'Recipientes y hábitat para animales'),
(5, 10, 'Material Vivo Vegetal y Animal, Accesorios y Suministros  ', 1014, 'Productos de talabartería y arreo'),
(6, 10, 'Material Vivo Vegetal y Animal, Accesorios y Suministros ', 1015, 'Semillas, bulbos, plántulas y esquejes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivosDocumentacion`
--

CREATE TABLE `archivosDocumentacion` (
  `id` int(11) NOT NULL,
  `documentacion_id` int(11) NOT NULL,
  `filepath` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `archivosDocumentacion`
--

INSERT INTO `archivosDocumentacion` (`id`, `documentacion_id`, `filepath`) VALUES
(1, 31, '../public/uploads/1685470620_Mapa_Metro_de_Medellín.png'),
(2, 32, '../public/uploads/1685470680_Mapa_Metro_de_Medellín.png'),
(3, 32, '../public/uploads/1685470680_Recibo - Vista de Impresión.pdf'),
(4, 33, '../public/uploads/1685471880_istockphoto-122204403-612x612.jpg'),
(5, 33, '../public/uploads/1685471880_istockphoto-976522346-612x612.jpg'),
(6, 34, '../public/uploads/1685473140_istockphoto-122204403-612x612.jpg'),
(7, 34, '../public/uploads/1685473140_istockphoto-810556494-170667a.jpg'),
(8, 35, '../public/uploads/1685473680_istockphoto-1183226281-170667a.jpg'),
(9, 36, '../public/uploads/1685473680_istockphoto-1183226281-170667a.jpg'),
(10, 37, '../public/uploads/1685474100_istockphoto-1183226281-170667a.jpg'),
(11, 38, '../public/uploads/1685474160_istockphoto-1183226281-170667a.jpg'),
(12, 39, '../public/uploads/1685474280_Mapa_Metro_de_Medellín.png'),
(13, 40, '../public/uploads/1685474280_Mapa_Metro_de_Medellín.png'),
(14, 41, '../public/uploads/1685474340_Mapa_Metro_de_Medellín.png'),
(15, 42, '../public/uploads/1685474460_istockphoto-1183226281-170667a.jpg'),
(16, 43, '../public/uploads/1685474640_istockphoto-1183226281-170667a.jpg'),
(17, 43, '../public/uploads/1685474640_Mapa_Metro_de_Medellín.png'),
(18, 44, '../public/uploads/1685474640_Mapa_Metro_de_Medellín.png'),
(19, 45, '../public/uploads/1685474700_Mapa_Metro_de_Medellín.png'),
(20, 46, '../public/uploads/1685490360_istockphoto-1183226281-170667a.jpg'),
(21, 47, '../public/uploads/1685492100_istockphoto-1183226281-170667a.jpg'),
(22, 47, '../public/uploads/1685492100_Mapa_Metro_de_Medellín.png'),
(23, 48, '../public/uploads/1685492280_istockphoto-122204403-612x612.jpg'),
(24, 49, '../public/uploads/1685492280_istockphoto-1183226281-170667a.jpg'),
(25, 49, '../public/uploads/1685492280_istockphoto-976522346-612x612.jpg'),
(26, 50, '../public/uploads/1685492760_istockphoto-1183226281-170667a.jpg'),
(27, 50, '../public/uploads/1685492760_istockphoto-810556494-170667a.jpg'),
(28, 51, '../public/uploads/1685505300_proceso (5).xls'),
(29, 52, '../public/uploads/1685505300_proceso (1).xls'),
(30, 53, '../public/uploads/1685506920_Mapa_Metro_de_Medellín.png'),
(31, 54, '../public/uploads/1685508060_proceso (1).xls'),
(32, 58, '../public/uploads/1685523600_download.xls'),
(33, 59, '../public/uploads/1685523660_download.xls'),
(34, 60, '../public/uploads/1685523720_proceso (4).xls'),
(35, 61, '../public/uploads/1685523720_proceso (4).xls'),
(36, 61, '../public/uploads/1685523720_proceso (1).xls'),
(37, 62, '../public/uploads/1685523840_proceso (1).xls'),
(38, 63, '../public/uploads/1685526660_proceso (3).xls'),
(39, 63, '../public/uploads/1685526660_proceso (1).xls'),
(40, 64, '../public/uploads/1685527080_proceso (4).xls'),
(41, 64, '../public/uploads/1685527080_proceso (3).xls'),
(42, 64, '../public/uploads/1685527080_proceso (2).xls'),
(43, 64, '../public/uploads/1685527080_proceso (1).xls'),
(44, 65, '../public/uploads/1685527140_proceso (2).xls'),
(45, 65, '../public/uploads/1685527140_proceso.xls'),
(46, 66, '../public/uploads/1685527200_proceso (1).xls'),
(47, 67, '../public/uploads/1685527320_proceso.xls'),
(48, 68, '../public/uploads/1685527380_proceso (3).xls'),
(49, 68, '../public/uploads/1685527380_proceso (1).xls'),
(50, 69, '../public/uploads/1685527440_proceso (2).xls'),
(51, 69, '../public/uploads/1685527440_proceso (1).xls'),
(52, 69, '../public/uploads/1685527440_proceso.xls'),
(53, 70, '../public/uploads/1685527500_download.csv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentacionOferta`
--

CREATE TABLE `documentacionOferta` (
  `id` int(11) NOT NULL,
  `proceso_id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `documentacionOferta`
--

INSERT INTO `documentacionOferta` (`id`, `proceso_id`, `titulo`, `descripcion`) VALUES
(51, 1, 'prueba', ''),
(52, 1, 'Fuga Iure ratione t', 'Et magnam qui error '),
(53, 16, 'Iste tempor proident', 'Repellendus Minim a'),
(54, 16, 'Harum ipsa cum sit ', 'Reiciendis laborum '),
(58, 16, 'Quia laborum Dolore', ''),
(59, 16, 'Architecto quo omnis', 'Porro eos dolorum ac'),
(60, 16, 'Modi laborum veniam', 'Iure ut duis provide'),
(61, 16, 'Sunt voluptatibus oc', ''),
(62, 16, 'wwww', ''),
(63, 17, 'Sequi laborum quae c', 'Consequatur Optio '),
(65, 19, 'Alias corporis fugia', 'Occaecat mollitia eu'),
(66, 17, 'Et qui voluptatum vo', 'Dolorum recusandae '),
(69, 20, 'Voluptas omnis quo m', 'Accusantium tempora '),
(70, 14, 'Est fugiat autem re', 'Provident culpa si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesoEvento`
--

CREATE TABLE `procesoEvento` (
  `id` int(11) NOT NULL,
  `actividad_id` int(11) NOT NULL,
  `objeto` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `moneda` char(4) NOT NULL,
  `presupuesto` float NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_cierre` datetime NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `procesoEvento`
--

INSERT INTO `procesoEvento` (`id`, `actividad_id`, `objeto`, `descripcion`, `moneda`, `presupuesto`, `fecha_inicio`, `fecha_cierre`, `estado`) VALUES
(14, 3, 'Est enim maiores lab', 'Quia hic harum volup', 'EUR', 7, '2010-10-24 12:01:00', '2007-12-05 08:04:00', 3),
(15, 2, 'Autem minim dolor ut', 'Veritatis numquam in', 'USD', 900000, '1975-02-23 05:15:00', '1998-04-18 21:31:00', 3),
(16, 3, 'Officia aliquip labo', 'Voluptate elit exce', 'COP', 2100000, '1977-06-12 17:24:00', '2015-05-18 16:06:00', 3),
(17, 5, 'Ut iste qui in excep', 'Commodi ut non sed o', 'USD', 74099, '1993-09-15 14:52:00', '1974-02-07 05:53:00', 3),
(19, 4, 'Explicabo Pariatur', 'Fugiat eius amet f', 'USD', 95, '1983-04-20 11:15:00', '1991-05-04 20:05:00', 3),
(20, 2, 'Minima dicta esse ob', 'Ut dolor nemo quo ar', 'COP', 70000, '1986-04-08 12:35:00', '2003-06-02 06:00:00', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `archivosDocumentacion`
--
ALTER TABLE `archivosDocumentacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documentacion_id` (`documentacion_id`);

--
-- Indices de la tabla `documentacionOferta`
--
ALTER TABLE `documentacionOferta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proceso_id` (`proceso_id`);

--
-- Indices de la tabla `procesoEvento`
--
ALTER TABLE `procesoEvento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actividad_id` (`actividad_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `archivosDocumentacion`
--
ALTER TABLE `archivosDocumentacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `documentacionOferta`
--
ALTER TABLE `documentacionOferta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `procesoEvento`
--
ALTER TABLE `procesoEvento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
