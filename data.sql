-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2017 a las 13:23:25
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `feedback_tucourier`
--

--
-- Truncar tablas antes de insertar `airway_bill`
--

TRUNCATE TABLE `airway_bill`;
--
-- Volcado de datos para la tabla `airway_bill`
--

INSERT INTO `airway_bill` (`airwayId`, `ventaId`, `number`, `quantity`, `weight`, `price`, `deleted`, `state`) VALUES
(1, 1, 1, 5, 2.3, 2555.97, 0, 0),
(2, 1, 2, 5, 1.6, 806.96, 0, 0),
(3, 1, 3, 6, 1.8, 813.95, 0, 0);

--
-- Truncar tablas antes de insertar `airway_bill_product`
--

TRUNCATE TABLE `airway_bill_product`;
--
-- Volcado de datos para la tabla `airway_bill_product`
--

INSERT INTO `airway_bill_product` (`awb_productId`, `product_id`, `airwayId`, `category_id`, `name`, `price`, `quantity`, `total_price`, `real_weight`, `total_weight`, `userId`, `deleted`) VALUES
(1, 1, 1, 2, 'Macbook Pro', 2500, 1, 2500, 1.2, 1.2, 1, 0),
(2, 3, 1, 1, 'Remera', 6.99, 3, 34.95, 0.2, 1, 1, 0),
(3, 4, 1, 1, 'Jean', 35, 1, 105, 0.5, 1.5, 1, 0),
(4, 2, 2, 2, 'Iphone 6 plus', 750.99, 1, 1501.98, 0.5, 1, 1, 0),
(5, 3, 2, 1, 'Remera', 6.99, 3, 34.95, 0.2, 1, 1, 0),
(6, 4, 2, 1, 'Jean', 35, 1, 105, 0.5, 1.5, 1, 0),
(7, 2, 3, 2, 'Iphone 6 plus', 750.99, 1, 1501.98, 0.5, 1, 1, 0),
(8, 3, 3, 1, 'Remera', 6.99, 4, 34.95, 0.2, 1, 1, 0),
(9, 4, 3, 1, 'Jean', 35, 1, 105, 0.5, 1.5, 1, 0);

--
-- Truncar tablas antes de insertar `bills`
--

TRUNCATE TABLE `bills`;
--
-- Volcado de datos para la tabla `bills`
--

INSERT INTO `bills` (`bill_id`, `ventaId`, `establishment`, `number`, `provider`, `quantity`, `remaining_quantity`, `timestamp`, `totalprice`, `totalweight`, `trackingnumber`, `deleted`, `userId`, `bill_file_name`, `bill_file_path`) VALUES
(1, 1, 'Apple Store', '0001', 'DHL', 3, 0, '2017-01-22 20:59:54', 4001.98, 2, '0001', 0, 1, 'QATEST.pdf', '/dist/files/1484523667594/9f3d091dddbb30a0127936643ea2591a570574e9ea758e1d1bbbb0c3f0dda570.pdf'),
(2, 1, 'H&M', '0002', 'DHL', 13, 0, '2017-01-22 20:59:54', 139.95, 2.5, '0002', 0, 1, 'QATEST.pdf', '/dist/files/1484523667595/2595ca3d467b0ae1e8d4beae212e600c46d18c8a97fda3c832d20579f2292c21.pdf');

--
-- Truncar tablas antes de insertar `categories`
--

TRUNCATE TABLE `categories`;
--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `deleted`) VALUES
(1, 'indumentaria', 0),
(2, 'Electrónica', 0),
(3, 'Electroblancos', 0);

--
-- Truncar tablas antes de insertar `products`
--

TRUNCATE TABLE `products`;
--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `bill_id`, `category_id`, `name`, `price`, `quantity`, `remaining_quantity`, `totalprice`, `totalweight`, `weight`, `real_weight`, `userId`, `deleted`) VALUES
(1, 1, 2, 'Macbook Pro', 2500, 1, 0, 2500, 1.2, 1.2, 1.2, 1, 0),
(2, 1, 2, 'Iphone 6 plus', 750.99, 2, 0, 1501.98, 1, 0.5, 0.5, 1, 0),
(3, 2, 1, 'Remera', 6.99, 10, 0, 34.95, 1, 0.2, 0.2, 1, 0),
(4, 2, 1, 'Jean', 35, 3, 0, 105, 1.5, 0.5, 0.5, 1, 0);

--
-- Truncar tablas antes de insertar `users`
--

