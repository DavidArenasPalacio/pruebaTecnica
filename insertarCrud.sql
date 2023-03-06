-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-03-2023 a las 15:05:17
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `insertarCrud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(30) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `documento`, `direccion`) VALUES
(1, 'Darty', 'Perez', '23354444', 'CR 37 #578'),
(2, 'Libardo', 'Munera Gomez', '98595826', 'Cr #44 109'),
(3, 'Lina Marcela', 'Jaramillo Jaramillo', '30232233', 'Cll 24'),
(4, 'Nohemí', 'Sierra Ramírez', '52291364', 'Cr 34'),
(5, 'Liliana Del Rosario', 'Ballesteros Muñoz', '52620775', 'Calle 10 # 5-51'),
(6, 'Luz Angela', 'Gonzalez Gomez ', '20455899', 'Avenida 19 No. 98-03, sexto piso,\nEdificio Torre 100 '),
(7, 'Luz Esmeralda', 'Luz Esmeralda', '63336191', 'Calle 53 No 10-60/46, Piso 2. '),
(8, 'Aura Janneth', 'Hernandez Uribe', '63475000', 'Calle 10 # 5-51 '),
(9, 'Luis Fernando', 'Rubio Jaramillo ', '72206646', 'Avenida Calle 26 No 59-51 Edificio\nArgos - Torre 3 Piso 4'),
(10, 'Ingrid yulieth', 'Molina londoño ', '50930839', 'Calle 9 # 9 – 62, Leticia, Barrio Centro'),
(11, 'Nuvia Silvana', 'Tutistar Jojoa', '59827178', 'Calle 19 # 80A-40. Barrio Belén La\nNubia'),
(12, 'Cristina', 'Baron', '52347754', 'Carrera 21 # 17 -63 '),
(13, 'Martha Angélica', 'Salazar Hurtado', '31991865', 'Carrera 42 # 54-77 Barrio El Recreo '),
(14, 'Edgar Fernando', 'Riascos Vallejo', '79582494', 'Calle 100 # 11B-27 Bogotá '),
(15, 'Teresa', 'Hurtado Osorio', '25163718', 'Carrera 20 B # 29-18. Barrio Pie de la\nPopa'),
(16, 'Mirian rosa', ' Herazo rivera', '64742776', 'Transversal 9 a No. 29 - 29 Barrio\nMaldonado '),
(17, 'Delcy Carolina', 'Parra Diettes', '63539176', 'Calle 53 # 25A-35 '),
(18, 'Edwin Fernney', 'Lopera Piedrahita', '98561447', ''),
(19, 'Francely', 'Caicedo Vera', '63488632', ''),
(20, 'Hector Yesid', 'Abril Molina ', '80246477', 'Carrera 20 B # 29-18. Barrio Pie de la\nPopa.'),
(21, 'Helga Julia', 'Salazar Berdugo', '32724047', 'Calle 7 # 19-35 '),
(22, 'Magda liliana', 'Martinez orjuela', '65766151', 'Calle 4 norte # 10B-66 Barrio Modelo'),
(23, 'Janneth Clemencia', 'Becerra Romero', '52009251', 'arrera 8 #15ª-19, Locales comerciales\nSanto Domingo'),
(24, 'Esmith', 'Centeno Moncada', '52116040', 'Calle 28 # 2-27 Barrio Centro '),
(25, 'Juan Carlos', 'Gutierrez Duarte ', '79494802', 'Calle 25 # 6-08 '),
(26, 'Alexander', 'Jaramillo Blandón ', '71749266', 'Calle 10 # 8-07'),
(27, 'Sixta María', 'Montes Contreras', '64567254', 'Carrera 12 No. 19-00 Local 18 Centro\nComercial Altavista '),
(28, 'Claudia Patricia', 'Mosquera Gaviria ', '67000579', 'Calle 5 # 4-48 Barrio Centro '),
(29, 'Adriana', 'Velandia Aparicio', '52106014', 'Calle 16 # 3-28'),
(30, 'Job Gabriel ', 'Yepes Espitia', '88158266', 'Calle 22 # 13 – A 88 Barrio Los\nAlcazares'),
(31, 'Katia ', 'Contreras', '64575137', 'Calle 37 # 42-12'),
(32, 'Gloria Patricia', 'Rincón Montoya', '29533602', 'Calle 17 # 29-70 '),
(33, 'Carlos Antonio', 'Barragán Torres', '79503475', 'Calle 8 # 7-40 Centro '),
(34, 'Daniel Efren', 'Daza Timaná', '10547830', 'Avenida 1 # 28-57'),
(35, 'Luis', 'López Bayardo ', '11519403', 'Avenida 30 de agosto # 26-37 '),
(36, 'Judith', 'Cardona Gallego', '52005153', 'Carrera 7 # 2-70 Sector Swamp\nGround'),
(37, 'Mirely', 'Parra Cuervo', '52356950', 'Carrera 10 # 3-92'),
(38, 'Rosa Elvira', 'Vivas Mera', '25348436', 'Carrera 11 # 41-13 '),
(39, 'Andres', 'Sotelo Rosales', '1026250944', 'Calle 20 # 24-05 Barrio Centro '),
(40, 'Geimy Marcerla', 'Montenegro Tunjo', '5240183', 'Avenida 3 norte # 50N-20 '),
(41, 'Claudia Milena', 'Tibaduiza Contreras', '63515328', 'CARRERA 5 N 12 43 BARRIO SEMINARIO, IPIALES, NARINO'),
(42, 'ALDEMAR CADAVID', 'ECHEVERRI', '23433221', 'TRANSVERSAL 45 47 14 PISO 5 OF 501 EDIFICIO MINISTERIO TRANSPORTE, BOGOTA, BOGOTA\n'),
(43, 'JAIRO ENRIQUE', 'AQUITE RAMIREZ', '1044422199', 'Calle 27 d sur # 27 c 51'),
(44, 'JOSE MANUEL', 'AVENDAÑO SALTAREN ', '85452130', 'Diagonal 40 # 41 61'),
(45, 'GUIANCARLO', 'BARRAZA SERJE', '1129583111', 'KR 23 # 35 - 48'),
(46, 'OSWALTH HELMUTH', 'BARRETO QUIROGA', '72310516', 'CALLE 35 # 33-09'),
(47, 'CESAR ANDRÉS', 'BARRIOS ARROYO', '1140816752', 'Carrera 53 # 70 - 86'),
(48, 'ALVARO JOSE', 'GOENAGA PARDO', '3738855', 'Carrera 53 # 70 - 86'),
(49, 'MARIA ALEJANDRA', 'GUERRERO GALEANO', '1045684960', 'avenida carrera 19 # 127 d -55'),
(50, 'EDUIN ALBERTO', 'IGLESIAS PEREZ', '72023310', 'Avenida el dorado # 68D - 35'),
(51, 'JORGE NEYIB', 'MAZIRI COMAS', '1140825190', 'TRANSVERSAL 78 I BIS # 41 A 16 SUR'),
(52, 'MIGUEL ALBERTO', 'MOLINA SOLANO', '1045673983', 'AV 6 A # 20 NORTE - 20'),
(53, 'JHON HANSEL', 'NOYA VERGARA ', '1045667762', 'Circular 76 # 39b 80'),
(54, 'JOHN ADELMO', 'PARRA CASTRO', '72159458', 'Aguachica, Cesar'),
(55, 'WILSON TOMAS', 'RODRIGUEZ TUESCA', '72287417', 'Cra 8 # 9 -83, Bogotá, D.C., - Colombia\n'),
(56, 'ALDEMAR CADAVID', 'ECHEVERRI', '233432', 'Calle 10 No. 9 - 78  Centro'),
(57, 'GUSTAVO ALBERTO', 'GÓMEZ AREIZA', '993327', 'Carrera 56A No. 51 - 81'),
(58, 'GUSTAVO ALBERTO', 'GÓMEZ AREIZA', '345642', 'Carrera 56A No. 51 - 81'),
(59, 'PEREZ MOGOLLON', 'MARIO ALEXANDER', '3412389', 'MARIO ALEXANDER'),
(60, 'CARLOS ALBERTO', 'CASTELLANOS COLLANTE', '42214353', 'Carrera 54 No. 68 - 80 Barrio el Prado'),
(61, 'OSVALDO DE JESUS', 'ALTAMAR ALMENDRALES', '87654', 'Calle 59 No. 27 - 35 Barrio Galán'),
(62, 'MARTHA MARINA', 'SOLANO VASQUEZ', '23434', 'Carrera 10A No. 20 - 40  Edificio El Clarín piso 3 Centro La Matuna'),
(63, 'LYDA CONSUELO', 'ZUÑIGA GALVIS', '123433452', 'Carrera 8  No. 20 - 59'),
(64, 'FERNANDO EUGENIO', 'OSORIO TIRADO', '3345454', 'Calle 20 No. 22 - 27 piso 3 Edificio Cumanday'),
(65, 'JOSE EDGAR', 'CASTELBLANCO CARDOSO', '1564433', 'Carrera 8a No. 7 - 88 /94  Barrio  La Estrella'),
(66, 'OSCAR HERNANDO', 'TORRES LUNA', '6874332', 'Carrera  5 No. 3 -74  centro'),
(67, 'JULIO MIGUEL', 'DE LA HOZ STEVENSON', '453121', 'Calle 15 No. 9 - 56 centro'),
(68, 'LUZ MARINA', 'AGUALIMPIA BENITEZ', '45312123', 'Calle 25 No. 4 - 38 piso 2  Barrio Pandeyuca'),
(69, 'VICTOR', 'GONZALEZ HUMANEZ', '23453431', 'Calle 28 No. 8 - 69 CENTRO'),
(70, 'OSIRIS DENARES', 'DANIES PANA', '32123343', 'Calle 7 No. 5 - 25  Edificio Segunda'),
(71, 'ALBEY', 'CALDERON', '234343', 'Carrera 9  No. 7 - 34'),
(72, 'DANCY DE JESUS', 'PALACIO FRIAS', '355643', 'Calle 20 No. 3 - 22'),
(73, 'DALIA MARÍA', ' AVILA REYES', '324345', 'Calle 33B  No. 38 - 42  Barrio Barzal'),
(74, 'LEONARDO FRANCISCO', 'ZARAMA ROSERO', '432324', 'Calle 16 No. 23 - 57 piso 4  Edificio Autoservicio Abraham Delgado'),
(75, 'SOLANGEL', 'SUESCUN LEA', '5464234', 'Calle 12 No. 4 - 19  Edificio Panamericano Of. 406'),
(76, 'ANGEL EDUARDO', 'PEREZ FAJARDO', '2392', 'Cr 5 No. 9 - 08'),
(77, 'CARMEN LUCY', 'ARISMENDY MARTÍNEZ', '45643', 'CALLE 23 No. 12-11'),
(78, 'CARLOS ALBERTO', 'BETANCOURT GÓMEZ', '988823', 'Calle 19 No. 8 - 34  of. 502'),
(79, 'SOFIA', 'GORDON BENT', '875564', 'Avda Francisco Newball No. 4A-20 - Edif. Cámara de Comercio Of. 304'),
(80, 'DIANA', 'STELLA MIRANDA ARDILA', '3435342', 'Calle 31 No. 13 - 71 of. 301 Edif. Rey'),
(81, 'AYDA LUZ', 'GONZALEZ VERGARA', '655455', 'Carrera 20 No. 25 - 53  Primer piso centro'),
(82, 'MAURICIO FERNANDO', 'MORA BONILLA', '8677762', 'Carrera 3  con Calle 28 Esquina Barrio Claret'),
(83, 'FANNY', 'SOFIA WILCHES', '87862', 'Calle 111 No. 100 - 11  Barrio el Estadio'),
(84, 'DRA. GIOVANN', ' SAAVEDRA LASSO', '232421', 'CARRERA 42 No.5C-48 Barrio Tequendama'),
(85, 'NURYS ESTHER', 'VELASQUEZ PADILLA', '87323245', 'Carrera 23  No. 10A - 10'),
(86, 'JAIRO ENRIQUE', 'AQUITE RAMIREZ', '1044422199', 'El Hueco Calle 27\n'),
(87, 'JOSE MANUEL', 'AVENDAÑO SALTAREN', '85452130', 'Calle 56h, 18bb1-18bb47'),
(88, 'GUIANCARLO', 'BARRAZA SERJE ', '1129583111', 'Calle 56a, 20a32-20a70'),
(89, 'OSWALTH HELMUTH', 'BARRETO QUIROGA', '72310516', 'Br.Villa Liliam (Cr 8a - Cl 57, Medellín)'),
(90, 'CESAR ANDRÉS', 'BARRIOS ARROYO', '1140816752', 'Carrera 11'),
(91, 'ALVARO JOSE', 'GOENAGA PARDO', '3738855', 'Carrera 30, 711'),
(92, 'MARIA ALEJANDRA', 'GONZALEZ DE LOS REYES', '1045684960', 'Cll 31b Con Cra 100'),
(93, 'JORGE ANTONIO', 'GUERRERO GALEANO ', '1045669524', 'Carrera 75, 80b2-80b34'),
(94, 'EDUIN ALBERTO', 'IGLESIAS PEREZ', '72023310', 'Carrera 18a, 622-62160'),
(95, 'JORGE NEYIB', 'MAZIRI COMAS', '1140825190', 'Calle 56h, 18bb1-18bb47'),
(96, 'ALBERTO', 'MOLINA SOLANO MIGUEL', '1045673983', 'Calle 56a, 20a32-20a70'),
(97, 'JOHN ADELMO', 'PARRA CASTRO', '72159458', 'Carrera 11'),
(98, 'WILSON TOMAS', 'RODRIGUEZ TUESCA ', '72287417', 'Parque De Aranjuez'),
(99, 'LUZ DARY', 'RUIZ GANDIA ', '22564883', 'Calle 120, 42d1'),
(100, 'CARMEN MERCEDES', 'SALAZAR CABALLERO', '1045674325', 'Kilómetro 7 Avg'),
(101, 'ROOSBELT MANUEL', 'VERGARA ALVAREZ', '1102816864', 'Br. San José De La Cima (Cr 32 - Cl 89a, Medellín)'),
(102, 'DELMA ESTHER', 'VILORIA AHUMADA', '225844162', 'Carrera 28b, 108f23-108f33'),
(103, 'LUIS GUILLERMO', 'SUAREZ LEON', '72268087', 'Quebrada La Bermejala (Cr 49 - Cl 85c, Medellín)'),
(104, 'KATERIN', 'ALVARADO PINEDA', '1046813821', 'Calle 59a 192-1970'),
(105, 'CARLOS ARTURO', 'SALCEDO DELA CRUZ', '8795031', 'La Almeria Calle 35c, 86a2-86a100'),
(106, 'JHON JAIME', 'SANDOVAL MANTILLA ', '72049659', 'La Almeria Calle 35c, 86a2-86a100'),
(107, 'JULIO CESAR', 'ARRIETA PEREZ', '72204065', 'Carrera 81, 37d64'),
(108, 'LEYNIKER', 'ESCOBAR BRACHE', '1047337358', 'Carrera 81, 37d64'),
(109, 'MANUEL DEL CRISTO', 'MERCADO BARBOZA', '92511331', 'Tax Maya Estación Santa Lucia'),
(110, 'YASSET ALFONSO', 'VEJAR URIBE', '80000015', 'Calle 47d 872, Estación Santa Lucía Buses'),
(111, 'ERNESTO BENJAMIN', 'PEÑALOZA MEJIA', '8692591', 'C.C Santa Fe Balsos'),
(112, 'JAN LUIS', 'COMAS RUIZ', '1140828961', 'Estación Suramericana'),
(113, 'ALBERTO CARLOS', 'ESPINOSA GARAVITO', '92536397', 'Unicentro Calle 33 Con Cra. 65d'),
(114, 'ELAYNE CAROLINA', 'ALBOR ATENCIA', '1045667833', 'Cll 31b Con Cra 100'),
(115, 'DARLING ESTHER', 'ALGARIN ROJAS', '1129579363', 'Estación Estadio Calle 47d, 7096'),
(116, 'RONALD YESID', 'ARGOTE GUZMAN', '72264281', 'Calle 53, 712-7194'),
(117, 'MARIA LEONOR', 'AVILA MORA ', '52713101', 'La Almería Calle 35b, 87a1-87a101'),
(118, 'LORENA', 'BAYONA FONTALVO', '1129497618', 'Cll 31b Con Cra 100'),
(119, 'JOSELYN', 'BAYUELO MOLINA', '22585880', 'Cll 31b Con Cra 100'),
(120, 'DAYANA', 'BENAVIDES BENAVIDES', '1124009273', 'Mobil Los Almendros Calle 32 F	VER'),
(121, 'GUILLERMO ANTONIO', 'CASTRO BARRIOS', '8487233', 'La Almería Calle 35b, 87a1-87a101'),
(122, 'MAURICIO JOSÉ', 'CERON FREYLE', '72255670', 'Cll 31b Con Cra 100'),
(123, 'DARLYS PATRICIA', 'COBA DAVILA', '55247025', 'Cll 32 Con Cra 86'),
(124, 'ADIELA DEL CARMEN', 'DELGADO JIMENEZ', '39462709', 'C.C Santa Fe Balsos'),
(125, 'PAULA ANDREA', 'ESTRADA GARCÍA', '41956315', 'Calle 53, 712-7194'),
(126, 'DONALDO ALFONSO', 'FERNANDEZ VENDRIES ', '72287846', 'Cll 31b Con Cra 100'),
(127, 'MILENA PATRICIA', 'JIMENEZ PATRICIA ', '22520612', 'Mobil Los Almendros Calle 32 F'),
(128, 'JUAN CAMILO', 'LANCHEROS BELTRAN', '1129515209', 'Parque De Aranjuez'),
(129, 'YOHANA PATRICIA', 'MENDOZA ROBLES', '1065373000', 'Universidad De Medellín'),
(130, 'CARLOS ALBERTO', 'MONTES GONZALEZ ', '720550061', 'Estación Suramericana'),
(131, 'LEWIS ARIEL', 'OROZCO JIMENEZ', '72335964', 'Terminal Del Norte Buses'),
(132, 'ANA KARINA', 'PALACIO ANGULO', '1129523535', 'Caribe (Metroplús)'),
(133, 'ALVARO RAFAEL', 'BARRAZA ALVAREZ ', '72196171', 'Cll 31b Con Cra 100'),
(134, 'YULIANA DE SOCORRO', 'GARCÌA PACHECO', '22622595', 'Cll 32 Con Cra 86'),
(135, 'SHIRLEY ISABEL', 'MARIANO MENDOZA', '22491510', 'Cll 31b Con Cra 100'),
(136, 'JOSÈ IGNACIO', 'NAVARRO PEREZ ', '8649717', 'Carrera 81 Con 42c'),
(137, 'HENRY ANTONIO', 'TORRES BENITEZ', '72187671', 'Mobil Los Almendros Calle 32 F'),
(138, 'JOSE LUIS', 'BERMEJO POLO', '72013299', 'Cr 48c - Cl 12, Medellín'),
(139, 'NURIS ISABEL', 'CONRADO MATOS ', '22632314', 'Parque De Aranjuez'),
(140, 'MILENA PATRICIA', 'FANDIÑO DE LA HOZ', '22746679', 'Universidad De Medellín'),
(141, 'DIANA', 'HOYOS DE LA HOZ', '32852065', 'Carrera 81, 37d64'),
(142, 'JOHANA PAOLA', 'MARTINEZ CORONADO ', '55247461', 'La Palma ⇄ Loma de los Bernal'),
(143, 'MARTHA CECILIA', 'PORTILLA GRANADOS', '60275287', 'La Palma ⇄ Aliadas'),
(144, 'YISELL ROCIO', 'ROMERO ALGARIN', '22524867', 'La Sierra-Villatina-Alejandro Echavarría-Bomboná-Alejandro Echavarría'),
(145, 'SANDRA LILIANA', 'TELLEZ SIABATO', '32738666', 'Parque San Antonio ⇄ El Vergel'),
(146, 'KISIS', 'VEGA LOZANO', '22477676', 'Parque San Antonio ⇄ El Vergel'),
(147, 'YASMIN', 'VSRELA ESMERAL YAREISY', '226411217', 'Parque San Antonio ⇄ Cataluña'),
(148, 'YRAIDA PAOLA', 'ALFARO RODRIGUEZ', '30894235', 'Br. Trece De Noviembre (Cr 23 - Cl 56hc, Medellín)'),
(149, 'CESAR ANTONIO', 'ESCALANTE CASTRO', '8797488', 'Avenida Colombia, 322-32120'),
(150, 'DAYSE DEL SOCORRO', 'GARCIA PAZ', '57412002', 'Br. Miraflores (Cr 28 - Cr 49, Medellín)'),
(151, 'FARID ENRIQUE', 'JUSQUINI ROMERO ', '72432385', 'Calle 50, 30a-16'),
(152, 'JORGE LUIS', 'MORENO DE LA CRUZ', '1140815908', 'Br. Buenos Aíres (Cl 47 - Cr 30, Medellín)'),
(153, 'YARELIS DEL CARMEN', 'ORJUELA DIAZ', '55220099', 'Urbanización Los Andes (Cl 47 - Cr 28, Medellín)'),
(154, 'CARMEN MARY', 'ORTIZ RODRIGUEZ', '57290326', 'Urbanización Los Andes (Cl 47 - Cr 28, Medellín)'),
(155, 'JAIME', 'RICO ACEVEDO', '72165465', 'Br. Caicedo (Cl 51 - Cr 32, Medellín)'),
(156, 'SULMA INES', 'SIERRA TROCHA', '22913497', 'Br. Sucre (Cr 32 - Cl 52, Medellín)'),
(157, 'JACOB', 'UTRIA PARRA VIDAL', '8603616', 'Calle 6 Sur, 50c37'),
(158, 'NELLY', 'CASTRO NAVARRO ', '32889169', 'Carrera 50e, 7s-04'),
(159, 'NICOLAS JAVIER', 'CORENA GUERRA', '15026020', 'Cl 6 Sur - Cr 50ee, Medellín'),
(160, 'NUBIA JOHANNA', 'FLOREZ MONROY', '1129535207', 'Cr 50ff - Cl 7, Medellín'),
(161, 'NUBIA ESTHER', 'MARRUGO DE FIGUEROA', '22688976', 'El Rodeo'),
(162, 'GABRIEL', 'MENDOZA RODRÍGUEZ', '72341069', 'Inem Regional'),
(163, 'GREISY DEL CARMEN', 'MENGUAL CAMPO', '32861694', 'Circular 2, 701-7011'),
(164, 'ERICA PATRICIA', 'OVIEDO JARAMILLO', '1102803835', 'Upb Capilla'),
(165, 'RICARDO', 'PACHECO SOTO', '72268538', 'Circular 1'),
(166, 'JARVIN', 'SIMANCA', '73167337', 'Upb Circular 1, 7019'),
(167, 'LIZ SANDRA', 'TANOS ESTRELLA', '25786141', 'Avenida San Juan, 70a1-70a37'),
(168, 'NELSY SOFIA', 'ZAMBRANO BRUNO', '32894930', 'Estación Texaco Calle 44, 70-78'),
(169, 'SANDRA MILENA', 'CALDERON MARIANO', '22519916', 'Carrera 50a, 76 Sur, Urb Los Ándes'),
(170, 'IVIS DANIELA', 'DE AVILA SOBRINO ', '1143119932', 'Carrera 49, 61 Sur, Estación Sabaneta Buses	'),
(171, 'SAMIA SAMIRA', ' DIAZ BELEÑO', '1137223010', 'Carrera 46, 67s-28'),
(172, 'DILIA DE JESUS', 'GRANADOS ARJONA', '36539361', 'Autopista Sur, 29a1'),
(173, 'AURA CECILIA', 'NAVARRO FUENTES', '39049684', 'Carrera 50a, 23a, Terminal Yarumito'),
(174, 'IVAN FERNANDO', 'OSORIO MENDOZA', '72164627', 'Iglesia La Paz'),
(175, 'LINA DEYANIRA', 'POLO JIMENEZ', '326322133', 'La Paz'),
(176, 'SARAH JO', 'QUAINT', '388250', 'Carrera 48, 46a Sur1'),
(177, 'PATRICIA', 'RIVERA CERPA ROSANA', '22479291', 'Carrera 48, 39a Sur275-39a Sur521'),
(178, 'WILLIAM XAVIER', 'VEGA BERBEN', '77093797', 'Avenida El Poblado, 45b Sur103'),
(179, 'JOSE FERNANDO', 'ZAPATA NARVAEZ', '72246744', 'Carrera 48, 4367-4377'),
(180, 'MARIA', 'PUCUNA CEPEDA', '205.023 ', 'Calle 25 Sur, Quebrada Ayurá'),
(181, 'NICOLAS RODRIGO', 'VASQUEZ CUEVAS ', '249.105', 'Hospital Mua'),
(182, 'FELIX MARIA', 'CASTRO MENDEZ ', '255.554 ', 'Parque San Antonio Junin'),
(183, 'ALBERTO', 'ALMANZA RODRIGUEZ', '396.079 ', 'Carrera 50a, 76 Sur, Urb Los Ándes'),
(184, 'OMAR ', 'MARTINEZ AGUILERA', '478.806', 'Carrera 49, 61 Sur, Estación Sabaneta Buses'),
(185, 'JACOME ALEXIS', 'ROGER SANCHEZ', '1.977.392', 'Carrera 46, 67s-28'),
(186, 'RUBEN DARIO', 'ANDRADE HOYOS', '2.375.435', 'Autopista Sur, 29a1'),
(187, 'HECTOR MANUE', 'PACHECO SOLANOL', '2.760.120', 'Carrera 50a, 23a, Terminal Yarumito'),
(188, 'ROLANDO CLAUDIO', 'OVIEDO SABOGAL', '2.994.445', 'Carrera 50a, 23a, Terminal Yarumito'),
(189, 'JORGE HUMBERTO ', 'ROJAS CRUZ ', '2.995.680', 'Carrera 50, 106 Sur, Caldas-Tablaza'),
(190, 'HECTOR FERNANDO', 'RINCON SABOGAL', '2.999.652', 'Carrera 45, 74 Sur38'),
(191, 'MAURICIO', 'NAVARRETE', '3.010.162 ', 'Carrera 49, 61 Sur, Estación Sabaneta Buses'),
(192, 'CARLOS HUMBERTO ', 'ROMERO', '3.017.169 ', 'Carrera 33, 72 Sur, La Inmaculada'),
(193, 'LEONARDO ANDRES', 'CHAVES ROBAYO', '3.028.273', 'Sta Barbara-Caldas, Parador Los Lagos'),
(194, 'JUAN DE JESUS', 'RODRIGUEZ SOLAQUE', '3.064.548', 'San Antonio de Prado ⇄ Estación Sabaneta'),
(195, 'SEGUNDO ISMAEL', 'ROJAS HERRERA ', '3.070.017 ', 'San Antonio de Prado ⇄ El Vergel ⇄ Estación Sabaneta'),
(196, 'JOSE LUIS', 'PACHECO BONILLA ', '3.094.676', 'C4 013 La nueva-Vda Olivares Virgen-Quebrada Doña María-Éxito Itagüí-Est Sabaneta (Circular)'),
(197, 'IGNACIO', 'CALDERON BERNAL', '3.101.598', 'Carrera 50a, 23a, Terminal Yarumit'),
(198, 'FREDY YAMIL', 'ASTAÑEDA ZAPATA', '3.174.185 ', 'Carrera 34, 39 Sur2'),
(199, 'WILSON RUIZ', 'BECERRA', '3.245.428', 'Calle 39 Sur, 351'),
(200, 'JORGE IVAN ', 'MONTOYA VELEZ', '3.377.448', 'Calle 40d Sur, 311'),
(201, 'Daya', 'Monsalve Holguin', '19887289', 'Calle 23 #45 2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
