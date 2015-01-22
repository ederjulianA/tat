-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-01-2015 a las 19:08:34
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tat`
--
CREATE DATABASE IF NOT EXISTS `tat` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `tat`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrios`
--

CREATE TABLE IF NOT EXISTS `barrios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `bar_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Lunes` tinyint(1) NOT NULL DEFAULT '0',
  `Martes` tinyint(1) NOT NULL DEFAULT '0',
  `Miercoles` tinyint(1) NOT NULL DEFAULT '0',
  `Jueves` tinyint(1) NOT NULL DEFAULT '0',
  `Viernes` tinyint(1) NOT NULL DEFAULT '0',
  `Sabado` tinyint(1) NOT NULL DEFAULT '0',
  `Domingo` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `barrios`
--

INSERT INTO `barrios` (`id`, `cod`, `bar_nom`, `Lunes`, `Martes`, `Miercoles`, `Jueves`, `Viernes`, `Sabado`, `Domingo`, `created_at`, `updated_at`) VALUES
(1, 'cod1', 'San Francisco', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00'),
(2, 'cod2', 'Cabecera', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00'),
(3, 'cod3', 'El poblado', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00'),
(4, 'cod4', 'Mutis', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `cat_nom`, `img`, `created_at`, `updated_at`) VALUES
(1, 'Gaseosas', 'img/productos/img1.jpg', '0000-00-00', '0000-00-00'),
(2, 'Dulces', 'img/productos/img2.jpg', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `totalCart` int(11) NOT NULL,
  `total_compra` int(11) NOT NULL,
  `num_items` int(11) NOT NULL,
  `tipo_compra` int(11) NOT NULL,
  `vlr_envio` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL DEFAULT '1',
  `conf` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `user_id`, `totalCart`, `total_compra`, `num_items`, `tipo_compra`, `vlr_envio`, `estado_id`, `conf`, `created_at`, `updated_at`) VALUES
(6, 8, 48000, 53000, 15, 2, 5000, 1, 0, '2015-01-12', '2015-01-20'),
(7, 8, 750000000, 750000000, 100000, 1, 0, 1, 0, '2015-01-12', '2015-01-20'),
(8, 8, 16000, 21000, 5, 2, 5000, 1, 0, '2015-01-13', '2015-01-20'),
(9, 10, 175000, 175000, 60, 1, 0, 1, 0, '2015-01-15', '2015-01-20'),
(10, 10, 12800, 17800, 4, 2, 5000, 2, 1, '2015-01-15', '2015-01-22'),
(11, 11, 265500, 270500, 35, 2, 5000, 2, 1, '2015-01-16', '2015-01-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_items`
--

CREATE TABLE IF NOT EXISTS `compra_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_id` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `valor_unitario` int(11) NOT NULL,
  `iva` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_total` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `compra_items`
--

INSERT INTO `compra_items` (`id`, `compra_id`, `nombre`, `image`, `valor_unitario`, `iva`, `cantidad`, `valor_total`, `id_producto`, `created_at`, `updated_at`) VALUES
(9, 6, 'big cola2', 'img/productos/p2.jpg', 3200, NULL, 15, 48000, 2, '2015-01-12', '2015-01-12'),
(10, 7, 'dulces', 'img/productos/p3.jpg', 7500, NULL, 100000, 750000000, 5, '2015-01-12', '2015-01-12'),
(11, 8, 'big cola2', 'img/productos/p2.jpg', 3200, NULL, 5, 16000, 2, '2015-01-13', '2015-01-13'),
(12, 9, 'dulces', 'img/productos/p3.jpg', 7500, NULL, 10, 75000, 5, '2015-01-15', '2015-01-15'),
(13, 9, 'big cola 1', 'img/productos/p1.jpg', 2000, NULL, 50, 100000, 1, '2015-01-15', '2015-01-15'),
(14, 10, 'big cola2', 'img/productos/p2.jpg', 3200, NULL, 4, 12800, 2, '2015-01-15', '2015-01-15'),
(15, 11, 'otro producto', 'img/productos/p2.jpg', 7800, NULL, 10, 78000, 3, '2015-01-16', '2015-01-16'),
(16, 11, 'dulces', 'img/productos/p3.jpg', 7500, NULL, 25, 187500, 5, '2015-01-16', '2015-01-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias`
--

CREATE TABLE IF NOT EXISTS `dias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `dias`
--

INSERT INTO `dias` (`id`, `dia_nom`, `created_at`, `updated_at`) VALUES
(1, 'Lunes', '0000-00-00', '0000-00-00'),
(2, 'Martes', '0000-00-00', '0000-00-00'),
(3, 'Miercoles', '0000-00-00', '0000-00-00'),
(4, 'Jueves', '0000-00-00', '0000-00-00'),
(5, 'Viernes', '0000-00-00', '0000-00-00'),
(6, 'Sabado', '0000-00-00', '0000-00-00'),
(7, 'Domingo', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia_barrio`
--

