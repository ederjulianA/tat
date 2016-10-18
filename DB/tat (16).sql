-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2016 a las 20:52:58
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
-- Estructura de tabla para la tabla `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `pos` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `titulo`, `img`, `pos`, `activo`, `created_at`, `updated_at`) VALUES
(7, 'Cootracolta supermercado', 'cot/img/slider/2016-09-26-22-F2wDkZsp3sUsB-banner1.jpg', 2, 1, '2016-09-26', '2016-10-05');

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
  `InvGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cat_nom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `cat_slug` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `InvSubGruId` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `InvSubGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=294 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `InvGruCod`, `cat_nom`, `cat_slug`, `img`, `created_at`, `updated_at`, `InvSubGruId`, `InvSubGruCod`) VALUES
(1, '5', 'PILAS', 'pilas', NULL, '2016-09-10', '2016-10-16', 'F-PI', '122'),
(2, '12', 'DISFRACES', 'disfraces', NULL, '2016-09-10', '2016-10-16', 'V-DI', '250'),
(3, '3', 'CHORIZOS', 'chorizos', NULL, '2016-09-10', '2016-10-16', 'C-CH', '85'),
(4, '12', 'CAMISETA NIÐO', 'camiseta-nido', NULL, '2016-09-10', '2016-10-16', 'V-KN', '241'),
(5, '12', 'CAMISETA HOMBRE', 'camiseta-hombre', NULL, '2016-09-10', '2016-10-16', 'V-KH', '240'),
(6, '12', 'FU-ROGERIO', 'fu-rogerio', NULL, '2016-09-10', '2016-10-16', 'V-FU', '255'),
(7, '12', 'MEDIAS TALLA GENERAL', 'medias-talla-general', NULL, '2016-09-10', '2016-10-16', 'V-MG', '264'),
(8, '12', 'ENAGUAS', 'enaguas', NULL, '2016-09-10', '2016-10-16', 'V-EN', '251'),
(9, '1', 'ALIMENTOS ANIMALES', 'alimentos-animales', NULL, '2016-09-10', '2016-09-10', 'A-AA', '3'),
(10, '5', 'ACEITES', 'aceites', NULL, '2016-09-10', '2016-10-16', 'F-AC', '117'),
(11, '11', 'CEPILLOS BETUN', 'cepillos-betun', NULL, '2016-09-10', '2016-10-16', 'U-CB', '192'),
(12, '12', 'BLUSA', 'blusa', NULL, '2016-09-10', '2016-10-16', 'V-LU', '232'),
(13, '1', 'ACEITES', 'aceites', NULL, '2016-09-10', '2016-09-10', 'A-AC', '1'),
(14, '7', 'BOLSOS DEPORTIVOS', 'bolsos-deportivos', NULL, '2016-09-10', '2016-10-16', 'K-BO', '142'),
(15, '5', 'ARTICULO DE ASEO PARA VEHICULOS', 'articulo-de-aseo-para-vehiculos', NULL, '2016-09-10', '2016-10-16', 'F-AV', '118'),
(16, '9', 'CAPSULA SUAVIZANTE', 'capsula-suavizante', NULL, '2016-09-10', '2016-10-16', 'P-CJ', '161'),
(17, '11', 'BETUNES', 'betunes', NULL, '2016-09-10', '2016-10-16', 'U-BE', '190'),
(18, '2', 'ACEITE DESMAQUILLADOR DE OJOS', 'aceite-desmaquillador-de-ojos', NULL, '2016-09-10', '2016-09-10', 'B-AD', '38'),
(19, '4', 'BRANDY', 'brandy', NULL, '2016-09-10', '2016-10-16', 'E-BR', '105'),
(20, '6', 'CERAS', 'ceras', NULL, '2016-09-10', '2016-10-16', 'H-CE', '126'),
(21, '1', 'AROMATICAS', 'aromaticas', NULL, '2016-09-10', '2016-09-10', 'A-AM', '4'),
(22, '8', 'JUGUETERIA', 'jugueteria', NULL, '2016-09-10', '2016-10-16', 'O-JU', '157'),
(23, '3', 'ALIMENTOS PREPARADOS', 'alimentos-preparados', NULL, '2016-09-10', '2016-09-10', 'C-AP', '82'),
(24, '11', 'BU-ROGERIO', 'bu-rogerio', NULL, '2016-09-10', '2016-10-16', 'U-BU', '191'),
(25, '1', 'ARROZ', 'arroz', NULL, '2016-09-10', '2016-09-10', 'A-AR', '5'),
(26, '1', 'ADEREZOS Y SALSAS', 'aderezos-y-salsas', NULL, '2016-09-10', '2016-09-10', 'A-AS', '2'),
(27, '3', 'AVENAS LIQUIDAS', 'avenas-liquidas', NULL, '2016-09-10', '2016-09-10', 'C-AV', '83'),
(28, '12', 'BERMUDAS', 'bermudas', NULL, '2016-09-10', '2016-10-16', 'V-BE', '231'),
(29, '1', 'AZUCAR', 'azucar', NULL, '2016-09-10', '2016-09-10', 'A-AZ', '6'),
(30, '5', 'BOMBILLOS Y LAMPARAS', 'bombillos-y-lamparas', NULL, '2016-09-10', '2016-10-16', 'F-BL', '119'),
(31, '12', 'CAMISA', 'camisa', NULL, '2016-09-10', '2016-10-16', 'V-1A', '238'),
(32, '12', 'TELAS', 'telas', NULL, '2016-09-10', '2016-10-16', 'V-TS', '284'),
(33, '11', 'CEPILLOS ROPA', 'cepillos-ropa', NULL, '2016-09-10', '2016-10-16', 'U-CR', '193'),
(34, '12', 'BODY', 'body', NULL, '2016-09-10', '2016-10-16', 'V-BO', '234'),
(35, '2', 'BARRAS EMOLIENTES', 'barras-emolientes', NULL, '2016-09-10', '2016-09-10', 'B-BE', '39'),
(36, '7', 'CASSETTES', 'cassettes', NULL, '2016-09-10', '2016-10-16', 'K-CS', '143'),
(37, '1', 'BEBIDAS INSTANTANEAS', 'bebidas-instantaneas', NULL, '2016-09-10', '2016-09-10', 'A-BI', '7'),
(38, '5', 'GANCHOS Y PERCHEROS', 'ganchos-y-percheros', NULL, '2016-09-10', '2016-10-16', 'F-GP', '120'),
(39, '12', 'BUSO', 'buso', NULL, '2016-09-10', '2016-10-16', 'V-BU', '236'),
(40, '2', 'BASES DE MAQUILLAJE', 'bases-de-maquillaje', NULL, '2016-09-10', '2016-09-10', 'B-BM', '40'),
(41, '7', 'COLORES', 'colores', NULL, '2016-09-10', '2016-10-16', 'K-CO', '144'),
(42, '4', 'CERVEZA', 'cerveza', NULL, '2016-09-10', '2016-10-16', 'E-CE', '106'),
(43, '12', 'CALZADO', 'calzado', NULL, '2016-09-10', '2016-10-16', 'V-1C', '237'),
(44, '9', 'CEPILLOS DENTAL, SEDAS', 'cepillos-dental-sedas', NULL, '2016-09-10', '2016-10-16', 'P-CD', '162'),
(45, '11', 'COBIJAS', 'cobijas', NULL, '2016-09-10', '2016-10-16', 'U-CJ', '194'),
(46, '2', 'BRONCEADORES', 'bronceadores', NULL, '2016-09-10', '2016-09-10', 'B-BR', '41'),
(47, '12', 'CAMISETA', 'camiseta', NULL, '2016-09-10', '2016-10-16', 'V-KM', '239'),
(48, '9', 'CREMAS DEPILATORIAS', 'cremas-depilatorias', NULL, '2016-09-10', '2016-10-16', 'P-CR', '169'),
(49, '11', 'TAPETES', 'tapetes', NULL, '2016-09-10', '2016-10-16', 'U-TA', '219'),
(50, '12', 'CONJUNTO', 'conjunto', NULL, '2016-09-10', '2016-10-16', 'V-1N', '248'),
(51, '1', 'CAFE', 'cafe', NULL, '2016-09-10', '2016-09-10', 'A-CA', '8'),
(52, '2', 'ESPUMAS DE BELLEZA', 'espumas-de-belleza', NULL, '2016-09-10', '2016-09-10', 'B-CA', '56'),
(53, '3', 'CABANOS', 'cabanos', NULL, '2016-09-10', '2016-09-10', 'C-CA', '84'),
(54, '11', 'CORTINAS', 'cortinas', NULL, '2016-09-10', '2016-10-16', 'U-CT', '195'),
(55, '12', 'ESTUCHE INFANTIL', 'estuche-infantil', NULL, '2016-09-10', '2016-10-16', 'V-1E', '252'),
(56, '2', 'CREMA MANO Y CUERPO', 'crema-mano-y-cuerpo', NULL, '2016-09-10', '2016-09-10', 'B-CC', '45'),
(57, '1', 'CALDOS, SOPAS Y CREMAS', 'caldos-sopas-y-cremas', NULL, '2016-09-10', '2016-09-10', 'A-CC', '9'),
(58, '9', 'COLONIAS Y LOCIONES', 'colonias-y-lociones', NULL, '2016-09-10', '2016-10-16', 'P-CL', '164'),
(59, '2', 'CREMAS, CERAS, DEPILAR', 'cremas-ceras-depilar', NULL, '2016-09-10', '2016-09-10', 'B-CD', '52'),
(60, '4', 'CHAMPAÐA', 'champada', NULL, '2016-09-10', '2016-10-16', 'E-CH', '107'),
(61, '6', 'DESINFECTANTES', 'desinfectantes', NULL, '2016-09-10', '2016-10-16', 'H-DE', '128'),
(62, '9', 'CREMA, OTROS AFEITAR', 'crema-otros-afeitar', NULL, '2016-09-10', '2016-10-16', 'P-CA', '167'),
(63, '2', 'CREMA, LECHE, LIMPIAR', 'crema-leche-limpiar', NULL, '2016-09-10', '2016-09-10', 'B-CE', '47'),
(64, '1', 'CONFITERIA', 'confiteria', NULL, '2016-09-10', '2016-09-10', 'A-CF', '13'),
(65, '1', 'CHOCOLATE', 'chocolate', NULL, '2016-09-10', '2016-09-10', 'A-CH', '11'),
(66, '6', 'ESCOBAS', 'escobas', NULL, '2016-09-10', '2016-10-16', 'H-ES', '129'),
(67, '12', 'CICLISTA', 'ciclista', NULL, '2016-09-10', '2016-10-16', 'V-1I', '247'),
(68, '2', 'CREMAS HIDRATANTES', 'cremas-hidratantes', NULL, '2016-09-10', '2016-09-10', 'B-CH', '49'),
(69, '3', 'GELATINA FLANES PREPADOS', 'gelatina-flanes-prepados', NULL, '2016-09-10', '2016-10-16', 'C-GF', '86'),
(70, '1', 'CEREAL INSTANTANEO', 'cereal-instantaneo', NULL, '2016-09-10', '2016-09-10', 'A-CI', '10'),
(71, '4', 'COCTELES', 'cocteles', NULL, '2016-09-10', '2016-10-16', 'E-CO', '109'),
(72, '11', 'CUBRELECHOS', 'cubrelechos', NULL, '2016-09-10', '2016-10-16', 'U-CL', '197'),
(73, '9', 'CEPILLOS Y PEINILLAS', 'cepillos-y-peinillas', NULL, '2016-09-10', '2016-10-16', 'P-CP', '163'),
(74, '2', 'CAPSULA DE JUVENTUD', 'capsula-de-juventud', NULL, '2016-09-10', '2016-09-10', 'B-CJ', '42'),
(75, '9', 'CREMA MANO Y CUERPO', 'crema-mano-y-cuerpo', NULL, '2016-09-10', '2016-10-16', 'P-CM', '166'),
(76, '11', 'ELECTRODOMESTICOS', 'electrodomesticos', NULL, '2016-09-10', '2016-10-16', 'U-EL', '200'),
(77, '2', 'COLONIAS', 'colonias', NULL, '2016-09-10', '2016-09-10', 'B-CL', '43'),
(78, '9', 'CREMAS DENTALES', 'cremas-dentales', NULL, '2016-09-10', '2016-10-16', 'P-CT', '168'),
(79, '2', 'CORRECTOR MAQUILLAJE', 'corrector-maquillaje', NULL, '2016-09-10', '2016-09-10', 'B-CM', '44'),
(80, '4', 'CREMAS', 'cremas', NULL, '2016-09-10', '2016-10-16', 'E-CR', '110'),
(81, '1', 'CONDIMENTOS', 'condimentos', NULL, '2016-09-10', '2016-09-10', 'A-CO', '12'),
(82, '7', 'ESTILOGRAFOS', 'estilografos', NULL, '2016-09-10', '2016-10-16', 'K-ES', '146'),
(83, '2', 'CREMAS PARA OJOS', 'cremas-para-ojos', NULL, '2016-09-10', '2016-09-10', 'B-CO', '51'),
(84, '6', 'CHUPAS', 'chupas', NULL, '2016-09-10', '2016-10-16', 'H-CH', '127'),
(85, '9', 'CREMA HUMECTANTE', 'crema-humectante', NULL, '2016-09-10', '2016-10-16', 'P-CE', '165'),
(86, '12', 'CORBATAS', 'corbatas', NULL, '2016-09-10', '2016-10-16', 'V-CB', '249'),
(87, '4', 'GINEBRA', 'ginebra', NULL, '2016-09-10', '2016-10-16', 'E-GI', '111'),
(88, '9', 'DESECHABLES', 'desechables', NULL, '2016-09-10', '2016-10-16', 'P-DS', '171'),
(89, '11', 'CUBIERTOS', 'cubiertos', NULL, '2016-09-10', '2016-10-16', 'U-CU', '196'),
(90, '2', 'CREMA PARA ROSTRO', 'crema-para-rostro', NULL, '2016-09-10', '2016-09-10', 'B-CR', '46'),
(91, '1', 'CONSERVAS', 'conservas', NULL, '2016-09-10', '2016-09-10', 'A-CS', '14'),
(92, '7', 'CUADERNOS', 'cuadernos', NULL, '2016-09-10', '2016-10-16', 'K-CU', '145'),
(93, '2', 'CREMAS DESMAQUILLADORA', 'cremas-desmaquilladora', NULL, '2016-09-10', '2016-09-10', 'B-CS', '48'),
(94, '9', 'CUCHILLAS DE AFEITAR', 'cuchillas-de-afeitar', NULL, '2016-09-10', '2016-10-16', 'P-CU', '170'),
(95, '11', 'DESECHABLES', 'desechables', NULL, '2016-09-10', '2016-10-16', 'U-DE', '198'),
(96, '2', 'CREMAS NUTRITIVAS', 'cremas-nutritivas', NULL, '2016-09-10', '2016-09-10', 'B-CT', '50'),
(97, '7', 'LAPICEROS', 'lapiceros', NULL, '2016-09-10', '2016-10-16', 'K-LA', '147'),
(98, '9', 'DESODORANTES', 'desodorantes', NULL, '2016-09-10', '2016-10-16', 'P-DE', '172'),
(99, '11', 'DROGUERIA', 'drogueria', NULL, '2016-09-10', '2016-10-16', 'U-DR', '199'),
(100, '6', 'ESPONJILLAS', 'esponjillas', NULL, '2016-09-10', '2016-10-16', 'H-EP', '130'),
(101, '11', 'FUNDAS', 'fundas', NULL, '2016-09-10', '2016-10-16', 'U-FU', '201'),
(102, '9', 'ESTUCHES', 'estuches', NULL, '2016-09-10', '2016-10-16', 'P-ES', '174'),
(103, '2', 'DELINEADORES', 'delineadores', NULL, '2016-09-10', '2016-09-10', 'B-DE', '53'),
(104, '12', 'FAJA  TALLA UNICA', 'faja-talla-unica', NULL, '2016-09-10', '2016-10-16', 'V-FJ', '253'),
(105, '12', 'BLUSAS', 'blusas', NULL, '2016-09-10', '2016-10-16', 'V-BL', '233'),
(106, '11', 'GUANTES Y GORROS', 'guantes-y-gorros', NULL, '2016-09-10', '2016-10-16', 'U-GG', '202'),
(107, '9', 'ENJUAGUES BUCALES', 'enjuagues-bucales', NULL, '2016-09-10', '2016-10-16', 'P-EB', '173'),
(108, '2', 'DESODORANTES', 'desodorantes', NULL, '2016-09-10', '2016-09-10', 'B-DT', '54'),
(109, '1', 'DULCES', 'dulces', NULL, '2016-09-10', '2016-09-10', 'A-DU', '15'),
(110, '1', 'EMPAQUE COOTRACOLTA', 'empaque-cootracolta', NULL, '2016-09-10', '2016-09-10', 'A-EC', '16'),
(111, '9', 'GEL REVITALIZADOR', 'gel-revitalizador', NULL, '2016-09-10', '2016-10-16', 'P-GE', '175'),
(112, '1', 'ENLATADOS CON CARNE Y VERDURA', 'enlatados-con-carne-y-verdura', NULL, '2016-09-10', '2016-09-10', 'A-EL', '18'),
(113, '2', 'ESMALTE, ENDURECEDOR', 'esmalte-endurecedor', NULL, '2016-09-10', '2016-09-10', 'B-EE', '55'),
(114, '1', 'ENCURTIDOS', 'encurtidos', NULL, '2016-09-10', '2016-09-10', 'A-EN', '17'),
(115, '11', 'JABONERAS', 'jaboneras', NULL, '2016-09-10', '2016-10-16', 'U-JA', '203'),
(116, '6', 'JABONES', 'jabones', NULL, '2016-09-10', '2016-10-16', 'H-JA', '132'),
(117, '2', 'ESTUCHE PERFUMERIA', 'estuche-perfumeria', NULL, '2016-09-10', '2016-09-10', 'B-EP', '57'),
(118, '12', 'FALDA ESTILOS', 'falda-estilos', NULL, '2016-09-10', '2016-10-16', 'V-FA', '254'),
(119, '6', 'INSECTICIDAS REPELENTES', 'insecticidas-repelentes', NULL, '2016-09-10', '2016-10-16', 'H-IR', '131'),
(120, '11', 'ARTICULOS PARA BEBE', 'articulos-para-bebe', NULL, '2016-09-10', '2016-10-16', 'U-AB', '189'),
(121, '7', 'LIBROS ANIMADO', 'libros-animado', NULL, '2016-09-10', '2016-10-16', 'K-LN', '148'),
(122, '9', 'JABON BAÐO Y TOCADOR', 'jabon-bado-y-tocador', NULL, '2016-09-10', '2016-10-16', 'P-JB', '176'),
(123, '11', 'JUEGOS DE BAÐO', 'juegos-de-bado', NULL, '2016-09-10', '2016-10-16', 'U-JB', '204'),
(124, '12', 'HK-ROGERIO', 'hk-rogerio', NULL, '2016-09-10', '2016-10-16', 'V-HK', '257'),
(125, '1', 'FECULA', 'fecula', NULL, '2016-09-10', '2016-09-10', 'A-FE', '19'),
(126, '12', 'GG-ROGERIO', 'gg-rogerio', NULL, '2016-09-10', '2016-10-16', 'V-GG', '256'),
(127, '12', 'HM-ROGERIO', 'hm-rogerio', NULL, '2016-09-10', '2016-10-16', 'V-HM', '258'),
(128, '1', 'FRUVER', 'fruver', NULL, '2016-09-10', '2016-09-10', 'A-FV', '20'),
(129, '1', 'GALLETAS', 'galletas', NULL, '2016-09-10', '2016-09-10', 'A-GA', '21'),
(130, '1', 'GELATINA, FLAN, PUDIN, HELADO', 'gelatina-flan-pudin-helado', NULL, '2016-09-10', '2016-09-10', 'A-GE', '23'),
(131, '9', 'OTROS ASEO PERSONAL', 'otros-aseo-personal', NULL, '2016-09-10', '2016-10-16', 'P-OT', '177'),
(132, '12', 'PANTY INFANTIL', 'panty-infantil', NULL, '2016-09-10', '2016-10-16', 'V-PI', '275'),
(133, '2', 'GEL  HUMECTANTE', 'gel-humectante', NULL, '2016-09-10', '2016-09-10', 'B-GE', '58'),
(134, '3', 'HELADOS', 'helados', NULL, '2016-09-10', '2016-10-16', 'C-HE', '87'),
(135, '11', 'LIMPIONES', 'limpiones', NULL, '2016-09-10', '2016-10-16', 'U-LI', '205'),
(136, '5', 'PEGANTES', 'pegantes', NULL, '2016-09-10', '2016-10-16', 'F-PE', '121'),
(137, '12', 'INTERIOR HOMBRE', 'interior-hombre', NULL, '2016-09-10', '2016-10-16', 'V-IH', '259'),
(138, '4', 'RON', 'ron', NULL, '2016-09-10', '2016-10-16', 'E-RO', '112'),
(139, '1', 'GASEOSAS', 'gaseosas', NULL, '2016-09-10', '2016-09-10', 'A-GS', '22'),
(140, '1', 'HARINAS', 'harinas', NULL, '2016-09-10', '2016-09-10', 'A-HA', '24'),
(141, '3', 'JAMON', 'jamon', NULL, '2016-09-10', '2016-10-16', 'C-JA', '88'),
(142, '12', 'INTERIORES', 'interiores', NULL, '2016-09-10', '2016-10-16', 'V-IN', '260'),
(143, '1', 'HUEVOS', 'huevos', NULL, '2016-09-10', '2016-09-10', 'A-HU', '25'),
(144, '12', 'MAMELUCO', 'mameluco', NULL, '2016-09-10', '2016-10-16', 'V-1M', '261'),
(145, '8', 'OTROS VARIOS', 'otros-varios', NULL, '2016-09-10', '2016-10-16', 'O-OT', '158'),
(146, '12', 'MEDIAS HOMBRE', 'medias-hombre', NULL, '2016-09-10', '2016-10-16', 'V-MH', '262'),
(147, '12', 'MEDIAS NIÐO', 'medias-nido', NULL, '2016-09-10', '2016-10-16', 'V-MN', '263'),
(148, '1', 'INGREDIENTES DE PANADERIA', 'ingredientes-de-panaderia', NULL, '2016-09-10', '2016-09-10', 'A-IP', '26'),
(149, '11', 'MANTELES, INDIVIDUALES', 'manteles-individuales', NULL, '2016-09-10', '2016-10-16', 'U-MI', '206'),
(150, '6', 'LIMPIADORES', 'limpiadores', NULL, '2016-09-10', '2016-10-16', 'H-LI', '133'),
(151, '6', 'LIMPIDOS Y SUAVISANTES', 'limpidos-y-suavisantes', NULL, '2016-09-10', '2016-10-16', 'H-LS', '134'),
(152, '12', 'ROPA BEBE', 'ropa-bebe', NULL, '2016-09-10', '2016-10-16', 'V-BB', '281'),
(153, '3', 'JAMONADA', 'jamonada', NULL, '2016-09-10', '2016-10-16', 'C-JM', '89'),
(154, '2', 'JABON COSMETICOS', 'jabon-cosmeticos', NULL, '2016-09-10', '2016-09-10', 'B-JC', '59'),
(155, '3', 'KUMIS', 'kumis', NULL, '2016-09-10', '2016-10-16', 'C-KU', '91'),
(156, '3', 'JUGOS Y REFRESCOS', 'jugos-y-refrescos', NULL, '2016-09-10', '2016-10-16', 'C-JR', '90'),
(157, '9', 'ACEITES', 'aceites', NULL, '2016-09-10', '2016-10-16', 'P-AC', '159'),
(158, '12', 'CAMISETILLA NIÐO', 'camisetilla-nido', NULL, '2016-09-10', '2016-10-16', 'V-CN', '243'),
(159, '12', 'CAMISETILLA T16', 'camisetilla-t16', NULL, '2016-09-10', '2016-10-16', 'V-CA', '245'),
(160, '12', 'CAMISETAS', 'camisetas', NULL, '2016-09-10', '2016-10-16', 'V-KI', '242'),
(161, '2', 'KIT DE MAQUILLAJE', 'kit-de-maquillaje', NULL, '2016-09-10', '2016-09-10', 'B-KM', '60'),
(162, '3', 'LECHES', 'leches', NULL, '2016-09-10', '2016-10-16', 'C-LE', '92'),
(163, '7', 'LONCHERAS', 'loncheras', NULL, '2016-09-10', '2016-10-16', 'K-LO', '149'),
(164, '1', 'LACTEOS', 'lacteos', NULL, '2016-09-10', '2016-09-10', 'A-LA', '27'),
(165, '2', 'LOCION ASTRINGENTE Y HUMECTANTE', 'locion-astringente-y-humectante', NULL, '2016-09-10', '2016-09-10', 'B-LA', '65'),
(166, '2', 'LAPIZ DELINEAR CEJAS', 'lapiz-delinear-cejas', NULL, '2016-09-10', '2016-09-10', 'B-LC', '62'),
(167, '3', 'MANTEQUILLAS', 'mantequillas', NULL, '2016-09-10', '2016-10-16', 'C-MA', '93'),
(168, '6', 'OTROS ARTICULOS DEL HOGAR', 'otros-articulos-del-hogar', NULL, '2016-09-10', '2016-10-16', 'H-OT', '135'),
(169, '11', 'OLLAS', 'ollas', NULL, '2016-09-10', '2016-10-16', 'U-OL', '208'),
(170, '2', 'LAPIZ DELINEAR LABIOS', 'lapiz-delinear-labios', NULL, '2016-09-10', '2016-09-10', 'B-LL', '63'),
(171, '7', 'MINAS', 'minas', NULL, '2016-09-10', '2016-10-16', 'K-MI', '150'),
(172, '7', 'OTROS PAPELERIA', 'otros-papeleria', NULL, '2016-09-10', '2016-10-16', 'K-OT', '151'),
(173, '2', 'LAPIZ DELINEAR OJOS', 'lapiz-delinear-ojos', NULL, '2016-09-10', '2016-09-10', 'B-LO', '64'),
(174, '2', 'LOCIONES PERFUMADAS', 'lociones-perfumadas', NULL, '2016-09-10', '2016-09-10', 'B-LP', '66'),
(175, '6', 'PALOS', 'palos', NULL, '2016-09-10', '2016-10-16', 'H-PA', '136'),
(176, '2', 'LABIALES', 'labiales', NULL, '2016-09-10', '2016-09-10', 'B-LS', '61'),
(177, '6', 'CEPILLOS DE LIMPIEZA', 'cepillos-de-limpieza', NULL, '2016-09-10', '2016-10-16', 'H-CP', '125'),
(178, '12', 'BRASIERES', 'brasieres', NULL, '2016-09-10', '2016-10-16', 'V-BA', '235'),
(179, '2', 'MASCARILLAS', 'mascarillas', NULL, '2016-09-10', '2016-09-10', 'B-MA', '67'),
(180, '1', 'MAYONESAS', 'mayonesas', NULL, '2016-09-10', '2016-09-10', 'A-MA', '28'),
(181, '3', 'MARGARINAS', 'margarinas', NULL, '2016-09-10', '2016-10-16', 'C-MG', '94'),
(182, '2', 'MOTAS DESMAQUILLANTE', 'motas-desmaquillante', NULL, '2016-09-10', '2016-09-10', 'B-MD', '68'),
(183, '12', 'NM-ROGERIO', 'nm-rogerio', NULL, '2016-09-10', '2016-10-16', 'V-NM', '267'),
(184, '3', 'MORTADELA', 'mortadela', NULL, '2016-09-10', '2016-10-16', 'C-MO', '95'),
(185, '12', 'MEDIAS TALLA UNICA', 'medias-talla-unica', NULL, '2016-09-10', '2016-10-16', 'V-MU', '265'),
(186, '11', 'OTROS UTILES DEL HOGAR', 'otros-utiles-del-hogar', NULL, '2016-09-10', '2016-10-16', 'U-OT', '209'),
(187, '7', 'PLIEGOS DE PAPEL', 'pliegos-de-papel', NULL, '2016-09-10', '2016-10-16', 'K-PP', '152'),
(188, '11', 'PAPEL ALUMINIO', 'papel-aluminio', NULL, '2016-09-10', '2016-10-16', 'U-PA', '210'),
(189, '3', 'OTROS CONGELADOS', 'otros-congelados', NULL, '2016-09-10', '2016-10-16', 'C-OT', '96'),
(190, '12', 'OVEROL', 'overol', NULL, '2016-09-10', '2016-10-16', 'V-OV', '268'),
(191, '1', 'NECTARES', 'nectares', NULL, '2016-09-10', '2016-09-10', 'A-NE', '29'),
(192, '12', 'PANTALON', 'pantalon', NULL, '2016-09-10', '2016-10-16', 'V-PN', '269'),
(193, '12', 'PANTALON BEBE', 'pantalon-bebe', NULL, '2016-09-10', '2016-10-16', 'V-PB', '270'),
(194, '9', 'PRODUCTOS DE BEBE', 'productos-de-bebe', NULL, '2016-09-10', '2016-10-16', 'P-PB', '179'),
(195, '6', 'PAÐOS DE LIMPIEZA', 'pados-de-limpieza', NULL, '2016-09-10', '2016-10-16', 'H-PL', '137'),
(196, '11', 'PLASTICOS', 'plasticos', NULL, '2016-09-10', '2016-10-16', 'U-PS', '211'),
(197, '7', 'REVISTAS', 'revistas', NULL, '2016-09-10', '2016-10-16', 'K-RV', '153'),
(198, '9', 'BRONCEADORES', 'bronceadores', NULL, '2016-09-10', '2016-10-16', 'P-BR', '160'),
(199, '9', 'PRODUCTOS PARA CABELLO', 'productos-para-cabello', NULL, '2016-09-10', '2016-10-16', 'P-PC', '180'),
(200, '11', 'PLATOS', 'platos', NULL, '2016-09-10', '2016-10-16', 'U-PL', '212'),
(201, '1', 'OTROS ABARROTES', 'otros-abarrotes', NULL, '2016-09-10', '2016-09-10', 'A-OT', '30'),
(202, '3', 'PESCADOS', 'pescados', NULL, '2016-09-10', '2016-10-16', 'C-PE', '97'),
(203, '6', 'RECOGEDORES', 'recogedores', NULL, '2016-09-10', '2016-10-16', 'H-RE', '138'),
(204, '12', 'PANTALON NIÑO', 'pantalon-nino', NULL, '2016-09-10', '2016-10-16', 'V-1P', '271'),
(205, '11', 'PN-ROGERIO', 'pn-rogerio', NULL, '2016-09-10', '2016-10-16', 'U-PN', '213'),
(206, '1', 'PASTAS', 'pastas', NULL, '2016-09-10', '2016-09-10', 'A-PA', '33'),
(207, '9', 'SHAMPOO, RINSE, BALSAMO', 'shampoo-rinse-balsamo', NULL, '2016-09-10', '2016-10-16', 'P-SH', '182'),
(208, '12', 'PANTALONETA', 'pantaloneta', NULL, '2016-09-10', '2016-10-16', 'V-PT', '273'),
(209, '1', 'PANADERIA Y BIZCOCHERIA', 'panaderia-y-bizcocheria', NULL, '2016-09-10', '2016-09-10', 'A-PB', '31'),
(210, '9', 'TALCOS', 'talcos', NULL, '2016-09-10', '2016-10-16', 'P-TA', '183'),
(211, '11', 'SH-ROGERIO', 'sh-rogerio', NULL, '2016-09-10', '2016-10-16', 'U-SH', '218'),
(212, '2', 'POLVO FACIAL COMPACTO', 'polvo-facial-compacto', NULL, '2016-09-10', '2016-09-10', 'B-PC', '71'),
(213, '9', 'REMOVEDORES', 'removedores', NULL, '2016-09-10', '2016-10-16', 'P-RE', '181'),
(214, '2', 'PERFUMES', 'perfumes', NULL, '2016-09-10', '2016-09-10', 'B-PF', '69'),
(215, '3', 'POLLOS', 'pollos', NULL, '2016-09-10', '2016-10-16', 'C-PO', '98'),
(216, '5', 'PRODUCTOS MADERA', 'productos-madera', NULL, '2016-09-10', '2016-10-16', 'F-LU', '123'),
(217, '6', 'AMBIENTADORES', 'ambientadores', NULL, '2016-09-10', '2016-10-16', 'H-AM', '124'),
(218, '12', 'PIJAMAS', 'pijamas', NULL, '2016-09-10', '2016-10-16', 'V-JA', '278'),
(219, '11', 'PROTECTOR DE COLCHON', 'protector-de-colchon', NULL, '2016-09-10', '2016-10-16', 'U-PC', '215'),
(220, '12', 'PANTALONCILLO  T 36', 'pantaloncillo-t-36', NULL, '2016-09-10', '2016-10-16', 'V-G6', '272'),
(221, '11', 'ROGERIO', 'rogerio', NULL, '2016-09-10', '2016-10-16', 'U-CA', '216'),
(222, '1', 'PRODUCTOS NATURALES', 'productos-naturales', NULL, '2016-09-10', '2016-09-10', 'A-PN', '34'),
(223, '11', 'SABANAS', 'sabanas', NULL, '2016-09-10', '2016-10-16', 'U-SA', '217'),
(224, '3', 'QUESOS', 'quesos', NULL, '2016-09-10', '2016-10-16', 'C-QU', '99'),
(225, '1', 'PRODUCTOS PREPARADOS', 'productos-preparados', NULL, '2016-09-10', '2016-09-10', 'A-PP', '35'),
(226, '7', 'TARJETERIA', 'tarjeteria', NULL, '2016-09-10', '2016-10-16', 'K-TA', '154'),
(227, '12', 'SHORT', 'short', NULL, '2016-09-10', '2016-10-16', 'V-SH', '282'),
(228, '11', 'POCILLOS', 'pocillos', NULL, '2016-09-10', '2016-10-16', 'U-PO', '214'),
(229, '1', 'PASABOCAS', 'pasabocas', NULL, '2016-09-10', '2016-09-10', 'A-PS', '32'),
(230, '12', 'PANTYS', 'pantys', NULL, '2016-09-10', '2016-10-16', 'V-PY', '276'),
(231, '2', 'POLVO FACIAL SUELTO', 'polvo-facial-suelto', NULL, '2016-09-10', '2016-09-10', 'B-PS', '72'),
(232, '12', 'PR-ROGERIO', 'pr-rogerio', NULL, '2016-09-10', '2016-10-16', 'V-PR', '279'),
(233, '12', 'SUDADERAS', 'sudaderas', NULL, '2016-09-10', '2016-10-16', 'V-SU', '283'),
(234, '3', 'SALCHICHAS', 'salchichas', NULL, '2016-09-10', '2016-10-16', 'C-SA', '100'),
(235, '7', 'ACUARELAS Y TEMPERAS', 'acuarelas-y-temperas', NULL, '2016-09-10', '2016-10-16', 'K-AC', '140'),
(236, '9', 'TOALLAS HIGIENICAS', 'toallas-higienicas', NULL, '2016-09-10', '2016-10-16', 'P-TH', '184'),
(237, '4', 'VINOS', 'vinos', NULL, '2016-09-10', '2016-10-16', 'E-VI', '113'),
(238, '2', 'RUBORES', 'rubores', NULL, '2016-09-10', '2016-09-10', 'B-RU', '73'),
(239, '8', 'ADORNO NAVIDENO', 'adorno-navideno', NULL, '2016-09-10', '2016-10-16', 'O-AN', '155'),
(240, '3', 'SALCHICHONES', 'salchichones', NULL, '2016-09-10', '2016-10-16', 'C-SH', '101'),
(241, '11', 'TARROS DE COCINA', 'tarros-de-cocina', NULL, '2016-09-10', '2016-10-16', 'U-TC', '220'),
(242, '1', 'SUPLEMENTO ALIMENTICIO', 'suplemento-alimenticio', NULL, '2016-09-10', '2016-09-10', 'A-SA', '37'),
(243, '2', 'SACAPUNTAS', 'sacapuntas', NULL, '2016-09-10', '2016-09-10', 'B-SA', '74'),
(244, '2', 'SOLVENTE REMOVEDOR', 'solvente-removedor', NULL, '2016-09-10', '2016-09-10', 'B-SE', '76'),
(245, '3', 'TOCINETAS', 'tocinetas', NULL, '2016-09-10', '2016-10-16', 'C-TO', '102'),
(246, '9', 'TONICO', 'tonico', NULL, '2016-09-10', '2016-10-16', 'P-TO', '185'),
(247, '11', 'TERMOS', 'termos', NULL, '2016-09-10', '2016-10-16', 'U-TE', '221'),
(248, '2', 'SOMBRAS', 'sombras', NULL, '2016-09-10', '2016-09-10', 'B-SO', '77'),
(249, '12', 'TOP', 'top', NULL, '2016-09-10', '2016-10-16', 'V-TT', '285'),
(250, '1', 'SALSAS DE TOMATE', 'salsas-de-tomate', NULL, '2016-09-10', '2016-09-10', 'A-ST', '36'),
(251, '12', 'TRUSA', 'trusa', NULL, '2016-09-10', '2016-10-16', 'V-TR', '286'),
(252, '11', 'TOALLAS', 'toallas', NULL, '2016-09-10', '2016-10-16', 'U-TO', '222'),
(253, '8', 'IMPLEMENTOS DEPORTIVOS', 'implementos-deportivos', NULL, '2016-09-10', '2016-10-16', 'O-ID', '156'),
(254, '10', 'SERVICIOS', 'servicios', NULL, '2016-09-10', '2016-10-16', 'S-ER', '186'),
(255, '2', 'TALCOS', 'talcos', NULL, '2016-09-10', '2016-09-10', 'B-TA', '79'),
(256, '11', 'UTENSILIOS DE COCINA', 'utensilios-de-cocina', NULL, '2016-09-10', '2016-10-16', 'U-UC', '223'),
(257, '11', 'UTENSILIOS DE MESA', 'utensilios-de-mesa', NULL, '2016-09-10', '2016-10-16', 'U-UM', '224'),
(258, '11', 'ALMOHADAS Y COJINES', 'almohadas-y-cojines', NULL, '2016-09-10', '2016-10-16', 'U-AC', '187'),
(259, '2', 'TAJALAPIZ BELLEZA', 'tajalapiz-belleza', NULL, '2016-09-10', '2016-09-10', 'B-TJ', '78'),
(260, '11', 'ARTICULOS CUERPO', 'articulos-cuerpo', NULL, '2016-09-10', '2016-10-16', 'U-AR', '188'),
(261, '3', 'YOGHURT', 'yoghurt', NULL, '2016-09-10', '2016-10-16', 'C-YO', '103'),
(262, '11', 'VAJILLAS', 'vajillas', NULL, '2016-09-10', '2016-10-16', 'U-VA', '225'),
(263, '2', 'TONICO Y REFRESCANTE', 'tonico-y-refrescante', NULL, '2016-09-10', '2016-09-10', 'B-TO', '80'),
(264, '7', 'BILLETERAS', 'billeteras', NULL, '2016-09-10', '2016-10-16', 'K-BI', '141'),
(265, '12', 'VESTIDO DE BAÐO DAMA', 'vestido-de-bado-dama', NULL, '2016-09-10', '2016-10-16', 'V-VD', '289'),
(266, '2', 'TRATAMIENTO BELLEZA', 'tratamiento-belleza', NULL, '2016-09-10', '2016-09-10', 'B-TR', '81'),
(267, '12', 'V1-ROGERIO', 'v1-rogerio', NULL, '2016-09-10', '2016-10-16', 'V-V1', '287'),
(268, '12', 'VESTIDO DE BAÐO', 'vestido-de-bado', NULL, '2016-09-10', '2016-10-16', 'V-VB', '288'),
(269, '11', 'VELAS', 'velas', NULL, '2016-09-10', '2016-10-16', 'U-VE', '226'),
(270, '11', 'VIDRIERIA', 'vidrieria', NULL, '2016-09-10', '2016-10-16', 'U-VI', '227'),
(271, '12', 'PAÐUELOS', 'paduelos', NULL, '2016-09-10', '2016-10-16', 'V-PA', '277'),
(272, '12', 'VESTIDO DE BAÐO HOMBRE', 'vestido-de-bado-hombre', NULL, '2016-09-10', '2016-10-16', 'V-VH', '290'),
(273, '12', 'ACCESORIOS ZAPATO', 'accesorios-zapato', NULL, '2016-09-10', '2016-10-16', 'V-AZ', '228'),
(274, '12', 'ACOSTUMBRADOR  TALLA 6-8', 'acostumbrador-talla-6-8', NULL, '2016-09-10', '2016-10-16', 'V-AB', '229'),
(275, '4', 'VODKA', 'vodka', NULL, '2016-09-10', '2016-10-16', 'E-VO', '114'),
(276, '12', 'BABY DOLL TALLA GENERAL', 'baby-doll-talla-general', NULL, '2016-09-10', '2016-10-16', 'V-DO', '230'),
(277, '4', 'WHISKI', 'whiski', NULL, '2016-09-10', '2016-10-16', 'E-WH', '115'),
(278, '4', 'AGUARDIENTE', 'aguardiente', NULL, '2016-09-10', '2016-10-16', 'E-AG', '104'),
(279, '5', 'ABRASIVOS', 'abrasivos', NULL, '2016-09-10', '2016-10-16', 'F-AB', '116'),
(280, '12', 'CAMISETILLA T 6-8', 'camisetilla-t-6-8', NULL, '2016-10-16', '2016-10-16', 'V-CH', '244'),
(281, '4', 'CIGARRILLOS', 'cigarrillos', NULL, '2016-10-16', '2016-10-16', 'E-CI', '108'),
(282, '12', 'CHAQUETAS', 'chaquetas', NULL, '2016-10-16', '2016-10-16', 'V-CQ', '246'),
(283, '11', 'MOLINOS', 'molinos', NULL, '2016-10-16', '2016-10-16', 'U-MO', '207'),
(284, '12', 'NG-ROGERIO', 'ng-rogerio', NULL, '2016-10-16', '2016-10-16', 'V-NG', '266'),
(285, '9', 'PAPEL HIGIENICO', 'papel-higienico', NULL, '2016-10-16', '2016-10-16', 'P-PH', '178'),
(286, '12', 'PU-ROGERIO', 'pu-rogerio', NULL, '2016-10-16', '2016-10-16', 'V-PU', '280'),
(287, '6', 'TRAPEROS Y MECHAS', 'traperos-y-mechas', NULL, '2016-10-16', '2016-10-16', 'H-TR', '139'),
(288, '12', 'PANTUFLAS', 'pantuflas', NULL, '2016-10-16', '2016-10-16', 'V-UP', '274'),
(289, '12', 'VESTIDO DE BAÐO NIÐA', 'vestido-de-bado-nida', NULL, '2016-10-16', '2016-10-16', 'V-VI', '291'),
(290, '12', 'VESTIDO DE BAÐO NIÐO', 'vestido-de-bado-nido', NULL, '2016-10-16', '2016-10-16', 'V-VN', '292'),
(291, '12', 'VESTIDO NIÐA', 'vestido-nida', NULL, '2016-10-16', '2016-10-16', 'V-VV', '293'),
(292, '2', 'PESTAÐINA', 'pestadina', NULL, '2016-10-16', '2016-10-16', 'B-PE', '70'),
(293, '2', 'SECADOR PARA UÐAS', 'secador-para-udas', NULL, '2016-10-16', '2016-10-16', 'B-SU', '75');

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
  `vlr_envio` int(11) DEFAULT NULL,
  `estado_id` int(11) NOT NULL DEFAULT '1',
  `conf` tinyint(1) NOT NULL DEFAULT '0',
  `llave` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pay_status` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `user_id`, `totalCart`, `total_compra`, `num_items`, `tipo_compra`, `vlr_envio`, `estado_id`, `conf`, `llave`, `pay_status`, `created_at`, `updated_at`) VALUES
