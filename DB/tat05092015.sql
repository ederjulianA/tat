-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2015 a las 16:54:39
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
  `InvGruCod` int(20) DEFAULT NULL,
  `cat_nom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `cat_slug` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `InvSubGruId` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `InvSubGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=188 ;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `InvGruCod`, `cat_nom`, `cat_slug`, `img`, `created_at`, `updated_at`, `InvSubGruId`, `InvSubGruCod`) VALUES
(84, 6, 'TUBOS ELECTRICOS                                            ', 'tubos-electricos', '', '2015-09-04', '2015-09-04', '006-027         ', '027             '),
(85, 6, 'ACCESORIOS T.V.                                             ', 'accesorios-tv', '', '2015-09-04', '2015-09-04', '006-028         ', '028             '),
(86, 7, 'ACCESORIOS GALVANIZADOS                                     ', 'accesorios-galvanizados', '', '2015-09-04', '2015-09-04', '007-029         ', '029             '),
(87, 7, 'TUBERIA GALVANIZADA                                         ', 'tuberia-galvanizada', '', '2015-09-04', '2015-09-04', '007-030         ', '030             '),
(88, 7, 'PEGANTES PARA GALVANIZADO                                   ', 'pegantes-para-galvanizado', '', '2015-09-04', '2015-09-04', '007-031         ', '031             '),
(89, 2, 'PINTUCO                                                     ', 'pintuco', '', '2015-09-04', '2015-09-04', '002-032         ', '032             '),
(90, 2, 'PINTULAND                                                   ', 'pintuland', '', '2015-09-04', '2015-09-04', '002-033         ', '033             '),
(91, 2, 'SIKA                                                        ', 'sika', '', '2015-09-04', '2015-09-04', '002-034         ', '034             '),
(92, 2, 'COMPLEMENTO PINTURA                                         ', 'complemento-pintura', '', '2015-09-04', '2015-09-04', '002-035         ', '035             '),
(93, 10, 'MATERIALES OBRA GRIS                                        ', 'materiales-obra-gris', '', '2015-09-04', '2015-09-04', '010-036         ', '036             '),
(94, 10, 'GRES                                                        ', 'gres', '', '2015-09-04', '2015-09-04', '010-037         ', '037             '),
(95, 10, 'ACCESORIOS TEJA                                             ', 'accesorios-teja', '', '2015-09-04', '2015-09-04', '010-038         ', '038             '),
(96, 10, 'TEJAS                                                       ', 'tejas', '', '2015-09-04', '2015-09-04', '010-039         ', '039             '),
(97, 10, 'MALLAS                                                      ', 'mallas', '', '2015-09-04', '2015-09-04', '010-040         ', '040             '),
(98, 10, 'PRODUCTOS QUIMICOS                                          ', 'productos-quimicos', '', '2015-09-04', '2015-09-04', '010-041         ', '041             '),
(99, 10, 'ORNAMENTACION                                               ', 'ornamentacion', '', '2015-09-04', '2015-09-04', '010-042         ', '042             '),
(100, 10, 'ACABADOS                                                    ', 'acabados', '', '2015-09-04', '2015-09-04', '010-043         ', '043             '),
(101, 8, 'PAVCO                                                       ', 'pavco', '', '2015-09-04', '2015-09-04', '008-044         ', '044             '),
(102, 8, 'GERFOR                                                      ', 'gerfor', '', '2015-09-04', '2015-09-04', '008-045         ', '045             '),
(103, 9, 'LISTONES                                                    ', 'listones', '', '2015-09-04', '2015-09-04', '009-046         ', '046             '),
(104, 9, 'TABLAS                                                      ', 'tablas', '', '2015-09-04', '2015-09-04', '009-047         ', '047             '),
(105, 9, 'CANABRAVA                                                   ', 'canabrava', '', '2015-09-04', '2015-09-04', '009-048         ', '048             '),
(106, 9, 'MACHIMBRE                                                   ', 'machimbre', '', '2015-09-04', '2015-09-04', '009-049         ', '049             '),
(107, 9, 'ESTACONES                                                   ', 'estacones', '', '2015-09-04', '2015-09-04', '009-050         ', '050             '),
(108, 9, 'SOLERAS                                                     ', 'soleras', '', '2015-09-04', '2015-09-04', '009-051         ', '051             '),
(109, 9, 'SERCOS                                                      ', 'sercos', '', '2015-09-04', '2015-09-04', '009-052         ', '052             '),
(110, 9, 'VIGAS                                                       ', 'vigas', '', '2015-09-04', '2015-09-04', '009-053         ', '053             '),
(111, 9, 'VARAS                                                       ', 'varas', '', '2015-09-04', '2015-09-04', '009-054         ', '054             '),
(112, 9, 'DILATACIONES                                                ', 'dilataciones', '', '2015-09-04', '2015-09-04', '009-055         ', '055             '),
(113, 1, 'DISCOS                                                      ', 'discos', '', '2015-09-04', '2015-09-04', '001-056         ', '056             '),
(114, 1, 'REPUESTOS HERRAMIENTAS                                      ', 'repuestos-herramientas', '', '2015-09-04', '2015-09-04', '001-057         ', '057             '),
(115, 1, 'HERRAMIENTAS TIPO LIVIANA                                   ', 'herramientas-tipo-liviana', '', '2015-09-04', '2015-09-04', '001-058         ', '058             '),
(116, 1, 'MANGUERAS                                                   ', 'mangueras', '', '2015-09-04', '2015-09-04', '001-059         ', '059             '),
(117, 11, 'COMBOS                                                      ', 'combos', '', '2015-09-04', '2015-09-04', '011-060         ', '060             '),
(118, 11, 'SANITARIOS                                                  ', 'sanitarios', '', '2015-09-04', '2015-09-04', '011-061         ', '061             '),
(119, 11, 'LAVAMANOS                                                   ', 'lavamanos', '', '2015-09-04', '2015-09-04', '011-062         ', '062             '),
(120, 11, 'TANQUES TAPAS Y TAZAS                                       ', 'tanques-tapas-y-tazas', '', '2015-09-04', '2015-09-04', '011-063         ', '063             '),
(121, 11, 'PEDESTAL                                                    ', 'pedestal', '', '2015-09-04', '2015-09-04', '011-064         ', '064             '),
(122, 11, 'REJILLAS                                                    ', 'rejillas', '', '2015-09-04', '2015-09-04', '011-065         ', '065             '),
(123, 11, 'LLAVE BOLA                                                  ', 'llave-bola', '', '2015-09-04', '2015-09-04', '011-066         ', '066             '),
(124, 11, 'VALVULAS                                                    ', 'valvulas', '', '2015-09-04', '2015-09-04', '011-067         ', '067             '),
(125, 11, 'UNIVERSAL                                                   ', 'universal', '', '2015-09-04', '2015-09-04', '011-068         ', '068             '),
(126, 11, 'ACCESORIOS SANITARIOS                                       ', 'accesorios-sanitarios', '', '2015-09-04', '2015-09-04', '011-069         ', '069             '),
(127, 11, 'EMPAQUES                                                    ', 'empaques', '', '2015-09-04', '2015-09-04', '011-070         ', '070             '),
(128, 11, 'LAVAPLATOS                                                  ', 'lavaplatos', '', '2015-09-04', '2015-09-04', '011-071         ', '071             '),
(129, 11, 'LAVADEROS                                                   ', 'lavaderos', '', '2015-09-04', '2015-09-04', '011-072         ', '072             '),
(130, 11, 'JUEGO INCRUSTACIONES                                        ', 'juego-incrustaciones', '', '2015-09-04', '2015-09-04', '011-073         ', '073             '),
(131, 11, 'ACCESORIOS BRONCE                                           ', 'accesorios-bronce', '', '2015-09-04', '2015-09-04', '011-074         ', '074             '),
(132, 11, 'ACCESORIOS LAVAPLATOS GRIVAL                                ', 'accesorios-lavaplatos-grival', '', '2015-09-04', '2015-09-04', '011-075         ', '075             '),
(133, 11, 'ACCESORIOS LAVAMANOS GRIVAL                                 ', 'accesorios-lavamanos-grival', '', '2015-09-04', '2015-09-04', '011-076         ', '076             '),
(134, 11, 'DUCHAS GRIVAL                                               ', 'duchas-grival', '', '2015-09-04', '2015-09-04', '011-077         ', '077             '),
(135, 11, 'ACCESORIOS SANITARIOS GRIVAL                                ', 'accesorios-sanitarios-grival', '', '2015-09-04', '2015-09-04', '011-078         ', '078             '),
(136, 11, 'REPUESTOS GRIVAL                                            ', 'repuestos-grival', '', '2015-09-04', '2015-09-04', '011-079         ', '079             '),
(137, 11, 'LLAVES TERMINAL PASO PALANCA                                ', 'llaves-terminal-paso-palanca', '', '2015-09-04', '2015-09-04', '011-080         ', '080             '),
(138, 11, 'GRIFOS Y PARTES                                             ', 'grifos-y-partes', '', '2015-09-04', '2015-09-04', '011-081         ', '081             '),
(139, 11, 'INCRUSTACIONES INDIVIDUALES                                 ', 'incrustaciones-individuales', '', '2015-09-04', '2015-09-04', '011-082         ', '082             '),
(140, 12, 'MERCANCIA CONSIGNACION                                      ', 'mercancia-consignacion', '', '2015-09-04', '2015-09-04', '012-083         ', '083             '),
(141, 11, 'COMPLEMENTARIOS GRIVAL                                      ', 'complementarios-grival', '', '2015-09-04', '2015-09-04', '011-084         ', '084             '),
(142, 2, 'GRANIPLAS                                                   ', 'graniplas', '', '2015-09-04', '2015-09-04', '002-085         ', '085             '),
(143, 10, 'MATERIALES EXCENTOS                                         ', 'materiales-excentos', '', '2015-09-04', '2015-09-04', '010-086         ', '086             '),
(144, 14, 'ROSCAS                                                      ', 'roscas', '', '2015-09-04', '2015-09-04', '014-087         ', '087             '),
(145, 1, 'HERRAMIENTAS EXENTAS                                        ', 'herramientas-exentas', '', '2015-09-04', '2015-09-04', '001-088         ', '088             '),
(146, 2, 'SIKA EXENTO                                                 ', 'sika-exento', '', '2015-09-04', '2015-09-04', '002-089         ', '089             '),
(147, 4, 'CONSTRUCCIONES                                              ', 'construcciones', '', '2015-09-04', '2015-09-04', '004-090         ', '090             '),
(148, 3, 'ELECTRODOMESTICOS                                           ', 'electrodomesticos', '', '2015-09-04', '2015-09-04', '003-091         ', '091             '),
(149, 9, 'LAMINAS                                                     ', 'laminas', '', '2015-09-04', '2015-09-04', '009-092         ', '092             '),
(150, 10, 'GRES IVA                                                    ', 'gres-iva', '', '2015-09-04', '2015-09-04', '010-093         ', '093             '),
(151, 11, 'GRIVAL                                                      ', 'grival', '', '2015-09-04', '2015-09-04', '011-094         ', '094             '),
(152, 13, 'CEMENTO PENDIENTE                                           ', 'cemento-pendiente', '', '2015-09-04', '2015-09-04', '013-095         ', '095             '),
(153, 8, 'CELTA                                                       ', 'celta', '', '2015-09-04', '2015-09-04', '008-096         ', '096             '),
(154, 14, 'ALQUILER                                                    ', 'alquiler', '', '2015-09-04', '2015-09-04', '014-097         ', '097             '),
(155, 2, 'VINIFLEX                                                    ', 'viniflex', '', '2015-09-04', '2015-09-04', '002-098         ', '098             '),
(156, 1, 'HERRAMIENTAS IVA 5%                                         ', 'herramientas-iva-5', '', '2015-09-04', '2015-09-04', '001-099         ', '099             '),
(157, 15, 'SALDOS INICIALES', 'saldos-iniciales', '', '2015-09-04', '2015-09-04', '999-999', '100'),
(158, 17, 'ACCESORIOS POLIETILENO', 'accesorios-polietileno', '', '2015-09-04', '2015-09-04', '058-035', '101'),
(159, 12, 'TRANSPORTE', 'transporte', '', '2015-09-04', '2015-09-04', '012-01', '102'),
(160, 18, 'LAVAMOS Y ESPEJO', 'lavamos-y-espejo', '', '2015-09-04', '2015-09-04', '022-058', '103'),
(161, 10, 'SISTEMA SEPTICO', 'sistema-septico', '', '2015-09-04', '2015-09-04', '010-058', '104'),
(162, 11, 'SANITARIOS', 'sanitarios', '', '2015-09-04', '2015-09-04', '011-2015', '105'),
(163, 1, 'TORNILLERIA                                                 ', 'tornilleria', '', '2015-09-04', '2015-09-04', '001-001         ', '001             '),
(164, 1, 'HERRAMIENTAS PESADAS                                        ', 'herramientas-pesadas', '', '2015-09-04', '2015-09-04', '001-003         ', '003             '),
(165, 3, 'ACCESORIOS CORTINA                                          ', 'accesorios-cortina', '', '2015-09-04', '2015-09-04', '003-004         ', '004             '),
(166, 3, 'SOGA Y PITAS                                                ', 'soga-y-pitas', '', '2015-09-04', '2015-09-04', '003-005         ', '005             '),
(167, 3, 'PEGANTES VARIOS                                             ', 'pegantes-varios', '', '2015-09-04', '2015-09-04', '003-006         ', '006             '),
(168, 3, 'REPUESTOS VARIOS                                            ', 'repuestos-varios', '', '2015-09-04', '2015-09-04', '003-007         ', '007             '),
(169, 4, 'ALFAGRES                                                    ', 'alfagres', '', '2015-09-04', '2015-09-04', '004-008         ', '008             '),
(170, 4, 'EUROCASA                                                    ', 'eurocasa', '', '2015-09-04', '2015-09-04', '004-009         ', '009             '),
(171, 4, 'CERAMICA ITALIA', 'ceramica-italia', '', '2015-09-04', '2015-09-04', '004-010', '010             '),
(172, 4, 'INTERMATEX                                                  ', 'intermatex', '', '2015-09-04', '2015-09-04', '004-011         ', '011             '),
(173, 4, 'DIPROSERCO                                                  ', 'diproserco', '', '2015-09-04', '2015-09-04', '004-012         ', '012             '),
(174, 4, 'E&D SOLUCIONES                                              ', 'ed-soluciones', '', '2015-09-04', '2015-09-04', '004-013         ', '013             '),
(175, 4, 'PEGANTES CERAMICA                                           ', 'pegantes-ceramica', '', '2015-09-04', '2015-09-04', '004-014         ', '014             '),
(176, 5, 'CANDADOS                                                    ', 'candados', '', '2015-09-04', '2015-09-04', '005-015         ', '015             '),
(177, 5, 'MANIJAS Y ESCUDOS                                           ', 'manijas-y-escudos', '', '2015-09-04', '2015-09-04', '005-016         ', '016             '),
(178, 5, 'PORTACANDADOS                                               ', 'portacandados', '', '2015-09-04', '2015-09-04', '005-017         ', '017             '),
(179, 5, 'CHAPAS                                                      ', 'chapas', '', '2015-09-04', '2015-09-04', '005-018         ', '018             '),
(180, 5, 'ACCESORIOS PUERTA                                           ', 'accesorios-puerta', '', '2015-09-04', '2015-09-04', '005-019         ', '019             '),
(181, 6, 'ALAMBRES                                                    ', 'alambres', '', '2015-09-04', '2015-09-04', '006-020         ', '020             '),
(182, 6, 'ACCESORIOS ELECTRICOS                                       ', 'accesorios-electricos', '', '2015-09-04', '2015-09-04', '006-021         ', '021             '),
(183, 6, 'LAMPARAS                                                    ', 'lamparas', '', '2015-09-04', '2015-09-04', '006-022         ', '022             '),
(184, 6, 'BOMBILLOS                                                   ', 'bombillos', '', '2015-09-04', '2015-09-04', '006-023         ', '023             '),
(185, 6, 'EXTENSIONES                                                 ', 'extensiones', '', '2015-09-04', '2015-09-04', '006-024         ', '024             '),
(186, 6, 'CAJAS Y TACOS                                               ', 'cajas-y-tacos', '', '2015-09-04', '2015-09-04', '006-025         ', '025             '),
(187, 6, 'TOMAS INTERRUPTORES                                         ', 'tomas-interruptores', '', '2015-09-04', '2015-09-04', '006-026         ', '026             ');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=60 ;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `user_id`, `totalCart`, `total_compra`, `num_items`, `tipo_compra`, `vlr_envio`, `estado_id`, `conf`, `created_at`, `updated_at`) VALUES
(56, 22, 2788895, 2793895, 110, 2, 5000, 3, 1, '2015-09-04', '2015-09-04'),
(57, 3, 883949, 888949, 8, 2, 5000, 3, 1, '2015-09-04', '2015-09-04'),
(58, 22, 2199193, 2204192, 8, 2, 5000, 1, 0, '2015-09-04', '2015-09-04'),
(59, 22, 2199193, 2204192, 8, 2, 5000, 1, 0, '2015-09-04', '2015-09-04');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=175 ;

--
-- Volcado de datos para la tabla `compra_items`
--

