-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-04-2019 a las 22:42:23
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cineapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `archivo` varchar(250) NOT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banners`
--

INSERT INTO `banners` (`id`, `titulo`, `fecha`, `archivo`, `estatus`) VALUES
(1, 'Estreno - Kong La Isla Calavera', '2017-07-27', 'slide1.jpg', 'Activo'),
(2, 'Proximo Mes - La bella y la bestia', '2017-07-27', 'slide2.jpg', 'Activo'),
(3, 'Ya esta aquí - Spider Man, de regreso a casa', '2017-07-28', 'slide3.jpg', 'Activo'),
(4, 'Por fin ha llegado el día - Cars 3 ', '2017-07-29', 'slide4.jpg', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

DROP TABLE IF EXISTS `detalles`;
CREATE TABLE IF NOT EXISTS `detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director` varchar(100) DEFAULT NULL,
  `actores` varchar(255) DEFAULT NULL,
  `sinopsis` text,
  `trailer` varchar(255) DEFAULT NULL COMMENT 'URL del video en Youtube\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`id`, `director`, `actores`, `sinopsis`, `trailer`) VALUES
(1, 'Jordan Vogt-Roberts', 'Samuel L. Jackson,Tom Hiddleston,Brie Larson,Toby Kebbell', 'Kong: La Isla Calavera reimagina el origen del mítico Kong en una irresistible aventura original del director Jordan Vogt-Roberts. En la película, un diverso equipo de exploradores es reunido para aventurarse en el interior de una isla del Pacífico —tan bella como traicionera— que no aparece en los mapas, sin saber que están invadiendo los dominios del mítico Kong.', 'https://www.youtube.com/embed/86jhW2gPc84'),
(2, 'Daniel Espinosa', 'Jake Gyllenhaal, Ryan Reynolds, Rebecca Ferguson', 'Seis miembros de la tripulación de la Estación Espacial Internacional que están a punto de lograr uno de los descubrimientos más importantes en la historia humana: la primera evidencia de vida extraterrestre en Marte. A medida que el equipo comienza a investigar y sus métodos tienen consecuencias inesperadas, la forma viviente demostrará ser más inteligente de lo que cualquiera esperaba.', 'https://www.youtube.com/embed/_cq1XIVXdjU'),
(3, 'Bill Condon', 'Dan Stevens,Emma Watson,Luke Evans', 'LA BELLA Y LA BESTIA, de Disney, es una adaptación de acción real de la película animada, que revive a los queridos personajes del clásico cuento de Disney para una audiencia contemporánea, manteniendo la música original e incorporando varias nuevas canciones.', 'https://www.youtube.com/embed/4D8N06nx9rs'),
(4, 'Oriol Paulo', 'Mario Casas, Bárbara Lennie, José Coronado, Ana Wagener', 'Adrián Doria, un joven y exitoso empresario, despierta en la habitación de un hotel junto al cadáver de su amante. Acusado de asesinato, decide contratar los servicios de Virginia Goodman, la mejor preparadora de testigos del país. En el transcurso de una noche, asesora y cliente trabajarán para encontrar una duda razonable que le libre de la cárcel.', 'https://www.youtube.com/embed/sOxy2gtPY7A'),
(5, 'Dean Israelite', 'Bryan Cranston, Elizabeth Banks, Becky G, Dacre Montgomery', 'Cinco adolescentes deben convertirse en algo extraordinario al enterarse que su pueblo, Angel Grove, y el mundo están a punto de ser aniquilados por una amenaza extraterrestre. Escogidos por el destino, nuestros héroes pronto descubren que son los únicos que pueden salvar el planeta…pero para hacerlo, deberán superar sus problemas de la vida real y, antes que sea demasiado tarde, unirse como los PowerRangers.', 'https://www.youtube.com/embed/gemUEi0XMTg'),
(6, 'F. Gary Gray', 'Dwayne Johnson,Michelle Rodriguez,Charlize Theron,Jason Statham,Vin Diesel', 'Justo cuando Dom y Letty celebran su luna de miel, Brian y Mia se han retirado del juego y el resto del equipo se ha desintegrado en busca de una vida comun y corriente; una misteriosa mujer intentara seducir a Dom para convencerlo de regresar a la vida criminal que tanto lo acecha, traicionando a quienes lo rodean y enfrentandose a retos nunca antes vistos.', 'https://www.youtube.com/embed/3KuazYQ1JuE'),
(7, 'James Gunn', 'Dave Bautista,Bradley Cooper,Zoe Saldana,Vin Diesel,Chris Pratt', 'Ambientada en el nuevo contexto sonoro de \"Awesome Mixtape #2\", GUARDIANES DE LA GALAXIA VOL. 2, de Marvel, continua las aventuras del equipo en su travesia por los confines del cosmos. Los Guardianes deberan luchar para mantener unida a su nueva familia mientras intentan resolver el misterio del verdadero linaje de Peter Quill. Viejos rivales se convertiran en nuevos aliados y los personajes favoritos de los comics clasicos acudiran en ayuda de nuestros heroes a medida que el Universo Cinematografico de Marvel continua expandiendose.', 'https://www.youtube.com/embed/bBTtlcJwjSo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

DROP TABLE IF EXISTS `horarios`;
CREATE TABLE IF NOT EXISTS `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `sala` varchar(100) NOT NULL,
  `precio` double NOT NULL DEFAULT '0',
  `idPelicula` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Horarios_Peliculas1_idx` (`idPelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `fecha`, `hora`, `sala`, `precio`, `idPelicula`) VALUES
