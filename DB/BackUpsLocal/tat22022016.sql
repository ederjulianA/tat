-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2016 a las 19:27:16
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrios`
--

CREATE TABLE IF NOT EXISTS `barrios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `ciu_id` int(11) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canales`
--

CREATE TABLE IF NOT EXISTS `canales` (
  `id` int(11) NOT NULL,
  `can_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cat_nom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `cat_slug` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `InvSubGruId` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `InvSubGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=631 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE IF NOT EXISTS `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciu_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conn`
--

CREATE TABLE IF NOT EXISTS `conn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `db` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `user` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `urlImg` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DepNom` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=100 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=76 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariofamilia`
--

CREATE TABLE IF NOT EXISTS `inventariofamilia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvFamCod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvFamId` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvFamNom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fam_slug` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `fam_InvSubGruCod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3729 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariogrupo`
--

CREATE TABLE IF NOT EXISTS `inventariogrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvGruCod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvGruId` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvGruNom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `slug_grupo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=115 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_envio`
--

CREATE TABLE IF NOT EXISTS `metodo_envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_metodo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempo_entrega` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `valor` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ArtSec` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `id_mantis` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pro_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria_id` varchar(16) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `slug` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `mantis_img` int(1) NOT NULL,
  `precio` decimal(17,5) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  `por_iva` int(2) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7212 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE IF NOT EXISTS `promociones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `imgC` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int(2) NOT NULL DEFAULT '1',
  `valor` int(7) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE IF NOT EXISTS `tipopago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipPagNom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=107 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NitSec` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `CliCup` int(18) DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `remember_pass` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `active` int(5) NOT NULL DEFAULT '1',
  `condiciones` tinyint(1) NOT NULL,
  `admin` int(5) NOT NULL DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_datos`
--

CREATE TABLE IF NOT EXISTS `user_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `barrio_id` int(11) DEFAULT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombre_negocio` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `canal` int(11) DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `comentarios` text COLLATE utf8_spanish2_ci,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_favs`
--

CREATE TABLE IF NOT EXISTS `user_favs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `art_cod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=15 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
