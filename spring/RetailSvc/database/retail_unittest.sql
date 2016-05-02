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


-- Dumping structure for table retail_unittest.accounts
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `account_no` varchar(15) DEFAULT NULL,
  `account_type` varchar(10) NOT NULL COMMENT 'Creditor Debtor account',
  `action_date` date NOT NULL,
  `active_ind` varchar(4) DEFAULT NULL,
  `last_used_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  KEY `FK_accounts_branch_master` (`branch_id`),
  CONSTRAINT `FK_accounts_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.accounts: ~5 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`account_id`, `branch_id`, `account_no`, `account_type`, `action_date`, `active_ind`, `last_used_date`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, NULL, 'CRDR', '2016-05-02', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL),
	(2, 2, NULL, 'CRDR', '2016-05-02', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL),
	(3, 2, NULL, 'CRDR', '2016-05-02', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:13', NULL, NULL),
	(4, 2, NULL, 'SB', '2016-04-29', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:13', NULL, NULL),
	(5, 2, NULL, 'FD', '2016-04-29', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', NULL, NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.bank_master
DROP TABLE IF EXISTS `bank_master`;
CREATE TABLE IF NOT EXISTS `bank_master` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(50) NOT NULL,
  `gl_mas_code` int(11) NOT NULL,
  `bank_address` varchar(50) DEFAULT NULL,
  `phone1` varchar(15) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remarks` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bank_id`),
  UNIQUE KEY `bank_name` (`bank_name`),
  KEY `FK_bank_master_gl_master` (`gl_mas_code`),
  CONSTRAINT `FK_bank_master_gl_master` FOREIGN KEY (`gl_mas_code`) REFERENCES `gl_master` (`gl_mas_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.bank_master: ~2 rows (approximately)
/*!40000 ALTER TABLE `bank_master` DISABLE KEYS */;
INSERT INTO `bank_master` (`bank_id`, `bank_name`, `gl_mas_code`, `bank_address`, `phone1`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remarks`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 'SBI', 11100, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(2, 'UBI', 11200, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL);
/*!40000 ALTER TABLE `bank_master` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.bill_master
DROP TABLE IF EXISTS `bill_master`;
CREATE TABLE IF NOT EXISTS `bill_master` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `bill_no` varchar(50) NOT NULL,
  `tran_type` varchar(20) NOT NULL COMMENT 'Purchase/Sell',
  `bill_date` date NOT NULL,
  `action_date` date DEFAULT NULL,
  `bill_amt` decimal(10,2) NOT NULL,
  `vat_amt` decimal(10,2) DEFAULT NULL,
  `discount_amt` decimal(10,2) DEFAULT NULL,
  `gross_total` decimal(10,2) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(4) DEFAULT NULL,
  `passing_auth_ind` varchar(255) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.bill_master: ~0 rows (approximately)
/*!40000 ALTER TABLE `bill_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_master` ENABLE KEYS */;


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
	(1, 0, 'Kalipur', 'Kalipur', '12345743', '87656321', 'coop_kalipur', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '9830525559', NULL, NULL, '2015-12-18', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:11', 'ashish', NULL),
	(2, 1, 'Janai', 'Janai', '12345678', '87654321', 'coop_janai', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '9830625559', NULL, NULL, '2015-12-18', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:11', NULL, NULL);
/*!40000 ALTER TABLE `branch_master` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.card_register
DROP TABLE IF EXISTS `card_register`;
CREATE TABLE IF NOT EXISTS `card_register` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
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
  KEY `FK_card_register_branch_master` (`branch_id`),
  CONSTRAINT `FK_card_register_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_card_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.card_register: ~2 rows (approximately)
/*!40000 ALTER TABLE `card_register` DISABLE KEYS */;
INSERT INTO `card_register` (`card_id`, `payment_id`, `branch_id`, `action_date`, `amount`, `card_no`, `card_type`, `card_holder_name`, `valid_month`, `valid_year`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, 2, '2016-04-29', 15.00, '123456789012', 'Credit Card', 'Ashish Kumar Mondal', 0, 0, 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(2, 3, 2, '2016-04-29', 11.00, '123456789013', 'Credit Card', 'Ashish Kumar Mondal', 0, 0, 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20');
/*!40000 ALTER TABLE `card_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.cash_register
DROP TABLE IF EXISTS `cash_register`;
CREATE TABLE IF NOT EXISTS `cash_register` (
  `cash_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
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
  KEY `FK_cash_register_branch_master` (`branch_id`),
  CONSTRAINT `FK_cash_register_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_cash_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.cash_register: ~2 rows (approximately)
/*!40000 ALTER TABLE `cash_register` DISABLE KEYS */;
INSERT INTO `cash_register` (`cash_id`, `payment_id`, `branch_id`, `action_date`, `amount`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 2, '2016-04-29', 20.50, 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(2, 8, 2, '2016-04-29', 400.00, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL);
/*!40000 ALTER TABLE `cash_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.cheque_register
DROP TABLE IF EXISTS `cheque_register`;
CREATE TABLE IF NOT EXISTS `cheque_register` (
  `cheque_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL DEFAULT '0',
  `cheque_no` varchar(50) NOT NULL,
  `cheque_date` date NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `cheque_charge` decimal(10,2) DEFAULT NULL,
  `upper_bank_charge` decimal(10,2) DEFAULT NULL,
  `cheque_clear_date` date DEFAULT NULL,
  `cheque_clear_amt` decimal(10,2) DEFAULT NULL,
  `cheque_bounce_date` date DEFAULT NULL,
  `payable_bank_name` varchar(50) DEFAULT NULL,
  `payable_branch_name` varchar(50) DEFAULT NULL,
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
  KEY `FK_cheque_register_branch_master` (`branch_id`),
  CONSTRAINT `FK_cheque_register_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_cheque_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.cheque_register: ~1 rows (approximately)
/*!40000 ALTER TABLE `cheque_register` DISABLE KEYS */;
INSERT INTO `cheque_register` (`cheque_id`, `payment_id`, `branch_id`, `cheque_no`, `cheque_date`, `amount`, `cheque_charge`, `upper_bank_charge`, `cheque_clear_date`, `cheque_clear_amt`, `cheque_bounce_date`, `payable_bank_name`, `payable_branch_name`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 5, 2, '123456', '2016-04-29', 21.00, 5.00, 5.00, NULL, NULL, NULL, 'SBI', 'Dankuni', 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20');
/*!40000 ALTER TABLE `cheque_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.credit_register
DROP TABLE IF EXISTS `credit_register`;
CREATE TABLE IF NOT EXISTS `credit_register` (
  `credit_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `credit_type` varchar(50) DEFAULT NULL COMMENT 'ADVANCE/CREDIT',
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(255) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`credit_id`),
  KEY `FK_credit_register_transaction_payment` (`payment_id`),
  KEY `FK_credit_register_branch_master` (`branch_id`),
  KEY `FK_credit_register_accounts` (`account_id`),
  CONSTRAINT `FK_credit_register_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `FK_credit_register_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_credit_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.credit_register: ~2 rows (approximately)
/*!40000 ALTER TABLE `credit_register` DISABLE KEYS */;
INSERT INTO `credit_register` (`credit_id`, `payment_id`, `branch_id`, `account_id`, `amount`, `action_date`, `credit_type`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 6, 2, NULL, 21.50, '2016-04-29', 'CREDIT', 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(2, 5, 2, NULL, 21.50, '2016-04-29', 'ADVANCE', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20');
/*!40000 ALTER TABLE `credit_register` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `cif_no` varchar(50) DEFAULT NULL,
  `salute` varchar(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_type` varchar(20) NOT NULL COMMENT 'Running/Member/Non-Member',
  `voter_id` varchar(20) DEFAULT NULL,
  `aadhar_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `driving_licence` varchar(20) DEFAULT NULL,
  `mobile1` varchar(20) DEFAULT NULL,
  `mobile2` varchar(20) DEFAULT NULL,
  `email_id` varchar(20) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `last_used_date` timestamp NULL DEFAULT NULL,
  `active_ind` varchar(4) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `pan_no` (`pan_no`),
  UNIQUE KEY `aadhar_no` (`aadhar_no`),
  KEY `FK_customers_branch_master` (`branch_id`),
  CONSTRAINT `FK_customers_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.customers: ~8 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`customer_id`, `branch_id`, `cif_no`, `salute`, `first_name`, `middle_name`, `last_name`, `customer_name`, `customer_type`, `voter_id`, `aadhar_no`, `pan_no`, `driving_licence`, `mobile1`, `mobile2`, `email_id`, `action_date`, `last_used_date`, `active_ind`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, NULL, 'VENDOR', 'CTS', NULL, NULL, 'VENDOR CTS', 'VENDOR', NULL, NULL, NULL, NULL, '9830525559', NULL, NULL, '2016-05-02', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', 'ashish', '2016-05-02 21:47:13'),
	(2, 2, NULL, 'VENDOR', 'TCS', NULL, NULL, 'VENDOR TCS', 'VENDOR', NULL, NULL, NULL, NULL, '9830525559', NULL, NULL, '2016-05-02', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL),
	(3, 2, NULL, 'VENDOR', 'TECHMAHINDRA', NULL, NULL, 'VENDOR TECHMAHINDRA', 'VENDOR', NULL, NULL, NULL, NULL, '9830525559', NULL, NULL, '2016-05-02', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:13', NULL, NULL),
	(4, 2, NULL, 'MR', 'Ashish', NULL, 'Mondal', 'MR Ashish  Mondal', 'MEMBER', NULL, NULL, NULL, NULL, '9830525559', NULL, NULL, '2016-04-29', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:13', NULL, NULL),
	(5, 2, NULL, 'MR', 'Ujan', NULL, 'Mondal', 'MR Ujan  Mondal', 'NONMEMBER', NULL, NULL, NULL, NULL, '9830625559', NULL, NULL, '2016-04-29', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', NULL, NULL),
	(6, 2, NULL, 'MR', 'Dona', NULL, 'Ghosh', 'MR Dona  Ghosh', 'MEMBER', NULL, NULL, NULL, NULL, '9830525559', NULL, NULL, '2016-04-29', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', NULL, NULL),
	(7, 2, NULL, 'MR', 'Ujan', NULL, 'Mondal', 'MR Ujan  Mondal', 'NONMEMBER', NULL, NULL, 'AAZPP1111P', NULL, '9830525559', NULL, NULL, '2016-04-29', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', NULL, NULL),
	(8, 2, NULL, 'MR', 'Rajesh', NULL, 'Karmakar', 'MR Rajesh  Karmakar', 'RUNNING', NULL, NULL, NULL, NULL, '9830525559', NULL, NULL, '2016-04-29', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.customer_accounts
DROP TABLE IF EXISTS `customer_accounts`;
CREATE TABLE IF NOT EXISTS `customer_accounts` (
  `customer_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `primary_holder_ind` varchar(4) NOT NULL,
  `action_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_account_id`),
  KEY `FK_customer_accounts_branch_master` (`branch_id`),
  KEY `FK_customer_accounts_customers` (`customer_id`),
  KEY `FK_customer_accounts_accounts` (`account_id`),
  CONSTRAINT `FK_customer_accounts_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `FK_customer_accounts_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_customer_accounts_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.customer_accounts: ~7 rows (approximately)
/*!40000 ALTER TABLE `customer_accounts` DISABLE KEYS */;
INSERT INTO `customer_accounts` (`customer_account_id`, `customer_id`, `account_id`, `branch_id`, `primary_holder_ind`, `action_date`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 1, 2, 'N', '2016-05-02', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL),
	(2, 2, 2, 2, 'N', '2016-05-02', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL),
	(3, 3, 3, 2, 'N', '2016-05-02', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:13', NULL, NULL),
	(4, 4, 4, 2, 'Y', '2016-04-29', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', NULL, NULL),
	(5, 5, 4, 2, 'N', '2016-04-29', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', NULL, NULL),
	(6, 6, 5, 2, 'Y', '2016-04-29', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', NULL, NULL),
	(7, 7, 5, 2, 'Y', '2016-04-29', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', NULL, NULL);
/*!40000 ALTER TABLE `customer_accounts` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.denomination_register
DROP TABLE IF EXISTS `denomination_register`;
CREATE TABLE IF NOT EXISTS `denomination_register` (
  `deno_id` int(11) NOT NULL AUTO_INCREMENT,
  `cash_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `note_coin` varchar(50) DEFAULT NULL COMMENT 'Note or Coin',
  `denomination` int(11) DEFAULT NULL COMMENT 'Rs 50 or 100 or Coin Re1 etc',
  `note_coin_count` int(11) DEFAULT NULL COMMENT 'Number of note or coins',
  `note_coin_amount` decimal(10,2) DEFAULT NULL COMMENT '=denomination * note_coin_count',
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deno_id`),
  KEY `FK_denomination_register_cash_register` (`cash_id`),
  KEY `FK_denomination_register_branch_master` (`branch_id`),
  CONSTRAINT `FK_denomination_register_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_denomination_register_cash_register` FOREIGN KEY (`cash_id`) REFERENCES `cash_register` (`cash_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.denomination_register: ~0 rows (approximately)
/*!40000 ALTER TABLE `denomination_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `denomination_register` ENABLE KEYS */;


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
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
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
INSERT INTO `fy_close` (`fy_id`, `fy`, `branch_id`, `start_date`, `end_date`, `is_closed`, `year_closed_on`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, '2015-2016', 2, '2015-04-01 00:00:00', '2016-03-31 23:59:59', 1, '2016-05-02 21:47:20', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, '2016-05-02 21:47:20');
/*!40000 ALTER TABLE `fy_close` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_header
DROP TABLE IF EXISTS `gl_header`;
CREATE TABLE IF NOT EXISTS `gl_header` (
  `gl_header_code` int(11) NOT NULL,
  `gl_header_desc` varchar(100) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gl_header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.gl_header: ~5 rows (approximately)
/*!40000 ALTER TABLE `gl_header` DISABLE KEYS */;
INSERT INTO `gl_header` (`gl_header_code`, `gl_header_desc`, `status`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(11000, 'share capital1', 'LA', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL),
	(18000, 'miscellaneous current libilities', 'PU', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL),
	(34000, 'purchase trading commodities', 'PU', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL),
	(37000, 'trade charges', 'PU', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL),
	(44000, 'other trading income', 'SA', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL);
/*!40000 ALTER TABLE `gl_header` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_ledger_dtls
DROP TABLE IF EXISTS `gl_ledger_dtls`;
CREATE TABLE IF NOT EXISTS `gl_ledger_dtls` (
  `gl_tran_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `gl_tran_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `gl_mas_code` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `dr_cr` varchar(10) NOT NULL,
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
  KEY `FK_gl_ledger_dtls_gl_ledger_hrd` (`gl_tran_id`),
  KEY `FK_gl_ledger_dtls_branch_master` (`branch_id`),
  KEY `FK_gl_ledger_dtls_gl_master` (`gl_mas_code`),
  KEY `FK_gl_ledger_dtls_accounts` (`account_id`),
  CONSTRAINT `FK_gl_ledger_dtls_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `FK_gl_ledger_dtls_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_gl_ledger_dtls_gl_ledger_hrd` FOREIGN KEY (`gl_tran_id`) REFERENCES `gl_ledger_hrd` (`gl_tran_id`),
  CONSTRAINT `FK_gl_ledger_dtls_gl_master` FOREIGN KEY (`gl_mas_code`) REFERENCES `gl_master` (`gl_mas_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='This table holds credit and debit part of any transaction';

-- Dumping data for table retail_unittest.gl_ledger_dtls: ~15 rows (approximately)
/*!40000 ALTER TABLE `gl_ledger_dtls` DISABLE KEYS */;
INSERT INTO `gl_ledger_dtls` (`gl_tran_dtl_id`, `gl_tran_id`, `branch_id`, `gl_mas_code`, `account_id`, `amount`, `dr_cr`, `remarks`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passin_auth_remarks`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 2, 34112, NULL, 100.50, 'Cr', 'CTS-LUBRICANT-CASTROL', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(2, 1, 2, 34113, NULL, 21.50, 'Cr', 'CTS-PARTSANDMATERIALS-SEATCOVER', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(3, 1, 2, 18803, NULL, 10.00, 'Cr', 'VAT', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(4, 1, 2, 37908, NULL, 0.50, 'Cr', 'DISCOUNT', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(5, 1, 2, 11100, NULL, 20.50, 'Cr', NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(6, 1, 2, 11200, NULL, 15.00, 'Cr', NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(7, 1, 2, 11200, NULL, 11.00, 'Cr', NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(8, 1, 2, 11400, NULL, 21.50, 'Cr', NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(9, 1, 2, 11400, NULL, 21.50, 'Cr', NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(10, 1, 2, 11500, NULL, 21.00, 'Cr', NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(11, 1, 2, 11300, NULL, 21.50, 'Cr', NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(12, 2, 2, 44114, NULL, 390.00, 'Dr', 'BILLAMT', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL),
	(13, 2, 2, 18803, NULL, 10.50, 'Dr', 'VAT', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL),
	(14, 2, 2, 44104, NULL, 0.50, 'Dr', 'DISCOUNT', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL),
	(15, 2, 2, 11100, NULL, 400.00, 'Cr', NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL);
/*!40000 ALTER TABLE `gl_ledger_dtls` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_ledger_hrd
DROP TABLE IF EXISTS `gl_ledger_hrd`;
CREATE TABLE IF NOT EXISTS `gl_ledger_hrd` (
  `gl_tran_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
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

-- Dumping data for table retail_unittest.gl_ledger_hrd: ~2 rows (approximately)
/*!40000 ALTER TABLE `gl_ledger_hrd` DISABLE KEYS */;
INSERT INTO `gl_ledger_hrd` (`gl_tran_id`, `branch_id`, `tran_no`, `action_date`, `tran_type`, `fy`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, '29042016/1', '2016-04-29', 'PURCHASED', '2016-2017', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(2, 2, '29042016/2', '2016-04-29', 'SALE', '2016-2017', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL);
/*!40000 ALTER TABLE `gl_ledger_hrd` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_master
DROP TABLE IF EXISTS `gl_master`;
CREATE TABLE IF NOT EXISTS `gl_master` (
  `gl_mas_code` int(11) NOT NULL,
  `gl_sub_header_code` int(11) NOT NULL,
  `gl_mas_desc` varchar(150) DEFAULT NULL,
  `annexure_id` int(11) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gl_mas_code`),
  KEY `FK_gl_master_gl_sub_header` (`gl_sub_header_code`),
  CONSTRAINT `FK_gl_master_gl_sub_header` FOREIGN KEY (`gl_sub_header_code`) REFERENCES `gl_sub_header` (`gl_sub_header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.gl_master: ~15 rows (approximately)
/*!40000 ALTER TABLE `gl_master` DISABLE KEYS */;
INSERT INTO `gl_master` (`gl_mas_code`, `gl_sub_header_code`, `gl_mas_desc`, `annexure_id`, `passing_auth_ind`, `passing_auth_remark`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(11100, 11000, 'share (state govt)', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(11200, 11000, 'share (individual)', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(11300, 11000, 'share(self-help groups)', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(11400, 11000, 'share(bccb)', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(11500, 11000, 'share(other)', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(18803, 18800, 'sales tax/vat payable', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(34112, 34100, 'furtiliser purchese ( iffco / kribhco )', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(34113, 34100, 'furtiliser purchese ( other co-operative )', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(34114, 34100, 'furtiliser purchese ( other sources )', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(34115, 34100, 'furtiliser purchese ( other sources )', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(37908, 37900, 'trade discount allowed', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(44104, 44100, 'trade discount received', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL),
	(44112, 44100, 'Payment from member', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(44113, 44100, 'Payment from member', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(44114, 44100, 'Payment from member', 1, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL);
/*!40000 ALTER TABLE `gl_master` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.gl_sub_header
DROP TABLE IF EXISTS `gl_sub_header`;
CREATE TABLE IF NOT EXISTS `gl_sub_header` (
  `gl_sub_header_code` int(11) NOT NULL,
  `gl_header_code` int(11) NOT NULL,
  `gl_sub_header_desc` varchar(100) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gl_sub_header_code`),
  KEY `FK_gl_sub_header_gl_header` (`gl_header_code`),
  CONSTRAINT `FK_gl_sub_header_gl_header` FOREIGN KEY (`gl_header_code`) REFERENCES `gl_header` (`gl_header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.gl_sub_header: ~5 rows (approximately)
/*!40000 ALTER TABLE `gl_sub_header` DISABLE KEYS */;
INSERT INTO `gl_sub_header` (`gl_sub_header_code`, `gl_header_code`, `gl_sub_header_desc`, `passing_auth_ind`, `passing_auth_remark`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(11000, 11000, 'share capital', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL),
	(18800, 18000, 'liabilities against coleection/appropriation', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL),
	(34100, 34000, 'purchese of agricultural inputs', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL),
	(37900, 37000, 'other trade charges', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL),
	(44100, 44000, 'other sales and services', NULL, NULL, NULL, NULL, 'ashish', NULL, NULL, NULL);
/*!40000 ALTER TABLE `gl_sub_header` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.ledger_code_payment
DROP TABLE IF EXISTS `ledger_code_payment`;
CREATE TABLE IF NOT EXISTS `ledger_code_payment` (
  `payment_ledger_id` int(11) NOT NULL AUTO_INCREMENT,
  `gl_code` int(11) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_ledger_id`),
  UNIQUE KEY `payment_type` (`payment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.ledger_code_payment: ~6 rows (approximately)
/*!40000 ALTER TABLE `ledger_code_payment` DISABLE KEYS */;
INSERT INTO `ledger_code_payment` (`payment_ledger_id`, `gl_code`, `payment_type`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 11100, 'CASH', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(2, 11200, 'CARD', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(3, 11300, 'LOAN-OTHERBANK', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(4, 11301, 'LOAN-MIDTERM', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(5, 11400, 'CRDR', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(6, 11500, 'CHEQUE', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL);
/*!40000 ALTER TABLE `ledger_code_payment` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.ledger_code_retail_purchase
DROP TABLE IF EXISTS `ledger_code_retail_purchase`;
CREATE TABLE IF NOT EXISTS `ledger_code_retail_purchase` (
  `retail_ledger_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_grp_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `gl_mas_code` int(11) NOT NULL,
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

-- Dumping data for table retail_unittest.ledger_code_retail_purchase: ~4 rows (approximately)
/*!40000 ALTER TABLE `ledger_code_retail_purchase` DISABLE KEYS */;
INSERT INTO `ledger_code_retail_purchase` (`retail_ledger_code_id`, `material_grp_id`, `vendor_id`, `gl_mas_code`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 1, 34112, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(2, 1, 2, 34113, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(3, 2, 3, 34114, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(4, 3, 3, 34115, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL);
/*!40000 ALTER TABLE `ledger_code_retail_purchase` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.ledger_code_retail_sale
DROP TABLE IF EXISTS `ledger_code_retail_sale`;
CREATE TABLE IF NOT EXISTS `ledger_code_retail_sale` (
  `retail_ledger_code_sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_type` varchar(50) NOT NULL COMMENT 'Member/Non Member/Running Customer etc',
  `gl_mas_code` int(11) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_remark` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`retail_ledger_code_sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.ledger_code_retail_sale: ~3 rows (approximately)
/*!40000 ALTER TABLE `ledger_code_retail_sale` DISABLE KEYS */;
INSERT INTO `ledger_code_retail_sale` (`retail_ledger_code_sale_id`, `customer_type`, `gl_mas_code`, `delete_ind`, `delete_remark`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 'MEMBER', 44112, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(2, 'NONMEMBER', 44113, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL),
	(3, 'RUNNING', 44114, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, NULL);
/*!40000 ALTER TABLE `ledger_code_retail_sale` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.loan_register
DROP TABLE IF EXISTS `loan_register`;
CREATE TABLE IF NOT EXISTS `loan_register` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `account_no` varchar(50) DEFAULT NULL COMMENT 'If loan is issued in other bank',
  `action_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `loan_issuing_bank` varchar(50) NOT NULL,
  `loan_issuing_branch` varchar(50) NOT NULL,
  `tenure` int(11) NOT NULL COMMENT 'Tenure in months',
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`loan_id`),
  KEY `FK_advance_register_transaction_payment` (`payment_id`),
  KEY `FK_advance_register_branch_master` (`branch_id`),
  KEY `FK_loan_register_accounts` (`account_id`),
  CONSTRAINT `FK_advance_register_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_advance_register_transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`),
  CONSTRAINT `FK_loan_register_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.loan_register: ~1 rows (approximately)
/*!40000 ALTER TABLE `loan_register` DISABLE KEYS */;
INSERT INTO `loan_register` (`loan_id`, `payment_id`, `branch_id`, `account_id`, `account_no`, `action_date`, `amount`, `loan_issuing_bank`, `loan_issuing_branch`, `tenure`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 7, 2, NULL, '123-451-12', '2016-04-29', 21.50, 'SBI', 'Dankuni', 80, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20');
/*!40000 ALTER TABLE `loan_register` ENABLE KEYS */;


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
	(1, 1, 'LUBRICANT', 'Lubricant (Engine Oil)', NULL, NULL, 'ashish', '2016-05-02 21:47:11', NULL, NULL),
	(2, 1, 'PARTSANDMATERIALS', 'Parts and Materials', NULL, NULL, 'ashish', '2016-05-02 21:47:11', NULL, NULL),
	(3, 1, 'PESTISIDES', 'Pestisides', 'Y', NULL, 'ashish', '2016-05-02 21:47:11', 'ashish', '2016-05-02 21:47:19');
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
  UNIQUE KEY `material_name` (`material_name`),
  KEY `FK_material_master_material_group` (`material_grp_id`),
  CONSTRAINT `FK_material_master_material_group` FOREIGN KEY (`material_grp_id`) REFERENCES `material_group` (`material_grp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.material_master: ~4 rows (approximately)
/*!40000 ALTER TABLE `material_master` DISABLE KEYS */;
INSERT INTO `material_master` (`material_id`, `material_name`, `material_description`, `material_grp_id`, `uom`, `mrp`, `stock_in`, `stock_out`, `stock_balance`, `low_stock_level`, `qty_check_required_ind`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 'CASTROL', 'Castrol Engine oil', 1, 'ml', 100.00, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL),
	(2, 'SEATCOVER', 'Seat Cover', 2, 'pcs', 1000.00, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL),
	(3, 'LONGSEATCOVER', 'Long Seat Cover', 2, 'pcs', 10.00, NULL, NULL, NULL, NULL, 'Y', 'Y', NULL, 'ashish', '2016-05-02 21:47:12', 'ashish', '2016-05-02 21:47:19'),
	(4, 'FREIGHT CHARGES', 'Freight Charges', 2, 'pcs', 1000.00, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL);
/*!40000 ALTER TABLE `material_master` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.material_tran_dtl
DROP TABLE IF EXISTS `material_tran_dtl`;
CREATE TABLE IF NOT EXISTS `material_tran_dtl` (
  `tran_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
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
  KEY `FK_material_tran_dtl_branch_master` (`branch_id`),
  CONSTRAINT `FK_material_tran_dtl_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_material_tran_dtl_material_tran_hrd` FOREIGN KEY (`tran_id`) REFERENCES `material_tran_hrd` (`tran_id`),
  CONSTRAINT `FK_material_tran_dtl_stock_entry` FOREIGN KEY (`stock_id`) REFERENCES `stock_entry` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Materials to be sold will be saved in this table and its parent table material_tran_hrd table.\r\nThe purchased stock will not be saved in this table. It will be saved only in material_tran_hrd table';

-- Dumping data for table retail_unittest.material_tran_dtl: ~0 rows (approximately)
/*!40000 ALTER TABLE `material_tran_dtl` DISABLE KEYS */;
INSERT INTO `material_tran_dtl` (`tran_dtl_id`, `tran_id`, `stock_id`, `branch_id`, `qty`, `rate`, `total`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `end_date`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, 1, 2, 50.00, 12.00, 600.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', 'ashish', '2016-05-02 21:47:18'),
	(2, 2, 15, 2, 100.00, 12.00, 1200.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(3, 2, 19, 2, 852.00, 12.00, 10224.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(4, 2, 1, 2, 10.00, 13.00, 130.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', 'ashish', '2016-05-02 21:47:18'),
	(5, 2, 3, 2, 10.00, 14.00, 140.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', 'ashish', '2016-05-02 21:47:17');
/*!40000 ALTER TABLE `material_tran_dtl` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.material_tran_hrd
DROP TABLE IF EXISTS `material_tran_hrd`;
CREATE TABLE IF NOT EXISTS `material_tran_hrd` (
  `tran_id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_no` varchar(50) DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tran_type` enum('SALE','PURCHASED') DEFAULT NULL COMMENT 'op=Opening, s=sale',
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
  KEY `FK_material_tran_hrd_customers` (`customer_id`),
  CONSTRAINT `FK_material_tran_hrd_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_material_tran_hrd_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.material_tran_hrd: ~2 rows (approximately)
/*!40000 ALTER TABLE `material_tran_hrd` DISABLE KEYS */;
INSERT INTO `material_tran_hrd` (`tran_id`, `tran_no`, `branch_id`, `customer_id`, `tran_type`, `action_date`, `bill_no`, `bill_date`, `bill_amt`, `vat`, `discount`, `gross_total`, `paid_amt`, `outstanding_amt`, `paid_by`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, '29042016/1', 2, 1, 'PURCHASED', '2016-04-29', '86-1233', '2016-03-28', 122.00, 10.00, 0.50, 132.00, 132.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, NULL),
	(2, '29042016/2', 2, 8, 'SALE', '2016-04-29', '86-1239', '2016-04-29', 390.00, 10.50, 0.50, 400.00, 400.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL);
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
	(1, 2, 0, 'ASHISH MONDAL', 'Running', 'Kalipur', NULL, '712708', '9830625559', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:14', 'ashish', '2016-05-02 21:47:14'),
	(2, 2, 0, 'DONA MONDAL', 'Member', 'Kalipur', NULL, '712708', '9830625559', NULL, NULL, NULL, NULL, 'Y', NULL, 'ashish', '2016-05-02 21:47:14', 'ashish', '2016-05-02 21:47:19');
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
	(1, 2, _binary 0x7B0D0A2020226272616E63684265616E223A207B0D0A20202020226272616E63684964223A20322C0D0A2020202022646F63756D656E7473223A205B0D0A2020202020207B0D0A202020202020202022646F634964223A20302C0D0A2020202020202020226272616E6368496422203A20322C0D0A202020202020202022646F6354797065223A20226A736F6E222C0D0A2020202020202020227469746C6522203A20225465737420446F63756D656E74222C0D0A20202020202020202263726561746555736572223A2022617368697368220D0A2020202020207D0D0A202020205D0D0A20207D0D0A7D, 'Test Document', 'json', 235, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL);
/*!40000 ALTER TABLE `retail_document` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.retail_payment
DROP TABLE IF EXISTS `retail_payment`;
CREATE TABLE IF NOT EXISTS `retail_payment` (
  `retail_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
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
  KEY `FK_retail_payment_branch_master` (`branch_id`),
  CONSTRAINT `FK__material_tran_hrd` FOREIGN KEY (`tran_id`) REFERENCES `material_tran_hrd` (`tran_id`),
  CONSTRAINT `FK__transaction_payment` FOREIGN KEY (`payment_id`) REFERENCES `transaction_payment` (`payment_id`),
  CONSTRAINT `FK_retail_payment_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='This table maintain the payment details for a given retail transaction';

-- Dumping data for table retail_unittest.retail_payment: ~8 rows (approximately)
/*!40000 ALTER TABLE `retail_payment` DISABLE KEYS */;
INSERT INTO `retail_payment` (`retail_payment_id`, `tran_id`, `payment_id`, `branch_id`, `action_date`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 1, 2, '2016-04-29', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(2, 1, 2, 2, '2016-04-29', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(3, 1, 3, 2, '2016-04-29', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(4, 1, 4, 2, '2016-04-29', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(5, 1, 5, 2, '2016-04-29', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(6, 1, 6, 2, '2016-04-29', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(7, 1, 7, 2, '2016-04-29', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(8, 2, 8, 2, '2016-04-29', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL);
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
	(1, 2, 1, '2016-04-30', 200.00, 'Y', 'Rate updated', NULL, NULL, 'ashish', '2016-05-02 21:47:13', 'ashish', '2016-05-02 21:47:13'),
	(2, 2, 2, '2016-03-19', 200.00, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:13', NULL, NULL),
	(3, 2, 1, '2016-03-20', 200.00, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:13', NULL, NULL);
/*!40000 ALTER TABLE `retail_rate_chart` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.retail_transactions
DROP TABLE IF EXISTS `retail_transactions`;
CREATE TABLE IF NOT EXISTS `retail_transactions` (
  `retail_tran_id` int(11) NOT NULL AUTO_INCREMENT,
  `gl_tran_id` int(11) NOT NULL,
  `tran_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
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
  KEY `FK_retail_transactions_branch_master` (`branch_id`),
  CONSTRAINT `FK_retail_gl_ledger_gl_ledger_hrd` FOREIGN KEY (`gl_tran_id`) REFERENCES `gl_ledger_hrd` (`gl_tran_id`),
  CONSTRAINT `FK_retail_gl_ledger_material_tran_hrd` FOREIGN KEY (`tran_id`) REFERENCES `material_tran_hrd` (`tran_id`),
  CONSTRAINT `FK_retail_transactions_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='This table identifies the retail related transactions in gl_ledger_hrd table';

-- Dumping data for table retail_unittest.retail_transactions: ~2 rows (approximately)
/*!40000 ALTER TABLE `retail_transactions` DISABLE KEYS */;
INSERT INTO `retail_transactions` (`retail_tran_id`, `gl_tran_id`, `tran_id`, `branch_id`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 1, 2, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(2, 2, 2, 2, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL);
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
  `qty_under_booking` decimal(10,2) DEFAULT NULL COMMENT 'While selling, if quantity is booked then available stock has to be reduced. This locking qty has to be locked',
  `qty_under_booking_time` timestamp NULL DEFAULT NULL COMMENT 'While selling, if quantity is booked then available stock has to be reduced. After five minute the lock will be cancelled',
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
INSERT INTO `stock_entry` (`stock_id`, `parent_stock_id`, `branch_id`, `material_id`, `vendor_id`, `action_date`, `challan_date`, `bill_date`, `entry_type`, `batch`, `qty`, `qty_under_booking`, `qty_under_booking_time`, `available_qty`, `purchase_price`, `challan_no`, `bill_no`, `mfg_date`, `exp_date`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 0, 2, 1, 1, '2016-04-29', '2016-03-28', '2016-03-28', 'PURCHASED', 'AZ1001', 100.00, NULL, NULL, 50.00, 100.50, '86/123', '86-1233', '2016-01-31', '2018-01-31', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', 'ashish', '2016-05-02 21:47:18'),
	(2, 0, 2, 1, 2, '2016-03-28', '2016-03-28', NULL, 'NEW', 'AB1001', 100.00, NULL, NULL, 0.00, 100.00, '86/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, '2016-05-02 21:47:20'),
	(3, 0, 2, 2, 1, '2016-04-29', '2016-03-28', '2016-03-28', 'PURCHASED', 'AA1001', 100.00, NULL, NULL, 100.00, 21.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', 'ashish', '2016-05-02 21:47:17'),
	(4, 0, 2, 1, 1, '2016-03-30', '2016-03-30', NULL, 'NEW', 'AZ1002', 10.00, NULL, NULL, 10.00, 100.00, '86/125', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:19'),
	(5, 0, 2, 1, 2, '2016-03-30', '2016-03-30', '2016-03-30', 'PURCHASED', 'AB1002', 20.00, NULL, NULL, 0.00, 100.10, '86/125', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(6, 0, 2, 2, 1, '2016-03-30', '2016-03-30', '2016-03-30', 'PURCHASED', 'AA1002', 30.00, NULL, NULL, 0.00, 10.10, '86/126', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(7, 1, 2, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'STOCK_RETURN', 'AZ1001', 20.00, NULL, NULL, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, NULL),
	(8, 1, 2, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'STOCK_RETURN', 'AZ1001', 20.00, NULL, NULL, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(9, 2, 2, 1, 2, '2016-03-28', '2016-03-28', NULL, 'TRANSFER', 'AB1001', 20.00, NULL, NULL, 0.00, 100.00, '86/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(10, 2, 1, 1, 2, '2016-03-28', '2016-03-28', NULL, 'TRANSFER', 'AB1001', 20.00, NULL, NULL, 20.00, 100.00, '86/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(11, 1, 2, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'TRANSFER', 'AZ1001', 20.00, NULL, NULL, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(12, 1, 1, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'TRANSFER', 'AZ1001', 20.00, NULL, NULL, 10.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, '2016-05-02 21:47:18'),
	(13, 12, 1, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'TRANSFER_RETURN', 'AZ1001', 10.00, NULL, NULL, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(14, 12, 2, 1, 1, '2016-03-28', '2016-03-28', '2016-03-28', 'TRANSFER_RETURN', 'AZ1001', 10.00, NULL, NULL, 0.00, 100.50, '86/123', '86-1233', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(15, 0, 2, 1, 1, '2016-01-28', '2016-01-28', NULL, 'OPENING', 'MZ1001', 100.00, NULL, NULL, 0.00, 100.50, '80/123', NULL, '2015-01-31', '2018-01-31', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, '2016-05-02 21:47:20'),
	(16, 0, 2, 1, 2, '2016-01-28', '2016-01-28', NULL, 'OPENING', 'MB1001', 100.00, NULL, NULL, 0.00, 100.50, '80/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, '2016-05-02 21:47:20'),
	(17, 0, 2, 2, 1, '2016-01-28', '2016-01-28', '2016-03-28', 'OPENING', 'MA1001', 100.00, NULL, NULL, 0.00, 9.00, '80/123', '80-124', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, '2016-05-02 21:47:20'),
	(18, 0, 2, 4, 1, '2016-04-28', '2016-04-02', NULL, 'MISC', 'NOT_APPLICABLE', 0.00, NULL, NULL, 0.00, 1050.00, '86/12435', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(19, 0, 2, 1, 2, '2016-04-28', '2016-04-02', '2016-04-30', 'PURCHASED', 'AC1002', 2000.00, NULL, NULL, 2000.00, 100.10, '86/125', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(20, 0, 2, 2, 1, '2016-04-28', '2016-04-02', '2016-04-30', 'PURCHASED', 'AC1002', 3000.00, NULL, NULL, 3000.00, 10.10, '86/126', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(21, 2, 2, 1, 2, '2016-05-02', '2016-03-28', NULL, 'YR_CLOSE_OPENING', 'AB1001', 80.00, NULL, NULL, 80.00, 100.00, '86/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:16', NULL, '2016-05-02 21:47:18'),
	(22, 5, 2, 1, 2, '2016-05-02', '2016-03-30', '2016-03-30', 'YR_CLOSE_OPENING', 'AB1002', 20.00, NULL, NULL, 20.00, 100.10, '86/125', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, NULL),
	(23, 6, 2, 2, 1, '2016-05-02', '2016-03-30', '2016-03-30', 'YR_CLOSE_OPENING', 'AA1002', 30.00, NULL, NULL, 30.00, 10.10, '86/126', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, NULL),
	(24, 15, 2, 1, 1, '2016-05-02', '2016-01-28', NULL, 'YR_CLOSE_OPENING', 'MZ1001', 100.00, NULL, NULL, 100.00, 100.50, '80/123', NULL, '2015-01-31', '2018-01-31', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(25, 16, 2, 1, 2, '2016-05-02', '2016-01-28', NULL, 'YR_CLOSE_OPENING', 'MB1001', 100.00, NULL, NULL, 100.00, 100.50, '80/123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(26, 17, 2, 2, 1, '2016-05-02', '2016-01-28', '2016-03-28', 'YR_CLOSE_OPENING', 'MA1001', 100.00, NULL, NULL, 100.00, 9.00, '80/123', '80-124', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL),
	(27, 0, 2, 1, 1, '2016-05-02', '2016-05-02', NULL, 'NEW', 'AZ1002', 10.00, NULL, NULL, 10.00, 100.00, '86/125', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:20', NULL, NULL),
	(28, 0, 2, 1, 2, '2016-05-02', '2016-05-02', '2016-05-02', 'PURCHASED', 'AB1002', 20.00, NULL, NULL, 20.00, 100.10, '86/125', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:20', NULL, NULL),
	(29, 0, 2, 2, 1, '2016-05-02', '2016-05-02', '2016-05-02', 'PURCHASED', 'AA1002', 30.00, NULL, NULL, 30.00, 10.10, '86/126', '86-125', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:20', NULL, NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is not more in use. material_tran_dtls will be used instead';

-- Dumping data for table retail_unittest.stock_sell: ~0 rows (approximately)
/*!40000 ALTER TABLE `stock_sell` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_sell` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `tran_id` int(11) NOT NULL AUTO_INCREMENT,
  `tran_no` varchar(50) NOT NULL,
  `action_date` date DEFAULT NULL,
  `used_ind` varchar(4) DEFAULT NULL COMMENT 'If the created transaction is in use or not',
  `delete_ind` varchar(4) DEFAULT NULL,
  `delete_reason` varchar(255) DEFAULT NULL,
  `passing_auth_ind` varchar(4) DEFAULT NULL,
  `passing_auth_remark` varchar(255) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tran_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.transactions: ~2 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`tran_id`, `tran_no`, `action_date`, `used_ind`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, '29042016/1', '2016-04-29', NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, NULL),
	(2, '29042016/2', '2016-04-29', NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:18', NULL, NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.transaction_payment: ~8 rows (approximately)
/*!40000 ALTER TABLE `transaction_payment` DISABLE KEYS */;
INSERT INTO `transaction_payment` (`payment_id`, `gl_tran_id`, `branch_id`, `action_date`, `amount`, `payment_type`, `delete_ind`, `delete_reason`, `passing_auth_ind`, `passing_auth_remark`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 2, '2016-04-29', 20.50, 'CASH', 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(2, 1, 2, '2016-04-29', 15.00, 'CARD', 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(3, 1, 2, '2016-04-29', 11.00, 'CARD', 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(4, 1, 2, '2016-04-29', 21.50, 'CRDR', 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(5, 1, 2, '2016-04-29', 21.50, 'CHEQUE', 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(6, 1, 2, '2016-04-29', 21.00, 'CRDR', 'Y', 'Wrong payment', NULL, NULL, 'ashish', '2016-05-02 21:47:17', 'ashish', '2016-05-02 21:47:20'),
	(7, 1, 2, '2016-04-29', 21.50, 'LOAN-OTHERBANK', 'Y', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:17', NULL, '2016-05-02 21:47:20'),
	(8, 2, 2, '2016-04-29', 400.00, 'CASH', NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:19', NULL, NULL);
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
	(1, '1234A', 2, '2015-04-28', NULL, 'Y', NULL, 'ashish', '2016-05-02 21:47:15', 'ashish', '2016-05-02 21:47:15'),
	(2, '1234A', 2, '2015-03-28', NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:15', NULL, NULL);
/*!40000 ALTER TABLE `vat_reg_no` ENABLE KEYS */;


-- Dumping structure for table retail_unittest.vendor_master
DROP TABLE IF EXISTS `vendor_master`;
CREATE TABLE IF NOT EXISTS `vendor_master` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
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
  UNIQUE KEY `branch_id_vendor_name` (`branch_id`,`vendor_name`),
  KEY `FK_vendor_master_branch_master` (`branch_id`),
  KEY `FK_vendor_master_accounts` (`account_id`),
  CONSTRAINT `FK_vendor_master_accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`),
  CONSTRAINT `FK_vendor_master_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table retail_unittest.vendor_master: ~3 rows (approximately)
/*!40000 ALTER TABLE `vendor_master` DISABLE KEYS */;
INSERT INTO `vendor_master` (`vendor_id`, `account_id`, `branch_id`, `vendor_name`, `address_line1`, `address_line2`, `pin`, `phone1`, `phone2`, `email1`, `email2`, `website`, `delete_ind`, `delete_reason`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 2, 'CTS', 'Kolkata', NULL, '743502', '9830525559', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', 'ashish', '2016-05-02 21:47:13'),
	(2, 2, 2, 'TCS', 'Kolkata', NULL, '712708', '9830525559', NULL, NULL, NULL, NULL, NULL, NULL, 'ashish', '2016-05-02 21:47:12', NULL, NULL),
	(3, 3, 2, 'TECHMAHINDRA', 'Kolkata', NULL, '712708', '9830525559', NULL, NULL, NULL, NULL, 'Y', NULL, 'ashish', '2016-05-02 21:47:13', 'ashish', '2016-05-02 21:47:19');
/*!40000 ALTER TABLE `vendor_master` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
