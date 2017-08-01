-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2017 a las 22:00:50
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbpecosa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitro`
--

CREATE TABLE `arbitro` (
  `idArbitro` int(11) NOT NULL,
  `Partido` varchar(100) NOT NULL,
  `CodPersona` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

CREATE TABLE `cancha` (
  `idCancha` int(11) NOT NULL,
  `DireccionCancha` varchar(50) NOT NULL,
  `TelefonoCancha` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuentro_partido`
--

CREATE TABLE `encuentro_partido` (
  `idEncuentroPartido` int(11) NOT NULL,
  `FechaEncuentro` date NOT NULL,
  `CodCancha` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL,
  `NombreEquipo` varchar(50) NOT NULL,
  `CodEncuentroPartido` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `idJugador` int(11) NOT NULL,
  `Equipo` varchar(50) NOT NULL,
  `CodPersona` int(11) NOT NULL,
  `CodEquipo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Documento` varchar(50) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Clave` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idPersona`, `Nombres`, `Apellidos`, `Correo`, `Documento`, `Edad`, `Telefono`, `Direccion`, `Clave`) VALUES
(3, 'Juan Alberto ', 'Rodriguez ', 'juan@gmai.com', '222222222', 19, '5000000', 'calle 3 - carrera 5', '$2y$10$/rXfv5ewF90IbMeVGVd1vuOeLRPC5.Xe1Tcz6QyZEXyWJSKokuwTq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planillero`
--

CREATE TABLE `planillero` (
  `idPlanillero` int(11) NOT NULL,
  `CodPersona` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sysdiagrams`
--

CREATE TABLE `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `definition` longblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `idTorneo` int(11) NOT NULL,
  `CodCancha` int(11) NOT NULL,
  `CodEquipo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_goleadores`
--

CREATE TABLE `t_goleadores` (
  `Nombre` varchar(50) NOT NULL,
  `Equipo` varchar(50) NOT NULL,
  `Goles` int(11) NOT NULL,
  `CodPlanillero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_grupoa`
--

CREATE TABLE `t_grupoa` (
  `Equipo` varchar(50) NOT NULL,
  `CodTorneo` int(11) NOT NULL,
  `CodPlanillero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_grupob`
--

CREATE TABLE `t_grupob` (
  `Equipo` varchar(50) NOT NULL,
  `CodTorneo` int(11) NOT NULL,
  `CodPlanillero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_posiciones`
--

CREATE TABLE `t_posiciones` (
  `idT_Posiciones` int(11) NOT NULL,
  `Posicion` int(11) NOT NULL,
  `Equipo` varchar(50) NOT NULL,
  `Puntos` int(11) NOT NULL,
  `PartidosJugados` int(11) NOT NULL,
  `PartidosGanados` int(11) NOT NULL,
  `PartidosEmpatados` int(11) NOT NULL,
  `PartidosPerdidos` int(11) NOT NULL,
  `GolesAfavor` int(11) NOT NULL,
  `GolesEnContra` int(11) NOT NULL,
  `DiferenciaGoles` int(11) NOT NULL,
  `GolesFavorVisitante` int(11) NOT NULL,
  `GolesContraVisitante` int(11) NOT NULL,
  `CodPlanillero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_proximasfechas`
--

CREATE TABLE `t_proximasfechas` (
  `Fecha` date NOT NULL,
  `Lugar` varchar(50) NOT NULL,
  `CodPlanillero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_resultados`
--

CREATE TABLE `t_resultados` (
  `Equipo1` varchar(50) NOT NULL,
  `ResultadoEq1` varchar(50) NOT NULL,
  `VS` char(1) DEFAULT NULL,
  `ResultadoEq2` char(10) CHARACTER SET utf8mb4 NOT NULL,
  `Equipo2` varchar(50) NOT NULL,
  `CodPlanillero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_sancionados`
--

CREATE TABLE `t_sancionados` (
  `Nombre` varchar(50) NOT NULL,
  `Equipo` varchar(50) NOT NULL,
  `Fecha` date NOT NULL,
  `CodPlanillero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbitro`
--
ALTER TABLE `arbitro`
  ADD KEY `FK_Arbitro_Persona` (`CodPersona`);

--
-- Indices de la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD PRIMARY KEY (`idCancha`);

--
-- Indices de la tabla `encuentro_partido`
--
ALTER TABLE `encuentro_partido`
  ADD PRIMARY KEY (`idEncuentroPartido`),
  ADD KEY `FK_Encuentro_Partido_Cancha` (`CodCancha`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`idEquipo`),
  ADD KEY `FK_Equipo_Encuentro_Partido` (`CodEncuentroPartido`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`idJugador`),
  ADD KEY `FK_Jugador_Persona` (`CodPersona`),
  ADD KEY `FK_Jugador_Equipo` (`CodEquipo`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indices de la tabla `planillero`
--
ALTER TABLE `planillero`
  ADD PRIMARY KEY (`idPlanillero`),
  ADD KEY `FK_Planillero_Persona` (`CodPersona`);

--
-- Indices de la tabla `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  ADD PRIMARY KEY (`diagram_id`),
  ADD UNIQUE KEY `UK_principal_name` (`principal_id`,`name`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`idTorneo`),
  ADD KEY `FK_Torneo_Cancha` (`CodCancha`),
  ADD KEY `FK_Torneo_Equipo` (`CodEquipo`);

--
-- Indices de la tabla `t_goleadores`
--
ALTER TABLE `t_goleadores`
  ADD KEY `FK_T_Goleadores_Planillero` (`CodPlanillero`);

--
-- Indices de la tabla `t_grupoa`
--
ALTER TABLE `t_grupoa`
  ADD KEY `FK_T_GrupoA_Planillero` (`CodPlanillero`);

--
-- Indices de la tabla `t_grupob`
--
ALTER TABLE `t_grupob`
  ADD KEY `FK_T_GrupoB_Planillero` (`CodPlanillero`);

--
-- Indices de la tabla `t_posiciones`
--
ALTER TABLE `t_posiciones`
  ADD KEY `FK_T_Posiciones_Planillero` (`CodPlanillero`);

--
-- Indices de la tabla `t_proximasfechas`
--
ALTER TABLE `t_proximasfechas`
  ADD KEY `FK_T_ProximasFechas_Planillero` (`CodPlanillero`);

--
-- Indices de la tabla `t_resultados`
--
ALTER TABLE `t_resultados`
  ADD KEY `FK_T_Resultados_Planillero` (`CodPlanillero`);

--
-- Indices de la tabla `t_sancionados`
--
ALTER TABLE `t_sancionados`
  ADD KEY `FK_T_Sancionados_Planillero` (`CodPlanillero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `encuentro_partido`
--
ALTER TABLE `encuentro_partido`
  MODIFY `idEncuentroPartido` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `idEquipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `idJugador` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `planillero`
--
ALTER TABLE `planillero`
  MODIFY `idPlanillero` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sysdiagrams`
--
ALTER TABLE `sysdiagrams`
  MODIFY `diagram_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `idTorneo` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