(1, '2019-04-02', '18:00:00', 'Premium', 55, 1),
(2, '2019-10-25', '18:00:00', 'Premium', 55, 3),
(3, '2019-10-25', '21:00:00', 'Premium', 55, 3),
(4, '2019-10-25', '18:00:00', 'Premium', 65, 4),
(5, '2019-10-25', '21:00:00', 'Premium', 65, 4),
(6, '2019-10-25', '20:00:00', 'Premium', 55, 5),
(7, '2019-10-25', '16:30:00', 'Premium', 60, 7),
(8, '2019-10-25', '15:45:00', 'Premium', 55, 8),
(9, '2019-04-01', '14:00:00', 'Sala 1', 55, 1),
(10, '2017-10-25', '16:00:00', 'Sala 1', 55, 1),
(11, '2017-10-25', '14:00:00', 'Sala 1', 60, 2),
(12, '2017-10-25', '16:00:00', 'Sala 1', 60, 2),
(13, '2017-10-25', '14:00:00', 'Sala 1', 55, 3),
(14, '2017-10-25', '16:00:00', 'Sala 1', 55, 3),
(15, '2017-10-25', '14:00:00', 'Sala 1', 65, 4),
(16, '2017-10-25', '16:00:00', 'Sala 1', 65, 4),
(17, '2017-10-25', '17:00:00', 'Sala 1', 55, 5),
(18, '2017-10-25', '19:00:00', 'Sala 1', 55, 5),
(19, '2017-10-25', '21:00:00', 'Sala 1', 55, 5),
(20, '2017-10-25', '18:45:00', 'Sala 1', 55, 8),
(21, '2017-10-25', '21:45:00', 'Sala 1', 55, 8),
(22, '2017-10-25', '17:00:00', 'Sala 2', 55, 3),
(23, '2017-10-25', '17:00:00', 'Sala 2', 65, 4),
(24, '2017-10-25', '16:00:00', 'Sala 2', 55, 5),
(25, '2017-10-25', '18:30:00', 'Sala 2', 60, 7),
(26, '2017-10-25', '16:00:00', 'Sala 3', 55, 3),
(27, '2017-10-25', '16:00:00', 'Sala 3', 65, 4),
(28, '2017-10-25', '22:00:00', 'Sala 3', 55, 5),
(29, '2017-10-25', '20:45:00', 'Sala 3', 60, 7),
(30, '2017-10-25', '22:20:00', 'Sala 3', 55, 8),
(31, '2017-10-26', '18:00:00', 'Premium', 55, 1),
(32, '2017-10-26', '18:00:00', 'Premium', 55, 3),
(33, '2017-10-26', '21:00:00', 'Premium', 55, 3),
(34, '2017-10-26', '18:00:00', 'Premium', 65, 4),
(35, '2017-10-26', '21:00:00', 'Premium', 65, 4),
(36, '2017-10-26', '14:30:00', 'Premium', 55, 8),
(37, '2017-10-26', '17:00:00', 'Premium', 55, 8),
(38, '2017-10-26', '14:00:00', 'Sala 1', 55, 1),
(39, '2017-10-26', '16:00:00', 'Sala 1', 55, 1),
(40, '2017-10-26', '14:00:00', 'Sala 1', 60, 2),
(41, '2017-10-26', '16:00:00', 'Sala 1', 60, 2),
(42, '2017-10-26', '14:00:00', 'Sala 1', 55, 3),
(43, '2017-10-26', '16:00:00', 'Sala 1', 55, 3),
(44, '2017-10-26', '14:00:00', 'Sala 1', 65, 4),
(45, '2017-10-26', '16:00:00', 'Sala 1', 65, 4),
(46, '2017-10-26', '17:50:00', 'Sala 1', 55, 8),
(47, '2017-10-26', '17:00:00', 'Sala 2', 55, 3),
(48, '2017-10-26', '17:00:00', 'Sala 2', 65, 4),
(49, '2017-10-26', '17:00:00', 'Sala 2', 55, 8),
(50, '2017-10-26', '16:00:00', 'Sala 3', 55, 3),
(51, '2017-10-26', '16:00:00', 'Sala 3', 65, 4),
(52, '2017-10-26', '22:10:00', 'Sala 3', 55, 8),
(53, '2017-10-27', '18:00:00', 'Premium', 55, 5),
(54, '2017-10-27', '21:00:00', 'Premium', 55, 5),
(55, '2017-10-27', '20:00:00', 'Premium', 60, 2),
(56, '2017-10-27', '15:30:00', 'Premium', 55, 8),
(57, '2017-10-27', '14:00:00', 'Sala 1', 55, 5),
(58, '2017-10-27', '16:00:00', 'Sala 1', 55, 5),
(59, '2017-10-27', '17:00:00', 'Sala 1', 60, 2),
(60, '2017-10-27', '19:00:00', 'Sala 1', 60, 2),
(61, '2017-10-27', '21:00:00', 'Sala 1', 60, 2),
(62, '2017-10-27', '20:30:00', 'Sala 1', 55, 8),
(63, '2017-10-27', '13:30:00', 'Sala 1', 60, 7),
(64, '2017-10-27', '17:00:00', 'Sala 2', 55, 5),
(65, '2017-10-27', '16:00:00', 'Sala 2', 60, 2),
(66, '2017-10-27', '17:15:00', 'Sala 2', 55, 8),
(67, '2017-10-27', '13:30:00', 'Sala 2', 60, 7),
(68, '2017-10-27', '18:00:00', 'Sala 2', 60, 7),
(69, '2017-10-27', '21:30:00', 'Sala 2', 60, 7),
(70, '2017-10-27', '16:00:00', 'Sala 3', 55, 5),
(71, '2017-10-27', '22:00:00', 'Sala 3', 60, 2),
(72, '2017-10-27', '17:15:00', 'Sala 3', 55, 8),
(73, '2017-10-27', '14:00:00', 'Sala 3', 60, 7),
(74, '2017-10-27', '22:00:00', 'Sala 3', 60, 7),
(75, '2017-10-28', '22:15:00', 'Premium', 55, 5),
(76, '2017-10-28', '14:30:00', 'Premium', 60, 7),
(77, '2017-10-28', '17:00:00', 'Premium', 60, 7),
(78, '2017-10-28', '11:00:00', 'Premium', 55, 8),
(79, '2017-10-28', '14:30:00', 'Sala 1', 60, 7),
(80, '2017-10-28', '21:30:00', 'Sala 1', 60, 7),
(81, '2017-10-28', '15:30:00', 'Sala 1', 55, 8),
(82, '2017-10-28', '15:30:00', 'Sala 2', 55, 5),
(83, '2017-10-28', '21:30:00', 'Sala 2', 60, 7),
(84, '2017-10-28', '11:00:00', 'Sala 2', 55, 8),
(85, '2017-10-28', '17:55:00', 'Sala 2', 55, 8),
(86, '2017-10-28', '16:40:00', 'Sala 3', 55, 5),
(87, '2017-10-28', '14:30:00', 'Sala 3', 60, 7),
(88, '2017-10-28', '17:00:00', 'Sala 3', 60, 7),
(89, '2017-10-28', '21:30:00', 'Sala 3', 60, 7),
(90, '2017-10-28', '11:00:00', 'Sala 3', 55, 8),
(91, '2017-10-28', '22:10:00', 'Sala 3', 55, 8),
(92, '2017-10-29', '13:30:00', 'Premium', 55, 8),
(93, '2017-10-29', '15:30:00', 'Premium', 55, 8),
(94, '2017-10-29', '17:30:00', 'Premium', 55, 8),
(95, '2017-10-29', '21:00:00', 'Premium', 55, 8),
(96, '2017-10-29', '17:00:00', 'Premium', 60, 7),
(97, '2017-10-29', '20:45:00', 'Premium', 60, 7),
(98, '2017-10-29', '16:15:00', 'Sala 1', 55, 8),
(99, '2017-10-29', '18:30:00', 'Sala 1', 55, 8),
(100, '2017-10-29', '21:30:00', 'Sala 1', 55, 8),
(101, '2017-10-29', '16:15:00', 'Sala 2', 60, 7),
(102, '2017-10-29', '20:15:00', 'Sala 2', 60, 7),
(103, '2017-10-29', '22:50:00', 'Sala 2', 60, 7),
(104, '2017-10-29', '14:40:00', 'Sala 3', 55, 8),
(105, '2017-10-29', '20:10:00', 'Sala 3', 55, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `detalle` text NOT NULL,
  `estatus` enum('Activa','Inactiva') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `fecha`, `detalle`, `estatus`) VALUES