(1, 48, 5800, 5800, 1, 2, 0, 2, 1, NULL, NULL, '2016-09-29', '2016-10-05'),
(2, 48, 1346, 1346, 1, 2, 1000, 2, 1, 'eder-20160929200907', 0, '2016-09-29', '2016-10-05'),
(3, 48, 13456, 13456, 10, 2, 1000, 2, 1, 'eder-20160929200923', 0, '2016-09-29', '2016-10-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_items`
--

CREATE TABLE IF NOT EXISTS `compra_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ArtSec` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ArtCod` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `compra_id` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `valor_unitario` int(11) NOT NULL,
  `iva` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `valIva` decimal(17,5) DEFAULT NULL,
  `valor_total` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `compra_items`
--

INSERT INTO `compra_items` (`id`, `ArtSec`, `ArtCod`, `compra_id`, `nombre`, `image`, `valor_unitario`, `iva`, `cantidad`, `valIva`, `valor_total`, `id_producto`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 1, 'V. PLUMON DELINEADOR OJOS', 'img/Mantis/def.png', 5800, 0, 1, '5800.00000', 5800, 7, '2016-09-29', '2016-09-29'),
(2, '10000', 'OJUML066 ', 2, 'TIRO AL BLANCO', 'img/Mantis/def.png', 1160, 16, 1, NULL, 1346, 5, '2016-09-29', '2016-09-29'),
(3, '10000', 'OJUML066 ', 3, 'TIRO AL BLANCO', 'img/Mantis/def.png', 1160, 16, 10, NULL, 13456, 5, '2016-09-29', '2016-09-29');

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

--
-- Volcado de datos para la tabla `conn`
--

INSERT INTO `conn` (`id`, `ip`, `db`, `user`, `pass`, `urlImg`, `created_at`, `updated_at`) VALUES
(1, '181.225.65.155\\grupo2008', 'erpweb1108', 'sa', 'Colombia$2015', 'http://181.225.65.155:8080/MantisWeb20apps/PublicTempStorage/multimedia/', '2015-10-29', '2016-04-14'),
(2, 'Eder-pc', 'erpweb', 'sa', 'Somic321', 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/', '2015-10-31', '2015-10-31');

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

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `DepNom`, `created_at`, `updated_at`) VALUES
(5, 'Antioquia', '2015-07-25', '2015-07-25'),
(8, 'Atlantico', '2015-07-25', '2015-07-25'),
(11, 'Bogota', '2015-07-25', '2015-07-25'),
(13, 'Bolivar', '2015-07-25', '2015-07-25'),
(15, 'Boyaca ', '2015-07-25', '2015-07-25'),
(17, 'Caldas', '2015-07-25', '2015-07-25'),
(18, 'Caqueta ', '2015-07-25', '2015-07-25'),
(19, 'Cauca', '2015-07-25', '2015-07-25'),
(20, 'Cesar', '2015-07-25', '2015-07-25'),
(23, 'Cordoba', '2015-07-25', '2015-07-25'),
(25, 'Cundinamarca', '2015-07-25', '2015-07-25'),
(27, 'Choco', '2015-07-25', '2015-07-25'),
(35, 'Guangzhou', '2015-07-25', '2015-07-25'),
(41, 'Huila', '2015-07-25', '2015-07-25'),
(44, 'La Guajira', '2015-07-25', '2015-07-25'),
(47, 'Magdalena', '2015-07-25', '2015-07-25'),
(50, 'Meta', '2015-07-25', '2015-07-25'),
(52, 'Narino', '2015-07-25', '2015-07-25'),
(54, 'Norte de Santander', '2015-07-25', '2015-07-25'),
(63, 'Quindio', '2015-07-25', '2015-07-25'),
(66, 'Risaralda', '2015-07-25', '2015-07-25'),
(68, 'Santander', '2015-07-25', '2015-07-25'),
(70, 'Sucre', '2015-07-25', '2015-07-25'),
(73, 'Tolima', '2015-07-25', '2015-07-25'),
(76, 'Valle del Cauca', '2015-07-25', '2015-07-25'),
(81, 'Arauca', '2015-07-25', '2015-07-25'),
(85, 'Casanare', '2015-07-25', '2015-07-25'),
(86, 'Putumayo', '2015-07-25', '2015-07-25'),
(88, 'San Andres', '2015-07-25', '2015-07-25'),
(91, 'Amazonas', '2015-07-25', '2015-07-25'),
(94, 'Guain', '2015-07-25', '2015-07-25'),
(95, 'Guaviare', '2015-07-25', '2015-07-25'),
(97, 'Vaupes', '2015-07-25', '2015-07-25'),
(99, 'Vichada', '2015-07-25', '2015-07-25');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=77 ;

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
(72, 7, 5, '2015-03-24', '2015-03-24'),
(73, 6, 1, '2015-06-13', '2015-06-13'),
(76, 3, 1, '2016-09-11', '2016-09-11');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `user_id`, `nombre_publico`, `razon_social`, `direccion`, `direccion_maps`, `active`, `latitude`, `longitude`, `tema`, `color_tema`, `descripcion`, `logo`, `telefono`, `created_at`, `updated_at`) VALUES
(1, 1, 'ede-alvarez', NULL, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, 'img/empresas/logos/default.jpg', NULL, '2014-11-28', '2014-11-28'),
(2, 28, '830062e53cdc0644738b5e98a0f83b02', NULL, NULL, NULL, 1, NULL, NULL, 1, 1, '830062e53cdc0644738b5e98a0f83b02', NULL, NULL, '2016-03-05', '2016-03-05'),
(3, 28, '306502c42daee0cecc8459de47fc958a', NULL, NULL, NULL, 1, NULL, NULL, 1, 1, '306502c42daee0cecc8459de47fc958a', NULL, NULL, '2016-03-05', '2016-03-05'),
(4, 28, 'e85ad8c3efd68f659c1c6c3df326f21c', NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 'e85ad8c3efd68f659c1c6c3df326f21c', NULL, NULL, '2016-03-05', '2016-03-05'),
(5, 5, 'e1eeefc917bc4d3c1abb0dd88f17c6a1', NULL, NULL, NULL, 1, NULL, NULL, 1, 1, '10097.80', NULL, NULL, '2016-03-05', '2016-03-05');

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
-- Estructura de tabla para la tabla `inventariofamilia`
--

CREATE TABLE IF NOT EXISTS `inventariofamilia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InvFamCod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvFamId` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvFamNom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fam_slug` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `fam_InvSubGruCod` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=636 ;

--
-- Volcado de datos para la tabla `inventariofamilia`
--

INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(1, '1', '1', 'PERROS', 'perros', '3', '2016-09-09', '2016-09-09'),
(2, '444', '444', 'ROLLON', 'rollon', '172', '2016-09-09', '2016-10-16'),
(3, '108', '108', 'VERDURAS', 'verduras', '20', '2016-09-09', '2016-10-16'),
(4, '118', '118', 'POSTRES- PUDIN - FLAN', 'postres-pudin-flan', '23', '2016-09-09', '2016-10-16'),
(5, '102', '102', 'BUÐUELOS', 'buduelos', '19', '2016-09-09', '2016-10-16'),
(6, '124', '124', 'AGUAS', 'aguas', '22', '2016-09-09', '2016-10-16'),
(7, '110', '110', 'GALLE SALUDABLES', 'galle-saludables', '21', '2016-09-09', '2016-10-16'),
(8, '131', '131', 'CUCHUCOS HARINA TOSTADO', 'cuchucos-harina-tostado', '24', '2016-09-09', '2016-10-16'),
(9, '141', '141', 'SIN DEFINIR', 'sin-definir', '26', '2016-09-09', '2016-10-16'),
(10, '138', '138', 'SIN DEFINIR', 'sin-definir', '25', '2016-09-09', '2016-10-16'),
(11, '144', '144', 'CEREAL NINOS', 'cereal-ninos', '27', '2016-09-09', '2016-10-16'),
(12, '156', '156', 'INSTANTANEA PANELA', 'instantanea-panela', '30', '2016-09-09', '2016-10-16'),
(13, '153', '153', 'BEBIDAS  HIDRATANTES', 'bebidas-hidratantes', '29', '2016-09-09', '2016-10-16'),
(14, '159', '159', 'PASTA TRADICIONAL', 'pasta-tradicional', '33', '2016-09-09', '2016-10-16'),
(15, '162', '162', 'BIZCOCHERIA', 'bizcocheria', '31', '2016-09-09', '2016-10-16'),
(16, '165', '165', 'TOSTADOS Y TOSTADAS', 'tostados-y-tostadas', '31', '2016-09-09', '2016-10-16'),
(17, '177', '177', 'LINAZAS', 'linazas', '34', '2016-09-09', '2016-10-16'),
(18, '186', '186', 'CRISPETA MICROONDAS', 'crispeta-microondas', '32', '2016-09-09', '2016-10-16'),
(19, '188', '188', 'AVENAS SABORIZADAS', 'avenas-saborizadas', '37', '2016-09-09', '2016-10-16'),
(20, '19', '19', 'ESPECIAL', 'especial', '5', '2016-09-09', '2016-09-09'),
(21, '192', '192', 'FRASCO', 'frasco', '36', '2016-09-09', '2016-10-16'),
(22, '196', '196', 'SIN DEFINIR', 'sin-definir', '40', '2016-09-09', '2016-10-16'),
(23, '239', '239', 'HORNEAR VARIOS', 'hornear-varios', '82', '2016-09-09', '2016-10-16'),
(24, '245', '245', 'SIN DEFINIR', 'sin-definir', '85', '2016-09-09', '2016-10-16'),
(25, '249', '249', 'PRODMAR', 'prodmar', '87', '2016-09-09', '2016-10-16'),
(26, '25', '25', 'VINAGRES', 'vinagres', '2', '2016-09-09', '2016-09-09'),
(27, '252', '252', 'SIN DEFINIR', 'sin-definir', '88', '2016-09-09', '2016-10-16'),
(28, '254', '254', 'JUGOS', 'jugos', '90', '2016-09-09', '2016-10-16'),
(29, '263', '263', 'LIQ SOYA LECHE', 'liq-soya-leche', '92', '2016-09-09', '2016-10-16'),
(30, '271', '271', 'EMPANADAS Y AREPAS', 'empanadas-y-arepas', '96', '2016-09-09', '2016-10-16'),
(31, '276', '276', 'SIN DEFINIR', 'sin-definir', '97', '2016-09-09', '2016-10-16'),
(32, '279', '279', 'QUESO MADUROS', 'queso-maduros', '99', '2016-09-09', '2016-10-16'),
(33, '283', '283', 'SALCHICHAS', 'salchichas', '100', '2016-09-09', '2016-10-16'),
(34, '291', '291', 'SIN DEFINIR', 'sin-definir', '103', '2016-09-09', '2016-10-16'),
(35, '296', '296', 'CERVEZA  TIPO PILSEN', 'cerveza-tipo-pilsen', '106', '2016-09-09', '2016-10-16'),
(36, '297', '297', 'SIN DEFINIR', 'sin-definir', '106', '2016-09-09', '2016-10-16'),
(37, '299', '299', 'SIN DEFINIR', 'sin-definir', '107', '2016-09-09', '2016-10-16'),
(38, '30', '30', 'DIETETICOS', 'dieteticos', '6', '2016-09-09', '2016-09-09'),
(39, '302', '302', 'APERITIVOS', 'aperitivos', '109', '2016-09-09', '2016-10-16'),
(40, '308', '308', 'RON', 'ron', '112', '2016-09-09', '2016-10-16'),
(41, '306', '306', 'GINEBRA', 'ginebra', '111', '2016-09-09', '2016-10-16'),
(42, '310', '310', 'VINOS', 'vinos', '113', '2016-09-09', '2016-10-16'),
(43, '314', '314', 'SIN DEFINIR', 'sin-definir', '114', '2016-09-09', '2016-10-16'),
(44, '312', '312', 'SIN DEFINIR', 'sin-definir', '113', '2016-09-09', '2016-10-16'),
(45, '317', '317', 'SIN DEFINIR', 'sin-definir', '116', '2016-09-09', '2016-10-16'),
(46, '319', '319', 'ARTICULOS CARROS', 'articulos-carros', '118', '2016-09-09', '2016-10-16'),
(47, '321', '321', 'AHORRADORES BOMBILLOS', 'ahorradores-bombillos', '119', '2016-09-09', '2016-10-16'),
(48, '336', '336', 'ELECTRICO AMBIENTADOR', 'electrico-ambientador', '124', '2016-09-09', '2016-10-16'),
(49, '330', '330', 'SIN DEFINIR', 'sin-definir', '121', '2016-09-09', '2016-10-16'),
(50, '334', '334', 'AEROSOL AMBIENTADOR', 'aerosol-ambientador', '124', '2016-09-09', '2016-10-16'),
(51, '351', '351', 'ESPONJAS COCINA', 'esponjas-cocina', '130', '2016-09-09', '2016-10-16'),
(52, '344', '344', 'CEPILLO BAÐO', 'cepillo-bado', '125', '2016-09-09', '2016-10-16'),
(53, '347', '347', 'CHAMPU ALFOMBRAS', 'champu-alfombras', '128', '2016-09-09', '2016-10-16'),
(54, '365', '365', 'LIMPIADOR', 'limpiador', '132', '2016-09-09', '2016-10-16'),
(55, '356', '356', 'SIN DEFINIR', 'sin-definir', '129', '2016-09-09', '2016-10-16'),
(56, '361', '361', 'BARRA', 'barra', '132', '2016-09-09', '2016-10-16'),
(57, '37', '37', 'BEBIDAS LIGHT', 'bebidas-light', '7', '2016-09-09', '2016-10-16'),
(58, '374', '374', 'BLANQUEADORES', 'blanqueadores', '134', '2016-09-09', '2016-10-16'),
(59, '378', '378', 'DESMANCHADORES ROPA', 'desmanchadores-ropa', '134', '2016-09-09', '2016-10-16'),
(60, '384', '384', 'ARTHOGAR', 'arthogar', '135', '2016-09-09', '2016-10-16'),
(61, '392', '392', 'PORTATRAPERO', 'portatrapero', '139', '2016-09-09', '2016-10-16'),
(62, '394', '394', 'SIN DEFINIR', 'sin-definir', '140', '2016-09-09', '2016-10-16'),
(63, '420', '420', 'SIN DEFINIR', 'sin-definir', '167', '2016-09-09', '2016-10-16'),
(64, '425', '425', 'SIN DEFINIR', 'sin-definir', '161', '2016-09-09', '2016-10-16'),
(65, '423', '423', 'SIN DEFINIR', 'sin-definir', '162', '2016-09-09', '2016-10-16'),
(66, '429', '429', 'COLONIA HOMBRE', 'colonia-hombre', '164', '2016-09-09', '2016-10-16'),
(67, '438', '438', 'CRDEPILATORIAS', 'crdepilatorias', '169', '2016-09-09', '2016-10-16'),
(68, '434', '434', 'SIN DEFINIR', 'sin-definir', '166', '2016-09-09', '2016-10-16'),
(69, '440', '440', 'SIN DEFINIR', 'sin-definir', '168', '2016-09-09', '2016-10-16'),
(70, '442', '442', 'MAQUINAS AFEITADA', 'maquinas-afeitada', '170', '2016-09-09', '2016-10-16'),
(71, '447', '447', 'CREMA', 'crema', '172', '2016-09-09', '2016-10-16'),
(72, '454', '454', 'PAÐITOS HUMEDOS NIÐOS', 'paditos-humedos-nidos', '171', '2016-09-09', '2016-10-16'),
(73, '45', '45', 'SOLUBLES', 'solubles', '8', '2016-09-09', '2016-10-16'),
(74, '462', '462', 'GEL', 'gel', '175', '2016-09-09', '2016-10-16'),
(75, '464', '464', 'NIÐOS', 'nidos', '176', '2016-09-09', '2016-10-16'),
(76, '478', '478', 'LACAS', 'lacas', '180', '2016-09-09', '2016-10-16'),
(77, '487', '487', 'ACONDICIONADOR', 'acondicionador', '182', '2016-09-09', '2016-10-16'),
(78, '497', '497', 'TAMPONES', 'tampones', '184', '2016-09-09', '2016-10-16'),
(79, '502', '502', 'SIN DEFINIR', 'sin-definir', '186', '2016-09-09', '2016-10-16'),
(80, '507', '507', 'LIQUIDOS', 'liquidos', '190', '2016-09-09', '2016-10-16'),
(81, '513', '513', 'SENCILLAS', 'sencillas', '194', '2016-09-09', '2016-10-16'),
(82, '520', '520', 'TOALLAS COCINA', 'toallas-cocina', '198', '2016-09-09', '2016-10-16'),
(83, '527', '527', 'GRIPA / TOS', 'gripa-tos', '199', '2016-09-09', '2016-10-16'),
(84, '538', '538', 'ACCESORIOS TABLETAS', 'accesorios-tabletas', '200', '2016-09-09', '2016-10-16'),
(85, '542', '542', 'GUANTES', 'guantes', '202', '2016-09-09', '2016-10-16'),
(86, '55', '55', 'CARAMELOS STDO', 'caramelos-stdo', '13', '2016-09-09', '2016-10-16'),
(87, '68', '68', 'CEREAL INFANTIL', 'cereal-infantil', '10', '2016-09-09', '2016-10-16'),
(88, '63', '63', 'AMARGOS', 'amargos', '11', '2016-09-09', '2016-10-16'),
(89, '621', '621', 'TANGA/HILO BLONDA', 'tangahilo-blonda', '276', '2016-09-09', '2016-10-16'),
(90, '8', '8', 'CORRIENTES', 'corrientes', '1', '2016-09-09', '2016-09-09'),
(91, '74', '74', 'MERMEDAS DIETETICAS', 'mermedas-dieteticas', '14', '2016-09-09', '2016-10-16'),
(92, '85', '85', 'OBLEAS', 'obleas', '15', '2016-09-09', '2016-10-16'),
(93, '92', '92', 'SARDINAS', 'sardinas', '18', '2016-09-09', '2016-10-16'),
(94, '90', '90', 'GRANOS', 'granos', '16', '2016-09-09', '2016-10-16'),
(95, '98', '98', 'ENCURTIDOS', 'encurtidos', '17', '2016-09-09', '2016-10-16'),
(96, '109', '109', 'GALLE NAVIDAD', 'galle-navidad', '21', '2016-09-09', '2016-10-16'),
(97, '111', '111', 'GALLE TAC DULCE', 'galle-tac-dulce', '21', '2016-09-09', '2016-10-16'),
(98, '119', '119', 'REPOSTERIA', 'reposteria', '23', '2016-09-09', '2016-10-16'),
(99, '125', '125', 'HIELO', 'hielo', '22', '2016-09-09', '2016-10-16'),
(100, '132', '132', 'AVENAS INSTANTANEAS SABORIZADAS', 'avenas-instantaneas-saborizadas', '24', '2016-09-09', '2016-10-16'),
(101, '139', '139', 'FRUTOS SECOS', 'frutos-secos', '26', '2016-09-09', '2016-10-16'),
(102, '142', '142', 'POLVO TARRO', 'polvo-tarro', '27', '2016-09-09', '2016-10-16'),
(103, '145', '145', 'CREMA DE LECHE', 'crema-de-leche', '27', '2016-09-09', '2016-10-16'),
(104, '154', '154', 'NECTARES', 'nectares', '29', '2016-09-09', '2016-10-16'),
(105, '157', '157', 'SIN DEFINIR', 'sin-definir', '30', '2016-09-09', '2016-10-16'),
(106, '160', '160', 'SIN DEFINIR', 'sin-definir', '33', '2016-09-09', '2016-10-16'),
(107, '163', '163', 'PRODUCTOS INTEGRALES', 'productos-integrales', '31', '2016-09-09', '2016-10-16'),
(108, '166', '166', 'BIZCOCHERIA NAVIDEÐA', 'bizcocheria-navideda', '31', '2016-09-09', '2016-10-16'),
(109, '178', '178', 'GERMEN DE TRIGO', 'germen-de-trigo', '34', '2016-09-09', '2016-10-16'),
(110, '189', '189', 'MULTIVITAMINICOS', 'multivitaminicos', '37', '2016-09-09', '2016-10-16'),
(111, '193', '193', 'SIN DEFINIR', 'sin-definir', '36', '2016-09-09', '2016-10-16'),
(112, '197', '197', 'SIN DEFINIR', 'sin-definir', '41', '2016-09-09', '2016-10-16'),
(113, '2', '2', 'GATOS', 'gatos', '3', '2016-09-09', '2016-09-09'),
(114, '20', '20', 'TRADICIONAL', 'tradicional', '5', '2016-09-09', '2016-09-09'),
(115, '246', '246', 'GELATINAS', 'gelatinas', '86', '2016-09-09', '2016-10-16'),
(116, '250', '250', 'SIN DEFINIR', 'sin-definir', '87', '2016-09-09', '2016-10-16'),
(117, '255', '255', 'BEBIDAS Y REFRESCOS', 'bebidas-y-refrescos', '90', '2016-09-09', '2016-10-16'),
(118, '257', '257', 'SIN DEFINIR', 'sin-definir', '90', '2016-09-09', '2016-10-16'),
(119, '26', '26', 'SALSAS VARIAS', 'salsas-varias', '2', '2016-09-09', '2016-09-09'),
(120, '260', '260', 'LIQTETRA', 'liqtetra', '92', '2016-09-09', '2016-10-16'),
(121, '264', '264', 'SIXPACK LECHE BOLSA', 'sixpack-leche-bolsa', '92', '2016-09-09', '2016-10-16'),
(122, '272', '272', 'HAMBURGUESAS', 'hamburguesas', '96', '2016-09-09', '2016-10-16'),
(123, '281', '281', 'QUESO TRADICIONAL', 'queso-tradicional', '99', '2016-09-09', '2016-10-16'),
(124, '284', '284', 'SIN DEFINIR', 'sin-definir', '100', '2016-09-09', '2016-10-16'),
(125, '287', '287', 'YOGHURT', 'yoghurt', '103', '2016-09-09', '2016-10-16'),
(126, '292', '292', 'AGUARDIENTE', 'aguardiente', '104', '2016-09-09', '2016-10-16'),
(127, '298', '298', 'VINOS ESPUMOSOS', 'vinos-espumosos', '107', '2016-09-09', '2016-10-16'),
(128, '300', '300', 'CIGARRILLOS', 'cigarrillos', '108', '2016-09-09', '2016-10-16'),
(129, '31', '31', 'AZ+CAR BLANCO ESPECIAL', 'azcar-blanco-especial', '6', '2016-09-09', '2016-09-09'),
(130, '315', '315', 'WHISKY', 'whisky', '115', '2016-09-09', '2016-10-16'),
(131, '337', '337', 'AEROSOL ELIMINADOR OLORES', 'aerosol-eliminador-olores', '124', '2016-09-09', '2016-10-16'),
(132, '352', '352', 'PAÐOS DE COCINA', 'pados-de-cocina', '130', '2016-09-09', '2016-10-16'),
(133, '362', '362', 'CORRIENTE', 'corriente', '132', '2016-09-09', '2016-10-16'),
(134, '366', '366', 'LAVADORAS', 'lavadoras', '132', '2016-09-09', '2016-10-16'),
(135, '375', '375', 'SUAVISANTES', 'suavisantes', '134', '2016-09-09', '2016-10-16'),
(136, '379', '379', 'SIN DEFINIR', 'sin-definir', '134', '2016-09-09', '2016-10-16'),
(137, '38', '38', 'FRESCOS', 'frescos', '7', '2016-09-09', '2016-10-16'),
(138, '385', '385', 'SIN DEFINIR', 'sin-definir', '135', '2016-09-09', '2016-10-16'),
(139, '395', '395', 'SIN DEFINIR', 'sin-definir', '141', '2016-09-09', '2016-10-16'),
(140, '418', '418', 'BRONCEADOR ACEITE', 'bronceador-aceite', '160', '2016-09-09', '2016-10-16'),
(141, '421', '421', 'CEPILLOS', 'cepillos', '162', '2016-09-09', '2016-10-16'),
(142, '426', '426', 'COLONIA BEBES', 'colonia-bebes', '164', '2016-09-09', '2016-10-16'),
(143, '435', '435', 'CABELLO', 'cabello', '163', '2016-09-09', '2016-10-16'),
(144, '439', '439', 'CREMAS DENTALES', 'cremas-dentales', '168', '2016-09-09', '2016-10-16'),
(145, '441', '441', 'CUCHILLAS  DESECHABLES', 'cuchillas-desechables', '170', '2016-09-09', '2016-10-16'),
(146, '448', '448', 'SPRAY', 'spray', '172', '2016-09-09', '2016-10-16'),
(147, '46', '46', 'MEZCLAS', 'mezclas', '8', '2016-09-09', '2016-10-16'),
(148, '467', '467', 'ANTIBACTERIAL', 'antibacterial', '176', '2016-09-09', '2016-10-16'),
(149, '479', '479', 'LISURAS', 'lisuras', '180', '2016-09-09', '2016-10-16'),
(150, '484', '484', 'NORMALES', 'normales', '182', '2016-09-09', '2016-10-16'),
(151, '488', '488', 'TRATAMIENTOS/CREMA PEINAR', 'tratamientoscrema-peinar', '182', '2016-09-09', '2016-10-16'),
(152, '495', '495', 'PROTECTORES', 'protectores', '184', '2016-09-09', '2016-10-16'),
(153, '498', '498', 'PAÐITOS INTIMOS', 'paditos-intimos', '184', '2016-09-09', '2016-10-16'),
(154, '50', '50', 'SOPAS', 'sopas', '9', '2016-09-09', '2016-10-16'),
(155, '508', '508', 'SIN DEFINIR', 'sin-definir', '190', '2016-09-09', '2016-10-16'),
(156, '514', '514', 'SIN DEFINIR', 'sin-definir', '194', '2016-09-09', '2016-10-16'),
(157, '521', '521', 'PALILLOS', 'palillos', '198', '2016-09-09', '2016-10-16'),
(158, '528', '528', 'VITAMINAS', 'vitaminas', '199', '2016-09-09', '2016-10-16'),
(159, '56', '56', 'CHOCOLATERIA', 'chocolateria', '13', '2016-09-09', '2016-10-16'),
(160, '539', '539', 'CELULARES', 'celulares', '200', '2016-09-09', '2016-10-16'),
(161, '64', '64', 'CORRIENTES', 'corrientes', '11', '2016-09-09', '2016-10-16'),
(162, '69', '69', 'GRANOLAS', 'granolas', '10', '2016-09-09', '2016-10-16'),
(163, '86', '86', 'BOCADILLO', 'bocadillo', '15', '2016-09-09', '2016-10-16'),
(164, '75', '75', 'SIN INFORMACION', 'sin-informacion', '14', '2016-09-09', '2016-10-16'),
(165, '9', '9', 'OLIVA', 'oliva', '1', '2016-09-09', '2016-09-09'),
(166, '93', '93', 'SALCHICHAS', 'salchichas', '18', '2016-09-09', '2016-10-16'),
(167, '91', '91', 'ATUNES', 'atunes', '18', '2016-09-09', '2016-10-16'),
(168, '10', '10', 'SOLIDOS', 'solidos', '1', '2016-09-09', '2016-09-09'),
(169, '112', '112', 'GALLE CREMADAS', 'galle-cremadas', '21', '2016-09-09', '2016-10-16'),
(170, '104', '104', 'COLADAS', 'coladas', '19', '2016-09-09', '2016-10-16'),
(171, '126', '126', 'GASEOSA LATA', 'gaseosa-lata', '22', '2016-09-09', '2016-10-16'),
(172, '133', '133', 'COLADAS BEBE', 'coladas-bebe', '24', '2016-09-09', '2016-10-16'),
(173, '120', '120', 'HELADOS', 'helados', '23', '2016-09-09', '2016-10-16'),
(174, '146', '146', 'LECHE CONDENSADA', 'leche-condensada', '27', '2016-09-09', '2016-10-16'),
(175, '16', '16', 'AROMATICAS', 'aromaticas', '4', '2016-09-09', '2016-09-09'),
(176, '167', '167', 'BROWNIE', 'brownie', '31', '2016-09-09', '2016-10-16'),
(177, '21', '21', 'INTEGRAL', 'integral', '5', '2016-09-09', '2016-09-09'),
(178, '179', '179', 'TURRONES', 'turrones', '34', '2016-09-09', '2016-10-16'),
(179, '247', '247', 'SIN DEFINIR', 'sin-definir', '86', '2016-09-09', '2016-10-16'),
(180, '194', '194', 'SIN DEFINIR', 'sin-definir', '38', '2016-09-09', '2016-10-16'),
(181, '265', '265', 'SIN DEFINIR', 'sin-definir', '93', '2016-09-09', '2016-10-16'),
(182, '27', '27', 'MOSTAZA', 'mostaza', '2', '2016-09-09', '2016-09-09'),
(183, '273', '273', 'EMPANADAS Y AREPAS', 'empanadas-y-arepas', '96', '2016-09-09', '2016-10-16'),
(184, '285', '285', 'SIN DEFINIR', 'sin-definir', '101', '2016-09-09', '2016-10-16'),
(185, '32', '32', 'AZ+CAR REFINADA', 'azcar-refinada', '6', '2016-09-09', '2016-09-09'),
(186, '3', '3', 'AVES', 'aves', '3', '2016-09-09', '2016-09-09'),
(187, '353', '353', 'SIN DEFINIR', 'sin-definir', '130', '2016-09-09', '2016-10-16'),
(188, '363', '363', 'AROMA', 'aroma', '132', '2016-09-09', '2016-10-16'),
(189, '367', '367', 'LIQUIDOS', 'liquidos', '132', '2016-09-09', '2016-10-16'),
(190, '376', '376', 'PRODUCTO ESPECIALISADO ROPA', 'producto-especialisado-ropa', '134', '2016-09-09', '2016-10-16'),
(191, '380', '380', 'VARSOL', 'varsol', '135', '2016-09-09', '2016-10-16'),
(192, '39', '39', 'TE FRIO', 'te-frio', '7', '2016-09-09', '2016-10-16'),
(193, '386', '386', 'SIN DEFINIR', 'sin-definir', '136', '2016-09-09', '2016-10-16'),
(194, '419', '419', 'CREMA DE AFEITAR', 'crema-de-afeitar', '167', '2016-09-09', '2016-10-16'),
(195, '422', '422', 'SEDA DENTAL', 'seda-dental', '162', '2016-09-09', '2016-10-16'),
(196, '436', '436', 'ACCESORIOS', 'accesorios', '163', '2016-09-09', '2016-10-16'),
(197, '445', '445', 'BARRAS', 'barras', '172', '2016-09-09', '2016-10-16'),
(198, '449', '449', 'DESORANTE SPRAY CTE', 'desorante-spray-cte', '172', '2016-09-09', '2016-10-16'),
(199, '455', '455', 'SIN DEFINIR', 'sin-definir', '171', '2016-09-09', '2016-10-16'),
(200, '468', '468', 'GEL ANTIBACTERIAL', 'gel-antibacterial', '176', '2016-09-09', '2016-10-16'),
(201, '47', '47', 'DESCAFEINADOS', 'descafeinados', '8', '2016-09-09', '2016-10-16'),
(202, '480', '480', 'LOCION CAPILAR', 'locion-capilar', '180', '2016-09-09', '2016-10-16'),
(203, '496', '496', 'TOALLAS HIG', 'toallas-hig', '184', '2016-09-09', '2016-10-16'),
(204, '499', '499', 'SIN DEFINIR', 'sin-definir', '184', '2016-09-09', '2016-10-16'),
(205, '522', '522', 'DESECHABLES', 'desechables', '198', '2016-09-09', '2016-10-16'),
(206, '51', '51', 'CREMAS', 'cremas', '9', '2016-09-09', '2016-10-16'),
(207, '529', '529', 'CUIDADO PIEL', 'cuidado-piel', '199', '2016-09-09', '2016-10-16'),
(208, '540', '540', 'SIN DEFINIR', 'sin-definir', '200', '2016-09-09', '2016-10-16'),
(209, '57', '57', 'GOMAS', 'gomas', '13', '2016-09-09', '2016-10-16'),
(210, '65', '65', 'COCOA', 'cocoa', '11', '2016-09-09', '2016-10-16'),
(211, '70', '70', 'SIN DEFINIR', 'sin-definir', '10', '2016-09-09', '2016-10-16'),
(212, '76', '76', 'MERMELADA DOY PACK', 'mermelada-doy-pack', '14', '2016-09-09', '2016-10-16'),
(213, '94', '94', 'ENLATADOS VERDURAS', 'enlatados-verduras', '18', '2016-09-09', '2016-10-16'),
(214, '99', '99', 'ENCURTIDOS ENLATADOS', 'encurtidos-enlatados', '17', '2016-09-09', '2016-10-16'),
(215, '100', '100', 'SIN DEFINIR', 'sin-definir', '17', '2016-09-09', '2016-10-16'),
(216, '105', '105', 'MAIZENAS', 'maizenas', '19', '2016-09-09', '2016-10-16'),
(217, '11', '11', 'GIRASOL', 'girasol', '1', '2016-09-09', '2016-09-09'),
(218, '113', '113', 'GALLE TAC SALADAS', 'galle-tac-saladas', '21', '2016-09-09', '2016-10-16'),
(219, '121', '121', 'GELATINAS LIGHT', 'gelatinas-light', '23', '2016-09-09', '2016-10-16'),
(220, '127', '127', 'GASEOSA PEQUEÐA', 'gaseosa-pequeda', '22', '2016-09-09', '2016-10-16'),
(221, '134', '134', 'PANADERIA INSUMOS', 'panaderia-insumos', '24', '2016-09-09', '2016-10-16'),
(222, '147', '147', 'LECHES MEDICADAS INFANTILES', 'leches-medicadas-infantiles', '27', '2016-09-09', '2016-10-16'),
(223, '17', '17', 'TE SOBRES', 'te-sobres', '4', '2016-09-09', '2016-09-09'),
(224, '180', '180', 'MANI', 'mani', '34', '2016-09-09', '2016-10-16'),
(225, '22', '22', 'SOPA', 'sopa', '5', '2016-09-09', '2016-09-09'),
(226, '266', '266', 'MARGARINAS EN VASO', 'margarinas-en-vaso', '94', '2016-09-09', '2016-10-16'),
(227, '28', '28', 'SALSAS SAZONADORAS', 'salsas-sazonadoras', '2', '2016-09-09', '2016-09-09'),
(228, '33', '33', 'AZ+CAR CRUDO', 'azcar-crudo', '6', '2016-09-09', '2016-09-09'),
(229, '358', '358', 'INSECTICIDAS', 'insecticidas', '131', '2016-09-09', '2016-10-16'),
(230, '368', '368', 'LIQUIDO LAVADORA', 'liquido-lavadora', '132', '2016-09-09', '2016-10-16'),
(231, '381', '381', 'ACIDO MURIATICO', 'acido-muriatico', '135', '2016-09-09', '2016-10-16'),
(232, '387', '387', 'PAÐOS ABSORBENTES', 'pados-absorbentes', '137', '2016-09-09', '2016-10-16'),
(233, '4', '4', 'PASABOCAS PERROS', 'pasabocas-perros', '3', '2016-09-09', '2016-09-09'),
(234, '40', '40', 'MALTEADAS', 'malteadas', '7', '2016-09-09', '2016-10-16'),
(235, '432', '432', 'FACIALES', 'faciales', '166', '2016-09-09', '2016-10-16'),
(236, '450', '450', 'SIN DEFINIR', 'sin-definir', '172', '2016-09-09', '2016-10-16'),
(237, '456', '456', 'PANAL ADULTO', 'panal-adulto', '171', '2016-09-09', '2016-10-16'),
(238, '469', '469', 'JABON INTIMO', 'jabon-intimo', '176', '2016-09-09', '2016-10-16'),
(239, '48', '48', 'SIN DEFINIR', 'sin-definir', '8', '2016-09-09', '2016-10-16'),
(240, '481', '481', 'SIN DEFINIR', 'sin-definir', '180', '2016-09-09', '2016-10-16'),
(241, '490', '490', 'SIN DEFINIR', 'sin-definir', '182', '2016-09-09', '2016-10-16'),
(242, '52', '52', 'BASE ADEREZOS', 'base-aderezos', '9', '2016-09-09', '2016-10-16'),
(243, '523', '523', 'FOSFOROS', 'fosforos', '198', '2016-09-09', '2016-10-16'),
(244, '530', '530', 'DOLOR', 'dolor', '199', '2016-09-09', '2016-10-16'),
(245, '58', '58', 'MASMELOS', 'masmelos', '13', '2016-09-09', '2016-10-16'),
(246, '77', '77', 'MERMELADA  FRASCO', 'mermelada-frasco', '14', '2016-09-09', '2016-10-16'),
(247, '87', '87', 'DULCES SURTIDOS', 'dulces-surtidos', '15', '2016-09-09', '2016-10-16'),
(248, '95', '95', 'IMPORTADOS  ENLATADOS', 'importados-enlatados', '18', '2016-09-09', '2016-10-16'),
(249, '106', '106', 'SIN DEFINIR', 'sin-definir', '19', '2016-09-09', '2016-10-16'),
(250, '114', '114', 'GALLE WAFER', 'galle-wafer', '21', '2016-09-09', '2016-10-16'),
(251, '12', '12', 'CANOLA', 'canola', '1', '2016-09-09', '2016-09-09'),
(252, '122', '122', 'GASEOSAS   CORRIENTES', 'gaseosas-corrientes', '22', '2016-09-09', '2016-10-16'),
(253, '128', '128', 'DE TRIGO', 'de-trigo', '24', '2016-09-09', '2016-10-16'),
(254, '135', '135', 'SIN DEFINIR', 'sin-definir', '24', '2016-09-09', '2016-10-16'),
(255, '148', '148', 'LECHE SOYA', 'leche-soya', '27', '2016-09-09', '2016-10-16'),
(256, '181', '181', 'SIN DEFINIR', 'sin-definir', '34', '2016-09-09', '2016-10-16'),
(257, '23', '23', 'SABORIZADO', 'saborizado', '5', '2016-09-09', '2016-09-09'),
(258, '267', '267', 'MANTEQUILA', 'mantequila', '94', '2016-09-09', '2016-10-16'),
(259, '34', '34', 'AZ+CAR LIGHT', 'azcar-light', '6', '2016-09-09', '2016-09-09'),
(260, '359', '359', 'REPELENTES', 'repelentes', '131', '2016-09-09', '2016-10-16'),
(261, '369', '369', 'SIN DEFINIR', 'sin-definir', '132', '2016-09-09', '2016-10-16'),
(262, '41', '41', 'PULPA DE FRUTA', 'pulpa-de-fruta', '7', '2016-09-09', '2016-10-16'),
(263, '433', '433', 'CREMA BEBE', 'crema-bebe', '166', '2016-09-09', '2016-10-16'),
(264, '451', '451', 'COPITOS', 'copitos', '171', '2016-09-09', '2016-10-16'),
(265, '470', '470', 'SIN DEFINIR', 'sin-definir', '176', '2016-09-09', '2016-10-16'),
(266, '482', '482', 'PAPEL HIGIENICO', 'papel-higienico', '178', '2016-09-09', '2016-10-16'),
(267, '491', '491', 'NIÐOS', 'nidos', '183', '2016-09-09', '2016-10-16'),
(268, '5', '5', 'IMPLEMENTOS', 'implementos', '3', '2016-09-09', '2016-09-09'),
(269, '524', '524', 'PITILLOS', 'pitillos', '198', '2016-09-09', '2016-10-16'),
(270, '53', '53', 'SIN DEFINIR', 'sin-definir', '9', '2016-09-09', '2016-10-16'),
(271, '78', '78', 'SIN INFORMACION', 'sin-informacion', '14', '2016-09-09', '2016-10-16'),
(272, '531', '531', 'ALGODON', 'algodon', '199', '2016-09-09', '2016-10-16'),
(273, '59', '59', 'CARAMELOS Y CHOCOLATES DIETETICOS', 'caramelos-y-chocolates-dieteticos', '13', '2016-09-09', '2016-10-16'),
(274, '88', '88', 'SIN DEFINIR', 'sin-definir', '15', '2016-09-09', '2016-10-16'),
(275, '388', '388', 'RECOGEDORES', 'recogedores', '138', '2016-09-09', '2016-10-16'),
(276, '115', '115', 'GALLE TP LECHE', 'galle-tp-leche', '21', '2016-09-09', '2016-10-16'),
(277, '136', '136', 'HUEVOS CODORNIZ', 'huevos-codorniz', '25', '2016-09-09', '2016-10-16'),
(278, '13', '13', 'SOYA', 'soya', '1', '2016-09-09', '2016-09-09'),
(279, '149', '149', 'LECHE IMPORTADA', 'leche-importada', '27', '2016-09-09', '2016-10-16'),
(280, '182', '182', 'TAMALES/MASAS/AYACOS', 'tamalesmasasayacos', '35', '2016-09-09', '2016-10-16'),
(281, '370', '370', 'LIMPIAVIDRIOS', 'limpiavidrios', '133', '2016-09-09', '2016-10-16'),
(282, '35', '35', 'AZUCAR DIETETICA', 'azucar-dietetica', '6', '2016-09-09', '2016-09-09'),
(283, '42', '42', 'TE EN POLVO', 'te-en-polvo', '7', '2016-09-09', '2016-10-16'),
(284, '452', '452', 'FACIALES', 'faciales', '171', '2016-09-09', '2016-10-16'),
(285, '471', '471', 'SIN DEFINIR', 'sin-definir', '177', '2016-09-09', '2016-10-16'),
(286, '525', '525', 'SIN DEFINIR', 'sin-definir', '198', '2016-09-09', '2016-10-16'),
(287, '532', '532', 'CUIDADO HERIDA', 'cuidado-herida', '199', '2016-09-09', '2016-10-16'),
(288, '60', '60', 'CHICLES', 'chicles', '13', '2016-09-09', '2016-10-16'),
(289, '66', '66', 'INSTANTANEO CHOCOLATE', 'instantaneo-chocolate', '11', '2016-09-09', '2016-10-16'),
(290, '79', '79', 'DURAZNOS', 'duraznos', '14', '2016-09-09', '2016-10-16'),
(291, '116', '116', 'SIN DEFINIR', 'sin-definir', '21', '2016-09-09', '2016-10-16'),
(292, '14', '14', 'LIGTH', 'ligth', '1', '2016-09-09', '2016-09-09'),
(293, '150', '150', 'DOY PACK', 'doy-pack', '28', '2016-09-09', '2016-10-16'),
(294, '268', '268', 'MARGARINA BARRAS', 'margarina-barras', '94', '2016-09-09', '2016-10-16'),
(295, '183', '183', 'SIN DEFINIR', 'sin-definir', '35', '2016-09-09', '2016-10-16'),
(296, '43', '43', 'SIN DEFINIR', 'sin-definir', '7', '2016-09-09', '2016-10-16'),
(297, '371', '371', 'MULTIUSOS', 'multiusos', '133', '2016-09-09', '2016-10-16'),
(298, '492', '492', 'ADULTO', 'adulto', '183', '2016-09-09', '2016-10-16'),
(299, '533', '533', 'ESTOMACALES', 'estomacales', '199', '2016-09-09', '2016-10-16'),
(300, '6', '6', 'ASEO MASCOTAS', 'aseo-mascotas', '3', '2016-09-09', '2016-09-09'),
(301, '67', '67', 'CEREAL DESAYUNO', 'cereal-desayuno', '10', '2016-09-09', '2016-10-16'),
(302, '80', '80', 'BREVAS', 'brevas', '14', '2016-09-09', '2016-10-16'),
(303, '171', '171', 'CAFETERIA COOTRACOLTA', 'cafeteria-cootracolta', '31', '2016-09-09', '2016-10-16'),
(304, '151', '151', 'FRASCO', 'frasco', '28', '2016-09-09', '2016-10-16'),
(305, '184', '184', 'MANI', 'mani', '32', '2016-09-09', '2016-10-16'),
(306, '534', '534', 'LECHE MAGNESIA', 'leche-magnesia', '199', '2016-09-09', '2016-10-16'),
(307, '81', '81', 'COCTEL DE FRUTAS', 'coctel-de-frutas', '14', '2016-09-09', '2016-10-16'),
(308, '535', '535', 'RUBEFACIENTES', 'rubefacientes', '199', '2016-09-09', '2016-10-16'),
(309, '82', '82', 'SIN INFORMACION', 'sin-informacion', '14', '2016-09-09', '2016-10-16'),
(310, '277', '277', 'POLLO', 'pollo', '98', '2016-09-09', '2016-10-16'),
(311, '326', '326', 'SIN DEFINIR', 'sin-definir', '120', '2016-09-09', '2016-10-16'),
(312, '339', '339', 'LUSTRAMUEBLES', 'lustramuebles', '126', '2016-09-09', '2016-10-16'),
(313, '348', '348', 'MULTIHUSOS', 'multihusos', '128', '2016-09-09', '2016-10-16'),
(314, '461', '461', 'SIN DEFINIR', 'sin-definir', '174', '2016-09-09', '2016-10-16'),
(315, '536', '536', 'SIN DEFINIR', 'sin-definir', '199', '2016-09-09', '2016-10-16'),
(316, '551', '551', 'PAPEL ALUMINIO', 'papel-aluminio', '210', '2016-09-09', '2016-10-16'),
(317, '83', '83', 'SIN DEFINIR', 'sin-definir', '14', '2016-09-09', '2016-10-16'),
(318, '172', '172', 'SIN DEFINIR', 'sin-definir', '31', '2016-09-09', '2016-10-16'),
(319, '304', '304', 'CREMAS DE WHISKY', 'cremas-de-whisky', '110', '2016-09-09', '2016-10-16'),
(320, '327', '327', 'LUSTRAMUEBLES', 'lustramuebles', '123', '2016-09-09', '2016-10-16'),
(321, '332', '332', 'LINTERNAS', 'linternas', '122', '2016-09-09', '2016-10-16'),
(322, '340', '340', 'CERAS', 'ceras', '126', '2016-09-09', '2016-10-16'),
(323, '293', '293', 'SABAJON', 'sabajon', '105', '2016-09-09', '2016-10-16'),
(324, '328', '328', 'SIN DEFINIR', 'sin-definir', '123', '2016-09-09', '2016-10-16'),
(325, '396', '396', 'SIN DEFINIR', 'sin-definir', '142', '2016-09-09', '2016-10-16'),
(326, '294', '294', 'BRANDY', 'brandy', '105', '2016-09-09', '2016-10-16'),
(327, '341', '341', 'SIN DEFINIR', 'sin-definir', '126', '2016-09-09', '2016-10-16'),
(328, '382', '382', 'BOLSAS ASEO', 'bolsas-aseo', '135', '2016-09-09', '2016-10-16'),
(329, '342', '342', 'CHUPAS', 'chupas', '127', '2016-09-09', '2016-10-16'),
(330, '137', '137', 'HUEVOS CORRIENTES', 'huevos-corrientes', '25', '2016-09-09', '2016-10-16'),
(331, '173', '173', 'LECITINAS', 'lecitinas', '34', '2016-09-09', '2016-10-16'),
(332, '372', '372', 'DESENGRASANTES', 'desengrasantes', '133', '2016-09-09', '2016-10-16'),
(333, '61', '61', 'SIN DEFINIR', 'sin-definir', '13', '2016-09-09', '2016-10-16'),
(334, '324', '324', 'SIN DEFINIR', 'sin-definir', '119', '2016-09-09', '2016-10-16'),
(335, '174', '174', 'MIEL', 'miel', '34', '2016-09-09', '2016-10-16'),
(336, '96', '96', 'SIN DEFINIR', 'sin-definir', '18', '2016-09-09', '2016-10-16'),
(337, '190', '190', 'BEBIDAS ACHOCOLATADAS', 'bebidas-achocolatadas', '37', '2016-09-09', '2016-10-16'),
(338, '175', '175', 'GRANOLAS', 'granolas', '34', '2016-09-09', '2016-10-16'),
(339, '345', '345', 'SIN DEFINIR', 'sin-definir', '125', '2016-09-09', '2016-10-16'),
(340, '101', '101', 'NATILLAS', 'natillas', '19', '2016-09-09', '2016-10-16'),
(341, '107', '107', 'FRUTAS', 'frutas', '20', '2016-09-09', '2016-10-16'),
(342, '117', '117', 'GELATINAS', 'gelatinas', '23', '2016-09-09', '2016-10-16'),
(343, '123', '123', 'MALTAS', 'maltas', '22', '2016-09-09', '2016-10-16'),
(344, '130', '130', 'AVENAS', 'avenas', '24', '2016-09-09', '2016-10-16'),
(345, '140', '140', 'INSUMOS PANADERIA', 'insumos-panaderia', '26', '2016-09-09', '2016-10-16'),
(346, '143', '143', 'POLVO BOLSA', 'polvo-bolsa', '27', '2016-09-09', '2016-10-16'),
(347, '15', '15', 'SIN DEFINIR', 'sin-definir', '1', '2016-09-09', '2016-09-09'),
(348, '155', '155', 'PANELA', 'panela', '30', '2016-09-09', '2016-10-16'),
(349, '152', '152', 'SIN DEFINIR', 'sin-definir', '28', '2016-09-09', '2016-10-16'),
(350, '169', '169', 'TORTILLAS', 'tortillas', '31', '2016-09-09', '2016-10-16'),
(351, '158', '158', 'PASTA LASAGNA', 'pasta-lasagna', '33', '2016-09-09', '2016-10-16'),
(352, '161', '161', 'PAN CORRIENTE', 'pan-corriente', '31', '2016-09-09', '2016-10-16'),
(353, '18', '18', 'SIN DEFINIR', 'sin-definir', '4', '2016-09-09', '2016-09-09'),
(354, '164', '164', 'PAN NAVIDEÐO', 'pan-navidedo', '31', '2016-09-09', '2016-10-16'),
(355, '176', '176', 'SALVADO', 'salvado', '34', '2016-09-09', '2016-10-16'),
(356, '185', '185', 'PAPAS  MIXTOS', 'papas-mixtos', '32', '2016-09-09', '2016-10-16'),
(357, '187', '187', 'SIN DEFINIR', 'sin-definir', '32', '2016-09-09', '2016-10-16'),
(358, '201', '201', 'SIN DEFINIR', 'sin-definir', '47', '2016-09-09', '2016-10-16'),
(359, '202', '202', 'SIN DEFINIR', 'sin-definir', '49', '2016-09-09', '2016-10-16'),
(360, '195', '195', 'SIN DEFINIR', 'sin-definir', '39', '2016-09-09', '2016-10-16'),
(361, '203', '203', 'SIN DEFINIR', 'sin-definir', '42', '2016-09-09', '2016-10-16'),
(362, '198', '198', 'SIN DEFINIR', 'sin-definir', '56', '2016-09-09', '2016-10-16'),
(363, '191', '191', 'DOY PACK', 'doy-pack', '36', '2016-09-09', '2016-10-16'),
(364, '199', '199', 'SIN DEFINIR', 'sin-definir', '45', '2016-09-09', '2016-10-16'),
(365, '200', '200', 'SIN DEFINIR', 'sin-definir', '52', '2016-09-09', '2016-10-16'),
(366, '204', '204', 'SIN DEFINIR', 'sin-definir', '43', '2016-09-09', '2016-10-16'),
(367, '206', '206', 'SIN DEFINIR', 'sin-definir', '51', '2016-09-09', '2016-10-16'),
(368, '205', '205', 'SIN DEFINIR', 'sin-definir', '44', '2016-09-09', '2016-10-16'),
(369, '208', '208', 'SIN DEFINIR', 'sin-definir', '48', '2016-09-09', '2016-10-16'),
(370, '207', '207', 'SIN DEFINIR', 'sin-definir', '46', '2016-09-09', '2016-10-16'),
(371, '209', '209', 'SIN DEFINIR', 'sin-definir', '50', '2016-09-09', '2016-10-16'),
(372, '210', '210', 'SIN DEFINIR', 'sin-definir', '53', '2016-09-09', '2016-10-16'),
(373, '211', '211', 'SIN DEFINIR', 'sin-definir', '54', '2016-09-09', '2016-10-16'),
(374, '214', '214', 'SIN DEFINIR', 'sin-definir', '58', '2016-09-09', '2016-10-16'),
(375, '213', '213', 'SIN DEFINIR', 'sin-definir', '57', '2016-09-09', '2016-10-16'),
(376, '212', '212', 'SIN DEFINIR', 'sin-definir', '55', '2016-09-09', '2016-10-16'),
(377, '215', '215', 'SIN DEFINIR', 'sin-definir', '59', '2016-09-09', '2016-10-16'),
(378, '216', '216', 'SIN DEFINIR', 'sin-definir', '60', '2016-09-09', '2016-10-16'),
(379, '217', '217', 'SIN DEFINIR', 'sin-definir', '65', '2016-09-09', '2016-10-16'),
(380, '218', '218', 'SIN DEFINIR', 'sin-definir', '62', '2016-09-09', '2016-10-16'),
(381, '219', '219', 'SIN DEFINIR', 'sin-definir', '63', '2016-09-09', '2016-10-16'),
(382, '220', '220', 'SIN DEFINIR', 'sin-definir', '64', '2016-09-09', '2016-10-16'),
(383, '221', '221', 'SIN DEFINIR', 'sin-definir', '66', '2016-09-09', '2016-10-16'),
(384, '222', '222', 'SIN DEFINIR', 'sin-definir', '61', '2016-09-09', '2016-10-16'),
(385, '223', '223', 'SIN DEFINIR', 'sin-definir', '67', '2016-09-09', '2016-10-16'),
(386, '224', '224', 'SIN DEFINIR', 'sin-definir', '68', '2016-09-09', '2016-10-16'),
(387, '225', '225', 'SIN DEFINIR', 'sin-definir', '71', '2016-09-09', '2016-10-16'),
(388, '226', '226', 'SIN DEFINIR', 'sin-definir', '70', '2016-09-09', '2016-10-16'),
(389, '227', '227', 'SIN DEFINIR', 'sin-definir', '69', '2016-09-09', '2016-10-16'),
(390, '228', '228', 'SIN DEFINIR', 'sin-definir', '72', '2016-09-09', '2016-10-16'),
(391, '229', '229', 'SIN DEFINIR', 'sin-definir', '73', '2016-09-09', '2016-10-16'),
(392, '231', '231', 'SIN DEFINIR', 'sin-definir', '76', '2016-09-09', '2016-10-16'),
(393, '230', '230', 'SIN DEFINIR', 'sin-definir', '74', '2016-09-09', '2016-10-16'),
(394, '233', '233', 'SIN DEFINIR', 'sin-definir', '75', '2016-09-09', '2016-10-16'),
(395, '232', '232', 'SIN DEFINIR', 'sin-definir', '77', '2016-09-09', '2016-10-16'),
(396, '234', '234', 'PERFUMADOS', 'perfumados', '79', '2016-09-09', '2016-10-16'),
(397, '235', '235', 'SIN DEFINIR', 'sin-definir', '79', '2016-09-09', '2016-10-16'),
(398, '236', '236', 'SIN DEFINIR', 'sin-definir', '78', '2016-09-09', '2016-10-16'),
(399, '237', '237', 'SIN DEFINIR', 'sin-definir', '80', '2016-09-09', '2016-10-16'),
(400, '238', '238', 'SIN DEFINIR', 'sin-definir', '81', '2016-09-09', '2016-10-16'),
(401, '24', '24', 'SIN DEFINIR', 'sin-definir', '5', '2016-09-09', '2016-09-09'),
(402, '240', '240', 'CARNE HAMBURGUESA', 'carne-hamburguesa', '82', '2016-09-09', '2016-10-16'),
(403, '242', '242', 'SIN DEFINIR', 'sin-definir', '82', '2016-09-09', '2016-10-16'),
(404, '241', '241', 'ESPECIALIDADES TEMPORADA', 'especialidades-temporada', '82', '2016-09-09', '2016-10-16'),
(405, '243', '243', 'AVENAS', 'avenas', '83', '2016-09-09', '2016-10-16'),
(406, '248', '248', 'HELADOS POSTRES', 'helados-postres', '87', '2016-09-09', '2016-10-16'),
(407, '244', '244', 'CABANOS', 'cabanos', '84', '2016-09-09', '2016-10-16'),
(408, '251', '251', 'JAMON', 'jamon', '88', '2016-09-09', '2016-10-16'),
(409, '256', '256', 'JUGOS NEVERAS', 'jugos-neveras', '90', '2016-09-09', '2016-10-16'),
(410, '253', '253', 'SIN DEFINIR', 'sin-definir', '89', '2016-09-09', '2016-10-16'),
(411, '258', '258', 'SIN DEFINIR', 'sin-definir', '91', '2016-09-09', '2016-10-16'),
(412, '259', '259', 'LIQBOLSA', 'liqbolsa', '92', '2016-09-09', '2016-10-16'),
(413, '261', '261', 'SIN INFORMACION', 'sin-informacion', '92', '2016-09-09', '2016-10-16'),
(414, '262', '262', 'SABORIZADAS', 'saborizadas', '92', '2016-09-09', '2016-10-16'),
(415, '269', '269', 'SIN DEFINIR', 'sin-definir', '94', '2016-09-09', '2016-10-16'),
(416, '270', '270', 'SIN DEFINIR', 'sin-definir', '95', '2016-09-09', '2016-10-16'),
(417, '274', '274', 'SIN DEFINIR', 'sin-definir', '96', '2016-09-09', '2016-10-16'),
(418, '275', '275', 'PRODMAR', 'prodmar', '97', '2016-09-09', '2016-10-16'),
(419, '278', '278', 'SIN DEFINIR', 'sin-definir', '98', '2016-09-09', '2016-10-16'),
(420, '280', '280', 'QUESO PARMESANO', 'queso-parmesano', '99', '2016-09-09', '2016-10-16'),
(421, '282', '282', 'SIN DEFINIR', 'sin-definir', '99', '2016-09-09', '2016-09-09'),
(422, '286', '286', 'SIN DEFINIR', 'sin-definir', '102', '2016-09-09', '2016-10-16'),
(423, '288', '288', 'MALTEADAS', 'malteadas', '103', '2016-09-09', '2016-10-16'),
(424, '29', '29', 'SIN DEFINIR', 'sin-definir', '2', '2016-09-09', '2016-09-09'),
(425, '289', '289', 'KUMIS', 'kumis', '103', '2016-09-09', '2016-10-16'),
(426, '290', '290', 'AVENA LIQUIDA', 'avena-liquida', '103', '2016-09-09', '2016-10-16'),
(427, '295', '295', 'CERVEZA IMPORTADA', 'cerveza-importada', '106', '2016-09-09', '2016-10-16'),
(428, '301', '301', 'SIN DEFINIR', 'sin-definir', '108', '2016-09-09', '2016-10-16'),
(429, '305', '305', 'SIN DEFINIR', 'sin-definir', '110', '2016-09-09', '2016-10-16'),
(430, '303', '303', 'SIN DEFINIR', 'sin-definir', '109', '2016-09-09', '2016-10-16'),
(431, '307', '307', 'SIN DEFINIR', 'sin-definir', '111', '2016-09-09', '2016-10-16'),
(432, '309', '309', 'SIN DEFINIR', 'sin-definir', '112', '2016-09-09', '2016-10-16'),
(433, '311', '311', 'VINOS IMPORTADOS', 'vinos-importados', '113', '2016-09-09', '2016-10-16'),
(434, '313', '313', 'VODKA', 'vodka', '114', '2016-09-09', '2016-10-16'),
(435, '316', '316', 'SIN DEFINIR', 'sin-definir', '115', '2016-09-09', '2016-10-16'),
(436, '318', '318', 'SIN DEFINIR', 'sin-definir', '117', '2016-09-09', '2016-10-16'),
(437, '320', '320', 'SIN DEFINIR', 'sin-definir', '118', '2016-09-09', '2016-10-16'),
(438, '322', '322', 'BOMBILLOS CORRIENTES', 'bombillos-corrientes', '119', '2016-09-09', '2016-10-16'),
(439, '323', '323', 'LINTERNAS', 'linternas', '119', '2016-09-09', '2016-10-16'),
(440, '325', '325', 'GANCHO PARA TRAPERO', 'gancho-para-trapero', '120', '2016-09-09', '2016-10-16'),
(441, '329', '329', 'PEGANTES VARIOS', 'pegantes-varios', '121', '2016-09-09', '2016-10-16'),
(442, '331', '331', 'PILAS', 'pilas', '122', '2016-09-09', '2016-10-16'),
(443, '333', '333', 'SIN DEFINIR', 'sin-definir', '122', '2016-09-09', '2016-10-16'),
(444, '335', '335', 'GEL  AMBIENTADOR', 'gel-ambientador', '124', '2016-09-09', '2016-10-16'),
(445, '338', '338', 'SIN DEFINIR', 'sin-definir', '124', '2016-09-09', '2016-09-09'),
(446, '343', '343', 'CEPILLOS LAVAR', 'cepillos-lavar', '125', '2016-09-09', '2016-10-16'),
(447, '36', '36', 'INSTANTANEOS', 'instantaneos', '7', '2016-09-09', '2016-10-16'),
(448, '355', '355', 'CEPILLO PISO', 'cepillo-piso', '129', '2016-09-09', '2016-10-16'),
(449, '360', '360', 'SIN DEFINIR', 'sin-definir', '131', '2016-09-09', '2016-09-09'),
(450, '364', '364', 'LAVAPLATOS', 'lavaplatos', '132', '2016-09-09', '2016-10-16'),
(451, '373', '373', 'SIN DEFINIR', 'sin-definir', '133', '2016-09-09', '2016-10-16'),
(452, '377', '377', 'ROPA COLOR', 'ropa-color', '134', '2016-09-09', '2016-10-16'),
(453, '346', '346', 'DESINFECTANTES', 'desinfectantes', '128', '2016-09-09', '2016-10-16'),
(454, '350', '350', 'SIN DEFINIR', 'sin-definir', '128', '2016-09-09', '2016-10-16'),
(455, '389', '389', 'SIN DEFINIR', 'sin-definir', '138', '2016-09-09', '2016-10-16'),
(456, '383', '383', 'BOLSA PARA ALIMENTOS', 'bolsa-para-alimentos', '135', '2016-09-09', '2016-10-16'),
(457, '390', '390', 'TRAPEROS', 'traperos', '139', '2016-09-09', '2016-10-16'),
(458, '393', '393', 'SIN DEFINIR', 'sin-definir', '139', '2016-09-09', '2016-10-16'),
(459, '397', '397', 'SIN DEFINIR', 'sin-definir', '144', '2016-09-09', '2016-10-16'),
(460, '398', '398', 'SIN DEFINIR', 'sin-definir', '143', '2016-09-09', '2016-10-16'),
(461, '399', '399', 'SIN DEFINIR', 'sin-definir', '145', '2016-09-09', '2016-10-16'),
(462, '400', '400', 'SIN DEFINIR', 'sin-definir', '146', '2016-09-09', '2016-10-16'),
(463, '401', '401', 'SIN DEFINIR', 'sin-definir', '147', '2016-09-09', '2016-10-16'),
(464, '402', '402', 'SIN DEFINIR', 'sin-definir', '148', '2016-09-09', '2016-10-16'),
(465, '403', '403', 'SIN DEFINIR', 'sin-definir', '149', '2016-09-09', '2016-10-16'),
(466, '404', '404', 'SIN DEFINIR', 'sin-definir', '150', '2016-09-09', '2016-10-16'),
(467, '406', '406', 'SIN DEFINIR', 'sin-definir', '152', '2016-09-09', '2016-10-16'),
(468, '405', '405', 'SIN DEFINIR', 'sin-definir', '151', '2016-09-09', '2016-10-16'),
(469, '407', '407', 'SIN DEFINIR', 'sin-definir', '153', '2016-09-09', '2016-10-16'),
(470, '408', '408', 'SIN DEFINIR', 'sin-definir', '154', '2016-09-09', '2016-10-16'),
(471, '409', '409', 'SIN DEFINIR', 'sin-definir', '155', '2016-09-09', '2016-10-16'),
(472, '410', '410', 'SIN DEFINIR', 'sin-definir', '156', '2016-09-09', '2016-10-16'),
(473, '411', '411', 'SIN DEFINIR', 'sin-definir', '157', '2016-09-09', '2016-10-16'),
(474, '412', '412', 'SIN DEFINIR', 'sin-definir', '158', '2016-09-09', '2016-10-16'),
(475, '413', '413', 'NIÐOS', 'nidos', '159', '2016-09-09', '2016-10-16'),
(476, '415', '415', 'ADULTO', 'adulto', '159', '2016-09-09', '2016-10-16'),
(477, '414', '414', 'VASELINA', 'vaselina', '159', '2016-09-09', '2016-10-16'),
(478, '424', '424', 'SIN DEFINIR', 'sin-definir', '165', '2016-09-09', '2016-10-16'),
(479, '416', '416', 'BRONCEADOR CREMA', 'bronceador-crema', '160', '2016-09-09', '2016-10-16'),
(480, '427', '427', 'COLONIA NIÐOS', 'colonia-nidos', '164', '2016-09-09', '2016-10-16'),
(481, '428', '428', 'COLONIA NIÐAS', 'colonia-nidas', '164', '2016-09-09', '2016-10-16'),
(482, '437', '437', 'REMOVEDORES', 'removedores', '169', '2016-09-09', '2016-10-16'),
(483, '44', '44', 'CORRIENTES', 'corrientes', '8', '2016-09-09', '2016-10-16'),
(484, '443', '443', 'SIN DEFINIR', 'sin-definir', '170', '2016-09-09', '2016-09-09'),
(485, '446', '446', 'GEL', 'gel', '172', '2016-09-09', '2016-10-16'),
(486, '453', '453', 'CONDONES', 'condones', '171', '2016-09-09', '2016-10-16'),
(487, '458', '458', 'ENJUAGUES BUCALES', 'enjuagues-bucales', '173', '2016-09-09', '2016-10-16'),
(488, '463', '463', 'SIN DEFINIR', 'sin-definir', '175', '2016-09-09', '2016-10-16'),
(489, '465', '465', 'COSMETICO', 'cosmetico', '176', '2016-09-09', '2016-10-16'),
(490, '474', '474', 'SHAMPOO NIÐOS', 'shampoo-nidos', '179', '2016-09-09', '2016-10-16'),
(491, '472', '472', 'PAÐITOS', 'paditos', '179', '2016-09-09', '2016-10-16'),
(492, '473', '473', 'ANTIPAÐALITIS', 'antipadalitis', '179', '2016-09-09', '2016-10-16'),
(493, '483', '483', 'SIN DEFINIR', 'sin-definir', '181', '2016-09-09', '2016-10-16'),
(494, '485', '485', 'ANTICASPA', 'anticaspa', '182', '2016-09-09', '2016-10-16'),
(495, '486', '486', 'NIÐOS', 'nidos', '182', '2016-09-09', '2016-10-16'),
(496, '49', '49', 'CALDOS', 'caldos', '9', '2016-09-09', '2016-10-16'),
(497, '493', '493', 'SPRAY  PIES', 'spray-pies', '183', '2016-09-09', '2016-10-16'),
(498, '501', '501', 'SERVICIOS', 'servicios', '186', '2016-09-09', '2016-10-16'),
(499, '503', '503', 'SIN DEFINIR', 'sin-definir', '189', '2016-09-09', '2016-09-09'),
(500, '504', '504', 'SIN DEFINIR', 'sin-definir', '187', '2016-09-09', '2016-10-16'),
(501, '505', '505', 'SIN DEFINIR', 'sin-definir', '188', '2016-09-09', '2016-10-16'),
(502, '509', '509', 'SIN DEFINIR', 'sin-definir', '191', '2016-09-09', '2016-10-16'),
(503, '506', '506', 'SOLIDOS', 'solidos', '190', '2016-09-09', '2016-10-16'),
(504, '511', '511', 'SIN DEFINIR', 'sin-definir', '192', '2016-09-09', '2016-10-16'),
(505, '510', '510', 'SIN DEFINIR', 'sin-definir', '216', '2016-09-09', '2016-10-16'),
(506, '512', '512', 'DOBLES', 'dobles', '194', '2016-09-09', '2016-10-16'),
(507, '516', '516', 'SIN DEFINIR', 'sin-definir', '193', '2016-09-09', '2016-10-16'),
(508, '515', '515', 'SIN DEFINIR', 'sin-definir', '197', '2016-09-09', '2016-09-09'),
(509, '517', '517', 'SIN DEFINIR', 'sin-definir', '195', '2016-09-09', '2016-10-16'),
(510, '518', '518', 'SIN DEFINIR', 'sin-definir', '196', '2016-09-09', '2016-10-16'),
(511, '519', '519', 'SERVILLETAS', 'servilletas', '198', '2016-09-09', '2016-10-16'),
(512, '526', '526', 'ALCOHOL', 'alcohol', '199', '2016-09-09', '2016-10-16'),
(513, '537', '537', 'TABLETAS', 'tabletas', '200', '2016-09-09', '2016-10-16'),
(514, '54', '54', 'ESTUCHERIA CHOCOLATES', 'estucheria-chocolates', '13', '2016-09-09', '2016-10-16'),
(515, '543', '543', 'SIN DEFINIR', 'sin-definir', '202', '2016-09-09', '2016-10-16'),
(516, '541', '541', 'SIN DEFINIR', 'sin-definir', '201', '2016-09-09', '2016-10-16'),
(517, '544', '544', 'SIN DEFINIR', 'sin-definir', '203', '2016-09-09', '2016-10-16'),
(518, '545', '545', 'SIN DEFINIR', 'sin-definir', '204', '2016-09-09', '2016-10-16'),
(519, '546', '546', 'SIN DEFINIR', 'sin-definir', '205', '2016-09-09', '2016-10-16'),
(520, '547', '547', 'SIN DEFINIR', 'sin-definir', '206', '2016-09-09', '2016-10-16'),
(521, '548', '548', 'SIN DEFINIR', 'sin-definir', '207', '2016-09-09', '2016-10-16'),
(522, '549', '549', 'SIN DEFINIR', 'sin-definir', '208', '2016-09-09', '2016-10-16'),
(523, '550', '550', 'SIN DEFINIR', 'sin-definir', '209', '2016-09-09', '2016-10-16'),
(524, '552', '552', 'SIN DEFINIR', 'sin-definir', '210', '2016-09-09', '2016-10-16'),
(525, '554', '554', 'SIN DEFINIR', 'sin-definir', '212', '2016-09-09', '2016-10-16'),
(526, '553', '553', 'SIN DEFINIR', 'sin-definir', '215', '2016-09-09', '2016-10-16'),
(527, '556', '556', 'SIN DEFINIR', 'sin-definir', '214', '2016-09-09', '2016-10-16'),
(528, '555', '555', 'SIN DEFINIR', 'sin-definir', '213', '2016-09-09', '2016-10-16'),
(529, '557', '557', 'SIN DEFINIR', 'sin-definir', '211', '2016-09-09', '2016-10-16'),
(530, '559', '559', 'SIN DEFINIR', 'sin-definir', '218', '2016-09-09', '2016-10-16'),
(531, '563', '563', 'SIN DEFINIR', 'sin-definir', '222', '2016-09-09', '2016-10-16'),
(532, '562', '562', 'SIN DEFINIR', 'sin-definir', '221', '2016-09-09', '2016-10-16'),
(533, '558', '558', 'SIN DEFINIR', 'sin-definir', '217', '2016-09-09', '2016-10-16'),
(534, '561', '561', 'SIN DEFINIR', 'sin-definir', '220', '2016-09-09', '2016-10-16'),
(535, '560', '560', 'SIN DEFINIR', 'sin-definir', '219', '2016-09-09', '2016-10-16'),
(536, '564', '564', 'SIN DEFINIR', 'sin-definir', '223', '2016-09-09', '2016-10-16'),
(537, '565', '565', 'SIN DEFINIR', 'sin-definir', '224', '2016-09-09', '2016-10-16'),
(538, '567', '567', 'SIN DEFINIR', 'sin-definir', '226', '2016-09-09', '2016-10-16'),
(539, '566', '566', 'SIN DEFINIR', 'sin-definir', '225', '2016-09-09', '2016-10-16'),
(540, '570', '570', 'SIN DEFINIR', 'sin-definir', '237', '2016-09-09', '2016-10-16'),
(541, '569', '569', 'SIN DEFINIR', 'sin-definir', '238', '2016-09-09', '2016-10-16'),
(542, '568', '568', 'SIN DEFINIR', 'sin-definir', '227', '2016-09-09', '2016-10-16'),
(543, '571', '571', 'SIN DEFINIR', 'sin-definir', '252', '2016-09-09', '2016-10-16'),
(544, '572', '572', 'SIN DEFINIR', 'sin-definir', '247', '2016-09-09', '2016-10-16'),
(545, '573', '573', 'SIN DEFINIR', 'sin-definir', '261', '2016-09-09', '2016-10-16'),
(546, '574', '574', 'SIN DEFINIR', 'sin-definir', '248', '2016-09-09', '2016-10-16'),
(547, '576', '576', 'SIN DEFINIR', 'sin-definir', '229', '2016-09-09', '2016-10-16'),
(548, '575', '575', 'SIN DEFINIR', 'sin-definir', '271', '2016-09-09', '2016-10-16'),
(549, '577', '577', 'SIN DEFINIR', 'sin-definir', '228', '2016-09-09', '2016-10-16'),
(550, '578', '578', 'SIN DEFINIR', 'sin-definir', '235', '2016-09-09', '2016-10-16'),
(551, '579', '579', 'SIN DEFINIR', 'sin-definir', '281', '2016-09-09', '2016-10-16'),
(552, '580', '580', 'SIN DEFINIR', 'sin-definir', '231', '2016-09-09', '2016-10-16'),
(553, '581', '581', 'SIN DEFINIR', 'sin-definir', '233', '2016-09-09', '2016-10-16'),
(554, '582', '582', 'SIN DEFINIR', 'sin-definir', '234', '2016-09-09', '2016-10-16'),
(555, '583', '583', 'SIN DEFINIR', 'sin-definir', '236', '2016-09-09', '2016-10-16'),
(556, '584', '584', 'SIN DEFINIR', 'sin-definir', '245', '2016-09-09', '2016-10-16'),
(557, '585', '585', 'SIN DEFINIR', 'sin-definir', '249', '2016-09-09', '2016-10-16'),
(558, '586', '586', 'SIN DEFINIR', 'sin-definir', '244', '2016-09-09', '2016-10-16'),
(559, '587', '587', 'SIN DEFINIR', 'sin-definir', '243', '2016-09-09', '2016-10-16'),
(560, '588', '588', 'SIN DEFINIR', 'sin-definir', '246', '2016-09-09', '2016-10-16'),
(561, '589', '589', 'SIN DEFINIR', 'sin-definir', '250', '2016-09-09', '2016-10-16'),
(562, '590', '590', 'SIN DEFINIR', 'sin-definir', '230', '2016-09-09', '2016-10-16'),
(563, '591', '591', 'SIN DEFINIR', 'sin-definir', '251', '2016-09-09', '2016-10-16'),
(564, '592', '592', 'SIN DEFINIR', 'sin-definir', '254', '2016-09-09', '2016-10-16'),
(565, '593', '593', 'SIN DEFINIR', 'sin-definir', '253', '2016-09-09', '2016-10-16'),
(566, '594', '594', 'SIN DEFINIR', 'sin-definir', '255', '2016-09-09', '2016-10-16'),
(567, '595', '595', 'SIN DEFINIR', 'sin-definir', '272', '2016-09-09', '2016-10-16'),
(568, '596', '596', 'SIN DEFINIR', 'sin-definir', '256', '2016-09-09', '2016-10-16'),
(569, '597', '597', 'SIN DEFINIR', 'sin-definir', '257', '2016-09-09', '2016-10-16'),
(570, '598', '598', 'SIN DEFINIR', 'sin-definir', '258', '2016-09-09', '2016-10-16'),
(571, '599', '599', 'SIN DEFINIR', 'sin-definir', '259', '2016-09-09', '2016-10-16'),
(572, '600', '600', 'SIN DEFINIR', 'sin-definir', '260', '2016-09-09', '2016-10-16'),
(573, '601', '601', 'SIN DEFINIR', 'sin-definir', '278', '2016-09-09', '2016-10-16'),
(574, '602', '602', 'SIN DEFINIR', 'sin-definir', '240', '2016-09-09', '2016-10-16'),
(575, '603', '603', 'SIN DEFINIR', 'sin-definir', '242', '2016-09-09', '2016-10-16'),
(576, '604', '604', 'SIN DEFINIR', 'sin-definir', '239', '2016-09-09', '2016-10-16'),
(577, '605', '605', 'SIN DEFINIR', 'sin-definir', '241', '2016-09-09', '2016-10-16'),
(578, '606', '606', 'SIN DEFINIR', 'sin-definir', '232', '2016-09-09', '2016-10-16'),
(579, '607', '607', 'SIN DEFINIR', 'sin-definir', '264', '2016-09-09', '2016-10-16'),
(580, '609', '609', 'SIN DEFINIR', 'sin-definir', '263', '2016-09-09', '2016-10-16'),
(581, '608', '608', 'SIN DEFINIR', 'sin-definir', '262', '2016-09-09', '2016-10-16'),
(582, '610', '610', 'SIN DEFINIR', 'sin-definir', '265', '2016-09-09', '2016-10-16'),
(583, '612', '612', 'SIN DEFINIR', 'sin-definir', '267', '2016-09-09', '2016-10-16'),
(584, '611', '611', 'SIN DEFINIR', 'sin-definir', '266', '2016-09-09', '2016-10-16'),
(585, '613', '613', 'SIN DEFINIR', 'sin-definir', '268', '2016-09-09', '2016-10-16'),
(586, '614', '614', 'SIN DEFINIR', 'sin-definir', '277', '2016-09-09', '2016-10-16'),
(587, '615', '615', 'SIN DEFINIR', 'sin-definir', '270', '2016-09-09', '2016-10-16'),
(588, '617', '617', 'SIN DEFINIR', 'sin-definir', '269', '2016-09-09', '2016-10-16'),
(589, '616', '616', 'SIN DEFINIR', 'sin-definir', '275', '2016-09-09', '2016-10-16'),
(590, '618', '618', 'SIN DEFINIR', 'sin-definir', '279', '2016-09-09', '2016-10-16'),
(591, '622', '622', 'SIN DEFINIR', 'sin-definir', '276', '2016-09-09', '2016-10-16'),
(592, '619', '619', 'SIN DEFINIR', 'sin-definir', '273', '2016-09-09', '2016-10-16'),
(593, '620', '620', 'SIN DEFINIR', 'sin-definir', '280', '2016-09-09', '2016-10-16'),
(594, '62', '62', 'DIETETICOS', 'dieteticos', '11', '2016-09-09', '2016-10-16'),
(595, '623', '623', 'SIN DEFINIR', 'sin-definir', '282', '2016-09-09', '2016-10-16');
INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(596, '624', '624', 'SIN DEFINIR', 'sin-definir', '283', '2016-09-09', '2016-10-16'),
(597, '625', '625', 'SIN DEFINIR', 'sin-definir', '286', '2016-09-09', '2016-10-16'),
(598, '627', '627', 'SIN DEFINIR', 'sin-definir', '285', '2016-09-09', '2016-10-16'),
(599, '626', '626', 'SIN DEFINIR', 'sin-definir', '284', '2016-09-09', '2016-10-16'),
(600, '628', '628', 'SIN DEFINIR', 'sin-definir', '274', '2016-09-09', '2016-10-16'),
(601, '629', '629', 'SIN DEFINIR', 'sin-definir', '287', '2016-09-09', '2016-10-16'),
(602, '630', '630', 'SIN DEFINIR', 'sin-definir', '288', '2016-09-09', '2016-10-16'),
(603, '631', '631', 'SIN DEFINIR', 'sin-definir', '289', '2016-09-09', '2016-10-16'),
(604, '632', '632', 'SIN DEFINIR', 'sin-definir', '290', '2016-09-09', '2016-10-16'),
(605, '633', '633', 'SIN DEFINIR', 'sin-definir', '291', '2016-09-09', '2016-10-16'),
(606, '634', '634', 'SIN DEFINIR', 'sin-definir', '292', '2016-09-09', '2016-10-16'),
(607, '635', '635', 'SIN DEFINIR', 'sin-definir', '293', '2016-09-09', '2016-10-16'),
(608, '7', '7', 'SIN DEFINIR', 'sin-definir', '3', '2016-09-09', '2016-09-09'),
(609, '71', '71', 'SIN DEFINIR', 'sin-definir', '12', '2016-09-09', '2016-10-16'),
(610, '72', '72', 'CONDIMENTOS', 'condimentos', '12', '2016-09-09', '2016-10-16'),
(611, '84', '84', 'AREQUIPE', 'arequipe', '15', '2016-09-09', '2016-10-16'),
(612, '97', '97', 'DURAZNOS Y CONSERVAS', 'duraznos-y-conservas', '17', '2016-09-09', '2016-10-16'),
(613, '73', '73', 'COMPOTAS', 'compotas', '14', '2016-09-09', '2016-10-16'),
(614, '89', '89', 'SAL', 'sal', '16', '2016-09-09', '2016-10-16'),
(615, '459', '459', 'SIN DEFINIR', 'sin-definir', '173', '2016-09-09', '2016-10-16'),
(616, '460', '460', 'ESTVARIOS', 'estvarios', '174', '2016-09-09', '2016-10-16'),
(617, '357', '357', 'CREOLINAS', 'creolinas', '131', '2016-10-16', '2016-10-16'),
(618, '431', '431', 'MANOS Y CUERPO', 'manos-y-cuerpo', '166', '2016-10-16', '2016-10-16'),
(619, '476', '476', 'TINTES', 'tintes', '180', '2016-10-16', '2016-10-16'),
(620, '129', '129', 'PRECOCIDAS', 'precocidas', '24', '2016-10-16', '2016-10-16'),
(621, '391', '391', 'MECHAS', 'mechas', '139', '2016-10-16', '2016-10-16'),
(622, '417', '417', 'BRONCEADOR GEL', 'bronceador-gel', '160', '2016-10-16', '2016-10-16'),
(623, '477', '477', 'GEL', 'gel', '180', '2016-10-16', '2016-10-16'),
(624, '103', '103', 'TORTAS', 'tortas', '19', '2016-10-16', '2016-10-16'),
(625, '466', '466', 'LIQUIDO', 'liquido', '176', '2016-10-16', '2016-10-16'),
(626, '349', '349', 'DESINFECTANTES BAÐOS', 'desinfectantes-bados', '128', '2016-10-16', '2016-10-16'),
(627, '354', '354', 'ESCOBAS', 'escobas', '129', '2016-10-16', '2016-10-16'),
(628, '430', '430', 'COLONIA MUJER', 'colonia-mujer', '164', '2016-10-16', '2016-10-16'),
(629, '489', '489', 'FIJADORES', 'fijadores', '182', '2016-10-16', '2016-10-16'),
(630, '168', '168', 'TORTAS COOTRACOLTA', 'tortas-cootracolta', '31', '2016-10-16', '2016-10-16'),
(631, '170', '170', 'PAN COOTRACOLTA', 'pan-cootracolta', '31', '2016-10-16', '2016-10-16'),
(632, '475', '475', 'SIN DEFINIR', 'sin-definir', '179', '2016-10-16', '2016-10-16'),
(633, '494', '494', 'SIN DEFINIR', 'sin-definir', '183', '2016-10-16', '2016-10-16'),
(634, '500', '500', 'SIN DEFINIR', 'sin-definir', '185', '2016-10-16', '2016-10-16'),
(635, '457', '457', 'PANAL NINO', 'panal-nino', '171', '2016-10-16', '2016-10-16');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `inventariogrupo`
--

INSERT INTO `inventariogrupo` (`id`, `InvGruCod`, `InvGruId`, `InvGruNom`, `estado`, `created_at`, `updated_at`, `slug_grupo`) VALUES
(1, '1', 'A', 'ABARROTES', 1, '2016-09-09', '2016-09-09', 'abarrotes'),
(2, '10', 'S', 'SERVICIOS', 1, '2016-09-09', '2016-09-09', 'servicios'),
(3, '11', 'U', 'UTILERIA HOGAR', 1, '2016-09-09', '2016-09-09', 'utileria-hogar'),
(4, '12', 'V', 'VESTUARIO', 1, '2016-09-09', '2016-09-09', 'vestuario'),
(5, '2', 'B', 'PERFUMERIA', 1, '2016-09-09', '2016-09-09', 'perfumeria'),
(6, '3', 'C', 'CONGELADOS Y FRIO', 1, '2016-09-09', '2016-09-09', 'congelados-y-frio'),
(7, '4', 'E', 'LICORES', 1, '2016-09-09', '2016-09-09', 'licores'),
(8, '5', 'F', 'FERRETERIA', 1, '2016-09-09', '2016-09-09', 'ferreteria'),
(9, '6', 'H', 'ASEO HOGAR', 1, '2016-09-09', '2016-09-09', 'aseo-hogar'),
(10, '7', 'K', 'PAPELERIA', 1, '2016-09-09', '2016-09-09', 'papeleria'),
(11, '8', 'O', 'VARIOS', 1, '2016-09-09', '2016-09-09', 'varios'),
(12, '9', 'P', 'ASEO PERSONAL', 1, '2016-09-09', '2016-09-09', 'aseo-personal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE IF NOT EXISTS `mensajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`id`, `email`, `empresa`, `created_at`, `updated_at`) VALUES
(1, 'ederalvarez2091057@gmail.com', 'cocacola', '2016-04-06', '2016-04-06'),
(2, 'ederalvarez2091057@gmail.com', 'cocacola', '2016-04-06', '2016-04-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `men_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `men_nom`, `created_at`, `updated_at`) VALUES
(1, 'General', '0000-00-00', '2016-04-29'),
(2, 'Cuidado personal', '0000-00-00', '0000-00-00'),
(3, 'Celulares y MInutos', '0000-00-00', '0000-00-00'),
(4, 'Frutas y verduras', '0000-00-00', '0000-00-00'),
(5, 'Licores', '0000-00-00', '0000-00-00'),
(6, 'Macotas', '0000-00-00', '0000-00-00'),
(7, 'Mercados', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_inventariogrupo`
--

CREATE TABLE IF NOT EXISTS `menu_inventariogrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `grupo_id` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `menu_inventariogrupo`
--

INSERT INTO `menu_inventariogrupo` (`id`, `menu_id`, `grupo_id`, `created_at`, `updated_at`) VALUES
(1, 1, '42', '0000-00-00', '0000-00-00'),
(3, 1, '002', '0000-00-00', '0000-00-00'),
(4, 1, '003', '0000-00-00', '0000-00-00'),
(5, 3, '41', '0000-00-00', '0000-00-00'),
(6, 3, '35', '0000-00-00', '0000-00-00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `metodo_envio`
--

INSERT INTO `metodo_envio` (`id`, `nom_metodo`, `tiempo_entrega`, `valor`, `created_at`, `updated_at`) VALUES
(1, 'Ruta Camion', 'Ruta', 0, '2015-05-07', '2015-05-07'),
(2, 'INMEDIATO', '60 minutos', 5000, '0000-00-00', '0000-00-00'),
(3, 'hfhfhf', '40', 3000, '2016-02-24', '2016-02-24');

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
  `mantis_img` int(1) DEFAULT NULL,
  `precio` decimal(17,5) DEFAULT NULL,
  `ValIva` decimal(17,5) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  `por_iva` int(2) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `dt` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `ArtSec`, `id_mantis`, `pro_nom`, `categoria_id`, `descripcion`, `slug`, `img`, `mantis_img`, `precio`, `ValIva`, `Estado`, `por_iva`, `cantidad`, `dt`, `created_at`, `updated_at`) VALUES
(2, '20756', 'VKIMPC48', 'R.19270 CAMISETA BLANCA T.M', '603', '', 'r19270-camiseta-blanca-tm', 'img/Mantis/def.png', NULL, '0.00000', '0.00000', 1, 16, 0, 1045534729, '2016-10-06', '2016-10-06');

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
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE IF NOT EXISTS `prueba` (
  `mensaje` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `prueba`
--

INSERT INTO `prueba` (`mensaje`) VALUES
('pase por aqui VERSION 4 recargada'),
('e25235335d7916a6f0ba297d9ec06433'),
('8d24717d971e318444b1dfd21cf5bbcf'),
('4f0f3fcc7a14d81df1b24a1438e5d91c'),
('64ddd15195e1335c084991c3646ee5cb'),
('eder-20160528160559'),
('eder-20160602190650'),
('eder-20160602190650'),
('eder-20160602190650'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811120816'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837'),
('eder-20160811180837');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=111 ;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`id`, `TipPagNom`, `created_at`, `updated_at`) VALUES
(1, 'Contado', '0000-00-00', '0000-00-00'),
(2, 'Cupo Cliente', '0000-00-00', '0000-00-00'),
(107, 'eder Lov', '2016-09-06', '2016-09-06'),
(108, 'demi alv', '2016-09-06', '2016-09-06'),
(109, 'hahah', '2016-09-11', '2016-09-11'),
(110, 'ulululu', '2016-09-17', '2016-09-17');

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
  `remember_token` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `remember_pass` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `active` int(5) DEFAULT '1',
  `condiciones` tinyint(1) DEFAULT NULL,
  `admin` int(5) DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=49 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `NitSec`, `email`, `CliCup`, `password`, `remember_token`, `remember_pass`, `active`, `condiciones`, `admin`, `created_at`, `updated_at`) VALUES
(3, '1102365685', 'admin@admin.com', NULL, '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', '6dqdA2VKsiFWsIGjJpIg5rsslFb6pVpwq1uYvxLQhf31LY0rpuKqWz8hGho7', '', 1, 1, 1, '0000-00-00', '2016-09-10'),
(28, '110236568333', 'ederalvarez20910577@gmail.com', NULL, '$2y$10$g3QreIXuJFhrkE8DxTRds.FT81yDnOlpwUNSEOO.7sV.ZnVGwJ9xC', 'acNnz7TzG2r2wCgKDwgXl7kTvgHlmidCVY70U0Kp7Uqc9ReCgOPlTXlTgNdL', '', 1, 1, 0, '2016-01-22', '2016-08-11'),
(30, '1102365686', 'ederalvarez2009@hotmail.com', NULL, '$2y$10$venQExu/OBwh1mS8hLXwoeZUR/222yFY6gK9yo/oBOQRR3YUXwWQq', '', '', 1, 1, 0, '2016-03-06', '2016-03-06'),
(31, '100200300', 'demi1057@gmail.com', NULL, '$2y$10$/mh20RInNerB8H5ezecs.uV/oPgJ5xz.j6aYShmO95oJZAcdpFdt6', '', '', 1, 1, 0, '2016-03-19', '2016-03-19'),
(32, '100200301', 'ivan.rojas.sis@gmail.com', NULL, '$2y$10$iG8q4jkWXaF0K7BzgRA9XuxfrlNSZF9QXOlnBAogw4qgsQ00vY/vW', '', '', 1, 1, 0, '2016-03-19', '2016-03-19'),
(33, '63443106', 'soni325@hotmail.com', NULL, '$2y$10$St8ALxP/jkvHaDIP5Ti0suLmFO29tpVxF.V1YtXbRwelsT9ODG87C', '', '', 1, 1, 0, '2016-04-01', '2016-04-01'),
(34, '1098693118', 'cvcarlosandres39@gmail.com', NULL, '$2y$10$CtTHu9jqPPWGg38CkBNze.bXrzH7keXc0PvQpxC8.htZOfEtDUMxq', '', '', 1, 1, 0, '2016-04-01', '2016-04-01'),
(35, '13444789', 'joseluis@somic.com.co', NULL, '$2y$10$6CjendsX3fksRBPJqphlqexhvaytPAMh2bW.cB6m4KZ4B/mHHMBye', '', '', 1, 1, 0, '2016-04-01', '2016-04-01'),
(36, '1002003001', 'cesar@hotmail.com', NULL, '$2y$10$osbja5Z.86yU4A4LWzfiOuV0Pyua.BdioQXCVmx5VlDgwwY0BZktq', '6wSKYWo6ET9d4OEzjoUGeukWkiARa4ibOMWmhuLD0FY3iIQksUG8rTrxivjt', '', 1, 1, 0, '2016-04-09', '2016-04-09'),
(37, '1002003002', 'ymora@hotmail.com', NULL, '$2y$10$pJZEyA3dzMjs9W/s7LVmhO.K95NQ3vFfnVsakrXItL9iU/HA1xlVu', '', '', 1, 1, 0, '2016-04-09', '2016-04-09'),
(38, '100200306', 'p6@gmail.com', NULL, '$2y$10$Rz7jyLbmZjM8e6CSUZZgoOKc72DE2JhUdojr47kCrnhZYAQ6jINnm', NULL, NULL, 1, 1, 0, '2016-08-30', '2016-08-30'),
(39, '1095123456', 'cvcarlos@gmail.com', NULL, '$2y$10$EDthW2zXyPEzNzUUIProROezu/t2LCCHFgwZ4hOsnq3nYx7crAVZC', 'yxqA1N572ODokuSMMXTYJiRAJWV1b4eHzZ0Yjc03634V6xFfsBgfZJLLa3xR', NULL, 1, 1, 0, '2016-08-31', '2016-08-31'),
(40, '100200307', 'bv@gmail.com', NULL, '$2y$10$r4XsGa57yRarVLn/LD3AVuFfJRwkFYLpxD5Uzykc9f4FAT.cqrULa', '5ub1emYHktsUIxPM99p9Xflr1uF6SOGQQdjm4jyN8SB1YuKzO58RZMfhgz3W', NULL, 1, 1, 0, '2016-08-31', '2016-09-01'),
(41, '100200309', 'medallo1@gmail.com', NULL, '$2y$10$0iUgo5DwedzvWqwTAhBe8.62nNrUZMWFSFW9G1hpelO47FV5PQ2ue', 'cxvZVFvbcBomGVClcVcGxJQZXIe30S9Ekx7zERml8BA1Z5HZ27v5h5YQ9gtq', NULL, 1, 1, 0, '2016-09-01', '2016-09-01'),
(42, '700800901', 'ederalvarez209105789@gmail.com', NULL, '$2y$10$IbcTtZRsVpVyMYFXvY0x1uvg929Tbb5dB/hQty7SG7.sC0I0Q07iq', 'DlCrZV1Z3Uu6vB2Dl727xXJkU7Fr1Rzow8miGhsnEMlp62Cl5079StSFTc0w', NULL, 1, 1, 0, '2016-09-01', '2016-09-01'),
(43, '1102365689', 'ederalvarez2091057q@gmail.com', NULL, '$2y$10$iPI/foencaEOUzLAU2lxxOi0wxewel.EMFWRIkxvfaZJdianv/k5.', 'WdlFsTT9B8OCimyxDqXG62kmcnF1uUXeynu2e80C1J5J1KuQ2hyZvv57iqYS', NULL, 1, 1, 0, '2016-09-01', '2016-09-01'),
(44, '1102365691', 'ederalvarez2091057e@gmail.com', NULL, '$2y$10$vtChsw6cGxOkkoTHxJbdu.NIx3uASvqm95cFNoHFiiYAhRPEpSrJG', 'x5T4uVH24RlADxmJTyVhoZFfbul8Kgwc6PJ4jy4e18nb5j6zLtqP1Hdmg1Z9', NULL, 1, 1, 0, '2016-09-01', '2016-09-01'),
(45, '500600700', 'ederalvarezw2091057@gmail.com', NULL, '$2y$10$9URVYnEM/YYy8sNyxWkLmOsNyJBoAKFuBWFLhmip3L3OyRPQ3Knn6', NULL, NULL, 1, 1, 0, '2016-09-01', '2016-09-01'),
(46, '1102365682', 'ederalvarez2091057e@gmail.com', NULL, '$2y$10$G8pVU9zxxB1GOGyZdOc1ROPJ4LMI8AhsE6au.wm5/mlYvDzqdqQru', 'lOWtzY7lcB8U8cdqubtnFA1kVrEtMqQ4sg7hMmJmk8Ma9SY0hbDsz672Twuh', NULL, 1, 1, 0, '2016-09-02', '2016-09-02'),
(47, '1102365681', 'ederalvarez2091057r@gmail.com', NULL, '$2y$10$b1pYtru3qIr9KKZKNKdSNeDO6oUDOUa1hFeu2SkRieS.zDoaUpdBG', NULL, NULL, 1, 1, 0, '2016-09-02', '2016-09-02'),
(48, '1102365683', 'ederalvarez2091057@gmail.com', NULL, '$2y$10$m7ZfNBdbKzgjIQQemcljBuENH2mrTmhvjEbYKPDvIbTm3OevqOMuO', NULL, NULL, 1, 1, 0, '2016-09-29', '2016-09-29');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `user_datos`
--

INSERT INTO `user_datos` (`id`, `user_id`, `barrio_id`, `nombre`, `apellido`, `cedula`, `nombre_negocio`, `ciudad`, `canal`, `direccion`, `telefono`, `comentarios`, `created_at`, `updated_at`) VALUES
(24, 28, 1, 'Edere', 'Alvarez', '110236568333', NULL, 1, 0, 'calle 20 # 24-27', '3013119199', NULL, '2016-01-22', '2016-05-19'),
(25, 3, 1, 'Admin', 'Pag', '13456543', NULL, 1, 0, 'calle 39 # 20-39 piso e', '3013119198', NULL, '2016-02-09', '2016-08-30'),
(27, 30, 1, 'Eder', 'Julian', '1102365685', 'DEFAULT', 1, 0, 'calle 17 #3w-65 miraflores torre 36 apto 11-30', '3013119198', 'Sin comentarios', '2016-03-06', '2016-03-06'),
(28, 31, 1, 'demi', 'lovato', '100200300', 'DEFAULT', 1, 0, 'cll 20', '3013119191', 'Sin comentarios', '2016-03-19', '2016-03-19'),
(29, 32, 1, 'ivan', 'rojas', '100200301', 'DEFAULT', 1, 0, NULL, '3098765454', 'Sin comentarios', '2016-03-19', '2016-03-19'),
(30, 33, 1, 'Sonia', 'Saenz', '63443106', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-04-01', '2016-04-01'),
(31, 34, 1, 'Carlos', 'Vaderrama', '1098693118', 'DEFAULT', 1, 0, NULL, '3008923070', 'Sin comentarios', '2016-04-01', '2016-04-01'),
(32, 35, 1, 'Jose luis', 'Rojas', '13444789', 'DEFAULT', 1, 0, NULL, '3009898234', 'Sin comentarios', '2016-04-01', '2016-04-01'),
(33, 36, 1, 'cesar', 'Castro', '1002003001', 'DEFAULT', 1, 0, NULL, '30002003001', 'Sin comentarios', '2016-04-09', '2016-04-09'),
(34, 37, 1, 'Yesid', 'mora', '1002003002', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-04-09', '2016-04-09'),
(35, 38, 1, 'prueba 5', 'la prueba 5', '100200306', 'DEFAULT', 1, 0, NULL, '1020202454', 'Sin comentarios', '2016-08-30', '2016-08-30'),
(36, 39, 1, 'Carlos', 'Valderrama', '1095123456', 'DEFAULT', 1, 0, NULL, '3025874545', 'Sin comentarios', '2016-08-31', '2016-08-31'),
(37, 40, 1, 'Brayan', 'Valderrama', '100200307', 'DEFAULT', 1, 0, NULL, '123456789', 'Sin comentarios', '2016-08-31', '2016-08-31'),
(38, 41, 1, 'Castolo', 'Pes', '100200309', 'DEFAULT', 1, 0, NULL, '3002584561', 'Sin comentarios', '2016-09-01', '2016-09-01'),
(39, 42, 1, 'Eder', 'Alvarez', '700800901', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-09-01', '2016-09-01'),
(40, 43, 1, 'Eder', 'Alvarez', '1102365689', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-09-01', '2016-09-01'),
(41, 44, 1, 'Eder', 'Alvarez', '1102365691', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-09-01', '2016-09-01'),
(42, 45, 1, 'Eder', 'Alvarez', '500600700', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-09-01', '2016-09-01'),
(43, 46, 1, 'Eder', 'Alvarez', '1102365682', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-09-02', '2016-09-02'),
(44, 47, 1, 'Eder', 'Alvarez', '1102365681', 'DEFAULT', 1, 0, NULL, '3110454545', 'Sin comentarios', '2016-09-02', '2016-09-02'),
(45, 48, 1, 'Eder', 'Alvarez', '1102365683', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-09-29', '2016-09-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_env`
--

CREATE TABLE IF NOT EXISTS `user_env` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contacto` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `dep_cod` int(11) NOT NULL,
  `ciu_cod` int(11) NOT NULL,
  `dir` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `user_env`
--

INSERT INTO `user_env` (`id`, `user_id`, `contacto`, `dep_cod`, `ciu_cod`, `dir`, `tel`, `created_at`, `updated_at`) VALUES
(1, 42, 'Euclides', 68, 68547, 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '3002584545', '2016-09-01', '2016-09-01'),
(2, 43, 'Eder', 68, 68547, 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '3013113138', '2016-09-01', '2016-09-01'),
(3, 44, 'eder alvarez', 11, 11001, 'calle 39 # 20-3', '3013119198', '2016-09-01', '2016-09-01'),
(4, 3, 'Eder', 68, 68001, 'calle 39 # 20-39 piso 2', '3013119198', '2016-09-06', '2016-09-06');

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

--
-- Volcado de datos para la tabla `user_favs`
--

INSERT INTO `user_favs` (`id`, `user_id`, `art_cod`, `created_at`, `updated_at`) VALUES
(9, 3, '933000', '2016-02-19', '2016-02-19'),
(10, 3, '931120', '2016-02-19', '2016-02-19'),
(11, 3, '931100', '2016-02-19', '2016-02-19'),
(12, 1, '000276', '2016-02-19', '2016-02-19'),
(13, 3, '931000              ', '2016-02-19', '2016-02-19'),
(14, 3, '010005', '2016-02-19', '2016-02-19');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