TRUNCATE TABLE `users`;
--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `company_name`, `company_real_name`, `warehouse_name`, `tel`, `cel`, `email`, `password`, `sskey`, `codeType`, `idCode`, `deleted`, `address`, `localidad`, `postalcode`, `registerToken`, `registertimestamp`, `isAdmin`, `isPremium`, `client_type`) VALUES
(1, 'Nicolass', 'Sigal', NULL, NULL, NULL, '12345', 12345, 'nico', '410ec15153a6dff0bed851467309bcbd', '5b651ede4e29b55994f8dd05bde76c71', 1, '00000001', 0, 'tabanera 33853', 'mendozaa', '55000', '0d75211910d3131a7d2472c4c41cead1', 1475968389, 0, 1, 0),
(2, 'Santiago', 'Lloret', NULL, NULL, NULL, '1234', 0, 'santi', '21232f297a57a5a743894a0e4a801fc3', 'c2938258c8d5ed7e5d8587fcb4b4ef7f', 1, '12345678', 0, 'tabanera 3385', 'mendoza', '5500', '308192ed9a7cf69af0c004179844ace7', 1475968761, 1, 0, 0),
(3, 'Roberto', 'Gomez', NULL, NULL, NULL, '4998877', 153997755, 'dix.inferno@gmail.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 2, '7895761231', 0, 'cadetes chilenos 173', 'mendoza', '5500', 'c417aee12cc67a34d94aabdfd93377b4', 1477164242, 0, 0, 0),
(7, '', '', 'pepe', 'pepe s.a.', NULL, '1231231', 12312312, 'pepe@pepetransf.com.ar', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, '12312312312', 0, 'asdds 123123', 'mendoza', '5500', '4574ae68157b6fd29a41000e75343e16', 1480195796, 0, 0, 1),
(8, 'part', 'part', '', '', NULL, '123123', 123123123, 'part@part.com', 'c30cc3ceb47f9c2a6217e6b731d27293', NULL, 2, '123123123123123', 0, 'part 1231', 'part', '5500', 'aa586af0a185a06981497e4a186aff9d', 1480196869, 0, 0, 0),
(9, '', '', 'empr', 'empr', NULL, '123123123', 123123123, 'empr@empr.com.ar', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, '123', 0, 'empr 12312', 'empr', '5500', '9e697d04d234dfe09ebf4e796ed6ee5d', 1480197163, 0, 0, 1),
(10, '', '', NULL, NULL, 'warehouseName', '123123', 123123123, 'warehouse', '21232f297a57a5a743894a0e4a801fc3', NULL, 1, '271231231239', 0, 'direccion 123', 'localidad', '5500', '', 0, 0, 0, 2),
(11, '', '', '', '', 'warehouse24', '121234', 1231234, 'warehouse2@wh.com', '1fccb567a44880e8665b7cb9d0f97271', NULL, 1, '001001', 0, 'warehouse2 123', 'warehouse2', '5500', 'e4089965145a467a30a1ee10549a0697', 1480370689, 0, 0, 2),
(12, '', '', '', '', 'warehouse', '123123', 123123, 'warehouse3@wh.com', '063b4b5e985ac41e8c4de510be40e305', NULL, 1, '003002', 0, 'warehouse3 123', 'warehouse3', '5567', '5aea3132bbcae7ed9d05e8d9611b8701', 1480370757, 0, 0, 2),
(13, '', '', '', '', 'wh4', '123123', 123123, 'wh4@wh4.com', '25bfc0fa206722704da7bd56a78779d7', NULL, 1, '004004', 0, 'wh4 123', 'wh4', '5500', 'f9a37600bf0ffe63763a94ad45f62bf4', 1480370961, 0, 0, 2),
(14, 'asddas', 'asdasd', '', '', '', '23423', 234234, '2342@asdasd.com', '202cb962ac59075b964b07152d234b70', NULL, 1, '234234234', 0, 'asdasd', 'asdasd', 'asdasd', '15b343ac9f6e5e036431602b00fd1531', 1482677259, 0, 0, 0);

--
-- Truncar tablas antes de insertar `ventas`
--

TRUNCATE TABLE `ventas`;
--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `uid`, `parcial_price`, `total`, `total_quantity`, `total_remaining_quantity`, `timestamp`, `deleted`, `paymentGatewayUrl`, `state`, `token`, `totalweight`, `guide_amount`) VALUES
(1, 1, 4176.88, 4176.88, 16, 0, '1484677259 ', 0, '', 0, NULL, 5.7, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