(1, 'Bob Esponja: tercera pelicula y temporada 12', '2017-10-22', '<p><strong><span style=\"color: #ff0000;\">Nickelodeon y productor de SpongeBob Square Pants confirman temporada 12 de 52 episodios y tercera pel&iacute;cula pr&oacute;ximamente. </span></strong></p>\r\n<p><strong>&iexcl;Calamardo est&aacute; enojado!Bob Esponja: tercera pel&iacute;cula y temporada 12</strong></p>\r\n<p>Nickelodeon y productor de SpongeBob Square Pants confirman temporada 12 de 52 episodios y tercera pel&iacute;cula pr&oacute;ximamente. &iexcl;Calamardo est&aacute; enojado!.</p>\r\n<p>A lado de cierta Pi&ntilde;a (debajo del mar), Calamardo debe estar de muy mal humor, pues hay Bob Esponja para rato... &iexcl;y por partida doble!. Por un lado, Vincent Waller (The Ren &amp; Stimpy Show), artista, productor, escritor y supervisor creativo de SpongeBob Squarepants anunci&oacute; con un divertido dibujo desde su cuenta de Twitter que, antes de que se estrene siquiera la temporada 11 de la serie animada, se ha confirmado ya la n&uacute;mero 12, &iexcl;que constar&aacute; de 52 episodios (recuerden que cada emisi&oacute;n consta de 2 aventuras)!</p>', 'Activa'),
(2, 'Julia Roberts protagonizara. The Bookseller', '2017-10-23', '<p>La novela de Cynthia Swanson <span style=\"color: #0000ff;\"><strong>The Bookseller</strong></span> ser&aacute; llevada al cine con <span style=\"color: #0000ff;\">Julia Roberts (Los Pitufos: La aldea Escondida)</span> como protagonista.<br /><br />La historia est&aacute; ambientada en los sesenta y su protagonista es una mujer soltera, Kitty Miller, que lleva una librer&iacute;a. Sue&ntilde;a con una vida alternativa en la que ha encontrado el amor y est&aacute; casada y con hijos, pero la l&iacute;nea que separa realidad y ficci&oacute;n comienza a estar demasiado dispersa para que la distinga.<br /><br />Seg&uacute;n informa <span style=\"color: #ff0000;\"><strong>Moviehole</strong></span> Roberts tambi&eacute;n producir&aacute; la pel&iacute;cula junto a Lisa Gillan y Marisa Yeres Hill.</p>', 'Activa'),
(3, 'Rosamund Pike sera Marie Curie', '2017-05-17', '<p><strong>Rosamund Pike</strong> (<span style=\"color: #008000;\">Un Reino Unido</span>) dar&aacute; vida a la famosa cient&iacute;fica Marie Curie en la pel&iacute;cula de Studiocanal <strong>Radioactiv</strong>. Se trata de una adaptaci&oacute;n de la biograf&iacute;a escrita por Lauren Redniss, que se centra en el romance entre Marie y Pierre Curie y en el descubrimiento de la radiactividad.<br /><br />Seg&uacute;n informa <span style=\"color: #008000;\"><strong>Premiere</strong></span> el proceso de casting para los papeles de Pierre y de Paul Langevin, su joven amante, ya ha comenzado.<br /><br />Marjane Satrapi dirigir&aacute; a partir de un gui&oacute;n de Jack Thorne. Tim Bevan, Eric Fellner y Paul Webster producir&aacute;n la pel&iacute;cula.</p>', 'Inactiva'),
(4, 'Julianne Moore sera Gloria', '2017-10-25', '<p><strong><span style=\"color: #0000ff;\">Julianne Moore</span></strong> <span style=\"color: #808080;\">(Kingsman: El C&iacute;rculo de Oro)</span> protagonizar&aacute; el remake de FilmNation de la pel&iacute;cula chilena <em><strong>Gloria</strong></em>.<br /><br />Sebastian Lelio, director de la pel&iacute;cula original, escribir&aacute; el gui&oacute;n del remake, que todav&iacute;a no tiene t&iacute;tulo.<br /><br />Moore ser&aacute; Gloria, una mujer de 58 a&ntilde;os que est&aacute; sola en la vida. Para compensar el vac&iacute;o, llena sus d&iacute;as de actividades y por las noches busca el amor en el mundo de las fiestas para solteros adultos, donde solo consigue perderse en una serie de aventuras sin sentido. Esta fr&aacute;gil felicidad en la que vive se altera cuando conoce a Rodolfo, un hombre de 65 a&ntilde;os, recientemente separado, que se obsesiona con ella. Gloria comienza un romance, pero &eacute;ste se complica por la enfermiza dependencia de Rodolfo hacia sus hijos y su ex mujer. Esta relaci&oacute;n, a la que Gloria se entrega porque intuye que podr&iacute;a ser la &uacute;ltima, acabar&aacute; por hacerla estrellarse contra la cruel realidad del mundo. Gloria deber&aacute; reconstruirse para enfrentar con nuevas fuerzas su definitiva entrada a la vejez.<br /><br />Seg&uacute;n <span style=\"color: #008000;\"><strong>The Hollywood Reporter</strong> </span>Juan de Dios Larrain y Pablo Larrain producir&aacute;n la cinta, que comenzar&aacute; a rodarse a finales de mes.</p>', 'Activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
CREATE TABLE IF NOT EXISTS `peliculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `duracion` int(11) NOT NULL,
  `clasificacion` enum('A','B','C') NOT NULL,
  `genero` varchar(45) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `fechaEstreno` date NOT NULL,
  `estatus` enum('Activa','Inactiva') NOT NULL DEFAULT 'Activa',
  `idDetalle` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Peliculas_Detalles1_idx` (`idDetalle`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `duracion`, `clasificacion`, `genero`, `imagen`, `fechaEstreno`, `estatus`, `idDetalle`) VALUES
(1, 'Kong La Isla Calavera', 118, 'B', 'Accion y Aventura', 'kong.png', '2017-10-20', 'Activa', 1),
(2, 'Life: Vida Inteligente', 104, 'B', 'Drama', 'life.png', '2017-10-20', 'Activa', 2),
(3, 'La Bella y La Bestia', 132, 'A', 'Infantil', 'bella.png', '2017-10-20', 'Activa', 3),
(4, 'Contratiempo', 106, 'B', 'Thriller', 'contratiempo.png', '2017-10-22', 'Activa', 4),
(5, 'Power Rangers', 120, 'B', 'Aventura', 'power-rangers.png', '2017-10-22', 'Activa', 5),
(7, 'Rapidos y Furiosos 8', 136, 'B', 'Accion', 'rapidos-furiosos.png', '2017-10-24', 'Activa', 6),
(8, 'Guardianes de la Galaxia Vol 2', 136, 'B', 'Accion', 'guardianes-galaxia.png', '2017-10-24', 'Activa', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioperfil`
--

DROP TABLE IF EXISTS `usuarioperfil`;
CREATE TABLE IF NOT EXISTS `usuarioperfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(100) NOT NULL,
  `perfil` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Usuarios_Perfil1` (`cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarioperfil`
--

INSERT INTO `usuarioperfil` (`id`, `cuenta`, `perfil`) VALUES
(4, 'luis', 'EDITOR'),
(5, 'john', 'GERENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `cuenta` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`cuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `cuenta`, `pwd`, `telefono`, `activo`) VALUES
(4, NULL, 'luis@gmail.com', 'luis', '$2a$10$GoUzCDG6QMo9F331o/vCtu4gNYahBiBvCC/PcgRa3k4JgkwlVhTQW', '7826268', 1),
(5, NULL, 'john@gmail.com', 'john', '$2a$10$zuaB9QOzqlghbJKJjTLZkerQSKHwsEIHXgroq0D0wqtLsHgkFUXOi', '8645266', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `fk_Horarios_Peliculas1` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `fk_Peliculas_Detalles1` FOREIGN KEY (`idDetalle`) REFERENCES `detalles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarioperfil`
--
ALTER TABLE `usuarioperfil`
  ADD CONSTRAINT `fk_Usuarios_Perfil1` FOREIGN KEY (`cuenta`) REFERENCES `usuarios` (`cuenta`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
