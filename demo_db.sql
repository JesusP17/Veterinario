-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2026 a las 01:05:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `demo_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_items`
--

CREATE TABLE `carrito_items` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` bigint(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `hora` time(6) NOT NULL,
  `motivo` varchar(500) DEFAULT NULL,
  `servicio` varchar(100) NOT NULL,
  `mascota_id` bigint(20) NOT NULL,
  `servicio_id` bigint(20) DEFAULT NULL,
  `veterinario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `estado`, `fecha`, `fecha_registro`, `hora`, `motivo`, `servicio`, `mascota_id`, `servicio_id`, `veterinario_id`) VALUES
(1, 'CONFIRMADA', '2026-09-19', '2026-09-18 22:36:13.000000', '10:00:00.000000', 'Control médico de rutina y chequeo dermatológico', 'Consulta General', 1, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas_medicas`
--

CREATE TABLE `consultas_medicas` (
  `id` bigint(20) NOT NULL,
  `diagnostico` varchar(800) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `medicamentos` varchar(800) DEFAULT NULL,
  `motivo` varchar(200) NOT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `peso` double NOT NULL,
  `recomendaciones` varchar(500) DEFAULT NULL,
  `sintomas` varchar(500) DEFAULT NULL,
  `temperatura` varchar(20) DEFAULT NULL,
  `tratamiento` varchar(1000) NOT NULL,
  `cita_id` bigint(20) DEFAULT NULL,
  `historia_clinica_id` bigint(20) NOT NULL,
  `veterinario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas_medicas`
--

INSERT INTO `consultas_medicas` (`id`, `diagnostico`, `fecha`, `hora`, `medicamentos`, `motivo`, `observaciones`, `peso`, `recomendaciones`, `sintomas`, `temperatura`, `tratamiento`, `cita_id`, `historia_clinica_id`, `veterinario_id`) VALUES
(1, 'Paciente canino clínicamente sano. Esquema de inmunización al día.', '2026-08-18', '09:30:00.000000', 'Simparica Trio 20-40kg (1 comprimido masticable mensual)', 'Vacunación anual y desparasitación', NULL, 28, 'Mantener hidratación adecuada y evitar ejercicio intenso por 24 horas posteriores a la vacuna.', 'Paciente activo y alerta. Mucosas rosadas. Sin vómitos ni diarrea.', NULL, 'Aplicación de vacuna séxtuple canina y refuerzo antirrábico.', NULL, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` double NOT NULL,
  `subtotal` double NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id` bigint(20) NOT NULL,
  `alergias` varchar(250) DEFAULT NULL,
  `antecedentes` varchar(500) DEFAULT NULL,
  `fecha_apertura` date DEFAULT NULL,
  `numero_expediente` varchar(50) NOT NULL,
  `vacunas_al_dia` bit(1) DEFAULT NULL,
  `mascota_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historias_clinicas`
--

INSERT INTO `historias_clinicas` (`id`, `alergias`, `antecedentes`, `fecha_apertura`, `numero_expediente`, `vacunas_al_dia`, `mascota_id`) VALUES
(1, 'Ninguna', 'Esterilizado en 2023. Sin alergias previas.', '2026-09-18', 'HC-0001-2026', b'1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` bigint(20) NOT NULL,
  `especie` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `peso` double NOT NULL,
  `raza` varchar(100) DEFAULT NULL,
  `sexo` varchar(10) NOT NULL,
  `propietario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `especie`, `fecha_nacimiento`, `nombre`, `peso`, `raza`, `sexo`, `propietario_id`) VALUES
(1, 'Perro', '2022-05-10', 'Toby', 28.5, 'Golden Retriever', 'MACHO', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) NOT NULL,
  `declaracion_formula_vigente` tinyint(1) NOT NULL DEFAULT 0,
  `direccion_entrega` varchar(250) DEFAULT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha_pedido` datetime(6) NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `telefono_contacto` varchar(30) DEFAULT NULL,
  `total` double NOT NULL,
  `cliente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `categoria` varchar(60) NOT NULL,
  `descripcion` varchar(600) DEFAULT NULL,
  `imagen_url` varchar(500) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `precio` double NOT NULL,
  `requiere_prescripcion` bit(1) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `activo`, `categoria`, `descripcion`, `imagen_url`, `nombre`, `precio`, `requiere_prescripcion`, `stock`) VALUES
(1, b'1', 'Alimentos', 'Nutrición clínica balanceada para caninos adultos con antioxidantes y proteínas de alta digestibilidad.', 'https://images.unsplash.com/photo-1589924691995-400dc9ecc119?w=500&fit=crop', 'Alimento Hill\'s Science Diet Adulto 15kg', 265000, b'0', 20),
(2, b'1', 'Antiparasitarios', 'Antiparasitario oral de triple acción mensual: pulgas, garrapatas y parásitos internos.', 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=500&fit=crop', 'Simparica Trio 20-40kg (3 Tabletas)', 115000, b'0', 35),
(3, b'1', 'Farmacia', 'Antibiótico de amplio espectro para infecciones respiratorias, dérmicas y dentales. Uso controlado.', 'https://images.unsplash.com/photo-1471864190281-a93a3070b6de?w=500&fit=crop', 'Amoxicilina + Ácido Clavulánico 250mg', 48000, b'1', 15),
(4, b'1', 'Farmacia', 'Antiinflamatorio no esteroideo y analgésico post-quirúrgico o para osteoartritis.', 'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?w=500&fit=crop', 'Meloxicam Gotas 0.5% (15ml)', 32000, b'1', 25),
(5, b'1', 'Higiene', 'Shampoo antiséptico y fungicida para el tratamiento de piodermas e infecciones cutáneas.', 'https://images.unsplash.com/photo-1583947215259-38e31be8751f?w=500&fit=crop', 'Shampoo Dermatológico Clorhexidina 3%', 38000, b'0', 40),
(6, b'1', 'Accesorios', 'Cono protector ajustable para recuperación post-operatoria y prevención de lamido.', 'https://images.unsplash.com/photo-1601758228041-f3b2795255f1?w=500&fit=crop', 'Collar Isabelino Protector Talla L', 24000, b'0', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` bigint(20) NOT NULL,
  `activo` bit(1) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `duracion_minutos` int(11) DEFAULT NULL,
  `icono` varchar(50) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `activo`, `categoria`, `descripcion`, `duracion_minutos`, `icono`, `nombre`, `precio`) VALUES
