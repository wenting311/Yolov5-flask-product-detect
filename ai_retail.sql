-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-03-31 17:32:22
-- 伺服器版本： 8.0.26
-- PHP 版本： 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `ai_retail`
--

-- --------------------------------------------------------

--
-- 資料表結構 `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `members`
--

CREATE TABLE `members` (
  `member_id` int NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_num` int NOT NULL,
  `face_img` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_line1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_line2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `postcode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `require_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `member_id` int NOT NULL,
  `store_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int NOT NULL,
  `product_id` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `discount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `product_id` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `products1`
--

CREATE TABLE `products1` (
  `product_id` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `products1`
--

INSERT INTO `products1` (`product_id`, `product_name`, `price`) VALUES
('2007203568243', '全家海陸雙手卷', 45),
('2597180416847', '蔥鹽燒肉飯糰', 30),
('2600565216830', '雙蔬鮪魚飯糰', 30),
('4607065002176', '士力架花生巧克力', 35),
('4710018028809', '可口可樂汽水', 29),
('4710022020332', 'Viva 萬歲牌 海苔杏仁小魚', 120),
('4710022023456', 'Viva 萬歲牌 珍珠開心果', 120),
('4710063415920', '農榨金桔檸檬飲', 25),
('4710063442438', '貝納頌咖啡（經典拿鐵）', 35),
('4710085104116', '伯朗咖啡罐裝', 25),
('4710088640673', 'CITYCAFE熱美式', 50),
('4710110804189', '百事可樂', 29),
('4710110804936', '味丹心茶道健康青草茶', 25),
('4710154015022', '黑松FIN補給飲料', 35),
('4710154020262', '黑松沙士', 29),
('4710171052376', '波蜜芭樂汁', 25),
('4710171061002', '一日蔬果100%蔬果汁', 30),
('4710199019146', '維力炸醬麵', 20),
('4710421072055', '御茶園特上檸檬茶', 25),
('4710543119041', '樂事美國經典原片洋芋片', 39),
('4710543624026', '多力多滋黃金起司口味玉米片', 45),
('4710594124605', '維他露汽水', 29),
('4710626194514', '雀巢茶品檸檬茶', 25),
('4710626428312', '愛之味甜八寶', 25),
('4710716334769', '極酷嗆涼無糖口香糖-極酷薄荷口味', 39),
('4711588210441', '台灣啤酒經典', 30),
('4711588341053', '金牌台灣啤酒', 30),
('4901335001785', '咔辣姆久厚切洋芋片 勁辣唐辛子口味', 25),
('4901351021675', '甘樂鮮果實軟糖', 50),
('4909411076658', '午後紅茶 - 奶茶', 45),
('49609677', '暖暖包', 20),
('6091403212255', '樺達硬喉糖-薄荷', 39),
('7282520747815', 'oreo 巧克力夾心', 49),
('80050278', '意大利金莎巧克力', 39),
('8851019410135', '格力高百奇巧克力棒', 38),
('8886467102394', '品客洋芋片（原味）', 39);

-- --------------------------------------------------------

--
-- 資料表結構 `stores`
--

CREATE TABLE `stores` (
  `store_id` int NOT NULL,
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- 資料表索引 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `member_id_2` (`member_id`),
  ADD UNIQUE KEY `store_id_2` (`store_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `store_id` (`store_id`);

--
-- 資料表索引 `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- 資料表索引 `products1`
--
ALTER TABLE `products1`
  ADD PRIMARY KEY (`product_id`);

--
-- 資料表索引 `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- 資料表的限制式 `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
