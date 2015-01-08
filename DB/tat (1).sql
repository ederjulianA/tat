-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-01-2015 a las 01:46:52
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
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

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
  `cantidad` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `pro_nom`, `categoria_id`, `descripcion`, `slug`, `img`, `precio`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 'big cola 1', 1, 'Big cola 1', 'big-cola-1', 'img/productos/p1.jpg', 2000, 50, '0000-00-00', '0000-00-00'),
(2, 'big cola2', 1, 'Big cola 2', 'big-cola-2', 'img/productos/p2.jpg', 3200, 20, '0000-00-00', '0000-00-00'),
(3, 'otro producto', 1, 'este es otro producto', 'otro-producto', 'img/productos/p2.jpg', 7800, 150, '0000-00-00', '0000-00-00'),
(4, 'otro producto 4', 1, 'este es otro producto', 'otro-producto-4', 'img/productos/p1.jpg', 9850, 45, '0000-00-00', '0000-00-00'),
(5, 'dulces', 2, 'producto de dulces ', 'dulces', 'img/productos/p3.jpg', 7500, 80, '0000-00-00', '0000-00-00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `remember_token`, `remember_pass`, `active`, `condiciones`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'ederalvarez2009@hotmail.com', '$2y$10$SvCL7dmsqRfImRzVbCllJeaxe//a9o1ATmqJbfF6VHW2zXFMCYVE2', 'Y49eBEe7Pa7SlXAXrLaSZOmSXhDdHpRCiM1aWbjVKsAmAK4JMwPiDhixJNva', '', 1, 0, 0, '2014-11-28', '2015-01-03'),
(2, 'eder@tumegalopolis.com', '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', '2SaNzCgQpYmmaJuEj6Jcze7zLY6HXAcvI9XxlGUa2PAl4qHGNhbVQdf6TzJM', '', 1, 1, 0, '2015-01-03', '2015-01-03'),
(3, 'admin@admin.com', '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', 'rYLQ3G4IiU997KhY3oXg1wbucix4d74HKZcLa8mG3SNK0Kg3AhKpwdl51a1u', '', 1, 1, 1, '0000-00-00', '2015-01-03'),
(4, 'usuario@gmail.com', '$2y$10$33Alb7WURkQ7priWift7aOi4gsMYke8J84N6yQgt6XlS2qZb0jFz6', '', '', 1, 1, 0, '2015-01-03', '2015-01-03');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
