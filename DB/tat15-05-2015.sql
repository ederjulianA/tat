-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2015 a las 23:13:34
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

--
-- Volcado de datos para la tabla `barrios`
--

INSERT INTO `barrios` (`id`, `cod`, `ciu_id`, `bar_nom`, `Lunes`, `Martes`, `Miercoles`, `Jueves`, `Viernes`, `Sabado`, `Domingo`, `created_at`, `updated_at`) VALUES
(1, 'cod1', 1, 'San Francisco', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00'),
(2, 'cod2', 1, 'Cabecera', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00'),
(3, 'cod3', 3, 'El poblado', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00'),
(4, 'cod4', 1, 'Mutis', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00'),
(5, 'cod1123', 2, 'La candelaria', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00'),
(6, 'cod12345', 4, 'El limoncito  ', 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '0000-00-00');

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

--
-- Volcado de datos para la tabla `canales`
--

INSERT INTO `canales` (`id`, `can_nom`, `created_at`, `updated_at`) VALUES
(0, 'Tienda', '0000-00-00', '0000-00-00'),
(0, 'Restaurantes', '0000-00-00', '0000-00-00');

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
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE IF NOT EXISTS `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ciu_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `ciu_nom`, `created_at`, `updated_at`) VALUES
(1, 'Bucaramanga', '0000-00-00', '0000-00-00'),
(2, 'Piedecuesta', '0000-00-00', '0000-00-00'),
(3, 'Girón', '0000-00-00', '0000-00-00'),
(4, 'Floridablanca', '0000-00-00', '0000-00-00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=39 ;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `user_id`, `totalCart`, `total_compra`, `num_items`, `tipo_compra`, `vlr_envio`, `estado_id`, `conf`, `created_at`, `updated_at`) VALUES
(36, 3, 5230000, 3222000, 2010, 1, 0, 3, 1, '2015-04-06', '2015-04-10'),
(37, 3, 555200, 560200, 213, 2, 5000, 1, 0, '2015-04-15', '2015-05-08'),
(38, 3, 480000, 485000, 150, 9, 0, 1, 0, '2015-05-11', '2015-05-11');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=123 ;

--
-- Volcado de datos para la tabla `compra_items`
--

INSERT INTO `compra_items` (`id`, `compra_id`, `nombre`, `image`, `valor_unitario`, `iva`, `cantidad`, `valor_total`, `id_producto`, `created_at`, `updated_at`) VALUES
(117, 36, 'big cola 1', 'img/productos/p1.jpg', 2000, 10, 1010, 2222000, 1, '2015-04-09', '2015-04-09'),
(118, 36, 'Camiseta Barcelona 2014 Talla S Para Niño', 'http://tiendo.co/img/products/2014-06-11-01-LMnMCYz5ihFDV-barsa2.jpg', 1000, NULL, 1000, 1000000, 64, '2015-04-09', '2015-04-09'),
(119, 37, 'otro producto 4', 'img/productos/p1.jpg', 9850, NULL, 4, 39400, 4, '2015-04-15', '2015-04-15'),
(120, 37, 'big cola 1', 'img/productos/p1.jpg', 2000, 10, 199, 437800, 1, '2015-04-15', '2015-04-15'),
(121, 37, 'otro producto', 'img/productos/p2.jpg', 7800, NULL, 10, 78000, 3, '2015-05-08', '2015-05-08'),
(122, 38, 'big cola2', 'img/productos/p2.jpg', 3200, NULL, 150, 480000, 2, '2015-05-11', '2015-05-11');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=73 ;

--
-- Volcado de datos para la tabla `dia_barrio`
--

INSERT INTO `dia_barrio` (`id`, `dia_id`, `barrio_id`, `created_at`, `updated_at`) VALUES
(66, 1, 1, '2015-03-24', '2015-03-24'),
(67, 2, 2, '2015-03-24', '2015-03-24'),
(68, 3, 3, '2015-03-24', '2015-03-24'),
(69, 4, 4, '2015-03-24', '2015-03-24'),
(70, 5, 5, '2015-03-24', '2015-03-24'),
(71, 6, 6, '2015-03-24', '2015-03-24'),
(72, 7, 5, '2015-03-24', '2015-03-24');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nom_est`, `created_at`, `updated_at`) VALUES
(1, 'Pendiente de Confirmación', '0000-00-00', '0000-00-00'),
(2, 'Confirmado', '0000-00-00', '0000-00-00'),
(3, 'En reparto', '0000-00-00', '0000-00-00'),
(4, 'Entregado', '0000-00-00', '0000-00-00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `metodo_envio`
--

INSERT INTO `metodo_envio` (`id`, `nom_metodo`, `tiempo_entrega`, `valor`, `created_at`, `updated_at`) VALUES
(1, 'RUTA TAT Camión', '1 a 2 dias', 0, '0000-00-00', '0000-00-00'),
(2, 'INMEDIATO', '60 minutos', 5000, '0000-00-00', '0000-00-00'),
(9, 'Nuevo', '25 min', 8000, '2015-05-07', '2015-05-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mantis` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=183 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_mantis`, `pro_nom`, `categoria_id`, `descripcion`, `slug`, `img`, `precio`, `por_iva`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, NULL, 'big cola 1', 1, '<h1 style=" text-align: center;"><font size="5"><span style="font-weight: bold; font-size: -webkit-xxx-large;">Big cola 1</span></font></h1><p style="text-align: center;"><!--[if gte mso 9]><xml>\n <o:OfficeDocumentSettings>\n  <o:AllowPNG></o:AllowPNG>\n </o:OfficeDocumentSettings>\n</xml><![endif]--></p><p style="text-align: center;"><!--[if gte mso 9]><xml>\n <w:WordDocument>\n  <w:View>Normal</w:View>\n  <w:Zoom>0</w:Zoom>\n  <w:TrackMoves></w:TrackMoves>\n  <w:TrackFormatting></w:TrackFormatting>\n  <w:HyphenationZone>21</w:HyphenationZone>\n  <w:PunctuationKerning></w:PunctuationKerning>\n  <w:ValidateAgainstSchemas></w:ValidateAgainstSchemas>\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\n  <w:DoNotPromoteQF></w:DoNotPromoteQF>\n  <w:LidThemeOther>ES-CO</w:LidThemeOther>\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\n  <w:Compatibility>\n   <w:BreakWrappedTables></w:BreakWrappedTables>\n   <w:SnapToGridInCell></w:SnapToGridInCell>\n   <w:WrapTextWithPunct></w:WrapTextWithPunct>\n   <w:UseAsianBreakRules></w:UseAsianBreakRules>\n   <w:DontGrowAutofit></w:DontGrowAutofit>\n   <w:SplitPgBreakAndParaMark></w:SplitPgBreakAndParaMark>\n   <w:EnableOpenTypeKerning></w:EnableOpenTypeKerning>\n   <w:DontFlipMirrorIndents></w:DontFlipMirrorIndents>\n   <w:OverrideTableStyleHps></w:OverrideTableStyleHps>\n  </w:Compatibility>\n  <m:mathPr>\n   <m:mathFont m:val="Cambria Math"></m:mathFont>\n   <m:brkBin m:val="before"></m:brkBin>\n   <m:brkBinSub m:val="--"></m:brkBinSub>\n   <m:smallFrac m:val="off"></m:smallFrac>\n   <m:dispDef></m:dispDef>\n   <m:lMargin m:val="0"></m:lMargin>\n   <m:rMargin m:val="0"></m:rMargin>\n   <m:defJc m:val="centerGroup"></m:defJc>\n   <m:wrapIndent m:val="1440"></m:wrapIndent>\n   <m:intLim m:val="subSup"></m:intLim>\n   <m:naryLim m:val="undOvr"></m:naryLim>\n  </m:mathPr></w:WordDocument>\n</xml><![endif]--><!--[if gte mso 9]><xml>\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\n  LatentStyleCount="267">\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"></w:LsdException>\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"></w:LsdException>\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"></w:LsdException>\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Title"></w:LsdException>\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"></w:LsdException>\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"></w:LsdException>\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"></w:LsdException>\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"></w:LsdException>\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Table Grid"></w:LsdException>\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"></w:LsdException>\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"></w:LsdException>\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Shading"></w:LsdException>\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light List"></w:LsdException>\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Grid"></w:LsdException>\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Dark List"></w:LsdException>\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Shading"></w:LsdException>\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful List"></w:LsdException>\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Grid"></w:LsdException>\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light List Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"></w:LsdException>\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"></w:LsdException>\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"></w:LsdException>\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"></w:LsdException>\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Dark List Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"></w:LsdException>\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light List Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Dark List Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"></w:LsdException>\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light List Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Dark List Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"></w:LsdException>\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light List Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Dark List Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"></w:LsdException>\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light List Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Dark List Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"></w:LsdException>\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light List Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Dark List Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"></w:LsdException>\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"></w:LsdException>\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"></w:LsdException>\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"></w:LsdException>\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"></w:LsdException>\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"></w:LsdException>\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"></w:LsdException>\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"></w:LsdException>\n </w:LatentStyles>\n</xml><![endif]--><!--[if gte mso 10]>\n<style>\n /* Style Definitions */\n table.MsoNormalTable\n	{mso-style-name:"Tabla normal";\n	mso-tstyle-rowband-size:0;\n	mso-tstyle-colband-size:0;\n	mso-style-noshow:yes;\n	mso-style-priority:99;\n	mso-style-parent:"";\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\n	mso-para-margin-top:0cm;\n	mso-para-margin-right:0cm;\n	mso-para-margin-bottom:10.0pt;\n	mso-para-margin-left:0cm;\n	line-height:115%;\n	mso-pagination:widow-orphan;\n	font-size:11.0pt;\n	font-family:"Calibri","sans-serif";\n	mso-ascii-font-family:Calibri;\n	mso-ascii-theme-font:minor-latin;\n	mso-hansi-font-family:Calibri;\n	mso-hansi-theme-font:minor-latin;\n	mso-fareast-language:EN-US;}\n</style>\n<![endif]-->\n\n</p><p class="MsoNormal"><font size="6"><span style="font-family: Comic Sans MS;">Esta descripción es un poco más llamativa que las otras, ya\nque podemos agregar</span></font></p><p class="MsoNormal"><font size="6"><span style="font-family: Comic Sans MS;"><br></span></font></p>\n\n<p></p><div><br></div>', 'big-cola-1', 'img/productos/p1.jpg', 2000, 10, 50, '0000-00-00', '2015-03-06'),
(2, NULL, 'big cola2', 1, 'Big cola 2', 'big-cola-2', 'img/productos/p2.jpg', 3200, NULL, 20, '0000-00-00', '0000-00-00'),
(3, NULL, 'otro producto', 1, 'este es otro producto', 'otro-producto', 'img/productos/p2.jpg', 7800, NULL, 150, '0000-00-00', '0000-00-00'),
(4, NULL, 'otro producto 4', 1, 'este es otro producto', 'otro-producto-4', 'img/productos/p1.jpg', 9850, NULL, 45, '0000-00-00', '0000-00-00'),
(5, NULL, 'dulces', 2, 'producto de dulces ', 'dulces', 'img/productos/p3.jpg', 7500, NULL, 80, '0000-00-00', '0000-00-00'),
(56, 49, 'Segunda equipación camiseta selección Colombia', 1, 'Camiseta de la segunda equipación de la selección Colombia original Adidas', 'segunda_equipacion_camiseta_seleccion_colombia', 'http://tiendo.co/img/products/2014-06-05-21-w3hlsQ4qH1h9M-colombia-roja.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(57, 50, 'CAMISETAS ORIGINALES ITALIA MUNDIAL 2014', 1, 'DISPONIBLE LAS TALLAS S, M, L Y XL - MANGA CORTA TODAS LAS CAMISETAS VIENE EN SU RESPECTIVA BOLSA ORIGINAL', 'camisetas_originales_italia_mundial_2014', 'http://tiendo.co/img/products/2014-06-05-21-8eK8kq1410kax-italia2014.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(58, 51, 'Camiseta Del Real Madrid 2014, Marcadas', 1, 'Camiseta del Real, local y Visitante\r\nTallas de la S a la XL Y tallas para niños.\r\nExcelente calidad\r\nConjuntos para niños\r\nEl conjunto con camiseta y pantaloneta Vale:75000\r\nEscudos y logos cocidos Y Bordados.Fotos Reales', 'camiseta_del_real_madrid_2014_marcadas', 'http://tiendo.co/img/products/2014-06-05-21-ifdx4UqYQD7Ms-madrid.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(59, 52, 'Camisetas Hombre, Mujer Y Niño Selección Colombia', 1, 'camiseta de la seleccion colombia manga larga', 'camisetas_hombre_mujer_y_nino_seleccion_colombia', 'http://tiendo.co/img/products/2014-06-05-22-1ppmrLORGCvHx-colombia-larga.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(60, 53, 'camiseta Colombia para mujer Brasil 2014 ', 1, 'camiseta de la seleccion colombia para mujer', 'camiseta_colombia_para_mujer_brasil_2014_', 'http://tiendo.co/img/products/2014-06-05-22-tTiYCrf5NKrqx-dep2.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(61, 54, 'Tenis Zapatillas Adidas Fashion Speed Cross Envio + Medias', 1, 'Un zapato con mucho agarre, tanto en senderos de tierra  sueltas como en rocas', 'tenis_zapatillas_adidas_fashion_speed_cross_envio__medias', 'http://tiendo.co/img/products/2014-06-07-04-pKLxkallcopD0-zapatos.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(62, 55, 'Servicio De Catalogos Digitales', 4, 'este servicio permite q tengas tus productos en un mundo virtual', 'servicio_de_catalogos_digitales', 'http://tiendo.co/img/products/2014-06-07-16-n60HtXCMpZe5a-mega.png', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(63, 56, 'COMPUTADORES', 4, 'SUPERCOMPUTADOR', 'computadores', 'http://tiendo.co/img/products/2014-06-07-22-XB7Mu5jtSp133-COMPU.jpeg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(64, 57, 'Camiseta Barcelona 2014 Talla S Para Niño', 1, 'Camiseta 100 % Original del Barcelona 2014 Importada de Europa, Garantizada.\r\nTalla S, Sirve para un niño entre 6 y 10 años. Mirar el Tallaje Nike para Niño.', 'camiseta_barcelona_2014_talla_s_para_nino', 'http://tiendo.co/img/products/2014-06-11-01-LMnMCYz5ihFDV-barsa2.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(65, 58, 'Camisetas Adidas Y Nike Deportivas Para Hombre', 1, 'camisatas para hombres ', 'camisetas_adidas_y_nike_deportivas_para_hombre', 'http://tiendo.co/img/products/2014-06-11-16-hQWr4kttZOf6M-camisaDEP.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(66, 60, 'guitarra 2', 1, 'pendiente...', 'guitarra_2', 'http://tiendo.co/img/products/2014-07-24-21-UUVtQuXnoWh7u-guitarra1.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(67, 61, 'TecladoParaPc', 4, 'teclado para pc', 'teclado_para_pc', 'http://tiendo.co/img/products/2014-07-25-13-sgWG4bdoIljdn-teclado_968019_3104Classic200.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(68, 62, 'Apple Imac Md096e/a 27 Pulgadas 8gb Core I5 Quad Core', 4, 'Intel Core i5 quad core de 3.2 GHz (Turbo Boost de hasta 3.6 GHz) con 6 MB de caché L3\r\nMemoria de 8 GB (dos de 4 GB) DDR3 de 1600 MHz; cuatro ranuras SO-DIMM accesibles para el usuario\r\nCámara FaceTime HD Es compatible tanto con la resolución nativa de la pantalla integrada como con una pantalla externa de hasta 30 pulgadas (2560 x 1600 pixeles) Soporte para modos de video en espejo y escritorio extendido\r\nRanura para tarjeta SDXC\r\nCuatro puertos USB 3\r\nDos puertos Thunderbolt\r\nSalida mini DisplayPort compatible con DVI, VGA y DVI de doble enlace (adaptadores se venden por separado)\r\nGigabit Ethernet 10/100/1000BASE-T (conector RJ-45)\r\nWi-Fi\r\nRed wireless Wi-Fi 802.11n,2 compatible con IEEE 802.11a/b/g\r\nBluetooth\r\nTecnología wireless Bluetooth 4.0\r\nTeclado wireless Apple Teclado de tamaño completo con 78 (EE.UU.) o 79 (ISO) teclas, incluyendo 12 teclas de función y 4 teclas de dirección (en forma de ?T? invertida)\r\nMagic Mouse Superficie suave y uniforme Multi-Touch con soporte para gestos simples (desplazamiento y roce), haz clic o doble clic en cualquier parte. Además, la construcción ambidiestra se adapta a usuarios diestros y zurdos.\r\nMagic Trackpad Trackpad Multi-Touch de cristal para un control preciso del cursor; soporta desplazamiento por inercia, pellizco, rotación, deslizamiento con tres dedos, deslizamiento con cuatro dedos, toque, doble toque, rotación, zoom de pantalla, desplazamiento, hacer clic y arrastrar; hacer clic/arrastrar y bloquear; clic secundario A y B.', 'apple_imac_md096ea_27_pulgadas_8gb_core_i5_quad_core', 'http://tiendo.co/img/products/2014-07-28-01-1uD5VgCDVB6d8-imac1.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(69, 64, 'Camiseta Real Madrid 14-15', 1, 'Camiseta de la primera equipación del Real MAd', 'camiseta_real_madrid_14-15', 'http://tiendo.co/img/products/2014-07-28-14-tgAR2jsl5yaSb-pruebaCamiseta.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(70, 65, 'Camiseta PSG', 1, 'Camiseta PSG temporada 14-15 todas tallas', 'camiseta_psg', 'http://tiendo.co/img/products/2014-07-30-20-nzjwuMwHOCx32-psg2.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(71, 66, 'Una oración para cada ocasión', 6, 'Más de 100 oraciones para todos los momentos', 'una_oracion_para_cada_ocasion', 'http://tiendo.co/img/products/2014-09-20-21-09-52-S7J5o1NgXXLxY.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(72, 67, 'GAFAS OAKLEY', 1, 'GAFAS OAKLEY HOLBROOK 15733', 'gafas_oakley', 'http://tiendo.co/img/products/2014-07-30-16-3ATHOR2jdYsLb-15733.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(73, 68, 'real madrid', 1, 'camiseta real madrid', 'real_madrid', 'http://tiendo.co/img/products/2014-08-04-05-08-36-7b8lKNzfWErXD-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(74, 69, 'Saga Percy Jackson Y Los Dioses Del Olimpo - Rick Riordan', 4, 'Seis (6) Libros en Pdf. Sobre Mitología Griega y Novelas de Aventura. Saga Percy Jackson y los Dioses del Olimpo - Rick Riordan', 'saga_percy_jackson_y_los_dioses_del_olimpo_-_rick_riordan', 'http://tiendo.co/img/products/2014-07-30-20-IBHJTkT4c3ukh-libro1.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(75, 70, 'GAFAS OAKLEY', 1, 'GAFAS OAKLEY FROGSKINS VALENTINO ROSSI', 'gafas_oakley', 'http://tiendo.co/img/products/2014-07-30-20-KRdDxyBfzeXMu-13772.JPG', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(76, 71, 'Gafas Oakley Radar 5 Lentes Intercambiables 100% Originales', 1, 'gafas oakley 5', 'gafas_oakley_radar_5_lentes_intercambiables_100_originales', 'http://tiendo.co/img/products/2014-07-30-22-intuU787hZfiD-gafas.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(77, 72, 'MEZCLADORA DE CONCRETO DE 1 BULTO', 4, 'Ofrecemos todos los equipos relacionados para la construcción, a los mejores precios marcas nacionales e importadas.', 'mezcladora_de_concreto_de_1_bulto', 'http://tiendo.co/img/products/2014-07-31-20-chPQOGhiCfucz-MEZCLADORA.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(78, 73, 'Watch Dogs Ps4 Español. Nuevo Y Sellado. Entrega Hoy Mismo!!', 4, '* REALIZAMOS ENVÍOS A TODO EL PAÍS! ENVIAMOS EL MISMO DÍA DEL PAGO Y TARDA 1 DÍA HÁBIL EN LLEGAR A CIUDADES PRINCIPALES!!!\r\n* ESTE PRODUCTO ESTÁ TOTALMENTE NUEVO Y SELLADO DE FÁBRICA. LO TENEMOS PARA ENTREGA INMEDIATA', 'watch_dogs_ps4_espanol_nuevo_y_sellado_entrega_hoy_mismo', 'http://tiendo.co/img/products/2014-08-01-08-bIDeANqBZzRVK-w1.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(79, 74, 'Camisetas Abercrombie Hollister Originales Por Mayor Unidad', 1, 'pendiente', 'camisetas_abercrombie_hollister_originales_por_mayor_unidad', 'http://tiendo.co/img/products/2014-08-02-01-eDpCCMIDZmFmX-ropa1.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(80, 75, 'TRATAMIENTOS FACIALES SESION', 2, 'Estudio de necesidades cutáneas, limpieza según tipo de piel, alta frecuencia, mascarillas según la necesidad cutánea, ionización de producto, pantalla solar, asesoramiento profesional.', 'tratamientos_faciales_sesion', 'http://tiendo.co/img/products/2014-08-02-02-dmon3JrLwWlBI-FACIAL.png', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(81, 76, 'LIMPIEZA FACIAL PROFUNDA', 2, 'Análisis de las necesidades cutáneas, desmaquillado, exfoliación, tónico, pre-extracción, peeling enzimático, masaje, vapor-ozono, ventosas, alta frecuencia, mascarilla, hidratante, asesoramiento para tratamiento de refuerzo en casa.', 'limpieza_facial_profunda', 'http://tiendo.co/img/products/2014-08-04-00-B4Qw4lYZ4tvIw-limpieza facial profunda.png', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(82, 77, 'TRATAMIENTO ANTI-AGE', 2, 'Desmaquillado según tipo de piel, peeling, tónico, vapor-ozono, ionización de producto, mascarilla, maniobras con hidratante, pantalla solar, asesoramiento profesional.', 'tratamiento_anti-age', 'http://tiendo.co/img/products/2014-08-04-01-voMUurcjvDM85-tratamiento anti age.png', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(83, 78, 'Despigmentación cutánea', 2, 'Desmaquillado, peeling, tónico, aplicación de Alfahidroxiácidos, mascarilla calmante, maniobras con hidratante, pantalla solar y asesoramiento para tratamiento de refuerzo en casa.  6 sesiones', 'despigmentacion_cutanea', 'http://tiendo.co/img/products/2014-08-04-01-nQKXC9RiF2JwH-despigmentacion cutanea.png', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(84, 79, 'PLASMA RICO EN PLAQUETAS', 2, 'Extracción del plasma, separación y enriquecimiento de las plaquetas, limpieza y esterilización del rostro o área a tratar, aplicación del plasma enriquecido mediante procedimiento de mesoterápia, aplicación de mascarilla, aplicación de frio calmante, hidroreparadora, pantalla solar', 'plasma_rico_en_plaquetas', 'http://tiendo.co/img/products/2014-08-04-01-t7rGm3aKEPfs9-plasma rico en plaquetas.png', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(85, 80, 'zapatos', 1, 'pendiente jjj', 'zapatos', 'http://tiendo.co/img/products/2014-08-04-16-08-48-zLprd9s7nFYoZ-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(86, 81, 'FUNDAMENTACION EN VIGILANCIA', 4, 'Capacitar al  Vigilante en procedimientos, conocimientos y destrezas necesarios para desempeñarse con eficiencia en las diferentes responsabilidades y tareas propias de la Vigilancia  y Seguridad Privada, con acatamiento a las normas legales vigentes hacia el marco de la empresa, la familia y la sociedad. 100 Horas.', 'fundamentacion_en_vigilancia', 'http://tiendo.co/img/products/2014-08-04-20-08-14-8vG6dKdIvxsdx-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(87, 82, 'MICRODERMOABRASION CON PUNTAS DE DIAMANTE', 2, 'Desmaquillado según tipo de piel, peeling, tónico, vapor-ozono, exfoliación con las puntas de diamante, mascarilla calmante, maniobras con hidro-reparadora, pantalla solar.', 'microdermoabrasion_con_puntas_de_diamante', 'http://tiendo.co/img/products/2014-08-05-02-08-58-qtySL1m1gC0j4-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(88, 83, 'MÁXIMA HIDRATACIÓN', 2, 'Desmaquillado, análisis de piel, peeling, tónico, Alta frecuencia, ionizamos mascarilla hidratante, mascarilla de colágeno, o parafina, hidratante y protector solar.', 'maxima_hidratacion', 'http://tiendo.co/img/products/2014-08-05-02-08-03-3jwHkAjofdh0A-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(89, 84, 'TRATAMIENTO ANTI-ACNE', 2, 'Desmaquillado, análisis de piel, peeling, tónico astringente, mascarilla desincrustante, vapor-ozono, extracción o saponificación, ampolla para piel grasa, alta frecuencia, mascarilla para piel grasa, drenaje y protector solar.', 'tratamiento_anti-acne', 'http://tiendo.co/img/products/2014-08-05-02-08-43-2u6eYNUpYhgnX-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(90, 85, 'TRATAMIENTO TONIFICANTE', 2, 'Desmaquillado, analisis de piel, peeling, tónico, vapor, ionizamos producto reafirmante, gimnasia pasiva, o vacum, o masaje tonificante, mascarilla, hidratante, y protector solar.', 'tratamiento_tonificante', 'http://tiendo.co/img/products/2014-08-05-02-08-07-pwuqrh6x83qLj-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(91, 86, 'TRATAMIENTO DE REDUCCIÓN DE MEDIDAS', 2, 'Limpieza y exfoliación del area a tratar, aplicación de producto reductor, manta térmica, masaje, vacumterápia,, o gimnasia pasiva, o cavitación,, o mesoterápia con ultrasonido. asesoramiento para reforzar en casa, asesoramiento nutricional.', 'tratamiento_de_reduccion_de_medidas', 'http://tiendo.co/img/products/2014-08-05-02-08-41-YtCkgVUnfX0Vy-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(92, 87, 'TRATAMIENTO ANTICELULÍTICO', 2, 'Limpieza y exfoliación del area a tratar, aplicación de producto anticelulítico, masaje, manta térmica, vacumterápia o cavitación, drenaje linfático, otra sesión ultrasonido y otras técnicas variadas. asesoramiento de refuerzo en casa, y guia nutricional.', 'tratamiento_anticelulitico', 'http://tiendo.co/img/products/2014-08-05-03-08-40-VpI8lnjK9rDZU-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(93, 88, 'TRATAMIENTO DE GLUTEOS', 2, 'Limpieza y exfoliación del area, aplicación de producto estimulante y masaje, aplicación de vacumterápia, copas delfín, crio-terápia, o mascarilla feafirmante, o ultrasonido, o gimnasia pasiva, aplicación de vitamina C , mesoterápia con productos estimulantes y tonificantes. Asesoramiento nutricional.', 'tratamiento_de_gluteos', 'http://tiendo.co/img/products/2014-08-05-03-08-52-V6wIdAk97Yvdp-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(94, 89, 'Gorra Valentino Rossi', 1, 'Gorras Valentino Rossi súper baratas en malla.', 'gorra_valentino_rossi', 'http://tiendo.co/img/products/2014-09-07-02-09-21-DQz7SgaK1K8P7.jpg', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(95, 90, 'Gorra Plana Scuderia Ferrari - Puma', 1, 'Te gusta la FORMULA 1 y los deportes de motor?\r\n\r\nAdquiere yaaaaa! la GORRA PLANA Oficial de FERRARI!\r\nProducto importado 100% original PUMA licenciado por la ESCUDERIA FERRARI FORMULA 1  para su distribución.', 'gorra_plana_scuderia_ferrari_-_puma', 'http://tiendo.co/img/products/2014-08-05-20-08-48-CvSt9mfaAZyOI-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(96, 91, 'Gorras Tommy Hilfiger 100% Originales', 1, 'SI ESTAS EN BUCARAMANGA PUEDES RECOJERLAS PERSONALMENTE', 'gorras_tommy_hilfiger_100_originales', 'http://tiendo.co/img/products/2014-08-05-20-08-47-KcofDY5FfqQTs-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(97, 92, 'Oakley Gorra', 1, 'Gorra Oakley  classic MID FLEX. Comprada directamente de la tienda OAKLEY de USA.', 'oakley_gorra', 'http://tiendo.co/img/products/2014-08-05-20-08-40-zf0PIp3PXQtBD-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(98, 93, 'Gorra New Era Nfl Seattle', 1, 'Gorras importadas NFL Seattle', 'gorra_new_era_nfl_seattle', 'http://tiendo.co/img/products/2014-08-05-20-08-47-JaM80KQw00qJG-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(99, 94, 'HERRAMIENTAS MANUALES Y ELECTRICAS', 4, 'AGROFARBEF TE OFRECE LINEA COMPLETA DE HERRAMIENTAS MANUALES Y ELÉCTRICAS PARA LA INDUSTRIA, CARPINTERÍA, MECÁNICA, CONSTRUCCIÓN Y MINERÍA CON MARCAS RECONOCIDAS COMO DEWALT, BOSCH, MAKITA, BLACK DECKER', 'herramientas_manuales_y_electricas', 'http://tiendo.co/img/products/2014-08-05-23-08-58-JxSbr9U8tHvcf-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(100, 95, 'Vestido Importado Uv Glow Brillan Luz Uv Moda Fashion', 1, 'Vestidos UV Glow brillan con la luz UV ideal para discoteca presentaciones y eventos.', 'vestido_importado_uv_glow_brillan_luz_uv_moda_fashion', 'http://tiendo.co/img/products/2014-08-10-17-08-29-kbzGxHY9075MH-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(101, 96, 'Blusas Aeropostale, Hollister, Ralph Lauren', 1, 'Blusas de diferentes marcas, para dama', 'blusas_aeropostale_hollister_ralph_lauren', 'http://tiendo.co/img/products/2014-08-10-17-08-46-EbyfjcjH4xvw4-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(102, 97, 'Blusas Studio F, Levis, Abrecrombie', 1, 'Camisetas para dama de diferentes marcas', 'blusas_studio_f_levis_abrecrombie', 'http://tiendo.co/img/products/2014-08-10-17-08-19-x9Sg7MYQMWEzh-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(103, 98, 'Pantalones jean, blusas', 1, 'Pantalon jean leventa cola, blusas y sacos, anímate a comprar', 'pantalones_jean_blusas', 'http://tiendo.co/img/products/2014-08-10-17-08-16-Yt8iI7HveLv5y-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(104, 99, 'Conjuntos, pantalon jean y blusa', 1, 'Pantalones Jean Levantacola Dama Mujer Blusas Sacos Braga', 'conjuntos_pantalon_jean_y_blusa', 'http://tiendo.co/img/products/2014-08-10-17-08-43-Ak7wkh3S8BxcI-', 1000, NULL, 90, '2015-03-18', '2015-04-06'),
(105, 100, 'Cupcake de Chocolate', 3, 'Cupcake de chocolate cubierto con ganache', 'cupcake_de_chocolate', 'http://tiendo.co/img/products/2014-08-14-00-08-31-UlVVQTVt0m8d0-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(106, 101, 'Cupcake', 3, 'Cupcake ', 'cupcake', 'http://tiendo.co/img/products/2014-08-14-03-08-05-DglMJtZzoTIkF-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(107, 102, 'Relojes LED Watch', 4, 'Relojes digitales, estilo casual y deportivo de diferentes colores para hombres y para mujer.', 'relojes_led_watch', 'http://tiendo.co/img/products/2014-08-14-21-08-00-Az7FJlmis4ftN-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(108, 103, 'Samsung Galaxy S5 LTE 16 GB', 4, 'Teléfono Android KitKat Samsung Galaxy S5 de 16 GB ', 'samsung_galaxy_s5_lte_16_gb', 'http://tiendo.co/img/products/2014-08-14-21-08-47-PDu9yWNOG9BEf-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(109, 104, 'Monturas Sport de marcas reconocidas', 1, 'Marcas reeconocids como Ray Ban, lacoste, Polo Ralph Lauren, entre otras.', 'monturas_sport_de_marcas_reconocidas', 'http://tiendo.co/img/products/2014-08-14-21-08-15-6YAdhJIPjIgF9-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(110, 105, 'Samsung Galaxy Tab Pro 8.4 Rapidisima, Retina Snapdragon 800', 4, 'VENDO ESPECTACULAR TABLET SAMSUNG GALAXY TAB PRO 8.4 (MODELO 2014) CON PROCESADOR SNAPDRAGON 800 , EL MISMO QUE TIENE LA NOTE 3, DA MAS DE 36.000 PUNTOS EN ANTUTU ES RAPIDISIMA Y TIENE UNA ESPECTACULAR PANTALLA CON UNA RESOLUCION DE 2560x1600, SE ENTREGA EN SU CAJA SELLADA, LA TABLET ES DE COLOR BLANCO Y TIENE GARANTIA. ', 'samsung_galaxy_tab_pro_84_rapidisima_retina_snapdragon_800', 'http://tiendo.co/img/products/2014-08-14-21-08-57-fZbKbCgJYRwjc-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(111, 106, 'Gafas Oakley', 1, 'Garage Rock Ferrari 16014', 'gafas_oakley', 'http://tiendo.co/img/products/2014-08-14-22-08-19-bqLWM2peG3w99-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(112, 107, 'Gafas Oakley', 1, 'Gafas Caveat Para Mujer 15949', 'gafas_oakley', 'http://tiendo.co/img/products/2014-08-14-22-08-28-vh44sH5JYmYUJ-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(113, 108, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo Faxon Low 16032', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-22-08-35-FsJsyM7prN8Qe-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(114, 109, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo En Tela Faxon Low Azul 16033', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-22-08-36-sUUZMQqgIR4hX-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(115, 110, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo En Tela Faxon Low Negro Por Gris 16034', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-22-08-07-8o6ZjuX6x7yBg-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(116, 111, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo En Tela Faxon Low Rojo 16035', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-22-08-20-BPE6NCJ5QvA1O-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(117, 112, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo En Tela Faxon Low Azul 16043', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-22-08-33-tLuFfoIhVy2cW-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(118, 113, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo En Tela Faxon Low Gris 16041', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-23-08-09-BuUeluF8LCSgv-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(119, 114, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo Ref Fernando Cafe 16044', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-23-08-05-0050Zx27lEaMY-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(120, 115, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo Ref Fernando Naranja 16047', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-23-08-31-sG3HbM2d8hSLC-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(121, 116, 'Zapatos Polo Ralhp Lauren', 1, 'Zaapatos Polo Ref Fernando Verde 16048', 'zapatos_polo_ralph_lauren', 'http://tiendo.co/img/products/2014-08-14-23-08-00-Bz6CwBrNs6nQg-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(122, 117, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo Ref Fakenham Negro 16038', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-23-08-25-g0ven26oNOsLw-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(123, 118, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo Fakenham Azul', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-23-08-56-CN9fPS9wtJ7Qt-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(124, 119, 'Zapatos Polo Ralhp Lauren', 1, 'Zapatos Polo Fakenham Rojo 16040', 'zapatos_polo_ralhp_lauren', 'http://tiendo.co/img/products/2014-08-14-23-08-35-AuulFXK5jMxVC-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(125, 120, 'Zapatos Calvin Klein', 1, 'Zapatos Calvin Klein Negro 14601', 'zapatos_calvin_klein', 'http://tiendo.co/img/products/2014-08-14-23-08-25-zUWwUIbRUGlsl-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(126, 121, 'Zapatos Calvin Klein', 1, 'Zapatos Calvin Klein Azul 14602', 'zapatos_calvin_klein', 'http://tiendo.co/img/products/2014-08-14-23-08-37-HqnvA3B48aLz5-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(127, 122, 'Zapatos Calvin Klein', 1, 'Zapatos Calvin Klein Blanco 14603', 'zapatos_calvin_klein', 'http://tiendo.co/img/products/2014-08-14-23-08-43-DHWrgthq66eFE-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(128, 123, 'Zapatos Calvin Klein', 1, 'Zapatos Calvin Klein Gris 14604', 'zapatos_calvin_klein', 'http://tiendo.co/img/products/2014-08-14-23-08-55-w0jMIchismhEX-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(129, 124, 'Zapatos Calvin Klein', 1, 'Zapatos Calvin Klein Gris Naranja 14605', 'zapatos_calvin_klein', 'http://tiendo.co/img/products/2014-08-14-23-08-57-4f4uDBjocGKkJ-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(130, 125, 'Zapatos Diesel', 1, 'Zapatos Diesel Azul 15969', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-14-23-08-16-reLQVZc16jgxp-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(131, 126, 'Zapatos Diesel', 1, 'Zapatos Diesel 15968', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-13-aLTH1bRioqNy0-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(132, 127, 'Zapatos Diesel', 1, 'Zapatos Diesel 15972', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-41-2cNBOMu8O70Xh-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(133, 128, 'Zapatos Diesel', 1, 'Zapatos Diesel 15967', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-19-67MVbylqD1Rjr-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(134, 129, 'Zapatos Diesel', 1, 'Zapatos Diesel 15937', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-13-h5OsghVwvMEEn-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(135, 130, 'Zapatos Diesel', 1, 'Zapatos Diesel 15936', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-06-TQgP7Bozv5Az9-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(136, 131, 'Zapatos Diesel', 1, 'Zapatos Diesel 15938', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-54-zQDo75M6Wcw2g-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(137, 132, 'Zapatos Diesel', 1, 'Zapatos Diesel 13183', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-31-wVKI6sxIXg9pt-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(138, 133, 'Zapatos Diesel', 1, 'Zapatos Diesel 15976', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-29-36BuCUOJTI8j5-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(139, 134, 'Zapatos Diesel', 1, 'Zapatos Diesel  15966', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-05-excBjFneBICBu-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(140, 135, 'Zapatos Diesel', 1, 'Zapatos Diesel 15965\r\n', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-02-k0NfQdv6DI79C-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(141, 136, 'Zapatos Diesel', 1, 'Zapatos Diesel 15971', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-54-EAZ5clr3yM1zE-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(142, 137, 'Zapatos Diesel', 1, 'Zapatos Diesel 14619', 'zapatos_diesel', 'http://tiendo.co/img/products/2014-08-15-00-08-57-3g3P8Cw0BzYUt-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(143, 138, 'ESMALTE MASGLO', 2, 'Esmaltes de una excelente calidad con diversas tonalidades. ', 'esmalte_masglo', 'http://tiendo.co/img/products/2014-08-16-20-08-01-TrtJ3LBIOGb0y-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(144, 139, 'AGV K3 46 LG', 1, 'El K-3 es uno de los clásicos más vendidos cascos de AGV. Su diseño deriva de la parte superior de la gama GP-Tech cascos, con lo que la mayoría de las últimas características avanzadas para este producto con un precio razonable. El casco de inspiración-line carrera maximiza el flujo de aire minimizando los niveles de ruido, mientras que el alerón de nuevo asegura la estabilidad a altas velocidades. El sistema de ventilación dispone de tres tomas frontales, y seis extractores posteriores y laterales, mientras que un protector de viento barbilla evitar turbulencias en el interior del casco.\r\n\r\nEl K-3 está disponible en una increíble gama de colores , incluyendo los gráficos oficiales Valentino Rossi réplica , que se pueden personalizar con adicionales Viseras , en Polarizados , Iridium y arco iris de colores.\r\n\r\nSi usted desea actualizar a una más ligera y más resistente de fibra de vidrio cubierta exterior del K-4 EVO sería el yelmo de la elección.', 'agv_k3_46_lg', 'http://tiendo.co/img/products/2014-08-19-15-08-31-LWB8lsoWvqyZV-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(145, 140, 'KERATINA LISSTYLE ', 2, 'KIT LISSTYLE   Tratamiento alisador progresivo sin formol a base de KERATINA y CARBOCISTEINA, conocida por mantener la producción del colágeno. Actúa en la superficie de la cutícula capilar ELIMINANDO EL FRIZZ Y EL VOLUMEN.\r\n           ', 'keratina_lisstyle_', 'http://tiendo.co/img/products/2014-08-19-20-08-37-Pwn4R3uCFXnO3-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(146, 141, 'MASCARILLA CAPILAR INTENSIVA ARGAN', 2, 'La Mascarilla Hidratante Intensiva de L´mar es un Tratamiento EXTRA ACONDICIONADOR enriquecido con ARGAN EXTRA VIRGEN que hidrata, acondiciona profundamente y repara el cabello seco, maltratado y dañado inclusive por procesos químicos.', 'mascarilla_capilar_intensiva_argan', 'http://tiendo.co/img/products/2014-08-19-21-08-45-vg6fMS59LvU1Q-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(147, 142, 'CREMA PARA PEINAR ARGAN', 2, 'CREMA PARA PEINAR TRATAMIENTO CAPILAR RESTRUCTURANTE ARGAN', 'crema_para_peinar_argan', 'http://tiendo.co/img/products/2014-08-19-21-08-20-MhQJfCa8uQFxJ-', 1000, NULL, 90, '2015-04-09', '2015-04-09');
INSERT INTO `productos` (`id`, `id_mantis`, `pro_nom`, `categoria_id`, `descripcion`, `slug`, `img`, `precio`, `por_iva`, `cantidad`, `created_at`, `updated_at`) VALUES
(148, 143, 'SHAMPOO CON CERAMIDAS Y EXTRACTOS NATURALES', 2, ' Shampoos con Extractos Naturales de L´mar con PH balanceado, acondicionan y son ideales para el cuidado diario del cabello pues contienen la riqueza nutritiva de las plantas que ayudan a recuperar las propiedades naturales del cabello.', 'shampoo_con_ceramidas_y_extractos_naturales', 'http://tiendo.co/img/products/2014-08-19-22-08-14-oZ2ZvlIwc1kHL-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(149, 144, 'KERATIN REPAIR PLUS', 2, 'Tratamiento capilar reestructuraste con keratina y arginina proporcionando Nutrición,reparación,fortaleza y brillo  ', 'keratin_repair_plus', 'http://tiendo.co/img/products/2014-08-19-22-08-00-wtnkW8h76VmI4-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(150, 145, 'KERATIN REPAIR PLUS', 2, 'Tratamiento capilar reestructuraste con keratina y arginina proporcionando Nutrición,reparación,fortaleza y brillo  ', 'keratin_repair_plus', 'http://tiendo.co/img/products/2014-08-19-22-08-08-vjzO7CdXCIiNu-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(151, 146, 'KERATIN REPAIR', 2, 'Activa la producción de keratina, conservando la hidratación interna del cabello, desenredándolo fácilmente y recuperando el cuerpo, la suavidad, el brillo y la vitalidad. NO NECESITA ENJUAGUE, ÚNICA CON PROTECCIÓN SOLAR (FILTRO UV)\r\n', 'keratin_repair', 'http://tiendo.co/img/products/2014-08-19-22-08-16-pl8IAfO0FX3i3-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(152, 147, 'COCKTAIL REPOLARIZADORA', 2, 'Tratamiento capilar intensivo, reparador y reestructurado ', 'cocktail_repolarizadora', 'http://tiendo.co/img/products/2014-08-19-22-08-21-hxJ2yiLwGrG9v-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(153, 148, 'TRATAMIENTO SEMILLAS DE LINO', 2, 'El Tratamiento Capilar Texturizante con Semillas de Lino L´MAR Nutre, Hidrata, Restaura y Revitaliza el cabello.  contienen Ácido Linoleico y Vitamina E que devuelven la belleza al cabello tinturado y frágil.', 'tratamiento_semillas_de_lino', 'http://tiendo.co/img/products/2014-08-20-00-08-00-rgM8eeTz5iJri-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(154, 149, 'TINTE ALFAPARF MILANO', 2, 'MÁXIMA COBERTURA Y MÁXIMO PODER ACLARANTE\r\nreflejos del siempre Más Luminosos, brillantes, Fieles y Naturales\r\n', 'tinte_alfaparf_milano', 'http://tiendo.co/img/products/2014-08-20-22-08-55-oUdmFizVpOqLI-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(155, 150, 'TINTE ALFAPARF  COLOR WEAR', 2, '(tinte) Coloracion tono sobre tono sin Amoniaco', 'tinte_alfaparf_color_wear', 'http://tiendo.co/img/products/2014-08-20-22-08-35-jPHAyqIJvlsAW-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(156, 151, 'SHAMPOO SEMI DI LINO DIAMANTE ILLUMINATING', 2, 'Las texturas multisensoriales, a base de Extracto de Semillas de Lino, Vitamina E, Omega-3 y Omega-6, favorecen la cohesión de las cutículas, aportando al cabello una suavidad y brillo únicos.', 'shampoo_semi_di_lino_diamante_illuminating', 'http://tiendo.co/img/products/2014-08-20-22-08-56-ASW2X3qwY5ybl-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(157, 152, 'SHAMPOO MIDOLLO DI BAMBOO', 2, 'repara los daños más profundos regenerando la materia interna del cabello  devolviendo su  vigor, vitalidad y flexibilidad.', 'shampoo_midollo_di_bamboo', 'http://tiendo.co/img/products/2014-08-22-20-08-42-WWITtPuT6iuZY-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(158, 153, 'KIT MIDOLLO DI BAMBOO ', 2, 'Tratamiento Reestructurar para cabellos demasiado maltratado ', 'kit_midollo_di_bamboo_', 'http://tiendo.co/img/products/2014-08-22-20-08-08-kXsaFKwITBsyb-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(159, 154, 'KIT CIOCCOLATO', 2, 'Cioccolato es la nutrición esencial para el cabello muy seco y quebradizo. Un tratamiento completo a base de los beneficios del chocolate que recupera la salud del cabello con una deliciosa fragancia, extremamente hidratante, luminoso y suave', 'kit_cioccolato', 'http://tiendo.co/img/products/2014-08-22-20-08-10-j6SEUQiho9EHQ-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(160, 155, 'SHAMPOO CIOCCOLATO', 2, 'Shampoo suave de limpieza profunda. Ideal para recuperar la salud y el brillo de los cabellos quebradizos.', 'shampoo_cioccolato', 'http://tiendo.co/img/products/2014-08-22-21-08-59-qwQtBuuTCFLUn-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(161, 156, 'AMPOLLAS DIAMANTE SEMI DÍ LINO ALFAPARF AZUL Y ROSADA', 2, 'Tratamiento intensivo cierra la cutícula dando al cabello luminosidad y suavidad, aporta al cabello cuerpo, elasticidad y un gran brillo', 'ampollas_diamante_semi_di_lino_alfaparf_azul_y_rosada', 'http://tiendo.co/img/products/2014-08-22-21-08-22-5LGRaCIzzgXQq-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(162, 157, 'AMPOLLAS DIAMANTE SEMI DÍ LINO ALFAPARF AZUL Y ROSADA', 2, 'Tratamiento intensivo cierra la cutícula dando al cabello luminosidad y suavidad, aporta al cabello cuerpo, elasticidad y un gran brillo', 'ampollas_diamante_semi_di_lino_alfaparf_azul_y_rosada', 'http://tiendo.co/img/products/2014-08-22-21-08-15-aPVHdhlZsPB7z-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(163, 158, 'AGV K3 THE DONKEY', 1, 'El K-3 es uno de los clásicos más vendidos cascos de AGV. Su diseño deriva de la parte superior de la gama GP-Tech cascos, con lo que la mayoría de las últimas características avanzadas para este producto con un precio razonable. El casco de inspiración-line carrera maximiza el flujo de aire minimizando los niveles de ruido, mientras que el alerón de nuevo asegura la estabilidad a altas velocidades. El sistema de ventilación dispone de tres tomas frontales, y seis extractores posteriores y laterales, mientras que un protector de viento barbilla evitar turbulencias en el interior del casco. El K-3 está disponible en una increíble gama de colores , incluyendo los gráficos oficiales Valentino Rossi réplica , que se pueden personalizar con adicionales Viseras , en Polarizados , Iridium y arco iris de colores. Si usted desea actualizar a una más ligera y más resistente de fibra de vidrio cubierta exterior del K-4 EVO sería el yelmo de la elección.', 'agv_k3_the_donkey', 'http://tiendo.co/img/products/2014-08-23-15-08-32-UNa97RbHXiWHK-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(164, 159, 'AGV K3 ROSSI ICON', 1, 'El K-3 es uno de los clásicos más vendidos cascos de AGV. Su diseño deriva de la parte superior de la gama GP-Tech cascos, con lo que la mayoría de las últimas características avanzadas para este producto con un precio razonable. El casco de inspiración-line carrera maximiza el flujo de aire minimizando los niveles de ruido, mientras que el alerón de nuevo asegura la estabilidad a altas velocidades. El sistema de ventilación dispone de tres tomas frontales, y seis extractores posteriores y laterales, mientras que un protector de viento barbilla evitar turbulencias en el interior del casco.\r\n\r\nEl K-3 está disponible en una increíble gama de colores , incluyendo los gráficos oficiales Valentino Rossi réplica , que se pueden personalizar con adicionales Viseras , en Polarizados , Iridium y arco iris de colores.\r\n\r\nCon el fin de actualizar a una más ligera y más resistente compuesto de fibra de cáscara externa puede buscar la AGV K-4 EVO ', 'agv_k3_rossi_icon', 'http://tiendo.co/img/products/2014-08-23-15-08-07-9gP63UfOLKZ6m-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(165, 160, 'Botas Cartepillar', 1, 'Botas Cartepillar Cafe 15933', 'botas_cartepillar', 'http://tiendo.co/img/products/2014-08-25-16-08-34-nlR2vW0S2AYZT-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(166, 161, 'Botas Caterpillar', 1, 'Bota Caterpillar Amarilla 15830', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-22-Q5ucb1G6h5ROA-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(167, 162, 'Botas Caterpillar', 1, 'Bota Caterpillar Vast Mid 15832', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-16-XHgEb0QYxjigS-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(168, 163, 'Botas Caterpillar', 1, 'Bota Caterpillar Vast Mid 15833', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-30-yd2vO4CxmFxLJ-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(169, 164, 'Botas Caterpillar', 1, 'Bota Caterpillar 15932', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-33-NRI1dI2kkX49l-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(170, 165, 'Botas Caterpillar', 1, 'Bota Caterpillar 15553', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-40-voVPeObaKh5NN-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(171, 166, 'Botas Caterpillar', 1, 'Bota Caterpillar 15565', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-53-Xc2gbjDlFpCGH-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(172, 167, 'Botas Caterpillar', 1, 'Bota Caterpillar 15562', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-49-eFIHoQzEpVChq-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(173, 168, 'Botas Caterpillar', 1, 'Bota Caterpillar Lona Cafe 15571', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-44-ekjDEZ1IG7DOB-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(174, 169, 'Botas Caterpillar', 1, 'Bota Caterpillar 15561', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-46-rlke71TBUgC0e-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(175, 170, 'Botas Caterpillar', 1, 'Bota Caterpillar 15495', 'botas_caterpillar', 'http://tiendo.co/img/products/2014-08-25-16-08-08-QaNmv4vB1vS5B-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(176, 171, 'FUNDAMENTACION  MEDIOS TECNOLOGICOS', 5, 'Proporcionar los conceptos básicos indispensables para desempeñar las funciones de un operador de medios Tecnológicos en las áreas de seguridad electrónica de acuerdo a los adelantos tecnológicos del área. 100 Horas ', 'fundamentacion_medios_tecnologicos', 'http://tiendo.co/img/products/2014-08-25-21-08-26-9TNgxFckoaT73-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(177, 172, 'REDUCCION DE MEDIDAS', 2, 'Cavitación, Vacumterápia, Mesoterápia, termoterapia, crioterapia, masajes reductores, gimnasia pasiva, ultra sonido, auriculoterapia, asesoria nutricional, recomendaciones en casa.', 'reduccion_de_medidas', 'http://tiendo.co/img/products/2014-08-27-21-08-22-vWRPsNVccoxTr-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(178, 173, 'Zapatos Nike', 1, 'Zapato Nike Running Fitsole Negro Verde 16165', 'zapatos_nike', 'http://tiendo.co/img/products/2014-09-06-22-09-07-9QJ7bFKLqBdq2-', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(179, 174, 'Zapatos Sperry Top Sider', 1, 'Zapato Casual Cyclone Cafe', 'zapatos_sperry_top_sider', 'http://tiendo.co/img/products/2014-10-22-22-10-57-H4JNIFd3MFCCb.jpg', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(180, 175, 'Consola Playstation 4 500gb + 1 Control Dualshock 4 Original', 4, 'Playstation 4 original sellado de fabrica', 'consola_playstation_4_500gb__1_control_dualshock_4_original', 'http://tiendo.co/img/products/2014-11-02-03-11-41-V29EbXfFhnMy1.jpg', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(181, 176, 'Fifa 15 Ps4 Multilenguaje Español Latino Formato Físico', 4, 'FIFA 15 para play 4 original', 'fifa_15_ps4_multilenguaje_espanol_latino_formato_fisico', 'http://tiendo.co/img/products/2014-11-02-03-11-00-81fC01V5QWF14.jpg', 1000, NULL, 90, '2015-04-09', '2015-04-09'),
(182, 177, 'Chocolatina hershey', 7, 'deliciosa chocolatina blanca ', 'chocolatina_hershey', 'http://tiendo.co/img/products/2014-11-05-14-11-17-1M9A3mxvtz7DK.jpg', 1000, NULL, 90, '2015-04-09', '2015-04-09');

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

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id`, `titulo`, `descripcion`, `img`, `imgC`, `estado`, `valor`, `created_at`, `updated_at`) VALUES
(7, 'Nueva PPromo', 'esta es una nueva promo', 'img/promos/2015-04-21-22-04-40-Full-3f00K2CllcXDf.jpg', 'img/promos/crop/2015-04-21-22-04-40-Crop-2FUhcPYbhDXqq.jpg', 1, 25900, '2015-04-21', '2015-04-21'),
(8, 'guitarra sheeran', 'la guitarra de sheeran', 'img/promos/2015-04-21-22-04-11-Full-Vbt8lDRNI3Y5a.jpg', 'img/promos/crop/2015-04-21-22-04-11-Crop-0hJadCIK2gEAJ.jpg', 1, 1000000, '2015-04-21', '2015-04-21');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `remember_token`, `remember_pass`, `active`, `condiciones`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'ederalvarez2009@hotmail.com', '$2y$10$SvCL7dmsqRfImRzVbCllJeaxe//a9o1ATmqJbfF6VHW2zXFMCYVE2', 'SR4MkUeUWlpqyKiMRvwhIuzax8nMCKmupzG6ngPmSS05KHCRWq3qu4eDGO52', '', 1, 0, 0, '2014-11-28', '2015-02-28'),
(2, 'eder@tumegalopolis.com', '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', '2SaNzCgQpYmmaJuEj6Jcze7zLY6HXAcvI9XxlGUa2PAl4qHGNhbVQdf6TzJM', '', 1, 1, 0, '2015-01-03', '2015-01-03'),
(3, 'admin@admin.com', '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', 'rFvwdCwpfrLQtsWYp48c1EXbbdUuucIbZYMSdClWvW3moKPfvZ522edmqds3', '', 1, 1, 1, '0000-00-00', '2015-02-28'),
(4, 'usuario@gmail.com', '$2y$10$33Alb7WURkQ7priWift7aOi4gsMYke8J84N6yQgt6XlS2qZb0jFz6', '', '', 1, 1, 0, '2015-01-03', '2015-01-03'),
(8, 'demi@gmail.com', '$2y$10$R.tss0EpKJm6g4EOCSWGKu8P2BEjG8xx81UQ8gggJ70TR17bFTnmy', 'YeCA7rXpqvJqqSe19HMyOHmQn7urBxEEgm8v6m2YHZNo7sl5cekUbWzRjgrc', '', 1, 1, 0, '2015-01-08', '2015-01-19'),
(9, 'demi2@gmail.com', '$2y$10$4OWXwwa6r0GAkmnt9HP4UOqPONI./wuXrigUzfxwJuHJOhb4d7hre', '', '', 1, 1, 0, '2015-01-08', '2015-01-08'),
(10, 'missd@gmail.com', '$2y$10$9XyD3HlnXtaDw9slhcDMxuk6hVl7a7dTIgybQ8hM9CelYg.QDp62e', '', '', 1, 1, 0, '2015-01-15', '2015-01-15'),
(11, 'ivan@ivan.com', '$2y$10$CeUfFcav0ccjx0YXYfKAw.diHr/gvbNhPIDWDEugdSLQfRvv3Mi.W', '', '', 1, 1, 0, '2015-01-16', '2015-01-16'),
(12, 'demi3@gmail.com', '$2y$10$uP9HeH.akxLdy6CZuf1fye1pbj4bLMIW1YbXrIp6PmTJ4r4Sfcvva', 'oJReyFvzIiH7s47CgrbLsJeOZCkS7TEoyuVJzZqIzSHmF3bqk6qZr9Xrt6Wo', '', 1, 1, 0, '2015-02-24', '2015-02-24'),
(13, 'eder2@gmail.com', '$2y$10$7b/KWr/UUf9RwwboS5crJuiJo/McYYvE8LSoiLSudFlnwUXjz7AaG', 'PDcx3lsFOVTJES0fdTeQoSiM9wNantrXhnw6QwQmKfwj4Ysnu7NSN2kyYj6u', '', 1, 1, 0, '2015-03-04', '2015-03-05'),
(14, 'Juan@gmail.com', '$2y$10$Csqhy0Q1dm4A0MsuyqLNcOdnuT7t54FzuM92sgA52DHqBdEa4Akl6', 'di7N7C2MmrnbcPjhIXbetV33Oc6nNvNcVKQjeS9lOBUTawXCtcyUun0I5G8Q', '', 1, 1, 0, '2015-03-05', '2015-03-05'),
(15, 'pedro@gmail.com', '$2y$10$x4kWOW4u6hPusfJ43FHoxe778/TevWfieqmvXO2GWjqjU16QXEJjK', '', '', 1, 1, 0, '2015-03-05', '2015-03-05'),
(16, 'lovato@gmail.com', '$2y$10$xveYyTM8eZe0mjwMnTwZieHT2xtf5mgWnm3cA0cCw3C.cpdCq97Eq', '2GiFiaHrq3Xq0SLMT9HplP2HTLXqBmqplJ0GmCUTzST2Dz4k2LJO2Xw9tLzu', '', 1, 1, 0, '2015-04-06', '2015-04-06');

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
  `cedula` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombre_negocio` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `canal` int(11) DEFAULT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `comentarios` text COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `user_datos`
--

INSERT INTO `user_datos` (`id`, `user_id`, `barrio_id`, `nombre`, `apellido`, `cedula`, `nombre_negocio`, `ciudad`, `canal`, `direccion`, `telefono`, `comentarios`, `created_at`, `updated_at`) VALUES
(3, 9, 4, 'Ederyyy', 'Julianyy', NULL, NULL, NULL, NULL, 'calle 17 #3w-65 miraflores torre 36 apto 11-37yyyyy', '30131191986777', 'eafbgadhnbnshhrethwhet', '2015-01-09', '2015-01-09'),
(4, 8, 3, 'demi', 'lovato', '11023656748', 'lovatics', 1, 0, 'calle 39 # 20-39 piso 2', '44444', 'comment', '2015-01-10', '2015-02-24'),
(5, 10, 4, 'Miss', 'D', NULL, NULL, NULL, NULL, 'carrera 9 #45878', '36585215', 'wñlmck{wnco', '2015-01-15', '2015-01-15'),
(6, 11, 3, 'ivan', 'rojas', NULL, NULL, NULL, NULL, 'carrera 9 #45878', '6658585', 'jn jknjcds', '2015-01-16', '2015-01-16'),
(7, 3, 3, 'Eder', 'Alvarez', '11023656748', 'Eder Alvarez', 3, 0, 'calle 39 # 20-39 piso 2', '3013119198', 'Mis comentarios de envío', '2015-02-23', '2015-03-27'),
(8, 12, 2, 'Demi', 'Lovato', '11023656748', 'lovatics', 2, 0, 'calle 39 # 20-39 piso 2', '56644', 'mis commments', '2015-02-24', '2015-02-24'),
(9, 1, 2, 'Eder', 'Alvarez', '11023656748', 'Eder Alvarez', 1, 0, 'calle 39 # 20-39 piso 2', '3013119198', 'Mis comentarios', '2015-02-28', '2015-02-28'),
(10, 13, 1, 'Eder', 'Alvarez', '11023656748', 'wizards', 1, 0, 'carrera 24 # 18-76, Bucaramanga, Santander, Colombia', '6545342', 'mas tarde', '2015-03-04', '2015-03-04'),
(12, 14, 6, 'Juan', 'Cuadrado', '11023656748', 'Ras tas tas', 4, 0, 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '3013119195', 'ddwwdwdw', '2015-03-05', '2015-03-05'),
(13, 15, 1, 'Pedro', 'Franco', '11023656748', 'colombia', 1, 0, 'calle 39 # 20-39 piso 2', '3013119198', 'dwdededwmlwmlñw', '2015-03-05', '2015-03-05'),
(14, 16, 4, 'Demi', 'Lovato', '1232654543', 'Lovatics', 1, 0, 'carrera 24 # 18-76, Bucaramanga, Santander, Colombia', '65544334', 'mrfkrmfkrmfkrmfrk', '2015-04-06', '2015-04-06');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