INSERT INTO `compra_items` (`id`, `compra_id`, `nombre`, `image`, `valor_unitario`, `iva`, `cantidad`, `valor_total`, `id_producto`, `created_at`, `updated_at`) VALUES
(169, 56, 'MUEBLE BORGONA PARA LAVAMANOS ROBLE CLARO REF 00027', 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/tenedor_c430c004f17e474caf0eaa376b31c6cc.jpg', 236982, 16, 10, 2748991, 269, '2015-09-04', '2015-09-04'),
(170, 56, 'ANCLAJE METALICO 5/16 * 1.1/2                                                                       ', 'http://localhost:8000/img/Mantis/def.png', 344, 16, 100, 39904, 272, '2015-09-04', '2015-09-04'),
(171, 57, 'LAVAMANOS MONTEAVANTY BLANCO/PEDESTAL/GRIFERIA PRISMA 4                                             ', 'http://localhost:8000/img/Mantis/def.png', 125000, 16, 6, 870000, 334, '2015-09-04', '2015-09-04'),
(172, 57, 'ARGOLLA CORTINA CAFE 3/4"', 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/Copa-Bordeaux_e8103ce6a4674350b3aaf2b149714e32.jpg', 129, 16, 1, 150, 270, '2015-09-04', '2015-09-04'),
(173, 57, 'REGADERA OVAL BLANCO                                                                                ', 'http://localhost:8000/img/Mantis/def.png', 11896, 16, 1, 13799, 273, '2015-09-04', '2015-09-04'),
(174, 58, 'MUEBLE BORGONA PARA LAVAMANOS ROBLE CLARO REF 00027', 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/tenedor_c430c004f17e474caf0eaa376b31c6cc.jpg', 236982, 16, 8, 2199193, 269, '2015-09-04', '2015-09-04');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=788 ;

--
-- Volcado de datos para la tabla `inventariofamilia`
--

INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(61, '001             ', '003             ', '25 * 25 ', '25-25', '004', '2015-09-04', '2015-09-04'),
(62, '002             ', '003-004-002     ', 'GANCHOS CORTINA                                             ', 'ganchos-cortina', '004             ', '2015-09-04', '2015-09-04'),
(63, '003             ', '003-004-003     ', 'MARGARITAS                                                  ', 'margaritas', '004             ', '2015-09-04', '2015-09-04'),
(64, '004             ', '003-004-004     ', 'SOPORTE CORTINA                                             ', 'soporte-cortina', '004             ', '2015-09-04', '2015-09-04'),
(65, '005             ', '003-004-005     ', 'TERMINAL CORTINA                                            ', 'terminal-cortina', '004             ', '2015-09-04', '2015-09-04'),
(66, '006             ', '003-004-006     ', 'TUBO CORTINA                                                ', 'tubo-cortina', '004             ', '2015-09-04', '2015-09-04'),
(67, '007             ', '003             ', '25 * 25', '25-25', '005', '2015-09-04', '2015-09-04'),
(68, '008             ', '003-005-008     ', 'ATA TODO                                                    ', 'ata-todo', '005             ', '2015-09-04', '2015-09-04'),
(69, '009             ', '003-005-009     ', 'CABLE MATIZADO                                              ', 'cable-matizado', '005             ', '2015-09-04', '2015-09-04'),
(70, '010             ', '003-005-010     ', 'CADENA                                                      ', 'cadena', '005             ', '2015-09-04', '2015-09-04'),
(71, '011             ', '003-005-011     ', 'MADEJA DE PIOLA                                             ', 'madeja-de-piola', '005             ', '2015-09-04', '2015-09-04'),
(72, '012             ', '003-005-012     ', 'MANILA                                                      ', 'manila', '005             ', '2015-09-04', '2015-09-04'),
(73, '013             ', '003-005-013     ', 'MIMBRE                                                      ', 'mimbre', '005             ', '2015-09-04', '2015-09-04'),
(74, '014             ', '003-005-014     ', 'NYLON                                                       ', 'nylon', '005             ', '2015-09-04', '2015-09-04'),
(75, '015             ', '003-005-015     ', 'SOGA MARINO                                                 ', 'soga-marino', '005             ', '2015-09-04', '2015-09-04'),
(76, '016             ', '003-005-016     ', 'SOGA NAUTICA                                                ', 'soga-nautica', '005             ', '2015-09-04', '2015-09-04'),
(77, '017             ', '003-005-017     ', 'SOGA RAFIA                                                  ', 'soga-rafia', '005             ', '2015-09-04', '2015-09-04'),
(78, '018             ', '003-005-018     ', 'TUBITO                                                      ', 'tubito', '005             ', '2015-09-04', '2015-09-04'),
(79, '019             ', '003-006-019     ', 'ADHESIVOS                                                   ', 'adhesivos', '006             ', '2015-09-04', '2015-09-04'),
(80, '020             ', '003-006-020     ', 'COLBON                                                      ', 'colbon', '006             ', '2015-09-04', '2015-09-04'),
(81, '021             ', '003-006-021     ', 'MASILLAS                                                    ', 'masillas', '006             ', '2015-09-04', '2015-09-04'),
(82, '022             ', '003-006-022     ', 'PEGANTE AMARILLO                                            ', 'pegante-amarillo', '006             ', '2015-09-04', '2015-09-04'),
(83, '023             ', '003-006-023     ', 'SINTESOLDA                                                  ', 'sintesolda', '006             ', '2015-09-04', '2015-09-04'),
(84, '024             ', '003-006-024     ', 'SILICONAS                                                   ', 'siliconas', '006             ', '2015-09-04', '2015-09-04'),
(85, '025             ', '003-006-025     ', 'SUPERCRYL                                                   ', 'supercryl', '006             ', '2015-09-04', '2015-09-04'),
(86, '026             ', '003-007-026     ', 'CAUCHOS                                                     ', 'cauchos', '007             ', '2015-09-04', '2015-09-04'),
(87, '027             ', '003-007-027     ', 'CUADRANTES                                                  ', 'cuadrantes', '007             ', '2015-09-04', '2015-09-04'),
(88, '028             ', '003-007-028     ', 'CUCHILLAS                                                   ', 'cuchillas', '007             ', '2015-09-04', '2015-09-04'),
(89, '029             ', '003-007-029     ', 'TAPON OLLA                                                  ', 'tapon-olla', '007             ', '2015-09-04', '2015-09-04'),
(90, '030             ', '004-008-030     ', 'CERAMICA PARED ALFA                                         ', 'ceramica-pared-alfa', '008             ', '2015-09-04', '2015-09-04'),
(91, '031             ', '004-008-031     ', 'CERAMICA PISO ALFA                                          ', 'ceramica-piso-alfa', '008             ', '2015-09-04', '2015-09-04'),
(92, '032             ', '004-008-032     ', 'TACOS ALFA                                                  ', 'tacos-alfa', '008             ', '2015-09-04', '2015-09-04'),
(93, '033             ', '004-009-033     ', 'CERAMICA PARED EURO                                         ', 'ceramica-pared-euro', '009             ', '2015-09-04', '2015-09-04'),
(94, '034             ', '004-009-034     ', 'CERAMICA PISO EURO                                          ', 'ceramica-piso-euro', '009             ', '2015-09-04', '2015-09-04'),
(95, '035             ', '004-009-035     ', 'LISTELO EURO                                                ', 'listelo-euro', '009             ', '2015-09-04', '2015-09-04'),
(96, '036             ', '004             ', 'CERAMICA PARED ITALIA                                       ', 'ceramica-pared-italia', '010             ', '2015-09-04', '2015-09-04'),
(97, '037             ', '004-010-037     ', 'CERAMICA PISO ITALIA                                        ', 'ceramica-piso-italia', '010             ', '2015-09-04', '2015-09-04'),
(98, '038             ', '004-010-038     ', 'LISTELOS ITALIA                                             ', 'listelos-italia', '010             ', '2015-09-04', '2015-09-04'),
(99, '039             ', '004-010-039     ', 'TRENZAS                                                     ', 'trenzas', '010             ', '2015-09-04', '2015-09-04'),
(100, '040             ', '004-011-040     ', 'CENEFA INTERMATEX                                           ', 'cenefa-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(101, '041             ', '004-011-041     ', 'CORDON ITALIA                                               ', 'cordon-italia', '011             ', '2015-09-04', '2015-09-04'),
(102, '042             ', '004-011-042     ', 'ESQUINEROS INTERMATEX                                       ', 'esquineros-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(103, '043             ', '004-011-043     ', 'GUARDAESCOBAS INTERMATEX                                    ', 'guardaescobas-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(104, '044             ', '004-011-044     ', 'LISTELOS INTERMATEX                                         ', 'listelos-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(105, '045             ', '004-011-045     ', 'MOLDURAS INTERMATEX                                         ', 'molduras-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(106, '046             ', '004-011-046     ', 'TACOS INTERMATEX                                            ', 'tacos-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(107, '047             ', '004-011-047     ', 'TRENZA INTERMATEX                                           ', 'trenza-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(108, '048             ', '004-012-048     ', 'LISTELO ZAFIRO                                              ', 'listelo-zafiro', '012             ', '2015-09-04', '2015-09-04'),
(109, '049             ', '004-014-049     ', 'BOQUILLA                                                    ', 'boquilla', '014             ', '2015-09-04', '2015-09-04'),
(110, '050             ', '004-014-050     ', 'CONCOLOR                                                    ', 'concolor', '014             ', '2015-09-04', '2015-09-04'),
(111, '051             ', '004-014-051     ', 'EUROCOLOR                                                   ', 'eurocolor', '014             ', '2015-09-04', '2015-09-04'),
(112, '052             ', '004-014-052     ', 'EUROPEGA                                                    ', 'europega', '014             ', '2015-09-04', '2015-09-04'),
(113, '053             ', '004-014-053     ', 'MINERAL                                                     ', 'mineral', '014             ', '2015-09-04', '2015-09-04'),
(114, '054             ', '004-014-054     ', 'PEGACOR                                                     ', 'pegacor', '014             ', '2015-09-04', '2015-09-04'),
(115, '055             ', '004-014-055     ', 'PEGOPERFECTO                                                ', 'pegoperfecto', '014             ', '2015-09-04', '2015-09-04'),
(116, '056             ', '004-013-056     ', 'WINES                                                       ', 'wines', '013             ', '2015-09-04', '2015-09-04'),
(117, '057             ', '005-015-057     ', 'CANDADOS EGRET                                              ', 'candados-egret', '015             ', '2015-09-04', '2015-09-04'),
(118, '058             ', '005-015-058     ', 'CANDADOS PROFESIONAL                                        ', 'candados-profesional', '015             ', '2015-09-04', '2015-09-04'),
(119, '059             ', '005-015-059     ', 'CANDADOS SECURITY                                           ', 'candados-security', '015             ', '2015-09-04', '2015-09-04'),
(120, '060             ', '005-015-060     ', 'CANDADO TIPO ALEMAN                                         ', 'candado-tipo-aleman', '015             ', '2015-09-04', '2015-09-04'),
(121, '061             ', '005-015-061     ', 'CANDADO TIPO ITALIANO                                       ', 'candado-tipo-italiano', '015             ', '2015-09-04', '2015-09-04'),
(122, '062             ', '005-016-062     ', 'ESCUDO                                                      ', 'escudo', '016             ', '2015-09-04', '2015-09-04'),
(123, '063             ', '005-016-063     ', 'MANIJA                                                      ', 'manija', '016             ', '2015-09-04', '2015-09-04'),
(124, '064             ', '005-017-064     ', 'PORTACANDADO INDUMA                                         ', 'portacandado-induma', '017             ', '2015-09-04', '2015-09-04'),
(125, '065             ', '005-017-065     ', 'PORTACANDADO SIMPLE                                         ', 'portacandado-simple', '017             ', '2015-09-04', '2015-09-04'),
(126, '066             ', '005-017-066     ', 'PORTACANDADO VERA                                           ', 'portacandado-vera', '017             ', '2015-09-04', '2015-09-04'),
(127, '067             ', '005-019-067     ', 'ALBADILLAS                                                  ', 'albadillas', '019             ', '2015-09-04', '2015-09-04'),
(128, '068             ', '005-019-068     ', 'BOTONES                                                     ', 'botones', '019             ', '2015-09-04', '2015-09-04'),
(129, '069             ', '005-019-069     ', 'CIERRE                                                      ', 'cierre', '019             ', '2015-09-04', '2015-09-04'),
(130, '070             ', '005-019-070     ', 'OJO MAGICO                                                  ', 'ojo-magico', '019             ', '2015-09-04', '2015-09-04'),
(131, '071             ', '005-019-071     ', 'PASADOR                                                     ', 'pasador', '019             ', '2015-09-04', '2015-09-04'),
(132, '072             ', '005-019-072     ', 'RODAJA ACERO                                                ', 'rodaja-acero', '019             ', '2015-09-04', '2015-09-04'),
(133, '073             ', '005-019-073     ', 'SOPORTE CLOSET                                              ', 'soporte-closet', '019             ', '2015-09-04', '2015-09-04'),
(134, '074             ', '005-019-074     ', 'SOSTEN PLEGABLE                                             ', 'sosten-plegable', '019             ', '2015-09-04', '2015-09-04'),
(135, '075             ', '005-019-075     ', 'TOPE PUERTA                                                 ', 'tope-puerta', '019             ', '2015-09-04', '2015-09-04'),
(136, '076             ', '005-019-076     ', 'TRANCA PUERTA                                               ', 'tranca-puerta', '019             ', '2015-09-04', '2015-09-04'),
(137, '077             ', '005-019-077     ', 'BISAGRAS                                                    ', 'bisagras', '019             ', '2015-09-04', '2015-09-04'),
(138, '078             ', '005-018-078     ', 'CHAPA SECURITY                                              ', 'chapa-security', '018             ', '2015-09-04', '2015-09-04'),
(139, '079             ', '005-018-079     ', 'CHAPA VERA                                                  ', 'chapa-vera', '018             ', '2015-09-04', '2015-09-04'),
(140, '080             ', '005-018-080     ', 'CHAPA GATO                                                  ', 'chapa-gato', '018             ', '2015-09-04', '2015-09-04'),
(141, '081             ', '005-018-081     ', 'CHAPA INAFER                                                ', 'chapa-inafer', '018             ', '2015-09-04', '2015-09-04'),
(142, '082             ', '005-018-082     ', 'CHAPA YALE                                                  ', 'chapa-yale', '018             ', '2015-09-04', '2015-09-04'),
(143, '083             ', '007-029-083     ', 'BUJE GALVANIZADO                                            ', 'buje-galvanizado', '029             ', '2015-09-04', '2015-09-04'),
(144, '084             ', '007-029-084     ', 'CODO CALLE GALVANIZADO                                      ', 'codo-calle-galvanizado', '029             ', '2015-09-04', '2015-09-04'),
(145, '085             ', '007-029-085     ', 'CODO GALVANIZADO                                            ', 'codo-galvanizado', '029             ', '2015-09-04', '2015-09-04'),
(146, '086             ', '007-029-086     ', 'NIPLE GALVANIZADO                                           ', 'niple-galvanizado', '029             ', '2015-09-04', '2015-09-04'),
(147, '087             ', '007-029-087     ', 'REDUCCIN GALVANIZADO                                        ', 'reduccin-galvanizado', '029             ', '2015-09-04', '2015-09-04'),
(148, '088             ', '007-029-088     ', 'ROSCAS                                                      ', 'roscas', '029             ', '2015-09-04', '2015-09-04'),
(149, '089             ', '007-029-089     ', 'SEMICODO GALVANIZADO                                        ', 'semicodo-galvanizado', '029             ', '2015-09-04', '2015-09-04'),
(150, '090             ', '007-029-090     ', 'TAPON GALVANIZADO                                           ', 'tapon-galvanizado', '029             ', '2015-09-04', '2015-09-04'),
(151, '091             ', '007-029-091     ', 'TEE GALVANIZADA                                             ', 'tee-galvanizada', '029             ', '2015-09-04', '2015-09-04'),
(152, '092             ', '007-029-092     ', 'UNION GALVANIZADO                                           ', 'union-galvanizado', '029             ', '2015-09-04', '2015-09-04'),
(153, '093             ', '007-029-093     ', 'UNIVERSAL GALVANIZADA                                       ', 'universal-galvanizada', '029             ', '2015-09-04', '2015-09-04'),
(154, '094             ', '007-030-094     ', 'TUBOS GALVANIZADO                                           ', 'tubos-galvanizado', '030             ', '2015-09-04', '2015-09-04'),
(155, '095             ', '007-031-095     ', 'UNIFIX                                                      ', 'unifix', '031             ', '2015-09-04', '2015-09-04'),
(156, '096             ', '002-032-096     ', 'PINTURA AGUA                                                ', 'pintura-agua', '032             ', '2015-09-04', '2015-09-04'),
(157, '097             ', '002-032-097     ', 'TRATAMIENTO SUPERFICIES                                     ', 'tratamiento-superficies', '032             ', '2015-09-04', '2015-09-04'),
(158, '098             ', '002-032-098     ', 'PINTURA ACEITE                                              ', 'pintura-aceite', '032             ', '2015-09-04', '2015-09-04'),
(159, '099             ', '002-032-099     ', 'AEROSOLES                                                   ', 'aerosoles', '032             ', '2015-09-04', '2015-09-04'),
(160, '100             ', '002-033-100     ', 'ANTICORROSIVO                                               ', 'anticorrosivo', '033             ', '2015-09-04', '2015-09-04'),
(161, '101             ', '002-033-101     ', 'PINTURA TIPO II                                             ', 'pintura-tipo-ii', '033             ', '2015-09-04', '2015-09-04'),
(162, '102             ', '002-033-102     ', 'PINTURA TIPO III                                            ', 'pintura-tipo-iii', '033             ', '2015-09-04', '2015-09-04'),
(163, '103             ', '002-033-103     ', 'ESMALTES                                                    ', 'esmaltes', '033             ', '2015-09-04', '2015-09-04'),
(164, '104             ', '002-035-104     ', 'COLPEGA                                                     ', 'colpega', '035             ', '2015-09-04', '2015-09-04'),
(165, '105             ', '002-035-105     ', 'CAL                                                         ', 'cal', '035             ', '2015-09-04', '2015-09-04'),
(166, '106             ', '002-035-106     ', 'CARBURO                                                     ', 'carburo', '035             ', '2015-09-04', '2015-09-04'),
(167, '107             ', '002-035-107     ', 'ESTUCO                                                      ', 'estuco', '035             ', '2015-09-04', '2015-09-04'),
(168, '108             ', '002-035-108     ', 'GRECONAL                                                    ', 'greconal', '035             ', '2015-09-04', '2015-09-04'),
(169, '109             ', '002-035-109     ', 'P.V.A IMPRIMIANTE                                           ', 'pva-imprimiante', '035             ', '2015-09-04', '2015-09-04'),
(170, '110             ', '002-035-110     ', 'VARETA                                                      ', 'vareta', '035             ', '2015-09-04', '2015-09-04'),
(171, '111             ', '002-035-111     ', 'TAPA GOTERA                                                 ', 'tapa-gotera', '035             ', '2015-09-04', '2015-09-04'),
(172, '112             ', '008-044-112     ', 'SANITARIA PAVCO                                             ', 'sanitaria-pavco', '044             ', '2015-09-04', '2015-09-04'),
(173, '113             ', '008-044-113     ', 'PRESION PAVCO                                               ', 'presion-pavco', '044             ', '2015-09-04', '2015-09-04'),
(174, '114             ', '008-044-114     ', 'NOVAFORT PAVCO                                              ', 'novafort-pavco', '044             ', '2015-09-04', '2015-09-04'),
(175, '115             ', '008-044-115     ', 'CANALES PAVCO                                               ', 'canales-pavco', '044             ', '2015-09-04', '2015-09-04'),
(176, '116             ', '008-045-116     ', 'SANITARIA GERFOR                                            ', 'sanitaria-gerfor', '045             ', '2015-09-04', '2015-09-04'),
(177, '117             ', '008             ', 'VALVULA INCORPORACION', 'valvula-incorporacion', '045', '2015-09-04', '2015-09-04'),
(178, '118             ', '008-045-118     ', 'NOVAFORT GERFOR                                             ', 'novafort-gerfor', '045             ', '2015-09-04', '2015-09-04'),
(179, '119             ', '001-001-119     ', 'TORNILLOS                                                   ', 'tornillos', '001             ', '2015-09-04', '2015-09-04'),
(180, '120             ', '001-001-120     ', 'ANCLAJES                                                    ', 'anclajes', '001             ', '2015-09-04', '2015-09-04'),
(181, '121             ', '001-001-121     ', 'ARANDELAS                                                   ', 'arandelas', '001             ', '2015-09-04', '2015-09-04'),
(182, '122             ', '001-001-122     ', 'CANCAMO                                                     ', 'cancamo', '001             ', '2015-09-04', '2015-09-04'),
(183, '123             ', '001-001-123     ', 'CHAZOS                                                      ', 'chazos', '001             ', '2015-09-04', '2015-09-04'),
(184, '124             ', '001-001-124     ', 'CLAVOS                                                      ', 'clavos', '001             ', '2015-09-04', '2015-09-04'),
(185, '125             ', '001-001-125     ', 'GRAPAS                                                      ', 'grapas', '001             ', '2015-09-04', '2015-09-04'),
(186, '126             ', '001-001-126     ', 'GUAZA ARANDELA                                              ', 'guaza-arandela', '001             ', '2015-09-04', '2015-09-04'),
(187, '127             ', '001-001-127     ', 'PUNTILLA                                                    ', 'puntilla', '001             ', '2015-09-04', '2015-09-04'),
(188, '128             ', '001-001-128     ', 'REMACHES                                                    ', 'remaches', '001             ', '2015-09-04', '2015-09-04'),
(189, '129             ', '001-001-129     ', 'TACHUELAS                                                   ', 'tachuelas', '001             ', '2015-09-04', '2015-09-04'),
(190, '130             ', '001-001-130     ', 'TUERCAS                                                     ', 'tuercas', '001             ', '2015-09-04', '2015-09-04'),
(191, '131             ', '001-001-131     ', 'ESTOPEROLES                                                 ', 'estoperoles', '001             ', '2015-09-04', '2015-09-04'),
(192, '132             ', '001-001-132     ', 'PIAMIGO                                                     ', 'piamigo', '001             ', '2015-09-04', '2015-09-04'),
(193, '133             ', '001-003-133     ', 'PORRAS                                                      ', 'porras', '003             ', '2015-09-04', '2015-09-04'),
(194, '134             ', '001-088-134     ', 'PALAS                                                       ', 'palas', '088             ', '2015-09-04', '2015-09-04'),
(195, '135             ', '001-003-135     ', 'PALADRAGAS                                                  ', 'paladragas', '003             ', '2015-09-04', '2015-09-04'),
(196, '136             ', '001-088-136     ', 'PICAS                                                       ', 'picas', '088             ', '2015-09-04', '2015-09-04'),
(197, '137             ', '001-088-137     ', 'BARRAS                                                      ', 'barras', '088             ', '2015-09-04', '2015-09-04'),
(198, '138             ', '001-003-138     ', 'PULIDORAS                                                   ', 'pulidoras', '003             ', '2015-09-04', '2015-09-04'),
(199, '139             ', '001-003-139     ', 'TALADROS                                                    ', 'taladros', '003             ', '2015-09-04', '2015-09-04'),
(200, '140             ', '001-003-140     ', 'AZADON                                                      ', 'azadon', '003             ', '2015-09-04', '2015-09-04'),
(201, '141             ', '001-003-141     ', 'BALDE NEGRO                                                 ', 'balde-negro', '003             ', '2015-09-04', '2015-09-04'),
(202, '142             ', '001-003-142     ', 'SERRUCHOS                                                   ', 'serruchos', '003             ', '2015-09-04', '2015-09-04'),
(203, '143             ', '001-003-143     ', 'SIERRA                                                      ', 'sierra', '003             ', '2015-09-04', '2015-09-04'),
(204, '144             ', '001-003-144     ', 'BATEA                                                       ', 'batea', '003             ', '2015-09-04', '2015-09-04'),
(205, '145             ', '001-003-145     ', 'MACHETA                                                     ', 'macheta', '003             ', '2015-09-04', '2015-09-04'),
(206, '146             ', '001-003-146     ', 'CANECA                                                      ', 'caneca', '003             ', '2015-09-04', '2015-09-04'),
(207, '147             ', '001-003-147     ', 'CARRETILLA                                                  ', 'carretilla', '003             ', '2015-09-04', '2015-09-04'),
(208, '148             ', '001-088-148     ', 'CUCHILLA GUADANA                                            ', 'cuchilla-guadana', '088             ', '2015-09-04', '2015-09-04'),
(209, '149             ', '001-003-149     ', 'ESCALERAS                                                   ', 'escaleras', '003             ', '2015-09-04', '2015-09-04'),
(210, '150             ', '001-003-150     ', 'HACHAS                                                      ', 'hachas', '003             ', '2015-09-04', '2015-09-04'),
(211, '151             ', '001-003-151     ', 'LLANA MADERA                                                ', 'llana-madera', '003             ', '2015-09-04', '2015-09-04'),
(212, '152             ', '001-003-152     ', 'MAQUINA                                                     ', 'maquina', '003             ', '2015-09-04', '2015-09-04'),
(213, '153             ', '001-003-153     ', 'REGLA METALICA                                              ', 'regla-metalica', '003             ', '2015-09-04', '2015-09-04'),
(214, '154             ', '001-003-154     ', 'ZORRA METALICA                                              ', 'zorra-metalica', '003             ', '2015-09-04', '2015-09-04'),
(215, '156             ', '001-056-156     ', 'CONO O TAPON                                                ', 'cono-o-tapon', '056             ', '2015-09-04', '2015-09-04'),
(216, '157             ', '001-056-157     ', 'COPAS                                                       ', 'copas', '056             ', '2015-09-04', '2015-09-04'),
(217, '158             ', '001-056-158     ', 'DISCO                                                       ', 'disco', '056             ', '2015-09-04', '2015-09-04'),
(218, '159             ', '001-056-159     ', 'LIJAS                                                       ', 'lijas', '056             ', '2015-09-04', '2015-09-04'),
(219, '160             ', '001-056-160     ', 'TROMPOS TALADROS                                            ', 'trompos-taladros', '056             ', '2015-09-04', '2015-09-04'),
(220, '161             ', '001-056-161     ', 'LIMAS                                                       ', 'limas', '056             ', '2015-09-04', '2015-09-04'),
(221, '162             ', '001-057-162     ', 'HOJAS BISTURI                                               ', 'hojas-bisturi', '057             ', '2015-09-04', '2015-09-04'),
(222, '163             ', '001-057-163     ', 'HOJAS GUADANA                                               ', 'hojas-guadana', '057             ', '2015-09-04', '2015-09-04'),
(223, '164             ', '001-057-164     ', 'ESCOBILLAS                                                  ', 'escobillas', '057             ', '2015-09-04', '2015-09-04'),
(224, '165             ', '001-057-165     ', 'RESPUESTOS RODILLO                                          ', 'respuestos-rodillo', '057             ', '2015-09-04', '2015-09-04'),
(225, '166             ', '001-057-166     ', 'LLANTAS                                                     ', 'llantas', '057             ', '2015-09-04', '2015-09-04'),
(226, '167             ', '001-057-167     ', 'SEGUETA                                                     ', 'segueta', '057             ', '2015-09-04', '2015-09-04'),
(227, '168             ', '001-057-168     ', 'NEUMATICOS                                                  ', 'neumaticos', '057             ', '2015-09-04', '2015-09-04'),
(228, '169             ', '001-057-169     ', 'RACORES                                                     ', 'racores', '057             ', '2015-09-04', '2015-09-04'),
(229, '170             ', '001-057-170     ', 'RESPUESTOS LICUADORA                                        ', 'respuestos-licuadora', '057             ', '2015-09-04', '2015-09-04'),
(230, '171             ', '001-057-171     ', 'GUSANO PARA MAQUINA                                         ', 'gusano-para-maquina', '057             ', '2015-09-04', '2015-09-04'),
(231, '172             ', '001-057-172     ', 'SOPORTE PARA MAQUINA                                        ', 'soporte-para-maquina', '057             ', '2015-09-04', '2015-09-04'),
(232, '173             ', '001-057-173     ', 'EJE PARA CARRETILLA                                         ', 'eje-para-carretilla', '057             ', '2015-09-04', '2015-09-04'),
(233, '174             ', '001-059-174     ', 'MANGUERA GAS                                                ', 'manguera-gas', '059             ', '2015-09-04', '2015-09-04'),
(234, '175             ', '001-059-175     ', 'MANGUERA LAVADORA                                           ', 'manguera-lavadora', '059             ', '2015-09-04', '2015-09-04'),
(235, '176             ', '001-059-176     ', 'MANGUERA NEGRA                                              ', 'manguera-negra', '059             ', '2015-09-04', '2015-09-04'),
(236, '177             ', '001-059-177     ', 'MANGUERA NIVEL CRISTAL                                      ', 'manguera-nivel-cristal', '059             ', '2015-09-04', '2015-09-04'),
(237, '178             ', '001-059-178     ', 'MANGUERA RIEGO                                              ', 'manguera-riego', '059             ', '2015-09-04', '2015-09-04'),
(238, '179             ', '001-059-179     ', 'MANGUERA SWAN                                               ', 'manguera-swan', '059             ', '2015-09-04', '2015-09-04'),
(239, '180             ', '001-058-180     ', 'BOTAS                                                       ', 'botas', '058             ', '2015-09-04', '2015-09-04'),
(240, '181             ', '001-058-181     ', 'BISTURI                                                     ', 'bisturi', '058             ', '2015-09-04', '2015-09-04'),
(241, '182             ', '001-058-182     ', 'BROCHAS                                                     ', 'brochas', '058             ', '2015-09-04', '2015-09-04'),
(242, '183             ', '001-058-183     ', 'BROCAS                                                      ', 'brocas', '058             ', '2015-09-04', '2015-09-04'),
(243, '184             ', '001-058-184     ', 'CARETA SOLDAR                                               ', 'careta-soldar', '058             ', '2015-09-04', '2015-09-04'),
(244, '185             ', '001-058-185     ', 'CASCO                                                       ', 'casco', '058             ', '2015-09-04', '2015-09-04'),
(245, '186             ', '001-058-186     ', 'CORAZA                                                      ', 'coraza', '058             ', '2015-09-04', '2015-09-04'),
(246, '187             ', '001-058-187     ', 'GUANTES                                                     ', 'guantes', '058             ', '2015-09-04', '2015-09-04'),
(247, '188             ', '001-058-188     ', 'LLAVE PARA TALADRO                                          ', 'llave-para-taladro', '058             ', '2015-09-04', '2015-09-04'),
(248, '189             ', '001-058-189     ', 'PIEDRA AFILAR                                               ', 'piedra-afilar', '058             ', '2015-09-04', '2015-09-04'),
(249, '190             ', '001-058-190     ', 'PINCEL                                                      ', 'pincel', '058             ', '2015-09-04', '2015-09-04'),
(250, '191             ', '001-058-191     ', 'RUBY BURIL                                                  ', 'ruby-buril', '058             ', '2015-09-04', '2015-09-04'),
(251, '192             ', '001-058-192     ', 'AEROGRAFOS                                                  ', 'aerografos', '058             ', '2015-09-04', '2015-09-04'),
(252, '193             ', '001-058-193     ', 'ANILLO AJUSTADOR                                            ', 'anillo-ajustador', '058             ', '2015-09-04', '2015-09-04'),
(253, '194             ', '001-058-194     ', 'DESLIZADOR PUNTILLA                                         ', 'deslizador-puntilla', '058             ', '2015-09-04', '2015-09-04'),
(254, '195             ', '001-058-195     ', 'GAFAS                                                       ', 'gafas', '058             ', '2015-09-04', '2015-09-04'),
(255, '196             ', '001-058-196     ', 'MASCARILLAS                                                 ', 'mascarillas', '058             ', '2015-09-04', '2015-09-04'),
(256, '197             ', '001-058-197     ', 'PLOMADA                                                     ', 'plomada', '058             ', '2015-09-04', '2015-09-04'),
(257, '198             ', '001-058-198     ', 'DECAMETRO                                                   ', 'decametro', '058             ', '2015-09-04', '2015-09-04'),
(258, '199             ', '001-058-199     ', 'ALICATE                                                     ', 'alicate', '058             ', '2015-09-04', '2015-09-04'),
(259, '200             ', '001-058-200     ', 'CORTAFRIO                                                   ', 'cortafrio', '058             ', '2015-09-04', '2015-09-04'),
(260, '201             ', '001-058-201     ', 'CUCHILLO                                                    ', 'cuchillo', '058             ', '2015-09-04', '2015-09-04'),
(261, '202             ', '001-058-202     ', 'CEPILLO ACERO                                               ', 'cepillo-acero', '058             ', '2015-09-04', '2015-09-04'),
(262, '203             ', '001-058-203     ', 'DESTORNILLADOR                                              ', 'destornillador', '058             ', '2015-09-04', '2015-09-04'),
(263, '204             ', '001-058-204     ', 'ESCUADRAS                                                   ', 'escuadras', '058             ', '2015-09-04', '2015-09-04'),
(264, '205             ', '001-058-205     ', 'ESPATULA                                                    ', 'espatula', '058             ', '2015-09-04', '2015-09-04'),
(265, '206             ', '001-058-206     ', 'FLEXOMETRO                                                  ', 'flexometro', '058             ', '2015-09-04', '2015-09-04'),
(266, '207             ', '001-058-207     ', 'FORMON                                                      ', 'formon', '058             ', '2015-09-04', '2015-09-04'),
(267, '208             ', '001-058-208     ', 'RODILLOS                                                    ', 'rodillos', '058             ', '2015-09-04', '2015-09-04'),
(268, '209             ', '001-058-209     ', 'HOMBRE SOLO                                                 ', 'hombre-solo', '058             ', '2015-09-04', '2015-09-04'),
(269, '210             ', '001-058-210     ', 'JUEGO COPAS                                                 ', 'juego-copas', '058             ', '2015-09-04', '2015-09-04'),
(270, '211             ', '001-058-211     ', 'PALUSTRES                                                   ', 'palustres', '058             ', '2015-09-04', '2015-09-04'),
(271, '212             ', '001-058-212     ', 'CAJA HERRAMIENTAS                                           ', 'caja-herramientas', '058             ', '2015-09-04', '2015-09-04'),
(272, '213             ', '001-058-213     ', 'CORTAVIDRIO                                                 ', 'cortavidrio', '058             ', '2015-09-04', '2015-09-04'),
(273, '214             ', '001-058-214     ', 'CORTALOZA                                                   ', 'cortaloza', '058             ', '2015-09-04', '2015-09-04'),
(274, '215             ', '001-058-215     ', 'FALSA ESCUADRA                                              ', 'falsa-escuadra', '058             ', '2015-09-04', '2015-09-04'),
(275, '216             ', '001-058-216     ', 'GRAPADORA                                                   ', 'grapadora', '058             ', '2015-09-04', '2015-09-04'),
(276, '217             ', '001-058-217     ', 'LLAVE BROCA                                                 ', 'llave-broca', '058             ', '2015-09-04', '2015-09-04'),
(277, '218             ', '001-058-218     ', 'LLAVE BRISTOL                                               ', 'llave-bristol', '058             ', '2015-09-04', '2015-09-04'),
(278, '219             ', '001-058-219     ', 'LLAVE EXPANSION                                             ', 'llave-expansion', '058             ', '2015-09-04', '2015-09-04'),
(279, '220             ', '001-058-220     ', 'SIMBRAZ                                                     ', 'simbraz', '058             ', '2015-09-04', '2015-09-04'),
(280, '221             ', '001-058-221     ', 'MARCO SEGUETA                                               ', 'marco-segueta', '058             ', '2015-09-04', '2015-09-04'),
(281, '222             ', '001-058-222     ', 'NIVELES                                                     ', 'niveles', '058             ', '2015-09-04', '2015-09-04'),
(282, '223             ', '001-058-223     ', 'PINZAS                                                      ', 'pinzas', '058             ', '2015-09-04', '2015-09-04'),
(283, '224             ', '001-058-224     ', 'PISTOLA                                                     ', 'pistola', '058             ', '2015-09-04', '2015-09-04'),
(284, '225             ', '001-058-225     ', 'PUNTEROS                                                    ', 'punteros', '058             ', '2015-09-04', '2015-09-04'),
(285, '226             ', '001-058-226     ', 'REMACHADORA                                                 ', 'remachadora', '058             ', '2015-09-04', '2015-09-04'),
(286, '227             ', '001-058-227     ', 'SINCEL                                                      ', 'sincel', '058             ', '2015-09-04', '2015-09-04'),
(287, '228             ', '001-003-228     ', 'RASTRILLO                                                   ', 'rastrillo', '003             ', '2015-09-04', '2015-09-04'),
(288, '229             ', '001-058-229     ', 'TENAZA                                                      ', 'tenaza', '058             ', '2015-09-04', '2015-09-04'),
(289, '230             ', '001-058-230     ', 'TIJERAS                                                     ', 'tijeras', '058             ', '2015-09-04', '2015-09-04'),
(290, '231             ', '010-086-231     ', 'ARENA                                                       ', 'arena', '086             ', '2015-09-04', '2015-09-04'),
(291, '232             ', '010-036-232     ', 'HIERRO                                                      ', 'hierro', '036             ', '2015-09-04', '2015-09-04'),
(292, '233             ', '010-086-233     ', 'LADRILLO                                                    ', 'ladrillo', '086             ', '2015-09-04', '2015-09-04'),
(293, '234             ', '010-036-234     ', 'CEMENTO GRIS                                                ', 'cemento-gris', '036             ', '2015-09-04', '2015-09-04'),
(294, '235             ', '010-036-235     ', 'CAOLIN                                                      ', 'caolin', '036             ', '2015-09-04', '2015-09-04'),
(295, '236             ', '010-086-236     ', 'PIEDRA BOLO                                                 ', 'piedra-bolo', '086             ', '2015-09-04', '2015-09-04'),
(296, '237             ', '010-036-237     ', 'CEMENTO BLANCO                                              ', 'cemento-blanco', '036             ', '2015-09-04', '2015-09-04'),
(297, '238             ', '010-036-238     ', 'CHIPA                                                       ', 'chipa', '036             ', '2015-09-04', '2015-09-04'),
(298, '239             ', '010-036-239     ', 'CAJA CONTADOR AGUA                                          ', 'caja-contador-agua', '036             ', '2015-09-04', '2015-09-04'),
(299, '240             ', '010-036-240     ', 'GRANITO                                                     ', 'granito', '036             ', '2015-09-04', '2015-09-04'),
(300, '241             ', '010-036-241     ', 'GRAVILLA                                                    ', 'gravilla', '036             ', '2015-09-04', '2015-09-04'),
(301, '242             ', '010-036-242     ', 'MARMOLINA                                                   ', 'marmolina', '036             ', '2015-09-04', '2015-09-04'),
(302, '243             ', '010-036-243     ', 'TRITURADO                                                   ', 'triturado', '036             ', '2015-09-04', '2015-09-04'),
(303, '244             ', '010-086-244     ', 'REVUELTO                                                    ', 'revuelto', '086             ', '2015-09-04', '2015-09-04'),
(304, '245             ', '010-036-245     ', 'YESO                                                        ', 'yeso', '036             ', '2015-09-04', '2015-09-04'),
(305, '246             ', '010-036-246     ', 'CINTA SENALIZACION                                          ', 'cinta-senalizacion', '036             ', '2015-09-04', '2015-09-04'),
(306, '247             ', '010-036-247     ', 'ALAMBRE GALVANIZADO                                         ', 'alambre-galvanizado', '036             ', '2015-09-04', '2015-09-04'),
(307, '248             ', '010-036-248     ', 'ALAMBRE PUAS                                                ', 'alambre-puas', '036             ', '2015-09-04', '2015-09-04'),
(308, '249             ', '010-086-249     ', 'SACO FIBRA                                                  ', 'saco-fibra', '086             ', '2015-09-04', '2015-09-04'),
(309, '250             ', '010-037-250     ', 'CALAO CEMENTO                                               ', 'calao-cemento', '037             ', '2015-09-04', '2015-09-04'),
(310, '251             ', '010-037-251     ', 'CALAO GRES                                                  ', 'calao-gres', '037             ', '2015-09-04', '2015-09-04'),
(311, '252             ', '010-037-252     ', 'ESCALGRES                                                   ', 'escalgres', '037             ', '2015-09-04', '2015-09-04'),
(312, '253             ', '010-037-253     ', 'GUARDAESCOBAS                                               ', 'guardaescobas', '037             ', '2015-09-04', '2015-09-04'),
(313, '254             ', '010-037-254     ', 'PERSIANA DE CEMENTO                                         ', 'persiana-de-cemento', '037             ', '2015-09-04', '2015-09-04'),
(314, '255             ', '010-037-255     ', 'RETAL CORALINO                                              ', 'retal-coralino', '037             ', '2015-09-04', '2015-09-04'),
(315, '256             ', '010-037-256     ', 'TABLETA                                                     ', 'tableta', '037             ', '2015-09-04', '2015-09-04'),
(316, '257             ', '010-093-257     ', 'TUBO CEMENTO                                                ', 'tubo-cemento', '093             ', '2015-09-04', '2015-09-04'),
(317, '258             ', '010-037-258     ', 'TUBO DE GRES                                                ', 'tubo-de-gres', '037             ', '2015-09-04', '2015-09-04'),
(318, '259             ', '010-086-259     ', 'TEJA DE BARRO                                               ', 'teja-de-barro', '086             ', '2015-09-04', '2015-09-04'),
(319, '260             ', '010-039-260     ', 'TEJA COLONIAL                                               ', 'teja-colonial', '039             ', '2015-09-04', '2015-09-04'),
(320, '261             ', '010-039-261     ', 'TEJA THERMOACOUSTIC                                         ', 'teja-thermoacoustic', '039             ', '2015-09-04', '2015-09-04'),
(321, '262             ', '010-039-262     ', 'CABALLETE ETERNIT                                           ', 'caballete-eternit', '039             ', '2015-09-04', '2015-09-04'),
(322, '263             ', '010-039-263     ', 'CLARABOYA ETERNIT                                           ', 'claraboya-eternit', '039             ', '2015-09-04', '2015-09-04'),
(323, '264             ', '010-039-264     ', 'TANQUE AJOVER                                               ', 'tanque-ajover', '039             ', '2015-09-04', '2015-09-04'),
(324, '265             ', '010-039-265     ', 'TEJA ADRI                                                   ', 'teja-adri', '039             ', '2015-09-04', '2015-09-04'),
(325, '266             ', '010-039-266     ', 'TEJA AJOVER                                                 ', 'teja-ajover', '039             ', '2015-09-04', '2015-09-04'),
(326, '267             ', '010-086-267     ', 'TEJA CUADRADA                                               ', 'teja-cuadrada', '086             ', '2015-09-04', '2015-09-04'),
(327, '268             ', '010-039-268     ', 'TELA ASFALTICA                                              ', 'tela-asfaltica', '039             ', '2015-09-04', '2015-09-04'),
(328, '269             ', '010-038-269     ', 'AMARRES                                                     ', 'amarres', '038             ', '2015-09-04', '2015-09-04'),
(329, '270             ', '010-042-270     ', 'SOLDADURA STANO                                             ', 'soldadura-stano', '042             ', '2015-09-04', '2015-09-04'),
(330, '271             ', '010-038-271     ', 'GANCHO ETERNIT                                              ', 'gancho-eternit', '038             ', '2015-09-04', '2015-09-04'),
(331, '272             ', '010-038-272     ', 'TORNILLOS AUTOPERFORANTES                                   ', 'tornillos-autoperforantes', '038             ', '2015-09-04', '2015-09-04'),
(332, '273             ', '010-038-273     ', 'SOLDADURA SOLDALIST                                         ', 'soldadura-soldalist', '038             ', '2015-09-04', '2015-09-04'),
(333, '274             ', '010-043-274     ', 'PERFIL                                                      ', 'perfil', '043             ', '2015-09-04', '2015-09-04'),
(334, '275             ', '010-042-275     ', 'SOLDADURA SOLDERING                                         ', 'soldadura-soldering', '042             ', '2015-09-04', '2015-09-04'),
(335, '276             ', '010-043-276     ', 'DILATACIONES PLASTICAS                                      ', 'dilataciones-plasticas', '043             ', '2015-09-04', '2015-09-04'),
(336, '277             ', '010-043-277     ', 'PIRLAN BRONCE                                               ', 'pirlan-bronce', '043             ', '2015-09-04', '2015-09-04'),
(337, '278             ', '010-040-278     ', 'GAVIONES                                                    ', 'gaviones', '040             ', '2015-09-04', '2015-09-04'),
(338, '279             ', '010-040-279     ', 'HOJALATA                                                    ', 'hojalata', '040             ', '2015-09-04', '2015-09-04'),
(339, '280             ', '010-040-280     ', 'MALLAS                                                      ', 'mallas', '040             ', '2015-09-04', '2015-09-04'),
(340, '281             ', '010-040-281     ', 'PLASTICO NEGRO                                              ', 'plastico-negro', '040             ', '2015-09-04', '2015-09-04'),
(341, '282             ', '010-040-282     ', 'POLISOMBRA                                                  ', 'polisombra', '040             ', '2015-09-04', '2015-09-04'),
(342, '283             ', '010-041-283     ', 'ACIDOS                                                      ', 'acidos', '041             ', '2015-09-04', '2015-09-04'),
(343, '284             ', '010-041-284     ', 'SODA CAUSTICA                                               ', 'soda-caustica', '041             ', '2015-09-04', '2015-09-04'),
(344, '285             ', '010-041-285     ', 'THINNER                                                     ', 'thinner', '041             ', '2015-09-04', '2015-09-04'),
(345, '286             ', '010-086-286     ', 'BARSOL                                                      ', 'barsol', '086             ', '2015-09-04', '2015-09-04'),
(346, '287             ', '010-041-287     ', 'ASFALTO SOLIDO                                              ', 'asfalto-solido', '041             ', '2015-09-04', '2015-09-04'),
(347, '288             ', '010-041-288     ', 'CREOLINA                                                    ', 'creolina', '041             ', '2015-09-04', '2015-09-04'),
(348, '289             ', '010-041-289     ', 'DIABLO FUERTE                                               ', 'diablo-fuerte', '041             ', '2015-09-04', '2015-09-04'),
(349, '290             ', '010-041-290     ', 'INMUNIZANTE DE MADERA                                       ', 'inmunizante-de-madera', '041             ', '2015-09-04', '2015-09-04'),
(350, '291             ', '010-041-291     ', 'LIMPIADOR CLEANTEX                                          ', 'limpiador-cleantex', '041             ', '2015-09-04', '2015-09-04');
INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(351, '292             ', '010-042-292     ', 'ANGULO                                                      ', 'angulo', '042             ', '2015-09-04', '2015-09-04'),
(352, '293             ', '010-042-293     ', 'BALINERAS                                                   ', 'balineras', '042             ', '2015-09-04', '2015-09-04'),
(353, '294             ', '010-042-294     ', 'GOSNE                                                       ', 'gosne', '042             ', '2015-09-04', '2015-09-04'),
(354, '295             ', '010-042-295     ', 'LAMINA ZINC                                                 ', 'lamina-zinc', '042             ', '2015-09-04', '2015-09-04'),
(355, '296             ', '010-042-296     ', 'PLATINA                                                     ', 'platina', '042             ', '2015-09-04', '2015-09-04'),
(356, '297             ', '010-042-297     ', 'TUBO CUADRADO                                               ', 'tubo-cuadrado', '042             ', '2015-09-04', '2015-09-04'),
(357, '298             ', '010-042-298     ', 'TUBO RECTANGULAR                                            ', 'tubo-rectangular', '042             ', '2015-09-04', '2015-09-04'),
(358, '299             ', '010-042-299     ', 'SOLDADURA WEST                                              ', 'soldadura-west', '042             ', '2015-09-04', '2015-09-04'),
(359, '300             ', '010-042-300     ', 'VIDRIO SOLDAR                                               ', 'vidrio-soldar', '042             ', '2015-09-04', '2015-09-04'),
(360, '301             ', '010-042-301     ', 'CADENA SOLDADA                                              ', 'cadena-soldada', '042             ', '2015-09-04', '2015-09-04'),
(361, '302             ', '010-042-302     ', 'CIERRE RODILLO                                              ', 'cierre-rodillo', '042             ', '2015-09-04', '2015-09-04'),
(362, '303             ', '006-020-303     ', 'CABLE DUPLEX                                                ', 'cable-duplex', '020             ', '2015-09-04', '2015-09-04'),
(363, '304             ', '006-020-304     ', 'ALAMBRE ALUMINIO                                            ', 'alambre-aluminio', '020             ', '2015-09-04', '2015-09-04'),
(364, '305             ', '006-020-305     ', 'ALAMBRE CEDSA                                               ', 'alambre-cedsa', '020             ', '2015-09-04', '2015-09-04'),
(365, '306             ', '010-039-306     ', 'TEJA ETERNIT                                                ', 'teja-eternit', '039             ', '2015-09-04', '2015-09-04'),
(366, '307             ', '010-039-307     ', 'TEJA ZINC                                                   ', 'teja-zinc', '039             ', '2015-09-04', '2015-09-04'),
(367, '308             ', '006-020-308     ', 'ALAMBRE ENCAUCHETADO                                        ', 'alambre-encauchetado', '020             ', '2015-09-04', '2015-09-04'),
(368, '309             ', '006-020-309     ', 'ALAMBRE FACOME                                              ', 'alambre-facome', '020             ', '2015-09-04', '2015-09-04'),
(369, '310             ', '006-020-310     ', 'ALAMBRE TELEFONO                                            ', 'alambre-telefono', '020             ', '2015-09-04', '2015-09-04'),
(370, '311             ', '006-020-311     ', 'ALAMBRE TRENZADO                                            ', 'alambre-trenzado', '020             ', '2015-09-04', '2015-09-04'),
(371, '312             ', '006-020-312     ', 'ALAMRE POLARIZADO                                           ', 'alamre-polarizado', '020             ', '2015-09-04', '2015-09-04'),
(372, '313             ', '006-020-313     ', 'CABLE COAXIAL                                               ', 'cable-coaxial', '020             ', '2015-09-04', '2015-09-04'),
(373, '314             ', '006-020-314     ', 'ALAMBRE CORRIENTE                                           ', 'alambre-corriente', '020             ', '2015-09-04', '2015-09-04'),
(374, '315             ', '006-020-315     ', 'ALAMBRE DESNUDO                                             ', 'alambre-desnudo', '020             ', '2015-09-04', '2015-09-04'),
(375, '316             ', '006-021-316     ', 'BENJAMINES                                                  ', 'benjamines', '021             ', '2015-09-04', '2015-09-04'),
(376, '317             ', '006-021-317     ', 'BERBIQUI                                                    ', 'berbiqui', '021             ', '2015-09-04', '2015-09-04'),
(377, '318             ', '006-021-318     ', 'CAIMAN                                                      ', 'caiman', '021             ', '2015-09-04', '2015-09-04'),
(378, '319             ', '006-021-319     ', 'CAUTIN                                                      ', 'cautin', '021             ', '2015-09-04', '2015-09-04'),
(379, '320             ', '006-021-320     ', 'CONECTOR                                                    ', 'conector', '021             ', '2015-09-04', '2015-09-04'),
(380, '321             ', '006-021-321     ', 'CRUCETAS                                                    ', 'crucetas', '021             ', '2015-09-04', '2015-09-04'),
(381, '322             ', '006-021-322     ', 'CURVAS                                                      ', 'curvas', '021             ', '2015-09-04', '2015-09-04'),
(382, '323             ', '006-021-323     ', 'FUSIBLE                                                     ', 'fusible', '021             ', '2015-09-04', '2015-09-04'),
(383, '324             ', '006-021-324     ', 'GRAPAS ELECTRIC                                             ', 'grapas-electric', '021             ', '2015-09-04', '2015-09-04'),
(384, '325             ', '006-021-325     ', 'PELA CABLE                                                  ', 'pela-cable', '021             ', '2015-09-04', '2015-09-04'),
(385, '326             ', '006-021-326     ', 'PERCHAS                                                     ', 'perchas', '021             ', '2015-09-04', '2015-09-04'),
(386, '327             ', '006-021-327     ', 'PERRO                                                       ', 'perro', '021             ', '2015-09-04', '2015-09-04'),
(387, '328             ', '006-021-328     ', 'PLAFON                                                      ', 'plafon', '021             ', '2015-09-04', '2015-09-04'),
(388, '329             ', '006-021-329     ', 'PORTAELECTRODO                                              ', 'portaelectrodo', '021             ', '2015-09-04', '2015-09-04'),
(389, '330             ', '006-021-330     ', 'PROBADOR CORRIENTE                                          ', 'probador-corriente', '021             ', '2015-09-04', '2015-09-04'),
(390, '331             ', '006-021-331     ', 'SOCKER                                                      ', 'socker', '021             ', '2015-09-04', '2015-09-04'),
(391, '332             ', '006-021-332     ', 'SONDA                                                       ', 'sonda', '021             ', '2015-09-04', '2015-09-04'),
(392, '333             ', '006-021-333     ', 'SUPLEMENTOS                                                 ', 'suplementos', '021             ', '2015-09-04', '2015-09-04'),
(393, '334             ', '006-021-334     ', 'TERMINAL ELECTRICO                                          ', 'terminal-electrico', '021             ', '2015-09-04', '2015-09-04'),
(394, '335             ', '006-021-335     ', 'AISLADOR                                                    ', 'aislador', '021             ', '2015-09-04', '2015-09-04'),
(395, '336             ', '006-021-336     ', 'BARRAJES                                                    ', 'barrajes', '021             ', '2015-09-04', '2015-09-04'),
(396, '337             ', '006-021-337     ', 'UNION TELEFONO                                              ', 'union-telefono', '021             ', '2015-09-04', '2015-09-04'),
(397, '338             ', '006-022-338     ', 'BALASTROS                                                   ', 'balastros', '022             ', '2015-09-04', '2015-09-04'),
(398, '339             ', '006-022-339     ', 'CHASIS LAMPARA                                              ', 'chasis-lampara', '022             ', '2015-09-04', '2015-09-04'),
(399, '340             ', '006-022-340     ', 'LAMPARA CIRCULAR                                            ', 'lampara-circular', '022             ', '2015-09-04', '2015-09-04'),
(400, '341             ', '006-022-341     ', 'LAMPARA FLUORECENTE                                         ', 'lampara-fluorecente', '022             ', '2015-09-04', '2015-09-04'),
(401, '342             ', '006-022-342     ', 'REPUESTOS FLUORECENTE                                       ', 'repuestos-fluorecente', '022             ', '2015-09-04', '2015-09-04'),
(402, '343             ', '006-022-343     ', 'STARTE                                                      ', 'starte', '022             ', '2015-09-04', '2015-09-04'),
(403, '344             ', '006-022-344     ', 'TUBO FLUORECENTE                                            ', 'tubo-fluorecente', '022             ', '2015-09-04', '2015-09-04'),
(404, '345             ', '006-023-345     ', 'AHORRADOR FULLWAT                                           ', 'ahorrador-fullwat', '023             ', '2015-09-04', '2015-09-04'),
(405, '346             ', '006-023-346     ', 'AHORRADOR OPALUX                                            ', 'ahorrador-opalux', '023             ', '2015-09-04', '2015-09-04'),
(406, '347             ', '006-023-347     ', 'AHORRADOR SILVANIA                                          ', 'ahorrador-silvania', '023             ', '2015-09-04', '2015-09-04'),
(407, '348             ', '006-023-348     ', 'BOMBILLO OJO BUEY                                           ', 'bombillo-ojo-buey', '023             ', '2015-09-04', '2015-09-04'),
(408, '349             ', '006-023-349     ', 'OJO BUEY                                                    ', 'ojo-buey', '023             ', '2015-09-04', '2015-09-04'),
(409, '350             ', '006-024-350     ', 'CABLE CHURCO                                                ', 'cable-churco', '024             ', '2015-09-04', '2015-09-04'),
(410, '351             ', '006-024-351     ', 'CABLE GRABADORA                                             ', 'cable-grabadora', '024             ', '2015-09-04', '2015-09-04'),
(411, '352             ', '006-024-352     ', 'CABLE BATERIA                                               ', 'cable-bateria', '024             ', '2015-09-04', '2015-09-04'),
(412, '353             ', '006-024-353     ', 'CABLE PLANCHE                                               ', 'cable-planche', '024             ', '2015-09-04', '2015-09-04'),
(413, '354             ', '006-024-354     ', 'CABLE TELEFONO                                              ', 'cable-telefono', '024             ', '2015-09-04', '2015-09-04'),
(414, '355             ', '006-024-355     ', 'EXTENSION BLANCA                                            ', 'extension-blanca', '024             ', '2015-09-04', '2015-09-04'),
(415, '356             ', '006-024-356     ', 'MULTITOMA                                                   ', 'multitoma', '024             ', '2015-09-04', '2015-09-04'),
(416, '357             ', '006-025-357     ', 'CAJA CEMENTO                                                ', 'caja-cemento', '025             ', '2015-09-04', '2015-09-04'),
(417, '358             ', '006-025-358     ', 'CAJAS CONTADOR                                              ', 'cajas-contador', '025             ', '2015-09-04', '2015-09-04'),
(418, '359             ', '006-025-359     ', 'CAJAS CUADRADAS                                             ', 'cajas-cuadradas', '025             ', '2015-09-04', '2015-09-04'),
(419, '360             ', '006-025-360     ', 'CAJAS EMPALME                                               ', 'cajas-empalme', '025             ', '2015-09-04', '2015-09-04'),
(420, '361             ', '006-025-361     ', 'CAJAS TACOS                                                 ', 'cajas-tacos', '025             ', '2015-09-04', '2015-09-04'),
(421, '362             ', '006-025-362     ', 'TACOS                                                       ', 'tacos', '025             ', '2015-09-04', '2015-09-04'),
(422, '363             ', '006-025-363     ', 'TAPAS                                                       ', 'tapas', '025             ', '2015-09-04', '2015-09-04'),
(423, '364             ', '006-026-364     ', 'CLAVIJA                                                     ', 'clavija', '026             ', '2015-09-04', '2015-09-04'),
(424, '365             ', '006-026-365     ', 'CONMUTABLES                                                 ', 'conmutables', '026             ', '2015-09-04', '2015-09-04'),
(425, '366             ', '006-026-366     ', 'CONVERTIDOR                                                 ', 'convertidor', '026             ', '2015-09-04', '2015-09-04'),
(426, '367             ', '006-026-367     ', 'INTERRUPTOR                                                 ', 'interruptor', '026             ', '2015-09-04', '2015-09-04'),
(427, '368             ', '006-026-368     ', 'PULSADOR                                                    ', 'pulsador', '026             ', '2015-09-04', '2015-09-04'),
(428, '369             ', '006-026-369     ', 'SALIDA                                                      ', 'salida', '026             ', '2015-09-04', '2015-09-04'),
(429, '370             ', '006-026-370     ', 'TEE                                                         ', 'tee', '026             ', '2015-09-04', '2015-09-04'),
(430, '371             ', '006-026-371     ', 'TOMA                                                        ', 'toma', '026             ', '2015-09-04', '2015-09-04'),
(431, '372             ', '006-026-372     ', 'TIMBRE                                                      ', 'timbre', '026             ', '2015-09-04', '2015-09-04'),
(432, '373             ', '006-026-373     ', 'TABLA RECTANGULAR                                           ', 'tabla-rectangular', '026             ', '2015-09-04', '2015-09-04'),
(433, '374             ', '006-027-374     ', 'CANALETA                                                    ', 'canaleta', '027             ', '2015-09-04', '2015-09-04'),
(434, '375             ', '006-027-375     ', 'CONDULETA                                                   ', 'conduleta', '027             ', '2015-09-04', '2015-09-04'),
(435, '376             ', '006-027-376     ', 'HIDROSOLTA                                                  ', 'hidrosolta', '027             ', '2015-09-04', '2015-09-04'),
(436, '377             ', '006-027-377     ', 'MANGUERA CONDUFLEX                                          ', 'manguera-conduflex', '027             ', '2015-09-04', '2015-09-04'),
(437, '378             ', '006-027-378     ', 'TUBO CONDUIT                                                ', 'tubo-conduit', '027             ', '2015-09-04', '2015-09-04'),
(438, '379             ', '006-027-379     ', 'VARILLA COOPERWELL                                          ', 'varilla-cooperwell', '027             ', '2015-09-04', '2015-09-04'),
(439, '380             ', '006-028-380     ', 'ANTENA                                                      ', 'antena', '028             ', '2015-09-04', '2015-09-04'),
(440, '381             ', '006-028-381     ', 'MARRANITO COAXIAL                                           ', 'marranito-coaxial', '028             ', '2015-09-04', '2015-09-04'),
(441, '382             ', '006-028-382     ', 'SPLITER                                                     ', 'spliter', '028             ', '2015-09-04', '2015-09-04'),
(442, '383             ', '006-028-383     ', 'SWITCH                                                      ', 'switch', '028             ', '2015-09-04', '2015-09-04'),
(443, '384             ', '006-028-384     ', 'TABACO TELEVISION                                           ', 'tabaco-television', '028             ', '2015-09-04', '2015-09-04'),
(444, '385             ', '006-028-385     ', 'TEE COAXIAL                                                 ', 'tee-coaxial', '028             ', '2015-09-04', '2015-09-04'),
(445, '386             ', '006-028-386     ', 'TERMINAL COAXIAL                                            ', 'terminal-coaxial', '028             ', '2015-09-04', '2015-09-04'),
(446, '387             ', '006-028-387     ', 'UNION COAXIAL                                               ', 'union-coaxial', '028             ', '2015-09-04', '2015-09-04'),
(447, '388             ', '011-060-388     ', 'COMBO AVANTY                                                ', 'combo-avanty', '060             ', '2015-09-04', '2015-09-04'),
(448, '389             ', '011-060-389     ', 'COMBO ATLANTA                                               ', 'combo-atlanta', '060             ', '2015-09-04', '2015-09-04'),
(449, '390             ', '011-060-390     ', 'COMBO EDESA                                                 ', 'combo-edesa', '060             ', '2015-09-04', '2015-09-04'),
(450, '391             ', '011-060-391     ', 'COMBO ACUACER                                               ', 'combo-acuacer', '060             ', '2015-09-04', '2015-09-04'),
(451, '392             ', '011-060-392     ', 'COMBO DISTINCION                                            ', 'combo-distincion', '060             ', '2015-09-04', '2015-09-04'),
(452, '393             ', '011-060-393     ', 'ORINAL                                                      ', 'orinal', '060             ', '2015-09-04', '2015-09-04'),
(453, '394             ', '011-061-394     ', 'SANITARIO ACUACER                                           ', 'sanitario-acuacer', '061             ', '2015-09-04', '2015-09-04'),
(454, '395             ', '011-061-395     ', 'SANITARIO AVANTY                                            ', 'sanitario-avanty', '061             ', '2015-09-04', '2015-09-04'),
(455, '396             ', '011             ', 'SANITARIO DISTINCION', 'sanitario-distincion', '061', '2015-09-04', '2015-09-04'),
(456, '397             ', '011-061-397     ', 'SANITARIO EDESA                                             ', 'sanitario-edesa', '061             ', '2015-09-04', '2015-09-04'),
(457, '398             ', '011-062-398     ', 'LAVAMANOS ACUACER                                           ', 'lavamanos-acuacer', '062             ', '2015-09-04', '2015-09-04'),
(458, '399             ', '011-062-399     ', 'LAVAMANOS AVANTY                                            ', 'lavamanos-avanty', '062             ', '2015-09-04', '2015-09-04'),
(459, '400             ', '011-062-400     ', 'LAVAMANOS EDESA                                             ', 'lavamanos-edesa', '062             ', '2015-09-04', '2015-09-04'),
(460, '401             ', '011-063-401     ', 'TANQUE ACUACER                                              ', 'tanque-acuacer', '063             ', '2015-09-04', '2015-09-04'),
(461, '402             ', '011-063-402     ', 'TANQUE AVANTY                                               ', 'tanque-avanty', '063             ', '2015-09-04', '2015-09-04'),
(462, '403             ', '011-063-403     ', 'TANQUE DISTINCION                                           ', 'tanque-distincion', '063             ', '2015-09-04', '2015-09-04'),
(463, '404             ', '011-063-404     ', 'TANQUE EDESA                                                ', 'tanque-edesa', '063             ', '2015-09-04', '2015-09-04'),
(464, '405             ', '011-063-405     ', 'TAPA ACUACER                                                ', 'tapa-acuacer', '063             ', '2015-09-04', '2015-09-04'),
(465, '406             ', '011-063-406     ', 'TAPA AVANTY                                                 ', 'tapa-avanty', '063             ', '2015-09-04', '2015-09-04'),
(466, '407             ', '011-063-407     ', 'TAPA DISTINCION                                             ', 'tapa-distincion', '063             ', '2015-09-04', '2015-09-04'),
(467, '408             ', '011-063-408     ', 'TAZA ACUACER                                                ', 'taza-acuacer', '063             ', '2015-09-04', '2015-09-04'),
(468, '409             ', '011-063-409     ', 'TAZA AVANTY                                                 ', 'taza-avanty', '063             ', '2015-09-04', '2015-09-04'),
(469, '410             ', '011-063-410     ', 'TAZA DISTINCION                                             ', 'taza-distincion', '063             ', '2015-09-04', '2015-09-04'),
(470, '411             ', '011-064-411     ', 'PEDESTAL ACUACER                                            ', 'pedestal-acuacer', '064             ', '2015-09-04', '2015-09-04'),
(471, '412             ', '011-064-412     ', 'PEDESTAL AVANTY                                             ', 'pedestal-avanty', '064             ', '2015-09-04', '2015-09-04'),
(472, '413             ', '011-065-413     ', 'REJILLA PLANA                                               ', 'rejilla-plana', '065             ', '2015-09-04', '2015-09-04'),
(473, '414             ', '011-065-414     ', 'REJILLA SIFON ALUMINIO                                      ', 'rejilla-sifon-aluminio', '065             ', '2015-09-04', '2015-09-04'),
(474, '415             ', '011-065-415     ', 'REJILLA TAPA REGISTRO                                       ', 'rejilla-tapa-registro', '065             ', '2015-09-04', '2015-09-04'),
(475, '416             ', '011-065-416     ', 'REJILLA TRAGANTE                                            ', 'rejilla-tragante', '065             ', '2015-09-04', '2015-09-04'),
(476, '417             ', '011-065-417     ', 'REJILLA TUBO ALUMINIO                                       ', 'rejilla-tubo-aluminio', '065             ', '2015-09-04', '2015-09-04'),
(477, '418             ', '011-065-418     ', 'REJILLA TUBO PLASTICO                                       ', 'rejilla-tubo-plastico', '065             ', '2015-09-04', '2015-09-04'),
(478, '419             ', '011-065-419     ', 'REJILLA VENTILACION                                         ', 'rejilla-ventilacion', '065             ', '2015-09-04', '2015-09-04'),
(479, '420             ', '011-065-420     ', 'REPUESTOS                                                   ', 'repuestos', '065             ', '2015-09-04', '2015-09-04'),
(480, '421             ', '011-065-421     ', 'TAPA VALVULA                                                ', 'tapa-valvula', '065             ', '2015-09-04', '2015-09-04'),
(481, '422             ', '011-065-422     ', 'TAPA SIFON                                                  ', 'tapa-sifon', '065             ', '2015-09-04', '2015-09-04'),
(482, '423             ', '011-065-423     ', 'VALVULA POZUELO                                             ', 'valvula-pozuelo', '065             ', '2015-09-04', '2015-09-04'),
(483, '424             ', '011-076-424     ', 'SIFON BOTELLA                                               ', 'sifon-botella', '076             ', '2015-09-04', '2015-09-04'),
(484, '425             ', '011-066-425     ', 'LLAVE BOLA GRINACA                                          ', 'llave-bola-grinaca', '066             ', '2015-09-04', '2015-09-04'),
(485, '426             ', '011-066-426     ', 'LLAVE BOLA ITALY                                            ', 'llave-bola-italy', '066             ', '2015-09-04', '2015-09-04'),
(486, '427             ', '011-066-427     ', 'LLAVE CORTINA                                               ', 'llave-cortina', '066             ', '2015-09-04', '2015-09-04'),
(487, '428             ', '011-066-428     ', 'LLAVE TERMINAL                                              ', 'llave-terminal', '066             ', '2015-09-04', '2015-09-04'),
(488, '429             ', '011-067-429     ', 'VALVULA BOLA PVC LISA                                       ', 'valvula-bola-pvc-lisa', '067             ', '2015-09-04', '2015-09-04'),
(489, '430             ', '011-067-430     ', 'VALVULA BOLA PVC ROSCADA                                    ', 'valvula-bola-pvc-roscada', '067             ', '2015-09-04', '2015-09-04'),
(490, '431             ', '011-067-431     ', 'VALVULA CHEQUE BRONCE                                       ', 'valvula-cheque-bronce', '067             ', '2015-09-04', '2015-09-04'),
(491, '432             ', '011-067-432     ', 'VALVULA FLOTADOR                                            ', 'valvula-flotador', '067             ', '2015-09-04', '2015-09-04'),
(492, '433             ', '011-067-433     ', 'VALVULA PARA GAS                                            ', 'valvula-para-gas', '067             ', '2015-09-04', '2015-09-04'),
(493, '434             ', '011-067-434     ', 'VALVULA PASO DIRECTO                                        ', 'valvula-paso-directo', '067             ', '2015-09-04', '2015-09-04'),
(494, '435             ', '011-067-435     ', 'VALVULA PIE                                                 ', 'valvula-pie', '067             ', '2015-09-04', '2015-09-04'),
(495, '436             ', '011-068-436     ', 'UNIVERSAL PVC LISA                                          ', 'universal-pvc-lisa', '068             ', '2015-09-04', '2015-09-04'),
(496, '437             ', '011-068-437     ', 'UNIVERSAL PVC ROSCADA                                       ', 'universal-pvc-roscada', '068             ', '2015-09-04', '2015-09-04'),
(497, '438             ', '011-069-438     ', 'ACOPLE MANGUERA JARDIN                                      ', 'acople-manguera-jardin', '069             ', '2015-09-04', '2015-09-04'),
(498, '439             ', '011-069-439     ', 'BAJANTE                                                     ', 'bajante', '069             ', '2015-09-04', '2015-09-04'),
(499, '440             ', '011-069-440     ', 'BUJE CAUCHO                                                 ', 'buje-caucho', '069             ', '2015-09-04', '2015-09-04'),
(500, '441             ', '011-069-441     ', 'LLAVE MANGUERA                                              ', 'llave-manguera', '069             ', '2015-09-04', '2015-09-04'),
(501, '442             ', '011-069-442     ', 'LLAVE TELEDUCHA                                             ', 'llave-teleducha', '069             ', '2015-09-04', '2015-09-04'),
(502, '443             ', '011-069-443     ', 'MANIJA LEXA                                                 ', 'manija-lexa', '069             ', '2015-09-04', '2015-09-04'),
(503, '444             ', '011-069-444     ', 'PISTON PLASTICO                                             ', 'piston-plastico', '069             ', '2015-09-04', '2015-09-04'),
(504, '445             ', '011-069-445     ', 'PORTAROLLO                                                  ', 'portarollo', '069             ', '2015-09-04', '2015-09-04'),
(505, '446             ', '011-069-446     ', 'RACOR GAS                                                   ', 'racor-gas', '069             ', '2015-09-04', '2015-09-04'),
(506, '447             ', '011-069-447     ', 'REGULADOR GAS                                               ', 'regulador-gas', '069             ', '2015-09-04', '2015-09-04'),
(507, '448             ', '011-069-448     ', 'SURTIDOR                                                    ', 'surtidor', '069             ', '2015-09-04', '2015-09-04'),
(508, '449             ', '011-069-449     ', 'TAPON                                                       ', 'tapon', '069             ', '2015-09-04', '2015-09-04'),
(509, '450             ', '011-069-450     ', 'TELEDUCHA                                                   ', 'teleducha', '069             ', '2015-09-04', '2015-09-04'),
(510, '451             ', '011-069-451     ', 'TUERCA SIFON                                                ', 'tuerca-sifon', '069             ', '2015-09-04', '2015-09-04'),
(511, '452             ', '011-069-452     ', 'YEE LAVADORA                                                ', 'yee-lavadora', '069             ', '2015-09-04', '2015-09-04'),
(512, '455             ', '011-071-455     ', 'LAVAPLATOS SOCODA                                           ', 'lavaplatos-socoda', '071             ', '2015-09-04', '2015-09-04'),
(513, '456             ', '011-071-456     ', 'LAVAPLATOS FANAINOX                                         ', 'lavaplatos-fanainox', '071             ', '2015-09-04', '2015-09-04'),
(514, '457             ', '011-071-457     ', 'LAVAPLATOS ALUMINIO                                         ', 'lavaplatos-aluminio', '071             ', '2015-09-04', '2015-09-04'),
(515, '458             ', '011-071-458     ', 'LAVAPLATOS HIERRO BRILLADO                                  ', 'lavaplatos-hierro-brillado', '071             ', '2015-09-04', '2015-09-04'),
(516, '459             ', '011-071-459     ', 'LAVAPLATOS HIERRO COLADO                                    ', 'lavaplatos-hierro-colado', '071             ', '2015-09-04', '2015-09-04'),
(517, '460             ', '011-072-460     ', 'LAVADEROS CEMENTO                                           ', 'lavaderos-cemento', '072             ', '2015-09-04', '2015-09-04'),
(518, '461             ', '011-072-461     ', 'LAVADEROS GRANITO                                           ', 'lavaderos-granito', '072             ', '2015-09-04', '2015-09-04'),
(519, '462             ', '011-072-462     ', 'PILA CEMENTO                                                ', 'pila-cemento', '072             ', '2015-09-04', '2015-09-04'),
(520, '463             ', '011-072-463     ', 'REFREGADERO CEMENTO                                         ', 'refregadero-cemento', '072             ', '2015-09-04', '2015-09-04'),
(521, '464             ', '011-073-464     ', 'JUEGO INCRUSTACIONES EDESA                                  ', 'juego-incrustaciones-edesa', '073             ', '2015-09-04', '2015-09-04'),
(522, '465             ', '011-073-465     ', 'JUEGO INCRUSTACIONES ASTRO                                  ', 'juego-incrustaciones-astro', '073             ', '2015-09-04', '2015-09-04'),
(523, '466             ', '011-073-466     ', 'JUEGO INCRUSTACIONES GRIVAL                                 ', 'juego-incrustaciones-grival', '073             ', '2015-09-04', '2015-09-04'),
(524, '467             ', '011-074-467     ', 'ACCESORIOS BOLA BRONCE                                      ', 'accesorios-bola-bronce', '074             ', '2015-09-04', '2015-09-04'),
(525, '468             ', '011-074-468     ', 'ACCESORIOS VARILLA                                          ', 'accesorios-varilla', '074             ', '2015-09-04', '2015-09-04'),
(526, '469             ', '011-074-469     ', 'ACOPLE MACHO ALUMINIO                                       ', 'acople-macho-aluminio', '074             ', '2015-09-04', '2015-09-04'),
(527, '470             ', '011-074-470     ', 'ACOPLE VALVULA                                              ', 'acople-valvula', '074             ', '2015-09-04', '2015-09-04'),
(528, '471             ', '011-074-471     ', 'CHEQUE CILINDRO                                             ', 'cheque-cilindro', '074             ', '2015-09-04', '2015-09-04'),
(529, '472             ', '011-074-472     ', 'FLANCHE                                                     ', 'flanche', '074             ', '2015-09-04', '2015-09-04'),
(530, '473             ', '011-074-473     ', 'TEES ROSCA ALUMINIO                                         ', 'tees-rosca-aluminio', '074             ', '2015-09-04', '2015-09-04'),
(531, '474             ', '011-074-474     ', 'UNIONES DE ALUMINIO                                         ', 'uniones-de-aluminio', '074             ', '2015-09-04', '2015-09-04'),
(532, '475             ', '011-075-475     ', 'CANASTILLA GRIVAL                                           ', 'canastilla-grival', '075             ', '2015-09-04', '2015-09-04'),
(533, '476             ', '011-079-476     ', 'CARTUCHOS                                                   ', 'cartuchos', '079             ', '2015-09-04', '2015-09-04'),
(534, '477             ', '011-075-477     ', 'ESCUDOS                                                     ', 'escudos', '075             ', '2015-09-04', '2015-09-04'),
(535, '478             ', '011-075-478     ', 'FILTRO VALVULA                                              ', 'filtro-valvula', '075             ', '2015-09-04', '2015-09-04'),
(536, '479             ', '011-075-479     ', 'GRIFERIA LAVAPLATOS                                         ', 'griferia-lavaplatos', '075             ', '2015-09-04', '2015-09-04'),
(537, '480             ', '011-075-480     ', 'PIN CANASTILLA                                              ', 'pin-canastilla', '075             ', '2015-09-04', '2015-09-04'),
(538, '482             ', '011-076-482     ', 'DESAGUE                                                     ', 'desague', '076             ', '2015-09-04', '2015-09-04'),
(539, '483             ', '011-075-483     ', 'EMPAQUE                                                     ', 'empaque', '075             ', '2015-09-04', '2015-09-04'),
(540, '484             ', '011-076-484     ', 'GRIFERIA LAVAMANOS                                          ', 'griferia-lavamanos', '076             ', '2015-09-04', '2015-09-04'),
(541, '485             ', '011-076-485     ', 'TAPON DECORATIVO GRIVAL                                     ', 'tapon-decorativo-grival', '076             ', '2015-09-04', '2015-09-04'),
(542, '487             ', '011-077-487     ', 'DUCHA LIS                                                   ', 'ducha-lis', '077             ', '2015-09-04', '2015-09-04'),
(543, '488             ', '011-077-488     ', 'DUCHA FENIX                                                 ', 'ducha-fenix', '077             ', '2015-09-04', '2015-09-04'),
(544, '489             ', '011-077-489     ', 'DUCHA LOIRA                                                 ', 'ducha-loira', '077             ', '2015-09-04', '2015-09-04'),
(545, '490             ', '011-077-490     ', 'DUCHA VENTO                                                 ', 'ducha-vento', '077             ', '2015-09-04', '2015-09-04'),
(546, '491             ', '011-077-491     ', 'DUCHA PISCIS                                                ', 'ducha-piscis', '077             ', '2015-09-04', '2015-09-04'),
(547, '492             ', '011-077-492     ', 'DUCHA PRYSMA                                                ', 'ducha-prysma', '077             ', '2015-09-04', '2015-09-04'),
(548, '493             ', '011-077-493     ', 'DUCHA GALAXIA                                               ', 'ducha-galaxia', '077             ', '2015-09-04', '2015-09-04'),
(549, '494             ', '011-077-494     ', 'DUCHA OPERA                                                 ', 'ducha-opera', '077             ', '2015-09-04', '2015-09-04'),
(550, '495             ', '011-077-495     ', 'DUCHA BRIZA                                                 ', 'ducha-briza', '077             ', '2015-09-04', '2015-09-04'),
(551, '496             ', '011-077-496     ', 'DUCHA RIO                                                   ', 'ducha-rio', '077             ', '2015-09-04', '2015-09-04'),
(552, '497             ', '011-077-497     ', 'ESFERA CRUCETA                                              ', 'esfera-cruceta', '077             ', '2015-09-04', '2015-09-04'),
(553, '498             ', '011-077-498     ', 'EMPAQUE DUCHA                                               ', 'empaque-ducha', '077             ', '2015-09-04', '2015-09-04'),
(554, '499             ', '011-077-499     ', 'ESCUDOS DUCHA                                               ', 'escudos-ducha', '077             ', '2015-09-04', '2015-09-04'),
(555, '500             ', '011-077-500     ', 'REGADERA                                                    ', 'regadera', '077             ', '2015-09-04', '2015-09-04'),
(556, '501             ', '011-078-501     ', 'ASIENTO SANITARIO ECONOMICO                                 ', 'asiento-sanitario-economico', '078             ', '2015-09-04', '2015-09-04'),
(557, '502             ', '011-078-502     ', 'ASIENTO SANITARIO GRIVAL                                    ', 'asiento-sanitario-grival', '078             ', '2015-09-04', '2015-09-04'),
(558, '503             ', '011-078-503     ', 'CASQUETES                                                   ', 'casquetes', '078             ', '2015-09-04', '2015-09-04'),
(559, '504             ', '011-078-504     ', 'CEPILLERA GRIVAL                                            ', 'cepillera-grival', '078             ', '2015-09-04', '2015-09-04'),
(560, '505             ', '011-078-505     ', 'PISTON                                                      ', 'piston', '078             ', '2015-09-04', '2015-09-04'),
(561, '506             ', '011-078-506     ', 'CORDON NYLON                                                ', 'cordon-nylon', '078             ', '2015-09-04', '2015-09-04'),
(562, '507             ', '011-078-507     ', 'DISCO ASIENTO                                               ', 'disco-asiento', '078             ', '2015-09-04', '2015-09-04'),
(563, '508             ', '011-078-508     ', 'DISPENSADOR                                                 ', 'dispensador', '078             ', '2015-09-04', '2015-09-04'),
(564, '509             ', '011-078-509     ', 'FLOTADOR                                                    ', 'flotador', '078             ', '2015-09-04', '2015-09-04'),
(565, '510             ', '011-078-510     ', 'FLUXOMETRO                                                  ', 'fluxometro', '078             ', '2015-09-04', '2015-09-04'),
(566, '511             ', '011-078-511     ', 'GRIFERIA ORINAL                                             ', 'griferia-orinal', '078             ', '2015-09-04', '2015-09-04'),
(567, '512             ', '011-078-512     ', 'HERRAJE                                                     ', 'herraje', '078             ', '2015-09-04', '2015-09-04'),
(568, '513             ', '011-078-513     ', 'JUEGO ACCESORIOS                                            ', 'juego-accesorios', '078             ', '2015-09-04', '2015-09-04'),
(569, '514             ', '011-078-514     ', 'PALANCA                                                     ', 'palanca', '078             ', '2015-09-04', '2015-09-04'),
(570, '515             ', '011-078-515     ', 'TELEDUCHA GRIVAL                                            ', 'teleducha-grival', '078             ', '2015-09-04', '2015-09-04'),
(571, '516             ', '011-079-516     ', 'EXTRACTOR                                                   ', 'extractor', '079             ', '2015-09-04', '2015-09-04'),
(572, '517             ', '011-078-517     ', 'VALVULA REGULACION                                          ', 'valvula-regulacion', '078             ', '2015-09-04', '2015-09-04'),
(573, '518             ', '011-079-518     ', 'MANGUERAS GRIVAL                                            ', 'mangueras-grival', '079             ', '2015-09-04', '2015-09-04'),
(574, '519             ', '011-079-519     ', 'MANIJAS                                                     ', 'manijas', '079             ', '2015-09-04', '2015-09-04'),
(575, '520             ', '011-079-520     ', 'NARIZ                                                       ', 'nariz', '079             ', '2015-09-04', '2015-09-04'),
(576, '521             ', '011-079-521     ', 'REJILLA GRIVAL                                              ', 'rejilla-grival', '079             ', '2015-09-04', '2015-09-04'),
(577, '522             ', '011-079-522     ', 'REPUESTOS GRIVAL                                            ', 'repuestos-grival', '079             ', '2015-09-04', '2015-09-04'),
(578, '523             ', '011-079-523     ', 'SELLO LENGUETA                                              ', 'sello-lengueta', '079             ', '2015-09-04', '2015-09-04'),
(579, '524             ', '011-079-524     ', 'SIFON                                                       ', 'sifon', '079             ', '2015-09-04', '2015-09-04'),
(580, '525             ', '011-079-525     ', 'TORNILLO GRIVAL                                             ', 'tornillo-grival', '079             ', '2015-09-04', '2015-09-04'),
(581, '526             ', '011-079-526     ', 'TUERCA                                                      ', 'tuerca', '079             ', '2015-09-04', '2015-09-04'),
(582, '527             ', '011-080-527     ', 'LLAVE AUTOMATICA                                            ', 'llave-automatica', '080             ', '2015-09-04', '2015-09-04'),
(583, '528             ', '011-080-528     ', 'LLAVE INDIVIDUAL                                            ', 'llave-individual', '080             ', '2015-09-04', '2015-09-04'),
(584, '529             ', '011-080-529     ', 'LLAVE TERMINAL GRIVAL                                       ', 'llave-terminal-grival', '080             ', '2015-09-04', '2015-09-04'),
(585, '530             ', '011-081-530     ', 'ARBOL DE ENTRADA                                            ', 'arbol-de-entrada', '081             ', '2015-09-04', '2015-09-04'),
(586, '531             ', '011-081-531     ', 'DESAGUE GRIFOS Y PARTES                                     ', 'desague-grifos-y-partes', '081             ', '2015-09-04', '2015-09-04'),
(587, '532             ', '011-081-532     ', 'CANASTILLAS ECONOMICA                                       ', 'canastillas-economica', '081             ', '2015-09-04', '2015-09-04'),
(588, '533             ', '011-081-533     ', 'SIFON ECONOMICO                                             ', 'sifon-economico', '081             ', '2015-09-04', '2015-09-04'),
(589, '534             ', '011-081-534     ', 'SOSCO ECONOMICO                                             ', 'sosco-economico', '081             ', '2015-09-04', '2015-09-04'),
(590, '535             ', '011-082-535     ', 'CEPILLERA ASTRO                                             ', 'cepillera-astro', '082             ', '2015-09-04', '2015-09-04'),
(591, '536             ', '011-082-536     ', 'DUCHA ASTRO                                                 ', 'ducha-astro', '082             ', '2015-09-04', '2015-09-04'),
(592, '537             ', '011-082-537     ', 'GANCHO DOBLE                                                ', 'gancho-doble', '082             ', '2015-09-04', '2015-09-04'),
(593, '538             ', '011-082-538     ', 'JABONERA DUCHA                                              ', 'jabonera-ducha', '082             ', '2015-09-04', '2015-09-04'),
(594, '539             ', '011-082-539     ', 'JABONERA LAVAMANOS                                          ', 'jabonera-lavamanos', '082             ', '2015-09-04', '2015-09-04'),
(595, '540             ', '011-082-540     ', 'PAPELERA ASTRO                                              ', 'papelera-astro', '082             ', '2015-09-04', '2015-09-04'),
(596, '541             ', '001-001-541     ', 'RODACHIN                                                    ', 'rodachin', '001             ', '2015-09-04', '2015-09-04'),
(597, '542             ', '001-058-542     ', 'PARILLA AZADORA                                             ', 'parilla-azadora', '058             ', '2015-09-04', '2015-09-04'),
(598, '543             ', '001-058-543     ', 'ACEITES                                                     ', 'aceites', '058             ', '2015-09-04', '2015-09-04'),
(599, '544             ', '001-058-544     ', 'BRILLMETAL                                                  ', 'brillmetal', '058             ', '2015-09-04', '2015-09-04'),
(600, '545             ', '001-058-545     ', 'CINTAS                                                      ', 'cintas', '058             ', '2015-09-04', '2015-09-04'),
(601, '546             ', '001-058-546     ', 'TEFLON                                                      ', 'teflon', '058             ', '2015-09-04', '2015-09-04'),
(602, '547             ', '001-058-547     ', 'ABRAZADERAS                                                 ', 'abrazaderas', '058             ', '2015-09-04', '2015-09-04'),
(603, '548             ', '003-004-548     ', 'TUBO ALUMINIO                                               ', 'tubo-aluminio', '004             ', '2015-09-04', '2015-09-04'),
(604, '549             ', '006-021-549     ', 'CINTA COBRA                                                 ', 'cinta-cobra', '021             ', '2015-09-04', '2015-09-04'),
(605, '550             ', '011-069-550     ', 'CHUPAS                                                      ', 'chupas', '069             ', '2015-09-04', '2015-09-04'),
(606, '551             ', '011-069-551     ', 'GABINETE BANO                                               ', 'gabinete-bano', '069             ', '2015-09-04', '2015-09-04'),
(607, '552             ', '004-014-552     ', 'FIJAMIX                                                     ', 'fijamix', '014             ', '2015-09-04', '2015-09-04'),
(608, '553             ', '004-013-553     ', 'ESQUINERO PLASTICO                                          ', 'esquinero-plastico', '013             ', '2015-09-04', '2015-09-04'),
(609, '554             ', '004-011-554     ', 'ONDULADO INTERMATEX                                         ', 'ondulado-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(610, '555             ', '004-011-555     ', 'PELDANO INTERMATEX                                          ', 'peldano-intermatex', '011             ', '2015-09-04', '2015-09-04'),
(611, '556             ', '006-021-556     ', 'CUCHILLAS ELECTRICAS                                        ', 'cuchillas-electricas', '021             ', '2015-09-04', '2015-09-04'),
(612, '557             ', '003-007-557     ', 'ALCAYATA                                                    ', 'alcayata', '007             ', '2015-09-04', '2015-09-04'),
(613, '558             ', '008-045-558     ', 'CANALES GERFOR                                              ', 'canales-gerfor', '045             ', '2015-09-04', '2015-09-04'),
(614, '559             ', '010-042-559     ', 'VARILLA CUADRADA                                            ', 'varilla-cuadrada', '042             ', '2015-09-04', '2015-09-04'),
(615, '560             ', '005-019-560     ', 'LETRAS Y NUMERO                                             ', 'letras-y-numero', '019             ', '2015-09-04', '2015-09-04'),
(616, '561             ', '002-034-561     ', 'ADITIVOS PARA CEMENTO                                       ', 'aditivos-para-cemento', '034             ', '2015-09-04', '2015-09-04'),
(617, '562             ', '002-034-562     ', 'ADITIVOS PARA MORTEROS                                      ', 'aditivos-para-morteros', '034             ', '2015-09-04', '2015-09-04'),
(618, '563             ', '002-034-563     ', 'ADITIVOS Y ADICIONES MORTEROS                               ', 'aditivos-y-adiciones-morteros', '034             ', '2015-09-04', '2015-09-04'),
(619, '564             ', '002-034-564     ', 'CURADORES Y DESENCOFRANTES                                  ', 'curadores-y-desencofrantes', '034             ', '2015-09-04', '2015-09-04'),
(620, '565             ', '002-034-565     ', 'MORTEROS LISTOS                                             ', 'morteros-listos', '034             ', '2015-09-04', '2015-09-04'),
(621, '566             ', '002-034-566     ', 'MORTEROS LISTOS MODIFICADOS                                 ', 'morteros-listos-modificados', '034             ', '2015-09-04', '2015-09-04'),
(622, '567             ', '002-034-567     ', 'ADHESIVOS EPOXICOS                                          ', 'adhesivos-epoxicos', '034             ', '2015-09-04', '2015-09-04'),
(623, '568             ', '002-034-568     ', 'IMPERMEABILIZANTES Y LIMPIADOR                              ', 'impermeabilizantes-y-limpiador', '034             ', '2015-09-04', '2015-09-04'),
(624, '569             ', '002-089-569     ', 'INMUNIZANTES PARA MADERAS                                   ', 'inmunizantes-para-maderas', '089             ', '2015-09-04', '2015-09-04'),
(625, '570             ', '002-034-570     ', 'SILICONAS SIKA                                              ', 'siliconas-sika', '034             ', '2015-09-04', '2015-09-04'),
(626, '571             ', '002-034-571     ', 'POLIURETANOS Y SELLOS                                       ', 'poliuretanos-y-sellos', '034             ', '2015-09-04', '2015-09-04'),
(627, '572             ', '002-034-572     ', 'HERRAMIENTAS SIKA                                           ', 'herramientas-sika', '034             ', '2015-09-04', '2015-09-04'),
(628, '573             ', '001-003-573     ', 'MARTILLO                                                    ', 'martillo', '003             ', '2015-09-04', '2015-09-04'),
(629, '574             ', '001-058-574     ', 'CABOS                                                       ', 'cabos', '058             ', '2015-09-04', '2015-09-04'),
(630, '575             ', '001-058-575     ', 'CORREAS AMARRES                                             ', 'correas-amarres', '058             ', '2015-09-04', '2015-09-04'),
(631, '576             ', '001-058-576     ', 'ESCOBAS                                                     ', 'escobas', '058             ', '2015-09-04', '2015-09-04'),
(632, '577             ', '001-056-577     ', 'GRATA                                                       ', 'grata', '056             ', '2015-09-04', '2015-09-04'),
(633, '578             ', '001-058-578     ', 'LAPIZ                                                       ', 'lapiz', '058             ', '2015-09-04', '2015-09-04'),
(634, '579             ', '001-059-579     ', 'ACCESORIO MANGUERA                                          ', 'accesorio-manguera', '059             ', '2015-09-04', '2015-09-04'),
(635, '580             ', '001-058-580     ', 'LINTERNA                                                    ', 'linterna', '058             ', '2015-09-04', '2015-09-04');
INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(636, '581             ', '001-058-581     ', 'PULPOS                                                      ', 'pulpos', '058             ', '2015-09-04', '2015-09-04'),
(637, '582             ', '011-073-582     ', 'ALAMEDA                                                     ', 'alameda', '073             ', '2015-09-04', '2015-09-04'),
(638, '583             ', '011-062-583     ', 'VERONA                                                      ', 'verona', '062             ', '2015-09-04', '2015-09-04'),
(639, '584             ', '011-062-584     ', 'MILANO                                                      ', 'milano', '062             ', '2015-09-04', '2015-09-04'),
(640, '585             ', '011-072-585     ', 'LAVATRAPEROS                                                ', 'lavatraperos', '072             ', '2015-09-04', '2015-09-04'),
(641, '586             ', '011-074-586     ', 'REGISTRO INCORPORACION                                      ', 'registro-incorporacion', '074             ', '2015-09-04', '2015-09-04'),
(642, '587             ', '011-082-587     ', 'TOALLERO                                                    ', 'toallero', '082             ', '2015-09-04', '2015-09-04'),
(643, '588             ', '011-077-588     ', 'DUCHA MONACO                                                ', 'ducha-monaco', '077             ', '2015-09-04', '2015-09-04'),
(644, '589             ', '011-077-589     ', 'DUCHA VIENA                                                 ', 'ducha-viena', '077             ', '2015-09-04', '2015-09-04'),
(645, '590             ', '011-077-590     ', 'DUCHA ATHENAS                                               ', 'ducha-athenas', '077             ', '2015-09-04', '2015-09-04'),
(646, '591             ', '011-077-591     ', 'DUCHA FLORENCIA                                             ', 'ducha-florencia', '077             ', '2015-09-04', '2015-09-04'),
(647, '592             ', '011-077-592     ', 'DUCHA GAVIOTA                                               ', 'ducha-gaviota', '077             ', '2015-09-04', '2015-09-04'),
(648, '593             ', '011-077-593     ', 'DUCHA GIRO                                                  ', 'ducha-giro', '077             ', '2015-09-04', '2015-09-04'),
(649, '594             ', '011-077-594     ', 'DUCHA MAGNA                                                 ', 'ducha-magna', '077             ', '2015-09-04', '2015-09-04'),
(650, '595             ', '011-077-595     ', 'DUCHA MARRUECOS                                             ', 'ducha-marruecos', '077             ', '2015-09-04', '2015-09-04'),
(651, '596             ', '011-077-596     ', 'DUCHA BAHIA                                                 ', 'ducha-bahia', '077             ', '2015-09-04', '2015-09-04'),
(652, '597             ', '011-077-597     ', 'DUCHA NOVO                                                  ', 'ducha-novo', '077             ', '2015-09-04', '2015-09-04'),
(653, '598             ', '011-077-598     ', 'DUCHA OSIRIS                                                ', 'ducha-osiris', '077             ', '2015-09-04', '2015-09-04'),
(654, '599             ', '011-077-599     ', 'DUCHA SIRENA                                                ', 'ducha-sirena', '077             ', '2015-09-04', '2015-09-04'),
(655, '600             ', '011-077-600     ', 'DUCHA STYLO                                                 ', 'ducha-stylo', '077             ', '2015-09-04', '2015-09-04'),
(656, '601             ', '011-077-601     ', 'DUCHA VICTORIA                                              ', 'ducha-victoria', '077             ', '2015-09-04', '2015-09-04'),
(657, '602             ', '011-077-602     ', 'DUCHA KADIZ                                                 ', 'ducha-kadiz', '077             ', '2015-09-04', '2015-09-04'),
(658, '603             ', '011-070-603     ', 'EMPAQUES LAVAMANOS LAVAPLATOS                               ', 'empaques-lavamanos-lavaplatos', '070             ', '2015-09-04', '2015-09-04'),
(659, '604             ', '011-070-604     ', 'EMPAQUE SANITARIO TANQUE                                    ', 'empaque-sanitario-tanque', '070             ', '2015-09-04', '2015-09-04'),
(660, '605             ', '011-070-605     ', 'EMPAQUES VARIOS                                             ', 'empaques-varios', '070             ', '2015-09-04', '2015-09-04'),
(661, '606             ', '011-081-606     ', 'GRAPAS GRIFOS Y PARTES                                      ', 'grapas-grifos-y-partes', '081             ', '2015-09-04', '2015-09-04'),
(662, '607             ', '011-081-607     ', 'GRICOL                                                      ', 'gricol', '081             ', '2015-09-04', '2015-09-04'),
(663, '608             ', '011-081-608     ', 'HERRAJE GRIFOS                                              ', 'herraje-grifos', '081             ', '2015-09-04', '2015-09-04'),
(664, '609             ', '011-081-609     ', 'ROCIADOR GRIFOS                                             ', 'rociador-grifos', '081             ', '2015-09-04', '2015-09-04'),
(665, '610             ', '011-081-610     ', 'REPUESTOS GRIFOS                                            ', 'repuestos-grifos', '081             ', '2015-09-04', '2015-09-04'),
(666, '611             ', '011-081-611     ', 'VALVULA GRIFOS                                              ', 'valvula-grifos', '081             ', '2015-09-04', '2015-09-04'),
(667, '612             ', '011-074-612     ', 'YEES                                                        ', 'yees', '074             ', '2015-09-04', '2015-09-04'),
(668, '613             ', '011-075-613     ', 'AIREADOR                                                    ', 'aireador', '075             ', '2015-09-04', '2015-09-04'),
(669, '614             ', '011-076-614     ', 'BONETE                                                      ', 'bonete', '076             ', '2015-09-04', '2015-09-04'),
(670, '615             ', '011-077-615     ', 'REPUESTOS DUCHAS                                            ', 'repuestos-duchas', '077             ', '2015-09-04', '2015-09-04'),
(671, '616             ', '011-078-616     ', 'REPUESTOS SANITARIOS                                        ', 'repuestos-sanitarios', '078             ', '2015-09-04', '2015-09-04'),
(672, '617             ', '011-075-617     ', 'CUERPO                                                      ', 'cuerpo', '075             ', '2015-09-04', '2015-09-04'),
(673, '618             ', '011-076-618     ', 'GRAPAS GRIVAL                                               ', 'grapas-grival', '076             ', '2015-09-04', '2015-09-04'),
(674, '619             ', '011-078-619     ', 'GRIFERIA SANITARIA                                          ', 'griferia-sanitaria', '078             ', '2015-09-04', '2015-09-04'),
(675, '620             ', '011-078-620     ', 'HERRAMIENTA SANITARIA                                       ', 'herramienta-sanitaria', '078             ', '2015-09-04', '2015-09-04'),
(676, '621             ', '011-077-621     ', 'MEZCLADOR DUCHA                                             ', 'mezclador-ducha', '077             ', '2015-09-04', '2015-09-04'),
(677, '622             ', '011-082-622     ', 'PERCHAS GRIVAL                                              ', 'perchas-grival', '082             ', '2015-09-04', '2015-09-04'),
(678, '623             ', '011-082-623     ', 'PORTAROLLO GRIVAL                                           ', 'portarollo-grival', '082             ', '2015-09-04', '2015-09-04'),
(679, '624             ', '011-084-624     ', 'VALVULAS REGULACION                                         ', 'valvulas-regulacion', '084             ', '2015-09-04', '2015-09-04'),
(680, '625             ', '011-077-625     ', 'REGISTRO DUCHA                                              ', 'registro-ducha', '077             ', '2015-09-04', '2015-09-04'),
(681, '626             ', '011-084-626     ', 'VALVULA CONTROL                                             ', 'valvula-control', '084             ', '2015-09-04', '2015-09-04'),
(682, '627             ', '011-076-627     ', 'REPUESTOS LAVAMANOS                                         ', 'repuestos-lavamanos', '076             ', '2015-09-04', '2015-09-04'),
(683, '628             ', '011-075-628     ', 'REPUESTOS LAVAPLATOS                                        ', 'repuestos-lavaplatos', '075             ', '2015-09-04', '2015-09-04'),
(684, '629             ', '011-069-629     ', 'PONCHERA                                                    ', 'ponchera', '069             ', '2015-09-04', '2015-09-04'),
(685, '630             ', '011-075-630     ', 'EMPAQUES LAVAPLATOS                                         ', 'empaques-lavaplatos', '075             ', '2015-09-04', '2015-09-04'),
(686, '631             ', '011-076-631     ', 'ESCUDOS LAVAMANOS                                           ', 'escudos-lavamanos', '076             ', '2015-09-04', '2015-09-04'),
(687, '632             ', '011-066-632     ', 'LLAVE GRICOL                                                ', 'llave-gricol', '066             ', '2015-09-04', '2015-09-04'),
(688, '633             ', '011-066-633     ', 'LLAVE ANTIFRAUDE                                            ', 'llave-antifraude', '066             ', '2015-09-04', '2015-09-04'),
(689, '634             ', '010-039-634     ', 'TEJA LUMINIT                                                ', 'teja-luminit', '039             ', '2015-09-04', '2015-09-04'),
(690, '635             ', '011-081-635     ', 'INALGRIFOS                                                  ', 'inalgrifos', '081             ', '2015-09-04', '2015-09-04'),
(691, '636             ', '009-055-636     ', 'DILATACIONES                                                ', 'dilataciones', '055             ', '2015-09-04', '2015-09-04'),
(692, '637             ', '009-047-637     ', 'TABLA                                                       ', 'tabla', '047             ', '2015-09-04', '2015-09-04'),
(693, '638             ', '009-046-638     ', 'LISTON                                                      ', 'liston', '046             ', '2015-09-04', '2015-09-04'),
(694, '639             ', '003-007-639     ', 'GANCHOS                                                     ', 'ganchos', '007             ', '2015-09-04', '2015-09-04'),
(695, '640             ', '001-058-640     ', 'ESTOPAS                                                     ', 'estopas', '058             ', '2015-09-04', '2015-09-04'),
(696, '641             ', '001-058-641     ', 'LLAVE JARDIN                                                ', 'llave-jardin', '058             ', '2015-09-04', '2015-09-04'),
(697, '642             ', '010-036-642     ', 'ESQUINEROS                                                  ', 'esquineros', '036             ', '2015-09-04', '2015-09-04'),
(698, '643             ', '009-054-643     ', 'VARA REDONDA                                                ', 'vara-redonda', '054             ', '2015-09-04', '2015-09-04'),
(699, '644             ', '009-048-644     ', 'CANABRAVA                                                   ', 'canabrava', '048             ', '2015-09-04', '2015-09-04'),
(700, '645             ', '002-085-645     ', 'IMPERMEABILIZANTE ACRILICO                                  ', 'impermeabilizante-acrilico', '085             ', '2015-09-04', '2015-09-04'),
(701, '646             ', '009-052-646     ', 'POSTES DE MADERA                                            ', 'postes-de-madera', '052             ', '2015-09-04', '2015-09-04'),
(702, '647             ', '014-087-647     ', 'ROSCA                                                       ', 'rosca', '087             ', '2015-09-04', '2015-09-04'),
(703, '648             ', '012-083-648     ', 'LADRILLO EN CONSIGNACION                                    ', 'ladrillo-en-consignacion', '083             ', '2015-09-04', '2015-09-04'),
(704, '649             ', '011-062-649     ', 'REPUESTOS LAVAMANOS VARIOS                                  ', 'repuestos-lavamanos-varios', '062             ', '2015-09-04', '2015-09-04'),
(705, '650             ', '004-012-650     ', 'VITRIBLOCK                                                  ', 'vitriblock', '012             ', '2015-09-04', '2015-09-04'),
(706, '651             ', '001-058-651     ', 'SIERRAS                                                     ', 'sierras', '058             ', '2015-09-04', '2015-09-04'),
(707, '652             ', '011-071-652     ', 'REPUESTOS LAVAPLAT                                          ', 'repuestos-lavaplat', '071             ', '2015-09-04', '2015-09-04'),
(708, '653             ', '011-069-653     ', 'PALANCA SANITARIA                                           ', 'palanca-sanitaria', '069             ', '2015-09-04', '2015-09-04'),
(709, '654             ', '011-073-654     ', 'JUEGO INCRUSTACIONES ECONIMICA                              ', 'juego-incrustaciones-econimica', '073             ', '2015-09-04', '2015-09-04'),
(710, '655             ', '005-019-655     ', 'ARGOLLAS                                                    ', 'argollas', '019             ', '2015-09-04', '2015-09-04'),
(711, '656             ', '011-069-656     ', 'BOYA                                                        ', 'boya', '069             ', '2015-09-04', '2015-09-04'),
(712, '657             ', '001-088-657     ', 'MACHETE                                                     ', 'machete', '088             ', '2015-09-04', '2015-09-04'),
(713, '658             ', '010-036-658     ', 'RETAL CORALINA                                              ', 'retal-coralina', '036             ', '2015-09-04', '2015-09-04'),
(714, '659             ', '010-036-659     ', 'TUBERIA                                                     ', 'tuberia', '036             ', '2015-09-04', '2015-09-04'),
(715, '660             ', '006-021-660     ', 'SIRENA                                                      ', 'sirena', '021             ', '2015-09-04', '2015-09-04'),
(716, '661             ', '004-090-661     ', 'LISTELO CONSTRUCCIONES                                      ', 'listelo-construcciones', '090             ', '2015-09-04', '2015-09-04'),
(717, '662             ', '003-091-662     ', 'NEVERA                                                      ', 'nevera', '091             ', '2015-09-04', '2015-09-04'),
(718, '663             ', '009-049-663     ', 'MACHIMBRE                                                   ', 'machimbre', '049             ', '2015-09-04', '2015-09-04'),
(719, '664             ', '008-044-664     ', 'UNION PLATINO                                               ', 'union-platino', '044             ', '2015-09-04', '2015-09-04'),
(720, '665             ', '003-091-665     ', 'ASPIRADORA                                                  ', 'aspiradora', '091             ', '2015-09-04', '2015-09-04'),
(721, '666             ', '003-091-666     ', 'COLCHON                                                     ', 'colchon', '091             ', '2015-09-04', '2015-09-04'),
(722, '667             ', '009-092-667     ', 'LAMINAS                                                     ', 'laminas', '092             ', '2015-09-04', '2015-09-04'),
(723, '668             ', '006-023-668     ', 'BOMBILLOS EG LIGHTING                                       ', 'bombillos-eg-lighting', '023             ', '2015-09-04', '2015-09-04'),
(724, '669             ', '001-088-669     ', 'AZADON EXENTO                                               ', 'azadon-exento', '088             ', '2015-09-04', '2015-09-04'),
(725, '670             ', '011-094-670     ', 'ACCESORIO SANITARIO GRIVAL                                  ', 'accesorio-sanitario-grival', '094             ', '2015-09-04', '2015-09-04'),
(726, '671             ', '011-094-671     ', 'COMPLEMENTOS GRIVAL                                         ', 'complementos-grival', '094             ', '2015-09-04', '2015-09-04'),
(727, '672             ', '011-094-672     ', 'ACCESORIOS LAVAMANOS GRIVAL                                 ', 'accesorios-lavamanos-grival', '094             ', '2015-09-04', '2015-09-04'),
(728, '673             ', '011-094-673     ', 'ACCESORIOS LAVAPLATOS GRIVAL                                ', 'accesorios-lavaplatos-grival', '094             ', '2015-09-04', '2015-09-04'),
(729, '674             ', '011-094-674     ', 'RESPUESTOS GRIVAL                                           ', 'respuestos-grival', '094             ', '2015-09-04', '2015-09-04'),
(730, '675             ', '011-094-675     ', 'ACCESORIO DUCHA GRIVAL                                      ', 'accesorio-ducha-grival', '094             ', '2015-09-04', '2015-09-04'),
(731, '676             ', '011-094-676     ', 'INCRUSTACIONES INDIVIDUALES GR                              ', 'incrustaciones-individuales-gr', '094             ', '2015-09-04', '2015-09-04'),
(732, '677             ', '011-094-677     ', 'LLAVES TERMINAL GRIVAL                                      ', 'llaves-terminal-grival', '094             ', '2015-09-04', '2015-09-04'),
(733, '678             ', '013-095-678     ', 'CEMENTO GRIS PENDIENTE                                      ', 'cemento-gris-pendiente', '095             ', '2015-09-04', '2015-09-04'),
(734, '679             ', '008-096-679     ', 'SOLDADURA CELTA                                             ', 'soldadura-celta', '096             ', '2015-09-04', '2015-09-04'),
(735, '680             ', '001-003-680     ', 'CIZALLA                                                     ', 'cizalla', '003             ', '2015-09-04', '2015-09-04'),
(736, '681             ', '005-015-681     ', 'CANDADO LIONS                                               ', 'candado-lions', '015             ', '2015-09-04', '2015-09-04'),
(737, '682             ', '005-015-682     ', 'CANDADOS GOLWALL                                            ', 'candados-golwall', '015             ', '2015-09-04', '2015-09-04'),
(738, '683             ', '001-088-683     ', 'TIJERAS EXENTAS                                             ', 'tijeras-exentas', '088             ', '2015-09-04', '2015-09-04'),
(739, '684             ', '011-062-684     ', 'MARSELLA                                                    ', 'marsella', '062             ', '2015-09-04', '2015-09-04'),
(740, '685             ', '005-019-685     ', 'GRAFITO                                                     ', 'grafito', '019             ', '2015-09-04', '2015-09-04'),
(741, '686             ', '004-012-686     ', 'CENEFAS SICHAR                                              ', 'cenefas-sichar', '012             ', '2015-09-04', '2015-09-04'),
(742, '687             ', '001-003-687     ', 'ENGRASADORA                                                 ', 'engrasadora', '003             ', '2015-09-04', '2015-09-04'),
(743, '688             ', '010-039-688     ', 'TEJA COLOMBIT                                               ', 'teja-colombit', '039             ', '2015-09-04', '2015-09-04'),
(744, '689             ', '010-039-689     ', 'CABALLETE COLOMBIT                                          ', 'caballete-colombit', '039             ', '2015-09-04', '2015-09-04'),
(745, '690             ', '010-039-690     ', 'CLARABOYA COLOMBIT                                          ', 'claraboya-colombit', '039             ', '2015-09-04', '2015-09-04'),
(746, '691             ', '010-039-691     ', 'TANQUE COLOMBIT                                             ', 'tanque-colombit', '039             ', '2015-09-04', '2015-09-04'),
(747, '692             ', '014-097-692     ', 'ALQUILER ESCALERAS                                          ', 'alquiler-escaleras', '097             ', '2015-09-04', '2015-09-04'),
(748, '693             ', '002-098-693     ', 'VINIFLEX TIPO II                                            ', 'viniflex-tipo-ii', '098             ', '2015-09-04', '2015-09-04'),
(749, '694             ', '010-093-694     ', 'TABLETA IVA                                                 ', 'tableta-iva', '093             ', '2015-09-04', '2015-09-04'),
(750, '695             ', '001-099-695     ', 'CUCHILLA GUADA', 'cuchilla-guadana-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(751, '696             ', '001-099-696     ', 'PALAS (IVA 5%)                                              ', 'palas-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(752, '697             ', '001-099-697     ', 'TIJERAS PODAR (IVA 5%)                                      ', 'tijeras-podar-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(753, '698             ', '001-099-698     ', 'AZADON (IVA 5%)                                             ', 'azadon-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(754, '699             ', '001-099-699     ', 'CIZALLA (IVA 5%)                                            ', 'cizalla-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(755, '700             ', '001-099-700     ', 'GUADA', 'guadanadora-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(756, '701             ', '001-099-701     ', 'HACHA (IVA 5%)                                              ', 'hacha-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(757, '702             ', '001-099-702     ', 'MACHETA (IVA 5%)                                            ', 'macheta-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(758, '703             ', '001-099-703     ', 'PICA (IVA 5%)                                               ', 'pica-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(759, '704             ', '001-099-704     ', 'RASTRILLO (IVA 5%)                                          ', 'rastrillo-iva-5', '099             ', '2015-09-04', '2015-09-04'),
(760, '705             ', '014-097-705     ', 'ALQUILERES                                                  ', 'alquileres', '097             ', '2015-09-04', '2015-09-04'),
(761, '780             ', '001-058-780     ', 'POLEAS                                                      ', 'poleas', '058             ', '2015-09-04', '2015-09-04'),
(762, '781', '999-999-999', 'SALDOS INICIALES', 'saldos-iniciales', '100', '2015-09-04', '2015-09-04'),
(763, '782', '006             ', 'BOMBILLO PANEL LED', 'bombillo-panel-led', '023', '2015-09-04', '2015-09-04'),
(764, '783', '001-058    -796', 'DUPLICADO LLAVES', 'duplicado-llaves', '058', '2015-09-04', '2015-09-04'),
(765, '784', '058-035-098', 'HEMBRA', 'hembra', '101', '2015-09-04', '2015-09-04'),
(766, '785', '058-035-065', 'INJERTO', 'injerto', '101', '2015-09-04', '2015-09-04'),
(767, '786', '003             ', 'MOTORES', 'motores', '091', '2015-09-04', '2015-09-04'),
(768, '787', '001-003    -856', 'LLANA DENTADA', 'llana-dentada', '003', '2015-09-04', '2015-09-04'),
(769, '788', '002             ', 'TINTILLA', 'tintilla', '035', '2015-09-04', '2015-09-04'),
(770, '789', '001-058    -087', 'TRAPERO', 'trapero', '058', '2015-09-04', '2015-09-04'),
(771, '790', '011             ', 'COMBO MONTECARLO', 'combo-montecarlo', '060', '2015-09-04', '2015-09-04'),
(772, '791', '012             ', 'TRANSPORTE', 'transporte', '102', '2015-09-04', '2015-09-04'),
(773, '792', '011             ', 'ACOPLES', 'acoples', '074', '2015-09-04', '2015-09-04'),
(774, '793', '005             ', 'CHAPA MUEBLE', 'chapa-mueble', '018', '2015-09-04', '2015-09-04'),
(775, '794', '001-058    -059', 'CALIBRADOR', 'calibrador', '058', '2015-09-04', '2015-09-04'),
(776, '795', '011             ', 'LLAVE LAVADORA', 'llave-lavadora', '084', '2015-09-04', '2015-09-04'),
(777, '797', '022-058-071', 'MUEBLE ESPEJO', 'mueble-espejo', '103', '2015-09-04', '2015-09-04'),
(778, '798', '022-058-072', 'MUEBLE LAVAMANOS', 'mueble-lavamanos', '103', '2015-09-04', '2015-09-04'),
(779, '800', '010-058-954', 'POZO SEPTICO', 'pozo-septico', '104', '2015-09-04', '2015-09-04'),
(780, '801', '001-058    -759', 'GATO HIDRAULICO', 'gato-hidraulico', '058', '2015-09-04', '2015-09-04'),
(781, '802', '001-088    -759', 'CUCHILLA PICAPASTO ', 'cuchilla-picapasto', '088', '2015-09-04', '2015-09-04'),
(782, '803', '001-057    -546', 'YOYO', 'yoyo', '057', '2015-09-04', '2015-09-04'),
(783, '804', '011             ', 'SANITARIO ELONG', 'sanitario-elong', '063', '2015-09-04', '2015-09-04'),
(784, '805', '011             ', 'SANITARIO ELONG', 'sanitario-elong', '105', '2015-09-04', '2015-09-04'),
(785, '806', '001-057    -011', 'BATERIAS', 'baterias', '057', '2015-09-04', '2015-09-04'),
(786, '807', '001-057    -145', 'GRASAS', 'grasas', '057', '2015-09-04', '2015-09-04'),
(787, '808', '001-057    -458', 'TIZA', 'tiza', '057', '2015-09-04', '2015-09-04');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `inventariogrupo`
--

INSERT INTO `inventariogrupo` (`id`, `InvGruCod`, `InvGruId`, `InvGruNom`, `estado`, `created_at`, `updated_at`, `slug_grupo`) VALUES
(1, '001             ', '001', 'HERRAMIENTA', 1, '2015-09-04', '2015-09-04', 'herramienta'),
(2, '002             ', '002             ', 'PINTURAS                                                    ', 1, '2015-09-04', '2015-09-04', 'pinturas'),
(3, '003             ', '003             ', 'ACCESORIOS                                                  ', 1, '2015-09-04', '2015-09-04', 'accesorios'),
(4, '004             ', '004             ', 'CERAMICA                                                    ', 1, '2015-09-04', '2015-09-04', 'ceramica'),
(5, '005             ', '005             ', 'CERRADURA                                                   ', 1, '2015-09-04', '2015-09-04', 'cerradura'),
(6, '006             ', '006             ', 'ELECTRICOS                                                  ', 1, '2015-09-04', '2015-09-04', 'electricos'),
(7, '007             ', '007             ', 'GALVANIZADO                                                 ', 1, '2015-09-04', '2015-09-04', 'galvanizado'),
(8, '008             ', '008             ', 'TUBOS Y ACCESORIOS                                          ', 1, '2015-09-04', '2015-09-04', 'tubos-y-accesorios'),
(9, '009             ', '009             ', 'MADERAS                                                     ', 1, '2015-09-04', '2015-09-04', 'maderas'),
(10, '010             ', '010', 'MATERIALES CONSTRUCCI', 1, '2015-09-04', '2015-09-04', 'materiales-construcci'),
(11, '011             ', '011             ', 'SANITARIOS Y GRIFERIAS                                      ', 1, '2015-09-04', '2015-09-04', 'sanitarios-y-griferias'),
(12, '012             ', '012             ', 'SERVICIOS                                                   ', 1, '2015-09-04', '2015-09-04', 'servicios'),
(13, '013             ', '013             ', 'MATERIALES EN TRANSITO                                      ', 1, '2015-09-04', '2015-09-04', 'materiales-en-transito'),
(14, '014             ', '014             ', 'SERVICIOS GRAVADOS                                          ', 1, '2015-09-04', '2015-09-04', 'servicios-gravados'),
(15, '015', '015', 'osman', 1, '2015-09-04', '2015-09-04', 'osman'),
(16, '15', '999', 'SALDOS INICIALES', 1, '2015-09-04', '2015-09-04', 'saldos-iniciales'),
(17, '17', '058', 'POLIETILENO', 1, '2015-09-04', '2015-09-04', 'polietileno'),
(18, '18', '022', 'MUEBLES', 1, '2015-09-04', '2015-09-04', 'muebles');

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

--
-- Volcado de datos para la tabla `metodo_envio`
--

INSERT INTO `metodo_envio` (`id`, `nom_metodo`, `tiempo_entrega`, `valor`, `created_at`, `updated_at`) VALUES
(1, 'Ruta Camion', 'Ruta', 0, '2015-05-07', '2015-05-07'),
(2, 'INMEDIATO', '60 minutos', 5000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mantis` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pro_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `categoria_id` varchar(16) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `slug` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  `por_iva` int(2) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=369 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_mantis`, `pro_nom`, `categoria_id`, `descripcion`, `slug`, `img`, `precio`, `Estado`, `por_iva`, `cantidad`, `created_at`, `updated_at`) VALUES
(269, '000276', 'MUEBLE BORGONA PARA LAVAMANOS ROBLE CLARO REF 00027', '485             ', '.', 'mueble-borgona-para-lavamanos-roble-claro-ref-00027', 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/tenedor_c430c004f17e474caf0eaa376b31c6cc.jpg', '236982', 1, 16, 0, '2015-09-04', '2015-09-04'),
(270, '010005', 'ARGOLLA CORTINA CAFE 3/4"', '003             ', '.', 'argolla-cortina-cafe-34', 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/Copa-Bordeaux_e8103ce6a4674350b3aaf2b149714e32.jpg', '129', 1, 16, 0, '2015-09-04', '2015-09-04'),
(271, '010134', 'MASILLA DUREPOXI RALLI 50 GRAMOS', '021             ', '.', 'masilla-durepoxi-ralli-50-gramos', 'http://localhost:8080/MantisWeb20erpappweb/PublicTempStorage/multimedia/172_b_36be4bdb5f334817a3360dae56e51e7f.jpg', '1724', 1, 16, 0, '2015-09-04', '2015-09-04'),
(272, '030122              ', 'ANCLAJE METALICO 5/16 * 1.1/2                                                                       ', '120             ', '.', 'anclaje-metalico-516-112', 'http://localhost:8000/img/Mantis/def.png', '344', 1, 16, 0, '2015-09-04', '2015-09-04'),
(273, '924590              ', 'REGADERA OVAL BLANCO                                                                                ', '675             ', '.', 'regadera-oval-blanco', 'http://localhost:8000/img/Mantis/def.png', '11896', 1, 16, 0, '2015-09-04', '2015-09-04'),
(274, '924800              ', 'REGADERA FUNCIONAL CROMO                                                                            ', '675             ', '.', 'regadera-funcional-cromo', 'http://localhost:8000/img/Mantis/def.png', '14310', 1, 16, 0, '2015-09-04', '2015-09-04'),
(275, '931000              ', 'DESAGUE AUTOMATICO PLASTICO CROMO                                                                   ', '672             ', '.', 'desague-automatico-plastico-cromo', 'http://localhost:8000/img/Mantis/def.png', '11120', 1, 16, 0, '2015-09-04', '2015-09-04'),
(276, '931100              ', 'DESAGUE SENCILLO INTEGRADO CON REBOSE CROMO                                                         ', '482             ', '.', 'desague-sencillo-integrado-con-rebose-cromo', 'http://localhost:8000/img/Mantis/def.png', '5431', 1, 16, 0, '2015-09-04', '2015-09-04'),
(277, '931120              ', 'DESAGUE SENCILLO SIN REBOSE CROMO                                                                   ', '672             ', '.', 'desague-sencillo-sin-rebose-cromo', 'http://localhost:8000/img/Mantis/def.png', '5517', 1, 16, 0, '2015-09-04', '2015-09-04'),
(278, '931300              ', 'SIFON BOTELLA NEUTRO.                                                                               ', '672             ', '.', 'sifon-botella-neutro', 'http://localhost:8000/img/Mantis/def.png', '3448', 1, 16, 0, '2015-09-04', '2015-09-04'),
(279, '931320              ', 'KIT EXTENSOR DEL DESAGUE DESAGUE Y SIFONES CROMO                                                    ', '672             ', '.', 'kit-extensor-del-desague-desague-y-sifones-cromo', 'http://localhost:8000/img/Mantis/def.png', '8275', 1, 16, 0, '2015-09-04', '2015-09-04'),
(280, '931430              ', 'DESAGUE + SIFON + GRIFLEX                                                                           ', '511             ', '.', 'desague-sifon-griflex', 'http://localhost:8000/img/Mantis/def.png', '12413', 1, 16, 0, '2015-09-04', '2015-09-04'),
(281, '933000', 'DESAGUE SIFON LAVAMANOS ORINAL GRIS', '672             ', '.', 'desague-sifon-lavamanos-orinal-gris', 'http://localhost:8000/img/Mantis/def.png', '9051', 1, 16, 0, '2015-09-04', '2015-09-04'),
(282, '934100', 'DESVIADOR TELEDUCHA CROMO-', '674             ', '.', 'desviador-teleducha-cromo', 'http://localhost:8000/img/Mantis/def.png', '7543', 1, 16, 0, '2015-09-04', '2015-09-04'),
(283, '030123              ', 'ANCLAJE METALICO 5/16 * 2.1/2                                                                       ', '120             ', '.', 'anclaje-metalico-516-212', 'http://localhost:8000/img/Mantis/def.png', '344', 1, 16, 0, '2015-09-04', '2015-09-04'),
(284, '935000', 'CANASTILLA 4  CON SOSCO GRIVAL - SOCODA', '673             ', '.', 'canastilla-4-con-sosco-grival-socoda', 'http://localhost:8000/img/Mantis/def.png', '6724', 1, 16, 0, '2015-09-04', '2015-09-04'),
(285, '935100              ', 'SIFON EN P NEUTRO.                                                                                  ', '674             ', '.', 'sifon-en-p-neutro', 'http://localhost:8000/img/Mantis/def.png', '3448', 1, 16, 0, '2015-09-04', '2015-09-04'),
(286, '935200              ', 'CANASTILLA 2 CROMO CON SOSCO                                                                       ', '673             ', '.', 'canastilla-2-cromo-con-sosco', 'http://localhost:8000/img/Mantis/def.png', '5258', 1, 16, 0, '2015-09-04', '2015-09-04'),
(287, '935240              ', 'DESAGUE + SIFON                                                                                     ', '590             ', '.', 'desague-sifon', 'http://localhost:8000/img/Mantis/def.png', '8965', 1, 16, 0, '2015-09-04', '2015-09-04'),
(288, '935385              ', 'DESAGUE PUSH GRIVAL SIN REBOSE  CROMO                                                               ', '672             ', '.', 'desague-push-grival-sin-rebose-cromo', 'http://localhost:8000/img/Mantis/def.png', '35517', 1, 16, 0, '2015-09-04', '2015-09-04'),
(289, '935470', 'SIFON FLEXIBLE SENCILLO GRIS', '515             ', '.', 'sifon-flexible-sencillo-gris', 'http://localhost:8000/img/Mantis/def.png', '5862', 1, 16, 0, '2015-09-04', '2015-09-04'),
(290, '935480              ', 'SIFON FLEXIBLE SENCILLO BLANCO                                                                      ', '449             ', '.', 'sifon-flexible-sencillo-blanco', 'http://localhost:8000/img/Mantis/def.png', '5172', 1, 16, 0, '2015-09-04', '2015-09-04'),
(291, '935490', 'SIFON FLEXIBLE SENCILLO METALICO', '449             ', '.', 'sifon-flexible-sencillo-metalico', 'http://localhost:8000/img/Mantis/def.png', '15431', 1, 16, 0, '2015-09-04', '2015-09-04'),
(292, '935900              ', 'CANASTILLA 4 + SIFON EN P                                                                          ', '673             ', '.', 'canastilla-4-sifon-en-p', 'http://localhost:8000/img/Mantis/def.png', '8793', 1, 16, 0, '2015-09-04', '2015-09-04'),
(293, '937143', 'REJILLA REDONDA 3" CROMO GRIVAL', '674             ', '.', 'rejilla-redonda-3-cromo-grival', 'http://localhost:8000/img/Mantis/def.png', '2931', 1, 16, 0, '2015-09-04', '2015-09-04'),
(294, '030124              ', 'ANCLAJE METALICO 5/16 * 3                                                                           ', '120             ', '.', 'anclaje-metalico-516-3', 'http://localhost:8000/img/Mantis/def.png', '344', 1, 16, 0, '2015-09-04', '2015-09-04'),
(295, '937330              ', 'GRIFERIA LAVACABEZAS BIDE DOBLE METALICA                                                            ', '675             ', '.', 'griferia-lavacabezas-bide-doble-metalica', 'http://localhost:8000/img/Mantis/def.png', '62672', 1, 16, 0, '2015-09-04', '2015-09-04'),
(296, '937340              ', 'KIT BIDE CON REGULACION PLASTICA                                                                    ', '675             ', '.', 'kit-bide-con-regulacion-plastica', 'http://localhost:8000/img/Mantis/def.png', '51551', 1, 16, 0, '2015-09-04', '2015-09-04'),
(297, '937400', 'TORNILLO FIJACION GRIFERIA TANQUE METALICO', '674             ', '.', 'tornillo-fijacion-griferia-tanque-metalico', 'http://localhost:8000/img/Mantis/def.png', '4482', 1, 16, 0, '2015-09-04', '2015-09-04'),
(298, '937500              ', 'MANIJA TANQUE SANITARIO CROMO                                                                       ', '674             ', '.', 'manija-tanque-sanitario-cromo', 'http://localhost:8000/img/Mantis/def.png', '6206', 1, 16, 0, '2015-09-04', '2015-09-04'),
(299, '937570              ', 'SIFON BOTELLA FLEXIBLE METALIZADO                                                                   ', '449             ', '.', 'sifon-botella-flexible-metalizado', 'http://localhost:8000/img/Mantis/def.png', '20086', 1, 16, 0, '2015-09-04', '2015-09-04'),
(300, '937580              ', 'SIFON BOTELLA FLEXIBLE PLASTICO TEE                                                                 ', '449             ', '.', 'sifon-botella-flexible-plastico-tee', 'http://localhost:8000/img/Mantis/def.png', '18620', 1, 16, 0, '2015-09-04', '2015-09-04'),
(301, '944934              ', 'GRAPA ENGRAPADORA 1/4 STANLEY-TRA204T                                                               ', '216             ', '.', 'grapa-engrapadora-14-stanley-tra204t', 'http://localhost:8000/img/Mantis/def.png', '5172', 1, 16, 0, '2015-09-04', '2015-09-04'),
(302, '947120              ', 'LLAVE LAVAMANOS DE MESA TIPO PUSH CR                                                                ', '610             ', '.', 'llave-lavamanos-de-mesa-tipo-push-cr', 'http://localhost:8000/img/Mantis/def.png', '96379', 1, 16, 0, '2015-09-04', '2015-09-04'),
(303, '957100', 'VALVULA DE CONTROL 1/2 PASO BRONCE-', '671             ', '.', 'valvula-de-control-12-paso-bronce', 'http://localhost:8000/img/Mantis/def.png', '15000', 1, 16, 0, '2015-09-04', '2015-09-04'),
(304, '957200', 'VALVULA DE CONTROL 1/2 PASO CROMO.', '671             ', '.', 'valvula-de-control-12-paso-cromo', 'http://localhost:8000/img/Mantis/def.png', '18706', 1, 16, 0, '2015-09-04', '2015-09-04'),
(305, '030125              ', 'ANILLO AJUSTADOR DE DISCO EL SOL Nº 17                                                              ', '193             ', '.', 'anillo-ajustador-de-disco-el-sol-no-17', 'http://localhost:8000/img/Mantis/def.png', '517', 1, 16, 0, '2015-09-04', '2015-09-04'),
(306, '958025              ', 'SIKA COLMASOLVENTE EPOXICO GALON                                                                    ', '570             ', '.', 'sika-colmasolvente-epoxico-galon', 'http://localhost:8000/img/Mantis/def.png', '40689', 1, 16, 0, '2015-09-04', '2015-09-04'),
(307, '967000              ', 'REGULACION 1/2 METALICA LAVAMANOS, LAVAPLATOS CROMO (CON MA                                        ', '671             ', '.', 'regulacion-12-metalica-lavamanos-lavaplatos-cromo-con-ma', 'http://localhost:8000/img/Mantis/def.png', '20344', 1, 16, 0, '2015-09-04', '2015-09-04'),
(308, '967050              ', 'REGULACION 1/2 METALICA SANITARIOS CROMO (CON MANGUERA PLAS                                        ', '671             ', '.', 'regulacion-12-metalica-sanitarios-cromo-con-manguera-plas', 'http://localhost:8000/img/Mantis/def.png', '22155', 1, 16, 0, '2015-09-04', '2015-09-04'),
(309, '967150              ', 'REGULACION 1/2 LAVAP Y LAVAM  MANGUERA PLASTICA BLANCO                                             ', '671             ', '.', 'regulacion-12-lavap-y-lavam-manguera-plastica-blanco', 'http://localhost:8000/img/Mantis/def.png', '7931', 1, 16, 0, '2015-09-04', '2015-09-04'),
(310, '967200              ', 'REGULACION 1/2 METALICA LAVAMANOS, LAVAPLATOS SATINADO (CON                                        ', '671             ', '.', 'regulacion-12-metalica-lavamanos-lavaplatos-satinado-con', 'http://localhost:8000/img/Mantis/def.png', '17327', 1, 16, 0, '2015-09-04', '2015-09-04'),
(311, '967250              ', 'REGULACION 1/2 METALICA SANITARIOS SATINADO (CON MANGUERA P                                        ', '671             ', '.', 'regulacion-12-metalica-sanitarios-satinado-con-manguera-p', 'http://localhost:8000/img/Mantis/def.png', '17327', 1, 16, 0, '2015-09-04', '2015-09-04'),
(312, '967310', 'REGULACION METALICA CRUCETA DOBLE SALIDA', '671             ', '.', 'regulacion-metalica-cruceta-doble-salida', 'http://localhost:8000/img/Mantis/def.png', '21293', 1, 16, 0, '2015-09-04', '2015-09-04'),
(313, '967350              ', 'REGULACION 1/2 SANITARIO PLASTICA MANGUERA BLANCO                                                  ', '671             ', '.', 'regulacion-12-sanitario-plastica-manguera-blanco', 'http://localhost:8000/img/Mantis/def.png', '7931', 1, 16, 0, '2015-09-04', '2015-09-04'),
(314, '977000              ', 'LLAVE TERMINAL LAVAD. CALENTADOR CROMO..                                                            ', '677             ', '.', 'llave-terminal-lavad-calentador-cromo', 'http://localhost:8000/img/Mantis/def.png', '27155', 1, 16, 0, '2015-09-04', '2015-09-04'),
(315, '977100              ', 'LLAVE TERMINAL LAVADORA CALENTADOR BRONCE                                                           ', '677             ', '.', 'llave-terminal-lavadora-calentador-bronce', 'http://localhost:8000/img/Mantis/def.png', '21120', 1, 16, 0, '2015-09-04', '2015-09-04'),
(316, '030127              ', 'ARANDELA PLANA ZIN 1/4 UNIDAD                                                                       ', '121             ', '.', 'arandela-plana-zin-14-unidad', 'http://localhost:8000/img/Mantis/def.png', '51', 1, 16, 0, '2015-09-04', '2015-09-04'),
(317, '977253', 'LLAVE TERMINAL JARDIN PESADA CROMO ECONOMICA.', '677             ', '.', 'llave-terminal-jardin-pesada-cromo-economica', 'http://localhost:8000/img/Mantis/def.png', '15603', 1, 16, 0, '2015-09-04', '2015-09-04'),
(318, '977263              ', 'LLAVE TERMINAL JARDIN PESADA SATIN ECONOMICA.                                                       ', '677             ', '.', 'llave-terminal-jardin-pesada-satin-economica', 'http://localhost:8000/img/Mantis/def.png', '11637', 1, 16, 0, '2015-09-04', '2015-09-04'),
(319, '977300              ', 'LLAVE TERMINAL JARDIN PESADA BRONCE*                                                                ', '677             ', '.', 'llave-terminal-jardin-pesada-bronce', 'http://localhost:8000/img/Mantis/def.png', '12931', 1, 16, 0, '2015-09-04', '2015-09-04'),
(320, '977700              ', 'LLAVE TERMINAL COCINA LIVIANA CROMO                                                                 ', '677             ', '.', 'llave-terminal-cocina-liviana-cromo', 'http://localhost:8000/img/Mantis/def.png', '18706', 1, 16, 0, '2015-09-04', '2015-09-04'),
(321, '979013              ', 'LLAVE TERMINAL ECONOMICA 1/2 BRONCE                                                                 ', '529             ', '.', 'llave-terminal-economica-12-bronce', 'http://localhost:8000/img/Mantis/def.png', '9827', 1, 16, 0, '2015-09-04', '2015-09-04'),
(322, '987000              ', 'EXTRACTOR ASIENTO METALICO ACERO ALUMINIO                                                           ', '674             ', '.', 'extractor-asiento-metalico-acero-aluminio', 'http://localhost:8000/img/Mantis/def.png', '14310', 1, 16, 0, '2015-09-04', '2015-09-04'),
(323, '987100              ', 'LLAVE PARA GRIFERIA TANQUE SANITARIO ALUMINIO                                                       ', '670             ', '.', 'llave-para-griferia-tanque-sanitario-aluminio', 'http://localhost:8000/img/Mantis/def.png', '17327', 1, 16, 0, '2015-09-04', '2015-09-04'),
(324, '987150              ', 'REPUESTO COPA INSTALACION TORNILLO HERRAJE NEUTRO                                                   ', '674             ', '.', 'repuesto-copa-instalacion-tornillo-herraje-neutro', 'http://localhost:8000/img/Mantis/def.png', '17327', 1, 16, 0, '2015-09-04', '2015-09-04'),
(325, '987200              ', 'LLAVE MÚLTIPLE ALUMINIO                                                                             ', '670             ', '.', 'llave-multiple-aluminio', 'http://localhost:8000/img/Mantis/def.png', '19568', 1, 16, 0, '2015-09-04', '2015-09-04'),
(326, '987400              ', 'COPA PARA CARTUCHO ACERO ALUMINIO                                                                   ', '672             ', '.', 'copa-para-cartucho-acero-aluminio', 'http://localhost:8000/img/Mantis/def.png', '21551', 1, 16, 0, '2015-09-04', '2015-09-04'),
(327, '030129              ', 'ARANDELA PLANA ZIN 1/8 UNIDAD                                                                       ', '121             ', '.', 'arandela-plana-zin-18-unidad', 'http://localhost:8000/img/Mantis/def.png', '17', 1, 16, 0, '2015-09-04', '2015-09-04'),
(328, '987401              ', 'RASTRILLO METALICO VIPER 16 DIENTES (IVA 5%)                                                        ', '704             ', '.', 'rastrillo-metalico-viper-16-dientes-iva-5', 'http://localhost:8000/img/Mantis/def.png', '6190', 1, 5, 0, '2015-09-04', '2015-09-04'),
(329, '987402              ', 'JUEGO BROCA HSS VIPER 300 PIEZAS COMBINADA                                                          ', '183             ', '.', 'juego-broca-hss-viper-300-piezas-combinada', 'http://localhost:8000/img/Mantis/def.png', '10603', 1, 16, 0, '2015-09-04', '2015-09-04'),
(330, '987403              ', 'PULIDORA ESMERILADORA 4 1/2 -115 MM D28090                                                          ', '138             ', '.', 'pulidora-esmeriladora-4-12-115-mm-d28090', 'http://localhost:8000/img/Mantis/def.png', '182758', 1, 16, 0, '2015-09-04', '2015-09-04'),
(331, '987404              ', 'NAVAJA MULTI_HERRAMIENTA VICTORINOX 5 PIEZAS                                                        ', '201             ', '.', 'navaja-multi-herramienta-victorinox-5-piezas', 'http://localhost:8000/img/Mantis/def.png', '43706', 1, 16, 0, '2015-09-04', '2015-09-04'),
(332, '987405              ', 'SANITARIO MONTEAVANTY BLANCO                                                                        ', '395             ', '.', 'sanitario-monteavanty-blanco', 'http://localhost:8000/img/Mantis/def.png', '405172', 1, 16, 0, '2015-09-04', '2015-09-04'),
(333, '987406              ', 'MALLA CRISTAL AZURRA HOLS 010-0                                                                     ', '040             ', '.', 'malla-cristal-azurra-hols-010-0', 'http://localhost:8000/img/Mantis/def.png', '17241', 1, 16, 0, '2015-09-04', '2015-09-04'),
(334, '987407              ', 'LAVAMANOS MONTEAVANTY BLANCO/PEDESTAL/GRIFERIA PRISMA 4                                             ', '395             ', '.', 'lavamanos-monteavanty-blancopedestalgriferia-prisma-4', 'http://localhost:8000/img/Mantis/def.png', '125000', 1, 16, 0, '2015-09-04', '2015-09-04'),
(335, '987408              ', 'RASTRILLO METALICO VIPER 12 DIENTES (IVA 5%)                                                        ', '704             ', '.', 'rastrillo-metalico-viper-12-dientes-iva-5', 'http://localhost:8000/img/Mantis/def.png', '4952', 1, 5, 0, '2015-09-04', '2015-09-04'),
(336, '987409              ', 'RODACHIN ANDAMIO CON FRENO T/P                                                                      ', '208             ', '.', 'rodachin-andamio-con-freno-tp', 'http://localhost:8000/img/Mantis/def.png', '49310', 1, 16, 0, '2015-09-04', '2015-09-04'),
(337, '987410              ', 'SANITARIO MONTEAVANTY AZUL OSCURO 118 DOBLE DESCARGA                                                ', '395             ', '.', 'sanitario-monteavanty-azul-oscuro-118-doble-descarga', 'http://localhost:8000/img/Mantis/def.png', '349137', 1, 16, 0, '2015-09-04', '2015-09-04'),
(338, '030131              ', 'ARANDELA PLANA ZIN 3/16 UNIDAD                                                                      ', '121             ', '.', 'arandela-plana-zin-316-unidad', 'http://localhost:8000/img/Mantis/def.png', '51', 1, 16, 0, '2015-09-04', '2015-09-04'),
(339, '987411              ', 'SANITARIO SENSACION BONE                                                                            ', '394             ', '.', 'sanitario-sensacion-bone', 'http://localhost:8000/img/Mantis/def.png', '118793', 1, 16, 0, '2015-09-04', '2015-09-04'),
(340, '987412              ', 'LAVAMANOS MONOC TORRE ALTA CALA CL1010001                                                           ', '395             ', '.', 'lavamanos-monoc-torre-alta-cala-cl1010001', 'http://localhost:8000/img/Mantis/def.png', '201551', 1, 16, 0, '2015-09-04', '2015-09-04'),
(341, '090281', 'LISTON 8 * 5 * 1.5 MTS INMUNIZADO', '638             ', NULL, 'liston-8-5-15-mts-inmunizado', 'http://localhost:8000/img/Mantis/def.png', '15650', 1, 0, 0, '2015-09-04', '2015-09-04'),
(342, '062934', 'BOMBILLO PANEL LED 3W 6400K', '782', NULL, 'bombillo-panel-led-3w-6400k', 'http://localhost:8000/img/Mantis/def.png', '10344', 1, 16, 0, '2015-09-04', '2015-09-04'),
(343, '062935', 'BOMBILLO PANEL LED 6W 6400K', '782', NULL, 'bombillo-panel-led-6w-6400k', 'http://localhost:8000/img/Mantis/def.png', '15689', 1, 16, 0, '2015-09-04', '2015-09-04'),
(344, '062936', 'BOMBILLO PANEL LED REDONDO 12W 6400K', '782', NULL, 'bombillo-panel-led-redondo-12w-6400k', 'http://localhost:8000/img/Mantis/def.png', '23965', 1, 16, 0, '2015-09-04', '2015-09-04'),
(345, '043706', 'PARED CERITALIA 25*35 ASCOLI BLANCO METRO 1RA', '036             ', NULL, 'pared-ceritalia-2535-ascoli-blanco-metro-1ra', 'http://localhost:8000/img/Mantis/def.png', '11724', 1, 16, 0, '2015-09-04', '2015-09-04'),
(346, '411271', 'GRIFERIA LAVAMANOS CANCUN', '484             ', NULL, 'griferia-lavamanos-cancun', 'http://localhost:8000/img/Mantis/def.png', '26508', 1, 16, 0, '2015-09-04', '2015-09-04'),
(347, '111571', 'LAVAMANOS CANCUN BLANCO', '398             ', NULL, 'lavamanos-cancun-blanco', 'http://localhost:8000/img/Mantis/def.png', '42077', 1, 16, 0, '2015-09-04', '2015-09-04'),
(348, '111572', 'PEDESTAL CANCUN BLANCO', '411             ', NULL, 'pedestal-cancun-blanco', 'http://localhost:8000/img/Mantis/def.png', '30481', 1, 16, 0, '2015-09-04', '2015-09-04'),
(349, '030133              ', 'ARANDELA PLANA ZIN 3/8 UNIDAD                                                                       ', '121             ', '.', 'arandela-plana-zin-38-unidad', 'http://localhost:8000/img/Mantis/def.png', '86', 1, 16, 0, '2015-09-04', '2015-09-04'),
(350, '829725', 'JUEGO INCRUSTACIONES 4 PIEZAS ITALIA', '654             ', NULL, 'juego-incrustaciones-4-piezas-italia', 'http://localhost:8000/img/Mantis/def.png', '27586', 1, 16, 0, '2015-09-04', '2015-09-04'),
(351, '043707', 'PISO AVANTI MONZA BEIGE 45*45 METRO SDA', '036             ', NULL, 'piso-avanti-monza-beige-4545-metro-sda', 'http://localhost:8000/img/Mantis/def.png', '10344', 1, 16, 0, '2015-09-04', '2015-09-04'),
(352, '043708', 'PISO AVANTI PARKET AMADOR 45*45 METRO SDA', '037             ', NULL, 'piso-avanti-parket-amador-4545-metro-sda', 'http://localhost:8000/img/Mantis/def.png', '10344', 1, 16, 0, '2015-09-04', '2015-09-04'),
(353, '101902', 'TEJA TERMOACO ADRI AZUL 2DA 3MTS AJOVER', '261             ', NULL, 'teja-termoaco-adri-azul-2da-3mts-ajover', 'http://localhost:8000/img/Mantis/def.png', '38793', 1, 16, 0, '2015-09-04', '2015-09-04'),
(354, '027821', 'MASILLA TERINSA PARA MADERA ROJA GALON', '110             ', NULL, 'masilla-terinsa-para-madera-roja-galon', 'http://localhost:8000/img/Mantis/def.png', '42258', 1, 16, 0, '2015-09-04', '2015-09-04'),
(355, '043709', 'PARED ROCA 28*45 METRO 2DA', '036             ', NULL, 'pared-roca-2845-metro-2da', 'http://localhost:8000/img/Mantis/def.png', '17241', 1, 16, 0, '2015-09-04', '2015-09-04'),
(356, '043710', 'PISO DIAMANTE PERLADO MARFIL 60*60  METRO 2DA', '037             ', NULL, 'piso-diamante-perlado-marfil-6060-metro-2da', 'http://localhost:8000/img/Mantis/def.png', '15431', 1, 16, 0, '2015-09-04', '2015-09-04'),
(357, '191695', 'FLEJE 13 * 15 1/4', '232             ', NULL, 'fleje-13-15-14', 'http://localhost:8000/img/Mantis/def.png', '732', 1, 16, 0, '2015-09-04', '2015-09-04'),
(358, '101903', 'ARENA GRAVADA METRO', '231             ', NULL, 'arena-gravada-metro', 'http://localhost:8000/img/Mantis/def.png', '43103', 1, 16, 0, '2015-09-04', '2015-09-04'),
(359, '300759', 'GERFOR PRES TAPON MACHO 1/2"', '117             ', NULL, 'gerfor-pres-tapon-macho-12', 'http://localhost:8000/img/Mantis/def.png', '215', 1, 16, 0, '2015-09-04', '2015-09-04'),
(360, '030135              ', 'ARANDELA PLANA ZIN 5/16 UNIDAD                                                                      ', '121             ', '.', 'arandela-plana-zin-516-unidad', 'http://localhost:8000/img/Mantis/def.png', '68', 1, 16, 0, '2015-09-04', '2015-09-04'),
(361, '300760', 'GERFOR PRES TAPON MACHO 1"', '117             ', NULL, 'gerfor-pres-tapon-macho-1', 'http://localhost:8000/img/Mantis/def.png', '689', 1, 16, 0, '2015-09-04', '2015-09-04'),
(362, '110991', 'LLAVE BOLA ROSCADA PCP 2"', '430             ', NULL, 'llave-bola-roscada-pcp-2', 'http://localhost:8000/img/Mantis/def.png', '21508', 1, 16, 0, '2015-09-04', '2015-09-04'),
(363, '111573', 'VALVULA INCORPORACION PCP 1/2"', '117             ', NULL, 'valvula-incorporacion-pcp-12', 'http://localhost:8000/img/Mantis/def.png', '7301', 1, 16, 0, '2015-09-04', '2015-09-04'),
(364, '111574', 'FLOTADOR TANQUE ALTO 1/2" GERFOR', '432             ', NULL, 'flotador-tanque-alto-12-gerfor', 'http://localhost:8000/img/Mantis/def.png', '15086', 1, 16, 0, '2015-09-04', '2015-09-04'),
(365, '043711', 'PARED AVANTY 28 * 45 LUCCA LILA COMPLEMENTO METRO 2DA', '036             ', NULL, 'pared-avanty-28-45-lucca-lila-complemento-metro-2da', 'http://localhost:8000/img/Mantis/def.png', '11896', 1, 16, 0, '2015-09-04', '2015-09-04'),
(366, '043712', 'PISO AVANTI 31.5 * 31.5 BALTICO VERDE METRO 2DA', '037             ', NULL, 'piso-avanti-315-315-baltico-verde-metro-2da', 'http://localhost:8000/img/Mantis/def.png', '11896', 1, 16, 0, '2015-09-04', '2015-09-04'),
(367, '043713', 'PISO AVANTI 60*60 DIMANTE MARCHEZA METRO 2DA', '037             ', NULL, 'piso-avanti-6060-dimante-marcheza-metro-2da', 'http://localhost:8000/img/Mantis/def.png', '12241', 1, 16, 0, '2015-09-04', '2015-09-04'),
(368, '340173', 'GERFOR PRES RDE 21  1/2" TRAMO', '116             ', NULL, 'gerfor-pres-rde-21-12-tramo', 'http://localhost:8000/img/Mantis/def.png', '3534', 1, 16, 0, '2015-09-04', '2015-09-04');

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
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE IF NOT EXISTS `tipopago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TipPagNom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`id`, `TipPagNom`, `created_at`, `updated_at`) VALUES
(1, 'Contado', '0000-00-00', '0000-00-00'),
(2, 'Cupo Cliente', '0000-00-00', '0000-00-00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `NitSec`, `email`, `CliCup`, `password`, `remember_token`, `remember_pass`, `active`, `condiciones`, `admin`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ederalvarez2009@hotmail.com', NULL, '$2y$10$SvCL7dmsqRfImRzVbCllJeaxe//a9o1ATmqJbfF6VHW2zXFMCYVE2', 'SR4MkUeUWlpqyKiMRvwhIuzax8nMCKmupzG6ngPmSS05KHCRWq3qu4eDGO52', '', 1, 0, 0, '2014-11-28', '2015-02-28'),
(2, NULL, 'eder@tumegalopolis.com', NULL, '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', '2SaNzCgQpYmmaJuEj6Jcze7zLY6HXAcvI9XxlGUa2PAl4qHGNhbVQdf6TzJM', '', 1, 1, 0, '2015-01-03', '2015-01-03'),
(3, NULL, 'admin@admin.com', NULL, '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', '73Fa5jvrOe30Bpx8ooUjX7IixHggYXOcGk3RxLMm8pnw11iLMJWTyhnyp451', '', 1, 1, 1, '0000-00-00', '2015-09-04'),
(4, NULL, 'usuario@gmail.com', NULL, '$2y$10$33Alb7WURkQ7priWift7aOi4gsMYke8J84N6yQgt6XlS2qZb0jFz6', '', '', 1, 1, 0, '2015-01-03', '2015-01-03'),
(8, NULL, 'demi@gmail.com', NULL, '$2y$10$R.tss0EpKJm6g4EOCSWGKu8P2BEjG8xx81UQ8gggJ70TR17bFTnmy', 'YeCA7rXpqvJqqSe19HMyOHmQn7urBxEEgm8v6m2YHZNo7sl5cekUbWzRjgrc', '', 1, 1, 0, '2015-01-08', '2015-01-19'),
(9, NULL, 'demi2@gmail.com', NULL, '$2y$10$4OWXwwa6r0GAkmnt9HP4UOqPONI./wuXrigUzfxwJuHJOhb4d7hre', '', '', 1, 1, 0, '2015-01-08', '2015-01-08'),
(10, NULL, 'missd@gmail.com', NULL, '$2y$10$9XyD3HlnXtaDw9slhcDMxuk6hVl7a7dTIgybQ8hM9CelYg.QDp62e', '', '', 1, 1, 0, '2015-01-15', '2015-01-15'),
(11, NULL, 'ivan@ivan.com', NULL, '$2y$10$CeUfFcav0ccjx0YXYfKAw.diHr/gvbNhPIDWDEugdSLQfRvv3Mi.W', '', '', 1, 1, 0, '2015-01-16', '2015-01-16'),
(12, NULL, 'demi3@gmail.com', NULL, '$2y$10$uP9HeH.akxLdy6CZuf1fye1pbj4bLMIW1YbXrIp6PmTJ4r4Sfcvva', 'oJReyFvzIiH7s47CgrbLsJeOZCkS7TEoyuVJzZqIzSHmF3bqk6qZr9Xrt6Wo', '', 1, 1, 0, '2015-02-24', '2015-02-24'),
(13, NULL, 'eder2@gmail.com', NULL, '$2y$10$7b/KWr/UUf9RwwboS5crJuiJo/McYYvE8LSoiLSudFlnwUXjz7AaG', 'PDcx3lsFOVTJES0fdTeQoSiM9wNantrXhnw6QwQmKfwj4Ysnu7NSN2kyYj6u', '', 1, 1, 0, '2015-03-04', '2015-03-05'),
(14, NULL, 'Juan@gmail.com', NULL, '$2y$10$Csqhy0Q1dm4A0MsuyqLNcOdnuT7t54FzuM92sgA52DHqBdEa4Akl6', 'di7N7C2MmrnbcPjhIXbetV33Oc6nNvNcVKQjeS9lOBUTawXCtcyUun0I5G8Q', '', 1, 1, 0, '2015-03-05', '2015-03-05'),
(15, NULL, 'pedro@gmail.com', NULL, '$2y$10$x4kWOW4u6hPusfJ43FHoxe778/TevWfieqmvXO2GWjqjU16QXEJjK', '', '', 1, 1, 0, '2015-03-05', '2015-03-05'),
(16, NULL, 'lovato@gmail.com', NULL, '$2y$10$xveYyTM8eZe0mjwMnTwZieHT2xtf5mgWnm3cA0cCw3C.cpdCq97Eq', '2GiFiaHrq3Xq0SLMT9HplP2HTLXqBmqplJ0GmCUTzST2Dz4k2LJO2Xw9tLzu', '', 1, 1, 0, '2015-04-06', '2015-04-06'),
(17, NULL, 'demi5@gmail.com', NULL, '$2y$10$SICNiLlivBlBO0gI52rZjOMC6zF4gpakjEWFUlvLT2xEN56/Y1Q/i', '', '', 1, 1, 0, '2015-05-15', '2015-05-15'),
(18, NULL, 'invitado1@gmail.com', NULL, '$2y$10$jkgzwZPgtl3ROby0z4TRgefBriNi/fWaFrpIhssFHxzgkQzfwGurC', 'YII1hRESv3fzsd2yqFzl7T9JsU5TRADKwnrYa9MNgsYUpHxo627GqA4QeiXM', '', 1, 1, 0, '2015-06-13', '2015-06-13'),
(19, '1102365683', 'ederalvarez2091057@gmail.com', NULL, '$2y$10$DvwpuR2BEjwm0C/eEYPDD.7zJiRMn6Xbi60I7VRqJjfER/73c/NAq', '', '', 1, 1, 0, '2015-06-13', '2015-06-13'),
(20, NULL, 'carlos@gmail.com', NULL, '$2y$10$lgTjbsg6qzXljChKAfgdfOl90CnlpymxTGv7aI64DPMoZjjnKo2J.', 'r591jKVf6WAfJxTpySRI4wLTTMnmN2NYki3MhjoIBafWoYNID3ckfNowH3cc', '', 1, 1, 0, '2015-06-23', '2015-07-06'),
(21, NULL, 'demi3@gamil.com', NULL, '$2y$10$r8XHMoaxUDX9WC/7wRulVOnqJjYf4fAAA6dN2olgEOojd9oKbp4nK', 'mKgxonfZuR3gwhPaD3JtxGmZGLlTfjQtQ6f944CPBNXstct1NeDv6f6CpJcb', '', 1, 1, 0, '2015-07-06', '2015-07-06'),
(22, NULL, 'eder@gmail.com', NULL, '$2y$10$YK9r1/ZEWealFcW1vdmgKutEpZ9XFuYd3Cah7MA6qXc.Iptf6RFOq', 'KqKk2r3qXMHA9PdHNdENqq2AriYJ9GWhhPiH6BCpMNQZj76BK1kIXmWmhb7k', '', 1, 1, 0, '2015-09-04', '2015-09-04');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `user_datos`
--

INSERT INTO `user_datos` (`id`, `user_id`, `barrio_id`, `nombre`, `apellido`, `cedula`, `nombre_negocio`, `ciudad`, `canal`, `direccion`, `telefono`, `comentarios`, `created_at`, `updated_at`) VALUES
(3, 9, 4, 'Ederyyy', 'Julianyy', NULL, NULL, NULL, NULL, 'calle 17 #3w-65 miraflores torre 36 apto 11-37yyyyy', '30131191986777', 'eafbgadhnbnshhrethwhet', '2015-01-09', '2015-01-09'),
(4, 8, 3, 'demi', 'lovato', '11023656748', 'lovatics', 1, 0, 'calle 39 # 20-39 piso 2', '44444', 'comment', '2015-01-10', '2015-02-24'),
(5, 10, 4, 'Miss', 'D', NULL, NULL, NULL, NULL, 'carrera 9 #45878', '36585215', 'wñlmck{wnco', '2015-01-15', '2015-01-15'),
(6, 11, 3, 'ivan', 'rojas', NULL, NULL, NULL, NULL, 'carrera 9 #45878', '6658585', 'jn jknjcds', '2015-01-16', '2015-01-16'),
(7, 3, 3, 'Eder', 'Alvarez', '11023656748', 'Eder Alvarez', 3, 0, 'calle 39 # 20-39 piso 2', '3013119198', 'Mis comentarios ', '2015-02-23', '2015-09-04'),
(8, 12, 2, 'Demi', 'Lovato', '11023656748', 'lovatics', 2, 0, 'calle 39 # 20-39 piso 2', '56644', 'mis commments', '2015-02-24', '2015-02-24'),
(9, 1, 2, 'Eder', 'Alvarez', '11023656748', 'Eder Alvarez', 1, 0, 'calle 39 # 20-39 piso 2', '3013119198', 'Mis comentarios', '2015-02-28', '2015-02-28'),
(10, 13, 1, 'Eder', 'Alvarez', '11023656748', 'wizards', 1, 0, 'carrera 24 # 18-76, Bucaramanga, Santander, Colombia', '6545342', 'mas tarde', '2015-03-04', '2015-03-04'),
(12, 14, 6, 'Juan', 'Cuadrado', '11023656748', 'Ras tas tas', 4, 0, 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '3013119195', 'ddwwdwdw', '2015-03-05', '2015-03-05'),
(13, 15, 1, 'Pedro', 'Franco', '11023656748', 'colombia', 1, 0, 'calle 39 # 20-39 piso 2', '3013119198', 'dwdededwmlwmlñw', '2015-03-05', '2015-03-05'),
(14, 16, 4, 'Demi', 'Lovato', '1232654543', 'Lovatics', 1, 0, 'carrera 24 # 18-76, Bucaramanga, Santander, Colombia', '65544334', 'mrfkrmfkrmfkrmfrk', '2015-04-06', '2015-04-06'),
(15, 17, 2, 'Demi ', 'Lovato', '123454345', 'demilovato.com', 1, 0, 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '34576757', 'Demi lovato''s music', '2015-05-15', '2015-05-15'),
(16, 19, 5, 'Eder Julián', 'Álvarez carrero', '1102365683', 'TAT', 2, 0, 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '6432356', 'Sin comentarios', '2015-06-13', '2015-06-13'),
(17, 20, 3, 'Carlos', 'Valderrama', '110245432123', 'Carlos ltda', 1, 0, 'calle 20 # 24-34', '30064546362', '', '2015-06-23', '2015-06-23'),
(18, 21, 2, 'Demetria', 'Devone', '1323543234', 'Demi''s store', 1, 0, 'carrera 24 # 18-76, Bucaramanga, Santander, Colombia', '6545342', 'Sin comentarios', '2015-07-06', '2015-07-06'),
(19, 22, 2, 'Eder', 'Alvarez', '1102365683', 'Live con', 1, 0, 'car 23 # 34-65', '3013119198', '', '2015-09-04', '2015-09-04');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
