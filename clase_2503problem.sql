-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 13:44:32
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clase 2503problem`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(30) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `clientecol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nom_cliente`, `direccion`, `telefono`, `clientecol`) VALUES
(2856435, 'mario', 'mz f cs 5', '2726789', ''),
(1006121442, 'juana', 'mz 4 cs 2', '2724530', ''),
(1006121445, 'maria', 'mz k cs 45', '2784567', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `cod_marca` varchar(30) NOT NULL,
  `nom_marca` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`cod_marca`, `nom_marca`, `color`) VALUES
('34D43', 'coca cola', 'rojo y negro'),
('N45ST', 'nestle', 'blanco'),
('pa3iu', 'bimbo', 'azul');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `cod_producto` int(11) NOT NULL,
  `nom_producto` varchar(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  `marca_cod_marca` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`cod_producto`, `nom_producto`, `descripcion`, `categoria`, `precio`, `stock`, `marca_cod_marca`) VALUES
(934, 'bimboletes', 'ponque bimbo', 'ponque', 3500, 3, 'pa3iu'),
(5678, 'coca cola', 'bebida gaseosa', 'bebidas', 6000, 6, '34D43'),
(9878, 'klim', 'leche en polvo', 'lacteos', 30500, 4, 'N45ST');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `cliente_id_cliente` int(11) NOT NULL,
  `producto_cod_producto` int(11) NOT NULL,
  `numero_venta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cliente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`cliente_id_cliente`, `producto_cod_producto`, `numero_venta`, `fecha`, `cliente`) VALUES
(2856435, 5678, 5678, '2022-03-25', 'mario'),
(1006121442, 934, 345, '2022-03-25', 'juana'),
(1006121445, 9878, 98, '2022-03-25', 'maria');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`cod_marca`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`cod_producto`,`marca_cod_marca`),
  ADD KEY `fk_producto_marca1_idx` (`marca_cod_marca`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`cliente_id_cliente`,`producto_cod_producto`,`numero_venta`),
  ADD KEY `fk_cliente_has_producto_producto1_idx` (`producto_cod_producto`),
  ADD KEY `fk_cliente_has_producto_cliente_idx` (`cliente_id_cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_marca1` FOREIGN KEY (`marca_cod_marca`) REFERENCES `marca` (`cod_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_cliente_has_producto_cliente` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cliente_has_producto_producto1` FOREIGN KEY (`producto_cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