CREATE TABLE IF NOT EXISTS `dia_barrio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_id` int(11) NOT NULL,
  `barrio_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `dia_barrio`
--

INSERT INTO `dia_barrio` (`id`, `dia_id`, `barrio_id`, `created_at`, `updated_at`) VALUES
(5, 5, 3, '0000-00-00', '0000-00-00'),
(6, 6, 3, '0000-00-00', '0000-00-00'),
(7, 4, 4, '0000-00-00', '0000-00-00'),
(8, 6, 4, '0000-00-00', '0000-00-00'),
(10, 3, 4, '2015-01-15', '2015-01-15'),
(16, 6, 1, '2015-01-22', '2015-01-22'),
(17, 7, 1, '2015-01-22', '2015-01-22'),
(18, 1, 2, '2015-01-22', '2015-01-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `nombre_publico` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion_maps` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `active` int(2) NOT NULL DEFAULT '1',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `tema` int(2) NOT NULL DEFAULT '1',
  `color_tema` int(2) DEFAULT '1',
  `descripcion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `logo` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `user_id`, `nombre_publico`, `razon_social`, `direccion`, `direccion_maps`, `active`, `latitude`, `longitude`, `tema`, `color_tema`, `descripcion`, `logo`, `telefono`, `created_at`, `updated_at`) VALUES
(1, 1, 'ede-alvarez', NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 'img/empresas/logos/default.jpg', NULL, '2014-11-28', '2014-11-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_est` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nom_est`, `created_at`, `updated_at`) VALUES
(1, 'Pendiente de Confirmación', '0000-00-00', '0000-00-00'),
(2, 'Confirmado', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `por_iva` int(2) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `pro_nom`, `categoria_id`, `descripcion`, `slug`, `img`, `precio`, `por_iva`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 'big cola 1', 1, 'Big cola 1', 'big-cola-1', 'img/productos/p1.jpg', 2000, NULL, 50, '0000-00-00', '0000-00-00'),
(2, 'big cola2', 1, 'Big cola 2', 'big-cola-2', 'img/productos/p2.jpg', 3200, NULL, 20, '0000-00-00', '0000-00-00'),
(3, 'otro producto', 1, 'este es otro producto', 'otro-producto', 'img/productos/p2.jpg', 7800, NULL, 150, '0000-00-00', '0000-00-00'),
(4, 'otro producto 4', 1, 'este es otro producto', 'otro-producto-4', 'img/productos/p1.jpg', 9850, NULL, 45, '0000-00-00', '0000-00-00'),
(5, 'dulces', 2, 'producto de dulces ', 'dulces', 'img/productos/p3.jpg', 7500, NULL, 80, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `remember_pass` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `active` int(5) NOT NULL DEFAULT '1',
  `condiciones` tinyint(1) NOT NULL,
  `admin` int(5) NOT NULL DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `remember_token`, `remember_pass`, `active`, `condiciones`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'ederalvarez2009@hotmail.com', '$2y$10$SvCL7dmsqRfImRzVbCllJeaxe//a9o1ATmqJbfF6VHW2zXFMCYVE2', 'Y49eBEe7Pa7SlXAXrLaSZOmSXhDdHpRCiM1aWbjVKsAmAK4JMwPiDhixJNva', '', 1, 0, 0, '2014-11-28', '2015-01-03'),
(2, 'eder@tumegalopolis.com', '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', '2SaNzCgQpYmmaJuEj6Jcze7zLY6HXAcvI9XxlGUa2PAl4qHGNhbVQdf6TzJM', '', 1, 1, 0, '2015-01-03', '2015-01-03'),
(3, 'admin@admin.com', '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', 'rYLQ3G4IiU997KhY3oXg1wbucix4d74HKZcLa8mG3SNK0Kg3AhKpwdl51a1u', '', 1, 1, 1, '0000-00-00', '2015-01-03'),
(4, 'usuario@gmail.com', '$2y$10$33Alb7WURkQ7priWift7aOi4gsMYke8J84N6yQgt6XlS2qZb0jFz6', '', '', 1, 1, 0, '2015-01-03', '2015-01-03'),
(8, 'demi@gmail.com', '$2y$10$R.tss0EpKJm6g4EOCSWGKu8P2BEjG8xx81UQ8gggJ70TR17bFTnmy', 'YeCA7rXpqvJqqSe19HMyOHmQn7urBxEEgm8v6m2YHZNo7sl5cekUbWzRjgrc', '', 1, 1, 0, '2015-01-08', '2015-01-19'),
(9, 'demi2@gmail.com', '$2y$10$4OWXwwa6r0GAkmnt9HP4UOqPONI./wuXrigUzfxwJuHJOhb4d7hre', '', '', 1, 1, 0, '2015-01-08', '2015-01-08'),
(10, 'missd@gmail.com', '$2y$10$9XyD3HlnXtaDw9slhcDMxuk6hVl7a7dTIgybQ8hM9CelYg.QDp62e', '', '', 1, 1, 0, '2015-01-15', '2015-01-15'),
(11, 'ivan@ivan.com', '$2y$10$CeUfFcav0ccjx0YXYfKAw.diHr/gvbNhPIDWDEugdSLQfRvv3Mi.W', '', '', 1, 1, 0, '2015-01-16', '2015-01-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_datos`
--

CREATE TABLE IF NOT EXISTS `user_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `barrio_id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `comentarios` text COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `user_datos`
--

INSERT INTO `user_datos` (`id`, `user_id`, `barrio_id`, `nombre`, `apellido`, `direccion`, `telefono`, `comentarios`, `created_at`, `updated_at`) VALUES
(3, 9, 4, 'Ederyyy', 'Julianyy', 'calle 17 #3w-65 miraflores torre 36 apto 11-37yyyyy', '30131191986777', 'eafbgadhnbnshhrethwhet', '2015-01-09', '2015-01-09'),
(4, 8, 3, 'Demi', 'Lovato', 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '3013119198', 'MIS COMENTARIOS', '2015-01-10', '2015-01-12'),
(5, 10, 4, 'Miss', 'D', 'carrera 9 #45878', '36585215', 'wñlmck{wnco', '2015-01-15', '2015-01-15'),
(6, 11, 3, 'ivan', 'rojas', 'carrera 9 #45878', '6658585', 'jn jknjcds', '2015-01-16', '2015-01-16');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
