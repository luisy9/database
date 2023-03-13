-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2023 a las 20:47:21
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
-- Base de datos: `luisdeharo4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Carne'),
(2, 'Postres'),
(3, 'Merluza/Verduras'),
(4, 'Patos'),
(5, 'platos_combinados'),
(6, 'platos mas solicitados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(3) NOT NULL,
  `id_pedido` int(3) NOT NULL,
  `tipo_pago` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(3) NOT NULL,
  `nombre_pedido` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `precio_pedido` decimal(15,0) NOT NULL,
  `cantidad_pedido` int(9) NOT NULL,
  `fecha_pedido` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_usuario` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `nombre_pedido`, `precio_pedido`, `cantidad_pedido`, `fecha_pedido`, `id_usuario`) VALUES
(64, 'pato al horno', '14', 1, NULL, 2),
(65, 'pato al horno', '14', 1, NULL, 2),
(66, 'pato al horno', '14', 1, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos`
--

CREATE TABLE `pedidos_productos` (
  `id_pedido` int(3) NOT NULL,
  `id_producto` int(3) NOT NULL,
  `cantidad_producto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio_pedido` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(9) NOT NULL,
  `nombre_producto` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `precio_producto` int(9) NOT NULL,
  `imagen` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `precio_producto`, `imagen`, `id_categoria`) VALUES
(4, 'pato al horno', 14, '../assets/images/pato.jpg', 4),
(7, 'verduras', 10, '../assets/images/verduras.jpg', 3),
(8, 'merluza', 10, '../assets/images/merluza.jpg', 3),
(9, 'crema catalana', 6, '../assets/images/flan_de_la_casa.jpg', 2),
(12, 'Pato con patatas', 9, '../assets/images/patoConPatatas.jpg', 4),
(13, 'Tortilla de Patatas', 7, '../assets/images/tortilla.jpg', 6),
(14, 'Merluza', 9, '../assets/images/merluza.jpg', 6),
(15, 'dssss', 11, '', 1),
(17, 'pechugas', 10, '../assets/images/pechugas.jpg', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reseñas`
--

CREATE TABLE `reseñas` (
  `id_reseñas` int(9) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `apellido_user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contra` varchar(255) NOT NULL,
  `resena` varchar(255) NOT NULL,
  `id_pedido` int(9) NOT NULL,
  `estrellas` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reseñas`
--

INSERT INTO `reseñas` (`id_reseñas`, `nombre_usuario`, `apellido_user`, `email`, `contra`, `resena`, `id_pedido`, `estrellas`) VALUES
(163, 'Luis', 'de Haro', 'luisdeharo4@gmail.com', '1234', 'muy buen plato', 65, '4'),
(164, 'Luis', 'de Haro', 'luisdeharo4@gmail.com', '1234', 'muy buen plato', 65, '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(255) NOT NULL,
  `nombre_user` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_user` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `correo_electronico` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `contraseña_user` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rol` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_user`, `apellido_user`, `correo_electronico`, `contraseña_user`, `rol`) VALUES
(1, 'Admin', '', 'admin@gmail.com', '1234', 1),
(2, 'Pablo', '', 'pablo@gmail.com', '1234', 0),
(3, 'Luis', 'de Haro', 'luisdeharo@gmail.com', '12345', 0),
(4, 'dsa', 'dsa', 'das', 'das', 0),
(5, '', '', '', '', 0),
(6, '', '', '', '', 0),
(7, 'Elko', 'ñete lindo', 'elkoñetelindo@gmail.com', '123456777', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD KEY `fk_pedido` (`id_pedido`),
  ADD KEY `fk_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_categoria` (`id_categoria`);

--
-- Indices de la tabla `reseñas`
--
ALTER TABLE `reseñas`
  ADD PRIMARY KEY (`id_reseñas`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `reseñas`
--
ALTER TABLE `reseñas`
  MODIFY `id_reseñas` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `reseñas`
--
ALTER TABLE `reseñas`
  ADD CONSTRAINT `id_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
