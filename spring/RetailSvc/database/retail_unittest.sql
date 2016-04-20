-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.6.22-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for retail_unittest
DROP DATABASE IF EXISTS `retail_unittest`;
CREATE DATABASE IF NOT EXISTS `retail_unittest` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `retail_unittest`;


-- Dumping structure for table retail_unittest.advance_register
DROP TABLE IF EXISTS `advance_register`;
CREATE TABLE IF NOT EXISTS `advance_register` (
  `advance_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `action_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`advance_id`),
  KEY `FK_advance_register_transaction_payment` (`payment_id`),
  CONSTRAINT `FK_advance_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.advance_register: ~0 rows (approximately)
/*!40000 ALTER TABLE `advance_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.branch_master
DROP TABLE IF EXISTS `branch_master`;
CREATE TABLE IF NOT EXISTS `branch_master` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `micr_code` varchar(50) DEFAULT NULL,
  `db_name` varchar(50) NOT NULL,
  `context_root` varchar(50) NOT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `phone1` varchar(15) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.branch_master: ~2 rows (approximately)
/*!40000 ALTER TABLE `branch_master` DISABLE KEYS */;
INSERT INTO `branch_master` (`branch_id`, `parent_id`, `bank_name`, `branch_name`, `ifsc_code`, `micr_code`, `db_name`, `context_root`, `email1`, `email2`, `phone1`, `phone2`, `remarks`, `start_date`, `end_date`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 0, 'Kalipur', 'Kalipur', '12345743', '87656321', 'coop_kalipur', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '9830525559', NULL, NULL, '2015-12-18', NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:24', 'ashish', NULL),
	(2, 1, 'Janai', 'Janai', '12345678', '87654321', 'coop_janai', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '9830625559', NULL, NULL, '2015-12-18', NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:21', NULL, NULL);
/*!40000 ALTER TABLE `branch_master` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.card_register
DROP TABLE IF EXISTS `card_register`;
CREATE TABLE IF NOT EXISTS `card_register` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `action_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT NULL COMMENT 'Credit Card, Debit Card',
  `card_holder_name` varchar(50) DEFAULT NULL,
  `valid_month` int(11) DEFAULT NULL,
  `valid_year` int(11) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_id`),
  KEY `FK_card_register_transaction_payment` (`payment_id`),
  CONSTRAINT `FK_card_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.card_register: ~0 rows (approximately)
/*!40000 ALTER TABLE `card_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `card_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.cash_register
DROP TABLE IF EXISTS `cash_register`;
CREATE TABLE IF NOT EXISTS `cash_register` (
  `cash_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `action_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cash_id`),
  KEY `FK_cash_register_transaction_payment` (`payment_id`),
  CONSTRAINT `FK_cash_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.cash_register: ~0 rows (approximately)
/*!40000 ALTER TABLE `cash_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.cheque_register
DROP TABLE IF EXISTS `cheque_register`;
CREATE TABLE IF NOT EXISTS `cheque_register` (
  `cheque_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `cheque_no` varchar(50) NOT NULL,
  `cheque_date` date NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `cheque_charge` decimal(10,2) DEFAULT NULL,
  `upper_bank_charge` decimal(10,2) DEFAULT NULL,
  `cheque_clear_date` date DEFAULT NULL,
  `cheque_clear_amt` decimal(10,2) DEFAULT NULL,
  `cheque_bounce_date` date DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(255) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cheque_id`),
  KEY `FK_cheque_register_transaction_payment` (`payment_id`),
  CONSTRAINT `FK_cheque_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.cheque_register: ~0 rows (approximately)
/*!40000 ALTER TABLE `cheque_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheque_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.credit_register
DROP TABLE IF EXISTS `credit_register`;
CREATE TABLE IF NOT EXISTS `credit_register` (
  `credit_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `credit_amt` decimal(10,2) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(255) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`credit_id`),
  KEY `FK_credit_register_transaction_payment` (`payment_id`),
  CONSTRAINT `FK_credit_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.credit_register: ~0 rows (approximately)
/*!40000 ALTER TABLE `credit_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.fy_close
DROP TABLE IF EXISTS `fy_close`;
CREATE TABLE IF NOT EXISTS `fy_close` (
  `fy_id` int(11) NOT NULL AUTO_INCREMENT,
  `fy` varchar(50) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_closed` tinyint(4) DEFAULT NULL,
  `year_closed_on` timestamp NULL DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fy_id`),
  UNIQUE KEY `fy_branch_id` (`fy`,`branch_id`),
  KEY `FK_fy_close_branch_master` (`branch_id`),
  CONSTRAINT `FK_fy_close_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.fy_close: ~1 rows (approximately)
/*!40000 ALTER TABLE `fy_close` DISABLE KEYS */;
INSERT INTO `fy_close` (`fy_id`, `fy`, `branch_id`, `start_date`, `end_date`, `is_closed`, `year_closed_on`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, '2015-2016', 2, '2015-04-01 00:00:00', '2016-03-31 23:59:59', 1, '2016-04-20 06:55:39', 'ashish', '2016-04-20 06:55:38', NULL, '2016-04-20 06:55:39');
/*!40000 ALTER TABLE `fy_close` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_header
DROP TABLE IF EXISTS `gl_header`;
CREATE TABLE IF NOT EXISTS `gl_header` (
  `gl_header_code` int(11) NOT NULL,
  `gl_header_desc` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gl_header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.gl_header: ~0 rows (approximately)
/*!40000 ALTER TABLE `gl_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `gl_header` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_ledger_dtl
DROP TABLE IF EXISTS `gl_ledger_dtl`;
CREATE TABLE IF NOT EXISTS `gl_ledger_dtl` (
  `gl_tran_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `gl_tran_id` int(11) NOT NULL,
  `gl_mas_code` int(11) NOT NULL,
  `dr_cr` varchar(10) NOT NULL,
  `account_no` int(11) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passin_auth_remarks` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gl_tran_dtl_id`),
  KEY `FK_gl_ledger_dtl_gl_ledger_dtl` (`gl_tran_id`),
  KEY `FK_gl_ledger_dtl_gl_master` (`gl_mas_code`),
  CONSTRAINT `FK_gl_ledger_dtl_gl_ledger_dtl` FOREIGN KEY (`gl_tran_id`) REFERENCES `gl_ledger_dtl` (`gl_tran_dtl_id`),
  CONSTRAINT `FK_gl_ledger_dtl_gl_master` FOREIGN KEY (`gl_mas_code`) REFERENCES `gl_master` (`gl_mas_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.gl_ledger_dtl: ~0 rows (approximately)
/*!40000 ALTER TABLE `gl_ledger_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `gl_ledger_dtl` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_ledger_hrd
DROP TABLE IF EXISTS `gl_ledger_hrd`;
CREATE TABLE IF NOT EXISTS `gl_ledger_hrd` (
  `gl_tran_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL DEFAULT '0',
  `tran_no` varchar(50) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `tran_type` varchar(50) DEFAULT NULL,
  `fy` varchar(10) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gl_tran_id`),
  KEY `FK_gl_ledger_hrd_branch_master` (`branch_id`),
  CONSTRAINT `FK_gl_ledger_hrd_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.gl_ledger_hrd: ~0 rows (approximately)
/*!40000 ALTER TABLE `gl_ledger_hrd` DISABLE KEYS */;
INSERT INTO `gl_ledger_hrd` (`gl_tran_id`, `branch_id`, `tran_no`, `action_date`, `tran_type`, `fy`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, '20042016/1', '2016-04-29', 'PURCHASED', '2016-2017', NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 22:28:09', NULL, NULL),
	(2, 2, '20042016/2', '2016-04-29', 'PURCHASED', '2016-2017', NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 22:36:39', NULL, NULL);
/*!40000 ALTER TABLE `gl_ledger_hrd` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_master
DROP TABLE IF EXISTS `gl_master`;
CREATE TABLE IF NOT EXISTS `gl_master` (
  `gl_mas_code` int(11) NOT NULL,
  `gl_sub_header_code` int(11) NOT NULL,
  `gl_mas_desc` varchar(150) DEFAULT NULL,
  `annexure_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`gl_mas_code`),
  KEY `FK_gl_master_gl_sub_header` (`gl_sub_header_code`),
  CONSTRAINT `FK_gl_master_gl_sub_header` FOREIGN KEY (`gl_sub_header_code`) REFERENCES `gl_sub_header` (`gl_sub_header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.gl_master: ~0 rows (approximately)
/*!40000 ALTER TABLE `gl_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `gl_master` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_sub_header
DROP TABLE IF EXISTS `gl_sub_header`;
CREATE TABLE IF NOT EXISTS `gl_sub_header` (
  `gl_sub_header_code` int(11) NOT NULL,
  `gl_header_code` int(11) NOT NULL,
  `gl_sub_header_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`gl_sub_header_code`),
  KEY `FK_gl_sub_header_gl_header` (`gl_header_code`),
  CONSTRAINT `FK_gl_sub_header_gl_header` FOREIGN KEY (`gl_header_code`) REFERENCES `gl_header` (`gl_header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.gl_sub_header: ~0 rows (approximately)
/*!40000 ALTER TABLE `gl_sub_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `gl_sub_header` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.ledger_code_payment
DROP TABLE IF EXISTS `ledger_code_payment`;
CREATE TABLE IF NOT EXISTS `ledger_code_payment` (
  `payment_ledger_id` int(11) NOT NULL,
  `gl_code` int(11) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_ledger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.ledger_code_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `ledger_code_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ledger_code_payment` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.ledger_code_retail
DROP TABLE IF EXISTS `ledger_code_retail`;
CREATE TABLE IF NOT EXISTS `ledger_code_retail` (
  `retail_ledger_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_grp_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `purchase_code` int(11) NOT NULL,
  `sell_code` int(11) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`retail_ledger_code_id`),
  KEY `FK_retail_ledger_code_material_group` (`material_grp_id`),
  KEY `FK_retail_ledger_code_vendor_master` (`vendor_id`),
  CONSTRAINT `FK_retail_ledger_code_material_group` FOREIGN KEY (`material_grp_id`) REFERENCES `material_group` (`material_grp_id`),
  CONSTRAINT `FK_retail_ledger_code_vendor_master` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_master` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Ledger codes related the Retail oprtation is defined here. This is a master table';

-- Dumping data for table retail_unittest.ledger_code_retail: ~4 rows (approximately)
/*!40000 ALTER TABLE `ledger_code_retail` DISABLE KEYS */;
INSERT INTO `ledger_code_retail` (`retail_ledger_code_id`, `material_grp_id`, `vendor_id`, `purchase_code`, `sell_code`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 1, 34112, 41112, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:31', NULL, NULL),
	(2, 1, 2, 34113, 41113, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:31', NULL, NULL),
	(3, 2, 3, 34114, 41114, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:31', NULL, NULL),
	(4, 3, 3, 34115, 41115, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:31', NULL, NULL);
/*!40000 ALTER TABLE `ledger_code_retail` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.material_group
DROP TABLE IF EXISTS `material_group`;
CREATE TABLE IF NOT EXISTS `material_group` (
  `material_grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `group_description` varchar(50) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`material_grp_id`),
  UNIQUE KEY `branch_id_group_name` (`branch_id`,`group_name`),
  CONSTRAINT `FK_material_group_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.material_group: ~3 rows (approximately)
/*!40000 ALTER TABLE `material_group` DISABLE KEYS */;
INSERT INTO `material_group` (`material_grp_id`, `branch_id`, `group_name`, `group_description`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 'LUBRICANT', 'Lubricant (Engine Oil)', NULL, NULL, 'ashish', '2016-04-20 06:55:24', NULL, NULL),
	(2, 1, 'PARTSANDMATERIALS', 'Parts and Materials', NULL, NULL, 'ashish', '2016-04-20 06:55:24', NULL, NULL),
	(3, 1, 'PESTISIDES', 'Pestisides', 'Y', NULL, 'ashish', '2016-04-20 06:55:24', 'ashish', '2016-04-20 06:55:36');
/*!40000 ALTER TABLE `material_group` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.material_master
DROP TABLE IF EXISTS `material_master`;
CREATE TABLE IF NOT EXISTS `material_master` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(50) NOT NULL,
  `material_description` varchar(50) DEFAULT NULL,
  `material_grp_id` int(11) NOT NULL,
  `uom` varchar(50) NOT NULL COMMENT 'Unit of measure e.g. Kg, Litre, Package, None etc',
  `mrp` decimal(10,2) NOT NULL,
  `stock_in` decimal(10,2) DEFAULT NULL,
  `stock_out` decimal(10,2) DEFAULT NULL,
  `stock_balance` decimal(10,2) DEFAULT NULL,
  `low_stock_level` decimal(10,2) DEFAULT NULL COMMENT 'If the total stock goes below this level then user will be notified',
  `qty_check_required_ind` varchar(4) DEFAULT NULL COMMENT 'There are some materials for which quantity check not required. E.g. labour charge, insurance, Emission',
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`material_id`),
  KEY `FK_material_master_material_group` (`material_grp_id`),
  CONSTRAINT `FK_material_master_material_group` FOREIGN KEY (`material_grp_id`) REFERENCES `material_group` (`material_grp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.material_master: ~4 rows (approximately)
/*!40000 ALTER TABLE `material_master` DISABLE KEYS */;
INSERT INTO `material_master` (`material_id`, `material_name`, `material_description`, `material_grp_id`, `uom`, `mrp`, `stock_in`, `stock_out`, `stock_balance`, `low_stock_level`, `qty_check_required_ind`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 'CASTROL', 'Castrol Engine oil', 1, 'ml', 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:25', NULL, NULL),
	(2, 'SEATCOVER', 'Seat Cover', 2, 'pcs', 1000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:25', NULL, NULL),
	(3, 'LONGSEATCOVER', 'Long Seat Cover', 2, 'pcs', 10.00, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'ashish', '2016-04-20 06:55:25', 'ashish', '2016-04-20 06:55:37'),
	(4, 'FREIGHT CHARGES', 'Freight Charges', 2, 'pcs', 1000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:25', NULL, NULL);
/*!40000 ALTER TABLE `material_master` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.material_tran_dtl
DROP TABLE IF EXISTS `material_tran_dtl`;
CREATE TABLE IF NOT EXISTS `material_tran_dtl` (
  `tran_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL COMMENT 'This field will be populated for servies like expiration of insurance/Emission test',
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tran_dtl_id`),
  KEY `FK_material_tran_dtl_material_tran_hrd` (`tran_id`),
  KEY `FK_material_tran_dtl_stock_entry` (`stock_id`),
  CONSTRAINT `FK_material_tran_dtl_material_tran_hrd` FOREIGN KEY (`tran_id`) REFERENCES `material_tran_hrd` (`tran_id`),
  CONSTRAINT `FK_material_tran_dtl_stock_entry` FOREIGN KEY (`stock_id`) REFERENCES `stock_entry` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.material_tran_dtl: ~3 rows (approximately)
/*!40000 ALTER TABLE `material_tran_dtl` DISABLE KEYS */;
INSERT INTO `material_tran_dtl` (`tran_dtl_id`, `tran_id`, `stock_id`, `qty`, `rate`, `total`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `end_date`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 4, 9.00, 10.00, 90.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:35', NULL, NULL),
	(2, 1, 4, 1.00, 10.00, 10.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:35', NULL, NULL),
	(3, 1, 5, 9.00, 10.00, 90.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:35', NULL, NULL);
/*!40000 ALTER TABLE `material_tran_dtl` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.material_tran_hrd
DROP TABLE IF EXISTS `material_tran_hrd`;
CREATE TABLE IF NOT EXISTS `material_tran_hrd` (
  `tran_id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_no` varchar(50) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `tran_type` enum('SELL','PURCHASED') DEFAULT NULL COMMENT 'op=Opening, s=sell',
  `action_date` date DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `bill_date` date NOT NULL,
  `bill_amt` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `gross_total` decimal(10,2) DEFAULT NULL,
  `paid_amt` decimal(10,2) DEFAULT NULL,
  `outstanding_amt` decimal(10,2) DEFAULT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tran_id`),
  UNIQUE KEY `tran_type_bill_no` (`tran_type`,`bill_no`),
  KEY `FK_material_tran_hrd_branch_master` (`branch_id`),
  CONSTRAINT `FK_material_tran_hrd_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.material_tran_hrd: ~0 rows (approximately)
/*!40000 ALTER TABLE `material_tran_hrd` DISABLE KEYS */;
INSERT INTO `material_tran_hrd` (`tran_id`, `tran_no`, `branch_id`, `tran_type`, `action_date`, `bill_no`, `bill_date`, `bill_amt`, `vat`, `discount`, `gross_total`, `paid_amt`, `outstanding_amt`, `paid_by`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, '20042016/1', 2, 'SELL', NULL, NULL, '2016-03-30', 190.00, 12.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:35', NULL, '2016-04-20 06:55:35'),
	(4, '20042016/2', 2, 'PURCHASED', '2016-04-29', '86-1233', '2016-03-28', 91.00, 10.00, 0.50, 100.50, 100.50, 0.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 22:36:39', NULL, NULL);
/*!40000 ALTER TABLE `material_tran_hrd` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.retail_customer_master
DROP TABLE IF EXISTS `retail_customer_master`;
CREATE TABLE IF NOT EXISTS `retail_customer_master` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `ref_customer_id` int(11) DEFAULT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_type` varchar(50) DEFAULT NULL COMMENT 'Running Customer/Account holder Customer/Member Customer etc',
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) DEFAULT NULL,
  `pin` varchar(50) NOT NULL,
  `phone1` varchar(15) NOT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `FK_retail_customer_master_branch_master` (`branch_id`),
  CONSTRAINT `FK_retail_customer_master_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.retail_customer_master: ~2 rows (approximately)
/*!40000 ALTER TABLE `retail_customer_master` DISABLE KEYS */;
INSERT INTO `retail_customer_master` (`customer_id`, `branch_id`, `ref_customer_id`, `customer_name`, `customer_type`, `address_line1`, `address_line2`, `pin`, `phone1`, `phone2`, `email1`, `email2`, `website`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, 0, 'ASHISH MONDAL', 'Running', 'Kalipur', NULL, '712708', '9830625559', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:28', 'ashish', '2016-04-20 06:55:28'),
	(2, 2, 100, 'DONA MONDAL', 'Member', 'Kalipur', NULL, '712708', '9830625559', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:28', NULL, NULL);
/*!40000 ALTER TABLE `retail_customer_master` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.retail_document
DROP TABLE IF EXISTS `retail_document`;
CREATE TABLE IF NOT EXISTS `retail_document` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `document` blob NOT NULL,
  `title` varchar(100) NOT NULL,
  `doc_type` varchar(10) NOT NULL COMMENT 'e.g. pdf, txt etc',
  `doc_size` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `FK__branch_master` (`branch_id`),
  CONSTRAINT `FK__branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.retail_document: ~1 rows (approximately)
/*!40000 ALTER TABLE `retail_document` DISABLE KEYS */;
INSERT INTO `retail_document` (`doc_id`, `branch_id`, `document`, `title`, `doc_type`, `doc_size`, `comment`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, _binary 0x7B0D0A2020226272616E63684265616E223A207B0D0A20202020226272616E63684964223A20322C0D0A2020202022646F63756D656E7473223A205B0D0A2020202020207B0D0A202020202020202022646F634964223A20302C0D0A2020202020202020226272616E6368496422203A20322C0D0A202020202020202022646F6354797065223A20226A736F6E222C0D0A2020202020202020227469746C6522203A20225465737420446F63756D656E74222C0D0A20202020202020202263726561746555736572223A2022617368697368220D0A2020202020207D0D0A202020205D0D0A20207D0D0A7D, 'Test Document', 'json', 235, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:26', NULL, NULL);
/*!40000 ALTER TABLE `retail_document` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.retail_payment
DROP TABLE IF EXISTS `retail_payment`;
CREATE TABLE IF NOT EXISTS `retail_payment` (
  `retail_payment_id` int(11) NOT NULL,
  `tran_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `action_date` date NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`retail_payment_id`),
  KEY `FK__material_tran_hrd` (`tran_id`),
  KEY `FK__transaction_payment` (`payment_id`),
  CONSTRAINT `FK__material_tran_hrd` FOREIGN KEY (`tran_id`) REFERENCES `material_tran_hrd` (`tran_id`),
  CONSTRAINT `FK__transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.retail_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `retail_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `retail_payment` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.retail_rate_chart
DROP TABLE IF EXISTS `retail_rate_chart`;
CREATE TABLE IF NOT EXISTS `retail_rate_chart` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `material_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `unit_rate` decimal(10,2) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rate_id`),
  KEY `FK_retail_rate_chart_material_master` (`material_id`),
  KEY `FK_retail_rate_chart_branch_master` (`branch_id`),
  CONSTRAINT `FK_retail_rate_chart_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_retail_rate_chart_material_master` FOREIGN KEY (`material_id`) REFERENCES `material_master` (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.retail_rate_chart: ~3 rows (approximately)
/*!40000 ALTER TABLE `retail_rate_chart` DISABLE KEYS */;
INSERT INTO `retail_rate_chart` (`rate_id`, `branch_id`, `material_id`, `start_date`, `unit_rate`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, 1, '2016-04-18', 200.00, 'Y', 'Rate updated', NULL, NULL, 'ashish', '2016-04-20 06:55:27', 'ashish', '2016-04-20 06:55:28'),
	(2, 2, 2, '2016-03-19', 200.00, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:27', NULL, NULL),
	(3, 2, 1, '2016-03-20', 200.00, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:28', NULL, NULL);
/*!40000 ALTER TABLE `retail_rate_chart` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.retail_transactions
DROP TABLE IF EXISTS `retail_transactions`;
CREATE TABLE IF NOT EXISTS `retail_transactions` (
  `retail_tran_id` int(11) NOT NULL AUTO_INCREMENT,
  `gl_tran_id` int(11) DEFAULT NULL,
  `tran_id` int(11) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`retail_tran_id`),
  KEY `FK_retail_gl_ledger_gl_ledger_hrd` (`gl_tran_id`),
  KEY `FK_retail_gl_ledger_material_tran_hrd` (`tran_id`),
  CONSTRAINT `FK_retail_gl_ledger_gl_ledger_hrd` FOREIGN KEY (`gl_tran_id`) REFERENCES `gl_ledger_hrd` (`gl_tran_id`),
  CONSTRAINT `FK_retail_gl_ledger_material_tran_hrd` FOREIGN KEY (`tran_id`) REFERENCES `material_tran_hrd` (`tran_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.retail_transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `retail_transactions` DISABLE KEYS */;
INSERT INTO `retail_transactions` (`retail_tran_id`, `gl_tran_id`, `tran_id`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, 4, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 22:36:39', NULL, NULL);
/*!40000 ALTER TABLE `retail_transactions` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.stock_entry
DROP TABLE IF EXISTS `stock_entry`;
CREATE TABLE IF NOT EXISTS `stock_entry` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_stock_id` int(11) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `action_date` date NOT NULL,
  `challan_date` date NOT NULL,
  `bill_date` date DEFAULT NULL,
  `entry_type` varchar(20) DEFAULT NULL COMMENT 'Opening Entry indicator indicates if the entry is for the current financial year, SR=Stock return, SaR=Sale Return, OP=Opening STock',
  `batch` varchar(50) DEFAULT NULL,
  `qty` decimal(10,2) NOT NULL,
  `available_qty` decimal(10,2) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `challan_no` varchar(50) DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_id`),
  KEY `FK_stock_entry_material_master` (`material_id`),
  KEY `FK_stock_entry_vendor_master` (`vendor_id`),
  KEY `FK_stock_entry_branch_master` (`branch_id`),
  CONSTRAINT `FK_stock_entry_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_stock_entry_material_master` FOREIGN KEY (`material_id`) REFERENCES `material_master` (`material_id`),
  CONSTRAINT `FK_stock_entry_vendor_master` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_master` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.stock_entry: ~29 rows (approximately)
/*!40000 ALTER TABLE `stock_entry` DISABLE KEYS */;
INSERT INTO `stock_entry` (`stock_id`, `parent_stock_id`, `branch_id`, `material_id`, `vendor_id`, `action_date`, `challan_date`, `bill_date`, `entry_type`, `batch`, `qty`, `available_qty`, `purchase_price`, `challan_no`, `bill_no`, `mfg_date`, `exp_date`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 0, 2, 1, 1, '2016-04-29', '2016-03-28', '2016-03-28', 'PURCHASED', 'AZ1001', 100.00, 50.00, 100.50, '86/123', '86-1233', '2016-01-31', '2018-01-31', NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:32', 'ashish', '2016-04-20 06:55:34'),
	(2, 0, 2, 1, 2, '2016-03-28', '2016-03-28', NULL, 'NEW', 'AB1001', 100.00, 0.00, 100.00, '86/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:32', NULL, '2016-04-20 06:55:39'),
	(3, 0, 2, 2, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'PURCHASED', 'AA1001', 100.00, 100.00, 10.00, '86/123', '86-124', NULL, NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:32', NULL, '2016-04-20 06:55:38'),
	(4, 0, 2, 1, 1, '2016-03-30', '2016-03-30', NULL, 'NEW', 'AZ1002', 10.00, 0.00, 100.00, '86/125', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:33', NULL, '2016-04-20 06:55:35'),
	(5, 0, 2, 1, 2, '2016-03-30', '2016-03-30', '2016-03-30', 'PURCHASED', 'AB1002', 20.00, 0.00, 100.10, '86/125', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:33', NULL, '2016-04-20 06:55:39'),
	(6, 0, 2, 2, 1, '2016-03-30', '2016-03-30', '2016-03-30', 'PURCHASED', 'AA1002', 30.00, 0.00, 10.10, '86/126', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:33', NULL, '2016-04-20 06:55:39'),
	(7, 1, 2, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'STOCK_RETURN', 'AZ1001', 20.00, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:33', NULL, NULL),
	(8, 1, 2, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'STOCK_RETURN', 'AZ1001', 20.00, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:33', NULL, NULL),
	(9, 2, 2, 1, 2, '2016-03-28', '2016-03-28', NULL, 'TRANSFER', 'AB1001', 20.00, 0.00, 100.00, '86/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, NULL),
	(10, 2, 1, 1, 2, '2016-03-28', '2016-03-28', NULL, 'TRANSFER', 'AB1001', 20.00, 20.00, 100.00, '86/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, NULL),
	(11, 1, 2, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'TRANSFER', 'AZ1001', 20.00, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, NULL),
	(12, 1, 1, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'TRANSFER', 'AZ1001', 20.00, 10.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, '2016-04-20 06:55:34'),
	(13, 12, 1, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'TRANSFER_RETURN', 'AZ1001', 10.00, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, NULL),
	(14, 12, 2, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'TRANSFER_RETURN', 'AZ1001', 10.00, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, NULL),
	(15, 0, 2, 1, 1, '2016-01-28', '2016-01-28', NULL, 'OPENING', 'MZ1001', 100.00, 0.00, 100.50, '80/123', NULL, '2015-01-31', '2018-01-31', NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, '2016-04-20 06:55:39'),
	(16, 0, 2, 1, 2, '2016-01-28', '2016-01-28', NULL, 'OPENING', 'MB1001', 100.00, 0.00, 100.50, '80/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, '2016-04-20 06:55:39'),
	(17, 0, 2, 2, 1, '2016-01-28', '2016-01-28', '2016-03-28', 'OPENING', 'MA1001', 100.00, 0.00, 9.00, '80/123', '80-124', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, '2016-04-20 06:55:39'),
	(18, 0, 2, 4, 1, '2016-04-28', '2016-04-02', NULL, 'MISC', 'NOT_APPLICABLE', 0.00, 0.00, 1050.00, '86/12435', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:35', NULL, NULL),
	(19, 0, 2, 1, 2, '2016-04-28', '2016-04-02', '2016-04-30', 'PURCHASED', 'AC1002', 2000.00, 2000.00, 100.10, '86/125', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:35', NULL, NULL),
	(20, 0, 2, 2, 1, '2016-04-28', '2016-04-02', '2016-04-30', 'PURCHASED', 'AC1002', 3000.00, 3000.00, 10.10, '86/126', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:35', NULL, NULL),
	(21, 2, 2, 1, 2, '2016-04-20', '2016-03-28', NULL, 'YR_CLOSE_OPENING', 'AB1001', 80.00, 80.00, 100.00, '86/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:32', NULL, '2016-04-20 06:55:34'),
	(22, 5, 2, 1, 2, '2016-04-20', '2016-03-30', '2016-03-30', 'YR_CLOSE_OPENING', 'AB1002', 11.00, 11.00, 100.10, '86/125', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:33', NULL, '2016-04-20 06:55:35'),
	(23, 6, 2, 2, 1, '2016-04-20', '2016-03-30', '2016-03-30', 'YR_CLOSE_OPENING', 'AA1002', 30.00, 30.00, 10.10, '86/126', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:33', NULL, NULL),
	(24, 15, 2, 1, 1, '2016-04-20', '2016-01-28', NULL, 'YR_CLOSE_OPENING', 'MZ1001', 100.00, 100.00, 100.50, '80/123', NULL, '2015-01-31', '2018-01-31', NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, NULL),
	(25, 16, 2, 1, 2, '2016-04-20', '2016-01-28', NULL, 'YR_CLOSE_OPENING', 'MB1001', 100.00, 100.00, 100.50, '80/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, NULL),
	(26, 17, 2, 2, 1, '2016-04-20', '2016-01-28', '2016-03-28', 'YR_CLOSE_OPENING', 'MA1001', 100.00, 100.00, 9.00, '80/123', '80-124', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:34', NULL, NULL),
	(27, 0, 2, 1, 1, '2016-04-20', '2016-04-20', NULL, 'NEW', 'AZ1002', 10.00, 10.00, 100.00, '86/125', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:39', NULL, NULL),
	(28, 0, 2, 1, 2, '2016-04-20', '2016-04-20', '2016-04-20', 'PURCHASED', 'AB1002', 20.00, 20.00, 100.10, '86/125', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:39', NULL, NULL),
	(29, 0, 2, 2, 1, '2016-04-20', '2016-04-20', '2016-04-20', 'PURCHASED', 'AA1002', 30.00, 30.00, 10.10, '86/126', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:39', NULL, NULL);
/*!40000 ALTER TABLE `stock_entry` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.stock_return
DROP TABLE IF EXISTS `stock_return`;
CREATE TABLE IF NOT EXISTS `stock_return` (
  `stock_return_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_return_id`),
  KEY `FK_stock_return_stock_entry` (`stock_id`),
  CONSTRAINT `FK_stock_return_stock_entry` FOREIGN KEY (`stock_id`) REFERENCES `stock_entry` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.stock_return: ~0 rows (approximately)
/*!40000 ALTER TABLE `stock_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_return` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.stock_sell
DROP TABLE IF EXISTS `stock_sell`;
CREATE TABLE IF NOT EXISTS `stock_sell` (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_remarks` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sell_id`),
  KEY `FK_stock_sell_material_tran_hrd` (`tran_id`),
  KEY `FK_stock_sell_retail_customer_master` (`customer_id`),
  CONSTRAINT `FK_stock_sell_material_tran_hrd` FOREIGN KEY (`tran_id`) REFERENCES `material_tran_hrd` (`tran_id`),
  CONSTRAINT `FK_stock_sell_retail_customer_master` FOREIGN KEY (`customer_id`) REFERENCES `retail_customer_master` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.stock_sell: ~0 rows (approximately)
/*!40000 ALTER TABLE `stock_sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_sell` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.transaction_payment
DROP TABLE IF EXISTS `transaction_payment`;
CREATE TABLE IF NOT EXISTS `transaction_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `gl_tran_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `action_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_type` varchar(50) NOT NULL COMMENT 'Cash, Card, Credit, Advance',
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `FK_transaction_payment_gl_ledger_hrd` (`gl_tran_id`),
  KEY `FK_transaction_payment_branch_master` (`branch_id`),
  CONSTRAINT `FK_transaction_payment_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_transaction_payment_gl_ledger_hrd` FOREIGN KEY (`gl_tran_id`) REFERENCES `gl_ledger_hrd` (`gl_tran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.transaction_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `transaction_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_payment` ENABLE KEYS */;


-- Dumping structure for procedure retail_unittest.truncateTables
DROP PROCEDURE IF EXISTS `truncateTables`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `truncateTables`()
BEGIN

  DECLARE n INT DEFAULT 0;
  DECLARE i INT DEFAULT 0;
  DECLARE q VARCHAR(2000);
  
  DROP TEMPORARY TABLE IF EXISTS tempTbl;
  CREATE TEMPORARY TABLE IF NOT EXISTS tempTbl  (
    `query` VARCHAR(50)
  );
  
	INSERT INTO tempTbl SELECT CONCAT('truncate table ',table_name,';')
	FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA = 'retail_unittest'
	AND TABLE_TYPE = 'BASE TABLE';
	
	SELECT COUNT(*) FROM tempTbl INTO n;
	SET i=0;
	
	SET FOREIGN_KEY_CHECKS=0;
	WHILE i<n DO 
	  	SELECT query into @q FROM tempTbl LIMIT i,1;
	  	PREPARE stmt3 FROM @q;
		EXECUTE stmt3;
		DEALLOCATE PREPARE stmt3;
	  	SET i = i + 1;
	END WHILE;
	SET FOREIGN_KEY_CHECKS=1;
END//
DELIMITER ;


-- Dumping structure for table retail_unittest.vat_reg_no
DROP TABLE IF EXISTS `vat_reg_no`;
CREATE TABLE IF NOT EXISTS `vat_reg_no` (
  `vat_id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_registration_no` varchar(50) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vat_id`),
  KEY `FK_vat_reg_no_branch_master` (`branch_id`),
  CONSTRAINT `FK_vat_reg_no_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.vat_reg_no: ~2 rows (approximately)
/*!40000 ALTER TABLE `vat_reg_no` DISABLE KEYS */;
INSERT INTO `vat_reg_no` (`vat_id`, `vat_registration_no`, `branch_id`, `start_date`, `end_date`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, '1234A', 2, '2015-04-28', NULL, 'Y', NULL, 'ashish', '2016-04-20 06:55:29', 'ashish', '2016-04-20 06:55:30'),
	(2, '1234A', 2, '2015-03-28', NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:29', NULL, NULL);
/*!40000 ALTER TABLE `vat_reg_no` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.vendor_master
DROP TABLE IF EXISTS `vendor_master`;
CREATE TABLE IF NOT EXISTS `vendor_master` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `vendor_name` varchar(50) NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) DEFAULT NULL,
  `pin` varchar(50) NOT NULL,
  `phone1` varchar(15) NOT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vendor_id`),
  KEY `FK_vendor_master_branch_master` (`branch_id`),
  CONSTRAINT `FK_vendor_master_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.vendor_master: ~3 rows (approximately)
/*!40000 ALTER TABLE `vendor_master` DISABLE KEYS */;
INSERT INTO `vendor_master` (`vendor_id`, `branch_id`, `vendor_name`, `address_line1`, `address_line2`, `pin`, `phone1`, `phone2`, `email1`, `email2`, `website`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, 'CTS', 'Kolkata', NULL, '743502', '9830525559', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:26', 'ashish', '2016-04-20 06:55:26'),
	(2, 2, 'TCS', 'Kolkata', NULL, '712708', '9830525559', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-04-20 06:55:26', NULL, NULL),
	(3, 2, 'TECHMAHINDRA', 'Kolkata', NULL, '712708', '9830525559', NULL, NULL, NULL, NULL, 'Y', NULL, 'ashish', '2016-04-20 06:55:26', 'ashish', '2016-04-20 06:55:37');
/*!40000 ALTER TABLE `vendor_master` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
