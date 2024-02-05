-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 08:59:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdutphone`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SPdetalle` (IN `coda` INT, IN `can` INT)   BEGIN
declare venta INT;
select ifnull(max(id_venta),0)  from ventas into venta;
insert into detalle_venta (id_venta,id_producto,cantidad) values (venta, coda, can);
update productos set stock= stock -can where id_producto=coda;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SPFACTURA` (IN `codc` VARCHAR(11))   BEGIN
insert into ventas (id_cliente, estado, metodo_pago) values (codc,'Completado','Tienda Virtual');
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_usuario` varchar(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_usuario`, `nombre`, `correo`, `telefono`) VALUES
('Crl88', 'Carlos Gutierrez García', 'cg341@hotmail.com', '987654321'),
('hl403', 'Alex Flores', 'hl403@hotmail.com', '984197761'),
('SldGrl88', 'Wendi Casas', 'wc214@hotmail.com', '951753258');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_cate` int(11) NOT NULL,
  `nombre_cate` varchar(60) NOT NULL,
  `imagen` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_cate`, `nombre_cate`, `imagen`) VALUES
(1, 'Telefonos moviles', 'Imagenes/2.jpeg'),
(2, 'Adaptadores', 'Imagenes/adaptadores.jpg'),
(3, 'Accesorios', 'Imagenes/accesorios.jpeg'),
(4, 'Tabletas', 'Imagenes/tabletas.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` varchar(11) NOT NULL,
  `ap_pate` varchar(25) DEFAULT NULL,
  `ap_mate` varchar(25) DEFAULT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `tipo_docu` int(1) DEFAULT NULL,
  `num_docu` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `ap_pate`, `ap_mate`, `nombres`, `correo`, `telefono`, `tipo_docu`, `num_docu`) VALUES
('C0001', 'Lopez', 'Garcia', 'Maria', 'maria@email.com', '987654321', 1, '123456789'),
('C0002', 'Gomez', 'Perez', 'Juan', 'juan@email.com', '999888777', 2, '987654321'),
('C0003', 'Ramirez', 'Diaz', 'Luis', 'luis@email.com', '555444333', 1, '555555555'),
('C0004', 'Fernandez', 'Paredes', 'Ana', 'ana@email.com', '222111000', 2, '111122222'),
('C0005', 'Vargas', 'Lopez', 'Pedro', 'pedro@email.com', '777888999', 1, '333344444'),
('C0006', 'Torres', 'Jimenez', 'Sofia', 'sofia@email.com', '333444555', 2, '999999999'),
('C0007', 'Rodriguez', 'Silva', 'Carlos', 'carlos@email.com', '123456789', 1, '888877777'),
('C0008', 'Gonzalez', 'Rios', 'Laura', 'laura@email.com', '666777888', 2, '444433333'),
('C0009', 'Martinez', 'Santos', 'David', 'david@email.com', '987654321', 1, '222211111'),
('C0010', 'Sanchez', 'Ortiz', 'Elena', 'elena@email.com', '999888777', 2, '666666666'),
('C0011', 'Luna', 'Castillo', 'Diego', 'diego@email.com', '555444333', 1, '777777777'),
('C0012', 'Morales', 'Ferrer', 'Isabel', 'isabel@email.com', '222111000', 2, '999988888'),
('C0013', 'Perez', 'Herrera', 'Javier', 'javier@email.com', '777888999', 1, '444499999'),
('C0014', 'Diaz', 'Vega', 'Lorena', 'lorena@email.com', '333444555', 2, '111144444'),
('C0015', 'Castro', 'Gutierrez', 'Raul', 'raul@email.com', '123456789', 1, '333322222'),
('Cl607', 'Quispe', 'Cruz', 'Cecilia', 'ce239@hotmail.com', '965741283', 1, '87654021'),
('Mar789', 'García', 'Miranda', 'María', 'mr504@hotmail.com', '986532147', 1, '84562379'),
('tst808', 'Flores', 'Cruz', 'CÃ©sar Alexander', 'hl403@hotmail.com', '984197761', 1, '71469902');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_operacion` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descuento` decimal(7,2) DEFAULT NULL,
  `fecha_operacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_operacion`, `id_venta`, `id_producto`, `cantidad`, `descuento`, `fecha_operacion`) VALUES
