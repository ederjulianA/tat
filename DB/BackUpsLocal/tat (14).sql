-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-08-2016 a las 01:18:24
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
  `InvGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cat_nom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `cat_slug` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `InvSubGruId` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `InvSubGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=308 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `InvGruCod`, `cat_nom`, `cat_slug`, `img`, `created_at`, `updated_at`, `InvSubGruId`, `InvSubGruCod`) VALUES
(1, '49', 'RECARGA VIRTUAL', NULL, '', '2016-04-09', '2016-04-09', '49-100', '100'),
(2, '35', 'VENTA MINUTOS COMCEL', NULL, '', '2016-04-09', '2016-04-09', '35-123', '123'),
(3, '1               ', 'CREMA PEINAR SAVITAL                              ', NULL, '', '2016-04-09', '2016-04-09', '277-277', '165'),
(4, '35', 'EQUIPOS CLARO MOSTRADOR', NULL, '', '2016-04-09', '2016-04-09', '35-02', '176'),
(5, 'G51', 'EQUIPOS CLARO', NULL, '', '2016-04-09', '2016-04-09', 'G51-03', '177'),
(6, '10008', 'CEREALES', NULL, '', '2016-04-09', '2016-04-09', 'G90-001', '178'),
(7, '10010', 'PAPELES Y CARTONES SA', NULL, '', '2016-04-09', '2016-04-09', 'G92-01', '179'),
(8, '10009', 'INVERSIONES AREVALO JP SAS', NULL, '', '2016-04-09', '2016-04-09', 'G91-01', '180'),
(9, '10011', 'ARROCERA AGUA CLARA SAS', NULL, '', '2016-04-09', '2016-04-09', '90-01', '181'),
(10, 'G24', 'CEREALES LISTOS', NULL, '', '2016-04-09', '2016-04-09', 'G24-289', '182'),
(11, 'G24', 'Toddy', NULL, '', '2016-04-09', '2016-04-09', 'G24-2', '303'),
(12, '10012', 'TIGO SIM CARD', NULL, '', '2016-04-09', '2016-04-09', 'G36-01', '304'),
(13, '10013', 'EMPAQUES', NULL, '', '2016-04-09', '2016-04-09', 'G93-01', '305'),
(14, 'G01', 'PREDATOR', NULL, '', '2016-04-09', '2016-04-09', 'G01-01', '306'),
(15, 'G09', 'HALOGENO', NULL, '', '2016-04-09', '2016-04-09', 'G09-01', '307'),
(16, 'G00', 'ACTIVADE N', NULL, '', '2016-04-09', '2016-04-09', 'G00-001', 'G00S001'),
(17, 'G00', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G00-040', 'G00S040'),
(18, 'G00', 'HUGGIES N', NULL, '', '2016-04-09', '2016-04-09', 'G00-047', 'G00S047'),
(19, 'G00', 'OBSEQUIOS CKC N', NULL, '', '2016-04-09', '2016-04-09', 'G00-051', 'G00S051'),
(20, 'G00', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G00-133', 'G00S133'),
(21, 'G00', 'PASPAN EMPACADA N', NULL, '', '2016-04-09', '2016-04-09', 'G00-136', 'G00S136'),
(22, 'G00', 'MANT.CRIOLLA N', NULL, '', '2016-04-09', '2016-04-09', 'G00-145', 'G00S145'),
(23, 'G00', 'REFRESCOS N', NULL, '', '2016-04-09', '2016-04-09', 'G00-166', 'G00S166'),
(24, 'G00', 'SERVICIOS VARIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G00-199', 'G00S199'),
(25, 'G01', 'ACTIVADE N', NULL, '', '2016-04-09', '2016-04-09', 'G01-001', 'G01S001'),
(26, 'G01', 'BATILADO N', NULL, '', '2016-04-09', '2016-04-09', 'G01-002', 'G01S002'),
(27, 'G01', 'BONAICE N', NULL, '', '2016-04-09', '2016-04-09', 'G01-003', 'G01S003'),
(28, 'G01', 'BONFRUT N', NULL, '', '2016-04-09', '2016-04-09', 'G01-004', 'G01S004'),
(29, 'G01', 'CALDO DO', NULL, '', '2016-04-09', '2016-04-09', 'G01-005', 'G01S005'),
(30, 'G01', 'CALDO RICOSTILLA N', NULL, '', '2016-04-09', '2016-04-09', 'G01-006', 'G01S006'),
(31, 'G01', 'CONFITERIA N', NULL, '', '2016-04-09', '2016-04-09', 'G01-007', 'G01S007'),
(32, 'G01', 'DEL FOGON N', NULL, '', '2016-04-09', '2016-04-09', 'G01-008', 'G01S008'),
(33, 'G01', 'EGO GEL N', NULL, '', '2016-04-09', '2016-04-09', 'G01-009', 'G01S009'),
(34, 'G01', 'FORTIDENT N', NULL, '', '2016-04-09', '2016-04-09', 'G01-010', 'G01S010'),
(35, 'G01', 'FRESCO FRUTI', NULL, '', '2016-04-09', '2016-04-09', 'G01-011', 'G01S011'),
(36, 'G01', 'FRESCO BOKA N', NULL, '', '2016-04-09', '2016-04-09', 'G01-012', 'G01S012'),
(37, 'G01', 'FRESCOS LIGHT N', NULL, '', '2016-04-09', '2016-04-09', 'G01-013', 'G01S013'),
(38, 'G01', 'FRESCOS YA N', NULL, '', '2016-04-09', '2016-04-09', 'G01-014', 'G01S014'),
(39, 'G01', 'FRUTIVE N', NULL, '', '2016-04-09', '2016-04-09', 'G01-015', 'G01S015'),
(40, 'G01', 'GELAGURT N', NULL, '', '2016-04-09', '2016-04-09', 'G01-016', 'G01S016'),
(41, 'G01', 'GELATINA FRUTI', NULL, '', '2016-04-09', '2016-04-09', 'G01-017', 'G01S017'),
(42, 'G01', 'INSTACREM N', NULL, '', '2016-04-09', '2016-04-09', 'G01-018', 'G01S018'),
(43, 'G01', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G01-019', 'G01S019'),
(44, 'G01', 'PULPIFRUTA N', NULL, '', '2016-04-09', '2016-04-09', 'G01-020', 'G01S020'),
(45, 'G01', 'SAVITAL N', NULL, '', '2016-04-09', '2016-04-09', 'G01-021', 'G01S021'),
(46, 'G01', 'SAZONE N', NULL, '', '2016-04-09', '2016-04-09', 'G01-022', 'G01S022'),
(47, 'G01', 'SOPERAS N', NULL, '', '2016-04-09', '2016-04-09', 'G01-023', 'G01S023'),
(48, 'G01', 'HOGARE', NULL, '', '2016-04-09', '2016-04-09', 'G01-024', 'G01S024'),
(49, 'G01', 'SUNTEA N', NULL, '', '2016-04-09', '2016-04-09', 'G01-025', 'G01S025'),
(50, 'G01', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G01-040', 'G01S040'),
(51, 'G01', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G01-092', 'G01S092'),
(52, 'G01', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G01-174', 'G01S174'),
(53, 'G01', 'AROMATEL N', NULL, '', '2016-04-09', '2016-04-09', 'G01-276', 'G01S276'),
(54, 'G01', 'CREMA PEINAR SAVITAL N', NULL, '', '2016-04-09', '2016-04-09', 'G01-277', 'G01S277'),
(55, 'G01', 'ACONDICIONADOR SAVITAL N', NULL, '', '2016-04-09', '2016-04-09', 'G01-278', 'G01S278'),
(56, 'G01', 'JABON SAVITAL N', NULL, '', '2016-04-09', '2016-04-09', 'G01-279', 'G01S279'),
(57, 'G01', 'DON GUSTICO N', NULL, '', '2016-04-09', '2016-04-09', 'G01-308', 'G01S308'),
(58, 'G01', 'VIVE 100 PEQUE', NULL, '', '2016-04-09', '2016-04-09', 'G01-312', 'G01S312'),
(59, 'G01', 'SUNTEA LIQUIDO N', NULL, '', '2016-04-09', '2016-04-09', 'G01-324', 'G01S324'),
(60, 'G01', 'SHAMPOO BIOEXPERT N', NULL, '', '2016-04-09', '2016-04-09', 'G01-335', 'G01S335'),
(61, 'G01', 'ACONDICIONADOR BIOEXPERT N', NULL, '', '2016-04-09', '2016-04-09', 'G01-336', 'G01S336'),
(62, 'G01', 'CREMA PARA PEINAR BIOEXPERT N', NULL, '', '2016-04-09', '2016-04-09', 'G01-337', 'G01S337'),
(63, 'G01', 'FORTIDEN BLANQUEADORA N', NULL, '', '2016-04-09', '2016-04-09', 'G01-351', 'G01S351'),
(64, 'G01', 'EGO SHAMPOO N', NULL, '', '2016-04-09', '2016-04-09', 'G01-352', 'G01S352'),
(65, 'G01', 'BATICREMA N', NULL, '', '2016-04-09', '2016-04-09', 'G01-353', 'G01S353'),
(66, 'G01', 'CEPILLO FORTIDENT N', NULL, '', '2016-04-09', '2016-04-09', 'G01-354', 'G01S354'),
(67, 'G01', 'DO', NULL, '', '2016-04-09', '2016-04-09', 'G01-355', 'G01S355'),
(68, 'G01', 'RICOSTILLA DESMENUZADO N', NULL, '', '2016-04-09', '2016-04-09', 'G01-356', 'G01S356'),
(69, 'G01', 'VIVE 100 GRANDE N', NULL, '', '2016-04-09', '2016-04-09', 'G01-357', 'G01S357'),
(70, 'G01', 'POPETAS N', NULL, '', '2016-04-09', '2016-04-09', 'G01-381', 'G01S381'),
(71, 'G02', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G02-019', 'G02S019'),
(72, 'G02', 'ACEITE CANOLI VITALE N', NULL, '', '2016-04-09', '2016-04-09', 'G02-031', 'G02S031'),
(73, 'G02', 'ACEITE GIRASOL N', NULL, '', '2016-04-09', '2016-04-09', 'G02-032', 'G02S032'),
(74, 'G02', 'ACEITE Z N', NULL, '', '2016-04-09', '2016-04-09', 'G02-033', 'G02S033'),
(75, 'G02', 'ACEITES CREMOSOS N', NULL, '', '2016-04-09', '2016-04-09', 'G02-034', 'G02S034'),
(76, 'G02', 'ACEITE DE OLIVA N', NULL, '', '2016-04-09', '2016-04-09', 'G02-035', 'G02S035'),
(77, 'G02', 'JABONES DE BARRAS N', NULL, '', '2016-04-09', '2016-04-09', 'G02-036', 'G02S036'),
(78, 'G02', 'LINEA PANADERIA N', NULL, '', '2016-04-09', '2016-04-09', 'G02-037', 'G02S037'),
(79, 'G02', 'MARGARINAS DE MESA N', NULL, '', '2016-04-09', '2016-04-09', 'G02-038', 'G02S038'),
(80, 'G02', 'SALSAS CAMPI N', NULL, '', '2016-04-09', '2016-04-09', 'G02-039', 'G02S039'),
(81, 'G02', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G02-040', 'G02S040'),
(82, 'G02', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G02-092', 'G02S092'),
(83, 'G03', 'PAP.HIG. SCOTT N', NULL, '', '2016-04-09', '2016-04-09', 'G03-046', 'G03S046'),
(84, 'G03', 'HUGGIES N', NULL, '', '2016-04-09', '2016-04-09', 'G03-047', 'G03S047'),
(85, 'G03', 'LINEA FEMENINA N', NULL, '', '2016-04-09', '2016-04-09', 'G03-048', 'G03S048'),
(86, 'G03', 'SERVILLETAS N', NULL, '', '2016-04-09', '2016-04-09', 'G03-049', 'G03S049'),
(87, 'G03', 'TOALLAS COCINA N', NULL, '', '2016-04-09', '2016-04-09', 'G03-050', 'G03S050'),
(88, 'G03', 'OBSEQUIOS CKC N', NULL, '', '2016-04-09', '2016-04-09', 'G03-051', 'G03S051'),
(89, 'G03', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G03-092', 'G03S092'),
(90, 'G04', 'ARROZ GELVEZ N', NULL, '', '2016-04-09', '2016-04-09', 'G04-056', 'G04S056'),
(91, 'G04', 'CAMISETAS N', NULL, '', '2016-04-09', '2016-04-09', 'G04-057', 'G04S057'),
(92, 'G04', 'MODIFICADORES DE LECHE N', NULL, '', '2016-04-09', '2016-04-09', 'G04-190', 'G04S190'),
(93, 'G04', 'GALLETAS N', NULL, '', '2016-04-09', '2016-04-09', 'G04-263', 'G04S263'),
(94, 'G05', 'ACEITE DE OLIVA N', NULL, '', '2016-04-09', '2016-04-09', 'G05-035', 'G05S035'),
(95, 'G05', 'AZUCAR N', NULL, '', '2016-04-09', '2016-04-09', 'G05-061', 'G05S061'),
(96, 'G05', 'BLANCOX N', NULL, '', '2016-04-09', '2016-04-09', 'G05-062', 'G05S062'),
(97, 'G05', 'LOZACREM N', NULL, '', '2016-04-09', '2016-04-09', 'G05-063', 'G05S063'),
(98, 'G05', 'SAL REFISAL N', NULL, '', '2016-04-09', '2016-04-09', 'G05-064', 'G05S064'),
(99, 'G05', 'SALEROS N', NULL, '', '2016-04-09', '2016-04-09', 'G05-065', 'G05S065'),
(100, 'G06', 'DETERGENTES N', NULL, '', '2016-04-09', '2016-04-09', 'G06-071', 'G06S071'),
(101, 'G06', 'JABONES DE BARRA N', NULL, '', '2016-04-09', '2016-04-09', 'G06-072', 'G06S072'),
(102, 'G06', 'MI SAL N', NULL, '', '2016-04-09', '2016-04-09', 'G06-073', 'G06S073'),
(103, 'G07', 'BLANCOX N', NULL, '', '2016-04-09', '2016-04-09', 'G07-062', 'G07S062'),
(104, 'G07', 'LOZACREM N', NULL, '', '2016-04-09', '2016-04-09', 'G07-063', 'G07S063'),
(105, 'G07', 'SAL REFISAL N', NULL, '', '2016-04-09', '2016-04-09', 'G07-064', 'G07S064'),
(106, 'G07', 'SALEROS N', NULL, '', '2016-04-09', '2016-04-09', 'G07-065', 'G07S065'),
(107, 'G07', 'BLANCOX N', NULL, '', '2016-04-09', '2016-04-09', 'G07-076', 'G07S076'),
(108, 'G07', 'HARINA EXTRAPARDO N', NULL, '', '2016-04-09', '2016-04-09', 'G07-077', 'G07S077'),
(109, 'G07', 'HARINA ROBINSON N', NULL, '', '2016-04-09', '2016-04-09', 'G07-078', 'G07S078'),
(110, 'G07', 'SALEROS N', NULL, '', '2016-04-09', '2016-04-09', 'G07-081', 'G07S081'),
(111, 'G07', 'LIMPIA PISOS N', NULL, '', '2016-04-09', '2016-04-09', 'G07-359', 'G07S359'),
(112, 'G08', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G08-019', 'G08S019'),
(113, 'G08', 'CRAZY-M&M N', NULL, '', '2016-04-09', '2016-04-09', 'G08-086', 'G08S086'),
(114, 'G08', 'MILKY WAY N', NULL, '', '2016-04-09', '2016-04-09', 'G08-087', 'G08S087'),
(115, 'G08', 'SNICKERS N', NULL, '', '2016-04-09', '2016-04-09', 'G08-088', 'G08S088'),
(116, 'G08', 'MASC.AVES N', NULL, '', '2016-04-09', '2016-04-09', 'G08-089', 'G08S089'),
(117, 'G08', 'MASC.GATOS N', NULL, '', '2016-04-09', '2016-04-09', 'G08-090', 'G08S090'),
(118, 'G08', 'MASC.PERROS N', NULL, '', '2016-04-09', '2016-04-09', 'G08-091', 'G08S091'),
(119, 'G08', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G08-092', 'G08S092'),
(120, 'G08', 'PEDIGREE MADRID N', NULL, '', '2016-04-09', '2016-04-09', 'G08-281', 'G08S281'),
(121, 'G08', 'MASC VITAL RC N', NULL, '', '2016-04-09', '2016-04-09', 'G08-316', 'G08S316'),
(122, 'G08', 'MASC SANO CREC N', NULL, '', '2016-04-09', '2016-04-09', 'G08-317', 'G08S317'),
(123, 'G08', 'MASC ETPA 2 N', NULL, '', '2016-04-09', '2016-04-09', 'G08-318', 'G08S318'),
(124, 'G08', 'MASC ETPA 3 N', NULL, '', '2016-04-09', '2016-04-09', 'G08-319', 'G08S319'),
(125, 'G08', 'POUCH N', NULL, '', '2016-04-09', '2016-04-09', 'G08-358', 'G08S358'),
(126, 'G09', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G09-092', 'G09S092'),
(127, 'G09', 'FLOFI N', NULL, '', '2016-04-09', '2016-04-09', 'G09-096', 'G09S096'),
(128, 'G09', 'BOMBILLOS N', NULL, '', '2016-04-09', '2016-04-09', 'G09-097', 'G09S097'),
(129, 'G09', 'CONDONES N', NULL, '', '2016-04-09', '2016-04-09', 'G09-098', 'G09S098'),
(130, 'G09', 'FOSFOROS N', NULL, '', '2016-04-09', '2016-04-09', 'G09-099', 'G09S099'),
(131, 'G09', 'FRUTA LISTA N', NULL, '', '2016-04-09', '2016-04-09', 'G09-100', 'G09S100'),
(132, 'G09', 'LINEA OXY N', NULL, '', '2016-04-09', '2016-04-09', 'G09-101', 'G09S101'),
(133, 'G09', 'PALILLOS FESTIVAL N', NULL, '', '2016-04-09', '2016-04-09', 'G09-102', 'G09S102'),
(134, 'G09', 'SOPAS MARUCHAN N', NULL, '', '2016-04-09', '2016-04-09', 'G09-103', 'G09S103'),
(135, 'G09', 'ATUNES N', NULL, '', '2016-04-09', '2016-04-09', 'G09-104', 'G09S104'),
(136, 'G09', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G09-109', 'G09S109'),
(137, 'G09', 'LINEA DUO N', NULL, '', '2016-04-09', '2016-04-09', 'G09-261', 'G09S261'),
(138, 'G09', 'SARDINAS N', NULL, '', '2016-04-09', '2016-04-09', 'G09-262', 'G09S262'),
(139, 'G09', 'PALOMITAS DE MAIZ N', NULL, '', '2016-04-09', '2016-04-09', 'G09-310', 'G09S310'),
(140, 'G09', 'LINEA MEDICURE N', NULL, '', '2016-04-09', '2016-04-09', 'G09-327', 'G09S327'),
(141, 'G09', 'LINEA VIRGINIA N', NULL, '', '2016-04-09', '2016-04-09', 'G09-329', 'G09S329'),
(142, 'G09', 'ZAIMELA N', NULL, '', '2016-04-09', '2016-04-09', 'G09-330', 'G09S330'),
(143, 'G09', 'MAXICLEAN N', NULL, '', '2016-04-09', '2016-04-09', 'G09-331', 'G09S331'),
(144, 'G09', 'LINEA BARBASOL N', NULL, '', '2016-04-09', '2016-04-09', 'G09-332', 'G09S332'),
(145, 'G09', 'WESTING HOUSE N', NULL, '', '2016-04-09', '2016-04-09', 'G09-339', 'G09S339'),
(146, 'G09', 'LINEA FOGO N', NULL, '', '2016-04-09', '2016-04-09', 'G09-340', 'G09S340'),
(147, 'G09', 'WIN N', NULL, '', '2016-04-09', '2016-04-09', 'G09-341', 'G09S341'),
(148, 'G09', 'NEON N', NULL, '', '2016-04-09', '2016-04-09', 'G09-342', 'G09S342'),
(149, 'G09', 'PANDA N', NULL, '', '2016-04-09', '2016-04-09', 'G09-343', 'G09S343'),
(150, 'G09', 'LINEA FESTIVAL N', NULL, '', '2016-04-09', '2016-04-09', 'G09-344', 'G09S344'),
(151, 'G10', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G10-092', 'G10S092'),
(152, 'G10', 'ALIMENTOS N', NULL, '', '2016-04-09', '2016-04-09', 'G10-106', 'G10S106'),
(153, 'G10', 'MEDICAMENTOS N', NULL, '', '2016-04-09', '2016-04-09', 'G10-107', 'G10S107'),
(154, 'G10', 'SUCRAX N', NULL, '', '2016-04-09', '2016-04-09', 'G10-108', 'G10S108'),
(155, 'G10', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G10-109', 'G10S109'),
(156, 'G10', 'MEDICAMENTOS N', NULL, '', '2016-04-09', '2016-04-09', 'G10-111', 'G10S111'),
(157, 'G11', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G11-019', 'G11S019'),
(158, 'G11', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G11-092', 'G11S092'),
(159, 'G11', 'PRODUCTOS VETERINARIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G11-110', 'G11S110'),
(160, 'G11', 'MEDICAMENTOS N', NULL, '', '2016-04-09', '2016-04-09', 'G11-111', 'G11S111'),
(161, 'G11', 'VENENOS N', NULL, '', '2016-04-09', '2016-04-09', 'G11-265', 'G11S265'),
(162, 'G12', 'ALIMENTOS INSTANTANEOS N', NULL, '', '2016-04-09', '2016-04-09', 'G12-116', 'G12S116'),
(163, 'G12', 'FORTIPLATANO N', NULL, '', '2016-04-09', '2016-04-09', 'G12-117', 'G12S117'),
(164, 'G12', 'FORTIMAIZ N', NULL, '', '2016-04-09', '2016-04-09', 'G12-118', 'G12S118'),
(165, 'G12', 'MALTEADA,CEREALES N', NULL, '', '2016-04-09', '2016-04-09', 'G12-119', 'G12S119'),
(166, 'G13', 'ADEREZOS N', NULL, '', '2016-04-09', '2016-04-09', 'G13-125', 'G13S125'),
(167, 'G13', 'COMPOTAS N', NULL, '', '2016-04-09', '2016-04-09', 'G13-126', 'G13S126'),
(168, 'G13', 'ENLATADOS N', NULL, '', '2016-04-09', '2016-04-09', 'G13-127', 'G13S127'),
(169, 'G13', 'ESENCIAS N', NULL, '', '2016-04-09', '2016-04-09', 'G13-128', 'G13S128'),
(170, 'G13', 'INSTITUCIONAL N', NULL, '', '2016-04-09', '2016-04-09', 'G13-129', 'G13S129'),
(171, 'G13', 'JUGOS N', NULL, '', '2016-04-09', '2016-04-09', 'G13-130', 'G13S130'),
(172, 'G13', 'MERMELADAS N', NULL, '', '2016-04-09', '2016-04-09', 'G13-131', 'G13S131'),
(173, 'G13', 'SALSAS N', NULL, '', '2016-04-09', '2016-04-09', 'G13-132', 'G13S132'),
(174, 'G13', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G13-133', 'G13S133'),
(175, 'G14', 'PASPAN EMPACADA N', NULL, '', '2016-04-09', '2016-04-09', 'G14-136', 'G14S136'),
(176, 'G14', 'PASPAN PANADERIA N', NULL, '', '2016-04-09', '2016-04-09', 'G14-137', 'G14S137'),
(177, 'G15', 'LECHE EN POLVO N', NULL, '', '2016-04-09', '2016-04-09', 'G15-140', 'G15S140'),
(178, 'G15', 'DELIAVENA N', NULL, '', '2016-04-09', '2016-04-09', 'G15-141', 'G15S141'),
(179, 'G16', 'MANT.CRIOLLA N', NULL, '', '2016-04-09', '2016-04-09', 'G16-145', 'G16S145'),
(180, 'G17', 'PANELA N', NULL, '', '2016-04-09', '2016-04-09', 'G17-149', 'G17S149'),
(181, 'G18', 'SONY CARBON N', NULL, '', '2016-04-09', '2016-04-09', 'G18-155', 'G18S155'),
(182, 'G18', 'SONY ALCALINA N', NULL, '', '2016-04-09', '2016-04-09', 'G18-156', 'G18S156'),
(183, 'G18', 'LINTERNAS N', NULL, '', '2016-04-09', '2016-04-09', 'G18-157', 'G18S157'),
(184, 'G19', 'CAMPESINA N', NULL, '', '2016-04-09', '2016-04-09', 'G19-161', 'G19S161'),
(185, 'G20', 'HARINA LA NIEVE N', NULL, '', '2016-04-09', '2016-04-09', 'G20-164', 'G20S164'),
(186, 'G21', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G21-092', 'G21S092'),
(187, 'G21', 'REFRESCOS N', NULL, '', '2016-04-09', '2016-04-09', 'G21-166', 'G21S166'),
(188, 'G21', 'JUGOS N', NULL, '', '2016-04-09', '2016-04-09', 'G21-167', 'G21S167'),
(189, 'G21', 'BEBIDAS ISOTONICAS N', NULL, '', '2016-04-09', '2016-04-09', 'G21-168', 'G21S168'),
(190, 'G22', 'BIBERONES N', NULL, '', '2016-04-09', '2016-04-09', 'G22-170', 'G22S170'),
(191, 'G22', 'ESPONJAS N', NULL, '', '2016-04-09', '2016-04-09', 'G22-171', 'G22S171'),
(192, 'G22', 'GUANTES N', NULL, '', '2016-04-09', '2016-04-09', 'G22-172', 'G22S172'),
(193, 'G22', 'LIMPIADORES N', NULL, '', '2016-04-09', '2016-04-09', 'G22-173', 'G22S173'),
(194, 'G23', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G23-092', 'G23S092'),
(195, 'G23', 'CARAMELOS DE LECHE N', NULL, '', '2016-04-09', '2016-04-09', 'G23-180', 'G23S180'),
(196, 'G23', 'GOMAS N', NULL, '', '2016-04-09', '2016-04-09', 'G23-181', 'G23S181'),
(197, 'G23', 'CHICLES N', NULL, '', '2016-04-09', '2016-04-09', 'G23-182', 'G23S182'),
(198, 'G23', 'CARAMELOS DUROS N', NULL, '', '2016-04-09', '2016-04-09', 'G23-183', 'G23S183'),
(199, 'G23', 'SNACKS N', NULL, '', '2016-04-09', '2016-04-09', 'G23-184', 'G23S184'),
(200, 'G23', 'REFRESCANTES N', NULL, '', '2016-04-09', '2016-04-09', 'G23-185', 'G23S185'),
(201, 'G23', 'CARAMELOS MASTICABLES N', NULL, '', '2016-04-09', '2016-04-09', 'G23-186', 'G23S186'),
(202, 'G23', 'TURRONES N', NULL, '', '2016-04-09', '2016-04-09', 'G23-187', 'G23S187'),
(203, 'G23', 'MASMELOS N', NULL, '', '2016-04-09', '2016-04-09', 'G23-188', 'G23S188'),
(204, 'G24', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G24-040', 'G24S040'),
(205, 'G24', 'MASC.PERROS N', NULL, '', '2016-04-09', '2016-04-09', 'G24-091', 'G24S091'),
(206, 'G24', 'MODIFICADORES DE LECHE N', NULL, '', '2016-04-09', '2016-04-09', 'G24-190', 'G24S190'),
(207, 'G24', 'CEREALES INFANTILES N', NULL, '', '2016-04-09', '2016-04-09', 'G24-191', 'G24S191'),
(208, 'G24', 'AVENAS QUAKER N', NULL, '', '2016-04-09', '2016-04-09', 'G24-193', 'G24S193'),
(209, 'G24', 'AVENAS DON PACHO N', NULL, '', '2016-04-09', '2016-04-09', 'G24-194', 'G24S194'),
(210, 'G24', 'OTROS DESAYUNOS N', NULL, '', '2016-04-09', '2016-04-09', 'G24-197', 'G24S197'),
(211, 'G24', 'HARINAS PRECOCIDAS DE MAIZ N', NULL, '', '2016-04-09', '2016-04-09', 'G24-198', 'G24S198'),
(212, 'G24', 'MASCOTA PERRO DOGURMET N', NULL, '', '2016-04-09', '2016-04-09', 'G24-309', 'G24S309'),
(213, 'G24', 'MASCOTA PERRO DONKAN N', NULL, '', '2016-04-09', '2016-04-09', 'G24-311', 'G24S311'),
(214, 'G25', 'LINEA POPULAR N', NULL, '', '2016-04-09', '2016-04-09', 'G25-041', 'G25S041'),
(215, 'G25', 'LINEA SUPER BLANCO N', NULL, '', '2016-04-09', '2016-04-09', 'G25-042', 'G25S042'),
(216, 'G25', 'LINEA SERVILLETAS-TOALLAS N', NULL, '', '2016-04-09', '2016-04-09', 'G25-043', 'G25S043'),
(217, 'G25', 'LINEA INSTITUCIONAL N', NULL, '', '2016-04-09', '2016-04-09', 'G25-044', 'G25S044'),
(218, 'G26', 'SERVICIOS VARIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G26-199', 'G26S199'),
(219, 'G26', 'CARROS CANASTAS N', NULL, '', '2016-04-09', '2016-04-09', 'G26-260', 'G26S260'),
(220, 'G27', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G27-092', 'G27S092'),
(221, 'G27', 'CIGARRILLOS NACIONALES N', NULL, '', '2016-04-09', '2016-04-09', 'G27-210', 'G27S210'),
(222, 'G28', 'REFRESCOS N', NULL, '', '2016-04-09', '2016-04-09', 'G28-166', 'G28S166'),
(223, 'G29', 'FORTIPLATANO N', NULL, '', '2016-04-09', '2016-04-09', 'G29-117', 'G29S117'),
(224, 'G29', 'FORTIMAIZ N', NULL, '', '2016-04-09', '2016-04-09', 'G29-118', 'G29S118'),
(225, 'G29', 'MALTEADA,CEREALES N', NULL, '', '2016-04-09', '2016-04-09', 'G29-119', 'G29S119'),
(226, 'G30', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G30-019', 'G30S019'),
(227, 'G31', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G31-019', 'G31S019'),
(228, 'G31', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G31-092', 'G31S092'),
(229, 'G31', 'SCHICK N', NULL, '', '2016-04-09', '2016-04-09', 'G31-266', 'G31S266'),
(230, 'G31', 'ENERGIZER N', NULL, '', '2016-04-09', '2016-04-09', 'G31-267', 'G31S267'),
(231, 'G31', 'LINTERNAS N', NULL, '', '2016-04-09', '2016-04-09', 'G31-364', 'G31S364'),
(232, 'G32', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G32-019', 'G32S019'),
(233, 'G32', 'GALLETAS N', NULL, '', '2016-04-09', '2016-04-09', 'G32-263', 'G32S263'),
(234, 'G33', 'RIOPAILA N', NULL, '', '2016-04-09', '2016-04-09', 'G33-083', 'G33S083'),
(235, 'G50', 'RECARGA VIRTUAL N', NULL, '', '2016-04-09', '2016-04-09', 'G50-249', 'G50S249'),
(236, 'G50', 'RECARGAS MOVILWAY N', NULL, '', '2016-04-09', '2016-04-09', 'G50-380', 'G50S380'),
(237, 'G51', 'SIN DEFINIR N', NULL, '', '2016-04-09', '2016-04-09', 'G51-S000', 'G51S000'),
(238, 'G51', 'PRODUCTOS COMCEL N', NULL, '', '2016-04-09', '2016-04-09', 'G51-S250', 'G51S250'),
(239, 'G51', 'VENTA MINUTOS N', NULL, '', '2016-04-09', '2016-04-09', 'G51-S320', 'G51S320'),
(240, 'G52', 'TARJETAS TIGO N', NULL, '', '2016-04-09', '2016-04-09', 'G52-251', 'G52S251'),
(241, 'G53', 'MOVISTAR N', NULL, '', '2016-04-09', '2016-04-09', 'G53-252', 'G53S252'),
(242, 'G54', 'TELECOM N', NULL, '', '2016-04-09', '2016-04-09', 'G54-253', 'G54S253'),
(243, 'G55', 'AVANTEL N', NULL, '', '2016-04-09', '2016-04-09', 'G55-254', 'G55S254'),
(244, 'G57', 'SIMCARD UFF N', NULL, '', '2016-04-09', '2016-04-09', 'G57-264', 'G57S264'),
(245, '42', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G58-019', 'G58S019'),
(246, '42', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G58-092', 'G58S092'),
(247, '42', 'GRANOS N', NULL, '', '2016-04-09', '2016-04-09', 'G58-269', 'G58S269'),
(248, '42', 'ARROZ LA HUERTA N', NULL, '', '2016-04-09', '2016-04-09', 'G58-280', 'G58S280'),
(249, 'G59', 'GRANOS N', NULL, '', '2016-04-09', '2016-04-09', 'G59-269', 'G59S269'),
(250, 'G60', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G60-092', 'G60S092'),
(251, 'G60', 'BABYSEC N', NULL, '', '2016-04-09', '2016-04-09', 'G60-270', 'G60S270'),
(252, 'G60', 'LADYSOFT N', NULL, '', '2016-04-09', '2016-04-09', 'G60-271', 'G60S271'),
(253, 'G60', 'SERVILLETA-COCINA N', NULL, '', '2016-04-09', '2016-04-09', 'G60-272', 'G60S272'),
(254, 'G60', 'LINEA NOBLE N', NULL, '', '2016-04-09', '2016-04-09', 'G60-273', 'G60S273'),
(255, 'G60', 'LINEA ELITE N', NULL, '', '2016-04-09', '2016-04-09', 'G60-274', 'G60S274'),
(256, 'G60', 'COTIDIAN N', NULL, '', '2016-04-09', '2016-04-09', 'G60-275', 'G60S275'),
(257, 'G60', 'ULTRA *1 N', NULL, '', '2016-04-09', '2016-04-09', 'G60-360', 'G60S360'),
(258, 'G60', 'DUO AMARILLO N', NULL, '', '2016-04-09', '2016-04-09', 'G60-361', 'G60S361'),
(259, 'G60', 'DUO ROJO N', NULL, '', '2016-04-09', '2016-04-09', 'G60-362', 'G60S362'),
(260, 'G60', 'ELITE*1 N', NULL, '', '2016-04-09', '2016-04-09', 'G60-363', 'G60S363'),
(261, 'G61', 'GRANOS N', NULL, '', '2016-04-09', '2016-04-09', 'G61-269', 'G61S269'),
(262, 'G62', 'ARROZ LA HUERTA N', NULL, '', '2016-04-09', '2016-04-09', 'G62-280', 'G62S280'),
(263, 'G74', 'ARROZ ZULIA N', NULL, '', '2016-04-09', '2016-04-09', 'G74-321', 'G74S321'),
(264, 'G74', 'ARROZ ORO N', NULL, '', '2016-04-09', '2016-04-09', 'G74-322', 'G74S322'),
(265, 'G74', 'ARROZ CRISTAL N', NULL, '', '2016-04-09', '2016-04-09', 'G74-323', 'G74S323'),
(266, 'G75', 'ARROZ ROA N', NULL, '', '2016-04-09', '2016-04-09', 'G75-301', 'G75S301'),
(267, 'G75', 'ARROZ ESPECIALIDADES N', NULL, '', '2016-04-09', '2016-04-09', 'G75-302', 'G75S302'),
(268, 'G75', 'SOPAS ROA N', NULL, '', '2016-04-09', '2016-04-09', 'G75-303', 'G75S303'),
(269, 'G75', 'CEREAL KRUNCHOOS N', NULL, '', '2016-04-09', '2016-04-09', 'G75-304', 'G75S304'),
(270, 'G75', 'APANA ROA N', NULL, '', '2016-04-09', '2016-04-09', 'G75-305', 'G75S305'),
(271, 'G75', 'ARROZ CON LECHE N', NULL, '', '2016-04-09', '2016-04-09', 'G75-306', 'G75S306'),
(272, 'G75', 'ARROZ FLOR HUILA N', NULL, '', '2016-04-09', '2016-04-09', 'G75-307', 'G75S307'),
(273, 'G76', 'SIN DEFINIR N', NULL, '', '2016-04-09', '2016-04-09', 'G76-000', 'G76S000'),
(274, 'G76', 'RECARGA VIRTUAL N', NULL, '', '2016-04-09', '2016-04-09', 'G76-249', 'G76S249'),
(275, 'G76', 'MOVISTAR N', NULL, '', '2016-04-09', '2016-04-09', 'G76-252', 'G76S252'),
(276, 'G77', 'OBSEQUIOS N', NULL, '', '2016-04-09', '2016-04-09', 'G77-092', 'G77S092'),
(277, 'G77', 'ARROZ FLOR HUILA N', NULL, '', '2016-04-09', '2016-04-09', 'G77-307', 'G77S307'),
(278, 'G78', 'ATUN ABRE FACIL N', NULL, '', '2016-04-09', '2016-04-09', 'G78-282', 'G78S282'),
(279, 'G79', 'TRANZA PARTICIPACION N', NULL, '', '2016-04-09', '2016-04-09', 'G79-313', 'G79S313'),
(280, 'G80', 'FULL CARGA PARTICIPACION N', NULL, '', '2016-04-09', '2016-04-09', 'G80-314', 'G80S314'),
(281, 'G81', 'CONEXRED PARTICIPACION N', NULL, '', '2016-04-09', '2016-04-09', 'G81-315', 'G81S315'),
(282, 'G82', 'GOMITAS N', NULL, '', '2016-04-09', '2016-04-09', 'G82-325', 'G82S325'),
(283, 'G83', 'COMPOTAS HEINZ N', NULL, '', '2016-04-09', '2016-04-09', 'G83-326', 'G83S326'),
(284, 'G83', 'SALSA DE TOMATE HEINZ N', NULL, '', '2016-04-09', '2016-04-09', 'G83-333', 'G83S333'),
(285, 'G83', 'ADEREZOS HEINZ N', NULL, '', '2016-04-09', '2016-04-09', 'G83-334', 'G83S334'),
(286, 'G84', 'GASEOSA ONE KOLA N', NULL, '', '2016-04-09', '2016-04-09', 'G84-345', 'G84S345'),
(287, 'G84', 'ALOE JANNA N', NULL, '', '2016-04-09', '2016-04-09', 'G84-346', 'G84S346'),
(288, 'G84', 'TE GENESIS N', NULL, '', '2016-04-09', '2016-04-09', 'G84-347', 'G84S347'),
(289, 'G84', 'AGUA GENESIS N', NULL, '', '2016-04-09', '2016-04-09', 'G84-348', 'G84S348'),
(290, 'G85', 'VENTA MINUTOS N', NULL, '', '2016-04-09', '2016-04-09', 'G85-320', 'G85S320'),
(291, 'G86', 'COMPOTAS HEINZ N', NULL, '', '2016-04-09', '2016-04-09', 'G86-326', 'G86S326'),
(292, 'G86', 'OBSEQUIOS CORBETA N', NULL, '', '2016-04-09', '2016-04-09', 'G86-338', 'G86S338'),
(293, 'G87', 'NIVEA BODY N', NULL, '', '2016-04-09', '2016-04-09', 'G87-365', 'G87S365'),
(294, 'G87', 'NIVEA VISAGE N', NULL, '', '2016-04-09', '2016-04-09', 'G87-366', 'G87S366'),
(295, 'G87', 'NIVEA DEO N', NULL, '', '2016-04-09', '2016-04-09', 'G87-367', 'G87S367'),
(296, 'G87', 'NIVEA INTIMO N', NULL, '', '2016-04-09', '2016-04-09', 'G87-368', 'G87S368'),
(297, 'G87', 'NIVEA SUN N', NULL, '', '2016-04-09', '2016-04-09', 'G87-369', 'G87S369'),
(298, 'G87', 'NIVEA LIPCARE N', NULL, '', '2016-04-09', '2016-04-09', 'G87-370', 'G87S370'),
(299, 'G87', 'NIVEA HANDS N', NULL, '', '2016-04-09', '2016-04-09', 'G87-371', 'G87S371'),
(300, 'G87', 'NIVEA CREME N', NULL, '', '2016-04-09', '2016-04-09', 'G87-372', 'G87S372'),
(301, 'G87', 'NIVEA JABONES N', NULL, '', '2016-04-09', '2016-04-09', 'G87-373', 'G87S373'),
(302, 'G87', 'NIVEA MEN N', NULL, '', '2016-04-09', '2016-04-09', 'G87-374', 'G87S374'),
(303, 'G87', 'CONDONES DUO N', NULL, '', '2016-04-09', '2016-04-09', 'G87-375', 'G87S375'),
(304, 'G87', 'HANSPLAST N', NULL, '', '2016-04-09', '2016-04-09', 'G87-376', 'G87S376'),
(305, 'G88', 'ACEITES CARIBE N', NULL, '', '2016-04-09', '2016-04-09', 'G88-378', 'G88S378'),
(306, 'G88', 'JABON CLARO N', NULL, '', '2016-04-09', '2016-04-09', 'G88-379', 'G88S379'),
(307, 'G89', 'INDULECHE N', NULL, '', '2016-04-09', '2016-04-09', 'G89-382', 'G89S382');

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
  `key` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `llave` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pay_status` int(11) DEFAULT NULL,
  `conf` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=63 ;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `user_id`, `totalCart`, `total_compra`, `num_items`, `tipo_compra`, `vlr_envio`, `estado_id`, `key`, `llave`, `pay_status`, `conf`, `created_at`, `updated_at`) VALUES
(55, 28, 16600, 16600, 1, 2, 1000, 2, NULL, 'eder-20160729010710', 0, 0, '2016-07-29', '2016-07-29'),
(56, 28, 15650, 15650, 1, 2, 0, 2, NULL, NULL, NULL, 0, '2016-07-29', '2016-07-29'),
(57, 28, 20497, 20497, 5, 2, 1000, 1, NULL, 'eder-20160810020824', 0, 0, '2016-08-10', '2016-08-10'),
(58, 28, 15650, 15650, 1, 2, 1000, 1, NULL, 'eder-20160811120816', 0, 0, '2016-08-11', '2016-08-11'),
(59, 28, 15650, 15650, 1, 2, 1000, 1, NULL, NULL, NULL, 0, '2016-08-11', '2016-08-11'),
(60, 28, 16600, 16600, 1, 2, 1000, 1, NULL, 'eder-20160811180837', 0, 0, '2016-08-11', '2016-08-11'),
(61, 28, 16600, 16600, 1, 2, 1000, 1, NULL, NULL, NULL, 0, '2016-08-11', '2016-08-11'),
(62, 28, 16600, 16600, 1, 2, 1000, 1, NULL, 'eder-20160811210842', 0, 0, '2016-08-11', '2016-08-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_items`
--

CREATE TABLE IF NOT EXISTS `compra_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_id` int(11) NOT NULL,
  `ArtSec` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ArtCod` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=53 ;

--
-- Volcado de datos para la tabla `compra_items`
--

INSERT INTO `compra_items` (`id`, `compra_id`, `ArtSec`, `ArtCod`, `nombre`, `image`, `valor_unitario`, `iva`, `cantidad`, `valor_total`, `id_producto`, `created_at`, `updated_at`) VALUES
(47, 55, '10001               ', '924800', 'Celular samsung', 'http://somic.com.co:8081/MantisWeb20mantis2016/PublicTempStorage/multimedia/samsung_galaxy_coreprime_bla_k1501064077008B_160145486_71c92c206a244f2dad9362fdf66b22ab.jpg', 14310, 16, 1, 16600, 1, '2016-07-29', '2016-07-29'),
(48, 56, NULL, NULL, 'LISTON 8 * 5 * 1.5 MTS INMUNIZADO', 'img/Mantis/def.png', 15650, 0, 1, 15650, 2, '2016-07-29', '2016-07-29'),
(49, 57, '10087', '340173', 'GERFOR RDE 21 TRAMO 1/2"', 'img/Mantis/def.png', 3534, 16, 5, 20497, 23, '2016-08-10', '2016-08-10'),
(50, 58, '10062', '090281', 'LISTON 8 * 5 * 1.5 MTS INMUNIZADO', 'img/Mantis/def.png', 15650, 0, 1, 15650, 2, '2016-08-11', '2016-08-11'),
(51, 60, '10001               ', '924800', 'Celular samsung', 'http://somic.com.co:8081/MantisWeb20mantis2016/PublicTempStorage/multimedia/samsung_galaxy_coreprime_bla_k1501064077008B_160145486_71c92c206a244f2dad9362fdf66b22ab.jpg', 14310, 16, 1, 16600, 1, '2016-08-11', '2016-08-11'),
(52, 62, '10001               ', '924800', 'Celular samsung', 'http://somic.com.co:8081/MantisWeb20mantis2016/PublicTempStorage/multimedia/samsung_galaxy_coreprime_bla_k1501064077008B_160145486_71c92c206a244f2dad9362fdf66b22ab.jpg', 14310, 16, 1, 16600, 1, '2016-08-11', '2016-08-11');

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
(1, '192.168.1.241', 'erpdat', 'sa', 'Mantis321', 'http://192.168.1.241:8080/MantisWeb20mangam/PublicTempStorage/multimedia/', '2015-10-29', '2016-04-14'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=76 ;

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
(74, 4, 2, '2015-06-23', '2015-06-23'),
(75, 4, 3, '2015-06-23', '2015-06-23');

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
(1, 'Pendiente de Confirmar pago', '0000-00-00', '0000-00-00'),
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
  `fam_InvSubGruCod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=738 ;

--
-- Volcado de datos para la tabla `inventariofamilia`
--

INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(1, '003', '003', 'MARGARITAS', 'margaritas', '', '2016-04-14', '2016-04-14'),
(2, '004', '004', 'SOPORTE CORTINA                                             ', 'soporte-cortina', '', '2016-04-14', '2016-04-14'),
(3, '005', '005', 'TERMINAL CORTINA                                            ', 'terminal-cortina', '', '2016-04-14', '2016-04-14'),
(4, '006', '006', 'TUBO CORTINA                                                ', 'tubo-cortina', '', '2016-04-14', '2016-04-14'),
(5, '444', '444', 'PISTON PLASTICO                                             ', 'piston-plastico', '', '2016-04-14', '2016-04-14'),
(6, '809', '809', 'CAL', 'cal', '', '2016-04-14', '2016-04-14'),
(7, '818', '818', 'FAMILIA INAL', 'familia-inal', '', '2016-04-14', '2016-04-14'),
(8, '819', '819', 'MATERIA PRIMA', 'materia-prima', '', '2016-04-14', '2016-04-14'),
(9, '820', '820', 'PRODUCTO TERMINADO', 'producto-terminado', '', '2016-04-14', '2016-04-14'),
(10, '821', '821', 'MP', 'mp', '', '2016-04-14', '2016-04-14'),
(11, '822', '822', 'PTERMINADO', 'pterminado', '', '2016-04-14', '2016-04-14'),
(12, '007', '007', 'ALAMBRE PLASTICO                                            ', 'alambre-plastico', '', '2016-04-14', '2016-04-14'),
(13, '008', '008', 'ATA TODO                                                    ', 'ata-todo', '', '2016-04-14', '2016-04-14'),
(14, '009', '009', 'CABLE MATIZADO                                              ', 'cable-matizado', '', '2016-04-14', '2016-04-14'),
(15, '010', '010', 'CADENA                                                      ', 'cadena', '', '2016-04-14', '2016-04-14'),
(16, '011', '011', 'MADEJA DE PIOLA                                             ', 'madeja-de-piola', '', '2016-04-14', '2016-04-14'),
(17, '012', '012', 'MANILA                                                      ', 'manila', '', '2016-04-14', '2016-04-14'),
(18, '013', '013', 'MIMBRE                                                      ', 'mimbre', '', '2016-04-14', '2016-04-14'),
(19, '014', '014', 'NYLON                                                       ', 'nylon', '', '2016-04-14', '2016-04-14'),
(20, '806', '806', 'BATERIAS', 'baterias', '', '2016-04-14', '2016-04-14'),
(21, '810', '810', 'INTERESES', 'intereses', '', '2016-04-14', '2016-04-14'),
(22, '015', '015', 'SOGA MARINO                                                 ', 'soga-marino', '', '2016-04-14', '2016-04-14'),
(23, '016', '016', 'SOGA NAUTICA                                                ', 'soga-nautica', '', '2016-04-14', '2016-04-14'),
(24, '017', '017', 'SOGA RAFIA                                                  ', 'soga-rafia', '', '2016-04-14', '2016-04-14'),
(25, '018', '018', 'TUBITO                                                      ', 'tubito', '', '2016-04-14', '2016-04-14'),
(26, '019', '019', 'ADHESIVOS                                                   ', 'adhesivos', '', '2016-04-14', '2016-04-14'),
(27, '020', '020', 'COLBON                                                      ', 'colbon', '', '2016-04-14', '2016-04-14'),
(28, '021', '021', 'MASILLAS                                                    ', 'masillas', '', '2016-04-14', '2016-04-14'),
(29, '022', '022', 'PEGANTE AMARILLO                                            ', 'pegante-amarillo', '', '2016-04-14', '2016-04-14'),
(30, '023', '023', 'SINTESOLDA                                                  ', 'sintesolda', '', '2016-04-14', '2016-04-14'),
(31, '024', '024', 'SILICONAS                                                   ', 'siliconas', '', '2016-04-14', '2016-04-14'),
(32, '059', '059', 'CANDADOS SECURITY                                           ', 'candados-security', '', '2016-04-14', '2016-04-14'),
(33, '060', '060', 'CANDADO TIPO ALEMAN                                         ', 'candado-tipo-aleman', '', '2016-04-14', '2016-04-14'),
(34, '061', '061', 'CANDADO TIPO ITALIANO                                       ', 'candado-tipo-italiano', '', '2016-04-14', '2016-04-14'),
(35, '062', '062', 'ESCUDO                                                      ', 'escudo', '', '2016-04-14', '2016-04-14'),
(36, '063', '063', 'MANIJA                                                      ', 'manija', '', '2016-04-14', '2016-04-14'),
(37, '064', '064', 'PORTACANDADO INDUMA                                         ', 'portacandado-induma', '', '2016-04-14', '2016-04-14'),
(38, '065', '065', 'PORTACANDADO SIMPLE                                         ', 'portacandado-simple', '', '2016-04-14', '2016-04-14'),
(39, '785', '785', 'INJERTO', 'injerto', '', '2016-04-14', '2016-04-14'),
(40, '794', '794', 'CALIBRADOR', 'calibrador', '', '2016-04-14', '2016-04-14'),
(41, '795', '795', 'LLAVE LAVADORA', 'llave-lavadora', '', '2016-04-14', '2016-04-14'),
(42, '043', '043', 'GUARDAESCOBAS INTERMATEX                                    ', 'guardaescobas-intermatex', '', '2016-04-14', '2016-04-14'),
(43, '044', '044', 'LISTELOS INTERMATEX                                         ', 'listelos-intermatex', '', '2016-04-14', '2016-04-14'),
(44, '045', '045', 'MOLDURAS INTERMATEX                                         ', 'molduras-intermatex', '', '2016-04-14', '2016-04-14'),
(45, '046', '046', 'TACOS INTERMATEX                                            ', 'tacos-intermatex', '', '2016-04-14', '2016-04-14'),
(46, '047', '047', 'TRENZA INTERMATEX                                           ', 'trenza-intermatex', '', '2016-04-14', '2016-04-14'),
(47, '048', '048', 'LISTELO ZAFIRO                                              ', 'listelo-zafiro', '', '2016-04-14', '2016-04-14'),
(48, '049', '049', 'BOQUILLA                                                    ', 'boquilla', '', '2016-04-14', '2016-04-14'),
(49, '050', '050', 'CONCOLOR                                                    ', 'concolor', '', '2016-04-14', '2016-04-14'),
(50, '815', '815', 'PEDESTAL ALFA', 'pedestal-alfa', '', '2016-04-14', '2016-04-14'),
(51, '816', '816', 'ACCESORIOS ALFA', 'accesorios-alfa', '', '2016-04-14', '2016-04-14'),
(52, '051', '051', 'EUROCOLOR                                                   ', 'eurocolor', '', '2016-04-14', '2016-04-14'),
(53, '052', '052', 'EUROPEGA                                                    ', 'europega', '', '2016-04-14', '2016-04-14'),
(54, '053', '053', 'MINERAL                                                     ', 'mineral', '', '2016-04-14', '2016-04-14'),
(55, '054', '054', 'PEGACOR                                                     ', 'pegacor', '', '2016-04-14', '2016-04-14'),
(56, '055', '055', 'PEGOPERFECTO                                                ', 'pegoperfecto', '', '2016-04-14', '2016-04-14'),
(57, '056', '056', 'WINES                                                       ', 'wines', '', '2016-04-14', '2016-04-14'),
(58, '057', '057', 'CANDADOS EGRET                                              ', 'candados-egret', '', '2016-04-14', '2016-04-14'),
(59, '058', '058', 'CANDADOS PROFESIONAL                                        ', 'candados-profesional', '', '2016-04-14', '2016-04-14'),
(60, '790', '790', 'COMBO ALFA', 'combo-alfa', '', '2016-04-14', '2016-04-14'),
(61, '793', '793', 'CHAPA MUEBLE', 'chapa-mueble', '', '2016-04-14', '2016-04-14'),
(62, '025', '025', 'SUPERCRYL                                                   ', 'supercryl', '', '2016-04-14', '2016-04-14'),
(63, '026', '026', 'CAUCHOS                                                     ', 'cauchos', '', '2016-04-14', '2016-04-14'),
(64, '027', '027', 'CUADRANTES                                                  ', 'cuadrantes', '', '2016-04-14', '2016-04-14'),
(65, '028', '028', 'CUCHILLAS                                                   ', 'cuchillas', '', '2016-04-14', '2016-04-14'),
(66, '029', '029', 'TAPON OLLA                                                  ', 'tapon-olla', '', '2016-04-14', '2016-04-14'),
(67, '030', '030', 'CERAMICA PARED ALFA                                         ', 'ceramica-pared-alfa', '', '2016-04-14', '2016-04-14'),
(68, '031', '031', 'CERAMICA PISO ALFA                                          ', 'ceramica-piso-alfa', '', '2016-04-14', '2016-04-14'),
(69, '033', '033', 'CERAMICA PARED EURO                                         ', 'ceramica-pared-euro', '', '2016-04-14', '2016-04-14'),
(70, '034', '034', 'CERAMICA PISO EURO                                          ', 'ceramica-piso-euro', '', '2016-04-14', '2016-04-14'),
(71, '814', '814', 'PINTURA AGUA', 'pintura-agua', '', '2016-04-14', '2016-04-14'),
(72, '032', '032', 'CENEFAS ALFA', 'cenefas-alfa', '', '2016-04-14', '2016-04-14'),
(73, '035', '035', 'LISTELO EURO                                                ', 'listelo-euro', '', '2016-04-14', '2016-04-14'),
(74, '036', '036', 'CERAMICA PARED ITALIA                                       ', 'ceramica-pared-italia', '', '2016-04-14', '2016-04-14'),
(75, '037', '037', 'CERAMICA PISO ITALIA                                        ', 'ceramica-piso-italia', '', '2016-04-14', '2016-04-14'),
(76, '038', '038', 'LISTELOS ITALIA                                             ', 'listelos-italia', '', '2016-04-14', '2016-04-14'),
(77, '039', '039', 'TRENZAS                                                     ', 'trenzas', '', '2016-04-14', '2016-04-14'),
(78, '040', '040', 'CENEFA INTERMATEX                                           ', 'cenefa-intermatex', '', '2016-04-14', '2016-04-14'),
(79, '041', '041', 'CORDON ITALIA                                               ', 'cordon-italia', '', '2016-04-14', '2016-04-14'),
(80, '042', '042', 'ESQUINEROS INTERMATEX                                       ', 'esquineros-intermatex', '', '2016-04-14', '2016-04-14'),
(81, '812', '812', 'MALLAS', 'mallas', '', '2016-04-14', '2016-04-14'),
(82, '066', '066', 'PORTACANDADO VERA                                           ', 'portacandado-vera', '', '2016-04-14', '2016-04-14'),
(83, '067', '067', 'ALBADILLAS                                                  ', 'albadillas', '', '2016-04-14', '2016-04-14'),
(84, '068', '068', 'BOTONES                                                     ', 'botones', '', '2016-04-14', '2016-04-14'),
(85, '069', '069', 'CIERRE                                                      ', 'cierre', '', '2016-04-14', '2016-04-14'),
(86, '070', '070', 'OJO MAGICO                                                  ', 'ojo-magico', '', '2016-04-14', '2016-04-14'),
(87, '071', '071', 'PASADOR                                                     ', 'pasador', '', '2016-04-14', '2016-04-14'),
(88, '072', '072', 'RODAJA ACERO                                                ', 'rodaja-acero', '', '2016-04-14', '2016-04-14'),
(89, '797', '797', 'MUEBLE ESPEJO', 'mueble-espejo', '', '2016-04-14', '2016-04-14'),
(90, '798', '798', 'MUEBLE LAVAMANOS', 'mueble-lavamanos', '', '2016-04-14', '2016-04-14'),
(91, '817', '817', 'GRIFERIA ALFA', 'griferia-alfa', '', '2016-04-14', '2016-04-14'),
(92, '073', '073', 'SOPORTE CLOSET                                              ', 'soporte-closet', '', '2016-04-14', '2016-04-14'),
(93, '074', '074', 'SOSTEN PLEGABLE                                             ', 'sosten-plegable', '', '2016-04-14', '2016-04-14'),
(94, '075', '075', 'TOPE PUERTA                                                 ', 'tope-puerta', '', '2016-04-14', '2016-04-14'),
(95, '076', '076', 'TRANCA PUERTA                                               ', 'tranca-puerta', '', '2016-04-14', '2016-04-14'),
(96, '077', '077', 'BISAGRAS                                                    ', 'bisagras', '', '2016-04-14', '2016-04-14'),
(97, '078', '078', 'CHAPA SECURITY                                              ', 'chapa-security', '', '2016-04-14', '2016-04-14'),
(98, '079', '079', 'CHAPA VERA                                                  ', 'chapa-vera', '', '2016-04-14', '2016-04-14'),
(99, '080', '080', 'CHAPA GATO                                                  ', 'chapa-gato', '', '2016-04-14', '2016-04-14'),
(100, '081', '081', 'CHAPA INAFER                                                ', 'chapa-inafer', '', '2016-04-14', '2016-04-14'),
(101, '082', '082', 'CHAPA YALE                                                  ', 'chapa-yale', '', '2016-04-14', '2016-04-14'),
(102, '083', '083', 'BUJE GALVANIZADO                                            ', 'buje-galvanizado', '', '2016-04-14', '2016-04-14'),
(103, '084', '084', 'CODO CALLE GALVANIZADO                                      ', 'codo-calle-galvanizado', '', '2016-04-14', '2016-04-14'),
(104, '085', '085', 'CODO GALVANIZADO                                            ', 'codo-galvanizado', '', '2016-04-14', '2016-04-14'),
(105, '086', '086', 'NIPLE GALVANIZADO                                           ', 'niple-galvanizado', '', '2016-04-14', '2016-04-14'),
(106, '087', '087', 'REDUCCIN GALVANIZADO                                        ', 'reduccin-galvanizado', '', '2016-04-14', '2016-04-14'),
(107, '088', '088', 'ROSCAS                                                      ', 'roscas', '', '2016-04-14', '2016-04-14'),
(108, '089', '089', 'SEMICODO GALVANIZADO                                        ', 'semicodo-galvanizado', '', '2016-04-14', '2016-04-14'),
(109, '090', '090', 'TAPON GALVANIZADO                                           ', 'tapon-galvanizado', '', '2016-04-14', '2016-04-14'),
(110, '091', '091', 'TEE GALVANIZADA                                             ', 'tee-galvanizada', '', '2016-04-14', '2016-04-14'),
(111, '789', '789', 'TRAPERO', 'trapero', '', '2016-04-14', '2016-04-14'),
(112, '109', '109', 'PVA IMPRIMIANTE                                           ', 'pva-imprimiante', '', '2016-04-14', '2016-04-14'),
(113, '110', '110', 'VARETA                                                      ', 'vareta', '', '2016-04-14', '2016-04-14'),
(114, '111', '111', 'TAPA GOTERA                                                 ', 'tapa-gotera', '', '2016-04-14', '2016-04-14'),
(115, '112', '112', 'SANITARIA PAVCO                                             ', 'sanitaria-pavco', '', '2016-04-14', '2016-04-14'),
(116, '113', '113', 'PRESION PAVCO                                               ', 'presion-pavco', '', '2016-04-14', '2016-04-14'),
(117, '114', '114', 'NOVAFORT PAVCO                                              ', 'novafort-pavco', '', '2016-04-14', '2016-04-14'),
(118, '115', '115', 'CANALES PAVCO                                               ', 'canales-pavco', '', '2016-04-14', '2016-04-14'),
(119, '116', '116', 'SANITARIA GERFOR                                            ', 'sanitaria-gerfor', '', '2016-04-14', '2016-04-14'),
(120, '117', '117', 'VALVULA INCORPORACION', 'valvula-incorporacion', '', '2016-04-14', '2016-04-14'),
(121, '118', '118', 'NOVAFORT GERFOR                                             ', 'novafort-gerfor', '', '2016-04-14', '2016-04-14'),
(122, '100', '100', 'ANTICORROSIVO                                               ', 'anticorrosivo', '', '2016-04-14', '2016-04-14'),
(123, '101', '101', 'PINTURA TIPO II                                             ', 'pintura-tipo-ii', '', '2016-04-14', '2016-04-14'),
(124, '102', '102', 'PINTURA TIPO III                                            ', 'pintura-tipo-iii', '', '2016-04-14', '2016-04-14'),
(125, '103', '103', 'ESMALTES                                                    ', 'esmaltes', '', '2016-04-14', '2016-04-14'),
(126, '104', '104', 'COLPEGA                                                     ', 'colpega', '', '2016-04-14', '2016-04-14'),
(127, '105', '105', 'CAL                                                         ', 'cal', '', '2016-04-14', '2016-04-14'),
(128, '106', '106', 'CARBURO                                                     ', 'carburo', '', '2016-04-14', '2016-04-14'),
(129, '107', '107', 'ESTUCO                                                      ', 'estuco', '', '2016-04-14', '2016-04-14'),
(130, '108', '108', 'GRECONAL                                                    ', 'greconal', '', '2016-04-14', '2016-04-14'),
(131, '791', '791', 'TRANSPORTE', 'transporte', '', '2016-04-14', '2016-04-14'),
(132, '092', '092', 'UNION GALVANIZADO                                           ', 'union-galvanizado', '', '2016-04-14', '2016-04-14'),
(133, '093', '093', 'UNIVERSAL GALVANIZADA                                       ', 'universal-galvanizada', '', '2016-04-14', '2016-04-14'),
(134, '094', '094', 'TUBOS GALVANIZADO                                           ', 'tubos-galvanizado', '', '2016-04-14', '2016-04-14'),
(135, '095', '095', 'UNIFIX                                                      ', 'unifix', '', '2016-04-14', '2016-04-14'),
(136, '096', '096', 'PINTURA AGUA                                                ', 'pintura-agua', '', '2016-04-14', '2016-04-14'),
(137, '097', '097', 'TRATAMIENTO SUPERFICIES                                     ', 'tratamiento-superficies', '', '2016-04-14', '2016-04-14'),
(138, '098', '098', 'PINTURA ACEITE                                              ', 'pintura-aceite', '', '2016-04-14', '2016-04-14'),
(139, '099', '099', 'AEROSOLES                                                   ', 'aerosoles', '', '2016-04-14', '2016-04-14'),
(140, '784', '784', 'HEMBRA', 'hembra', '', '2016-04-14', '2016-04-14'),
(141, '788', '788', 'TINTILLA', 'tintilla', '', '2016-04-14', '2016-04-14'),
(142, '119', '119', 'TORNILLOS                                                   ', 'tornillos', '', '2016-04-14', '2016-04-14'),
(143, '120', '120', 'ANCLAJES                                                    ', 'anclajes', '', '2016-04-14', '2016-04-14'),
(144, '121', '121', 'ARANDELAS                                                   ', 'arandelas', '', '2016-04-14', '2016-04-14'),
(145, '122', '122', 'CANCAMO                                                     ', 'cancamo', '', '2016-04-14', '2016-04-14'),
(146, '123', '123', 'CHAZOS                                                      ', 'chazos', '', '2016-04-14', '2016-04-14'),
(147, '124', '124', 'CLAVOS                                                      ', 'clavos', '', '2016-04-14', '2016-04-14'),
(148, '125', '125', 'GRAPAS                                                      ', 'grapas', '', '2016-04-14', '2016-04-14'),
(149, '126', '126', 'GUAZA ARANDELA                                              ', 'guaza-arandela', '', '2016-04-14', '2016-04-14'),
(150, '127', '127', 'PUNTILLA                                                    ', 'puntilla', '', '2016-04-14', '2016-04-14'),
(151, '128', '128', 'REMACHES                                                    ', 'remaches', '', '2016-04-14', '2016-04-14'),
(152, '129', '129', 'TACHUELAS                                                   ', 'tachuelas', '', '2016-04-14', '2016-04-14'),
(153, '130', '130', 'TUERCAS                                                     ', 'tuercas', '', '2016-04-14', '2016-04-14'),
(154, '131', '131', 'ESTOPEROLES                                                 ', 'estoperoles', '', '2016-04-14', '2016-04-14'),
(155, '132', '132', 'PIAMIGO                                                     ', 'piamigo', '', '2016-04-14', '2016-04-14'),
(156, '133', '133', 'PORRAS                                                      ', 'porras', '', '2016-04-14', '2016-04-14'),
(157, '134', '134', 'PALAS                                                       ', 'palas', '', '2016-04-14', '2016-04-14'),
(158, '135', '135', 'PALADRAGAS                                                  ', 'paladragas', '', '2016-04-14', '2016-04-14'),
(159, '136', '136', 'PICAS                                                       ', 'picas', '', '2016-04-14', '2016-04-14'),
(160, '137', '137', 'BARRAS                                                      ', 'barras', '', '2016-04-14', '2016-04-14'),
(161, '138', '138', 'PULIDORAS                                                   ', 'pulidoras', '', '2016-04-14', '2016-04-14'),
(162, '139', '139', 'TALADROS                                                    ', 'taladros', '', '2016-04-14', '2016-04-14'),
(163, '140', '140', 'AZADON                                                      ', 'azadon', '', '2016-04-14', '2016-04-14'),
(164, '141', '141', 'BALDE NEGRO                                                 ', 'balde-negro', '', '2016-04-14', '2016-04-14'),
(165, '142', '142', 'SERRUCHOS                                                   ', 'serruchos', '', '2016-04-14', '2016-04-14'),
(166, '143', '143', 'SIERRA                                                      ', 'sierra', '', '2016-04-14', '2016-04-14'),
(167, '144', '144', 'BATEA                                                       ', 'batea', '', '2016-04-14', '2016-04-14'),
(168, '145', '145', 'MACHETA                                                     ', 'macheta', '', '2016-04-14', '2016-04-14'),
(169, '146', '146', 'CANECA                                                      ', 'caneca', '', '2016-04-14', '2016-04-14'),
(170, '147', '147', 'CARRETILLA                                                  ', 'carretilla', '', '2016-04-14', '2016-04-14'),
(171, '807', '807', 'GRASAS', 'grasas', '', '2016-04-14', '2016-04-14'),
(172, '148', '148', 'CUCHILLA GUADANA                                            ', 'cuchilla-guadana', '', '2016-04-14', '2016-04-14'),
(173, '149', '149', 'ESCALERAS                                                   ', 'escaleras', '', '2016-04-14', '2016-04-14'),
(174, '150', '150', 'HACHAS                                                      ', 'hachas', '', '2016-04-14', '2016-04-14'),
(175, '151', '151', 'LLANA MADERA                                                ', 'llana-madera', '', '2016-04-14', '2016-04-14'),
(176, '152', '152', 'MAQUINA                                                     ', 'maquina', '', '2016-04-14', '2016-04-14'),
(177, '153', '153', 'REGLA METALICA                                              ', 'regla-metalica', '', '2016-04-14', '2016-04-14'),
(178, '154', '154', 'ZORRA METALICA                                              ', 'zorra-metalica', '', '2016-04-14', '2016-04-14'),
(179, '156', '156', 'CONO O TAPON                                                ', 'cono-o-tapon', '', '2016-04-14', '2016-04-14'),
(180, '157', '157', 'COPAS                                                       ', 'copas', '', '2016-04-14', '2016-04-14'),
(181, '158', '158', 'DISCO                                                       ', 'disco', '', '2016-04-14', '2016-04-14'),
(182, '169', '169', 'RACORES                                                     ', 'racores', '', '2016-04-14', '2016-04-14'),
(183, '170', '170', 'RESPUESTOS LICUADORA                                        ', 'respuestos-licuadora', '', '2016-04-14', '2016-04-14'),
(184, '171', '171', 'GUSANO PARA MAQUINA                                         ', 'gusano-para-maquina', '', '2016-04-14', '2016-04-14'),
(185, '172', '172', 'SOPORTE PARA MAQUINA                                        ', 'soporte-para-maquina', '', '2016-04-14', '2016-04-14'),
(186, '173', '173', 'EJE PARA CARRETILLA                                         ', 'eje-para-carretilla', '', '2016-04-14', '2016-04-14'),
(187, '174', '174', 'MANGUERA GAS                                                ', 'manguera-gas', '', '2016-04-14', '2016-04-14'),
(188, '175', '175', 'MANGUERA LAVADORA                                           ', 'manguera-lavadora', '', '2016-04-14', '2016-04-14'),
(189, '176', '176', 'MANGUERA NEGRA                                              ', 'manguera-negra', '', '2016-04-14', '2016-04-14'),
(190, '177', '177', 'MANGUERA NIVEL CRISTAL                                      ', 'manguera-nivel-cristal', '', '2016-04-14', '2016-04-14'),
(191, '178', '178', 'MANGUERA RIEGO                                              ', 'manguera-riego', '', '2016-04-14', '2016-04-14'),
(192, '199', '199', 'ALICATE                                                     ', 'alicate', '', '2016-04-14', '2016-04-14'),
(193, '200', '200', 'CORTAFRIO                                                   ', 'cortafrio', '', '2016-04-14', '2016-04-14'),
(194, '201', '201', 'CUCHILLO                                                    ', 'cuchillo', '', '2016-04-14', '2016-04-14'),
(195, '202', '202', 'CEPILLO ACERO                                               ', 'cepillo-acero', '', '2016-04-14', '2016-04-14'),
(196, '203', '203', 'DESTORNILLADOR                                              ', 'destornillador', '', '2016-04-14', '2016-04-14'),
(197, '204', '204', 'ESCUADRAS                                                   ', 'escuadras', '', '2016-04-14', '2016-04-14'),
(198, '205', '205', 'ESPATULA                                                    ', 'espatula', '', '2016-04-14', '2016-04-14'),
(199, '206', '206', 'FLEXOMETRO                                                  ', 'flexometro', '', '2016-04-14', '2016-04-14'),
(200, '207', '207', 'FORMON                                                      ', 'formon', '', '2016-04-14', '2016-04-14'),
(201, '786', '786', 'MOTORES', 'motores', '', '2016-04-14', '2016-04-14'),
(202, '179', '179', 'MANGUERA SWAN                                               ', 'manguera-swan', '', '2016-04-14', '2016-04-14'),
(203, '180', '180', 'BOTAS                                                       ', 'botas', '', '2016-04-14', '2016-04-14'),
(204, '181', '181', 'BISTURI                                                     ', 'bisturi', '', '2016-04-14', '2016-04-14'),
(205, '182', '182', 'BROCHAS                                                     ', 'brochas', '', '2016-04-14', '2016-04-14'),
(206, '183', '183', 'BROCAS                                                      ', 'brocas', '', '2016-04-14', '2016-04-14'),
(207, '184', '184', 'CARETA SOLDAR                                               ', 'careta-soldar', '', '2016-04-14', '2016-04-14'),
(208, '185', '185', 'CASCO                                                       ', 'casco', '', '2016-04-14', '2016-04-14'),
(209, '186', '186', 'CORAZA                                                      ', 'coraza', '', '2016-04-14', '2016-04-14'),
(210, '187', '187', 'GUANTES                                                     ', 'guantes', '', '2016-04-14', '2016-04-14'),
(211, '188', '188', 'LLAVE PARA TALADRO                                          ', 'llave-para-taladro', '', '2016-04-14', '2016-04-14'),
(212, '189', '189', 'PIEDRA AFILAR                                               ', 'piedra-afilar', '', '2016-04-14', '2016-04-14'),
(213, '190', '190', 'PINCEL                                                      ', 'pincel', '', '2016-04-14', '2016-04-14'),
(214, '191', '191', 'RUBY BURIL                                                  ', 'ruby-buril', '', '2016-04-14', '2016-04-14'),
(215, '192', '192', 'AEROGRAFOS                                                  ', 'aerografos', '', '2016-04-14', '2016-04-14'),
(216, '193', '193', 'ANILLO AJUSTADOR                                            ', 'anillo-ajustador', '', '2016-04-14', '2016-04-14'),
(217, '194', '194', 'DESLIZADOR PUNTILLA                                         ', 'deslizador-puntilla', '', '2016-04-14', '2016-04-14'),
(218, '195', '195', 'GAFAS                                                       ', 'gafas', '', '2016-04-14', '2016-04-14'),
(219, '196', '196', 'MASCARILLAS                                                 ', 'mascarillas', '', '2016-04-14', '2016-04-14'),
(220, '197', '197', 'PLOMADA                                                     ', 'plomada', '', '2016-04-14', '2016-04-14'),
(221, '198', '198', 'DECAMETRO                                                   ', 'decametro', '', '2016-04-14', '2016-04-14'),
(222, '159', '159', 'LIJAS                                                       ', 'lijas', '', '2016-04-14', '2016-04-14'),
(223, '160', '160', 'TROMPOS TALADROS                                            ', 'trompos-taladros', '', '2016-04-14', '2016-04-14'),
(224, '161', '161', 'LIMAS                                                       ', 'limas', '', '2016-04-14', '2016-04-14'),
(225, '162', '162', 'HOJAS BISTURI                                               ', 'hojas-bisturi', '', '2016-04-14', '2016-04-14'),
(226, '163', '163', 'HOJAS GUADANA                                               ', 'hojas-guadana', '', '2016-04-14', '2016-04-14'),
(227, '164', '164', 'ESCOBILLAS                                                  ', 'escobillas', '', '2016-04-14', '2016-04-14'),
(228, '165', '165', 'RESPUESTOS RODILLO                                          ', 'respuestos-rodillo', '', '2016-04-14', '2016-04-14'),
(229, '166', '166', 'LLANTAS                                                     ', 'llantas', '', '2016-04-14', '2016-04-14'),
(230, '167', '167', 'SEGUETA                                                     ', 'segueta', '', '2016-04-14', '2016-04-14'),
(231, '168', '168', 'NEUMATICOS                                                  ', 'neumaticos', '', '2016-04-14', '2016-04-14'),
(232, '208', '208', 'RODILLOS                                                    ', 'rodillos', '', '2016-04-14', '2016-04-14'),
(233, '209', '209', 'HOMBRE SOLO                                                 ', 'hombre-solo', '', '2016-04-14', '2016-04-14'),
(234, '210', '210', 'JUEGO COPAS                                                 ', 'juego-copas', '', '2016-04-14', '2016-04-14'),
(235, '211', '211', 'PALUSTRES                                                   ', 'palustres', '', '2016-04-14', '2016-04-14'),
(236, '212', '212', 'CAJA HERRAMIENTAS                                           ', 'caja-herramientas', '', '2016-04-14', '2016-04-14'),
(237, '213', '213', 'CORTAVIDRIO                                                 ', 'cortavidrio', '', '2016-04-14', '2016-04-14'),
(238, '214', '214', 'CORTALOZA                                                   ', 'cortaloza', '', '2016-04-14', '2016-04-14'),
(239, '215', '215', 'FALSA ESCUADRA                                              ', 'falsa-escuadra', '', '2016-04-14', '2016-04-14'),
(240, '216', '216', 'GRAPADORA                                                   ', 'grapadora', '', '2016-04-14', '2016-04-14'),
(241, '217', '217', 'LLAVE BROCA                                                 ', 'llave-broca', '', '2016-04-14', '2016-04-14'),
(242, '238', '238', 'CHIPA                                                       ', 'chipa', '', '2016-04-14', '2016-04-14'),
(243, '239', '239', 'CAJA CONTADOR AGUA                                          ', 'caja-contador-agua', '', '2016-04-14', '2016-04-14'),
(244, '240', '240', 'GRANITO                                                     ', 'granito', '', '2016-04-14', '2016-04-14'),
(245, '241', '241', 'GRAVILLA                                                    ', 'gravilla', '', '2016-04-14', '2016-04-14'),
(246, '242', '242', 'MARMOLINA                                                   ', 'marmolina', '', '2016-04-14', '2016-04-14'),
(247, '243', '243', 'TRITURADO                                                   ', 'triturado', '', '2016-04-14', '2016-04-14'),
(248, '244', '244', 'REVUELTO                                                    ', 'revuelto', '', '2016-04-14', '2016-04-14'),
(249, '245', '245', 'YESO                                                        ', 'yeso', '', '2016-04-14', '2016-04-14'),
(250, '246', '246', 'CINTA SENALIZACION                                          ', 'cinta-senalizacion', '', '2016-04-14', '2016-04-14'),
(251, '247', '247', 'ALAMBRE GALVANIZADO                                         ', 'alambre-galvanizado', '', '2016-04-14', '2016-04-14'),
(252, '248', '248', 'ALAMBRE PUAS                                                ', 'alambre-puas', '', '2016-04-14', '2016-04-14'),
(253, '249', '249', 'SACO FIBRA                                                  ', 'saco-fibra', '', '2016-04-14', '2016-04-14'),
(254, '250', '250', 'CALAO CEMENTO                                               ', 'calao-cemento', '', '2016-04-14', '2016-04-14'),
(255, '251', '251', 'CALAO GRES                                                  ', 'calao-gres', '', '2016-04-14', '2016-04-14'),
(256, '252', '252', 'ESCALGRES                                                   ', 'escalgres', '', '2016-04-14', '2016-04-14'),
(257, '253', '253', 'GUARDAESCOBAS                                               ', 'guardaescobas', '', '2016-04-14', '2016-04-14'),
(258, '254', '254', 'PERSIANA DE CEMENTO                                         ', 'persiana-de-cemento', '', '2016-04-14', '2016-04-14'),
(259, '255', '255', 'RETAL CORALINO                                              ', 'retal-coralino', '', '2016-04-14', '2016-04-14'),
(260, '256', '256', 'TABLETA                                                     ', 'tableta', '', '2016-04-14', '2016-04-14'),
(261, '257', '257', 'TUBO CEMENTO                                                ', 'tubo-cemento', '', '2016-04-14', '2016-04-14'),
(262, '258', '258', 'TUBO DE GRES                                                ', 'tubo-de-gres', '', '2016-04-14', '2016-04-14'),
(263, '259', '259', 'TEJA DE BARRO                                               ', 'teja-de-barro', '', '2016-04-14', '2016-04-14'),
(264, '260', '260', 'TEJA COLONIAL                                               ', 'teja-colonial', '', '2016-04-14', '2016-04-14'),
(265, '261', '261', 'TEJA THERMOACOUSTIC                                         ', 'teja-thermoacoustic', '', '2016-04-14', '2016-04-14'),
(266, '262', '262', 'CABALLETE ETERNIT                                           ', 'caballete-eternit', '', '2016-04-14', '2016-04-14'),
(267, '263', '263', 'CLARABOYA ETERNIT                                           ', 'claraboya-eternit', '', '2016-04-14', '2016-04-14'),
(268, '264', '264', 'TANQUE AJOVER                                               ', 'tanque-ajover', '', '2016-04-14', '2016-04-14'),
(269, '265', '265', 'TEJA ADRI                                                   ', 'teja-adri', '', '2016-04-14', '2016-04-14'),
(270, '266', '266', 'TEJA AJOVER                                                 ', 'teja-ajover', '', '2016-04-14', '2016-04-14'),
(271, '267', '267', 'TEJA CUADRADA                                               ', 'teja-cuadrada', '', '2016-04-14', '2016-04-14'),
(272, '228', '228', 'RASTRILLO                                                   ', 'rastrillo', '', '2016-04-14', '2016-04-14'),
(273, '229', '229', 'TENAZA                                                      ', 'tenaza', '', '2016-04-14', '2016-04-14'),
(274, '230', '230', 'TIJERAS                                                     ', 'tijeras', '', '2016-04-14', '2016-04-14'),
(275, '231', '231', 'ARENA                                                       ', 'arena', '', '2016-04-14', '2016-04-14'),
(276, '232', '232', 'HIERRO                                                      ', 'hierro', '', '2016-04-14', '2016-04-14'),
(277, '233', '233', 'LADRILLO                                                    ', 'ladrillo', '', '2016-04-14', '2016-04-14'),
(278, '234', '234', 'CEMENTO GRIS', 'cemento-gris', '', '2016-04-14', '2016-04-14'),
(279, '235', '235', 'CAOLIN                                                      ', 'caolin', '', '2016-04-14', '2016-04-14'),
(280, '236', '236', 'PIEDRA BOLO                                                 ', 'piedra-bolo', '', '2016-04-14', '2016-04-14'),
(281, '237', '237', 'CEMENTO BLANCO                                              ', 'cemento-blanco', '', '2016-04-14', '2016-04-14'),
(282, '218', '218', 'LLAVE BRISTOL                                               ', 'llave-bristol', '', '2016-04-14', '2016-04-14'),
(283, '219', '219', 'LLAVE EXPANSION                                             ', 'llave-expansion', '', '2016-04-14', '2016-04-14'),
(284, '220', '220', 'SIMBRAZ                                                     ', 'simbraz', '', '2016-04-14', '2016-04-14'),
(285, '221', '221', 'MARCO SEGUETA                                               ', 'marco-segueta', '', '2016-04-14', '2016-04-14'),
(286, '222', '222', 'NIVELES                                                     ', 'niveles', '', '2016-04-14', '2016-04-14'),
(287, '223', '223', 'PINZAS                                                      ', 'pinzas', '', '2016-04-14', '2016-04-14'),
(288, '224', '224', 'PISTOLA                                                     ', 'pistola', '', '2016-04-14', '2016-04-14'),
(289, '225', '225', 'PUNTEROS                                                    ', 'punteros', '', '2016-04-14', '2016-04-14'),
(290, '226', '226', 'REMACHADORA                                                 ', 'remachadora', '', '2016-04-14', '2016-04-14'),
(291, '227', '227', 'SINCEL                                                      ', 'sincel', '', '2016-04-14', '2016-04-14'),
(292, '268', '268', 'TELA ASFALTICA                                              ', 'tela-asfaltica', '', '2016-04-14', '2016-04-14'),
(293, '269', '269', 'AMARRES                                                     ', 'amarres', '', '2016-04-14', '2016-04-14'),
(294, '270', '270', 'SOLDADURA STANO                                             ', 'soldadura-stano', '', '2016-04-14', '2016-04-14'),
(295, '271', '271', 'GANCHO ETERNIT                                              ', 'gancho-eternit', '', '2016-04-14', '2016-04-14'),
(296, '272', '272', 'TORNILLOS AUTOPERFORANTES                                   ', 'tornillos-autoperforantes', '', '2016-04-14', '2016-04-14'),
(297, '273', '273', 'SOLDADURA SOLDALIST                                         ', 'soldadura-soldalist', '', '2016-04-14', '2016-04-14'),
(298, '274', '274', 'PERFIL                                                      ', 'perfil', '', '2016-04-14', '2016-04-14'),
(299, '275', '275', 'SOLDADURA SOLDERING                                         ', 'soldadura-soldering', '', '2016-04-14', '2016-04-14'),
(300, '276', '276', 'DILATACIONES PLASTICAS                                      ', 'dilataciones-plasticas', '', '2016-04-14', '2016-04-14'),
(301, '277', '277', 'PIRLAN BRONCE                                               ', 'pirlan-bronce', '', '2016-04-14', '2016-04-14'),
(302, '278', '278', 'GAVIONES                                                    ', 'gaviones', '', '2016-04-14', '2016-04-14'),
(303, '279', '279', 'HOJALATA                                                    ', 'hojalata', '', '2016-04-14', '2016-04-14'),
(304, '280', '280', 'MALLAS                                                      ', 'mallas', '', '2016-04-14', '2016-04-14'),
(305, '281', '281', 'PLASTICO NEGRO                                              ', 'plastico-negro', '', '2016-04-14', '2016-04-14'),
(306, '282', '282', 'POLISOMBRA                                                  ', 'polisombra', '', '2016-04-14', '2016-04-14'),
(307, '283', '283', 'ACIDOS                                                      ', 'acidos', '', '2016-04-14', '2016-04-14'),
(308, '284', '284', 'SODA CAUSTICA                                               ', 'soda-caustica', '', '2016-04-14', '2016-04-14'),
(309, '285', '285', 'THINNER                                                     ', 'thinner', '', '2016-04-14', '2016-04-14'),
(310, '286', '286', 'BARSOL                                                      ', 'barsol', '', '2016-04-14', '2016-04-14'),
(311, '287', '287', 'ASFALTO SOLIDO                                              ', 'asfalto-solido', '', '2016-04-14', '2016-04-14'),
(312, '288', '288', 'CREOLINA                                                    ', 'creolina', '', '2016-04-14', '2016-04-14'),
(313, '289', '289', 'DIABLO FUERTE                                               ', 'diablo-fuerte', '', '2016-04-14', '2016-04-14'),
(314, '290', '290', 'INMUNIZANTE DE MADERA                                       ', 'inmunizante-de-madera', '', '2016-04-14', '2016-04-14'),
(315, '291', '291', 'LIMPIADOR CLEANTEX                                          ', 'limpiador-cleantex', '', '2016-04-14', '2016-04-14'),
(316, '292', '292', 'ANGULO                                                      ', 'angulo', '', '2016-04-14', '2016-04-14'),
(317, '293', '293', 'BALINERAS                                                   ', 'balineras', '', '2016-04-14', '2016-04-14'),
(318, '294', '294', 'GOSNE                                                       ', 'gosne', '', '2016-04-14', '2016-04-14'),
(319, '295', '295', 'LAMINA ZINC                                                 ', 'lamina-zinc', '', '2016-04-14', '2016-04-14'),
(320, '296', '296', 'PLATINA                                                     ', 'platina', '', '2016-04-14', '2016-04-14'),
(321, '297', '297', 'TUBO CUADRADO                                               ', 'tubo-cuadrado', '', '2016-04-14', '2016-04-14'),
(322, '298', '298', 'TUBO RECTANGULAR                                            ', 'tubo-rectangular', '', '2016-04-14', '2016-04-14'),
(323, '299', '299', 'SOLDADURA WEST                                              ', 'soldadura-west', '', '2016-04-14', '2016-04-14'),
(324, '300', '300', 'VIDRIO SOLDAR                                               ', 'vidrio-soldar', '', '2016-04-14', '2016-04-14'),
(325, '301', '301', 'CADENA SOLDADA                                              ', 'cadena-soldada', '', '2016-04-14', '2016-04-14'),
(326, '302', '302', 'CIERRE RODILLO                                              ', 'cierre-rodillo', '', '2016-04-14', '2016-04-14'),
(327, '303', '303', 'CABLE DUPLEX                                                ', 'cable-duplex', '', '2016-04-14', '2016-04-14'),
(328, '304', '304', 'ALAMBRE ALUMINIO                                            ', 'alambre-aluminio', '', '2016-04-14', '2016-04-14'),
(329, '305', '305', 'ALAMBRE CEDSA                                               ', 'alambre-cedsa', '', '2016-04-14', '2016-04-14'),
(330, '306', '306', 'TEJA ETERNIT                                                ', 'teja-eternit', '', '2016-04-14', '2016-04-14'),
(331, '307', '307', 'TEJA ZINC                                                   ', 'teja-zinc', '', '2016-04-14', '2016-04-14'),
(332, '308', '308', 'ALAMBRE ENCAUCHETADO                                        ', 'alambre-encauchetado', '', '2016-04-14', '2016-04-14'),
(333, '309', '309', 'ALAMBRE FACOME                                              ', 'alambre-facome', '', '2016-04-14', '2016-04-14'),
(334, '310', '310', 'ALAMBRE TELEFONO                                            ', 'alambre-telefono', '', '2016-04-14', '2016-04-14'),
(335, '311', '311', 'ALAMBRE TRENZADO                                            ', 'alambre-trenzado', '', '2016-04-14', '2016-04-14'),
(336, '312', '312', 'ALAMRE POLARIZADO                                           ', 'alamre-polarizado', '', '2016-04-14', '2016-04-14'),
(337, '313', '313', 'CABLE COAXIAL                                               ', 'cable-coaxial', '', '2016-04-14', '2016-04-14'),
(338, '314', '314', 'ALAMBRE CORRIENTE                                           ', 'alambre-corriente', '', '2016-04-14', '2016-04-14'),
(339, '315', '315', 'ALAMBRE DESNUDO                                             ', 'alambre-desnudo', '', '2016-04-14', '2016-04-14'),
(340, '316', '316', 'BENJAMINES                                                  ', 'benjamines', '', '2016-04-14', '2016-04-14'),
(341, '317', '317', 'BERBIQUI                                                    ', 'berbiqui', '', '2016-04-14', '2016-04-14'),
(342, '328', '328', 'PLAFON                                                      ', 'plafon', '', '2016-04-14', '2016-04-14'),
(343, '329', '329', 'PORTAELECTRODO                                              ', 'portaelectrodo', '', '2016-04-14', '2016-04-14'),
(344, '330', '330', 'PROBADOR CORRIENTE                                          ', 'probador-corriente', '', '2016-04-14', '2016-04-14'),
(345, '331', '331', 'SOCKER                                                      ', 'socker', '', '2016-04-14', '2016-04-14'),
(346, '332', '332', 'SONDA                                                       ', 'sonda', '', '2016-04-14', '2016-04-14'),
(347, '333', '333', 'SUPLEMENTOS                                                 ', 'suplementos', '', '2016-04-14', '2016-04-14'),
(348, '334', '334', 'TERMINAL ELECTRICO                                          ', 'terminal-electrico', '', '2016-04-14', '2016-04-14'),
(349, '335', '335', 'AISLADOR                                                    ', 'aislador', '', '2016-04-14', '2016-04-14'),
(350, '336', '336', 'BARRAJES                                                    ', 'barrajes', '', '2016-04-14', '2016-04-14'),
(351, '337', '337', 'UNION TELEFONO                                              ', 'union-telefono', '', '2016-04-14', '2016-04-14'),
(352, '338', '338', 'BALASTROS                                                   ', 'balastros', '', '2016-04-14', '2016-04-14'),
(353, '339', '339', 'CHASIS LAMPARA                                              ', 'chasis-lampara', '', '2016-04-14', '2016-04-14'),
(354, '340', '340', 'LAMPARA CIRCULAR                                            ', 'lampara-circular', '', '2016-04-14', '2016-04-14'),
(355, '341', '341', 'LAMPARA FLUORECENTE                                         ', 'lampara-fluorecente', '', '2016-04-14', '2016-04-14'),
(356, '342', '342', 'REPUESTOS FLUORECENTE                                       ', 'repuestos-fluorecente', '', '2016-04-14', '2016-04-14'),
(357, '343', '343', 'STARTE                                                      ', 'starte', '', '2016-04-14', '2016-04-14'),
(358, '344', '344', 'TUBO FLUORECENTE                                            ', 'tubo-fluorecente', '', '2016-04-14', '2016-04-14'),
(359, '345', '345', 'AHORRADOR FULLWAT                                           ', 'ahorrador-fullwat', '', '2016-04-14', '2016-04-14'),
(360, '346', '346', 'AHORRADOR OPALUX                                            ', 'ahorrador-opalux', '', '2016-04-14', '2016-04-14'),
(361, '347', '347', 'AHORRADOR SILVANIA                                          ', 'ahorrador-silvania', '', '2016-04-14', '2016-04-14'),
(362, '378', '378', 'TUBO CONDUIT                                                ', 'tubo-conduit', '', '2016-04-14', '2016-04-14'),
(363, '379', '379', 'VARILLA COOPERWELL                                          ', 'varilla-cooperwell', '', '2016-04-14', '2016-04-14'),
(364, '380', '380', 'ANTENA                                                      ', 'antena', '', '2016-04-14', '2016-04-14'),
(365, '381', '381', 'MARRANITO COAXIAL                                           ', 'marranito-coaxial', '', '2016-04-14', '2016-04-14'),
(366, '382', '382', 'SPLITER                                                     ', 'spliter', '', '2016-04-14', '2016-04-14'),
(367, '383', '383', 'SWITCH                                                      ', 'switch', '', '2016-04-14', '2016-04-14'),
(368, '384', '384', 'TABACO TELEVISION                                           ', 'tabaco-television', '', '2016-04-14', '2016-04-14'),
(369, '385', '385', 'TEE COAXIAL                                                 ', 'tee-coaxial', '', '2016-04-14', '2016-04-14'),
(370, '386', '386', 'TERMINAL COAXIAL                                            ', 'terminal-coaxial', '', '2016-04-14', '2016-04-14'),
(371, '387', '387', 'UNION COAXIAL                                               ', 'union-coaxial', '', '2016-04-14', '2016-04-14'),
(372, '358', '358', 'CAJAS CONTADOR                                              ', 'cajas-contador', '', '2016-04-14', '2016-04-14'),
(373, '359', '359', 'CAJAS CUADRADAS                                             ', 'cajas-cuadradas', '', '2016-04-14', '2016-04-14'),
(374, '360', '360', 'CAJAS EMPALME                                               ', 'cajas-empalme', '', '2016-04-14', '2016-04-14'),
(375, '361', '361', 'CAJAS TACOS                                                 ', 'cajas-tacos', '', '2016-04-14', '2016-04-14'),
(376, '362', '362', 'TACOS                                                       ', 'tacos', '', '2016-04-14', '2016-04-14'),
(377, '363', '363', 'TAPAS                                                       ', 'tapas', '', '2016-04-14', '2016-04-14'),
(378, '364', '364', 'CLAVIJA                                                     ', 'clavija', '', '2016-04-14', '2016-04-14'),
(379, '365', '365', 'CONMUTABLES                                                 ', 'conmutables', '', '2016-04-14', '2016-04-14'),
(380, '366', '366', 'CONVERTIDOR                                                 ', 'convertidor', '', '2016-04-14', '2016-04-14'),
(381, '367', '367', 'INTERRUPTOR                                                 ', 'interruptor', '', '2016-04-14', '2016-04-14'),
(382, '318', '318', 'CAIMAN                                                      ', 'caiman', '', '2016-04-14', '2016-04-14'),
(383, '319', '319', 'CAUTIN                                                      ', 'cautin', '', '2016-04-14', '2016-04-14'),
(384, '320', '320', 'CONECTOR                                                    ', 'conector', '', '2016-04-14', '2016-04-14'),
(385, '321', '321', 'CRUCETAS                                                    ', 'crucetas', '', '2016-04-14', '2016-04-14'),
(386, '322', '322', 'CURVAS                                                      ', 'curvas', '', '2016-04-14', '2016-04-14'),
(387, '323', '323', 'FUSIBLE                                                     ', 'fusible', '', '2016-04-14', '2016-04-14'),
(388, '324', '324', 'GRAPAS ELECTRIC                                             ', 'grapas-electric', '', '2016-04-14', '2016-04-14'),
(389, '325', '325', 'PELA CABLE                                                  ', 'pela-cable', '', '2016-04-14', '2016-04-14'),
(390, '326', '326', 'PERCHAS                                                     ', 'perchas', '', '2016-04-14', '2016-04-14'),
(391, '327', '327', 'PERRO                                                       ', 'perro', '', '2016-04-14', '2016-04-14'),
(392, '368', '368', 'PULSADOR                                                    ', 'pulsador', '', '2016-04-14', '2016-04-14'),
(393, '369', '369', 'SALIDA                                                      ', 'salida', '', '2016-04-14', '2016-04-14'),
(394, '370', '370', 'TEE                                                         ', 'tee', '', '2016-04-14', '2016-04-14');
INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(395, '371', '371', 'TOMA                                                        ', 'toma', '', '2016-04-14', '2016-04-14'),
(396, '372', '372', 'TIMBRE                                                      ', 'timbre', '', '2016-04-14', '2016-04-14'),
(397, '373', '373', 'TABLA RECTANGULAR                                           ', 'tabla-rectangular', '', '2016-04-14', '2016-04-14'),
(398, '374', '374', 'CANALETA                                                    ', 'canaleta', '', '2016-04-14', '2016-04-14'),
(399, '375', '375', 'CONDULETA                                                   ', 'conduleta', '', '2016-04-14', '2016-04-14'),
(400, '376', '376', 'HIDROSOLTA                                                  ', 'hidrosolta', '', '2016-04-14', '2016-04-14'),
(401, '377', '377', 'MANGUERA CONDUFLEX                                          ', 'manguera-conduflex', '', '2016-04-14', '2016-04-14'),
(402, '348', '348', 'BOMBILLO OJO BUEY                                           ', 'bombillo-ojo-buey', '', '2016-04-14', '2016-04-14'),
(403, '349', '349', 'OJO BUEY                                                    ', 'ojo-buey', '', '2016-04-14', '2016-04-14'),
(404, '350', '350', 'CABLE CHURCO                                                ', 'cable-churco', '', '2016-04-14', '2016-04-14'),
(405, '351', '351', 'CABLE GRABADORA                                             ', 'cable-grabadora', '', '2016-04-14', '2016-04-14'),
(406, '352', '352', 'CABLE BATERIA                                               ', 'cable-bateria', '', '2016-04-14', '2016-04-14'),
(407, '353', '353', 'CABLE PLANCHE                                               ', 'cable-planche', '', '2016-04-14', '2016-04-14'),
(408, '354', '354', 'CABLE TELEFONO                                              ', 'cable-telefono', '', '2016-04-14', '2016-04-14'),
(409, '355', '355', 'EXTENSION BLANCA                                            ', 'extension-blanca', '', '2016-04-14', '2016-04-14'),
(410, '356', '356', 'MULTITOMA                                                   ', 'multitoma', '', '2016-04-14', '2016-04-14'),
(411, '357', '357', 'CAJA CEMENTO                                                ', 'caja-cemento', '', '2016-04-14', '2016-04-14'),
(412, '388', '388', 'COMBO AVANTY                                                ', 'combo-avanty', '', '2016-04-14', '2016-04-14'),
(413, '389', '389', 'COMBO ATLANTA                                               ', 'combo-atlanta', '', '2016-04-14', '2016-04-14'),
(414, '390', '390', 'COMBO EDESA                                                 ', 'combo-edesa', '', '2016-04-14', '2016-04-14'),
(415, '391', '391', 'COMBO ACUACER                                               ', 'combo-acuacer', '', '2016-04-14', '2016-04-14'),
(416, '392', '392', 'COMBO DISTINCION                                            ', 'combo-distincion', '', '2016-04-14', '2016-04-14'),
(417, '393', '393', 'ORINAL                                                      ', 'orinal', '', '2016-04-14', '2016-04-14'),
(418, '394', '394', 'SANITARIO ACUACER                                           ', 'sanitario-acuacer', '', '2016-04-14', '2016-04-14'),
(419, '395', '395', 'SANITARIO AVANTY                                            ', 'sanitario-avanty', '', '2016-04-14', '2016-04-14'),
(420, '396', '396', 'SANITARIO DISTINCION', 'sanitario-distincion', '', '2016-04-14', '2016-04-14'),
(421, '397', '397', 'SANITARIO EDESA                                             ', 'sanitario-edesa', '', '2016-04-14', '2016-04-14'),
(422, '398', '398', 'LAVAMANOS ACUACER                                           ', 'lavamanos-acuacer', '', '2016-04-14', '2016-04-14'),
(423, '399', '399', 'LAVAMANOS AVANTY                                            ', 'lavamanos-avanty', '', '2016-04-14', '2016-04-14'),
(424, '400', '400', 'LAVAMANOS EDESA                                             ', 'lavamanos-edesa', '', '2016-04-14', '2016-04-14'),
(425, '401', '401', 'TANQUE ACUACER                                              ', 'tanque-acuacer', '', '2016-04-14', '2016-04-14'),
(426, '402', '402', 'TANQUE AVANTY                                               ', 'tanque-avanty', '', '2016-04-14', '2016-04-14'),
(427, '403', '403', 'TANQUE DISTINCION                                           ', 'tanque-distincion', '', '2016-04-14', '2016-04-14'),
(428, '404', '404', 'TANQUE EDESA                                                ', 'tanque-edesa', '', '2016-04-14', '2016-04-14'),
(429, '405', '405', 'TAPA ACUACER                                                ', 'tapa-acuacer', '', '2016-04-14', '2016-04-14'),
(430, '406', '406', 'TAPA AVANTY                                                 ', 'tapa-avanty', '', '2016-04-14', '2016-04-14'),
(431, '407', '407', 'TAPA DISTINCION                                             ', 'tapa-distincion', '', '2016-04-14', '2016-04-14'),
(432, '408', '408', 'TAZA ACUACER                                                ', 'taza-acuacer', '', '2016-04-14', '2016-04-14'),
(433, '409', '409', 'TAZA AVANTY                                                 ', 'taza-avanty', '', '2016-04-14', '2016-04-14'),
(434, '410', '410', 'TAZA DISTINCION                                             ', 'taza-distincion', '', '2016-04-14', '2016-04-14'),
(435, '411', '411', 'PEDESTAL ACUACER                                            ', 'pedestal-acuacer', '', '2016-04-14', '2016-04-14'),
(436, '412', '412', 'PEDESTAL AVANTY                                             ', 'pedestal-avanty', '', '2016-04-14', '2016-04-14'),
(437, '413', '413', 'REJILLA PLANA                                               ', 'rejilla-plana', '', '2016-04-14', '2016-04-14'),
(438, '414', '414', 'REJILLA SIFON ALUMINIO                                      ', 'rejilla-sifon-aluminio', '', '2016-04-14', '2016-04-14'),
(439, '415', '415', 'REJILLA TAPA REGISTRO                                       ', 'rejilla-tapa-registro', '', '2016-04-14', '2016-04-14'),
(440, '416', '416', 'REJILLA TRAGANTE                                            ', 'rejilla-tragante', '', '2016-04-14', '2016-04-14'),
(441, '417', '417', 'REJILLA TUBO ALUMINIO                                       ', 'rejilla-tubo-aluminio', '', '2016-04-14', '2016-04-14'),
(442, '438', '438', 'ACOPLE MANGUERA JARDIN                                      ', 'acople-manguera-jardin', '', '2016-04-14', '2016-04-14'),
(443, '439', '439', 'BAJANTE                                                     ', 'bajante', '', '2016-04-14', '2016-04-14'),
(444, '440', '440', 'BUJE CAUCHO                                                 ', 'buje-caucho', '', '2016-04-14', '2016-04-14'),
(445, '441', '441', 'LLAVE MANGUERA                                              ', 'llave-manguera', '', '2016-04-14', '2016-04-14'),
(446, '442', '442', 'LLAVE TELEDUCHA                                             ', 'llave-teleducha', '', '2016-04-14', '2016-04-14'),
(447, '443', '443', 'MANIJA LEXA                                                 ', 'manija-lexa', '', '2016-04-14', '2016-04-14'),
(448, '445', '445', 'PORTAROLLO                                                  ', 'portarollo', '', '2016-04-14', '2016-04-14'),
(449, '446', '446', 'RACOR GAS                                                   ', 'racor-gas', '', '2016-04-14', '2016-04-14'),
(450, '447', '447', 'REGULADOR GAS                                               ', 'regulador-gas', '', '2016-04-14', '2016-04-14'),
(451, '428', '428', 'LLAVE TERMINAL                                              ', 'llave-terminal', '', '2016-04-14', '2016-04-14'),
(452, '429', '429', 'VALVULA BOLA PVC LISA                                       ', 'valvula-bola-pvc-lisa', '', '2016-04-14', '2016-04-14'),
(453, '430', '430', 'VALVULA BOLA PVC ROSCADA                                    ', 'valvula-bola-pvc-roscada', '', '2016-04-14', '2016-04-14'),
(454, '431', '431', 'VALVULA CHEQUE BRONCE                                       ', 'valvula-cheque-bronce', '', '2016-04-14', '2016-04-14'),
(455, '432', '432', 'VALVULA FLOTADOR                                            ', 'valvula-flotador', '', '2016-04-14', '2016-04-14'),
(456, '433', '433', 'VALVULA PARA GAS                                            ', 'valvula-para-gas', '', '2016-04-14', '2016-04-14'),
(457, '434', '434', 'VALVULA PASO DIRECTO                                        ', 'valvula-paso-directo', '', '2016-04-14', '2016-04-14'),
(458, '435', '435', 'VALVULA PIE                                                 ', 'valvula-pie', '', '2016-04-14', '2016-04-14'),
(459, '436', '436', 'UNIVERSAL PVC LISA                                          ', 'universal-pvc-lisa', '', '2016-04-14', '2016-04-14'),
(460, '437', '437', 'UNIVERSAL PVC ROSCADA                                       ', 'universal-pvc-roscada', '', '2016-04-14', '2016-04-14'),
(461, '418', '418', 'REJILLA TUBO PLASTICO                                       ', 'rejilla-tubo-plastico', '', '2016-04-14', '2016-04-14'),
(462, '419', '419', 'REJILLA VENTILACION                                         ', 'rejilla-ventilacion', '', '2016-04-14', '2016-04-14'),
(463, '420', '420', 'REPUESTOS                                                   ', 'repuestos', '', '2016-04-14', '2016-04-14'),
(464, '421', '421', 'TAPA VALVULA                                                ', 'tapa-valvula', '', '2016-04-14', '2016-04-14'),
(465, '422', '422', 'TAPA SIFON                                                  ', 'tapa-sifon', '', '2016-04-14', '2016-04-14'),
(466, '423', '423', 'VALVULA POZUELO                                             ', 'valvula-pozuelo', '', '2016-04-14', '2016-04-14'),
(467, '424', '424', 'SIFON BOTELLA                                               ', 'sifon-botella', '', '2016-04-14', '2016-04-14'),
(468, '425', '425', 'LLAVE BOLA GRINACA                                          ', 'llave-bola-grinaca', '', '2016-04-14', '2016-04-14'),
(469, '426', '426', 'LLAVE BOLA ITALY                                            ', 'llave-bola-italy', '', '2016-04-14', '2016-04-14'),
(470, '427', '427', 'LLAVE CORTINA                                               ', 'llave-cortina', '', '2016-04-14', '2016-04-14'),
(471, '448', '448', 'SURTIDOR                                                    ', 'surtidor', '', '2016-04-14', '2016-04-14'),
(472, '449', '449', 'TAPON                                                       ', 'tapon', '', '2016-04-14', '2016-04-14'),
(473, '450', '450', 'TELEDUCHA                                                   ', 'teleducha', '', '2016-04-14', '2016-04-14'),
(474, '451', '451', 'TUERCA SIFON                                                ', 'tuerca-sifon', '', '2016-04-14', '2016-04-14'),
(475, '452', '452', 'YEE LAVADORA                                                ', 'yee-lavadora', '', '2016-04-14', '2016-04-14'),
(476, '455', '455', 'LAVAPLATOS SOCODA                                           ', 'lavaplatos-socoda', '', '2016-04-14', '2016-04-14'),
(477, '456', '456', 'LAVAPLATOS FANAINOX                                         ', 'lavaplatos-fanainox', '', '2016-04-14', '2016-04-14'),
(478, '457', '457', 'LAVAPLATOS ALUMINIO                                         ', 'lavaplatos-aluminio', '', '2016-04-14', '2016-04-14'),
(479, '458', '458', 'LAVAPLATOS HIERRO BRILLADO                                  ', 'lavaplatos-hierro-brillado', '', '2016-04-14', '2016-04-14'),
(480, '808', '808', 'TIZA', 'tiza', '', '2016-04-14', '2016-04-14'),
(481, '459', '459', 'LAVAPLATOS HIERRO COLADO                                    ', 'lavaplatos-hierro-colado', '', '2016-04-14', '2016-04-14'),
(482, '460', '460', 'LAVADEROS CEMENTO                                           ', 'lavaderos-cemento', '', '2016-04-14', '2016-04-14'),
(483, '461', '461', 'LAVADEROS GRANITO                                           ', 'lavaderos-granito', '', '2016-04-14', '2016-04-14'),
(484, '462', '462', 'PILA CEMENTO                                                ', 'pila-cemento', '', '2016-04-14', '2016-04-14'),
(485, '463', '463', 'REFREGADERO CEMENTO                                         ', 'refregadero-cemento', '', '2016-04-14', '2016-04-14'),
(486, '464', '464', 'JUEGO INCRUSTACIONES EDESA                                  ', 'juego-incrustaciones-edesa', '', '2016-04-14', '2016-04-14'),
(487, '465', '465', 'JUEGO INCRUSTACIONES ASTRO                                  ', 'juego-incrustaciones-astro', '', '2016-04-14', '2016-04-14'),
(488, '466', '466', 'JUEGO INCRUSTACIONES GRIVAL                                 ', 'juego-incrustaciones-grival', '', '2016-04-14', '2016-04-14'),
(489, '467', '467', 'ACCESORIOS BOLA BRONCE                                      ', 'accesorios-bola-bronce', '', '2016-04-14', '2016-04-14'),
(490, '468', '468', 'ACCESORIOS VARILLA                                          ', 'accesorios-varilla', '', '2016-04-14', '2016-04-14'),
(491, '500', '500', 'REGADERA                                                    ', 'regadera', '', '2016-04-14', '2016-04-14'),
(492, '501', '501', 'ASIENTO SANITARIO ECONOMICO                                 ', 'asiento-sanitario-economico', '', '2016-04-14', '2016-04-14'),
(493, '502', '502', 'ASIENTO SANITARIO GRIVAL                                    ', 'asiento-sanitario-grival', '', '2016-04-14', '2016-04-14'),
(494, '503', '503', 'CASQUETES                                                   ', 'casquetes', '', '2016-04-14', '2016-04-14'),
(495, '504', '504', 'CEPILLERA GRIVAL                                            ', 'cepillera-grival', '', '2016-04-14', '2016-04-14'),
(496, '505', '505', 'PISTON                                                      ', 'piston', '', '2016-04-14', '2016-04-14'),
(497, '506', '506', 'CORDON NYLON                                                ', 'cordon-nylon', '', '2016-04-14', '2016-04-14'),
(498, '507', '507', 'DISCO ASIENTO                                               ', 'disco-asiento', '', '2016-04-14', '2016-04-14'),
(499, '508', '508', 'DISPENSADOR                                                 ', 'dispensador', '', '2016-04-14', '2016-04-14'),
(500, '509', '509', 'FLOTADOR                                                    ', 'flotador', '', '2016-04-14', '2016-04-14'),
(501, '490', '490', 'DUCHA VENTO                                                 ', 'ducha-vento', '', '2016-04-14', '2016-04-14'),
(502, '491', '491', 'DUCHA PISCIS                                                ', 'ducha-piscis', '', '2016-04-14', '2016-04-14'),
(503, '492', '492', 'DUCHA PRYSMA                                                ', 'ducha-prysma', '', '2016-04-14', '2016-04-14'),
(504, '493', '493', 'DUCHA GALAXIA                                               ', 'ducha-galaxia', '', '2016-04-14', '2016-04-14'),
(505, '494', '494', 'DUCHA OPERA                                                 ', 'ducha-opera', '', '2016-04-14', '2016-04-14'),
(506, '495', '495', 'DUCHA BRIZA                                                 ', 'ducha-briza', '', '2016-04-14', '2016-04-14'),
(507, '496', '496', 'DUCHA RIO                                                   ', 'ducha-rio', '', '2016-04-14', '2016-04-14'),
(508, '497', '497', 'ESFERA CRUCETA                                              ', 'esfera-cruceta', '', '2016-04-14', '2016-04-14'),
(509, '498', '498', 'EMPAQUE DUCHA                                               ', 'empaque-ducha', '', '2016-04-14', '2016-04-14'),
(510, '499', '499', 'ESCUDOS DUCHA                                               ', 'escudos-ducha', '', '2016-04-14', '2016-04-14'),
(511, '469', '469', 'ACOPLE MACHO ALUMINIO                                       ', 'acople-macho-aluminio', '', '2016-04-14', '2016-04-14'),
(512, '470', '470', 'ACOPLE VALVULA                                              ', 'acople-valvula', '', '2016-04-14', '2016-04-14'),
(513, '471', '471', 'CHEQUE CILINDRO                                             ', 'cheque-cilindro', '', '2016-04-14', '2016-04-14'),
(514, '472', '472', 'FLANCHE                                                     ', 'flanche', '', '2016-04-14', '2016-04-14'),
(515, '473', '473', 'TEES ROSCA ALUMINIO                                         ', 'tees-rosca-aluminio', '', '2016-04-14', '2016-04-14'),
(516, '474', '474', 'UNIONES DE ALUMINIO                                         ', 'uniones-de-aluminio', '', '2016-04-14', '2016-04-14'),
(517, '475', '475', 'CANASTILLA GRIVAL                                           ', 'canastilla-grival', '', '2016-04-14', '2016-04-14'),
(518, '476', '476', 'CARTUCHOS                                                   ', 'cartuchos', '', '2016-04-14', '2016-04-14'),
(519, '477', '477', 'ESCUDOS                                                     ', 'escudos', '', '2016-04-14', '2016-04-14'),
(520, '792', '792', 'ACOPLES', 'acoples', '', '2016-04-14', '2016-04-14'),
(521, '510', '510', 'FLUXOMETRO                                                  ', 'fluxometro', '', '2016-04-14', '2016-04-14'),
(522, '511', '511', 'GRIFERIA ORINAL                                             ', 'griferia-orinal', '', '2016-04-14', '2016-04-14'),
(523, '512', '512', 'HERRAJE                                                     ', 'herraje', '', '2016-04-14', '2016-04-14'),
(524, '513', '513', 'JUEGO ACCESORIOS                                            ', 'juego-accesorios', '', '2016-04-14', '2016-04-14'),
(525, '514', '514', 'PALANCA                                                     ', 'palanca', '', '2016-04-14', '2016-04-14'),
(526, '515', '515', 'TELEDUCHA GRIVAL                                            ', 'teleducha-grival', '', '2016-04-14', '2016-04-14'),
(527, '516', '516', 'EXTRACTOR                                                   ', 'extractor', '', '2016-04-14', '2016-04-14'),
(528, '517', '517', 'VALVULA REGULACION                                          ', 'valvula-regulacion', '', '2016-04-14', '2016-04-14'),
(529, '518', '518', 'MANGUERAS GRIVAL                                            ', 'mangueras-grival', '', '2016-04-14', '2016-04-14'),
(530, '519', '519', 'MANIJAS                                                     ', 'manijas', '', '2016-04-14', '2016-04-14'),
(531, '478', '478', 'FILTRO VALVULA                                              ', 'filtro-valvula', '', '2016-04-14', '2016-04-14'),
(532, '479', '479', 'GRIFERIA LAVAPLATOS                                         ', 'griferia-lavaplatos', '', '2016-04-14', '2016-04-14'),
(533, '480', '480', 'PIN CANASTILLA                                              ', 'pin-canastilla', '', '2016-04-14', '2016-04-14'),
(534, '482', '482', 'DESAGUE                                                     ', 'desague', '', '2016-04-14', '2016-04-14'),
(535, '483', '483', 'EMPAQUE                                                     ', 'empaque', '', '2016-04-14', '2016-04-14'),
(536, '484', '484', 'GRIFERIA LAVAMANOS                                          ', 'griferia-lavamanos', '', '2016-04-14', '2016-04-14'),
(537, '485', '485', 'TAPON DECORATIVO GRIVAL                                     ', 'tapon-decorativo-grival', '', '2016-04-14', '2016-04-14'),
(538, '487', '487', 'DUCHA LIS                                                   ', 'ducha-lis', '', '2016-04-14', '2016-04-14'),
(539, '488', '488', 'DUCHA FENIX                                                 ', 'ducha-fenix', '', '2016-04-14', '2016-04-14'),
(540, '489', '489', 'DUCHA LOIRA                                                 ', 'ducha-loira', '', '2016-04-14', '2016-04-14'),
(541, '520', '520', 'NARIZ                                                       ', 'nariz', '', '2016-04-14', '2016-04-14'),
(542, '521', '521', 'REJILLA GRIVAL                                              ', 'rejilla-grival', '', '2016-04-14', '2016-04-14'),
(543, '522', '522', 'REPUESTOS GRIVAL                                            ', 'repuestos-grival', '', '2016-04-14', '2016-04-14'),
(544, '523', '523', 'SELLO LENGUETA                                              ', 'sello-lengueta', '', '2016-04-14', '2016-04-14'),
(545, '524', '524', 'SIFON                                                       ', 'sifon', '', '2016-04-14', '2016-04-14'),
(546, '525', '525', 'TORNILLO GRIVAL                                             ', 'tornillo-grival', '', '2016-04-14', '2016-04-14'),
(547, '526', '526', 'TUERCA                                                      ', 'tuerca', '', '2016-04-14', '2016-04-14'),
(548, '527', '527', 'LLAVE AUTOMATICA                                            ', 'llave-automatica', '', '2016-04-14', '2016-04-14'),
(549, '528', '528', 'LLAVE INDIVIDUAL                                            ', 'llave-individual', '', '2016-04-14', '2016-04-14'),
(550, '529', '529', 'LLAVE TERMINAL GRIVAL                                       ', 'llave-terminal-grival', '', '2016-04-14', '2016-04-14'),
(551, '530', '530', 'ARBOL DE ENTRADA                                            ', 'arbol-de-entrada', '', '2016-04-14', '2016-04-14'),
(552, '531', '531', 'DESAGUE GRIFOS Y PARTES                                     ', 'desague-grifos-y-partes', '', '2016-04-14', '2016-04-14'),
(553, '532', '532', 'CANASTILLAS ECONOMICA                                       ', 'canastillas-economica', '', '2016-04-14', '2016-04-14'),
(554, '533', '533', 'SIFON ECONOMICO                                             ', 'sifon-economico', '', '2016-04-14', '2016-04-14'),
(555, '534', '534', 'SOSCO ECONOMICO                                             ', 'sosco-economico', '', '2016-04-14', '2016-04-14'),
(556, '535', '535', 'CEPILLERA ASTRO                                             ', 'cepillera-astro', '', '2016-04-14', '2016-04-14'),
(557, '536', '536', 'DUCHA ASTRO                                                 ', 'ducha-astro', '', '2016-04-14', '2016-04-14'),
(558, '537', '537', 'GANCHO DOBLE                                                ', 'gancho-doble', '', '2016-04-14', '2016-04-14'),
(559, '538', '538', 'JABONERA DUCHA                                              ', 'jabonera-ducha', '', '2016-04-14', '2016-04-14'),
(560, '539', '539', 'JABONERA LAVAMANOS                                          ', 'jabonera-lavamanos', '', '2016-04-14', '2016-04-14'),
(561, '540', '540', 'PAPELERA ASTRO                                              ', 'papelera-astro', '', '2016-04-14', '2016-04-14'),
(562, '541', '541', 'RODACHIN                                                    ', 'rodachin', '', '2016-04-14', '2016-04-14'),
(563, '542', '542', 'PARILLA AZADORA                                             ', 'parilla-azadora', '', '2016-04-14', '2016-04-14'),
(564, '543', '543', 'ACEITES                                                     ', 'aceites', '', '2016-04-14', '2016-04-14'),
(565, '544', '544', 'BRILLMETAL                                                  ', 'brillmetal', '', '2016-04-14', '2016-04-14'),
(566, '545', '545', 'CINTAS                                                      ', 'cintas', '', '2016-04-14', '2016-04-14'),
(567, '546', '546', 'TEFLON                                                      ', 'teflon', '', '2016-04-14', '2016-04-14'),
(568, '547', '547', 'ABRAZADERAS                                                 ', 'abrazaderas', '', '2016-04-14', '2016-04-14'),
(569, '548', '548', 'TUBO ALUMINIO                                               ', 'tubo-aluminio', '', '2016-04-14', '2016-04-14'),
(570, '803', '803', 'YOYO', 'yoyo', '', '2016-04-14', '2016-04-14'),
(571, '569', '569', 'INMUNIZANTES PARA MADERAS                                   ', 'inmunizantes-para-maderas', '', '2016-04-14', '2016-04-14'),
(572, '570', '570', 'SILICONAS SIKA                                              ', 'siliconas-sika', '', '2016-04-14', '2016-04-14'),
(573, '571', '571', 'POLIURETANOS Y SELLOS                                       ', 'poliuretanos-y-sellos', '', '2016-04-14', '2016-04-14'),
(574, '572', '572', 'HERRAMIENTAS SIKA                                           ', 'herramientas-sika', '', '2016-04-14', '2016-04-14'),
(575, '573', '573', 'MARTILLO                                                    ', 'martillo', '', '2016-04-14', '2016-04-14'),
(576, '574', '574', 'CABOS                                                       ', 'cabos', '', '2016-04-14', '2016-04-14'),
(577, '575', '575', 'CORREAS AMARRES                                             ', 'correas-amarres', '', '2016-04-14', '2016-04-14'),
(578, '576', '576', 'ESCOBAS                                                     ', 'escobas', '', '2016-04-14', '2016-04-14'),
(579, '577', '577', 'GRATA                                                       ', 'grata', '', '2016-04-14', '2016-04-14'),
(580, '578', '578', 'LAPIZ                                                       ', 'lapiz', '', '2016-04-14', '2016-04-14'),
(581, '549', '549', 'CINTA COBRA                                                 ', 'cinta-cobra', '', '2016-04-14', '2016-04-14'),
(582, '550', '550', 'CHUPAS                                                      ', 'chupas', '', '2016-04-14', '2016-04-14'),
(583, '551', '551', 'GABINETE BANO                                               ', 'gabinete-bano', '', '2016-04-14', '2016-04-14'),
(584, '552', '552', 'FIJAMIX                                                     ', 'fijamix', '', '2016-04-14', '2016-04-14'),
(585, '553', '553', 'ESQUINERO PLASTICO                                          ', 'esquinero-plastico', '', '2016-04-14', '2016-04-14'),
(586, '554', '554', 'ONDULADO INTERMATEX                                         ', 'ondulado-intermatex', '', '2016-04-14', '2016-04-14'),
(587, '555', '555', 'PELDANO INTERMATEX                                          ', 'peldano-intermatex', '', '2016-04-14', '2016-04-14'),
(588, '556', '556', 'CUCHILLAS ELECTRICAS                                        ', 'cuchillas-electricas', '', '2016-04-14', '2016-04-14'),
(589, '557', '557', 'ALCAYATA                                                    ', 'alcayata', '', '2016-04-14', '2016-04-14'),
(590, '558', '558', 'CANALES GERFOR                                              ', 'canales-gerfor', '', '2016-04-14', '2016-04-14'),
(591, '559', '559', 'VARILLA CUADRADA                                            ', 'varilla-cuadrada', '', '2016-04-14', '2016-04-14'),
(592, '560', '560', 'LETRAS Y NUMERO                                             ', 'letras-y-numero', '', '2016-04-14', '2016-04-14'),
(593, '561', '561', 'ADITIVOS PARA CEMENTO                                       ', 'aditivos-para-cemento', '', '2016-04-14', '2016-04-14'),
(594, '562', '562', 'ADITIVOS PARA MORTEROS                                      ', 'aditivos-para-morteros', '', '2016-04-14', '2016-04-14'),
(595, '563', '563', 'ADITIVOS Y ADICIONES MORTEROS                               ', 'aditivos-y-adiciones-morteros', '', '2016-04-14', '2016-04-14'),
(596, '564', '564', 'CURADORES Y DESENCOFRANTES                                  ', 'curadores-y-desencofrantes', '', '2016-04-14', '2016-04-14'),
(597, '565', '565', 'MORTEROS LISTOS                                             ', 'morteros-listos', '', '2016-04-14', '2016-04-14'),
(598, '566', '566', 'MORTEROS LISTOS MODIFICADOS                                 ', 'morteros-listos-modificados', '', '2016-04-14', '2016-04-14'),
(599, '567', '567', 'ADHESIVOS EPOXICOS                                          ', 'adhesivos-epoxicos', '', '2016-04-14', '2016-04-14'),
(600, '568', '568', 'IMPERMEABILIZANTES Y LIMPIADOR                              ', 'impermeabilizantes-y-limpiador', '', '2016-04-14', '2016-04-14'),
(601, '579', '579', 'ACCESORIO MANGUERA                                          ', 'accesorio-manguera', '', '2016-04-14', '2016-04-14'),
(602, '580', '580', 'LINTERNA                                                    ', 'linterna', '', '2016-04-14', '2016-04-14'),
(603, '581', '581', 'PULPOS                                                      ', 'pulpos', '', '2016-04-14', '2016-04-14'),
(604, '582', '582', 'ALAMEDA                                                     ', 'alameda', '', '2016-04-14', '2016-04-14'),
(605, '583', '583', 'VERONA                                                      ', 'verona', '', '2016-04-14', '2016-04-14'),
(606, '584', '584', 'MILANO                                                      ', 'milano', '', '2016-04-14', '2016-04-14'),
(607, '585', '585', 'LAVATRAPEROS                                                ', 'lavatraperos', '', '2016-04-14', '2016-04-14'),
(608, '586', '586', 'REGISTRO INCORPORACION                                      ', 'registro-incorporacion', '', '2016-04-14', '2016-04-14'),
(609, '587', '587', 'TOALLERO                                                    ', 'toallero', '', '2016-04-14', '2016-04-14'),
(610, '588', '588', 'DUCHA MONACO                                                ', 'ducha-monaco', '', '2016-04-14', '2016-04-14'),
(611, '619', '619', 'GRIFERIA SANITARIA                                          ', 'griferia-sanitaria', '', '2016-04-14', '2016-04-14'),
(612, '620', '620', 'HERRAMIENTA SANITARIA                                       ', 'herramienta-sanitaria', '', '2016-04-14', '2016-04-14'),
(613, '621', '621', 'MEZCLADOR DUCHA                                             ', 'mezclador-ducha', '', '2016-04-14', '2016-04-14'),
(614, '622', '622', 'PERCHAS GRIVAL                                              ', 'perchas-grival', '', '2016-04-14', '2016-04-14'),
(615, '623', '623', 'PORTAROLLO GRIVAL                                           ', 'portarollo-grival', '', '2016-04-14', '2016-04-14'),
(616, '624', '624', 'VALVULAS REGULACION                                         ', 'valvulas-regulacion', '', '2016-04-14', '2016-04-14'),
(617, '625', '625', 'REGISTRO DUCHA                                              ', 'registro-ducha', '', '2016-04-14', '2016-04-14'),
(618, '626', '626', 'VALVULA CONTROL                                             ', 'valvula-control', '', '2016-04-14', '2016-04-14'),
(619, '627', '627', 'REPUESTOS LAVAMANOS                                         ', 'repuestos-lavamanos', '', '2016-04-14', '2016-04-14'),
(620, '628', '628', 'REPUESTOS LAVAPLATOS                                        ', 'repuestos-lavaplatos', '', '2016-04-14', '2016-04-14'),
(621, '589', '589', 'DUCHA VIENA                                                 ', 'ducha-viena', '', '2016-04-14', '2016-04-14'),
(622, '590', '590', 'DUCHA ATHENAS                                               ', 'ducha-athenas', '', '2016-04-14', '2016-04-14'),
(623, '591', '591', 'DUCHA FLORENCIA                                             ', 'ducha-florencia', '', '2016-04-14', '2016-04-14'),
(624, '592', '592', 'DUCHA GAVIOTA                                               ', 'ducha-gaviota', '', '2016-04-14', '2016-04-14'),
(625, '593', '593', 'DUCHA GIRO                                                  ', 'ducha-giro', '', '2016-04-14', '2016-04-14'),
(626, '594', '594', 'DUCHA MAGNA                                                 ', 'ducha-magna', '', '2016-04-14', '2016-04-14'),
(627, '595', '595', 'DUCHA MARRUECOS                                             ', 'ducha-marruecos', '', '2016-04-14', '2016-04-14'),
(628, '596', '596', 'DUCHA BAHIA                                                 ', 'ducha-bahia', '', '2016-04-14', '2016-04-14'),
(629, '597', '597', 'DUCHA NOVO                                                  ', 'ducha-novo', '', '2016-04-14', '2016-04-14'),
(630, '598', '598', 'DUCHA OSIRIS                                                ', 'ducha-osiris', '', '2016-04-14', '2016-04-14'),
(631, '599', '599', 'DUCHA SIRENA                                                ', 'ducha-sirena', '', '2016-04-14', '2016-04-14'),
(632, '600', '600', 'DUCHA STYLO                                                 ', 'ducha-stylo', '', '2016-04-14', '2016-04-14'),
(633, '601', '601', 'DUCHA VICTORIA                                              ', 'ducha-victoria', '', '2016-04-14', '2016-04-14'),
(634, '602', '602', 'DUCHA KADIZ                                                 ', 'ducha-kadiz', '', '2016-04-14', '2016-04-14'),
(635, '603', '603', 'EMPAQUES LAVAMANOS LAVAPLATOS                               ', 'empaques-lavamanos-lavaplatos', '', '2016-04-14', '2016-04-14'),
(636, '604', '604', 'EMPAQUE SANITARIO TANQUE                                    ', 'empaque-sanitario-tanque', '', '2016-04-14', '2016-04-14'),
(637, '605', '605', 'EMPAQUES VARIOS                                             ', 'empaques-varios', '', '2016-04-14', '2016-04-14'),
(638, '606', '606', 'GRAPAS GRIFOS Y PARTES                                      ', 'grapas-grifos-y-partes', '', '2016-04-14', '2016-04-14'),
(639, '607', '607', 'GRICOL                                                      ', 'gricol', '', '2016-04-14', '2016-04-14'),
(640, '608', '608', 'HERRAJE GRIFOS                                              ', 'herraje-grifos', '', '2016-04-14', '2016-04-14'),
(641, '609', '609', 'ROCIADOR GRIFOS                                             ', 'rociador-grifos', '', '2016-04-14', '2016-04-14'),
(642, '610', '610', 'REPUESTOS GRIFOS                                            ', 'repuestos-grifos', '', '2016-04-14', '2016-04-14'),
(643, '611', '611', 'VALVULA GRIFOS                                              ', 'valvula-grifos', '', '2016-04-14', '2016-04-14'),
(644, '612', '612', 'YEES                                                        ', 'yees', '', '2016-04-14', '2016-04-14'),
(645, '613', '613', 'AIREADOR                                                    ', 'aireador', '', '2016-04-14', '2016-04-14'),
(646, '614', '614', 'BONETE                                                      ', 'bonete', '', '2016-04-14', '2016-04-14'),
(647, '615', '615', 'REPUESTOS DUCHAS                                            ', 'repuestos-duchas', '', '2016-04-14', '2016-04-14'),
(648, '616', '616', 'REPUESTOS SANITARIOS                                        ', 'repuestos-sanitarios', '', '2016-04-14', '2016-04-14'),
(649, '617', '617', 'CUERPO                                                      ', 'cuerpo', '', '2016-04-14', '2016-04-14'),
(650, '618', '618', 'GRAPAS GRIVAL                                               ', 'grapas-grival', '', '2016-04-14', '2016-04-14'),
(651, '629', '629', 'PONCHERA                                                    ', 'ponchera', '', '2016-04-14', '2016-04-14'),
(652, '630', '630', 'EMPAQUES LAVAPLATOS                                         ', 'empaques-lavaplatos', '', '2016-04-14', '2016-04-14'),
(653, '631', '631', 'ESCUDOS LAVAMANOS                                           ', 'escudos-lavamanos', '', '2016-04-14', '2016-04-14'),
(654, '632', '632', 'LLAVE GRICOL                                                ', 'llave-gricol', '', '2016-04-14', '2016-04-14'),
(655, '633', '633', 'LLAVE ANTIFRAUDE                                            ', 'llave-antifraude', '', '2016-04-14', '2016-04-14'),
(656, '634', '634', 'TEJA LUMINIT                                                ', 'teja-luminit', '', '2016-04-14', '2016-04-14'),
(657, '635', '635', 'INALGRIFOS                                                  ', 'inalgrifos', '', '2016-04-14', '2016-04-14'),
(658, '636', '636', 'DILATACIONES                                                ', 'dilataciones', '', '2016-04-14', '2016-04-14'),
(659, '637', '637', 'TABLA                                                       ', 'tabla', '', '2016-04-14', '2016-04-14'),
(660, '638', '638', 'LISTON                                                      ', 'liston', '', '2016-04-14', '2016-04-14'),
(661, '639', '639', 'GANCHOS                                                     ', 'ganchos', '', '2016-04-14', '2016-04-14'),
(662, '640', '640', 'ESTOPAS                                                     ', 'estopas', '', '2016-04-14', '2016-04-14'),
(663, '641', '641', 'LLAVE JARDIN                                                ', 'llave-jardin', '', '2016-04-14', '2016-04-14'),
(664, '642', '642', 'ESQUINEROS                                                  ', 'esquineros', '', '2016-04-14', '2016-04-14'),
(665, '643', '643', 'VARA REDONDA                                                ', 'vara-redonda', '', '2016-04-14', '2016-04-14'),
(666, '644', '644', 'CANABRAVA                                                   ', 'canabrava', '', '2016-04-14', '2016-04-14'),
(667, '645', '645', 'IMPERMEABILIZANTE ACRILICO                                  ', 'impermeabilizante-acrilico', '', '2016-04-14', '2016-04-14'),
(668, '646', '646', 'POSTES DE MADERA                                            ', 'postes-de-madera', '', '2016-04-14', '2016-04-14'),
(669, '647', '647', 'ROSCA                                                       ', 'rosca', '', '2016-04-14', '2016-04-14'),
(670, '648', '648', 'LADRILLO EN CONSIGNACION                                    ', 'ladrillo-en-consignacion', '', '2016-04-14', '2016-04-14'),
(671, '678', '678', 'CEMENTO GRIS PENDIENTE                                      ', 'cemento-gris-pendiente', '', '2016-04-14', '2016-04-14'),
(672, '679', '679', 'SOLDADURA CELTA                                             ', 'soldadura-celta', '', '2016-04-14', '2016-04-14'),
(673, '680', '680', 'CIZALLA                                                     ', 'cizalla', '', '2016-04-14', '2016-04-14'),
(674, '681', '681', 'CANDADO LIONS                                               ', 'candado-lions', '', '2016-04-14', '2016-04-14'),
(675, '682', '682', 'CANDADOS GOLWALL                                            ', 'candados-golwall', '', '2016-04-14', '2016-04-14'),
(676, '683', '683', 'TIJERAS EXENTAS                                             ', 'tijeras-exentas', '', '2016-04-14', '2016-04-14'),
(677, '684', '684', 'MARSELLA                                                    ', 'marsella', '', '2016-04-14', '2016-04-14'),
(678, '685', '685', 'GRAFITO                                                     ', 'grafito', '', '2016-04-14', '2016-04-14'),
(679, '686', '686', 'CENEFAS SICHAR                                              ', 'cenefas-sichar', '', '2016-04-14', '2016-04-14'),
(680, '687', '687', 'ENGRASADORA                                                 ', 'engrasadora', '', '2016-04-14', '2016-04-14'),
(681, '649', '649', 'REPUESTOS LAVAMANOS VARIOS                                  ', 'repuestos-lavamanos-varios', '', '2016-04-14', '2016-04-14'),
(682, '650', '650', 'VITRIBLOCK                                                  ', 'vitriblock', '', '2016-04-14', '2016-04-14'),
(683, '651', '651', 'SIERRAS                                                     ', 'sierras', '', '2016-04-14', '2016-04-14'),
(684, '652', '652', 'REPUESTOS LAVAPLAT                                          ', 'repuestos-lavaplat', '', '2016-04-14', '2016-04-14'),
(685, '653', '653', 'PALANCA SANITARIA                                           ', 'palanca-sanitaria', '', '2016-04-14', '2016-04-14'),
(686, '654', '654', 'JUEGO INCRUSTACIONES ECONIMICA                              ', 'juego-incrustaciones-econimica', '', '2016-04-14', '2016-04-14'),
(687, '655', '655', 'ARGOLLAS                                                    ', 'argollas', '', '2016-04-14', '2016-04-14'),
(688, '656', '656', 'BOYA                                                        ', 'boya', '', '2016-04-14', '2016-04-14'),
(689, '657', '657', 'MACHETE                                                     ', 'machete', '', '2016-04-14', '2016-04-14'),
(690, '813', '813', 'PEGADURO', 'pegaduro', '', '2016-04-14', '2016-04-14'),
(691, '658', '658', 'RETAL CORALINA                                              ', 'retal-coralina', '', '2016-04-14', '2016-04-14'),
(692, '659', '659', 'TUBERIA                                                     ', 'tuberia', '', '2016-04-14', '2016-04-14'),
(693, '660', '660', 'SIRENA                                                      ', 'sirena', '', '2016-04-14', '2016-04-14'),
(694, '661', '661', 'LISTELO CONSTRUCCIONES                                      ', 'listelo-construcciones', '', '2016-04-14', '2016-04-14'),
(695, '662', '662', 'NEVERA                                                      ', 'nevera', '', '2016-04-14', '2016-04-14'),
(696, '663', '663', 'MACHIMBRE                                                   ', 'machimbre', '', '2016-04-14', '2016-04-14'),
(697, '664', '664', 'UNION PLATINO                                               ', 'union-platino', '', '2016-04-14', '2016-04-14'),
(698, '665', '665', 'ASPIRADORA                                                  ', 'aspiradora', '', '2016-04-14', '2016-04-14'),
(699, '666', '666', 'COLCHON                                                     ', 'colchon', '', '2016-04-14', '2016-04-14'),
(700, '667', '667', 'LAMINAS                                                     ', 'laminas', '', '2016-04-14', '2016-04-14'),
(701, '668', '668', 'BOMBILLOS EG LIGHTING                                       ', 'bombillos-eg-lighting', '', '2016-04-14', '2016-04-14'),
(702, '669', '669', 'AZADON EXENTO                                               ', 'azadon-exento', '', '2016-04-14', '2016-04-14'),
(703, '670', '670', 'ACCESORIO SANITARIO GRIVAL                                  ', 'accesorio-sanitario-grival', '', '2016-04-14', '2016-04-14'),
(704, '671', '671', 'COMPLEMENTOS GRIVAL                                         ', 'complementos-grival', '', '2016-04-14', '2016-04-14'),
(705, '672', '672', 'ACCESORIOS LAVAMANOS GRIVAL                                 ', 'accesorios-lavamanos-grival', '', '2016-04-14', '2016-04-14'),
(706, '673', '673', 'ACCESORIOS LAVAPLATOS GRIVAL                                ', 'accesorios-lavaplatos-grival', '', '2016-04-14', '2016-04-14'),
(707, '674', '674', 'RESPUESTOS GRIVAL                                           ', 'respuestos-grival', '', '2016-04-14', '2016-04-14'),
(708, '675', '675', 'ACCESORIO DUCHA GRIVAL                                      ', 'accesorio-ducha-grival', '', '2016-04-14', '2016-04-14'),
(709, '676', '676', 'INCRUSTACIONES INDIVIDUALES GR                              ', 'incrustaciones-individuales-gr', '', '2016-04-14', '2016-04-14'),
(710, '677', '677', 'LLAVES TERMINAL GRIVAL                                      ', 'llaves-terminal-grival', '', '2016-04-14', '2016-04-14'),
(711, '688', '688', 'TEJA COLOMBIT                                               ', 'teja-colombit', '', '2016-04-15', '2016-04-15'),
(712, '689', '689', 'CABALLETE COLOMBIT                                          ', 'caballete-colombit', '', '2016-04-15', '2016-04-15'),
(713, '690', '690', 'CLARABOYA COLOMBIT                                          ', 'claraboya-colombit', '', '2016-04-15', '2016-04-15'),
(714, '691', '691', 'TANQUE COLOMBIT                                             ', 'tanque-colombit', '', '2016-04-15', '2016-04-15'),
(715, '692', '692', 'ALQUILER ESCALERAS                                          ', 'alquiler-escaleras', '', '2016-04-15', '2016-04-15'),
(716, '702', '702', 'MACHETA IVA 5                                            ', 'macheta-iva-5', '', '2016-04-15', '2016-04-15'),
(717, '703', '703', 'PICA IVA 5                                               ', 'pica-iva-5', '', '2016-04-15', '2016-04-15'),
(718, '704', '704', 'RASTRILLO IVA 5                                          ', 'rastrillo-iva-5', '', '2016-04-15', '2016-04-15'),
(719, '705', '705', 'ALQUILERES                                                  ', 'alquileres', '', '2016-04-15', '2016-04-15'),
(720, '801', '801', 'GATO HIDRAULICO', 'gato-hidraulico', '', '2016-04-15', '2016-04-15'),
(721, '780', '780', 'POLEAS                                                      ', 'poleas', '', '2016-04-15', '2016-04-15'),
(722, '783', '783', 'DUPLICADO LLAVES', 'duplicado-llaves', '', '2016-04-15', '2016-04-15'),
(723, '787', '787', 'LLANA DENTADA', 'llana-dentada', '', '2016-04-15', '2016-04-15'),
(724, '800', '800', 'POZO SEPTICO', 'pozo-septico', '', '2016-04-15', '2016-04-15'),
(725, '802', '802', 'CUCHILLA PICAPASTO ', 'cuchilla-picapasto', '', '2016-04-15', '2016-04-15'),
(726, '693', '693', 'VINIFLEX TIPO II                                            ', 'viniflex-tipo-ii', '', '2016-04-15', '2016-04-15'),
(727, '694', '694', 'TABLETA IVA                                                 ', 'tableta-iva', '', '2016-04-15', '2016-04-15'),
(728, '696', '696', 'PALAS IVA 5                                              ', 'palas-iva-5', '', '2016-04-15', '2016-04-15'),
(729, '697', '697', 'TIJERAS PODAR IVA 5                                      ', 'tijeras-podar-iva-5', '', '2016-04-15', '2016-04-15'),
(730, '698', '698', 'AZADON IVA 5                                             ', 'azadon-iva-5', '', '2016-04-15', '2016-04-15'),
(731, '699', '699', 'CIZALLA IVA 5                                            ', 'cizalla-iva-5', '', '2016-04-15', '2016-04-15'),
(732, '782', '782', 'BOMBILLO PANEL LED', 'bombillo-panel-led', '', '2016-04-15', '2016-04-15'),
(733, '701', '701', 'HACHA IVA 5                                              ', 'hacha-iva-5', '', '2016-04-15', '2016-04-15'),
(734, '823', '823', '987', '987', '', '2016-04-15', '2016-04-15'),
(735, '781', '781', 'SALDOS INICIALES', 'saldos-iniciales', '', '2016-04-15', '2016-04-15'),
(736, '001', '001', 'ARGOLLA CORTINA', 'argolla-cortina', '', '2016-04-15', '2016-04-15'),
(737, '002', '002', 'GANCHOS CORTINA', 'ganchos-cortina', '', '2016-04-15', '2016-04-15');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `inventariogrupo`
--

INSERT INTO `inventariogrupo` (`id`, `InvGruCod`, `InvGruId`, `InvGruNom`, `estado`, `created_at`, `updated_at`, `slug_grupo`) VALUES
(1, '01        ', '01        ', 'MEDICAMENTOS                       ', 1, '2016-04-14', '2016-04-14', 'medicamentos'),
(2, '02        ', '02        ', 'UTILES DE ASEO                     ', 1, '2016-04-14', '2016-04-14', 'utiles-de-aseo'),
(3, '03        ', '03        ', 'CACHARRERIA                        ', 1, '2016-04-14', '2016-04-14', 'cacharreria'),
(4, '04        ', '04        ', 'PAPELERIA                          ', 1, '2016-04-14', '2016-04-14', 'papeleria'),
(5, '05        ', '05        ', 'CUIDADO CAPILAR                    ', 1, '2016-04-14', '2016-04-14', 'cuidado-capilar'),
(6, '06        ', '06        ', 'ASEO HOGAR                         ', 1, '2016-04-14', '2016-04-14', 'aseo-hogar'),
(7, '07        ', '07        ', 'ABARROTES                          ', 1, '2016-04-14', '2016-04-14', 'abarrotes'),
(8, '08        ', '08        ', 'FERRETERIA                         ', 1, '2016-04-14', '2016-04-14', 'ferreteria'),
(9, '11        ', '11        ', 'PLAN VARTA                         ', 1, '2016-04-14', '2016-04-14', 'plan-varta'),
(10, '09        ', '09        ', 'COLGATE PALMOLIVE                  ', 1, '2016-04-14', '2016-04-14', 'colgate-palmolive'),
(11, '10        ', '10        ', 'TECNOQUIMICAS                      ', 1, '2016-04-14', '2016-04-14', 'tecnoquimicas'),
(12, '12        ', '12        ', 'LACTEOS                            ', 1, '2016-04-14', '2016-04-14', 'lacteos'),
(13, '13        ', '13        ', 'EL CHINO                           ', 1, '2016-04-14', '2016-04-14', 'el-chino'),
(14, '14        ', '14        ', 'JIRAFA                             ', 1, '2016-04-14', '2016-04-14', 'jirafa'),
(15, '15        ', '15        ', 'PLASTICOS                          ', 1, '2016-04-14', '2016-04-14', 'plasticos'),
(16, '16        ', '16        ', 'NESTLE                             ', 1, '2016-04-14', '2016-04-14', 'nestle'),
(17, '17        ', '17        ', 'TROPICAL DEGIL                     ', 1, '2016-04-14', '2016-04-14', 'tropical-degil'),
(18, '18        ', '18        ', 'SUMINISTROS INTEGRALES             ', 1, '2016-04-14', '2016-04-14', 'suministros-integrales'),
(19, '19        ', '19        ', 'VELAS                              ', 1, '2016-04-14', '2016-04-14', 'velas'),
(20, '20        ', '20        ', 'MULTINSA                           ', 1, '2016-04-14', '2016-04-14', 'multinsa'),
(21, '21        ', '21        ', 'FAMILIA                            ', 1, '2016-04-14', '2016-04-14', 'familia'),
(22, '22        ', '22        ', 'ALDOR                              ', 1, '2016-04-14', '2016-04-14', 'aldor'),
(23, '23        ', '23        ', 'POSTOBON                           ', 1, '2016-04-14', '2016-04-14', 'postobon'),
(24, '24        ', '24        ', 'PROCTER & GAMBLE                   ', 1, '2016-04-14', '2016-04-14', 'procter-gamble'),
(25, '25        ', '25        ', 'BIG COLA                           ', 1, '2016-04-14', '2016-04-14', 'big-cola'),
(26, '26        ', '26        ', 'AMARRES                            ', 1, '2016-04-14', '2016-04-14', 'amarres'),
(27, '27        ', '27        ', 'ELECTRODOMESTICOS Y HOGAR          ', 1, '2016-04-14', '2016-04-14', 'electrodomesticos-y-hogar'),
(28, '28        ', '28        ', 'JUGUETERIA                         ', 1, '2016-04-14', '2016-04-14', 'jugueteria'),
(29, '29        ', '29        ', 'CUIDADO CORPORAL                   ', 1, '2016-04-14', '2016-04-14', 'cuidado-corporal'),
(30, '30        ', '30        ', 'SOMBRAS PARA OJOS                  ', 1, '2016-04-14', '2016-04-14', 'sombras-para-ojos');

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
  `mantis_img` int(1) NOT NULL,
  `precio` decimal(17,5) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  `por_iva` int(2) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `dt` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=52 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `ArtSec`, `id_mantis`, `pro_nom`, `categoria_id`, `descripcion`, `slug`, `img`, `mantis_img`, `precio`, `Estado`, `por_iva`, `cantidad`, `dt`, `created_at`, `updated_at`) VALUES
(1, '10001               ', '924800', 'Celular samsung', '675             ', 'CELULAR SAMSUNG GALAXY J7 16GB 4 G DORADO\r\ny cinco megapixeles de cámara frontal, pantalla de cinco pulgadas y resolución Hd, obteniendo vídeos de calidad.\r\n\r\nEs uno de los dispositivos con mayor ahorro de energía, cuenta con un sistema de ahorro de energía que se encuentra en la sección de ajustes, en la opción modo ultra ahorro de energía, en el caso que no hayas podido cargar el celular. La batería es extraíble con una capacidad de 3000 y conectividad de 4G. Samsung cuenta con 1.5 de memoria ram.\r\n\r\nAcabado en plástico, ultra delgado de 7.9 milímetros.', 'celular-samsung', 'http://somic.com.co:8081/MantisWeb20mantis2016/PublicTempStorage/multimedia/samsung_galaxy_coreprime_bla_k1501064077008B_160145486_71c92c206a244f2dad9362fdf66b22ab.jpg', 0, '14310.00000', 1, 16, 123, 1045396076, '2016-06-29', '2016-07-29'),
(2, '10062', '090281', 'LISTON 8 * 5 * 1.5 MTS INMUNIZADO', '638             ', '', 'liston-8-5-15-mts-inmunizado', 'img/Mantis/def.png', 0, '15650.00000', 1, 0, 6, 0, '2016-06-29', '2016-07-29'),
(3, '10063', '062934', 'BOMBILLO PANEL LED 3W 6400K', '782', '', 'bombillo-panel-led-3w-6400k', 'img/Mantis/def.png', 0, '9137.00000', 1, 16, 165, 0, '2016-06-29', '2016-07-29'),
(4, '10065', '062936', 'BOMBILLO PANEL LED REDONDO 12W 6400K', '782', '', 'bombillo-panel-led-redondo-12w-6400k', 'img/Mantis/def.png', 0, '21939.00000', 1, 16, 112, 0, '2016-06-29', '2016-07-29'),
(5, '10066', '043706', 'PARED CERITALIA 25*35 ASCOLI BLANCO METRO 1RA', '036             ', '', 'pared-ceritalia-2535-ascoli-blanco-metro-1ra', 'img/Mantis/def.png', 0, '13706.00000', 1, 16, 36, 0, '2016-06-29', '2016-07-29'),
(6, '10068', '111571', 'LAVAMANOS CANCUN BLANCO', '398             ', '', 'lavamanos-cancun-blanco', 'img/Mantis/def.png', 0, '42077.00000', 1, 16, 1, 0, '2016-06-29', '2016-07-29'),
(7, '10064', '062935', 'BOMBILLO PANEL LED 6W 6400K', '782', '', 'bombillo-panel-led-6w-6400k', 'img/Mantis/def.png', 0, '13663.00000', 1, 16, 183, 0, '2016-06-29', '2016-07-29'),
(8, '10067', '411271', 'GRIFERIA LAVAMANOS CANCUN', '484             ', '', 'griferia-lavamanos-cancun', 'img/Mantis/def.png', 0, '26508.00000', 1, 16, 1, 0, '2016-06-29', '2016-07-29'),
(9, '10072', '043708', 'PISO AVANTI PARKET AMADOR 45*45 METRO SDA', '037             ', '', 'piso-avanti-parket-amador-4545-metro-sda', 'img/Mantis/def.png', 0, '13577.00000', 1, 16, 0, 0, '2016-06-29', '2016-07-29'),
(10, '10070', '829725', 'JUEGO INCRUSTACIONES 4 PIEZAS ITALIA', '654             ', '', 'juego-incrustaciones-4-piezas-italia', 'img/Mantis/def.png', 0, '27586.00000', 1, 16, 1, 0, '2016-06-29', '2016-07-29'),
(11, '10074', '027821', 'MASILLA TERINSA PARA MADERA ROJA GALON', '110             ', '', 'masilla-terinsa-para-madera-roja-galon', 'img/Mantis/def.png', 0, '42258.00000', 1, 16, 2, 0, '2016-06-29', '2016-07-29'),
(12, '10073', '101902', 'TEJA TERMOACO ADRI AZUL 2DA 3MTS AJOVER', '261', '', 'teja-termoaco-adri-azul-2da-3mts-ajover', 'img/Mantis/def.png', 0, '41379.00000', 1, 16, 3415, 0, '2016-06-29', '2016-07-29'),
(13, '10075', '043709', 'PARED ROCA 28*45 METRO 2DA', '036             ', '', 'pared-roca-2845-metro-2da', 'img/Mantis/def.png', 0, '17241.00000', 1, 16, 71.63, 0, '2016-06-29', '2016-07-29'),
(14, '10076', '043710', 'PISO DIAMANTE PERLADO MARFIL 60*60  METRO 2DA', '037', '', 'piso-diamante-perlado-marfil-6060-metro-2da', 'img/Mantis/def.png', 0, '15862.00000', 1, 16, 112.32, 1045320977, '2016-06-29', '2016-07-29'),
(15, '10078', '101903', 'ARENA GRAVADA METRO', '231             ', '', 'arena-gravada-metro', 'img/Mantis/def.png', 0, '56034.00000', 1, 16, 0, 1045309639, '2016-06-29', '2016-07-29'),
(16, '10077', '191695', 'FLEJE 13CM * 15CM EN 1/4 UNIDAD', '232             ', '', 'fleje-13cm-15cm-en-14-unidad', 'img/Mantis/def.png', 0, '732.00000', 1, 16, 0, 1045245217, '2016-06-29', '2016-07-29'),
(17, '10071', '043707', 'PISO AVANTI MONZA BEIGE 45*45 METRO SDA', '037             ', '', 'piso-avanti-monza-beige-4545-metro-sda', 'img/Mantis/def.png', 0, '13577.00000', 1, 16, 52.78, 1045247729, '2016-06-29', '2016-07-29'),
(18, '10080', '300760', 'GERFOR PRES TAPON MACHO 1"', '117             ', '', 'gerfor-pres-tapon-macho-1', 'img/Mantis/def.png', 0, '689.00000', 1, 16, 14, 0, '2016-06-29', '2016-07-29'),
(19, '10083', '111574', 'FLOTADOR TANQUE ALTO 1/2" GERFOR', '558             ', '', 'flotador-tanque-alto-12-gerfor', 'img/Mantis/def.png', 0, '15086.00000', 1, 16, 6, 0, '2016-06-29', '2016-07-29'),
(20, '10081', '110991', 'LLAVE BOLA ROSCADA PCP 2"', '430             ', '', 'llave-bola-roscada-pcp-2', 'img/Mantis/def.png', 0, '21508.00000', 1, 16, 3, 0, '2016-06-29', '2016-06-29'),
(21, '10082', '111573', 'VALVULA INCORPORACION PCP 1/2"', '117             ', '', 'valvula-incorporacion-pcp-12', 'img/Mantis/def.png', 0, '7301.00000', 1, 16, 18, 0, '2016-06-29', '2016-07-28'),
(22, '10084', '043711', 'PARED AVANTY 28 * 45 LUCCA LILA COMPLEMENTO METRO 2DA', '036             ', '', 'pared-avanty-28-45-lucca-lila-complemento-metro-2da', 'img/Mantis/def.png', 0, '9310.00000', 1, 16, 156, 0, '2016-06-29', '2016-06-29'),
(23, '10087', '340173', 'GERFOR RDE 21 TRAMO 1/2"', '116             ', '', 'gerfor-rde-21-tramo-12', 'img/Mantis/def.png', 0, '3534.00000', 1, 16, 601, 1045283908, '2016-06-29', '2016-07-28'),
(24, '10079', '300759', 'GERFOR PRES TAPON MACHO 1/2"', '117             ', '', 'gerfor-pres-tapon-macho-12', 'img/Mantis/def.png', 0, '215.00000', 1, 16, 75, 0, '2016-06-29', '2016-07-28'),
(25, '10069', '111572', 'PEDESTAL CANCUN BLANCO', '411             ', '', 'pedestal-cancun-blanco', 'img/Mantis/def.png', 0, '30481.00000', 1, 16, 2, 0, '2016-06-29', '2016-07-28'),
(26, '10086', '043713', 'PISO AVANTI 60*60 DIMANTE MARCHEZA METRO 2DA', '037             ', '', 'piso-avanti-6060-dimante-marcheza-metro-2da', 'img/Mantis/def.png', 0, '16336.00000', 1, 16, 86.4, 0, '2016-06-29', '2016-07-29'),
(27, '10085', '043712', 'PISO AVANTI 31.5 * 31.5 BALTICO VERDE METRO 2DA', '037             ', '', 'piso-avanti-315-315-baltico-verde-metro-2da', 'img/Mantis/def.png', 0, '12456.00000', 1, 16, 88.5, 0, '2016-06-29', '2016-07-29'),
(28, '10088', '034226', 'TEFLON 3/4" * 15 MTS GLOBAL', '546             ', '', 'teflon-34-15-mts-global', 'img/Mantis/def.png', 0, '1724.00000', 1, 16, 61, 1045289894, '2016-06-29', '2016-07-29'),
(29, '10091', '034227', 'CLAVO ACE LISO 4"', '124             ', '', 'clavo-ace-liso-4', 'img/Mantis/def.png', 0, '3275.00000', 1, 16, 0, 0, '2016-06-29', '2016-06-29'),
(30, '10089', '090087', 'PIE ZAPAN 9 * 41/2 * 3 MTS', '646             ', '', 'pie-zapan-9-412-3-mts', 'img/Mantis/def.png', 0, '22500.00000', 1, 0, 0, 0, '2016-06-29', '2016-07-29'),
(31, '10090', '111575', 'GRIFERIA LAVAPL FENIX SENCILLA', '673             ', '', 'griferia-lavapl-fenix-sencilla', 'img/Mantis/def.png', 0, '21379.00000', 1, 16, 10, 0, '2016-06-29', '2016-07-29'),
(32, '10093', '062937', 'FUSIBLE 6 * 30', '323             ', '', 'fusible-6-30', 'img/Mantis/def.png', 0, '129.00000', 1, 16, 20, 0, '2016-06-29', '2016-06-29'),
(33, '10092', '034228', 'GRAPA PUMA 1" * 9 X 800 GR', '125             ', '', 'grapa-puma-1-9-x-800-gr', 'img/Mantis/def.png', 0, '3275.00000', 1, 16, 0, 0, '2016-06-29', '2016-06-29'),
(34, '10094', '062938', 'FUSIBLE 5 * 20', '323             ', '', 'fusible-5-20', 'img/Mantis/def.png', 0, '86.00000', 1, 16, 0, 0, '2016-06-29', '2016-06-29'),
(35, '10096', '021683', 'ESMALTE SAPOLIN AZUL MARINO 1/8', '103             ', '', 'esmalte-sapolin-azul-marino-18', 'img/Mantis/def.png', 0, '7844.00000', 1, 16, 2, 0, '2016-06-29', '2016-07-28'),
(36, '10097', '021684', 'ESMALTE SAPOLIN CAOBA 1/8', '103             ', '', 'esmalte-sapolin-caoba-18', 'img/Mantis/def.png', 0, '7844.00000', 1, 16, 0, 0, '2016-06-29', '2016-06-29'),
(37, '10098', '021685', 'ESMALTE SAPOLIN ROJO FUEGO 1/8', '103             ', '', 'esmalte-sapolin-rojo-fuego-18', 'img/Mantis/def.png', 0, '7844.00000', 1, 16, 2, 0, '2016-06-29', '2016-07-28'),
(38, '10099', '021686', 'ESMALTE SAPOLIN AMARILLO SOL 1/8', '103             ', '', 'esmalte-sapolin-amarillo-sol-18', 'img/Mantis/def.png', 0, '7844.00000', 1, 16, 2, 0, '2016-06-29', '2016-07-28'),
(39, '10100', '021687', 'ESMALTE SAPOLIN NARANJA 1/8', '103             ', '', 'esmalte-sapolin-naranja-18', 'img/Mantis/def.png', 0, '7844.00000', 1, 16, 4, 0, '2016-06-29', '2016-06-29'),
(40, '10095', '021682', 'ESMALTE SAPOLIN BLANCO BRILLANTE 1/8', '103             ', '', 'esmalte-sapolin-blanco-brillante-18', 'img/Mantis/def.png', 0, '7844.00000', 1, 16, 0, 0, '2016-06-29', '2016-07-28'),
(41, '10102', '021689', 'ESMALTE SAPOLIN ROJO FUEGO 1/16', '103             ', '', 'esmalte-sapolin-rojo-fuego-116', 'img/Mantis/def.png', 0, '4913.00000', 1, 16, 1, 0, '2016-06-29', '2016-06-29'),
(42, '10101', '021688', 'ESMALTE SAPOLIN CAOBA 1/16', '103             ', '', 'esmalte-sapolin-caoba-116', 'img/Mantis/def.png', 0, '4913.00000', 1, 16, 2, 0, '2016-06-29', '2016-07-28'),
(43, '10103', '021690', 'ESMALTE SAPOLIN ALUMINIO 1/16', '103             ', '', 'esmalte-sapolin-aluminio-116', 'img/Mantis/def.png', 0, '4913.00000', 1, 16, 4, 0, '2016-06-29', '2016-07-29'),
(44, '10105', '021692', 'ESMALTE SAPOLIN NARANJA 1/16', '103             ', '', 'esmalte-sapolin-naranja-116', 'img/Mantis/def.png', 0, '4913.00000', 1, 16, 1, 0, '2016-06-29', '2016-06-29'),
(45, '10106', '021693', 'ESMALTE SAPOLIN VERDE ESMERALDA 1/16', '103             ', '', 'esmalte-sapolin-verde-esmeralda-116', 'img/Mantis/def.png', 0, '4913.00000', 1, 16, 3, 0, '2016-06-29', '2016-07-29'),
(46, '10107', '021694', 'ESMALTE SAPOLIN AMARILLO SOL 1/16', '103             ', '', 'esmalte-sapolin-amarillo-sol-116', 'img/Mantis/def.png', 0, '4913.00000', 1, 16, 6, 0, '2016-06-29', '2016-06-29'),
(47, '10108', '021695', 'ESMALTE SAPOLIN CAOBA 1/32', '103             ', '', 'esmalte-sapolin-caoba-132', 'img/Mantis/def.png', 0, '2931.00000', 1, 16, 6, 0, '2016-06-29', '2016-07-28'),
(48, '10110', '021697', 'ESMALTE SAPOLIN ANOLOC 1/32', '103             ', '', 'esmalte-sapolin-anoloc-132', 'img/Mantis/def.png', 0, '3879.00000', 1, 16, 4, 0, '2016-06-29', '2016-06-29'),
(49, '10109', '021696', 'ESMALTE SAPOLIN ALUMINIO 1/32', '103             ', '', 'esmalte-sapolin-aluminio-132', 'img/Mantis/def.png', 0, '3879.00000', 1, 16, 3, 0, '2016-06-29', '2016-06-29'),
(50, '10111', '021698', 'ESMALTE SAPOLIN VERDE ESMERALDA 1/32', '103             ', '', 'esmalte-sapolin-verde-esmeralda-132', 'img/Mantis/def.png', 0, '2931.00000', 1, 16, 5, 0, '2016-06-29', '2016-06-29'),
(51, '10104', '021691', 'ESMALTE SAPOLIN AZUL MAR 1/16', '103             ', '', 'esmalte-sapolin-azul-mar-116', 'img/Mantis/def.png', 0, '4913.00000', 1, 16, 4, 0, '2016-06-29', '2016-06-29');

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
('pase por aqui VERSION 4 recargada');

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

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`id`, `TipPagNom`, `created_at`, `updated_at`) VALUES
(1, 'Contado', '0000-00-00', '0000-00-00'),
(2, 'Cupo Cliente', '0000-00-00', '0000-00-00'),
(70, 'admin@admin.com', '2016-02-18', '2016-02-18'),
(71, '', '2016-02-18', '2016-02-18'),
(72, '', '2016-02-19', '2016-02-19'),
(73, 'admin@admin.com', '2016-02-19', '2016-02-19'),
(74, '', '2016-02-19', '2016-02-19'),
(75, 'kajaja', '2016-02-19', '2016-02-19'),
(76, 'admin@admin.com', '2016-02-19', '2016-02-19'),
(77, '', '2016-02-19', '2016-02-19'),
(78, 'd', '2016-02-19', '2016-02-19'),
(79, 'admin@admin.com', '2016-02-19', '2016-02-19'),
(80, '', '2016-02-19', '2016-02-19'),
(81, 'admin@admin.com', '2016-02-19', '2016-02-19'),
(82, 'admin@admin.com', '2016-02-19', '2016-02-19'),
(83, '', '2016-02-19', '2016-02-19'),
(84, 'admin@admin.com', '2016-02-19', '2016-02-19'),
(85, '', '2016-02-19', '2016-02-19'),
(86, 'admin@admin.com', '2016-02-19', '2016-02-19'),
(87, '', '2016-02-19', '2016-02-19'),
(88, '', '2016-02-19', '2016-02-19'),
(89, 'ederalvarez2091057@gmail.com', '2016-02-19', '2016-02-19'),
(90, 'admin@admin.com', '2016-02-19', '2016-02-19'),
(91, '', '2016-02-19', '2016-02-19'),
(92, '', '2016-02-19', '2016-02-19'),
(93, '', '2016-02-19', '2016-02-19'),
(94, '', '2016-02-21', '2016-02-21'),
(95, '', '2016-02-21', '2016-02-21'),
(96, '', '2016-02-21', '2016-02-21'),
(97, '', '2016-02-21', '2016-02-21'),
(98, '', '2016-02-21', '2016-02-21'),
(99, 'jjbbbb', '2016-02-21', '2016-02-21'),
(100, 'jjbbbb', '2016-02-21', '2016-02-21'),
(101, 'jjbbbb', '2016-02-21', '2016-02-21'),
(102, 'jjbbbb', '2016-02-21', '2016-02-21'),
(103, 'jjbbbb', '2016-02-21', '2016-02-21'),
(104, 'jjbbbb', '2016-02-21', '2016-02-21'),
(105, 'jjbbbb', '2016-02-21', '2016-02-21'),
(106, 'jjbbbb', '2016-02-21', '2016-02-21');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `NitSec`, `email`, `CliCup`, `password`, `remember_token`, `remember_pass`, `active`, `condiciones`, `admin`, `created_at`, `updated_at`) VALUES
(3, '123431', 'admin@admin.com', NULL, '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', 'iRXSPjNhcxoZYUXwV0TyDG6ZWuehrHlZKYZZDbfYFjha2Q5LRKJNcqGHDsBc', '', 1, 1, 1, '0000-00-00', '2016-06-29'),
(28, '1102365683', 'ederalvarez2091057@gmail.com', NULL, '$2y$10$g3QreIXuJFhrkE8DxTRds.FT81yDnOlpwUNSEOO.7sV.ZnVGwJ9xC', 'l3n8eK2x2c820D6CM9yFZEp5XX5POAawk3tBX8VdK6NG4mYGz62vCV7LgbF5', '', 1, 1, 0, '2016-01-22', '2016-06-29'),
(30, '1102365685', 'ederalvarez2009@hotmail.com', NULL, '$2y$10$venQExu/OBwh1mS8hLXwoeZUR/222yFY6gK9yo/oBOQRR3YUXwWQq', '', '', 1, 1, 0, '2016-03-06', '2016-03-06'),
(31, '100200300', 'demi1057@gmail.com', NULL, '$2y$10$/mh20RInNerB8H5ezecs.uV/oPgJ5xz.j6aYShmO95oJZAcdpFdt6', '', '', 1, 1, 0, '2016-03-19', '2016-03-19'),
(32, '100200301', 'ivan.rojas.sis@gmail.com', NULL, '$2y$10$iG8q4jkWXaF0K7BzgRA9XuxfrlNSZF9QXOlnBAogw4qgsQ00vY/vW', '', '', 1, 1, 0, '2016-03-19', '2016-03-19'),
(33, '63443106', 'soni325@hotmail.com', NULL, '$2y$10$St8ALxP/jkvHaDIP5Ti0suLmFO29tpVxF.V1YtXbRwelsT9ODG87C', '', '', 1, 1, 0, '2016-04-01', '2016-04-01'),
(34, '1098693118', 'cvcarlosandres39@gmail.com', NULL, '$2y$10$CtTHu9jqPPWGg38CkBNze.bXrzH7keXc0PvQpxC8.htZOfEtDUMxq', '', '', 1, 1, 0, '2016-04-01', '2016-04-01'),
(35, '13444789', 'joseluis@somic.com.co', NULL, '$2y$10$6CjendsX3fksRBPJqphlqexhvaytPAMh2bW.cB6m4KZ4B/mHHMBye', '', '', 1, 1, 0, '2016-04-01', '2016-04-01'),
(36, '1002003001', 'cesar@hotmail.com', NULL, '$2y$10$osbja5Z.86yU4A4LWzfiOuV0Pyua.BdioQXCVmx5VlDgwwY0BZktq', '6wSKYWo6ET9d4OEzjoUGeukWkiARa4ibOMWmhuLD0FY3iIQksUG8rTrxivjt', '', 1, 1, 0, '2016-04-09', '2016-04-09'),
(37, '1002003002', 'ymora@hotmail.com', NULL, '$2y$10$pJZEyA3dzMjs9W/s7LVmhO.K95NQ3vFfnVsakrXItL9iU/HA1xlVu', '', '', 1, 1, 0, '2016-04-09', '2016-04-09');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `user_datos`
--

INSERT INTO `user_datos` (`id`, `user_id`, `barrio_id`, `nombre`, `apellido`, `cedula`, `nombre_negocio`, `ciudad`, `canal`, `direccion`, `telefono`, `comentarios`, `created_at`, `updated_at`) VALUES
(24, 28, 1, 'Edere', 'Alvarez', '1102365683', NULL, 1, 0, 'calle 20 # 24-27', '3013119199', NULL, '2016-01-22', '2016-03-19'),
(25, 3, 1, 'Admin', 'Pag', '13456543', 'lov', 1, 0, 'calle 39 # 20-39 piso e', '3013119198', 'lkwnlkwn', '2016-02-09', '2016-02-09'),
(27, 30, 1, 'Eder', 'Julian', '1102365685', 'DEFAULT', 1, 0, 'calle 17 #3w-65 miraflores torre 36 apto 11-30', '3013119198', 'Sin comentarios', '2016-03-06', '2016-03-06'),
(28, 31, 1, 'demi', 'lovato', '100200300', 'DEFAULT', 1, 0, 'cll 20', '3013119191', 'Sin comentarios', '2016-03-19', '2016-03-19'),
(29, 32, 1, 'ivan', 'rojas', '100200301', 'DEFAULT', 1, 0, NULL, '3098765454', 'Sin comentarios', '2016-03-19', '2016-03-19'),
(30, 33, 1, 'Sonia', 'Saenz', '63443106', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-04-01', '2016-04-01'),
(31, 34, 1, 'Carlos', 'Vaderrama', '1098693118', 'DEFAULT', 1, 0, NULL, '3008923070', 'Sin comentarios', '2016-04-01', '2016-04-01'),
(32, 35, 1, 'Jose luis', 'Rojas', '13444789', 'DEFAULT', 1, 0, NULL, '3009898234', 'Sin comentarios', '2016-04-01', '2016-04-01'),
(33, 36, 1, 'cesar', 'Castro', '1002003001', 'DEFAULT', 1, 0, NULL, '30002003001', 'Sin comentarios', '2016-04-09', '2016-04-09'),
(34, 37, 1, 'Yesid', 'mora', '1002003002', 'DEFAULT', 1, 0, NULL, '3013119198', 'Sin comentarios', '2016-04-09', '2016-04-09');

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