(1, b'1', 'Consulta', 'Revisiones completas de salud, diagnóstico preciso y seguimiento personalizado para tu mascota.', 30, '🩺', 'Consulta General', 45000),
(2, b'1', 'Diagnóstico', 'Ecografías, radiografías digitales y tomografías para un diagnóstico temprano y preciso.', 45, '🔬', 'Diagnóstico por Imagen', 95000),
(3, b'1', 'Prevención', 'Planes de vacunación completos y personalizados según la especie, raza y estilo de vida.', 20, '💉', 'Vacunación y Desparasitación', 35000),
(4, b'1', 'Cirugía', 'Procedimientos quirúrgicos de alta complejidad con equipamiento moderno y anestesia segura.', 90, '🏥', 'Cirugía Especializada', 250000),
(5, b'1', 'Urgencia', 'Atención médica prioritaria e inmediata para situaciones críticas las 24 horas.', 60, '🚨', 'Atención de Urgencia', 80000),
(6, b'1', 'Estética', 'Baños medicados, cortes de pelo según raza, limpieza dental y tratamientos de bienestar integral.', 60, '✂️', 'Estética y Spa', 40000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `direccion`, `email`, `fecha_registro`, `nombre`, `password`, `rol`, `telefono`) VALUES
(1, 'Sede Central Canopolis', 'admin@canopolis.com', '2026-09-18 22:36:13.000000', 'Administrador Canopolis', 'admin123', 'ADMINISTRADOR', '3001234567'),
(2, 'Consultorio 1 - Canopolis', 'dr.garcia@canopolis.com', '2026-09-18 22:36:13.000000', 'Dr. David García', 'vet123', 'VETERINARIO', '3109876543'),
(3, 'Calle 10 # 45-20', 'cliente@canopolis.com', '2026-09-18 22:36:13.000000', 'Camila Restrepo', 'cliente123', 'CLIENTE', '3205554321');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito_items`
--
ALTER TABLE `carrito_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd4h9in1el06nggdis696q8ope` (`cliente_id`),
  ADD KEY `FKfaxp2h71mb51yhv0atg107irl` (`producto_id`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmoh4y7wq0bqnr9hf70j2m8hjk` (`mascota_id`),
  ADD KEY `FKl89m4psdo9tdi6smrdq3n3p33` (`servicio_id`),
  ADD KEY `FKdl5kdl215xbn4q0w55ndq09sm` (`veterinario_id`);

--
-- Indices de la tabla `consultas_medicas`
--
ALTER TABLE `consultas_medicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK44evu79cuj8g4dii7xw3agtps` (`cita_id`),
  ADD KEY `FKtheln5iwd82md2up4xye42pom` (`historia_clinica_id`),
  ADD KEY `FKqw2xtsr2i8pqicg9h4yhq869n` (`veterinario_id`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4qmqlxyy78kjl4ec4wjnfmggu` (`pedido_id`),
  ADD KEY `FK8144uqs26ce7usdnqb1aml16` (`producto_id`);

--
-- Indices de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK9btc5h52b46en4s8hpow9iktc` (`numero_expediente`),
  ADD UNIQUE KEY `UKdk40ttn4mh1qapsh71qn84kpb` (`mascota_id`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKadvbg4dgphme4vaxwcqfif3kp` (`propietario_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6dtctern9votxnaydg7g2uifb` (`cliente_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKkfsp0s1tflm1cwlj8idhqsad0` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito_items`
--
ALTER TABLE `carrito_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consultas_medicas`
--
ALTER TABLE `consultas_medicas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_items`
--
ALTER TABLE `carrito_items`
  ADD CONSTRAINT `FKd4h9in1el06nggdis696q8ope` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `FKfaxp2h71mb51yhv0atg107irl` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `FKdl5kdl215xbn4q0w55ndq09sm` FOREIGN KEY (`veterinario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `FKl89m4psdo9tdi6smrdq3n3p33` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`),
  ADD CONSTRAINT `FKmoh4y7wq0bqnr9hf70j2m8hjk` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`);

--
-- Filtros para la tabla `consultas_medicas`
--
ALTER TABLE `consultas_medicas`
  ADD CONSTRAINT `FK44evu79cuj8g4dii7xw3agtps` FOREIGN KEY (`cita_id`) REFERENCES `citas` (`id`),
  ADD CONSTRAINT `FKqw2xtsr2i8pqicg9h4yhq869n` FOREIGN KEY (`veterinario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `FKtheln5iwd82md2up4xye42pom` FOREIGN KEY (`historia_clinica_id`) REFERENCES `historias_clinicas` (`id`);

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `FK4qmqlxyy78kjl4ec4wjnfmggu` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `FK8144uqs26ce7usdnqb1aml16` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD CONSTRAINT `FK8yol9pyaxtot72gpenq9ue2tf` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `FKadvbg4dgphme4vaxwcqfif3kp` FOREIGN KEY (`propietario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK6dtctern9votxnaydg7g2uifb` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