(1, 1, 17, 2, 0.00, '2022-10-14 15:45:27'),
(2, 2, 18, 1, 0.00, '2022-10-21 15:46:07'),
(3, 3, 14, 1, 10.00, '2023-03-14 15:46:34'),
(4, 4, 15, 1, 15.00, '2023-01-24 15:46:57'),
(5, 5, 17, 10, 0.25, '2021-11-09 02:49:05'),
(6, 6, 15, 5, 0.10, '2021-12-29 02:50:00'),
(7, 7, 14, 3, 0.35, '2022-03-10 02:51:37'),
(8, 8, 18, 25, 0.30, '2022-06-16 02:52:02'),
(9, 9, 18, 8, 0.15, '2022-07-13 02:52:27'),
(10, 10, 1, 2, NULL, '2023-12-04 00:57:39'),
(11, 10, 6, 1, NULL, '2023-12-04 00:57:39'),
(12, 11, 1, 1, NULL, '2023-12-04 01:09:49'),
(13, 11, 16, 2, NULL, '2023-12-04 01:09:49'),
(14, 12, 1, 1, NULL, '2023-12-04 01:58:49'),
(15, 12, 17, 2, NULL, '2023-12-04 01:58:49'),
(16, 13, 1, 2, NULL, '2023-12-04 02:00:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` varchar(11) NOT NULL,
  `id_local` varchar(11) NOT NULL,
  `ap_pate` varchar(25) DEFAULT NULL,
  `ap_mate` varchar(25) DEFAULT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `tipo_docu` int(1) DEFAULT NULL,
  `num_docu` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `id_local`, `ap_pate`, `ap_mate`, `nombres`, `correo`, `tipo_docu`, `num_docu`) VALUES
('Crl88', 'L00004', 'Gutierrez', 'García', 'Carlos Manuel', 'cg341@hotmail.com     ', 1, '84512367'),
('hlemp88', 'L00001', 'Flores', 'Cruz', 'César Alexander', 'hl403@hotmail.com', 1, '71469902'),
('wdemp85', 'L00001', 'Casas', 'Galindo', 'Wendi Casas', 'wc214@hotmail.com', 1, '951753258');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local_atencion`
--

CREATE TABLE `local_atencion` (
  `id_local` varchar(11) NOT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `telefono` int(9) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `local_atencion`
--

INSERT INTO `local_atencion` (`id_local`, `ciudad`, `telefono`, `direccion`, `departamento`) VALUES
('L00001', 'Lima', 987654321, 'Jirón de la Unión 606', 'Lima'),
('L00002', 'San Isidro', 4518933, 'Calle Los Pinos, 490', 'Lima'),
('L00003', 'Lima', 154790, 'Av. Tacna Nro. 533', 'Lima'),
('L00004', 'Huancayo', 1200547, 'Av. Giráldez N°644', 'Junín'),
('L00005', 'Tacna', 546789, 'Av. Circunvalación 578', 'Tacna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `precio_uni` decimal(7,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_cate` int(11) NOT NULL,
  `imagen` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio_uni`, `stock`, `id_cate`, `imagen`) VALUES
(1, 'Samsung Galaxy S21', 'El Samsung Galaxy S21 es un teléfono inteligente Android de alta gama con una pantalla brillante y una cámara de primera calidad.', 799.99, 94, 1, 'Imagenes/s21.jpg'),
(2, 'iPhone 13 Pro', 'El iPhone 13 Pro de Apple es el último buque insignia con un potente chip A15 Bionic y una excelente cámara Pro.', 999.99, 75, 1, 'Imagenes/2.jpeg'),
(3, 'Google Pixel 6', 'El Google Pixel 6 es conocido por su calidad de cámara excepcional y una experiencia de Android pura.', 699.99, 50, 1, 'Imagenes/3.jpeg'),
(4, 'OnePlus 9', 'El OnePlus 9 es un teléfono Android potente con una pantalla suave y una carga rápida.', 649.99, 60, 1, 'Imagenes/4.jpeg'),
(5, 'Xiaomi Redmi Note 10', 'El Xiaomi Redmi Note 10 es un teléfono económico con una gran pantalla y una duración de batería impresionante.', 249.99, 120, 1, 'Imagenes/1.jpeg'),
(6, 'Samsung Galaxy Tab S7', 'La Samsung Galaxy Tab S7 es una tableta Android de alta gama con una pantalla AMOLED y potencia de procesamiento.', 499.99, 29, 2, 'Imagenes/5.jpeg'),
(7, 'iPad Air 4', 'El iPad Air 4 de Apple combina rendimiento y portabilidad con su chip A14 y diseño delgado.', 599.99, 40, 2, 'Imagenes/20.jpg'),
(8, 'Amazon Echo Dot', 'El Amazon Echo Dot es un altavoz inteligente con Alexa que ofrece control de voz y música en streaming.', 49.99, 150, 3, 'Imagenes/21.jpg'),
(9, 'JBL Charge 4', 'El JBL Charge 4 es un altavoz Bluetooth portátil con una batería de larga duración y sonido potente.', 119.99, 80, 3, 'Imagenes/23.jpg'),
(14, 'Apple iPhone 14 PRO', 'El iPhone 14 Pro es la versión “profesional” del iPhone 14, ¡y ahora puedes comprarlo al mejor precio! Este móvil te ofrece varias características técnicas destacables entre los celulares Apple.', 4099.00, 10, 1, 'Imagenes/26.jpg'),
(15, 'Galaxy S22 Ultra', 'El Samsung Galaxy S22 Ultra con capacidad 5G es la mayor propuesta de los celulares Samsung para este 2022.', 4199.00, 10, 1, 'Imagenes/7.jpeg'),
(16, 'EarPods con conector Apple', 'Los EarPods Lightning de Apple son audifonos con conector lightning que destacan por su calidad de reproducción del audio.', 95.00, 23, 3, ''),
(17, 'Adaptador de corriente USB - C DE 20W Apple', 'El adaptador de pared de Apple tiene potencia para alcanzar una conexión de 20W de carga, lo cual permitirá a tus dispositivos Iphone cargar de una forma muy rápida. Totalmente compatible con cable de carga USB tipo C (se vende por separado).', 89.00, 13, 2, 'Imagenes/25.jpg'),
(18, 'Adaptador I2Go 20W Usb-C Bl', 'El nuevo cargador es compatible con dispositivos PD hasta 20W.', 50.00, 20, 2, 'Imagenes/28.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` varchar(11) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `tipo` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `pass`, `tipo`) VALUES
('C0001', 'Maria123', 3),
('C0002', 'Juan123', 3),
('C0003', 'Luis123', 3),
('C0004', 'Ana123', 3),
('C0005', 'Pedro123', 3),
('C0006', 'Sofia123', 3),
('C0007', 'Carlos123', 3),
('C0008', 'Laura123', 3),
('C0009', 'David123', 3),
('C0010', 'Elena123', 3),
('C0011', 'Diego123', 3),
('C0012', 'Isabel123', 3),
('C0013', 'Javier123', 3),
('C0014', 'Lorena123', 3),
('C0015', 'Raul123', 3),
('Cl607', 'cll21*', 3),
('Crl88', 'test1234*', 1),
('hl403', 'hl403*', 1),
('hlemp88', 'testemp8', 2),
('Mar789', 'mr789*', 3),
('SldGrl88', 'LstHp*', 1),
('tst808', 'test8', 3),
('wdemp85', 'wc85*', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_empleado` varchar(11) DEFAULT NULL,
  `id_local` varchar(11) DEFAULT NULL,
  `id_cliente` varchar(11) NOT NULL,
  `estado` varchar(60) DEFAULT NULL,
  `metodo_pago` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_empleado`, `id_local`, `id_cliente`, `estado`, `metodo_pago`) VALUES
