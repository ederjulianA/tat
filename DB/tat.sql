-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-09-2016 a las 17:10:56
-- Versión del servidor: 5.7.11
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrios`
--

CREATE TABLE `barrios` (
  `id` int(11) NOT NULL,
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
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `canales` (
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

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `InvGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cat_nom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `cat_slug` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `InvSubGruId` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `InvSubGruCod` varchar(16) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `InvGruCod`, `cat_nom`, `cat_slug`, `img`, `created_at`, `updated_at`, `InvSubGruId`, `InvSubGruCod`) VALUES
(1, '001', 'TORNILLERIA', 'tornilleria', NULL, '2016-09-02', '2016-09-02', '001-001', '001'),
(2, '002', 'RECOL', 'recol', NULL, '2016-09-02', '2016-09-02', '002-001', '109'),
(3, '17', 'TANQUES', 'tanques', NULL, '2016-09-02', '2016-09-02', '058-001', '115'),
(4, '20', 'TRANSPORTE', 'transporte', NULL, '2016-09-02', '2016-09-02', '020-001', '110'),
(5, '004', 'MALLAS', 'mallas', NULL, '2016-09-02', '2016-09-02', '004-001', '111'),
(6, '001', 'HERRAMIENTAS PESADAS                                        ', 'herramientas-pesadas', NULL, '2016-09-02', '2016-09-02', '001-003', '003'),
(7, '001', 'ARNES', 'arnes', NULL, '2016-09-02', '2016-09-02', '001-002', '112'),
(8, '003', 'ACCESORIOS CORTINA                                          ', 'accesorios-cortina', NULL, '2016-09-02', '2016-09-02', '003-004', '004'),
(9, '003', 'SOGA Y PITAS                                                ', 'soga-y-pitas', NULL, '2016-09-02', '2016-09-02', '003-005', '005'),
(10, '003', 'ACCESORIOS', 'accesorios', NULL, '2016-09-02', '2016-09-02', '003-001', '116'),
(11, '003', 'REPUESTOS VARIOS', 'repuestos-varios', NULL, '2016-09-02', '2016-09-02', '003-007', '007'),
(12, '004', 'EUROCASA                                                    ', 'eurocasa', NULL, '2016-09-02', '2016-09-02', '004-009', '009'),
(13, '012', 'TRANSPORTE', 'transporte', NULL, '2016-09-02', '2016-09-02', '012-01', '102'),
(14, '19', 'INTERESES', 'intereses', NULL, '2016-09-02', '2016-09-02', '098-01', '107'),
(15, '004', 'INTERMATEX                                                  ', 'intermatex', NULL, '2016-09-02', '2016-09-02', '004-011', '011'),
(16, '004', 'CERAMICA ITALIA', 'ceramica-italia', NULL, '2016-09-02', '2016-09-02', '004-010', '010'),
(17, '011', 'STRETTO', 'stretto', NULL, '2016-09-02', '2016-09-02', '011-002', '114'),
(18, '003', 'PEGANTES VARIOS                                             ', 'pegantes-varios', NULL, '2016-09-02', '2016-09-02', '003-006', '006'),
(19, '004', 'ALFAGRES', 'alfagres', NULL, '2016-09-02', '2016-09-02', '004-008', '008'),
(20, '004', 'DIPROSERCO                                                  ', 'diproserco', NULL, '2016-09-02', '2016-09-02', '004-012', '012'),
(21, '002', 'ALFAGRES', 'alfagres', NULL, '2016-09-02', '2016-09-02', '002-013', '108'),
(22, '004', 'PEGANTES CERAMICA', 'pegantes-ceramica', NULL, '2016-09-02', '2016-09-02', '004-014', '014'),
(23, '005', 'MANIJAS Y ESCUDOS                                           ', 'manijas-y-escudos', NULL, '2016-09-02', '2016-09-02', '005-016', '016'),
(24, '005', 'CHAPAS                                                      ', 'chapas', NULL, '2016-09-02', '2016-09-02', '005-018', '018'),
(25, '005', 'CANDADOS                                                    ', 'candados', NULL, '2016-09-02', '2016-09-02', '005-015', '015'),
(26, '005', 'ACCESORIOS PUERTA                                           ', 'accesorios-puerta', NULL, '2016-09-02', '2016-09-02', '005-019', '019'),
(27, '006', 'ALAMBRES                                                    ', 'alambres', NULL, '2016-09-02', '2016-09-02', '006-020', '020'),
(28, '004', 'E&D SOLUCIONES                                              ', 'ed-soluciones', NULL, '2016-09-02', '2016-09-02', '004-013', '013'),
(29, '006', 'ACCESORIOS ELECTRICOS                                       ', 'accesorios-electricos', NULL, '2016-09-02', '2016-09-02', '006-021', '021'),
(30, '006', 'LAMPARAS                                                    ', 'lamparas', NULL, '2016-09-02', '2016-09-02', '006-022', '022'),
(31, '006', 'BOMBILLOS', 'bombillos', NULL, '2016-09-02', '2016-09-02', '006-023', '023'),
(32, '006', 'CAJAS Y TACOS                                               ', 'cajas-y-tacos', NULL, '2016-09-02', '2016-09-02', '006-025', '025'),
(33, '006', 'TUBOS ELECTRICOS                                            ', 'tubos-electricos', NULL, '2016-09-02', '2016-09-02', '006-027', '027'),
(34, '006', 'ACCESORIOS TV                                             ', 'accesorios-tv', NULL, '2016-09-02', '2016-09-02', '006-028', '028'),
(35, '007', 'ACCESORIOS GALVANIZADOS                                     ', 'accesorios-galvanizados', NULL, '2016-09-02', '2016-09-02', '007-029', '029'),
(36, '006', 'EXTENSIONES                                                 ', 'extensiones', NULL, '2016-09-02', '2016-09-02', '006-024', '024'),
(37, '007', 'TUBERIA GALVANIZADA                                         ', 'tuberia-galvanizada', NULL, '2016-09-02', '2016-09-02', '007-030', '030'),
(38, '007', 'PEGANTES PARA GALVANIZADO                                   ', 'pegantes-para-galvanizado', NULL, '2016-09-02', '2016-09-02', '007-031', '031'),
(39, '002', 'PINTULAND                                                   ', 'pintuland', NULL, '2016-09-02', '2016-09-02', '002-033', '033'),
(40, '002', 'SIKA                                                        ', 'sika', NULL, '2016-09-02', '2016-09-02', '002-034', '034'),
(41, '002', 'COMPLEMENTO PINTURA                                         ', 'complemento-pintura', NULL, '2016-09-02', '2016-09-02', '002-035', '035'),
(42, '002', 'PINTUCO                                                     ', 'pintuco', NULL, '2016-09-02', '2016-09-02', '002-032', '032'),
(43, '17', 'ACCESORIOS POLIETILENO', 'accesorios-polietileno', NULL, '2016-09-02', '2016-09-02', '058-035', '101'),
(44, '005', 'PORTACANDADOS                                               ', 'portacandados', NULL, '2016-09-02', '2016-09-02', '005-017', '017'),
(45, '010', 'MATERIALES OBRA GRIS                                        ', 'materiales-obra-gris', NULL, '2016-09-02', '2016-09-02', '010-036', '036'),
(46, '010', 'GRES                                                        ', 'gres', NULL, '2016-09-02', '2016-09-02', '010-037', '037'),
(47, '011', 'ACCESORIOS LAVAPLATOS', 'accesorios-lavaplatos', NULL, '2016-09-02', '2016-09-02', '011-001', '113'),
(48, '010', 'TEJAS                                                       ', 'tejas', NULL, '2016-09-02', '2016-09-02', '010-039', '039'),
(49, '010', 'ACCESORIOS TEJA                                             ', 'accesorios-teja', NULL, '2016-09-02', '2016-09-02', '010-038', '038'),
(50, '010', 'MALLAS                                                      ', 'mallas', NULL, '2016-09-02', '2016-09-02', '010-040', '040'),
(51, '010', 'PRODUCTOS QUIMICOS                                          ', 'productos-quimicos', NULL, '2016-09-02', '2016-09-02', '010-041', '041'),
(52, '008', 'GERFOR                                                      ', 'gerfor', NULL, '2016-09-02', '2016-09-02', '008-045', '045'),
(53, '006', 'TOMAS INTERRUPTORES                                         ', 'tomas-interruptores', NULL, '2016-09-02', '2016-09-02', '006-026', '026'),
(54, '010', 'ACABADOS                                                    ', 'acabados', NULL, '2016-09-02', '2016-09-02', '010-043', '043'),
(55, '008', 'PAVCO                                                       ', 'pavco', NULL, '2016-09-02', '2016-09-02', '008-044', '044'),
(56, '010', 'ORNAMENTACION                                               ', 'ornamentacion', NULL, '2016-09-02', '2016-09-02', '010-042', '042'),
(57, '009', 'TABLAS                                                      ', 'tablas', NULL, '2016-09-02', '2016-09-02', '009-047', '047'),
(58, '009', 'CANABRAVA                                                   ', 'canabrava', NULL, '2016-09-02', '2016-09-02', '009-048', '048'),
(59, '009', 'MACHIMBRE                                                   ', 'machimbre', NULL, '2016-09-02', '2016-09-02', '009-049', '049'),
(60, '009', 'VIGAS                                                       ', 'vigas', NULL, '2016-09-02', '2016-09-02', '009-053', '053'),
(61, '009', 'SOLERAS                                                     ', 'soleras', NULL, '2016-09-02', '2016-09-02', '009-051', '051'),
(62, '009', 'VARAS                                                       ', 'varas', NULL, '2016-09-02', '2016-09-02', '009-054', '054'),
(63, '009', 'DILATACIONES                                                ', 'dilataciones', NULL, '2016-09-02', '2016-09-02', '009-055', '055'),
(64, '001', 'REPUESTOS HERRAMIENTAS                                      ', 'repuestos-herramientas', NULL, '2016-09-02', '2016-09-02', '001-057', '057'),
(65, '001', 'DISCOS                                                      ', 'discos', NULL, '2016-09-02', '2016-09-02', '001-056', '056'),
(66, '001', 'HERRAMIENTAS TIPO LIVIANA                                   ', 'herramientas-tipo-liviana', NULL, '2016-09-02', '2016-09-02', '001-058', '058'),
(67, '009', 'ESTACONES                                                   ', 'estacones', NULL, '2016-09-02', '2016-09-02', '009-050', '050'),
(68, '18', 'LAVAMOS Y ESPEJO', 'lavamos-y-espejo', NULL, '2016-09-02', '2016-09-02', '022-058', '103'),
(69, '009', 'SERCOS                                                      ', 'sercos', NULL, '2016-09-02', '2016-09-02', '009-052', '052'),
(70, '011', 'SANITARIOS                                                  ', 'sanitarios', NULL, '2016-09-02', '2016-09-02', '011-061', '061'),
(71, '011', 'LAVAMANOS                                                   ', 'lavamanos', NULL, '2016-09-02', '2016-09-02', '011-062', '062'),
(72, '011', 'COMBOS', 'combos', NULL, '2016-09-02', '2016-09-02', '011-060', '060'),
(73, '011', 'PEDESTAL', 'pedestal', NULL, '2016-09-02', '2016-09-02', '011-064', '064'),
(74, '011', 'TANQUES TAPAS Y TAZAS                                       ', 'tanques-tapas-y-tazas', NULL, '2016-09-02', '2016-09-02', '011-063', '063'),
(75, '010', 'SISTEMA SEPTICO', 'sistema-septico', NULL, '2016-09-02', '2016-09-02', '010-058', '104'),
(76, '011', 'REJILLAS                                                    ', 'rejillas', NULL, '2016-09-02', '2016-09-02', '011-065', '065'),
(77, '009', 'LISTONES                                                    ', 'listones', NULL, '2016-09-02', '2016-09-02', '009-046', '046'),
(78, '001', 'MANGUERAS                                                   ', 'mangueras', NULL, '2016-09-02', '2016-09-02', '001-059', '059'),
(79, '011', 'VALVULAS                                                    ', 'valvulas', NULL, '2016-09-02', '2016-09-02', '011-067', '067'),
(80, '011', 'EMPAQUES                                                    ', 'empaques', NULL, '2016-09-02', '2016-09-02', '011-070', '070'),
(81, '011', 'UNIVERSAL                                                   ', 'universal', NULL, '2016-09-02', '2016-09-02', '011-068', '068'),
(82, '011', 'LAVAPLATOS                                                  ', 'lavaplatos', NULL, '2016-09-02', '2016-09-02', '011-071', '071'),
(83, '011', 'LLAVE BOLA                                                  ', 'llave-bola', NULL, '2016-09-02', '2016-09-02', '011-066', '066'),
(84, '011', 'ACCESORIOS SANITARIOS                                       ', 'accesorios-sanitarios', NULL, '2016-09-02', '2016-09-02', '011-069', '069'),
(85, '011', 'LAVADEROS                                                   ', 'lavaderos', NULL, '2016-09-02', '2016-09-02', '011-072', '072'),
(86, '011', 'ACCESORIOS SANITARIOS GRIVAL                                ', 'accesorios-sanitarios-grival', NULL, '2016-09-02', '2016-09-02', '011-078', '078'),
(87, '011', 'DUCHAS GRIVAL                                               ', 'duchas-grival', NULL, '2016-09-02', '2016-09-02', '011-077', '077'),
(88, '011', 'ACCESORIOS LAVAPLATOS GRIVAL                                ', 'accesorios-lavaplatos-grival', NULL, '2016-09-02', '2016-09-02', '011-075', '075'),
(89, '011', 'REPUESTOS GRIVAL                                            ', 'repuestos-grival', NULL, '2016-09-02', '2016-09-02', '011-079', '079'),
(90, '011', 'LLAVES TERMINAL PASO PALANCA                                ', 'llaves-terminal-paso-palanca', NULL, '2016-09-02', '2016-09-02', '011-080', '080'),
(91, '011', 'GRIFOS Y PARTES                                             ', 'grifos-y-partes', NULL, '2016-09-02', '2016-09-02', '011-081', '081'),
(92, '011', 'ACCESORIOS LAVAMANOS GRIVAL                                 ', 'accesorios-lavamanos-grival', NULL, '2016-09-02', '2016-09-02', '011-076', '076'),
(93, '011', 'ACCESORIOS BRONCE                                           ', 'accesorios-bronce', NULL, '2016-09-02', '2016-09-02', '011-074', '074'),
(94, '011', 'JUEGO INCRUSTACIONES                                        ', 'juego-incrustaciones', NULL, '2016-09-02', '2016-09-02', '011-073', '073'),
(95, '011', 'INCRUSTACIONES INDIVIDUALES                                 ', 'incrustaciones-individuales', NULL, '2016-09-02', '2016-09-02', '011-082', '082'),
(96, '011', 'COMPLEMENTARIOS GRIVAL                                      ', 'complementarios-grival', NULL, '2016-09-02', '2016-09-02', '011-084', '084'),
(97, '012', 'MERCANCIA CONSIGNACION                                      ', 'mercancia-consignacion', NULL, '2016-09-02', '2016-09-02', '012-083', '083'),
(98, '001', 'HERRAMIENTAS EXENTAS                                        ', 'herramientas-exentas', NULL, '2016-09-02', '2016-09-02', '001-088', '088'),
(99, '002', 'GRANIPLAS                                                   ', 'graniplas', NULL, '2016-09-02', '2016-09-02', '002-085', '085'),
(100, '004', 'CONSTRUCCIONES                                              ', 'construcciones', NULL, '2016-09-02', '2016-09-02', '004-090', '090'),
(101, '003', 'ELECTRODOMESTICOS                                           ', 'electrodomesticos', NULL, '2016-09-02', '2016-09-02', '003-091', '091'),
(102, '002', 'SIKA EXENTO                                                 ', 'sika-exento', NULL, '2016-09-02', '2016-09-02', '002-089', '089'),
(103, '009', 'LAMINAS                                                     ', 'laminas', NULL, '2016-09-02', '2016-09-02', '009-092', '092'),
(104, '008', 'CELTA                                                       ', 'celta', NULL, '2016-09-02', '2016-09-02', '008-096', '096'),
(105, '014', 'ROSCAS                                                      ', 'roscas', NULL, '2016-09-02', '2016-09-02', '014-087', '087'),
(106, '010', 'GRES IVA                                                    ', 'gres-iva', NULL, '2016-09-02', '2016-09-02', '010-093', '093'),
(107, '011', 'GRIVAL                                                      ', 'grival', NULL, '2016-09-02', '2016-09-02', '011-094', '094'),
(108, '013', 'CEMENTO PENDIENTE                                           ', 'cemento-pendiente', NULL, '2016-09-02', '2016-09-02', '013-095', '095'),
(109, '23', 'EJEMPLO 1', 'ejemplo-1', NULL, '2016-09-02', '2016-09-02', '100-100', '118'),
(110, '001', 'HERRAMIENTAS IVA 5                                         ', 'herramientas-iva-5', NULL, '2016-09-02', '2016-09-02', '001-099', '099'),
(111, '24', 'GENERAL', 'general', NULL, '2016-09-02', '2016-09-02', '1002-1003', '119'),
(112, '015', '2', '2', NULL, '2016-09-02', '2016-09-02', '015-2', '106'),
(113, '010', 'MATERIALES EXCENTOS', 'materiales-excentos', NULL, '2016-09-02', '2016-09-02', '010-086', '086'),
(114, '002', 'VINIFLEX                                                    ', 'viniflex', NULL, '2016-09-02', '2016-09-02', '002-098', '098'),
(115, '014', 'ALQUILER                                                    ', 'alquiler', NULL, '2016-09-02', '2016-09-02', '014-097', '097'),
(116, '011', 'SANITARIOS', 'sanitarios', NULL, '2016-09-02', '2016-09-02', '011-2015', '105'),
(117, '15', 'SALDOS INICIALES', 'saldos-iniciales', NULL, '2016-09-02', '2016-09-02', '999-999', '100'),
(118, '22', 'APARTES', 'apartes', NULL, '2016-09-02', '2016-09-02', '42-AP', '117');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `ciu_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
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
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `user_id`, `totalCart`, `total_compra`, `num_items`, `tipo_compra`, `vlr_envio`, `estado_id`, `conf`, `llave`, `pay_status`, `created_at`, `updated_at`) VALUES
(3, 47, 84001, 84001, 5, 2, 0, 2, 0, NULL, NULL, '2016-09-02', '2016-09-02'),
(4, 47, 16800, 16800, 1, 2, 1000, 1, 0, 'eder-20160902150947', 0, '2016-09-02', '2016-09-02'),
(5, 47, 16800, 16800, 1, 2, 1000, 1, 0, 'eder-20160902150906', 0, '2016-09-02', '2016-09-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_items`
--

