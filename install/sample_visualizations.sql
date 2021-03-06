-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 26, 2017 at 01:16 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.18-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viz`
--

-- --------------------------------------------------------

--
-- Table structure for table `visualizations`
--

DROP TABLE IF EXISTS `visualizations`;
CREATE TABLE IF NOT EXISTS `visualizations` (
  `id` int(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `position` int(4) NOT NULL,
  `size` varchar(32) NOT NULL,
  `class` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `dbtype` varchar(128) DEFAULT NULL,
  `dbhost` varchar(64) DEFAULT NULL,
  `dbuser` varchar(64) DEFAULT NULL,
  `dbpass` varchar(64) DEFAULT NULL,
  `dbname` varchar(128) DEFAULT NULL,
  `query` varchar(2048) NOT NULL,
  `height` varchar(4) NOT NULL,
  `dateformat` varchar(32) NOT NULL,
  `notes` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visualizations`
--

INSERT INTO `visualizations` (`id`, `name`, `title`, `tab`, `position`, `size`, `class`, `type`, `dbtype`, `dbhost`, `dbuser`, `dbpass`, `dbname`, `query`, `height`, `dateformat`, `notes`) VALUES
(37, 'pie0', 'Pie Example (Height Overrride 500)', '1', 1, 'col-md-6', '', 'pie', 'mysql', 'localhost', '', '', 'sampledb', 'SELECT\r\nA.customerName\r\n,A.`Total Payments`\r\nFROM\r\n(SELECT \r\nCUST.customerName\r\n,SUM(amount) as `Total Payments`\r\nFROM `payments` PMTS\r\nLEFT JOIN `customers` CUST on CUST.customerNumber=PMTS.customerNumber\r\nGROUP BY CUST.customerName) A\r\nORDER BY A.`Total Payments` Desc\r\nLIMIT 0,7\r\n', '500', '', 0x53454c454354200d0a435553542e637573746f6d65724e616d650d0a2c53554d28616d6f756e74292061732060546f74616c205061796d656e7473600d0a46524f4d20607061796d656e74736020504d54530d0a4c454654204a4f494e2060637573746f6d657273602043555354206f6e20435553542e637573746f6d65724e756d6265723d504d54532e637573746f6d65724e756d6265720d0a574845524520504d54532e7061796d656e7444617465203e3d2027323030352d30332d3031270d0a47524f555020425920435553542e637573746f6d65724e616d65),
(9, 'bar0', 'Bar Example', '1', 2, 'col-md-6', '', 'bar', 'mysql', 'localhost', '', '', 'sampledb', 'SELECT\r\nB.RptPd\r\n,SUM(B.Charges) as `Charges`\r\n,SUM(B.Payments) as `Payments`\r\nFROM\r\n(\r\nSELECT\r\nLEFT(A.RptPd,7) as `RptPd`\r\n,IFNULL((SELECT\r\n	SUM(Z.Charge)\r\n	FROM (\r\n    	SELECT\r\n		LEFT(ORD.orderDate,10) as `RptPd`\r\n		,ORDET.priceEach*ORDET.quantityOrdered as `Charge`\r\n		FROM orders ORD\r\n		LEFT JOIN orderdetails ORDET ON ORDET.orderNumber=ORD.orderNumber\r\n	) Z\r\n    WHERE Z.RptPd=A.RptPd\r\n	GROUP BY Z.RptPd\r\n),0) as `Charges` \r\n\r\n,IFNULL((SELECT\r\n	SUM(Z.amount)\r\n	FROM(\r\n		SELECT\r\n		LEFT(PMT.paymentDate,10) as `RptPd`\r\n		,PMT.amount\r\n		FROM payments PMT\r\n	) Z\r\n	WHERE Z.RptPd=A.RptPd\r\n	GROUP BY Z.RptPd\r\n),0) as `Payments`\r\n\r\nFROM\r\n(SELECT\r\nPMT.paymentDate as `RptPd`\r\nFROM payments PMT\r\nUNION\r\nSELECT\r\nORD.orderDate as `RptPd`\r\nFROM orders ORD)\r\nA\r\n    ) B\r\n/*WHERE B.RptPd >= \'2003-07\' AND B.RptPd < \'2005-07\'*/\r\n    GROUP BY\r\n    B.RptPd\r\nORDER BY B.RptPd', '0', '%Y-%m', 0x30),
(36, 'mp40', 'MP4 Example', '23', 3, 'col-md-6', '', 'mp4video', '', '', '', '', '', 'images/test.mp4', '250', '', ''),
(32, 'iframe0', 'iframe Example', '23', 4, 'col-md-6', '', 'iframe', '', '', '', '', '', 'https://owlhousellc.com/', '', '', ''),
(35, 'line0', 'Line Example ', '1', 0, 'col-md-12', '', 'line', 'mysql', 'localhost', '', '', 'sampledb', 'SELECT\r\nB.RptPd\r\n,SUM(B.Charges) as `Charges`\r\n,SUM(B.Payments) as `Payments`\r\nFROM\r\n(\r\nSELECT\r\nLEFT(A.RptPd,7) as `RptPd`\r\n,IFNULL((SELECT\r\n	SUM(Z.Charge)\r\n	FROM (\r\n    	SELECT\r\n		LEFT(ORD.orderDate,10) as `RptPd`\r\n		,ORDET.priceEach*ORDET.quantityOrdered as `Charge`\r\n		FROM orders ORD\r\n		LEFT JOIN orderdetails ORDET ON ORDET.orderNumber=ORD.orderNumber\r\n	) Z\r\n    WHERE Z.RptPd=A.RptPd\r\n	GROUP BY Z.RptPd\r\n),0) as `Charges` \r\n\r\n,IFNULL((SELECT\r\n	SUM(Z.amount)\r\n	FROM(\r\n		SELECT\r\n		LEFT(PMT.paymentDate,10) as `RptPd`\r\n		,PMT.amount\r\n		FROM payments PMT\r\n	) Z\r\n	WHERE Z.RptPd=A.RptPd\r\n	GROUP BY Z.RptPd\r\n),0) as `Payments`\r\n\r\nFROM\r\n(SELECT\r\nPMT.paymentDate as `RptPd`\r\nFROM payments PMT\r\nUNION\r\nSELECT\r\nORD.orderDate as `RptPd`\r\nFROM orders ORD)\r\nA\r\n    ) B\r\n/*WHERE B.RptPd >= \'2003-07\' AND B.RptPd < \'2005-07\'*/\r\n    GROUP BY\r\n    B.RptPd\r\nORDER BY B.RptPd', '', '%Y-%m', 0x53454c4543540d0a5a2e7061796d656e7444617465206173206044617465600d0a2c53554d285a2e5061796d656e742920617320605061796d656e7473600d0a46524f4d0d0a280953454c4543540d0a09504d54532e7061796d656e74446174650d0a092c504d54532e616d6f756e7420617320605061796d656e74600d0a0946524f4d207061796d656e747320504d54530d0a0929205a2047524f5550204259205a2e7061796d656e74446174650d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a0d0a53454c4543540d0a432e52707450640d0a2c53554d28432e436861726765732920617320436861726765730d0a2c53554d28432e5061796d656e747329206173205061796d656e74730d0a46524f4d0d0a2853454c4543540d0a4c45465428422e6044617465602c37292061732052707450640d0a2c422e605061796d656e7473600d0a2c49464e554c4c28422e6043686172676573602c3029206173206043686172676573600d0a46524f4d200d0a2853454c4543540d0a5a2e7061796d656e7444617465206173206044617465600d0a2c53554d285a2e5061796d656e742920617320605061796d656e7473600d0a2c43484152472e436861726765730d0a46524f4d0d0a280953454c4543540d0a09504d54532e7061796d656e74446174650d0a092c504d54532e616d6f756e7420617320605061796d656e74600d0a0946524f4d207061796d656e747320504d54530d0a0929205a0d0a0d0a0d0a4c454654204a4f494e0d0a0d0a280953454c4543540d0a09412e6f72646572446174650d0a092c53554d28412e43686172676529206173206043686172676573600d0a0946524f4d0d0a2009280953454c4543540d0a09094f52442e6f72646572446174650d0a09092c4f524445542e707269636545616368202a204f524445542e7175616e746974794f7264657265642061732060436861726765600d0a090946524f4d206f7264657273204f5244200d0a09094c454654204a4f494e206f7264657264657461696c73204f52444554204f4e204f524445542e6f726465724e756d6265723d4f52442e6f726465724e756d6265720d0a20092920410d0a0947524f555020425920412e6f726465726461746529204348415247204f4e2043484152472e6f72646572446174653d5a2e7061796d656e74446174650d0a47524f5550204259205a2e7061796d656e74446174650d0a0d0a554e494f4e0d0a0d0a53454c4543540d0a5a2e7061796d656e7444617465206173206044617465600d0a2c53554d285a2e5061796d656e7429206173205061796d656e740d0a2c43484152472e436861726765730d0a46524f4d0d0a280953454c4543540d0a09504d54532e7061796d656e74446174650d0a092c504d54532e616d6f756e7420617320605061796d656e74600d0a0946524f4d207061796d656e747320504d54530d0a0929205a0d0a0d0a0d0a5249474854204a4f494e0d0a0d0a280953454c4543540d0a09412e6f72646572446174650d0a092c53554d28412e43686172676529206173206043686172676573600d0a0946524f4d0d0a2009280953454c4543540d0a09094f52442e6f72646572446174650d0a09092c4f524445542e707269636545616368202a204f524445542e7175616e746974794f7264657265642061732060436861726765600d0a090946524f4d206f7264657273204f5244200d0a09094c454654204a4f494e206f7264657264657461696c73204f52444554204f4e204f524445542e6f726465724e756d6265723d4f52442e6f726465724e756d6265720d0a20092920410d0a0947524f555020425920412e6f726465726461746529204348415247204f4e2043484152472e6f72646572446174653d5a2e7061796d656e74446174650d0a47524f5550204259205a2e7061796d656e74446174652920420d0a574845524520422e44617465204953204e4f54204e554c4c202f2a414e4420422e44617465203e3d2027323030352d30312d3031272a2f2920430d0a47524f555020425920432e52707450640d0a4f5244455220425920432e5270745064),
(25, 'scatter0', 'Scatter Example', '1', 3, 'col-md-6', '', 'scatter', 'mysql', 'localhost', '', '', 'sampledb', 'SELECT\r\nA.RptPd\r\n,IFNULL((SELECT\r\n	SUM(Z.Charge)\r\n	FROM (\r\n    	SELECT\r\n		LEFT(ORD.orderDate,10) as `RptPd`\r\n		,ORDET.priceEach*ORDET.quantityOrdered as `Charge`\r\n		FROM orders ORD\r\n		LEFT JOIN orderdetails ORDET ON ORDET.orderNumber=ORD.orderNumber\r\n	) Z\r\n    WHERE Z.RptPd=A.RptPd\r\n	GROUP BY Z.RptPd\r\n),0) as `Charges` \r\n\r\n,IFNULL((SELECT\r\n	SUM(Z.amount)\r\n	FROM(\r\n		SELECT\r\n		LEFT(PMT.paymentDate,10) as `RptPd`\r\n		,PMT.amount\r\n		FROM payments PMT\r\n	) Z\r\n	WHERE Z.RptPd=A.RptPd\r\n	GROUP BY Z.RptPd\r\n),0) as `Payments`\r\n\r\nFROM\r\n(SELECT\r\nPMT.paymentDate as `RptPd`\r\nFROM payments PMT \r\n/*Limit from the primary*/\r\nWHERE PMT.paymentDate >= \'2004-07-01\'\r\nUNION\r\nSELECT\r\nORD.orderDate as `RptPd`\r\nFROM orders ORD \r\n/*Limit from the primary*/\r\nWHERE ORD.orderDate >= \'2004-07-01\')\r\nA\r\nORDER BY A.RptPd', '0', '', ''),
(31, 'image0', 'Image Example', '23', 2, 'col-md-6', '', 'image', '', '', '', '', '', 'images/owlhousellc_logo.png', '', '', ''),
(38, 'table0', 'Table Example', '1', 4, 'col-md-12', 'table-striped table-condensed', 'table', 'mysql', 'localhost', '', '', 'sampledb', 'SELECT * FROM employees', '', '', 0x7461626c652d626f726465726564207461626c652d7374726970656420746578742d63656e746572207461626c652d686f766572207461626c652d636f6e64656e736564),
(42, 'line1', 'Line With Focus Example', '1', 3, 'col-md-6', '', 'lineWithFocus', 'mysql', 'localhost', '', '', 'sampledb', 'SELECT\r\nB.RptPd\r\n,SUM(B.Charges) as `Charges`\r\n,SUM(B.Payments) as `Payments`\r\nFROM\r\n(\r\nSELECT\r\nLEFT(A.RptPd,7) as `RptPd`\r\n,IFNULL((SELECT\r\n	SUM(Z.Charge)\r\n	FROM (\r\n    	SELECT\r\n		LEFT(ORD.orderDate,10) as `RptPd`\r\n		,ORDET.priceEach*ORDET.quantityOrdered as `Charge`\r\n		FROM orders ORD\r\n		LEFT JOIN orderdetails ORDET ON ORDET.orderNumber=ORD.orderNumber\r\n	) Z\r\n    WHERE Z.RptPd=A.RptPd\r\n	GROUP BY Z.RptPd\r\n),0) as `Charges` \r\n\r\n,IFNULL((SELECT\r\n	SUM(Z.amount)\r\n	FROM(\r\n		SELECT\r\n		LEFT(PMT.paymentDate,10) as `RptPd`\r\n		,PMT.amount\r\n		FROM payments PMT\r\n	) Z\r\n	WHERE Z.RptPd=A.RptPd\r\n	GROUP BY Z.RptPd\r\n),0) as `Payments`\r\n\r\nFROM\r\n(SELECT\r\nPMT.paymentDate as `RptPd`\r\nFROM payments PMT\r\nUNION\r\nSELECT\r\nORD.orderDate as `RptPd`\r\nFROM orders ORD)\r\nA\r\n    ) B\r\n/*WHERE B.RptPd >= \'2003-07\' AND B.RptPd < \'2005-07\'*/\r\n    GROUP BY\r\n    B.RptPd\r\nORDER BY B.RptPd', '', '%Y-%m', ''),
(39, 'export0', 'Export Button Example', '1', 5, 'col-md-12', '', 'exportButton', 'mysql', 'localhost', '', '', 'sampledb', 'SELECT * FROM employees', '50', '', ''),
(40, 'youtube0', 'YouTube Embed Example', '23', 5, 'col-md-6', '', 'youtubeEmbed', '', '', '', '', '', '<iframe src="https://www.youtube.com/embed/AdSZJzb-aX8" frameborder="0" width="100%" height="250" allowfullscreen></iframe>', '', '', ''),
(43, 'html0', 'html Example', '23', 1, 'col-md-12', 'well', 'html', '', '', '', '', '', '<p align="justify">\r\nLorem ipsum dolor sit amet, elit consectetuer vivamus justo pulvinar dictum porta, eget magna amet proin felis feugiat aliquam, tincidunt magna ut ipsum et pellentesque libero, vehicula fermentum praesent vivamus accumsan lacus a. Per nunc, id magnis consectetuer eleifend condimentum mauris ligula, dolor etiam dapibus vehicula ut, sollicitudin a mauris mollis nulla, viverra duis. Sed accumsan enim, turpis gravida duis ullamcorper, vestibulum eleifend nec mattis hymenaeos mollis et, luctus nostra luctus suscipit leo, quam quam ut lorem sem mi ante. Neque eu mattis eu aenean vel, mi consequat. Id egestas mollis, aliquam enim quis. Id interdum in, erat in lacus ac fringilla integer, diam amet. Euismod fermentum sed molestie, sapien euismod a erat curabitur nibh cum, vitae tellus aliquam suspendisse non. Nisl et imperdiet amet semper, eget amet elit quam, eros vestibulum interdum viverra vitae, sed laoreet sit ullamcorper luctus, est faucibus suspendisse sapien dui rerum. Duis felis vestibulum aliquam, dui id nec cras sapien. Sapien ac netus nulla, egestas non hymenaeos vel lectus nam et, bibendum blandit sollicitudin facere dicta molestie eget, lorem urna nunc pellentesque, venenatis potenti fringilla mus id tempus. Fusce gravida commodo, augue nec a a vitae, eu aliquip mauris non pede. Pellentesque metus sodales eget suscipit cursus cras.</p>\r\n<p align="justify">\r\n</p>', '', '', 0x766572746963616c2d616c69676e2d6d6964646c652077656c6c),
(44, 'donut0', 'Donut Example', '1', 3, 'col-md-6', '', 'donut', 'mysql', 'localhost', '', '', 'sampledb', 'SELECT\r\nA.customerName\r\n,A.`Total Payments`\r\nFROM\r\n(SELECT \r\nCUST.customerName\r\n,SUM(amount) as `Total Payments`\r\nFROM `payments` PMTS\r\nLEFT JOIN `customers` CUST on CUST.customerNumber=PMTS.customerNumber\r\nGROUP BY CUST.customerName) A\r\nORDER BY A.`Total Payments` Desc\r\nLIMIT 0,6\r\n', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `visualizations`
--
ALTER TABLE `visualizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `visualizations`
--
ALTER TABLE `visualizations`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