(1, 'hlemp88', 'L00001', 'Mar789', 'Completado', 'Efectivo'),
(2, 'hlemp88', 'L00001', 'Mar789', 'Completado', 'Efectivo'),
(3, 'wdemp85', 'L00001', 'Cl607', 'Completado', 'Efectivo'),
(4, 'wdemp85', 'L00001', 'Mar789', 'Completado', 'Tarjeta'),
(5, 'hlemp88', 'L00001', 'C0002', 'Completado', 'Efectivo'),
(6, 'Crl88', 'L00004', 'C0005', 'Completado', 'Tarjeta'),
(7, 'wdemp85', 'L00001', 'C0012', 'Completado', 'Efectivo'),
(8, 'Crl88', 'L00004', 'C0008', 'Completado', 'Efectivo'),
(9, 'wdemp85', 'L00001', 'C0012', 'Completado', 'Tarjeta'),
(10, NULL, NULL, 'tst808', 'Completado', 'Tienda Virtual'),
(11, NULL, NULL, 'tst808', 'Completado', 'Tienda Virtual'),
(12, NULL, NULL, 'C0010', 'Completado', 'Tienda Virtual'),
(13, NULL, NULL, 'C0010', 'Completado', 'Tienda Virtual');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_cate`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_operacion`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `empleados_ibfk_1` (`id_local`);

--
-- Indices de la tabla `local_atencion`
--
ALTER TABLE `local_atencion`
  ADD PRIMARY KEY (`id_local`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_cate` (`id_cate`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `ventas_ibfk_1` (`id_empleado`),
  ADD KEY `ventas_ibfk_2` (`id_cliente`),
  ADD KEY `ventas_ibfk_3` (`id_local`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_operacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_local`) REFERENCES `local_atencion` (`id_local`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_cate`) REFERENCES `categoria` (`id_cate`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_local`) REFERENCES `local_atencion` (`id_local`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