CREATE TABLE `compra_items` (
  `id` int(11) NOT NULL,
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
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `compra_items`
--

INSERT INTO `compra_items` (`id`, `ArtSec`, `ArtCod`, `compra_id`, `nombre`, `image`, `valor_unitario`, `iva`, `cantidad`, `valIva`, `valor_total`, `id_producto`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, 3, 'ABOCINADOR FLARING L&W DE 3/16-5/8', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/4537300_8c6359d8d49043e7bfea85f3c6321632.jpg', 14483, 16, 5, '16800.00000', 84001, 12, '2016-09-02', '2016-09-02'),
(4, '3020', '032927', 4, 'ABOCINADOR FLARING L&W DE 3/16-5/8', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/4537300_8c6359d8d49043e7bfea85f3c6321632.jpg', 14483, 16, 1, NULL, 16800, 12, '2016-09-02', '2016-09-02'),
(5, '3020', '032927', 5, 'ABOCINADOR FLARING L&W DE 3/16-5/8', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/4537300_8c6359d8d49043e7bfea85f3c6321632.jpg', 14483, 16, 1, NULL, 16800, 12, '2016-09-02', '2016-09-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conn`
--

CREATE TABLE `conn` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `db` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `user` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `urlImg` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `DepNom` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `dias` (
  `id` int(11) NOT NULL,
  `dia_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `dia_barrio` (
  `id` int(11) NOT NULL,
  `dia_id` int(11) NOT NULL,
  `barrio_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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
(73, 6, 1, '2015-06-13', '2015-06-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
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
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nom_est` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `inventariofamilia` (
  `id` int(11) NOT NULL,
  `InvFamCod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvFamId` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvFamNom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `fam_slug` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `fam_InvSubGruCod` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `inventariofamilia`
--

INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(1, '001', '001', 'ARGOLLA CORTINA                                             ', 'argolla-cortina', '004             ', '2016-09-01', '2016-09-01'),
(2, '444', '444', 'PISTON PLASTICO                                             ', 'piston-plastico', '069             ', '2016-09-01', '2016-09-01'),
(3, '809', '809', 'CAL', 'cal', '086', '2016-09-01', '2016-09-01'),
(4, '827', '827', 'HDMI', 'hdmi', '024', '2016-09-01', '2016-09-01'),
(5, '828', '828', 'PINTURA ', 'pintura', '109', '2016-09-01', '2016-09-01'),
(6, '829', '829', 'TRANSPORTE', 'transporte', '110', '2016-09-01', '2016-09-01'),
(7, '830', '830', 'ELECTROBOMBA', 'electrobomba', '003', '2016-09-01', '2016-09-01'),
(8, '834', '834', 'GRIFERIA LAVAPLATOS STRETTO', 'griferia-lavaplatos-stretto', '113', '2016-09-01', '2016-09-01'),
(9, '832', '832', 'MALLAS INTERMATEX', 'mallas-intermatex', '111', '2016-09-01', '2016-09-01'),
(10, '833', '833', 'ARNES Y ESLINGA', 'arnes-y-eslinga', '112', '2016-09-01', '2016-09-01'),
(11, '835', '835', 'DUCHA-REGADERA', 'ducha-regadera', '114', '2016-09-01', '2016-09-01'),
(12, '838', '838', 'TANQUES ACUAPLAST', 'tanques-acuaplast', '115', '2016-09-01', '2016-09-01'),
(13, '837', '837', 'PROTECTOR AUDITIVO', 'protector-auditivo', '058', '2016-09-01', '2016-09-01'),
(14, '002', '002', 'GANCHOS CORTINA                                             ', 'ganchos-cortina', '004             ', '2016-09-01', '2016-09-01'),
(15, '782', '782', 'BOMBILLO PANEL LED', 'bombillo-panel-led', '023', '2016-09-01', '2016-09-01'),
(16, '841', '841', 'OTROS', 'otros', '116', '2016-09-01', '2016-09-01'),
(17, '003', '003', 'MARGARITAS                                                  ', 'margaritas', '004             ', '2016-09-01', '2016-09-01'),
(18, '831', '831', 'EQUIPO SOLDADOR', 'equipo-soldador', '003', '2016-09-01', '2016-09-01'),
(19, '836', '836', 'INCRUSTACIONES', 'incrustaciones', '114', '2016-09-01', '2016-09-01'),
(20, '004', '004', 'SOPORTE CORTINA                                             ', 'soporte-cortina', '004             ', '2016-09-01', '2016-09-01'),
(21, '839', '839', 'IMPERMEABLE', 'impermeable', '058', '2016-09-01', '2016-09-01'),
(22, '840', '840', 'ACOPLE CALENTADOR', 'acople-calentador', '081', '2016-09-01', '2016-09-01'),
(23, '006', '006', 'TUBO CORTINA                                                ', 'tubo-cortina', '004             ', '2016-09-01', '2016-09-01'),
(24, '005', '005', 'TERMINAL CORTINA                                            ', 'terminal-cortina', '004             ', '2016-09-01', '2016-09-01'),
(25, '008', '008', 'ATA TODO', 'ata-todo', '005', '2016-09-01', '2016-09-01'),
(26, '810', '810', 'INTERESES', 'intereses', '107', '2016-09-01', '2016-09-01'),
(27, '009', '009', 'CABLE MATIZADO                                              ', 'cable-matizado', '005             ', '2016-09-01', '2016-09-01'),
(28, '010', '010', 'CADENA                                                      ', 'cadena', '005             ', '2016-09-01', '2016-09-01'),
(29, '011', '011', 'MADEJA DE PIOLA                                             ', 'madeja-de-piola', '005             ', '2016-09-01', '2016-09-01'),
(30, '806', '806', 'BATERIAS', 'baterias', '057', '2016-09-01', '2016-09-01'),
(31, '007', '007', 'ALAMBRE PLASTICO                                            ', 'alambre-plastico', '005             ', '2016-09-01', '2016-09-01'),
(32, '012', '012', 'MANILA                                                      ', 'manila', '005             ', '2016-09-01', '2016-09-01'),
(33, '013', '013', 'MIMBRE                                                      ', 'mimbre', '005             ', '2016-09-01', '2016-09-01'),
(34, '014', '014', 'NYLON                                                       ', 'nylon', '005             ', '2016-09-01', '2016-09-01'),
(35, '016', '016', 'SOGA NAUTICA                                                ', 'soga-nautica', '005             ', '2016-09-01', '2016-09-01'),
(36, '015', '015', 'SOGA MARINO                                                 ', 'soga-marino', '005             ', '2016-09-01', '2016-09-01'),
(37, '018', '018', 'TUBITO                                                      ', 'tubito', '005             ', '2016-09-01', '2016-09-01'),
(38, '019', '019', 'ADHESIVOS                                                   ', 'adhesivos', '006             ', '2016-09-01', '2016-09-01'),
(39, '017', '017', 'SOGA RAFIA                                                  ', 'soga-rafia', '005             ', '2016-09-01', '2016-09-01'),
(40, '020', '020', 'COLBON                                                      ', 'colbon', '006             ', '2016-09-01', '2016-09-01'),
(41, '024', '024', 'SILICONAS                                                   ', 'siliconas', '006             ', '2016-09-01', '2016-09-01'),
(42, '022', '022', 'PEGANTE AMARILLO                                            ', 'pegante-amarillo', '006             ', '2016-09-01', '2016-09-01'),
(43, '021', '021', 'MASILLAS                                                    ', 'masillas', '006             ', '2016-09-01', '2016-09-01'),
(44, '023', '023', 'SINTESOLDA                                                  ', 'sintesolda', '006             ', '2016-09-01', '2016-09-01'),
(45, '026', '026', 'CAUCHOS                                                     ', 'cauchos', '007             ', '2016-09-01', '2016-09-01'),
(46, '025', '025', 'SUPERCRYL                                                   ', 'supercryl', '006             ', '2016-09-01', '2016-09-01'),
(47, '027', '027', 'CUADRANTES                                                  ', 'cuadrantes', '007             ', '2016-09-01', '2016-09-01'),
(48, '030', '030', 'CERAMICA PARED ALFA                                         ', 'ceramica-pared-alfa', '008             ', '2016-09-01', '2016-09-01'),
(49, '028', '028', 'CUCHILLAS                                                   ', 'cuchillas', '007             ', '2016-09-01', '2016-09-01'),
(50, '029', '029', 'TAPON OLLA                                                  ', 'tapon-olla', '007             ', '2016-09-01', '2016-09-01'),
(51, '031', '031', 'CERAMICA PISO ALFA                                          ', 'ceramica-piso-alfa', '008             ', '2016-09-01', '2016-09-01'),
(52, '033', '033', 'CERAMICA PARED EURO                                         ', 'ceramica-pared-euro', '009             ', '2016-09-01', '2016-09-01'),
(53, '814', '814', 'PINTURA AGUA', 'pintura-agua', '108', '2016-09-01', '2016-09-01'),
(54, '032', '032', 'CENEFAS ALFA', 'cenefas-alfa', '008', '2016-09-01', '2016-09-01'),
(55, '034', '034', 'CERAMICA PISO EURO                                          ', 'ceramica-piso-euro', '009             ', '2016-09-01', '2016-09-01'),
(56, '035', '035', 'LISTELO EURO                                                ', 'listelo-euro', '009             ', '2016-09-01', '2016-09-01'),
(57, '812', '812', 'MALLAS', 'mallas', '008', '2016-09-01', '2016-09-01'),
(58, '036', '036', 'CERAMICA PARED ITALIA                                       ', 'ceramica-pared-italia', '010             ', '2016-09-01', '2016-09-01'),
(59, '038', '038', 'LISTELOS ITALIA                                             ', 'listelos-italia', '010             ', '2016-09-01', '2016-09-01'),
(60, '039', '039', 'TRENZAS                                                     ', 'trenzas', '010             ', '2016-09-01', '2016-09-01'),
(61, '042', '042', 'ESQUINEROS INTERMATEX                                       ', 'esquineros-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(62, '041', '041', 'CORDON ITALIA                                               ', 'cordon-italia', '011             ', '2016-09-01', '2016-09-01'),
(63, '043', '043', 'GUARDAESCOBAS INTERMATEX                                    ', 'guardaescobas-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(64, '037', '037', 'CERAMICA PISO ITALIA                                        ', 'ceramica-piso-italia', '010             ', '2016-09-01', '2016-09-01'),
(65, '815', '815', 'PEDESTAL ALFA', 'pedestal-alfa', '064', '2016-09-01', '2016-09-01'),
(66, '044', '044', 'LISTELOS INTERMATEX                                         ', 'listelos-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(67, '816', '816', 'ACCESORIOS ALFA', 'accesorios-alfa', '060', '2016-09-01', '2016-09-01'),
(68, '047', '047', 'TRENZA INTERMATEX                                           ', 'trenza-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(69, '048', '048', 'LISTELO ZAFIRO                                              ', 'listelo-zafiro', '012             ', '2016-09-01', '2016-09-01'),
(70, '050', '050', 'CONCOLOR                                                    ', 'concolor', '014             ', '2016-09-01', '2016-09-01'),
(71, '051', '051', 'EUROCOLOR                                                   ', 'eurocolor', '014             ', '2016-09-01', '2016-09-01'),
(72, '052', '052', 'EUROPEGA                                                    ', 'europega', '014             ', '2016-09-01', '2016-09-01'),
(73, '053', '053', 'MINERAL                                                     ', 'mineral', '014             ', '2016-09-01', '2016-09-01'),
(74, '049', '049', 'BOQUILLA                                                    ', 'boquilla', '014             ', '2016-09-01', '2016-09-01'),
(75, '040', '040', 'CENEFA INTERMATEX                                           ', 'cenefa-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(76, '055', '055', 'PEGOPERFECTO                                                ', 'pegoperfecto', '014             ', '2016-09-01', '2016-09-01'),
(77, '056', '056', 'WINES                                                       ', 'wines', '013             ', '2016-09-01', '2016-09-01'),
(78, '057', '057', 'CANDADOS EGRET                                              ', 'candados-egret', '015             ', '2016-09-01', '2016-09-01'),
(79, '046', '046', 'TACOS INTERMATEX                                            ', 'tacos-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(80, '790', '790', 'COMBO ALFA', 'combo-alfa', '060', '2016-09-01', '2016-09-01'),
(81, '058', '058', 'CANDADOS PROFESIONAL                                        ', 'candados-profesional', '015             ', '2016-09-01', '2016-09-01'),
(82, '045', '045', 'MOLDURAS INTERMATEX                                         ', 'molduras-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(83, '054', '054', 'PEGACOR                                                     ', 'pegacor', '014             ', '2016-09-01', '2016-09-01'),
(84, '793', '793', 'CHAPA MUEBLE', 'chapa-mueble', '018', '2016-09-01', '2016-09-01'),
(85, '795', '795', 'LLAVE LAVADORA', 'llave-lavadora', '084', '2016-09-01', '2016-09-01'),
(86, '059', '059', 'CANDADOS SECURITY                                           ', 'candados-security', '015             ', '2016-09-01', '2016-09-01'),
(87, '061', '061', 'CANDADO TIPO ITALIANO                                       ', 'candado-tipo-italiano', '015             ', '2016-09-01', '2016-09-01'),
(88, '794', '794', 'CALIBRADOR', 'calibrador', '058', '2016-09-01', '2016-09-01'),
(89, '062', '062', 'ESCUDO                                                      ', 'escudo', '016             ', '2016-09-01', '2016-09-01'),
(90, '063', '063', 'MANIJA                                                      ', 'manija', '016             ', '2016-09-01', '2016-09-01'),
(91, '060', '060', 'CANDADO TIPO ALEMAN                                         ', 'candado-tipo-aleman', '015             ', '2016-09-01', '2016-09-01'),
(92, '064', '064', 'PORTACANDADO INDUMA                                         ', 'portacandado-induma', '017             ', '2016-09-01', '2016-09-01'),
(93, '065', '065', 'PORTACANDADO SIMPLE                                         ', 'portacandado-simple', '017             ', '2016-09-01', '2016-09-01'),
(94, '067', '067', 'ALBADILLAS                                                  ', 'albadillas', '019             ', '2016-09-01', '2016-09-01'),
(95, '785', '785', 'INJERTO', 'injerto', '101', '2016-09-01', '2016-09-01'),
(96, '817', '817', 'GRIFERIA ALFA', 'griferia-alfa', '060', '2016-09-01', '2016-09-01'),
(97, '069', '069', 'CIERRE                                                      ', 'cierre', '019             ', '2016-09-01', '2016-09-01'),
(98, '068', '068', 'BOTONES                                                     ', 'botones', '019             ', '2016-09-01', '2016-09-01'),
(99, '071', '071', 'PASADOR                                                     ', 'pasador', '019             ', '2016-09-01', '2016-09-01'),
(100, '070', '070', 'OJO MAGICO                                                  ', 'ojo-magico', '019             ', '2016-09-01', '2016-09-01'),
(101, '066', '066', 'PORTACANDADO VERA                                           ', 'portacandado-vera', '017             ', '2016-09-01', '2016-09-01'),
(102, '797', '797', 'MUEBLE ESPEJO', 'mueble-espejo', '103', '2016-09-01', '2016-09-01'),
(103, '072', '072', 'RODAJA ACERO                                                ', 'rodaja-acero', '019             ', '2016-09-01', '2016-09-01'),
(104, '076', '076', 'TRANCA PUERTA                                               ', 'tranca-puerta', '019             ', '2016-09-01', '2016-09-01'),
(105, '077', '077', 'BISAGRAS                                                    ', 'bisagras', '019             ', '2016-09-01', '2016-09-01'),
(106, '798', '798', 'MUEBLE LAVAMANOS', 'mueble-lavamanos', '103', '2016-09-01', '2016-09-01'),
(107, '075', '075', 'TOPE PUERTA                                                 ', 'tope-puerta', '019             ', '2016-09-01', '2016-09-01'),
(108, '074', '074', 'SOSTEN PLEGABLE                                             ', 'sosten-plegable', '019             ', '2016-09-01', '2016-09-01'),
(109, '073', '073', 'SOPORTE CLOSET                                              ', 'soporte-closet', '019             ', '2016-09-01', '2016-09-01'),
(110, '078', '078', 'CHAPA SECURITY                                              ', 'chapa-security', '018             ', '2016-09-01', '2016-09-01'),
(111, '081', '081', 'CHAPA INAFER                                                ', 'chapa-inafer', '018             ', '2016-09-01', '2016-09-01'),
(112, '079', '079', 'CHAPA VERA                                                  ', 'chapa-vera', '018             ', '2016-09-01', '2016-09-01'),
(113, '082', '082', 'CHAPA YALE                                                  ', 'chapa-yale', '018             ', '2016-09-01', '2016-09-01'),
(114, '084', '084', 'CODO CALLE GALVANIZADO                                      ', 'codo-calle-galvanizado', '029             ', '2016-09-01', '2016-09-01'),
(115, '080', '080', 'CHAPA GATO                                                  ', 'chapa-gato', '018             ', '2016-09-01', '2016-09-01'),
(116, '083', '083', 'BUJE GALVANIZADO                                            ', 'buje-galvanizado', '029             ', '2016-09-01', '2016-09-01'),
(117, '789', '789', 'TRAPERO', 'trapero', '058', '2016-09-01', '2016-09-01'),
(118, '086', '086', 'NIPLE GALVANIZADO                                           ', 'niple-galvanizado', '029             ', '2016-09-01', '2016-09-01'),
(119, '088', '088', 'ROSCAS                                                      ', 'roscas', '029             ', '2016-09-01', '2016-09-01'),
(120, '089', '089', 'SEMICODO GALVANIZADO                                        ', 'semicodo-galvanizado', '029             ', '2016-09-01', '2016-09-01'),
(121, '087', '087', 'REDUCCIN GALVANIZADO                                        ', 'reduccin-galvanizado', '029             ', '2016-09-01', '2016-09-01'),
(122, '085', '085', 'CODO GALVANIZADO                                            ', 'codo-galvanizado', '029             ', '2016-09-01', '2016-09-01'),
(123, '090', '090', 'TAPON GALVANIZADO                                           ', 'tapon-galvanizado', '029             ', '2016-09-01', '2016-09-01'),
(124, '091', '091', 'TEE GALVANIZADA                                             ', 'tee-galvanizada', '029             ', '2016-09-01', '2016-09-01'),
(125, '092', '092', 'UNION GALVANIZADO                                           ', 'union-galvanizado', '029             ', '2016-09-01', '2016-09-01'),
(126, '093', '093', 'UNIVERSAL GALVANIZADA                                       ', 'universal-galvanizada', '029             ', '2016-09-01', '2016-09-01'),
(127, '094', '094', 'TUBOS GALVANIZADO                                           ', 'tubos-galvanizado', '030             ', '2016-09-01', '2016-09-01'),
(128, '095', '095', 'UNIFIX                                                      ', 'unifix', '031             ', '2016-09-01', '2016-09-01'),
(129, '096', '096', 'PINTURA AGUA                                                ', 'pintura-agua', '032             ', '2016-09-01', '2016-09-01'),
(130, '784', '784', 'HEMBRA', 'hembra', '101', '2016-09-01', '2016-09-01'),
(131, '788', '788', 'TINTILLA', 'tintilla', '035', '2016-09-01', '2016-09-01'),
(132, '098', '098', 'PINTURA ACEITE                                              ', 'pintura-aceite', '032             ', '2016-09-01', '2016-09-01'),
(133, '097', '097', 'TRATAMIENTO SUPERFICIES                                     ', 'tratamiento-superficies', '032             ', '2016-09-01', '2016-09-01'),
(134, '099', '099', 'AEROSOLES                                                   ', 'aerosoles', '032             ', '2016-09-01', '2016-09-01'),
(135, '791', '791', 'TRANSPORTE', 'transporte', '102', '2016-09-01', '2016-09-01'),
(136, '818', '818', 'LLANA METALICA', 'llana-metalica', '058', '2016-09-01', '2016-09-01'),
(137, '819', '819', 'PIEDRAS MONTADAS', 'piedras-montadas', '003', '2016-09-01', '2016-09-01'),
(138, '823', '823', 'RODACHINA', 'rodachina', '007', '2016-09-01', '2016-09-01'),
(139, '843', '843', 'EJEMPLO 2', 'ejemplo-2', '118', '2016-09-01', '2016-09-01'),
(140, '844', '844', 'GENERAL', 'general', '119', '2016-09-01', '2016-09-01'),
(141, '101', '101', 'PINTURA TIPO II                                             ', 'pintura-tipo-ii', '033             ', '2016-09-01', '2016-09-01'),
(142, '102', '102', 'PINTURA TIPO III                                            ', 'pintura-tipo-iii', '033             ', '2016-09-01', '2016-09-01'),
(143, '103', '103', 'ESMALTES                                                    ', 'esmaltes', '033             ', '2016-09-01', '2016-09-01'),
(144, '104', '104', 'COLPEGA                                                     ', 'colpega', '035             ', '2016-09-01', '2016-09-01'),
(145, '100', '100', 'ANTICORROSIVO                                               ', 'anticorrosivo', '033             ', '2016-09-01', '2016-09-01'),
(146, '105', '105', 'CAL                                                         ', 'cal', '035             ', '2016-09-01', '2016-09-01'),
(147, '106', '106', 'CARBURO                                                     ', 'carburo', '035             ', '2016-09-01', '2016-09-01'),
(148, '107', '107', 'ESTUCO                                                      ', 'estuco', '035             ', '2016-09-01', '2016-09-01'),
(149, '108', '108', 'GRECONAL                                                    ', 'greconal', '035             ', '2016-09-01', '2016-09-01'),
(150, '109', '109', 'PVA IMPRIMIANTE                                           ', 'pva-imprimiante', '035             ', '2016-09-01', '2016-09-01'),
(151, '112', '112', 'SANITARIA PAVCO                                             ', 'sanitaria-pavco', '044             ', '2016-09-01', '2016-09-01'),
(152, '111', '111', 'TAPA GOTERA                                                 ', 'tapa-gotera', '035             ', '2016-09-01', '2016-09-01'),
(153, '115', '115', 'CANALES PAVCO                                               ', 'canales-pavco', '044             ', '2016-09-01', '2016-09-01'),
(154, '110', '110', 'VARETA                                                      ', 'vareta', '035             ', '2016-09-01', '2016-09-01'),
(155, '113', '113', 'PRESION PAVCO                                               ', 'presion-pavco', '044             ', '2016-09-01', '2016-09-01'),
(156, '114', '114', 'NOVAFORT PAVCO                                              ', 'novafort-pavco', '044             ', '2016-09-01', '2016-09-01'),
(157, '117', '117', 'VALVULA INCORPORACION', 'valvula-incorporacion', '045', '2016-09-01', '2016-09-01'),
(158, '118', '118', 'NOVAFORT GERFOR                                             ', 'novafort-gerfor', '045             ', '2016-09-01', '2016-09-01'),
(159, '116', '116', 'SANITARIA GERFOR                                            ', 'sanitaria-gerfor', '045             ', '2016-09-01', '2016-09-01'),
(160, '120', '120', 'ANCLAJES                                                    ', 'anclajes', '001             ', '2016-09-01', '2016-09-01'),
(161, '119', '119', 'TORNILLOS', 'tornillos', '001', '2016-09-01', '2016-09-01'),
(162, '121', '121', 'ARANDELAS                                                   ', 'arandelas', '001             ', '2016-09-01', '2016-09-01'),
(163, '122', '122', 'CANCAMO                                                     ', 'cancamo', '001             ', '2016-09-01', '2016-09-01'),
(164, '125', '125', 'GRAPAS                                                      ', 'grapas', '001             ', '2016-09-01', '2016-09-01'),
(165, '123', '123', 'CHAZOS                                                      ', 'chazos', '001             ', '2016-09-01', '2016-09-01'),
(166, '126', '126', 'GUAZA ARANDELA                                              ', 'guaza-arandela', '001             ', '2016-09-01', '2016-09-01'),
(167, '124', '124', 'CLAVOS                                                      ', 'clavos', '001             ', '2016-09-01', '2016-09-01'),
(168, '127', '127', 'PUNTILLA                                                    ', 'puntilla', '001             ', '2016-09-01', '2016-09-01'),
(169, '128', '128', 'REMACHES                                                    ', 'remaches', '001             ', '2016-09-01', '2016-09-01'),
(170, '130', '130', 'TUERCAS                                                     ', 'tuercas', '001             ', '2016-09-01', '2016-09-01'),
(171, '132', '132', 'PIAMIGO                                                     ', 'piamigo', '001             ', '2016-09-01', '2016-09-01'),
(172, '131', '131', 'ESTOPEROLES                                                 ', 'estoperoles', '001             ', '2016-09-01', '2016-09-01'),
(173, '129', '129', 'TACHUELAS                                                   ', 'tachuelas', '001             ', '2016-09-01', '2016-09-01'),
(174, '133', '133', 'PORRAS                                                      ', 'porras', '003             ', '2016-09-01', '2016-09-01'),
(175, '134', '134', 'PALAS                                                       ', 'palas', '088             ', '2016-09-01', '2016-09-01'),
(176, '136', '136', 'PICAS                                                       ', 'picas', '088             ', '2016-09-01', '2016-09-01'),
(177, '139', '139', 'TALADROS                                                    ', 'taladros', '003             ', '2016-09-01', '2016-09-01'),
(178, '135', '135', 'PALADRAGAS                                                  ', 'paladragas', '003             ', '2016-09-01', '2016-09-01'),
(179, '138', '138', 'PULIDORAS                                                   ', 'pulidoras', '003             ', '2016-09-01', '2016-09-01'),
(180, '137', '137', 'BARRAS                                                      ', 'barras', '088             ', '2016-09-01', '2016-09-01'),
(181, '140', '140', 'AZADON                                                      ', 'azadon', '003             ', '2016-09-01', '2016-09-01'),
(182, '145', '145', 'MACHETA                                                     ', 'macheta', '003             ', '2016-09-01', '2016-09-01'),
(183, '144', '144', 'BATEA                                                       ', 'batea', '003             ', '2016-09-01', '2016-09-01'),
(184, '141', '141', 'BALDE NEGRO                                                 ', 'balde-negro', '003             ', '2016-09-01', '2016-09-01'),
(185, '142', '142', 'SERRUCHOS                                                   ', 'serruchos', '003             ', '2016-09-01', '2016-09-01'),
(186, '143', '143', 'SIERRA                                                      ', 'sierra', '003             ', '2016-09-01', '2016-09-01'),
(187, '807', '807', 'GRASAS', 'grasas', '057', '2016-09-01', '2016-09-01'),
(188, '148', '148', 'CUCHILLA GUADANA                                            ', 'cuchilla-guadana', '088             ', '2016-09-01', '2016-09-01'),
(189, '150', '150', 'HACHAS                                                      ', 'hachas', '003             ', '2016-09-01', '2016-09-01'),
(190, '147', '147', 'CARRETILLA                                                  ', 'carretilla', '003             ', '2016-09-01', '2016-09-01'),
(191, '151', '151', 'LLANA MADERA                                                ', 'llana-madera', '003             ', '2016-09-01', '2016-09-01'),
(192, '149', '149', 'ESCALERAS                                                   ', 'escaleras', '003             ', '2016-09-01', '2016-09-01'),
(193, '152', '152', 'MAQUINA                                                     ', 'maquina', '003             ', '2016-09-01', '2016-09-01'),
(194, '153', '153', 'REGLA METALICA                                              ', 'regla-metalica', '003             ', '2016-09-01', '2016-09-01'),
(195, '154', '154', 'ZORRA METALICA                                              ', 'zorra-metalica', '003             ', '2016-09-01', '2016-09-01'),
(196, '146', '146', 'CANECA                                                      ', 'caneca', '003             ', '2016-09-01', '2016-09-01'),
(197, '156', '156', 'CONO O TAPON                                                ', 'cono-o-tapon', '056             ', '2016-09-01', '2016-09-01'),
(198, '158', '158', 'DISCO                                                       ', 'disco', '056             ', '2016-09-01', '2016-09-01'),
(199, '159', '159', 'LIJAS                                                       ', 'lijas', '056             ', '2016-09-01', '2016-09-01'),
(200, '157', '157', 'COPAS                                                       ', 'copas', '056             ', '2016-09-01', '2016-09-01'),
(201, '160', '160', 'TROMPOS TALADROS                                            ', 'trompos-taladros', '056             ', '2016-09-01', '2016-09-01'),
(202, '162', '162', 'HOJAS BISTURI                                               ', 'hojas-bisturi', '057             ', '2016-09-01', '2016-09-01'),
(203, '163', '163', 'HOJAS GUADANA                                               ', 'hojas-guadana', '057             ', '2016-09-01', '2016-09-01'),
(204, '164', '164', 'ESCOBILLAS                                                  ', 'escobillas', '057             ', '2016-09-01', '2016-09-01'),
(205, '161', '161', 'LIMAS                                                       ', 'limas', '056             ', '2016-09-01', '2016-09-01'),
(206, '166', '166', 'LLANTAS                                                     ', 'llantas', '057             ', '2016-09-01', '2016-09-01'),
(207, '167', '167', 'SEGUETA                                                     ', 'segueta', '057             ', '2016-09-01', '2016-09-01'),
(208, '165', '165', 'RESPUESTOS RODILLO                                          ', 'respuestos-rodillo', '057             ', '2016-09-01', '2016-09-01'),
(209, '168', '168', 'NEUMATICOS                                                  ', 'neumaticos', '057             ', '2016-09-01', '2016-09-01'),
(210, '172', '172', 'SOPORTE PARA MAQUINA                                        ', 'soporte-para-maquina', '057             ', '2016-09-01', '2016-09-01'),
(211, '171', '171', 'GUSANO PARA MAQUINA                                         ', 'gusano-para-maquina', '057             ', '2016-09-01', '2016-09-01'),
(212, '173', '173', 'EJE PARA CARRETILLA                                         ', 'eje-para-carretilla', '057             ', '2016-09-01', '2016-09-01'),
(213, '174', '174', 'MANGUERA GAS                                                ', 'manguera-gas', '059             ', '2016-09-01', '2016-09-01'),
(214, '169', '169', 'RACORES                                                     ', 'racores', '057             ', '2016-09-01', '2016-09-01'),
(215, '170', '170', 'RESPUESTOS LICUADORA                                        ', 'respuestos-licuadora', '057             ', '2016-09-01', '2016-09-01'),
(216, '175', '175', 'MANGUERA LAVADORA                                           ', 'manguera-lavadora', '059             ', '2016-09-01', '2016-09-01'),
(217, '176', '176', 'MANGUERA NEGRA                                              ', 'manguera-negra', '059             ', '2016-09-01', '2016-09-01'),
(218, '179', '179', 'MANGUERA SWAN                                               ', 'manguera-swan', '059             ', '2016-09-01', '2016-09-01'),
(219, '177', '177', 'MANGUERA NIVEL CRISTAL                                      ', 'manguera-nivel-cristal', '059             ', '2016-09-01', '2016-09-01'),
(220, '178', '178', 'MANGUERA RIEGO                                              ', 'manguera-riego', '059             ', '2016-09-01', '2016-09-01'),
(221, '181', '181', 'BISTURI                                                     ', 'bisturi', '058             ', '2016-09-01', '2016-09-01'),
(222, '182', '182', 'BROCHAS                                                     ', 'brochas', '058             ', '2016-09-01', '2016-09-01'),
(223, '183', '183', 'BROCAS                                                      ', 'brocas', '058             ', '2016-09-01', '2016-09-01'),
(224, '180', '180', 'BOTAS                                                       ', 'botas', '058             ', '2016-09-01', '2016-09-01'),
(225, '185', '185', 'CASCO                                                       ', 'casco', '058             ', '2016-09-01', '2016-09-01'),
(226, '184', '184', 'CARETA SOLDAR                                               ', 'careta-soldar', '058             ', '2016-09-01', '2016-09-01'),
(227, '187', '187', 'GUANTES                                                     ', 'guantes', '058             ', '2016-09-01', '2016-09-01'),
(228, '186', '186', 'CORAZA                                                      ', 'coraza', '058             ', '2016-09-01', '2016-09-01'),
(229, '190', '190', 'PINCEL                                                      ', 'pincel', '058             ', '2016-09-01', '2016-09-01'),
(230, '188', '188', 'LLAVE PARA TALADRO                                          ', 'llave-para-taladro', '058             ', '2016-09-01', '2016-09-01'),
(231, '192', '192', 'AEROGRAFOS                                                  ', 'aerografos', '058             ', '2016-09-01', '2016-09-01'),
(232, '193', '193', 'ANILLO AJUSTADOR                                            ', 'anillo-ajustador', '058             ', '2016-09-01', '2016-09-01'),
(233, '189', '189', 'PIEDRA AFILAR                                               ', 'piedra-afilar', '058             ', '2016-09-01', '2016-09-01'),
(234, '191', '191', 'RUBY BURIL                                                  ', 'ruby-buril', '058             ', '2016-09-01', '2016-09-01'),
(235, '194', '194', 'DESLIZADOR PUNTILLA                                         ', 'deslizador-puntilla', '058             ', '2016-09-01', '2016-09-01'),
(236, '195', '195', 'GAFAS                                                       ', 'gafas', '058             ', '2016-09-01', '2016-09-01'),
(237, '197', '197', 'PLOMADA                                                     ', 'plomada', '058             ', '2016-09-01', '2016-09-01'),
(238, '196', '196', 'MASCARILLAS                                                 ', 'mascarillas', '058             ', '2016-09-01', '2016-09-01'),
(239, '198', '198', 'DECAMETRO                                                   ', 'decametro', '058             ', '2016-09-01', '2016-09-01'),
(240, '200', '200', 'CORTAFRIO                                                   ', 'cortafrio', '058             ', '2016-09-01', '2016-09-01'),
(241, '199', '199', 'ALICATE                                                     ', 'alicate', '058             ', '2016-09-01', '2016-09-01'),
(242, '201', '201', 'CUCHILLO                                                    ', 'cuchillo', '058             ', '2016-09-01', '2016-09-01'),
(243, '202', '202', 'CEPILLO ACERO                                               ', 'cepillo-acero', '058             ', '2016-09-01', '2016-09-01'),
(244, '203', '203', 'DESTORNILLADOR                                              ', 'destornillador', '058             ', '2016-09-01', '2016-09-01'),
(245, '205', '205', 'ESPATULA                                                    ', 'espatula', '058             ', '2016-09-01', '2016-09-01'),
(246, '204', '204', 'ESCUADRAS                                                   ', 'escuadras', '058             ', '2016-09-01', '2016-09-01'),
(247, '786', '786', 'MOTORES', 'motores', '091', '2016-09-01', '2016-09-01'),
(248, '208', '208', 'RODILLOS                                                    ', 'rodillos', '058             ', '2016-09-01', '2016-09-01'),
(249, '207', '207', 'FORMON                                                      ', 'formon', '058             ', '2016-09-01', '2016-09-01'),
(250, '206', '206', 'FLEXOMETRO                                                  ', 'flexometro', '058             ', '2016-09-01', '2016-09-01'),
(251, '209', '209', 'HOMBRE SOLO                                                 ', 'hombre-solo', '058             ', '2016-09-01', '2016-09-01'),
(252, '210', '210', 'JUEGO COPAS                                                 ', 'juego-copas', '058             ', '2016-09-01', '2016-09-01'),
(253, '212', '212', 'CAJA HERRAMIENTAS                                           ', 'caja-herramientas', '058             ', '2016-09-01', '2016-09-01'),
(254, '213', '213', 'CORTAVIDRIO                                                 ', 'cortavidrio', '058             ', '2016-09-01', '2016-09-01'),
(255, '214', '214', 'CORTALOZA                                                   ', 'cortaloza', '058             ', '2016-09-01', '2016-09-01'),
(256, '211', '211', 'PALUSTRES                                                   ', 'palustres', '058             ', '2016-09-01', '2016-09-01'),
(257, '215', '215', 'FALSA ESCUADRA                                              ', 'falsa-escuadra', '058             ', '2016-09-01', '2016-09-01'),
(258, '218', '218', 'LLAVE BRISTOL                                               ', 'llave-bristol', '058             ', '2016-09-01', '2016-09-01'),
(259, '217', '217', 'LLAVE BROCA                                                 ', 'llave-broca', '058             ', '2016-09-01', '2016-09-01'),
(260, '216', '216', 'GRAPADORA                                                   ', 'grapadora', '058             ', '2016-09-01', '2016-09-01'),
(261, '219', '219', 'LLAVE EXPANSION                                             ', 'llave-expansion', '058             ', '2016-09-01', '2016-09-01'),
(262, '220', '220', 'SIMBRAZ                                                     ', 'simbraz', '058             ', '2016-09-01', '2016-09-01'),
(263, '221', '221', 'MARCO SEGUETA                                               ', 'marco-segueta', '058             ', '2016-09-01', '2016-09-01'),
(264, '222', '222', 'NIVELES                                                     ', 'niveles', '058             ', '2016-09-01', '2016-09-01'),
(265, '223', '223', 'PINZAS                                                      ', 'pinzas', '058             ', '2016-09-01', '2016-09-01'),
(266, '225', '225', 'PUNTEROS                                                    ', 'punteros', '058             ', '2016-09-01', '2016-09-01'),
(267, '226', '226', 'REMACHADORA                                                 ', 'remachadora', '058             ', '2016-09-01', '2016-09-01'),
(268, '227', '227', 'SINCEL                                                      ', 'sincel', '058             ', '2016-09-01', '2016-09-01'),
(269, '224', '224', 'PISTOLA                                                     ', 'pistola', '058             ', '2016-09-01', '2016-09-01'),
(270, '228', '228', 'RASTRILLO                                                   ', 'rastrillo', '003             ', '2016-09-01', '2016-09-01'),
(271, '230', '230', 'TIJERAS                                                     ', 'tijeras', '058             ', '2016-09-01', '2016-09-01'),
(272, '229', '229', 'TENAZA                                                      ', 'tenaza', '058             ', '2016-09-01', '2016-09-01'),
(273, '231', '231', 'ARENA                                                       ', 'arena', '086             ', '2016-09-01', '2016-09-01'),
(274, '232', '232', 'HIERRO                                                      ', 'hierro', '036             ', '2016-09-01', '2016-09-01'),
(275, '234', '234', 'CEMENTO GRIS                                                ', 'cemento-gris', '036             ', '2016-09-01', '2016-09-01'),
(276, '235', '235', 'CAOLIN                                                      ', 'caolin', '036             ', '2016-09-01', '2016-09-01'),
(277, '236', '236', 'PIEDRA BOLO                                                 ', 'piedra-bolo', '086             ', '2016-09-01', '2016-09-01'),
(278, '237', '237', 'CEMENTO BLANCO                                              ', 'cemento-blanco', '036             ', '2016-09-01', '2016-09-01'),
(279, '238', '238', 'CHIPA                                                       ', 'chipa', '036             ', '2016-09-01', '2016-09-01'),
(280, '233', '233', 'LADRILLO                                                    ', 'ladrillo', '086             ', '2016-09-01', '2016-09-01'),
(281, '239', '239', 'CAJA CONTADOR AGUA                                          ', 'caja-contador-agua', '036             ', '2016-09-01', '2016-09-01'),
(282, '240', '240', 'GRANITO                                                     ', 'granito', '036             ', '2016-09-01', '2016-09-01'),
(283, '242', '242', 'MARMOLINA                                                   ', 'marmolina', '036             ', '2016-09-01', '2016-09-01'),
(284, '243', '243', 'TRITURADO                                                   ', 'triturado', '036             ', '2016-09-01', '2016-09-01'),
(285, '241', '241', 'GRAVILLA                                                    ', 'gravilla', '036             ', '2016-09-01', '2016-09-01'),
(286, '246', '246', 'CINTA SENALIZACION                                          ', 'cinta-senalizacion', '036             ', '2016-09-01', '2016-09-01'),
(287, '245', '245', 'YESO                                                        ', 'yeso', '036             ', '2016-09-01', '2016-09-01'),
(288, '244', '244', 'REVUELTO                                                    ', 'revuelto', '086             ', '2016-09-01', '2016-09-01'),
(289, '248', '248', 'ALAMBRE PUAS                                                ', 'alambre-puas', '036             ', '2016-09-01', '2016-09-01'),
(290, '247', '247', 'ALAMBRE GALVANIZADO                                         ', 'alambre-galvanizado', '036             ', '2016-09-01', '2016-09-01'),
(291, '249', '249', 'SACO FIBRA                                                  ', 'saco-fibra', '086             ', '2016-09-01', '2016-09-01'),
(292, '251', '251', 'CALAO GRES                                                  ', 'calao-gres', '037             ', '2016-09-01', '2016-09-01'),
(293, '250', '250', 'CALAO CEMENTO                                               ', 'calao-cemento', '037             ', '2016-09-01', '2016-09-01'),
(294, '252', '252', 'ESCALGRES                                                   ', 'escalgres', '037             ', '2016-09-01', '2016-09-01'),
(295, '254', '254', 'PERSIANA DE CEMENTO                                         ', 'persiana-de-cemento', '037             ', '2016-09-01', '2016-09-01'),
(296, '253', '253', 'GUARDAESCOBAS                                               ', 'guardaescobas', '037             ', '2016-09-01', '2016-09-01'),
(297, '255', '255', 'RETAL CORALINO                                              ', 'retal-coralino', '037             ', '2016-09-01', '2016-09-01'),
(298, '256', '256', 'TABLETA                                                     ', 'tableta', '037             ', '2016-09-01', '2016-09-01'),
(299, '257', '257', 'TUBO CEMENTO                                                ', 'tubo-cemento', '093             ', '2016-09-01', '2016-09-01'),
(300, '261', '261', 'TEJA THERMOACOUSTIC                                         ', 'teja-thermoacoustic', '039             ', '2016-09-01', '2016-09-01'),
(301, '260', '260', 'TEJA COLONIAL                                               ', 'teja-colonial', '039             ', '2016-09-01', '2016-09-01'),
(302, '258', '258', 'TUBO DE GRES                                                ', 'tubo-de-gres', '037             ', '2016-09-01', '2016-09-01'),
(303, '259', '259', 'TEJA DE BARRO                                               ', 'teja-de-barro', '086             ', '2016-09-01', '2016-09-01'),
(304, '262', '262', 'CABALLETE ETERNIT                                           ', 'caballete-eternit', '039             ', '2016-09-01', '2016-09-01'),
(305, '264', '264', 'TANQUE AJOVER                                               ', 'tanque-ajover', '039             ', '2016-09-01', '2016-09-01'),
(306, '265', '265', 'TEJA ADRI                                                   ', 'teja-adri', '039             ', '2016-09-01', '2016-09-01'),
(307, '263', '263', 'CLARABOYA ETERNIT                                           ', 'claraboya-eternit', '039             ', '2016-09-01', '2016-09-01'),
(308, '266', '266', 'TEJA AJOVER                                                 ', 'teja-ajover', '039             ', '2016-09-01', '2016-09-01'),
(309, '269', '269', 'AMARRES                                                     ', 'amarres', '038             ', '2016-09-01', '2016-09-01'),
(310, '270', '270', 'SOLDADURA STANO                                             ', 'soldadura-stano', '042             ', '2016-09-01', '2016-09-01'),
(311, '268', '268', 'TELA ASFALTICA                                              ', 'tela-asfaltica', '039             ', '2016-09-01', '2016-09-01'),
(312, '267', '267', 'TEJA CUADRADA                                               ', 'teja-cuadrada', '086             ', '2016-09-01', '2016-09-01'),
(313, '271', '271', 'GANCHO ETERNIT                                              ', 'gancho-eternit', '038             ', '2016-09-01', '2016-09-01'),
(314, '274', '274', 'PERFIL                                                      ', 'perfil', '043             ', '2016-09-01', '2016-09-01'),
(315, '273', '273', 'SOLDADURA SOLDALIST                                         ', 'soldadura-soldalist', '038             ', '2016-09-01', '2016-09-01'),
(316, '275', '275', 'SOLDADURA SOLDERING                                         ', 'soldadura-soldering', '042             ', '2016-09-01', '2016-09-01'),
(317, '277', '277', 'PIRLAN BRONCE                                               ', 'pirlan-bronce', '043             ', '2016-09-01', '2016-09-01'),
(318, '272', '272', 'TORNILLOS AUTOPERFORANTES                                   ', 'tornillos-autoperforantes', '038             ', '2016-09-01', '2016-09-01'),
(319, '276', '276', 'DILATACIONES PLASTICAS                                      ', 'dilataciones-plasticas', '043             ', '2016-09-01', '2016-09-01'),
(320, '278', '278', 'GAVIONES                                                    ', 'gaviones', '040             ', '2016-09-01', '2016-09-01'),
(321, '280', '280', 'MALLAS                                                      ', 'mallas', '040             ', '2016-09-01', '2016-09-01'),
(322, '281', '281', 'PLASTICO NEGRO                                              ', 'plastico-negro', '040             ', '2016-09-01', '2016-09-01'),
(323, '279', '279', 'HOJALATA                                                    ', 'hojalata', '040             ', '2016-09-01', '2016-09-01'),
(324, '282', '282', 'POLISOMBRA                                                  ', 'polisombra', '040             ', '2016-09-01', '2016-09-01'),
(325, '283', '283', 'ACIDOS                                                      ', 'acidos', '041             ', '2016-09-01', '2016-09-01'),
(326, '284', '284', 'SODA CAUSTICA                                               ', 'soda-caustica', '041             ', '2016-09-01', '2016-09-01'),
(327, '285', '285', 'THINNER                                                     ', 'thinner', '041             ', '2016-09-01', '2016-09-01'),
(328, '286', '286', 'BARSOL                                                      ', 'barsol', '086             ', '2016-09-01', '2016-09-01'),
(329, '287', '287', 'ASFALTO SOLIDO                                              ', 'asfalto-solido', '041             ', '2016-09-01', '2016-09-01'),
(330, '290', '290', 'INMUNIZANTE DE MADERA                                       ', 'inmunizante-de-madera', '041             ', '2016-09-01', '2016-09-01'),
(331, '291', '291', 'LIMPIADOR CLEANTEX                                          ', 'limpiador-cleantex', '041             ', '2016-09-01', '2016-09-01'),
(332, '289', '289', 'DIABLO FUERTE                                               ', 'diablo-fuerte', '041             ', '2016-09-01', '2016-09-01'),
(333, '293', '293', 'BALINERAS                                                   ', 'balineras', '042             ', '2016-09-01', '2016-09-01'),
(334, '292', '292', 'ANGULO                                                      ', 'angulo', '042             ', '2016-09-01', '2016-09-01'),
(335, '295', '295', 'LAMINA ZINC                                                 ', 'lamina-zinc', '042             ', '2016-09-01', '2016-09-01'),
(336, '294', '294', 'GOSNE                                                       ', 'gosne', '042             ', '2016-09-01', '2016-09-01'),
(337, '288', '288', 'CREOLINA                                                    ', 'creolina', '041             ', '2016-09-01', '2016-09-01'),
(338, '297', '297', 'TUBO CUADRADO                                               ', 'tubo-cuadrado', '042             ', '2016-09-01', '2016-09-01'),
(339, '299', '299', 'SOLDADURA WEST                                              ', 'soldadura-west', '042             ', '2016-09-01', '2016-09-01'),
(340, '298', '298', 'TUBO RECTANGULAR                                            ', 'tubo-rectangular', '042             ', '2016-09-01', '2016-09-01'),
(341, '296', '296', 'PLATINA                                                     ', 'platina', '042             ', '2016-09-01', '2016-09-01'),
(342, '825', '825', 'VALVULA BOLA BRONCE', 'valvula-bola-bronce', '067', '2016-09-01', '2016-09-01'),
(343, '302', '302', 'CIERRE RODILLO                                              ', 'cierre-rodillo', '042             ', '2016-09-01', '2016-09-01'),
(344, '301', '301', 'CADENA SOLDADA                                              ', 'cadena-soldada', '042             ', '2016-09-01', '2016-09-01'),
(345, '303', '303', 'CABLE DUPLEX                                                ', 'cable-duplex', '020             ', '2016-09-01', '2016-09-01'),
(346, '300', '300', 'VIDRIO SOLDAR                                               ', 'vidrio-soldar', '042             ', '2016-09-01', '2016-09-01'),
(347, '304', '304', 'ALAMBRE ALUMINIO                                            ', 'alambre-aluminio', '020             ', '2016-09-01', '2016-09-01'),
(348, '305', '305', 'ALAMBRE CEDSA                                               ', 'alambre-cedsa', '020             ', '2016-09-01', '2016-09-01'),
(349, '306', '306', 'TEJA ETERNIT                                                ', 'teja-eternit', '039             ', '2016-09-01', '2016-09-01'),
(350, '308', '308', 'ALAMBRE ENCAUCHETADO                                        ', 'alambre-encauchetado', '020             ', '2016-09-01', '2016-09-01'),
(351, '307', '307', 'TEJA ZINC                                                   ', 'teja-zinc', '039             ', '2016-09-01', '2016-09-01'),
(352, '311', '311', 'ALAMBRE TRENZADO                                            ', 'alambre-trenzado', '020             ', '2016-09-01', '2016-09-01'),
(353, '312', '312', 'ALAMRE POLARIZADO                                           ', 'alamre-polarizado', '020             ', '2016-09-01', '2016-09-01'),
(354, '309', '309', 'ALAMBRE FACOME                                              ', 'alambre-facome', '020             ', '2016-09-01', '2016-09-01'),
(355, '310', '310', 'ALAMBRE TELEFONO                                            ', 'alambre-telefono', '020             ', '2016-09-01', '2016-09-01'),
(356, '314', '314', 'ALAMBRE CORRIENTE                                           ', 'alambre-corriente', '020             ', '2016-09-01', '2016-09-01'),
(357, '318', '318', 'CAIMAN                                                      ', 'caiman', '021             ', '2016-09-01', '2016-09-01'),
(358, '315', '315', 'ALAMBRE DESNUDO                                             ', 'alambre-desnudo', '020             ', '2016-09-01', '2016-09-01'),
(359, '313', '313', 'CABLE COAXIAL                                               ', 'cable-coaxial', '020             ', '2016-09-01', '2016-09-01'),
(360, '316', '316', 'BENJAMINES                                                  ', 'benjamines', '021             ', '2016-09-01', '2016-09-01');
INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(361, '317', '317', 'BERBIQUI                                                    ', 'berbiqui', '021             ', '2016-09-01', '2016-09-01'),
(362, '320', '320', 'CONECTOR                                                    ', 'conector', '021             ', '2016-09-01', '2016-09-01'),
(363, '322', '322', 'CURVAS                                                      ', 'curvas', '021             ', '2016-09-01', '2016-09-01'),
(364, '321', '321', 'CRUCETAS                                                    ', 'crucetas', '021             ', '2016-09-01', '2016-09-01'),
(365, '323', '323', 'FUSIBLE                                                     ', 'fusible', '021             ', '2016-09-01', '2016-09-01'),
(366, '319', '319', 'CAUTIN                                                      ', 'cautin', '021             ', '2016-09-01', '2016-09-01'),
(367, '326', '326', 'PERCHAS                                                     ', 'perchas', '021             ', '2016-09-01', '2016-09-01'),
(368, '325', '325', 'PELA CABLE                                                  ', 'pela-cable', '021             ', '2016-09-01', '2016-09-01'),
(369, '324', '324', 'GRAPAS ELECTRIC                                             ', 'grapas-electric', '021             ', '2016-09-01', '2016-09-01'),
(370, '327', '327', 'PERRO                                                       ', 'perro', '021             ', '2016-09-01', '2016-09-01'),
(371, '328', '328', 'PLAFON                                                      ', 'plafon', '021             ', '2016-09-01', '2016-09-01'),
(372, '329', '329', 'PORTAELECTRODO                                              ', 'portaelectrodo', '021             ', '2016-09-01', '2016-09-01'),
(373, '335', '335', 'AISLADOR                                                    ', 'aislador', '021             ', '2016-09-01', '2016-09-01'),
(374, '334', '334', 'TERMINAL ELECTRICO                                          ', 'terminal-electrico', '021             ', '2016-09-01', '2016-09-01'),
(375, '331', '331', 'SOCKER                                                      ', 'socker', '021             ', '2016-09-01', '2016-09-01'),
(376, '330', '330', 'PROBADOR CORRIENTE                                          ', 'probador-corriente', '021             ', '2016-09-01', '2016-09-01'),
(377, '333', '333', 'SUPLEMENTOS                                                 ', 'suplementos', '021             ', '2016-09-01', '2016-09-01'),
(378, '332', '332', 'SONDA                                                       ', 'sonda', '021             ', '2016-09-01', '2016-09-01'),
(379, '336', '336', 'BARRAJES                                                    ', 'barrajes', '021             ', '2016-09-01', '2016-09-01'),
(380, '337', '337', 'UNION TELEFONO                                              ', 'union-telefono', '021             ', '2016-09-01', '2016-09-01'),
(381, '339', '339', 'CHASIS LAMPARA                                              ', 'chasis-lampara', '022             ', '2016-09-01', '2016-09-01'),
(382, '338', '338', 'BALASTROS                                                   ', 'balastros', '022             ', '2016-09-01', '2016-09-01'),
(383, '340', '340', 'LAMPARA CIRCULAR                                            ', 'lampara-circular', '022             ', '2016-09-01', '2016-09-01'),
(384, '341', '341', 'LAMPARA FLUORECENTE                                         ', 'lampara-fluorecente', '022             ', '2016-09-01', '2016-09-01'),
(385, '342', '342', 'REPUESTOS FLUORECENTE                                       ', 'repuestos-fluorecente', '022             ', '2016-09-01', '2016-09-01'),
(386, '343', '343', 'STARTE                                                      ', 'starte', '022             ', '2016-09-01', '2016-09-01'),
(387, '346', '346', 'AHORRADOR OPALUX                                            ', 'ahorrador-opalux', '023             ', '2016-09-01', '2016-09-01'),
(388, '348', '348', 'BOMBILLO OJO BUEY                                           ', 'bombillo-ojo-buey', '023             ', '2016-09-01', '2016-09-01'),
(389, '344', '344', 'TUBO FLUORECENTE                                            ', 'tubo-fluorecente', '022             ', '2016-09-01', '2016-09-01'),
(390, '349', '349', 'OJO BUEY                                                    ', 'ojo-buey', '023             ', '2016-09-01', '2016-09-01'),
(391, '345', '345', 'AHORRADOR FULLWAT                                           ', 'ahorrador-fullwat', '023             ', '2016-09-01', '2016-09-01'),
(392, '350', '350', 'CABLE CHURCO                                                ', 'cable-churco', '024             ', '2016-09-01', '2016-09-01'),
(393, '347', '347', 'AHORRADOR SILVANIA                                          ', 'ahorrador-silvania', '023             ', '2016-09-01', '2016-09-01'),
(394, '351', '351', 'CABLE GRABADORA                                             ', 'cable-grabadora', '024             ', '2016-09-01', '2016-09-01'),
(395, '353', '353', 'CABLE PLANCHE                                               ', 'cable-planche', '024             ', '2016-09-01', '2016-09-01'),
(396, '352', '352', 'CABLE BATERIA                                               ', 'cable-bateria', '024             ', '2016-09-01', '2016-09-01'),
(397, '354', '354', 'CABLE TELEFONO                                              ', 'cable-telefono', '024             ', '2016-09-01', '2016-09-01'),
(398, '355', '355', 'EXTENSION BLANCA                                            ', 'extension-blanca', '024             ', '2016-09-01', '2016-09-01'),
(399, '357', '357', 'CAJA CEMENTO                                                ', 'caja-cemento', '025             ', '2016-09-01', '2016-09-01'),
(400, '359', '359', 'CAJAS CUADRADAS                                             ', 'cajas-cuadradas', '025             ', '2016-09-01', '2016-09-01'),
(401, '361', '361', 'CAJAS TACOS                                                 ', 'cajas-tacos', '025             ', '2016-09-01', '2016-09-01'),
(402, '362', '362', 'TACOS                                                       ', 'tacos', '025             ', '2016-09-01', '2016-09-01'),
(403, '358', '358', 'CAJAS CONTADOR                                              ', 'cajas-contador', '025             ', '2016-09-01', '2016-09-01'),
(404, '360', '360', 'CAJAS EMPALME                                               ', 'cajas-empalme', '025             ', '2016-09-01', '2016-09-01'),
(405, '356', '356', 'MULTITOMA                                                   ', 'multitoma', '024             ', '2016-09-01', '2016-09-01'),
(406, '363', '363', 'TAPAS                                                       ', 'tapas', '025             ', '2016-09-01', '2016-09-01'),
(407, '365', '365', 'CONMUTABLES                                                 ', 'conmutables', '026             ', '2016-09-01', '2016-09-01'),
(408, '364', '364', 'CLAVIJA                                                     ', 'clavija', '026             ', '2016-09-01', '2016-09-01'),
(409, '366', '366', 'CONVERTIDOR                                                 ', 'convertidor', '026             ', '2016-09-01', '2016-09-01'),
(410, '367', '367', 'INTERRUPTOR                                                 ', 'interruptor', '026             ', '2016-09-01', '2016-09-01'),
(411, '369', '369', 'SALIDA                                                      ', 'salida', '026             ', '2016-09-01', '2016-09-01'),
(412, '368', '368', 'PULSADOR                                                    ', 'pulsador', '026             ', '2016-09-01', '2016-09-01'),
(413, '372', '372', 'TIMBRE                                                      ', 'timbre', '026             ', '2016-09-01', '2016-09-01'),
(414, '370', '370', 'TEE                                                         ', 'tee', '026             ', '2016-09-01', '2016-09-01'),
(415, '373', '373', 'TABLA RECTANGULAR                                           ', 'tabla-rectangular', '026             ', '2016-09-01', '2016-09-01'),
(416, '374', '374', 'CANALETA                                                    ', 'canaleta', '027             ', '2016-09-01', '2016-09-01'),
(417, '371', '371', 'TOMA                                                        ', 'toma', '026             ', '2016-09-01', '2016-09-01'),
(418, '376', '376', 'HIDROSOLTA                                                  ', 'hidrosolta', '027             ', '2016-09-01', '2016-09-01'),
(419, '377', '377', 'MANGUERA CONDUFLEX                                          ', 'manguera-conduflex', '027             ', '2016-09-01', '2016-09-01'),
(420, '375', '375', 'CONDULETA                                                   ', 'conduleta', '027             ', '2016-09-01', '2016-09-01'),
(421, '379', '379', 'VARILLA COOPERWELL                                          ', 'varilla-cooperwell', '027             ', '2016-09-01', '2016-09-01'),
(422, '378', '378', 'TUBO CONDUIT                                                ', 'tubo-conduit', '027             ', '2016-09-01', '2016-09-01'),
(423, '380', '380', 'ANTENA                                                      ', 'antena', '028             ', '2016-09-01', '2016-09-01'),
(424, '381', '381', 'MARRANITO COAXIAL                                           ', 'marranito-coaxial', '028             ', '2016-09-01', '2016-09-01'),
(425, '382', '382', 'SPLITER                                                     ', 'spliter', '028             ', '2016-09-01', '2016-09-01'),
(426, '384', '384', 'TABACO TELEVISION                                           ', 'tabaco-television', '028             ', '2016-09-01', '2016-09-01'),
(427, '386', '386', 'TERMINAL COAXIAL                                            ', 'terminal-coaxial', '028             ', '2016-09-01', '2016-09-01'),
(428, '387', '387', 'UNION COAXIAL                                               ', 'union-coaxial', '028             ', '2016-09-01', '2016-09-01'),
(429, '385', '385', 'TEE COAXIAL                                                 ', 'tee-coaxial', '028             ', '2016-09-01', '2016-09-01'),
(430, '388', '388', 'COMBO AVANTY                                                ', 'combo-avanty', '060             ', '2016-09-01', '2016-09-01'),
(431, '383', '383', 'SWITCH                                                      ', 'switch', '028             ', '2016-09-01', '2016-09-01'),
(432, '389', '389', 'COMBO ATLANTA                                               ', 'combo-atlanta', '060             ', '2016-09-01', '2016-09-01'),
(433, '390', '390', 'COMBO EDESA                                                 ', 'combo-edesa', '060             ', '2016-09-01', '2016-09-01'),
(434, '391', '391', 'COMBO ACUACER                                               ', 'combo-acuacer', '060             ', '2016-09-01', '2016-09-01'),
(435, '393', '393', 'ORINAL                                                      ', 'orinal', '060             ', '2016-09-01', '2016-09-01'),
(436, '392', '392', 'COMBO DISTINCION                                            ', 'combo-distincion', '060             ', '2016-09-01', '2016-09-01'),
(437, '395', '395', 'SANITARIO AVANTY                                            ', 'sanitario-avanty', '061             ', '2016-09-01', '2016-09-01'),
(438, '398', '398', 'LAVAMANOS ACUACER                                           ', 'lavamanos-acuacer', '062             ', '2016-09-01', '2016-09-01'),
(439, '396', '396', 'SANITARIO DISTINCION', 'sanitario-distincion', '061', '2016-09-01', '2016-09-01'),
(440, '397', '397', 'SANITARIO EDESA                                             ', 'sanitario-edesa', '061             ', '2016-09-01', '2016-09-01'),
(441, '399', '399', 'LAVAMANOS AVANTY                                            ', 'lavamanos-avanty', '062             ', '2016-09-01', '2016-09-01'),
(442, '394', '394', 'SANITARIO ACUACER                                           ', 'sanitario-acuacer', '061             ', '2016-09-01', '2016-09-01'),
(443, '400', '400', 'LAVAMANOS EDESA                                             ', 'lavamanos-edesa', '062             ', '2016-09-01', '2016-09-01'),
(444, '402', '402', 'TANQUE AVANTY                                               ', 'tanque-avanty', '063             ', '2016-09-01', '2016-09-01'),
(445, '404', '404', 'TANQUE EDESA                                                ', 'tanque-edesa', '063             ', '2016-09-01', '2016-09-01'),
(446, '406', '406', 'TAPA AVANTY                                                 ', 'tapa-avanty', '063             ', '2016-09-01', '2016-09-01'),
(447, '405', '405', 'TAPA ACUACER                                                ', 'tapa-acuacer', '063             ', '2016-09-01', '2016-09-01'),
(448, '401', '401', 'TANQUE ACUACER                                              ', 'tanque-acuacer', '063             ', '2016-09-01', '2016-09-01'),
(449, '403', '403', 'TANQUE DISTINCION                                           ', 'tanque-distincion', '063             ', '2016-09-01', '2016-09-01'),
(450, '407', '407', 'TAPA DISTINCION                                             ', 'tapa-distincion', '063             ', '2016-09-01', '2016-09-01'),
(451, '408', '408', 'TAZA ACUACER                                                ', 'taza-acuacer', '063             ', '2016-09-01', '2016-09-01'),
(452, '409', '409', 'TAZA AVANTY                                                 ', 'taza-avanty', '063             ', '2016-09-01', '2016-09-01'),
(453, '410', '410', 'TAZA DISTINCION                                             ', 'taza-distincion', '063             ', '2016-09-01', '2016-09-01'),
(454, '411', '411', 'PEDESTAL ACUACER                                            ', 'pedestal-acuacer', '064             ', '2016-09-01', '2016-09-01'),
(455, '412', '412', 'PEDESTAL AVANTY                                             ', 'pedestal-avanty', '064             ', '2016-09-01', '2016-09-01'),
(456, '415', '415', 'REJILLA TAPA REGISTRO                                       ', 'rejilla-tapa-registro', '065             ', '2016-09-01', '2016-09-01'),
(457, '413', '413', 'REJILLA PLANA                                               ', 'rejilla-plana', '065             ', '2016-09-01', '2016-09-01'),
(458, '417', '417', 'REJILLA TUBO ALUMINIO                                       ', 'rejilla-tubo-aluminio', '065             ', '2016-09-01', '2016-09-01'),
(459, '418', '418', 'REJILLA TUBO PLASTICO                                       ', 'rejilla-tubo-plastico', '065             ', '2016-09-01', '2016-09-01'),
(460, '414', '414', 'REJILLA SIFON ALUMINIO                                      ', 'rejilla-sifon-aluminio', '065             ', '2016-09-01', '2016-09-01'),
(461, '416', '416', 'REJILLA TRAGANTE                                            ', 'rejilla-tragante', '065             ', '2016-09-01', '2016-09-01'),
(462, '419', '419', 'REJILLA VENTILACION                                         ', 'rejilla-ventilacion', '065             ', '2016-09-01', '2016-09-01'),
(463, '421', '421', 'TAPA VALVULA                                                ', 'tapa-valvula', '065             ', '2016-09-01', '2016-09-01'),
(464, '420', '420', 'REPUESTOS                                                   ', 'repuestos', '065             ', '2016-09-01', '2016-09-01'),
(465, '423', '423', 'VALVULA POZUELO                                             ', 'valvula-pozuelo', '065             ', '2016-09-01', '2016-09-01'),
(466, '422', '422', 'TAPA SIFON                                                  ', 'tapa-sifon', '065             ', '2016-09-01', '2016-09-01'),
(467, '424', '424', 'SIFON BOTELLA                                               ', 'sifon-botella', '076             ', '2016-09-01', '2016-09-01'),
(468, '425', '425', 'LLAVE BOLA GRINACA                                          ', 'llave-bola-grinaca', '066             ', '2016-09-01', '2016-09-01'),
(469, '426', '426', 'LLAVE BOLA ITALY                                            ', 'llave-bola-italy', '066             ', '2016-09-01', '2016-09-01'),
(470, '428', '428', 'LLAVE TERMINAL                                              ', 'llave-terminal', '066             ', '2016-09-01', '2016-09-01'),
(471, '429', '429', 'VALVULA BOLA PVC LISA                                       ', 'valvula-bola-pvc-lisa', '067             ', '2016-09-01', '2016-09-01'),
(472, '427', '427', 'LLAVE CORTINA                                               ', 'llave-cortina', '066             ', '2016-09-01', '2016-09-01'),
(473, '434', '434', 'VALVULA PASO DIRECTO                                        ', 'valvula-paso-directo', '067             ', '2016-09-01', '2016-09-01'),
(474, '431', '431', 'VALVULA CHEQUE BRONCE                                       ', 'valvula-cheque-bronce', '067             ', '2016-09-01', '2016-09-01'),
(475, '432', '432', 'VALVULA FLOTADOR                                            ', 'valvula-flotador', '067             ', '2016-09-01', '2016-09-01'),
(476, '435', '435', 'VALVULA PIE                                                 ', 'valvula-pie', '067             ', '2016-09-01', '2016-09-01'),
(477, '430', '430', 'VALVULA BOLA PVC ROSCADA                                    ', 'valvula-bola-pvc-roscada', '067             ', '2016-09-01', '2016-09-01'),
(478, '433', '433', 'VALVULA PARA GAS                                            ', 'valvula-para-gas', '067             ', '2016-09-01', '2016-09-01'),
(479, '436', '436', 'UNIVERSAL PVC LISA                                          ', 'universal-pvc-lisa', '068             ', '2016-09-01', '2016-09-01'),
(480, '438', '438', 'ACOPLE MANGUERA JARDIN                                      ', 'acople-manguera-jardin', '069             ', '2016-09-01', '2016-09-01'),
(481, '437', '437', 'UNIVERSAL PVC ROSCADA                                       ', 'universal-pvc-roscada', '068             ', '2016-09-01', '2016-09-01'),
(482, '439', '439', 'BAJANTE                                                     ', 'bajante', '069             ', '2016-09-01', '2016-09-01'),
(483, '441', '441', 'LLAVE MANGUERA                                              ', 'llave-manguera', '069             ', '2016-09-01', '2016-09-01'),
(484, '442', '442', 'LLAVE TELEDUCHA                                             ', 'llave-teleducha', '069             ', '2016-09-01', '2016-09-01'),
(485, '443', '443', 'MANIJA LEXA                                                 ', 'manija-lexa', '069             ', '2016-09-01', '2016-09-01'),
(486, '440', '440', 'BUJE CAUCHO                                                 ', 'buje-caucho', '069             ', '2016-09-01', '2016-09-01'),
(487, '445', '445', 'PORTAROLLO                                                  ', 'portarollo', '069             ', '2016-09-01', '2016-09-01'),
(488, '447', '447', 'REGULADOR GAS                                               ', 'regulador-gas', '069             ', '2016-09-01', '2016-09-01'),
(489, '446', '446', 'RACOR GAS                                                   ', 'racor-gas', '069             ', '2016-09-01', '2016-09-01'),
(490, '448', '448', 'SURTIDOR                                                    ', 'surtidor', '069             ', '2016-09-01', '2016-09-01'),
(491, '449', '449', 'TAPON                                                       ', 'tapon', '069             ', '2016-09-01', '2016-09-01'),
(492, '451', '451', 'TUERCA SIFON                                                ', 'tuerca-sifon', '069             ', '2016-09-01', '2016-09-01'),
(493, '452', '452', 'YEE LAVADORA                                                ', 'yee-lavadora', '069             ', '2016-09-01', '2016-09-01'),
(494, '456', '456', 'LAVAPLATOS FANAINOX                                         ', 'lavaplatos-fanainox', '071             ', '2016-09-01', '2016-09-01'),
(495, '457', '457', 'LAVAPLATOS ALUMINIO                                         ', 'lavaplatos-aluminio', '071             ', '2016-09-01', '2016-09-01'),
(496, '455', '455', 'LAVAPLATOS SOCODA                                           ', 'lavaplatos-socoda', '071             ', '2016-09-01', '2016-09-01'),
(497, '458', '458', 'LAVAPLATOS HIERRO BRILLADO                                  ', 'lavaplatos-hierro-brillado', '071             ', '2016-09-01', '2016-09-01'),
(498, '450', '450', 'TELEDUCHA                                                   ', 'teleducha', '069             ', '2016-09-01', '2016-09-01'),
(499, '808', '808', 'TIZA', 'tiza', '057', '2016-09-01', '2016-09-01'),
(500, '459', '459', 'LAVAPLATOS HIERRO COLADO                                    ', 'lavaplatos-hierro-colado', '071             ', '2016-09-01', '2016-09-01'),
(501, '462', '462', 'PILA CEMENTO                                                ', 'pila-cemento', '072             ', '2016-09-01', '2016-09-01'),
(502, '460', '460', 'LAVADEROS CEMENTO                                           ', 'lavaderos-cemento', '072             ', '2016-09-01', '2016-09-01'),
(503, '464', '464', 'JUEGO INCRUSTACIONES EDESA                                  ', 'juego-incrustaciones-edesa', '073             ', '2016-09-01', '2016-09-01'),
(504, '461', '461', 'LAVADEROS GRANITO                                           ', 'lavaderos-granito', '072             ', '2016-09-01', '2016-09-01'),
(505, '463', '463', 'REFREGADERO CEMENTO                                         ', 'refregadero-cemento', '072             ', '2016-09-01', '2016-09-01'),
(506, '466', '466', 'JUEGO INCRUSTACIONES GRIVAL                                 ', 'juego-incrustaciones-grival', '073             ', '2016-09-01', '2016-09-01'),
(507, '468', '468', 'ACCESORIOS VARILLA                                          ', 'accesorios-varilla', '074             ', '2016-09-01', '2016-09-01'),
(508, '467', '467', 'ACCESORIOS BOLA BRONCE                                      ', 'accesorios-bola-bronce', '074             ', '2016-09-01', '2016-09-01'),
(509, '465', '465', 'JUEGO INCRUSTACIONES ASTRO                                  ', 'juego-incrustaciones-astro', '073             ', '2016-09-01', '2016-09-01'),
(510, '470', '470', 'ACOPLE VALVULA                                              ', 'acople-valvula', '074             ', '2016-09-01', '2016-09-01'),
(511, '471', '471', 'CHEQUE CILINDRO                                             ', 'cheque-cilindro', '074             ', '2016-09-01', '2016-09-01'),
(512, '472', '472', 'FLANCHE                                                     ', 'flanche', '074             ', '2016-09-01', '2016-09-01'),
(513, '469', '469', 'ACOPLE MACHO ALUMINIO                                       ', 'acople-macho-aluminio', '074             ', '2016-09-01', '2016-09-01'),
(514, '474', '474', 'UNIONES DE ALUMINIO                                         ', 'uniones-de-aluminio', '074             ', '2016-09-01', '2016-09-01'),
(515, '473', '473', 'TEES ROSCA ALUMINIO                                         ', 'tees-rosca-aluminio', '074             ', '2016-09-01', '2016-09-01'),
(516, '792', '792', 'ACOPLES', 'acoples', '074', '2016-09-01', '2016-09-01'),
(517, '476', '476', 'CARTUCHOS                                                   ', 'cartuchos', '079             ', '2016-09-01', '2016-09-01'),
(518, '478', '478', 'FILTRO VALVULA                                              ', 'filtro-valvula', '075             ', '2016-09-01', '2016-09-01'),
(519, '479', '479', 'GRIFERIA LAVAPLATOS                                         ', 'griferia-lavaplatos', '075             ', '2016-09-01', '2016-09-01'),
(520, '480', '480', 'PIN CANASTILLA                                              ', 'pin-canastilla', '075             ', '2016-09-01', '2016-09-01'),
(521, '477', '477', 'ESCUDOS                                                     ', 'escudos', '075             ', '2016-09-01', '2016-09-01'),
(522, '482', '482', 'DESAGUE                                                     ', 'desague', '076             ', '2016-09-01', '2016-09-01'),
(523, '483', '483', 'EMPAQUE                                                     ', 'empaque', '075             ', '2016-09-01', '2016-09-01'),
(524, '475', '475', 'CANASTILLA GRIVAL                                           ', 'canastilla-grival', '075             ', '2016-09-01', '2016-09-01'),
(525, '484', '484', 'GRIFERIA LAVAMANOS                                          ', 'griferia-lavamanos', '076             ', '2016-09-01', '2016-09-01'),
(526, '485', '485', 'TAPON DECORATIVO GRIVAL                                     ', 'tapon-decorativo-grival', '076             ', '2016-09-01', '2016-09-01'),
(527, '488', '488', 'DUCHA FENIX                                                 ', 'ducha-fenix', '077             ', '2016-09-01', '2016-09-01'),
(528, '487', '487', 'DUCHA LIS                                                   ', 'ducha-lis', '077             ', '2016-09-01', '2016-09-01'),
(529, '489', '489', 'DUCHA LOIRA                                                 ', 'ducha-loira', '077             ', '2016-09-01', '2016-09-01'),
(530, '492', '492', 'DUCHA PRYSMA                                                ', 'ducha-prysma', '077             ', '2016-09-01', '2016-09-01'),
(531, '491', '491', 'DUCHA PISCIS                                                ', 'ducha-piscis', '077             ', '2016-09-01', '2016-09-01'),
(532, '495', '495', 'DUCHA BRIZA                                                 ', 'ducha-briza', '077             ', '2016-09-01', '2016-09-01'),
(533, '490', '490', 'DUCHA VENTO                                                 ', 'ducha-vento', '077             ', '2016-09-01', '2016-09-01'),
(534, '493', '493', 'DUCHA GALAXIA                                               ', 'ducha-galaxia', '077             ', '2016-09-01', '2016-09-01'),
(535, '494', '494', 'DUCHA OPERA                                                 ', 'ducha-opera', '077             ', '2016-09-01', '2016-09-01'),
(536, '496', '496', 'DUCHA RIO                                                   ', 'ducha-rio', '077             ', '2016-09-01', '2016-09-01'),
(537, '497', '497', 'ESFERA CRUCETA                                              ', 'esfera-cruceta', '077             ', '2016-09-01', '2016-09-01'),
(538, '501', '501', 'ASIENTO SANITARIO ECONOMICO                                 ', 'asiento-sanitario-economico', '078             ', '2016-09-01', '2016-09-01'),
(539, '498', '498', 'EMPAQUE DUCHA                                               ', 'empaque-ducha', '077             ', '2016-09-01', '2016-09-01'),
(540, '500', '500', 'REGADERA                                                    ', 'regadera', '077             ', '2016-09-01', '2016-09-01'),
(541, '502', '502', 'ASIENTO SANITARIO GRIVAL                                    ', 'asiento-sanitario-grival', '078             ', '2016-09-01', '2016-09-01'),
(542, '499', '499', 'ESCUDOS DUCHA                                               ', 'escudos-ducha', '077             ', '2016-09-01', '2016-09-01'),
(543, '503', '503', 'CASQUETES                                                   ', 'casquetes', '078             ', '2016-09-01', '2016-09-01'),
(544, '504', '504', 'CEPILLERA GRIVAL                                            ', 'cepillera-grival', '078             ', '2016-09-01', '2016-09-01'),
(545, '505', '505', 'PISTON                                                      ', 'piston', '078             ', '2016-09-01', '2016-09-01'),
(546, '506', '506', 'CORDON NYLON                                                ', 'cordon-nylon', '078             ', '2016-09-01', '2016-09-01'),
(547, '507', '507', 'DISCO ASIENTO                                               ', 'disco-asiento', '078             ', '2016-09-01', '2016-09-01'),
(548, '509', '509', 'FLOTADOR                                                    ', 'flotador', '078             ', '2016-09-01', '2016-09-01'),
(549, '508', '508', 'DISPENSADOR                                                 ', 'dispensador', '078             ', '2016-09-01', '2016-09-01'),
(550, '512', '512', 'HERRAJE                                                     ', 'herraje', '078             ', '2016-09-01', '2016-09-01'),
(551, '510', '510', 'FLUXOMETRO                                                  ', 'fluxometro', '078             ', '2016-09-01', '2016-09-01'),
(552, '513', '513', 'JUEGO ACCESORIOS                                            ', 'juego-accesorios', '078             ', '2016-09-01', '2016-09-01'),
(553, '511', '511', 'GRIFERIA ORINAL                                             ', 'griferia-orinal', '078             ', '2016-09-01', '2016-09-01'),
(554, '514', '514', 'PALANCA                                                     ', 'palanca', '078             ', '2016-09-01', '2016-09-01'),
(555, '517', '517', 'VALVULA REGULACION                                          ', 'valvula-regulacion', '078             ', '2016-09-01', '2016-09-01'),
(556, '515', '515', 'TELEDUCHA GRIVAL                                            ', 'teleducha-grival', '078             ', '2016-09-01', '2016-09-01'),
(557, '518', '518', 'MANGUERAS GRIVAL                                            ', 'mangueras-grival', '079             ', '2016-09-01', '2016-09-01'),
(558, '519', '519', 'MANIJAS                                                     ', 'manijas', '079             ', '2016-09-01', '2016-09-01'),
(559, '516', '516', 'EXTRACTOR                                                   ', 'extractor', '079             ', '2016-09-01', '2016-09-01'),
(560, '520', '520', 'NARIZ                                                       ', 'nariz', '079             ', '2016-09-01', '2016-09-01'),
(561, '521', '521', 'REJILLA GRIVAL                                              ', 'rejilla-grival', '079             ', '2016-09-01', '2016-09-01'),
(562, '522', '522', 'REPUESTOS GRIVAL                                            ', 'repuestos-grival', '079             ', '2016-09-01', '2016-09-01'),
(563, '523', '523', 'SELLO LENGUETA                                              ', 'sello-lengueta', '079             ', '2016-09-01', '2016-09-01'),
(564, '524', '524', 'SIFON                                                       ', 'sifon', '079             ', '2016-09-01', '2016-09-01'),
(565, '525', '525', 'TORNILLO GRIVAL                                             ', 'tornillo-grival', '079             ', '2016-09-01', '2016-09-01'),
(566, '527', '527', 'LLAVE AUTOMATICA                                            ', 'llave-automatica', '080             ', '2016-09-01', '2016-09-01'),
(567, '526', '526', 'TUERCA                                                      ', 'tuerca', '079             ', '2016-09-01', '2016-09-01'),
(568, '528', '528', 'LLAVE INDIVIDUAL                                            ', 'llave-individual', '080             ', '2016-09-01', '2016-09-01'),
(569, '529', '529', 'LLAVE TERMINAL GRIVAL                                       ', 'llave-terminal-grival', '080             ', '2016-09-01', '2016-09-01'),
(570, '531', '531', 'DESAGUE GRIFOS Y PARTES                                     ', 'desague-grifos-y-partes', '081             ', '2016-09-01', '2016-09-01'),
(571, '530', '530', 'ARBOL DE ENTRADA                                            ', 'arbol-de-entrada', '081             ', '2016-09-01', '2016-09-01'),
(572, '532', '532', 'CANASTILLAS ECONOMICA                                       ', 'canastillas-economica', '081             ', '2016-09-01', '2016-09-01'),
(573, '533', '533', 'SIFON ECONOMICO                                             ', 'sifon-economico', '081             ', '2016-09-01', '2016-09-01'),
(574, '534', '534', 'SOSCO ECONOMICO                                             ', 'sosco-economico', '081             ', '2016-09-01', '2016-09-01'),
(575, '535', '535', 'CEPILLERA ASTRO                                             ', 'cepillera-astro', '082             ', '2016-09-01', '2016-09-01'),
(576, '536', '536', 'DUCHA ASTRO                                                 ', 'ducha-astro', '082             ', '2016-09-01', '2016-09-01'),
(577, '537', '537', 'GANCHO DOBLE                                                ', 'gancho-doble', '082             ', '2016-09-01', '2016-09-01'),
(578, '542', '542', 'PARILLA AZADORA                                             ', 'parilla-azadora', '058             ', '2016-09-01', '2016-09-01'),
(579, '538', '538', 'JABONERA DUCHA                                              ', 'jabonera-ducha', '082             ', '2016-09-01', '2016-09-01'),
(580, '541', '541', 'RODACHIN                                                    ', 'rodachin', '001             ', '2016-09-01', '2016-09-01'),
(581, '540', '540', 'PAPELERA ASTRO                                              ', 'papelera-astro', '082             ', '2016-09-01', '2016-09-01'),
(582, '543', '543', 'ACEITES                                                     ', 'aceites', '058             ', '2016-09-01', '2016-09-01'),
(583, '539', '539', 'JABONERA LAVAMANOS                                          ', 'jabonera-lavamanos', '082             ', '2016-09-01', '2016-09-01'),
(584, '544', '544', 'BRILLMETAL                                                  ', 'brillmetal', '058             ', '2016-09-01', '2016-09-01'),
(585, '546', '546', 'TEFLON                                                      ', 'teflon', '058             ', '2016-09-01', '2016-09-01'),
(586, '803', '803', 'YOYO', 'yoyo', '057', '2016-09-01', '2016-09-01'),
(587, '545', '545', 'CINTAS                                                      ', 'cintas', '058             ', '2016-09-01', '2016-09-01'),
(588, '548', '548', 'TUBO ALUMINIO                                               ', 'tubo-aluminio', '004             ', '2016-09-01', '2016-09-01'),
(589, '547', '547', 'ABRAZADERAS                                                 ', 'abrazaderas', '058             ', '2016-09-01', '2016-09-01'),
(590, '549', '549', 'CINTA COBRA                                                 ', 'cinta-cobra', '021             ', '2016-09-01', '2016-09-01'),
(591, '550', '550', 'CHUPAS                                                      ', 'chupas', '069             ', '2016-09-01', '2016-09-01'),
(592, '553', '553', 'ESQUINERO PLASTICO                                          ', 'esquinero-plastico', '013             ', '2016-09-01', '2016-09-01'),
(593, '552', '552', 'FIJAMIX                                                     ', 'fijamix', '014             ', '2016-09-01', '2016-09-01'),
(594, '554', '554', 'ONDULADO INTERMATEX                                         ', 'ondulado-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(595, '551', '551', 'GABINETE BANO                                               ', 'gabinete-bano', '069             ', '2016-09-01', '2016-09-01'),
(596, '555', '555', 'PELDANO INTERMATEX                                          ', 'peldano-intermatex', '011             ', '2016-09-01', '2016-09-01'),
(597, '558', '558', 'CANALES GERFOR                                              ', 'canales-gerfor', '045             ', '2016-09-01', '2016-09-01'),
(598, '557', '557', 'ALCAYATA                                                    ', 'alcayata', '007             ', '2016-09-01', '2016-09-01'),
(599, '559', '559', 'VARILLA CUADRADA                                            ', 'varilla-cuadrada', '042             ', '2016-09-01', '2016-09-01'),
(600, '561', '561', 'ADITIVOS PARA CEMENTO                                       ', 'aditivos-para-cemento', '034             ', '2016-09-01', '2016-09-01'),
(601, '562', '562', 'ADITIVOS PARA MORTEROS                                      ', 'aditivos-para-morteros', '034             ', '2016-09-01', '2016-09-01'),
(602, '563', '563', 'ADITIVOS Y ADICIONES MORTEROS                               ', 'aditivos-y-adiciones-morteros', '034             ', '2016-09-01', '2016-09-01'),
(603, '564', '564', 'CURADORES Y DESENCOFRANTES                                  ', 'curadores-y-desencofrantes', '034             ', '2016-09-01', '2016-09-01'),
(604, '565', '565', 'MORTEROS LISTOS                                             ', 'morteros-listos', '034             ', '2016-09-01', '2016-09-01'),
(605, '566', '566', 'MORTEROS LISTOS MODIFICADOS                                 ', 'morteros-listos-modificados', '034             ', '2016-09-01', '2016-09-01'),
(606, '567', '567', 'ADHESIVOS EPOXICOS                                          ', 'adhesivos-epoxicos', '034             ', '2016-09-01', '2016-09-01'),
(607, '560', '560', 'LETRAS Y NUMERO                                             ', 'letras-y-numero', '019             ', '2016-09-01', '2016-09-01'),
(608, '569', '569', 'INMUNIZANTES PARA MADERAS                                   ', 'inmunizantes-para-maderas', '089             ', '2016-09-01', '2016-09-01'),
(609, '568', '568', 'IMPERMEABILIZANTES Y LIMPIADOR                              ', 'impermeabilizantes-y-limpiador', '034             ', '2016-09-01', '2016-09-01'),
(610, '556', '556', 'CUCHILLAS ELECTRICAS                                        ', 'cuchillas-electricas', '021             ', '2016-09-01', '2016-09-01'),
(611, '570', '570', 'SILICONAS SIKA                                              ', 'siliconas-sika', '034             ', '2016-09-01', '2016-09-01'),
(612, '571', '571', 'POLIURETANOS Y SELLOS                                       ', 'poliuretanos-y-sellos', '034             ', '2016-09-01', '2016-09-01'),
(613, '573', '573', 'MARTILLO                                                    ', 'martillo', '003             ', '2016-09-01', '2016-09-01'),
(614, '574', '574', 'CABOS                                                       ', 'cabos', '058             ', '2016-09-01', '2016-09-01'),
(615, '575', '575', 'CORREAS AMARRES                                             ', 'correas-amarres', '058             ', '2016-09-01', '2016-09-01'),
(616, '572', '572', 'HERRAMIENTAS SIKA                                           ', 'herramientas-sika', '034             ', '2016-09-01', '2016-09-01'),
(617, '577', '577', 'GRATA                                                       ', 'grata', '056             ', '2016-09-01', '2016-09-01'),
(618, '576', '576', 'ESCOBAS                                                     ', 'escobas', '058             ', '2016-09-01', '2016-09-01'),
(619, '578', '578', 'LAPIZ                                                       ', 'lapiz', '058             ', '2016-09-01', '2016-09-01'),
(620, '579', '579', 'ACCESORIO MANGUERA                                          ', 'accesorio-manguera', '059             ', '2016-09-01', '2016-09-01'),
(621, '583', '583', 'VERONA                                                      ', 'verona', '062             ', '2016-09-01', '2016-09-01'),
(622, '582', '582', 'ALAMEDA                                                     ', 'alameda', '073             ', '2016-09-01', '2016-09-01'),
(623, '584', '584', 'MILANO                                                      ', 'milano', '062             ', '2016-09-01', '2016-09-01'),
(624, '585', '585', 'LAVATRAPEROS                                                ', 'lavatraperos', '072             ', '2016-09-01', '2016-09-01'),
(625, '581', '581', 'PULPOS                                                      ', 'pulpos', '058             ', '2016-09-01', '2016-09-01'),
(626, '580', '580', 'LINTERNA                                                    ', 'linterna', '058             ', '2016-09-01', '2016-09-01'),
(627, '586', '586', 'REGISTRO INCORPORACION                                      ', 'registro-incorporacion', '074             ', '2016-09-01', '2016-09-01'),
(628, '587', '587', 'TOALLERO                                                    ', 'toallero', '082             ', '2016-09-01', '2016-09-01'),
(629, '589', '589', 'DUCHA VIENA                                                 ', 'ducha-viena', '077             ', '2016-09-01', '2016-09-01'),
(630, '592', '592', 'DUCHA GAVIOTA                                               ', 'ducha-gaviota', '077             ', '2016-09-01', '2016-09-01'),
(631, '588', '588', 'DUCHA MONACO                                                ', 'ducha-monaco', '077             ', '2016-09-01', '2016-09-01'),
(632, '590', '590', 'DUCHA ATHENAS                                               ', 'ducha-athenas', '077             ', '2016-09-01', '2016-09-01'),
(633, '595', '595', 'DUCHA MARRUECOS                                             ', 'ducha-marruecos', '077             ', '2016-09-01', '2016-09-01'),
(634, '596', '596', 'DUCHA BAHIA                                                 ', 'ducha-bahia', '077             ', '2016-09-01', '2016-09-01'),
(635, '594', '594', 'DUCHA MAGNA                                                 ', 'ducha-magna', '077             ', '2016-09-01', '2016-09-01'),
(636, '593', '593', 'DUCHA GIRO                                                  ', 'ducha-giro', '077             ', '2016-09-01', '2016-09-01'),
(637, '591', '591', 'DUCHA FLORENCIA                                             ', 'ducha-florencia', '077             ', '2016-09-01', '2016-09-01'),
(638, '597', '597', 'DUCHA NOVO                                                  ', 'ducha-novo', '077             ', '2016-09-01', '2016-09-01'),
(639, '598', '598', 'DUCHA OSIRIS                                                ', 'ducha-osiris', '077             ', '2016-09-01', '2016-09-01'),
(640, '599', '599', 'DUCHA SIRENA                                                ', 'ducha-sirena', '077             ', '2016-09-01', '2016-09-01'),
(641, '600', '600', 'DUCHA STYLO                                                 ', 'ducha-stylo', '077             ', '2016-09-01', '2016-09-01'),
(642, '601', '601', 'DUCHA VICTORIA                                              ', 'ducha-victoria', '077             ', '2016-09-01', '2016-09-01'),
(643, '602', '602', 'DUCHA KADIZ                                                 ', 'ducha-kadiz', '077             ', '2016-09-01', '2016-09-01'),
(644, '604', '604', 'EMPAQUE SANITARIO TANQUE                                    ', 'empaque-sanitario-tanque', '070             ', '2016-09-01', '2016-09-01'),
(645, '605', '605', 'EMPAQUES VARIOS                                             ', 'empaques-varios', '070             ', '2016-09-01', '2016-09-01'),
(646, '603', '603', 'EMPAQUES LAVAMANOS LAVAPLATOS                               ', 'empaques-lavamanos-lavaplatos', '070             ', '2016-09-01', '2016-09-01'),
(647, '608', '608', 'HERRAJE GRIFOS                                              ', 'herraje-grifos', '081             ', '2016-09-01', '2016-09-01'),
(648, '606', '606', 'GRAPAS GRIFOS Y PARTES                                      ', 'grapas-grifos-y-partes', '081             ', '2016-09-01', '2016-09-01'),
(649, '607', '607', 'GRICOL                                                      ', 'gricol', '081             ', '2016-09-01', '2016-09-01'),
(650, '609', '609', 'ROCIADOR GRIFOS                                             ', 'rociador-grifos', '081             ', '2016-09-01', '2016-09-01'),
(651, '611', '611', 'VALVULA GRIFOS                                              ', 'valvula-grifos', '081             ', '2016-09-01', '2016-09-01'),
(652, '613', '613', 'AIREADOR                                                    ', 'aireador', '075             ', '2016-09-01', '2016-09-01'),
(653, '610', '610', 'REPUESTOS GRIFOS                                            ', 'repuestos-grifos', '081             ', '2016-09-01', '2016-09-01'),
(654, '615', '615', 'REPUESTOS DUCHAS                                            ', 'repuestos-duchas', '077             ', '2016-09-01', '2016-09-01'),
(655, '616', '616', 'REPUESTOS SANITARIOS                                        ', 'repuestos-sanitarios', '078             ', '2016-09-01', '2016-09-01'),
(656, '612', '612', 'YEES                                                        ', 'yees', '074             ', '2016-09-01', '2016-09-01'),
(657, '617', '617', 'CUERPO                                                      ', 'cuerpo', '075             ', '2016-09-01', '2016-09-01'),
(658, '614', '614', 'BONETE                                                      ', 'bonete', '076             ', '2016-09-01', '2016-09-01'),
(659, '619', '619', 'GRIFERIA SANITARIA                                          ', 'griferia-sanitaria', '078             ', '2016-09-01', '2016-09-01'),
(660, '618', '618', 'GRAPAS GRIVAL                                               ', 'grapas-grival', '076             ', '2016-09-01', '2016-09-01'),
(661, '620', '620', 'HERRAMIENTA SANITARIA                                       ', 'herramienta-sanitaria', '078             ', '2016-09-01', '2016-09-01'),
(662, '622', '622', 'PERCHAS GRIVAL                                              ', 'perchas-grival', '082             ', '2016-09-01', '2016-09-01'),
(663, '621', '621', 'MEZCLADOR DUCHA                                             ', 'mezclador-ducha', '077             ', '2016-09-01', '2016-09-01'),
(664, '623', '623', 'PORTAROLLO GRIVAL                                           ', 'portarollo-grival', '082             ', '2016-09-01', '2016-09-01'),
(665, '624', '624', 'VALVULAS REGULACION                                         ', 'valvulas-regulacion', '084             ', '2016-09-01', '2016-09-01'),
(666, '626', '626', 'VALVULA CONTROL                                             ', 'valvula-control', '084             ', '2016-09-01', '2016-09-01'),
(667, '627', '627', 'REPUESTOS LAVAMANOS                                         ', 'repuestos-lavamanos', '076             ', '2016-09-01', '2016-09-01'),
(668, '625', '625', 'REGISTRO DUCHA                                              ', 'registro-ducha', '077             ', '2016-09-01', '2016-09-01'),
(669, '630', '630', 'EMPAQUES LAVAPLATOS                                         ', 'empaques-lavaplatos', '075             ', '2016-09-01', '2016-09-01'),
(670, '628', '628', 'REPUESTOS LAVAPLATOS                                        ', 'repuestos-lavaplatos', '075             ', '2016-09-01', '2016-09-01'),
(671, '632', '632', 'LLAVE GRICOL                                                ', 'llave-gricol', '066             ', '2016-09-01', '2016-09-01'),
(672, '629', '629', 'PONCHERA                                                    ', 'ponchera', '069             ', '2016-09-01', '2016-09-01'),
(673, '631', '631', 'ESCUDOS LAVAMANOS                                           ', 'escudos-lavamanos', '076             ', '2016-09-01', '2016-09-01'),
(674, '633', '633', 'LLAVE ANTIFRAUDE                                            ', 'llave-antifraude', '066             ', '2016-09-01', '2016-09-01'),
(675, '634', '634', 'TEJA LUMINIT                                                ', 'teja-luminit', '039             ', '2016-09-01', '2016-09-01'),
(676, '635', '635', 'INALGRIFOS                                                  ', 'inalgrifos', '081             ', '2016-09-01', '2016-09-01'),
(677, '636', '636', 'DILATACIONES                                                ', 'dilataciones', '055             ', '2016-09-01', '2016-09-01'),
(678, '638', '638', 'LISTON                                                      ', 'liston', '046             ', '2016-09-01', '2016-09-01'),
(679, '639', '639', 'GANCHOS                                                     ', 'ganchos', '007             ', '2016-09-01', '2016-09-01'),
(680, '640', '640', 'ESTOPAS                                                     ', 'estopas', '058             ', '2016-09-01', '2016-09-01'),
(681, '642', '642', 'ESQUINEROS                                                  ', 'esquineros', '036             ', '2016-09-01', '2016-09-01'),
(682, '641', '641', 'LLAVE JARDIN                                                ', 'llave-jardin', '058             ', '2016-09-01', '2016-09-01'),
(683, '637', '637', 'TABLA                                                       ', 'tabla', '047             ', '2016-09-01', '2016-09-01'),
(684, '643', '643', 'VARA REDONDA                                                ', 'vara-redonda', '054             ', '2016-09-01', '2016-09-01'),
(685, '644', '644', 'CANABRAVA                                                   ', 'canabrava', '048             ', '2016-09-01', '2016-09-01'),
(686, '646', '646', 'POSTES DE MADERA                                            ', 'postes-de-madera', '052             ', '2016-09-01', '2016-09-01'),
(687, '645', '645', 'IMPERMEABILIZANTE ACRILICO                                  ', 'impermeabilizante-acrilico', '085             ', '2016-09-01', '2016-09-01'),
(688, '647', '647', 'ROSCA                                                       ', 'rosca', '087             ', '2016-09-01', '2016-09-01'),
(689, '649', '649', 'REPUESTOS LAVAMANOS VARIOS                                  ', 'repuestos-lavamanos-varios', '062             ', '2016-09-01', '2016-09-01'),
(690, '651', '651', 'SIERRAS                                                     ', 'sierras', '058             ', '2016-09-01', '2016-09-01'),
(691, '650', '650', 'VITRIBLOCK                                                  ', 'vitriblock', '012             ', '2016-09-01', '2016-09-01'),
(692, '648', '648', 'LADRILLO EN CONSIGNACION                                    ', 'ladrillo-en-consignacion', '083             ', '2016-09-01', '2016-09-01'),
(693, '652', '652', 'REPUESTOS LAVAPLAT                                          ', 'repuestos-lavaplat', '071             ', '2016-09-01', '2016-09-01'),
(694, '653', '653', 'PALANCA SANITARIA                                           ', 'palanca-sanitaria', '069             ', '2016-09-01', '2016-09-01'),
(695, '654', '654', 'JUEGO INCRUSTACIONES ECONIMICA                              ', 'juego-incrustaciones-econimica', '073             ', '2016-09-01', '2016-09-01'),
(696, '813', '813', 'PEGADURO', 'pegaduro', '014', '2016-09-01', '2016-09-01'),
(697, '655', '655', 'ARGOLLAS                                                    ', 'argollas', '019             ', '2016-09-01', '2016-09-01');
INSERT INTO `inventariofamilia` (`id`, `InvFamCod`, `InvFamId`, `InvFamNom`, `fam_slug`, `fam_InvSubGruCod`, `created_at`, `updated_at`) VALUES
(698, '657', '657', 'MACHETE                                                     ', 'machete', '088             ', '2016-09-01', '2016-09-01'),
(699, '658', '658', 'RETAL CORALINA                                              ', 'retal-coralina', '036             ', '2016-09-01', '2016-09-01'),
(700, '659', '659', 'TUBERIA                                                     ', 'tuberia', '036             ', '2016-09-01', '2016-09-01'),
(701, '656', '656', 'BOYA                                                        ', 'boya', '069             ', '2016-09-01', '2016-09-01'),
(702, '660', '660', 'SIRENA                                                      ', 'sirena', '021             ', '2016-09-01', '2016-09-01'),
(703, '661', '661', 'LISTELO CONSTRUCCIONES                                      ', 'listelo-construcciones', '090             ', '2016-09-01', '2016-09-01'),
(704, '662', '662', 'NEVERA                                                      ', 'nevera', '091             ', '2016-09-01', '2016-09-01'),
(705, '663', '663', 'MACHIMBRE                                                   ', 'machimbre', '049             ', '2016-09-01', '2016-09-01'),
(706, '664', '664', 'UNION PLATINO                                               ', 'union-platino', '044             ', '2016-09-01', '2016-09-01'),
(707, '667', '667', 'LAMINAS                                                     ', 'laminas', '092             ', '2016-09-01', '2016-09-01'),
(708, '666', '666', 'COLCHON                                                     ', 'colchon', '091             ', '2016-09-01', '2016-09-01'),
(709, '665', '665', 'ASPIRADORA                                                  ', 'aspiradora', '091             ', '2016-09-01', '2016-09-01'),
(710, '670', '670', 'ACCESORIO SANITARIO GRIVAL                                  ', 'accesorio-sanitario-grival', '094             ', '2016-09-01', '2016-09-01'),
(711, '668', '668', 'BOMBILLOS EG LIGHTING                                       ', 'bombillos-eg-lighting', '023             ', '2016-09-01', '2016-09-01'),
(712, '671', '671', 'COMPLEMENTOS GRIVAL                                         ', 'complementos-grival', '094             ', '2016-09-01', '2016-09-01'),
(713, '669', '669', 'AZADON EXENTO                                               ', 'azadon-exento', '088             ', '2016-09-01', '2016-09-01'),
(714, '672', '672', 'ACCESORIOS LAVAMANOS GRIVAL                                 ', 'accesorios-lavamanos-grival', '094             ', '2016-09-01', '2016-09-01'),
(715, '674', '674', 'RESPUESTOS GRIVAL                                           ', 'respuestos-grival', '094             ', '2016-09-01', '2016-09-01'),
(716, '678', '678', 'CEMENTO GRIS PENDIENTE                                      ', 'cemento-gris-pendiente', '095             ', '2016-09-01', '2016-09-01'),
(717, '676', '676', 'INCRUSTACIONES INDIVIDUALES GR                              ', 'incrustaciones-individuales-gr', '094             ', '2016-09-01', '2016-09-01'),
(718, '675', '675', 'ACCESORIO DUCHA GRIVAL                                      ', 'accesorio-ducha-grival', '094             ', '2016-09-01', '2016-09-01'),
(719, '677', '677', 'LLAVES TERMINAL GRIVAL                                      ', 'llaves-terminal-grival', '094             ', '2016-09-01', '2016-09-01'),
(720, '673', '673', 'ACCESORIOS LAVAPLATOS GRIVAL                                ', 'accesorios-lavaplatos-grival', '094             ', '2016-09-01', '2016-09-01'),
(721, '679', '679', 'SOLDADURA CELTA                                             ', 'soldadura-celta', '096             ', '2016-09-01', '2016-09-01'),
(722, '680', '680', 'CIZALLA                                                     ', 'cizalla', '003             ', '2016-09-01', '2016-09-01'),
(723, '683', '683', 'TIJERAS EXENTAS                                             ', 'tijeras-exentas', '088             ', '2016-09-01', '2016-09-01'),
(724, '682', '682', 'CANDADOS GOLWALL                                            ', 'candados-golwall', '015             ', '2016-09-01', '2016-09-01'),
(725, '681', '681', 'CANDADO LIONS                                               ', 'candado-lions', '015             ', '2016-09-01', '2016-09-01'),
(726, '685', '685', 'GRAFITO                                                     ', 'grafito', '019             ', '2016-09-01', '2016-09-01'),
(727, '686', '686', 'CENEFAS SICHAR                                              ', 'cenefas-sichar', '012             ', '2016-09-01', '2016-09-01'),
(728, '684', '684', 'MARSELLA                                                    ', 'marsella', '062             ', '2016-09-01', '2016-09-01'),
(729, '687', '687', 'ENGRASADORA                                                 ', 'engrasadora', '003             ', '2016-09-01', '2016-09-01'),
(730, '688', '688', 'TEJA COLOMBIT                                               ', 'teja-colombit', '039             ', '2016-09-01', '2016-09-01'),
(731, '689', '689', 'CABALLETE COLOMBIT                                          ', 'caballete-colombit', '039             ', '2016-09-01', '2016-09-01'),
(732, '690', '690', 'CLARABOYA COLOMBIT                                          ', 'claraboya-colombit', '039             ', '2016-09-01', '2016-09-01'),
(733, '691', '691', 'TANQUE COLOMBIT                                             ', 'tanque-colombit', '039             ', '2016-09-01', '2016-09-01'),
(734, '693', '693', 'VINIFLEX TIPO II                                            ', 'viniflex-tipo-ii', '098             ', '2016-09-01', '2016-09-01'),
(735, '694', '694', 'TABLETA IVA                                                 ', 'tableta-iva', '093             ', '2016-09-01', '2016-09-01'),
(736, '697', '697', 'TIJERAS PODAR IVA 5                                      ', 'tijeras-podar-iva-5', '099             ', '2016-09-01', '2016-09-01'),
(737, '696', '696', 'PALAS IVA 5                                              ', 'palas-iva-5', '099             ', '2016-09-01', '2016-09-01'),
(738, '698', '698', 'AZADON IVA 5                                             ', 'azadon-iva-5', '099             ', '2016-09-01', '2016-09-01'),
(739, '692', '692', 'ALQUILER ESCALERAS                                          ', 'alquiler-escaleras', '097             ', '2016-09-01', '2016-09-01'),
(740, '702', '702', 'MACHETA IVA 5                                            ', 'macheta-iva-5', '099             ', '2016-09-01', '2016-09-01'),
(741, '699', '699', 'CIZALLA IVA 5                                            ', 'cizalla-iva-5', '099             ', '2016-09-01', '2016-09-01'),
(742, '701', '701', 'HACHA IVA 5                                              ', 'hacha-iva-5', '099             ', '2016-09-01', '2016-09-01'),
(743, '703', '703', 'PICA IVA 5                                               ', 'pica-iva-5', '099             ', '2016-09-01', '2016-09-01'),
(744, '704', '704', 'RASTRILLO IVA 5                                          ', 'rastrillo-iva-5', '099             ', '2016-09-01', '2016-09-01'),
(745, '705', '705', 'ALQUILERES                                                  ', 'alquileres', '097             ', '2016-09-01', '2016-09-01'),
(746, '801', '801', 'GATO HIDRAULICO', 'gato-hidraulico', '058', '2016-09-01', '2016-09-01'),
(747, '802', '802', 'CUCHILLA PICAPASTO ', 'cuchilla-picapasto', '088', '2016-09-01', '2016-09-01'),
(748, '780', '780', 'POLEAS                                                      ', 'poleas', '058             ', '2016-09-01', '2016-09-01'),
(749, '800', '800', 'POZO SEPTICO', 'pozo-septico', '104', '2016-09-01', '2016-09-01'),
(750, '781', '781', 'SALDOS INICIALES', 'saldos-iniciales', '100', '2016-09-01', '2016-09-01'),
(751, '842', '842', 'APARTE', 'aparte', '117', '2016-09-01', '2016-09-01'),
(752, '783', '783', 'DUPLICADO LLAVES', 'duplicado-llaves', '058', '2016-09-01', '2016-09-01'),
(753, '787', '787', 'LLANA DENTADA', 'llana-dentada', '003', '2016-09-01', '2016-09-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventariogrupo`
--

CREATE TABLE `inventariogrupo` (
  `id` int(11) NOT NULL,
  `InvGruCod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvGruId` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `InvGruNom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `slug_grupo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `inventariogrupo`
--

INSERT INTO `inventariogrupo` (`id`, `InvGruCod`, `InvGruId`, `InvGruNom`, `estado`, `created_at`, `updated_at`, `slug_grupo`) VALUES
(1, '001             ', '001', 'help', 1, '2016-09-02', '2016-09-02', 'help'),
(2, '002             ', '002', 'PINTURAS', 1, '2016-09-02', '2016-09-02', 'pinturas'),
(3, '003             ', '003', 'ACCESORIOS', 1, '2016-09-02', '2016-09-02', 'accesorios'),
(4, '004             ', '004', 'CERAMICA', 1, '2016-09-02', '2016-09-02', 'ceramica'),
(5, '005             ', '005             ', 'CERRADURA                                                   ', 1, '2016-09-02', '2016-09-02', 'cerradura'),
(6, '006             ', '006', 'ELECTRICOS', 1, '2016-09-02', '2016-09-02', 'electricos'),
(7, '007             ', '007             ', 'GALVANIZADO                                                 ', 1, '2016-09-02', '2016-09-02', 'galvanizado'),
(8, '008             ', '008             ', 'TUBOS Y ACCESORIOS                                          ', 1, '2016-09-02', '2016-09-02', 'tubos-y-accesorios'),
(9, '009             ', '009             ', 'MADERAS                                                     ', 1, '2016-09-02', '2016-09-02', 'maderas'),
(10, '010             ', '010', 'MATERIALES CONSTRUCCI', 1, '2016-09-02', '2016-09-02', 'materiales-construcci'),
(11, '011             ', '011', 'SANITARIOS Y GRIFERIAS', 1, '2016-09-02', '2016-09-02', 'sanitarios-y-griferias'),
(12, '012             ', '012             ', 'SERVICIOS                                                   ', 1, '2016-09-02', '2016-09-02', 'servicios'),
(13, '013             ', '013             ', 'MATERIALES EN TRANSITO                                      ', 1, '2016-09-02', '2016-09-02', 'materiales-en-transito'),
(14, '014             ', '014             ', 'SERVICIOS GRAVADOS                                          ', 1, '2016-09-02', '2016-09-02', 'servicios-gravados'),
(15, '015', '015', 'osman', 1, '2016-09-02', '2016-09-02', 'osman'),
(16, '15', '999', 'SALDOS INICIALES', 1, '2016-09-02', '2016-09-02', 'saldos-iniciales'),
(17, '17', '058', 'POLIETILENO', 1, '2016-09-02', '2016-09-02', 'polietileno'),
(18, '18', '022', 'MUEBLES', 1, '2016-09-02', '2016-09-02', 'muebles'),
(19, '19', '098', 'INTERESES', 1, '2016-09-02', '2016-09-02', 'intereses'),
(20, '20', '020', 'TRANSPORTE', 1, '2016-09-02', '2016-09-02', 'transporte'),
(21, '22', '42', 'GRUPO APARTE', 1, '2016-09-02', '2016-09-02', 'grupo-aparte'),
(22, '23', '100', 'EJEMPLO', 1, '2016-09-02', '2016-09-02', 'ejemplo'),
(23, '24', '1002', 'GENERAL', 1, '2016-09-02', '2016-09-02', 'general');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `men_nom` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `menu_inventariogrupo` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `grupo_id` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `metodo_envio` (
  `id` int(11) NOT NULL,
  `nom_metodo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempo_entrega` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `valor` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
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
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `ArtSec`, `id_mantis`, `pro_nom`, `categoria_id`, `descripcion`, `slug`, `img`, `mantis_img`, `precio`, `ValIva`, `Estado`, `por_iva`, `cantidad`, `dt`, `created_at`, `updated_at`) VALUES
(1, '10000', '924590', 'REGADERA OVAL BLANCO', '675             ', '.', 'regadera-oval-blanco', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/RA4015551_7a4a86bbaaa349aa8eae8e487a994ae1.jpg', NULL, '11896.00000', '13799.00000', 1, 16, -23, 1045485414, '2016-09-02', '2016-09-02'),
(2, '1727', '031283', 'ABRAZADERA ABIERTA PARA TUBO 1 1/2"', '547             ', '.', 'abrazadera-abierta-para-tubo-1-12', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/JB10_145b844d26a2481182f4bb5e8c2cbc29.jpg', NULL, '517.00000', '600.00000', 1, 16, 66, 1045485418, '2016-09-02', '2016-09-02'),
(3, '11689', '000392', 'RODACHINA 1.1/2-PU-003-A-FTO/BP-1/4-PL-NA-TP', '823', '', 'rodachina-112-pu-003-a-ftobp-14-pl-na-tp', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/telefonos-chinos_65099e541d0a4174a93e5462944f5d66.jpg', NULL, '3793.00000', '4400.00000', 1, 16, 0, 1045482411, '2016-09-02', '2016-09-02'),
(4, '10095', '021682', 'ESMALTE SAPOLIN BLANCO BRILLANTE 1/8', '103             ', '', 'esmalte-sapolin-blanco-brillante-18', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/triple_duty_1_2d339223783b4327b9a34b9fbbb33500.jpg', NULL, '7844.00000', '9099.00000', 1, 16, 0, 1045485605, '2016-09-02', '2016-09-02'),
(5, '6363', '062880', 'ABRAZADERA 1/2 PLASTICA', '547             ', '.', 'abrazadera-12-plastica', 'img/Mantis/def.png', NULL, '129.00000', '150.00000', 1, 16, 118, 1045484008, '2016-09-02', '2016-09-02'),
(6, '6380', '062897', 'ABRAZADERA 3/8 PLASTICA44', '547             ', '.', 'abrazadera-38-plastica44', 'img/Mantis/def.png', NULL, '103.00000', '119.00000', 1, 16, 520, 1045484009, '2016-09-02', '2016-09-02'),
(7, '7459', '101832', 'MASILLA GYPLAC BALDE', '245             ', '.', 'masilla-gyplac-balde', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/cunete-estuco-panel-impadoc_41340860ca244ad8be7afbfaa4af6fd9.jpg', NULL, '18620.00000', '21599.00000', 1, 16, 0, 1045485424, '2016-09-02', '2016-09-02'),
(8, '7416', '101788', 'MASILLA GYPLAC GALON', '245             ', '.', 'masilla-gyplac-galon', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/4537300_34b62ad8feac48ebbd48e45289422f68.jpg', NULL, '8922.00000', '10350.00000', 1, 16, 0, 1045485425, '2016-09-02', '2016-09-02'),
(9, '2352', '032217', 'ABRAZADERA 509', '547             ', 'HUAWEY P8 LITE\n\nEl elegante, sofisticado y delgado diseño exterior de 7.7mm de grosor de Huawei P8 Lite se adapta perfectamente a la palma de tu mano, brindando comfort, estabilidad y facilidad de uso en cada momento de tu vida\n\nCaptura las mejores fotos con Huawei P8 gracias a la cámara principal de 13MP y cámara frontal de 5MP, brindando la oportunidad de tomar grandes fotos en ambas modalidades. La siguiente generación de selfies con retoque facial ha llegado. El modo Retoque Facial reconoce al propietario del P8 Lite y aplica los ajustes preestablecidos de retoque facial en cada selfie capturada. Captura extraordinarias fotos con baja iluminación, donde los detalles son nítidos y claros, los colores brillantes y donde cada foto luce natural, aún en las condiciones de luz más bajas. ', 'abrazadera-509', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/5551-3349835_8fc1dd99f989478ba11aa08ed273d8d2.jpg', NULL, '3103.00000', '3599.00000', 1, 16, 9973, 1045485471, '2016-09-02', '2016-09-02'),
(10, '10074', '027821', 'MASILLA TERINSA PARA MADERA ROJA GALON', '110             ', 'Sabemos que tu tiempo es muy valioso, por eso queremos que pases más horas de calidad junto a quienes más quieres y no te pierdas de los mejores momentos de la vida, pensando en ello, queremos ofrecerte los mejores productos para satisfacer todas tus necesidades, traemos para ti artículos de las mejores marcas para que hagas tu vida más fácil.\n\nPARA CADA NECESIDAD\nEn Linio trabajamos día a día por tu bienestar, por eso junto a Terinsa hemos puesto al alcance de tu mano un amplio catálogo de artículos y elementos para ti, que puedan suplir cada necesidad, ofreciéndote lo mejor para garantizarte calidad y seguridad.', 'masilla-terinsa-para-madera-roja-galon', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/viniltex-base-agua-para-uso-interior_364a21c3bb164e8aa55117cffac27f5e.jpg', NULL, '42258.00000', '56840.00000', 1, 16, 0, 1045485173, '2016-09-02', '2016-09-02'),
(11, '7495', '101868', 'MASILLA GYPLAC EN POLVO 25 KG', '245             ', 'Sabemos que tu tiempo es muy valioso, por eso queremos que pases más horas de calidad junto a quienes más quieres y no te pierdas de los mejores momentos de la vida, pensando en ello, queremos ofrecerte los mejores productos para satisfacer todas tus necesidades, traemos para ti artículos de las mejores marcas para que hagas tu vida más fácil. PARA CADA NECESIDAD En Linio trabajamos día a día por tu bienestar, por eso junto a Terinsa hemos puesto al alcance de tu mano un amplio catálogo de artículos y elementos para ti, que puedan suplir cada necesidad, ofreciéndote lo mejor para garantizarte calidad y seguridad.', 'masilla-gyplac-en-polvo-25-kg', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/MasillaReadyMix%2520JointCompoundParaPlacasDeYeso_a403591a61a84f4b8c9135fcdd9bded8.jpg', NULL, '24137.00000', '27999.00000', 1, 16, 0, 1045485443, '2016-09-02', '2016-09-02'),
(12, '3020', '032927', 'ABOCINADOR FLARING L&W DE 3/16-5/8', '842', 'Sabemos que tu tiempo es muy valioso, por eso queremos que pases más horas de calidad junto a quienes más quieres y no te pierdas de los mejores momentos de la vida, pensando en ello, queremos ofrecerte los mejores productos para satisfacer todas tus necesidades, traemos para ti artículos de las mejores marcas para que hagas tu vida más fácil. PARA CADA NECESIDAD En Linio trabajamos día a día por tu bienestar, por eso junto a Terinsa hemos puesto al alcance de tu mano un amplio catálogo de artículos y elementos para ti, que puedan suplir cada necesidad, ofreciéndote lo mejor para garantizarte calidad y seguridad.', 'abocinador-flaring-lw-de-316-58', 'http://localhost:8080/VERSION8JavaEnvironment/PublicTempStorage/multimedia/4537300_8c6359d8d49043e7bfea85f3c6321632.jpg', NULL, '14483.00000', '16800.00000', 1, 16, 992, 1045485432, '2016-09-02', '2016-09-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `imgC` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int(2) NOT NULL DEFAULT '1',
  `valor` int(7) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `prueba` (
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

CREATE TABLE `tipopago` (
  `id` int(11) NOT NULL,
  `TipPagNom` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
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
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `NitSec`, `email`, `CliCup`, `password`, `remember_token`, `remember_pass`, `active`, `condiciones`, `admin`, `created_at`, `updated_at`) VALUES
(3, '1102365685', 'admin@admin.com', NULL, '$2y$10$qlhwbOAYyq.dRvx6VdQEHuk5aGumJ23AuxbNlUPbFdKD5fiHalUzm', 'JbsiRD62MrHVaiUEjshrMDEetg8pL5RwxQueCCBb3cvVXlo4BDvTUTD4zeeY', '', 1, 1, 1, '0000-00-00', '2016-09-02'),
(28, '1102365683', 'ederalvarez20910577@gmail.com', NULL, '$2y$10$g3QreIXuJFhrkE8DxTRds.FT81yDnOlpwUNSEOO.7sV.ZnVGwJ9xC', 'acNnz7TzG2r2wCgKDwgXl7kTvgHlmidCVY70U0Kp7Uqc9ReCgOPlTXlTgNdL', '', 1, 1, 0, '2016-01-22', '2016-08-11'),
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
(47, '1102365681', 'ederalvarez2091057@gmail.com', NULL, '$2y$10$b1pYtru3qIr9KKZKNKdSNeDO6oUDOUa1hFeu2SkRieS.zDoaUpdBG', NULL, NULL, 1, 1, 0, '2016-09-02', '2016-09-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_datos`
--

CREATE TABLE `user_datos` (
  `id` int(11) NOT NULL,
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
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `user_datos`
--

INSERT INTO `user_datos` (`id`, `user_id`, `barrio_id`, `nombre`, `apellido`, `cedula`, `nombre_negocio`, `ciudad`, `canal`, `direccion`, `telefono`, `comentarios`, `created_at`, `updated_at`) VALUES
(24, 28, 1, 'Edere', 'Alvarez', '1102365683', NULL, 1, 0, 'calle 20 # 24-27', '3013119199', NULL, '2016-01-22', '2016-05-19'),
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
(44, 47, 1, 'Eder', 'Alvarez', '1102365681', 'DEFAULT', 1, 0, NULL, '3110454545', 'Sin comentarios', '2016-09-02', '2016-09-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_env`
--

CREATE TABLE `user_env` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contacto` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `dep_cod` int(11) NOT NULL,
  `ciu_cod` int(11) NOT NULL,
  `dir` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `tel` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `user_env`
--

INSERT INTO `user_env` (`id`, `user_id`, `contacto`, `dep_cod`, `ciu_cod`, `dir`, `tel`, `created_at`, `updated_at`) VALUES
(1, 42, 'Euclides', 68, 68547, 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '3002584545', '2016-09-01', '2016-09-01'),
(2, 43, 'Eder', 68, 68547, 'calle 17 #3w-65 miraflores torre 36 apto 11-37', '3013113138', '2016-09-01', '2016-09-01'),
(3, 44, 'eder alvarez', 11, 11001, 'calle 39 # 20-3', '3013119198', '2016-09-01', '2016-09-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_favs`
--

CREATE TABLE `user_favs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `art_cod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barrios`
--
ALTER TABLE `barrios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra_items`
--
ALTER TABLE `compra_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conn`
--
ALTER TABLE `conn`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dia_barrio`
--
ALTER TABLE `dia_barrio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventariofamilia`
--
ALTER TABLE `inventariofamilia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventariogrupo`
--
ALTER TABLE `inventariogrupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu_inventariogrupo`
--
ALTER TABLE `menu_inventariogrupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metodo_envio`
--
ALTER TABLE `metodo_envio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_datos`
--
ALTER TABLE `user_datos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_env`
--
ALTER TABLE `user_env`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_favs`
--
ALTER TABLE `user_favs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barrios`
--
ALTER TABLE `barrios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `compra_items`
--
ALTER TABLE `compra_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `conn`
--
ALTER TABLE `conn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT de la tabla `dias`
--
ALTER TABLE `dias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `dia_barrio`
--
ALTER TABLE `dia_barrio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `inventariofamilia`
--
ALTER TABLE `inventariofamilia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=754;
--
-- AUTO_INCREMENT de la tabla `inventariogrupo`
--
ALTER TABLE `inventariogrupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `menu_inventariogrupo`
--
ALTER TABLE `menu_inventariogrupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `metodo_envio`
--
ALTER TABLE `metodo_envio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT de la tabla `user_datos`
--
ALTER TABLE `user_datos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `user_env`
--
ALTER TABLE `user_env`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `user_favs`
--
ALTER TABLE `user_favs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
