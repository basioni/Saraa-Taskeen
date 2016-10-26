-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 24, 2014 at 11:23 AM
-- Server version: 5.5.33a-MariaDB
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ownsourc_tasken`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_audit`
--

CREATE TABLE IF NOT EXISTS `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_bugs`
--

CREATE TABLE IF NOT EXISTS `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cases`
--

CREATE TABLE IF NOT EXISTS `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_contacts`
--

CREATE TABLE IF NOT EXISTS `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_opportunities`
--

CREATE TABLE IF NOT EXISTS `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE IF NOT EXISTS `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_actions`
--

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('14d70a64-56ad-e134-a59f-5355603cb793', '2014-04-21 18:15:34', '2014-04-21 18:15:34', '1', '1', 'export', 'SWNA_SNRWLNEWACTIVE', 'module', 90, 0),
('16aed2ef-c92c-ffd5-b84a-520f7864a008', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Emails', 'module', 89, 0),
('17d77024-5637-5f1d-9be3-520f78de60bc', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Emails', 'module', 90, 0),
('18c6f906-3115-bae8-9f39-520f786e446a', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Emails', 'module', 90, 0),
('191fb058-c241-a827-f2e0-520f78f91999', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Campaigns', 'module', 89, 0),
('19dd0549-f9b3-4b7b-4025-520f786ca107', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Emails', 'module', 90, 0),
('1a0bbe3c-143a-f5ee-ff0e-520f78e7176a', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Campaigns', 'module', 90, 0),
('1ac77a1b-a230-7044-13be-520f7886ccc7', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Campaigns', 'module', 90, 0),
('1aee0874-fc58-d0a4-bcc9-5355605473a4', '2014-04-21 18:15:34', '2014-04-21 18:15:34', '1', '1', 'massupdate', 'SWNA_SNRWLNEWACTIVE', 'module', 90, 0),
('1b17a67a-fc00-c544-bb61-520f786a3088', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Emails', 'module', 90, 0),
('1b77be19-7768-b53b-fd5a-5355624fad2c', '2014-04-21 18:23:00', '2014-04-21 18:23:00', '1', '1', 'access', 'HWLA_HARASAWAITINGLISTACTIVE', 'module', 89, 0),
('1b86b8ae-850d-5935-43d6-520f789515d4', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Campaigns', 'module', 90, 0),
('1c2b9fc2-b2e6-c666-bca8-520f78a63730', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Emails', 'module', 90, 0),
('1c4f1dfa-873c-b75c-ca71-520f78657263', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Campaigns', 'module', 90, 0),
('1d1a78f3-2efa-8afc-f5c0-520f78925cea', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Emails', 'module', 90, 0),
('1d2d0218-05c5-5b5d-04b1-520f7841ff95', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Campaigns', 'module', 90, 0),
('1e2c8a08-0905-df7d-e668-520f78f9290d', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Emails', 'module', 90, 0),
('1e53b520-233b-37cc-eb17-520f78ccc118', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Campaigns', 'module', 90, 0),
('1e9ed920-dfe4-684f-bf42-5355620f74aa', '2014-04-21 18:23:00', '2014-04-21 18:23:00', '1', '1', 'view', 'HWLA_HARASAWAITINGLISTACTIVE', 'module', 90, 0),
('1ef726b7-3208-d7fe-a1b5-53556261c8ea', '2014-04-21 18:23:00', '2014-04-21 18:23:00', '1', '1', 'list', 'HWLA_HARASAWAITINGLISTACTIVE', 'module', 90, 0),
('1f24f16f-846f-0d4e-2e0a-520f786fcb6b', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Campaigns', 'module', 90, 0),
('1f46c55e-d974-f0e1-a78a-535562c357a4', '2014-04-21 18:23:00', '2014-04-21 18:23:00', '1', '1', 'edit', 'HWLA_HARASAWAITINGLISTACTIVE', 'module', 90, 0),
('1fb8f475-a63e-27e7-9285-535562c660ae', '2014-04-21 18:23:00', '2014-04-21 18:23:00', '1', '1', 'delete', 'HWLA_HARASAWAITINGLISTACTIVE', 'module', 90, 0),
('20071636-7c58-bf30-d0fa-535562ce744b', '2014-04-21 18:23:00', '2014-04-21 18:23:00', '1', '1', 'import', 'HWLA_HARASAWAITINGLISTACTIVE', 'module', 90, 0),
('2054e6cc-2368-76a8-de0d-5355629d2718', '2014-04-21 18:23:00', '2014-04-21 18:23:00', '1', '1', 'export', 'HWLA_HARASAWAITINGLISTACTIVE', 'module', 90, 0),
('20a272d1-3434-11fe-b99b-53556292f9c0', '2014-04-21 18:23:00', '2014-04-21 18:23:00', '1', '1', 'massupdate', 'HWLA_HARASAWAITINGLISTACTIVE', 'module', 90, 0),
('24f00c8c-7de6-466d-4d78-535560f8ef37', '2014-04-21 18:15:34', '2014-04-21 18:15:34', '1', '1', 'edit', 'SWNA_SNRWLNEWACTIVE', 'module', 90, 0),
('2c8adf34-e0e2-6e14-b947-520f78213d70', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Leads', 'module', 89, 0),
('2d468e66-c349-d272-8be6-520f78b971e9', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Meetings', 'module', 89, 0),
('2e203e32-d6ea-b817-f4de-520f788349d1', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Meetings', 'module', 90, 0),
('2ed118c7-a5d2-3a95-dbe1-520f78060bdf', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Leads', 'module', 90, 0),
('2f084345-9585-5666-042d-520f78c7d4b0', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Meetings', 'module', 90, 0),
('2fc492d2-5813-c080-35e8-520f78f5d5a8', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Meetings', 'module', 90, 0),
('309efa1c-05dc-18f4-d254-520f78dc753a', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Meetings', 'module', 90, 0),
('30bbe1e5-62e3-15b8-e2a7-520f78590ee6', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Leads', 'module', 90, 0),
('30c9c246-8fe7-1ab4-2eac-520f78120ff2', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'ProspectLists', 'module', 89, 0),
('3173d684-d31f-e905-36db-520f781aa65f', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Meetings', 'module', 90, 0),
('31a6438c-573b-6856-e5b3-520f78c627f3', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'ProspectLists', 'module', 90, 0),
('324e7445-2ce0-28d1-62d6-520f781f283f', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Meetings', 'module', 90, 0),
('327e0810-9ab4-c926-da6a-520f7825c379', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Leads', 'module', 90, 0),
('32b23dd4-0945-42b0-bf8f-520f789951fd', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'ProspectLists', 'module', 90, 0),
('331bf500-dd96-801d-67c2-520f7847a229', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Meetings', 'module', 90, 0),
('338f3aff-a8f0-6c81-8054-520f78608cb7', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'ProspectLists', 'module', 90, 0),
('34756c84-e027-aff9-a442-520f7866f1b6', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Leads', 'module', 90, 0),
('3475f0b6-9edc-b8b5-5a49-520f7884e504', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'ProspectLists', 'module', 90, 0),
('356ab463-88c3-005d-0feb-520f78298751', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'ProspectLists', 'module', 90, 0),
('362ba4ac-5545-f978-bef1-520f7855f643', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Leads', 'module', 90, 0),
('36499544-5297-66f2-3bd0-520f7858ebf1', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'ProspectLists', 'module', 90, 0),
('374efd3a-d766-3bfa-7970-520f789bd5a0', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'ProspectLists', 'module', 90, 0),
('3812a2d1-bd9c-7e99-d176-520f786d51b3', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Leads', 'module', 90, 0),
('3890e70b-3978-59f7-79f9-53556324e29a', '2014-04-21 18:29:24', '2014-04-21 18:29:24', '1', '1', 'access', 'VWNA_VILLAWLNEWACTIVE', 'module', 89, 0),
('39c98d75-e89d-263d-1cf3-520f78232c56', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Leads', 'module', 90, 0),
('3bca0a80-01ad-10c0-658f-520f78683030', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'ProjectTask', 'module', 89, 0),
('3d73cc83-23fc-f509-856e-520f78afb3ac', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Tasks', 'module', 89, 0),
('3e56cec2-d8b3-e453-9618-520f780a56cc', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Tasks', 'module', 90, 0),
('3f12bfe0-418c-0644-b827-520f787df8a7', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Tasks', 'module', 90, 0),
('40266d6a-a9d1-2372-dcf0-520f783fdfee', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Tasks', 'module', 90, 0),
('4054c361-ae2e-dc0b-1c61-520f780866df', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Prospects', 'module', 89, 0),
('4065b07d-05a3-5ee5-2e31-53556314cbf5', '2014-04-21 18:29:24', '2014-04-21 18:29:24', '1', '1', 'view', 'VWNA_VILLAWLNEWACTIVE', 'module', 90, 0),
('40c2ffea-8427-1bb3-93f7-535563ca030a', '2014-04-21 18:29:24', '2014-04-21 18:29:24', '1', '1', 'list', 'VWNA_VILLAWLNEWACTIVE', 'module', 90, 0),
('41076f88-f570-1f17-cb08-520f789629b7', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Tasks', 'module', 90, 0),
('41264318-64a6-cf95-730f-520f78e2fdab', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Prospects', 'module', 90, 0),
('41bd180f-705f-036f-0a65-520f784746de', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Tasks', 'module', 90, 0),
('41df2cc3-705b-3d94-3843-520f7820268d', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Prospects', 'module', 90, 0),
('42c09c52-a7ba-2306-2699-520f785ec4c7', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Tasks', 'module', 90, 0),
('42ea5779-5751-0680-7fc8-520f7889f7c0', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Prospects', 'module', 90, 0),
('43cb3fd3-7ae7-8cc1-d00f-520f78a97cdf', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Tasks', 'module', 90, 0),
('43d17cb4-17ad-3c7a-2b76-520f78ade9ba', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Prospects', 'module', 90, 0),
('4419b21c-78b9-f388-cc3a-535563cfefb3', '2014-04-21 18:29:24', '2014-04-21 18:29:24', '1', '1', 'edit', 'VWNA_VILLAWLNEWACTIVE', 'module', 90, 0),
('446c082e-0747-05da-5ab9-53556324f329', '2014-04-21 18:29:24', '2014-04-21 18:29:24', '1', '1', 'delete', 'VWNA_VILLAWLNEWACTIVE', 'module', 90, 0),
('44a93e04-1b7e-04dd-ec45-520f78fd55ef', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Prospects', 'module', 90, 0),
('44bb49ae-e464-26c4-1bff-5355632e859f', '2014-04-21 18:29:24', '2014-04-21 18:29:24', '1', '1', 'import', 'VWNA_VILLAWLNEWACTIVE', 'module', 90, 0),
('45170433-5233-8279-101e-535563ee88ae', '2014-04-21 18:29:24', '2014-04-21 18:29:24', '1', '1', 'export', 'VWNA_VILLAWLNEWACTIVE', 'module', 90, 0),
('458aab12-6bdd-5625-7c93-520f78879d82', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Prospects', 'module', 90, 0),
('466714df-1ed8-2d19-41ca-520f78e013d0', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Prospects', 'module', 90, 0),
('4a6d0a31-5870-b011-07ed-520f78820b82', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'ProjectTask', 'module', 90, 0),
('4bda387a-6d1e-e923-46d0-5355636f162a', '2014-04-21 18:29:24', '2014-04-21 18:29:24', '1', '1', 'massupdate', 'VWNA_VILLAWLNEWACTIVE', 'module', 90, 0),
('53d12815-9985-7b34-b791-520f7897f58f', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'EmailMarketing', 'module', 89, 0),
('54c88f31-6873-5ffe-3d13-520f783ba908', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'EmailMarketing', 'module', 90, 0),
('558cc0df-6124-8bfd-aca6-520f78138eac', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'EmailMarketing', 'module', 90, 0),
('566e0ff4-2a86-decb-29cb-520f789b420b', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'EmailMarketing', 'module', 90, 0),
('5761c2a2-f022-8b53-7b7a-520f780bb4a5', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'EmailMarketing', 'module', 90, 0),
('583098cb-64c5-c719-1eba-520f782cafe4', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'EmailMarketing', 'module', 90, 0),
('590de7fe-c218-cd5c-8120-520f78069d65', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'EmailMarketing', 'module', 90, 0),
('59980c62-eb61-fdaf-d1a5-520f78389fc2', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'ProjectTask', 'module', 90, 0),
('59c8f530-173c-093a-8251-520f7823eaa1', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'EmailMarketing', 'module', 90, 0),
('611d3b77-ed7e-100d-f31b-520f78e51b4d', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Cases', 'module', 89, 0),
('61fde8b0-d598-ff95-a611-520f78717657', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Cases', 'module', 90, 0),
('62c930ef-f17a-313a-798f-520f783768ea', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Cases', 'module', 90, 0),
('63831829-dd2e-226c-ae13-520f78e09fe4', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Cases', 'module', 90, 0),
('642f8135-c732-cd72-a8fc-520f783507d4', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Cases', 'module', 90, 0),
('650b8895-c7d9-2aed-14c3-520f78514086', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Cases', 'module', 90, 0),
('65d708fb-cba5-7331-c5f6-520f78a140e8', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Cases', 'module', 90, 0),
('66a141af-829c-a6e5-be12-520f78b69501', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Cases', 'module', 90, 0),
('67400e35-2eb8-e6d5-9366-520f785c1aa3', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'ProjectTask', 'module', 90, 0),
('6cb9fb2b-697f-3d7f-4827-520f78f6926b', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Documents', 'module', 89, 0),
('6d7f5bcb-b613-c675-c53a-520f7891fd8e', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Documents', 'module', 90, 0),
('6e3f4a0d-cd5f-2187-4dac-520f786e46bc', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Documents', 'module', 90, 0),
('6eff9737-057f-5a8d-0b0a-520f786fd84e', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Documents', 'module', 90, 0),
('6faee3d3-5b2f-9360-3328-520f78be4310', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Documents', 'module', 90, 0),
('707a0396-aac8-2098-0c2d-520f781d5922', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Documents', 'module', 90, 0),
('71626ec8-1d5e-44d7-e6d6-520f784d0b9d', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Documents', 'module', 90, 0),
('725b9a42-7444-c05b-1efa-520f7833ddf6', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Documents', 'module', 90, 0),
('751401d4-11c0-d119-227a-520f787be3b1', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'ProjectTask', 'module', 90, 0),
('7b3cd77c-6e12-1a6e-ae3b-520f78130363', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Contacts', 'module', 89, 0),
('7c308b7c-33b8-431d-0aa5-520f78c7da6f', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Contacts', 'module', 90, 0),
('7cffb629-aaac-386a-4c30-520f7882d920', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Contacts', 'module', 90, 0),
('7dcf43d3-c1a4-95cd-b95b-520f783bfa15', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Contacts', 'module', 90, 0),
('7e991bcb-4d55-9c79-92ef-520f78dd89b7', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Contacts', 'module', 90, 0),
('7f929818-96e0-fc98-31ba-520f7852ce87', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Contacts', 'module', 90, 0),
('8042f887-807d-5d74-f8a0-520f7861a1ae', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Contacts', 'module', 90, 0),
('81e6a7bb-681b-d218-f8ec-520f78fbd90c', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Contacts', 'module', 90, 0),
('820a0a65-f247-a163-a398-520f784740ed', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'ProjectTask', 'module', 90, 0),
('87600f94-a9c6-11d3-56f2-535560bd4a6d', '2014-04-21 18:15:34', '2014-04-21 18:15:34', '1', '1', 'delete', 'SWNA_SNRWLNEWACTIVE', 'module', 90, 0),
('8abd6c0d-bb3e-cfbe-f5da-520f786aae5c', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Bugs', 'module', 89, 0),
('8d098399-683c-ae2c-d970-520f78971750', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Bugs', 'module', 90, 0),
('8eea0ca0-0f1b-8f36-0f1e-520f78f9d057', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'ProjectTask', 'module', 90, 0),
('8efad5b7-8020-8bfe-4968-520f78f12822', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Bugs', 'module', 90, 0),
('913881e2-10da-7be7-9c7e-520f78fd3d46', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Bugs', 'module', 90, 0),
('932f4092-1eff-b615-e444-520f78eb34c6', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Bugs', 'module', 90, 0),
('9436e829-d8e6-ab57-eda6-520f7886b1ba', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Accounts', 'module', 89, 0),
('94fe20ac-b6c6-a8c7-c706-520f78e6b5c3', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Accounts', 'module', 90, 0),
('9516fd77-23a7-ff84-1a58-520f7832bf05', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Bugs', 'module', 90, 0),
('95b182c7-afac-dd24-8b28-520f782a14d8', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Accounts', 'module', 90, 0),
('969659d6-7511-6a73-c06c-520f789b596c', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Accounts', 'module', 90, 0),
('975bb1b9-d27d-f13b-3312-520f780a0638', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Bugs', 'module', 90, 0),
('97787b90-320b-8441-2ffb-520f78b38905', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Accounts', 'module', 90, 0),
('97f1cdc6-4db1-769c-8a28-534f9c478310', '2014-04-17 09:17:11', '2014-04-17 19:46:07', '1', '1', 'access', 'hmng_Homing', 'module', 89, 1),
('98479c3b-caf2-e9f0-02b7-520f78e90267', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Accounts', 'module', 90, 0),
('990a568f-a976-c613-ed95-520f78970345', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Accounts', 'module', 90, 0),
('99962532-757d-ba45-51a4-534f9c91deb8', '2014-04-17 09:17:11', '2014-04-17 19:46:07', '1', '1', 'view', 'hmng_Homing', 'module', 90, 1),
('99ba1740-4351-ee85-05bc-520f784b3f21', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Bugs', 'module', 90, 0),
('99d8967c-eb9b-a44b-4261-520f78b1ca84', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Accounts', 'module', 90, 0),
('9a6c7b06-ce50-1d99-95a0-534f9cdd40bd', '2014-04-17 09:17:11', '2014-04-17 19:46:07', '1', '1', 'list', 'hmng_Homing', 'module', 90, 1),
('9b5baea7-9efd-a0af-00f9-534f9c04624a', '2014-04-17 09:17:11', '2014-04-17 19:46:07', '1', '1', 'edit', 'hmng_Homing', 'module', 90, 1),
('9c2e82a7-6704-2062-493a-534f9cac0cca', '2014-04-17 09:17:11', '2014-04-17 19:46:07', '1', '1', 'delete', 'hmng_Homing', 'module', 90, 1),
('9c2f078a-d7c8-609e-aa43-520f78a36360', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'ProjectTask', 'module', 90, 0),
('9cefda5d-5600-de27-ca81-534f9cc264dd', '2014-04-17 09:17:11', '2014-04-17 19:46:07', '1', '1', 'import', 'hmng_Homing', 'module', 90, 1),
('9dace54a-3c5a-52f5-5be1-534f9cb9cacc', '2014-04-17 09:17:11', '2014-04-17 19:46:07', '1', '1', 'export', 'hmng_Homing', 'module', 90, 1),
('9e838671-a061-b73b-0b5c-534f9c6e4744', '2014-04-17 09:17:11', '2014-04-17 19:46:07', '1', '1', 'massupdate', 'hmng_Homing', 'module', 90, 1),
('a20d7f87-be31-f31f-36ef-520f7899055c', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'EAPM', 'module', 89, 0),
('a31a7f3a-eb28-bb66-18e4-520f7853b9e0', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'EAPM', 'module', 90, 0),
('a40058df-6e15-8bca-0a72-520f78ee4ee6', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'EAPM', 'module', 90, 0),
('a406a34e-0bd4-014e-82c4-534c49a3bdf7', '2014-04-14 20:47:47', '2014-04-21 20:32:59', '1', '1', 'access', 'Plcs_File_tasken', 'module', 89, 1),
('a4ed9504-d2e8-dc46-0651-520f788d5496', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'EAPM', 'module', 90, 0),
('a5b1901e-51b8-9246-d2d4-520f78e00507', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'EAPM', 'module', 90, 0),
('a695ea07-7f30-9e5f-6a78-520f785a0b8f', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'EAPM', 'module', 90, 0),
('a7583f1f-ae27-c673-1951-520f781e2f05', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'EAPM', 'module', 90, 0),
('a837b3c1-40b7-714a-d5ad-520f78569df0', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'EAPM', 'module', 90, 0),
('a92bb8f0-7939-2468-085e-534c4992f772', '2014-04-14 20:47:47', '2014-04-21 20:32:59', '1', '1', 'view', 'Plcs_File_tasken', 'module', 90, 1),
('ac4cfb56-60af-49f2-e3ca-520f78564952', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Opportunities', 'module', 89, 0),
('ad152871-52d2-f4fa-fb63-520f78dfe746', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Opportunities', 'module', 90, 0),
('add30e03-60da-5bc8-e46b-534c49f4bd99', '2014-04-14 20:47:47', '2014-04-21 20:32:59', '1', '1', 'list', 'Plcs_File_tasken', 'module', 90, 1),
('adf0f2af-879b-e9c5-f8f9-520f78026f0d', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Opportunities', 'module', 90, 0),
('af1e6498-d6dc-d061-3998-520f782d5418', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Opportunities', 'module', 90, 0),
('afe49f36-a2b3-0de9-74a1-534c49954ea2', '2014-04-14 20:47:47', '2014-04-21 20:32:59', '1', '1', 'edit', 'Plcs_File_tasken', 'module', 90, 1),
('afec73fa-5c70-47dd-dd0f-520f78048b43', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Opportunities', 'module', 90, 0),
('b0bd1c00-faae-d09d-e709-520f78be513f', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Opportunities', 'module', 90, 0),
('b19406f8-085e-25f5-b677-520f7825d434', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Opportunities', 'module', 90, 0),
('b2047de0-67c0-3235-12df-534c4971fbee', '2014-04-14 20:47:47', '2014-04-21 20:32:59', '1', '1', 'delete', 'Plcs_File_tasken', 'module', 90, 1),
('b2735918-c5ba-ddc7-b440-520f787a94f3', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Opportunities', 'module', 90, 0),
('b3eebdc5-e426-86e4-81d6-534c49f649c7', '2014-04-14 20:47:47', '2014-04-21 20:32:59', '1', '1', 'import', 'Plcs_File_tasken', 'module', 90, 1),
('b5deedba-7831-d2a7-4f80-534c49961aab', '2014-04-14 20:47:47', '2014-04-21 20:32:59', '1', '1', 'export', 'Plcs_File_tasken', 'module', 90, 1),
('b7ee8714-cf71-bcb1-3f4e-534c498930a5', '2014-04-14 20:47:47', '2014-04-21 20:32:59', '1', '1', 'massupdate', 'Plcs_File_tasken', 'module', 90, 1),
('ba9658e5-51b9-3f15-6386-520f780d3b8c', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Users', 'module', 89, 0),
('bba737b6-a948-37d0-5ddc-520f78e133fe', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Users', 'module', 90, 0),
('bc91fec8-e038-a16b-a444-520f7870f683', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Users', 'module', 90, 0),
('bd8a19a3-2eed-e877-933f-520f78a7b459', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Users', 'module', 90, 0),
('be7e9790-09a4-7909-d8c2-520f78fd0426', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Users', 'module', 90, 0),
('bf5a4bcb-5031-6c7b-74a5-520f78f645b9', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Users', 'module', 90, 0),
('c03eca74-f1f1-7739-cd5e-520f78dd4f89', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Users', 'module', 90, 0),
('c126c716-8453-431e-682f-520f78b05999', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Users', 'module', 90, 0),
('c21bd645-e39e-107f-e9bd-520f786f27ef', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'EmailTemplates', 'module', 89, 0),
('c32d9b49-b96f-83a7-7e79-520f7845db00', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'EmailTemplates', 'module', 90, 0),
('c40af388-b229-9929-9de7-520f78926f93', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'EmailTemplates', 'module', 90, 0),
('c4e4c9d3-b70b-8b2c-5c4e-520f7809bfb1', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'EmailTemplates', 'module', 90, 0),
('c54ae9f4-8f9f-6ee6-2fae-53556196b313', '2014-04-21 18:20:54', '2014-04-21 18:20:54', '1', '1', 'access', 'JWNA_JUNIORWLNEWACTIVE', 'module', 89, 0),
('c5c54da1-1282-74e2-4edd-520f78fb757e', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'EmailTemplates', 'module', 90, 0),
('c6a0252a-4634-e031-1fe0-520f7862ad30', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'EmailTemplates', 'module', 90, 0),
('c7a81714-fbc2-9dda-7139-520f78c1d54e', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'EmailTemplates', 'module', 90, 0),
('c8a681d1-1a97-fb99-b7f3-53556187e11e', '2014-04-21 18:20:54', '2014-04-21 18:20:54', '1', '1', 'view', 'JWNA_JUNIORWLNEWACTIVE', 'module', 90, 0),
('c8af79e0-64e3-26ae-092f-520f78978eab', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'EmailTemplates', 'module', 90, 0),
('c8fffa9b-0fca-643a-6201-535561afbf12', '2014-04-21 18:20:54', '2014-04-21 18:20:54', '1', '1', 'list', 'JWNA_JUNIORWLNEWACTIVE', 'module', 90, 0),
('c953ef49-824e-9f6f-77e2-53556160b2c3', '2014-04-21 18:20:54', '2014-04-21 18:20:54', '1', '1', 'edit', 'JWNA_JUNIORWLNEWACTIVE', 'module', 90, 0),
('c9a0ea23-e5ff-9d43-851c-53556192e851', '2014-04-21 18:20:54', '2014-04-21 18:20:54', '1', '1', 'delete', 'JWNA_JUNIORWLNEWACTIVE', 'module', 90, 0),
('c9edeb7c-de11-fa09-82cb-5355614a6b67', '2014-04-21 18:20:54', '2014-04-21 18:20:54', '1', '1', 'import', 'JWNA_JUNIORWLNEWACTIVE', 'module', 90, 0),
('ca3aba27-570d-b2ac-d155-535561a387f6', '2014-04-21 18:20:54', '2014-04-21 18:20:54', '1', '1', 'export', 'JWNA_JUNIORWLNEWACTIVE', 'module', 90, 0),
('ca9c7f70-0d15-7eae-3335-535561cd4a9e', '2014-04-21 18:20:54', '2014-04-21 18:20:54', '1', '1', 'massupdate', 'JWNA_JUNIORWLNEWACTIVE', 'module', 90, 0),
('cc64bb7a-091c-b7fc-1222-53558166b23f', '2014-04-21 20:35:30', '2014-04-21 20:35:30', '1', '1', 'access', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'module', 89, 0),
('d075bcb2-8fff-59d3-eb40-520f78f27171', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Notes', 'module', 89, 0),
('d18906c4-553b-4cbf-0350-520f78aced5d', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Notes', 'module', 90, 0),
('d2632e7b-6e7c-b368-4afe-520f78a6f176', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Notes', 'module', 90, 0),
('d33a83f1-7a65-eced-436e-520f787cd2e6', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Notes', 'module', 90, 0),
('d40dad28-74ad-b2cf-7ca2-520f7800a53c', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Notes', 'module', 90, 0),
('d43eaf12-25ef-db2a-b5c4-53558117821b', '2014-04-21 20:35:30', '2014-04-21 20:35:30', '1', '1', 'view', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'module', 90, 0),
('d49644f5-9742-3f99-6e5b-53558160f17a', '2014-04-21 20:35:30', '2014-04-21 20:35:30', '1', '1', 'list', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'module', 90, 0),
('d4e540ed-d8b1-34aa-8498-53558198d8a0', '2014-04-21 20:35:30', '2014-04-21 20:35:30', '1', '1', 'edit', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'module', 90, 0),
('d50d7dfc-3ea9-02db-72f1-520f782d1f26', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Notes', 'module', 90, 0),
('d54f263e-4f1e-c817-5398-53558130a219', '2014-04-21 20:35:30', '2014-04-21 20:35:30', '1', '1', 'delete', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'module', 90, 0),
('d5b7b58c-446f-a566-8552-53558182419d', '2014-04-21 20:35:30', '2014-04-21 20:35:30', '1', '1', 'import', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'module', 90, 0),
('d6018b27-6719-e8a3-676b-520f7883b74c', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Notes', 'module', 90, 0),
('d622f406-ca49-66a4-c40f-5355819344cd', '2014-04-21 20:35:30', '2014-04-21 20:35:30', '1', '1', 'export', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'module', 90, 0),
('d690b1b3-61cc-82ab-f135-535581125115', '2014-04-21 20:35:30', '2014-04-21 20:35:30', '1', '1', 'massupdate', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'module', 90, 0),
('d6e975c5-b73b-daa0-92f6-520f7896b879', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Notes', 'module', 90, 0),
('da8dba87-9b2f-332b-7ee1-520f7811d1ed', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Project', 'module', 89, 0),
('dbc340b3-6695-cc6c-6967-520f78a46ab2', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Project', 'module', 90, 0),
('dd81a7f6-5cb8-b02b-6575-520f78dba31e', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Project', 'module', 90, 0),
('df549a06-6062-eaec-6aca-520f7839385b', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Project', 'module', 90, 0),
('e126a81a-d101-0c46-8d4d-520f7802fd81', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Project', 'module', 90, 0),
('e14dc6e4-69d6-c0be-e52e-520f7820e8f1', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'access', 'Calls', 'module', 89, 0),
('e2213e9d-be8b-8e6e-fca5-520f78aba057', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'view', 'Calls', 'module', 90, 0),
('e306be4f-2602-e1b9-d7c5-520f78fbc8ec', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Project', 'module', 90, 0),
('e334fb0f-f348-723f-76cd-520f78b21c99', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'list', 'Calls', 'module', 90, 0),
('e401c9f2-be68-2242-ea11-520f7833d51d', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'edit', 'Calls', 'module', 90, 0),
('e48d98d9-c502-4674-3776-520f78fa9ff4', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Project', 'module', 90, 0),
('e4d71fc2-85b6-6e2b-8881-520f78711768', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'delete', 'Calls', 'module', 90, 0),
('e58d8995-3aef-bd30-bc56-520f784502d7', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'import', 'Calls', 'module', 90, 0),
('e5d0bfbd-b3b2-6ecd-41a4-520f78e607c5', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Project', 'module', 90, 0),
('e6515ad1-f007-f414-3fa3-520f78e70af4', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'export', 'Calls', 'module', 90, 0),
('e70bb540-0f26-f906-52e1-520f78b44c75', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '', 'massupdate', 'Calls', 'module', 90, 0),
('e9f0030e-7c87-d1f0-716b-5355606d3f98', '2014-04-21 18:15:34', '2014-04-21 18:15:34', '1', '1', 'import', 'SWNA_SNRWLNEWACTIVE', 'module', 90, 0),
('eb849e27-4c3b-cea2-5881-5355609519ff', '2014-04-21 18:15:34', '2014-04-21 18:15:34', '1', '1', 'access', 'SWNA_SNRWLNEWACTIVE', 'module', 89, 0),
('f2bb290e-4cff-4018-1161-535560c3bf60', '2014-04-21 18:15:34', '2014-04-21 18:15:34', '1', '1', 'view', 'SWNA_SNRWLNEWACTIVE', 'module', 90, 0),
('f314209a-402a-89bc-f3c7-535560b0e18f', '2014-04-21 18:15:34', '2014-04-21 18:15:34', '1', '1', 'list', 'SWNA_SNRWLNEWACTIVE', 'module', 90, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles`
--

CREATE TABLE IF NOT EXISTS `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_roles`
--

INSERT INTO `acl_roles` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `description`, `deleted`) VALUES
('f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '2014-02-02 12:06:01', '2014-04-24 00:04:58', '1', '1', 'Sales Person', 'Sales Person role with default operations .', 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_actions`
--

CREATE TABLE IF NOT EXISTS `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_roles_actions`
--

INSERT INTO `acl_roles_actions` (`id`, `role_id`, `action_id`, `access_override`, `date_modified`, `deleted`) VALUES
('21da95e5-1191-d691-9d04-52ee348e5590', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '9436e829-d8e6-ab57-eda6-520f7886b1ba', 0, '2014-02-02 12:07:16', 0),
('22950a1d-0ddd-1161-984b-52ee34a36768', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '97787b90-320b-8441-2ffb-520f78b38905', 0, '2014-02-02 12:07:16', 0),
('22fd1efd-ef8e-1c84-d51e-52ee34b03296', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '969659d6-7511-6a73-c06c-520f789b596c', 0, '2014-02-02 12:07:16', 0),
('236e7b60-452e-e507-25d1-52ee34fecb8d', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '990a568f-a976-c613-ed95-520f78970345', 0, '2014-02-02 12:07:16', 0),
('23ed118a-69a6-0a35-6f3f-52ee34b89488', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '98479c3b-caf2-e9f0-02b7-520f78e90267', 0, '2014-02-02 12:07:16', 0),
('244a6be0-f420-606c-3e26-52ee3409ba12', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '95b182c7-afac-dd24-8b28-520f782a14d8', 0, '2014-02-02 12:07:16', 0),
('24e0b20c-f905-ef5b-f25e-52ee34f9f407', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '99d8967c-eb9b-a44b-4261-520f78b1ca84', 0, '2014-02-02 12:07:16', 0),
('2541ab01-f6cb-8bd1-9ac0-52ee34a50cc5', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '94fe20ac-b6c6-a8c7-c706-520f78e6b5c3', 0, '2014-02-02 12:07:16', 0),
('25a387b8-6c4d-5a47-1fac-52ee34ac2856', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '8abd6c0d-bb3e-cfbe-f5da-520f786aae5c', -98, '2014-02-02 12:07:16', 0),
('261fc139-8e20-a0e8-349a-52ee34a3854f', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '932f4092-1eff-b615-e444-520f78eb34c6', 0, '2014-02-02 12:07:16', 0),
('2686e7ac-bc73-aa30-734d-52ee34f4b34c', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '913881e2-10da-7be7-9c7e-520f78fd3d46', 0, '2014-02-02 12:07:16', 0),
('26f00654-3f75-9526-28bc-52ee34869718', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '975bb1b9-d27d-f13b-3312-520f780a0638', 0, '2014-02-02 12:07:16', 0),
('2c1b8b05-e451-9421-7458-52ee34714550', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '9516fd77-23a7-ff84-1a58-520f7832bf05', 0, '2014-02-02 12:07:16', 0),
('2c88effa-0384-48e3-340d-52ee34106162', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '8efad5b7-8020-8bfe-4968-520f78f12822', 0, '2014-02-02 12:07:16', 0),
('2cf42803-2908-30f4-b353-52ee343c3dc0', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '99ba1740-4351-ee85-05bc-520f784b3f21', 0, '2014-02-02 12:07:16', 0),
('2d78b2f2-84e8-4237-8df4-52ee34d74e2c', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '8d098399-683c-ae2c-d970-520f78971750', 0, '2014-02-02 12:07:16', 0),
('2de554e3-bac8-69ae-61bc-52ee340ccb39', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e14dc6e4-69d6-c0be-e52e-520f7820e8f1', 0, '2014-02-02 12:07:16', 0),
('2e463ca4-20a3-283a-1749-52ee34535291', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e4d71fc2-85b6-6e2b-8881-520f78711768', 0, '2014-02-02 12:07:16', 0),
('2ea211ee-e321-3173-e739-52ee34518e1d', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e401c9f2-be68-2242-ea11-520f7833d51d', 0, '2014-02-02 12:07:16', 0),
('2f18461e-4a02-30ae-d566-52ee3488f1fe', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e6515ad1-f007-f414-3fa3-520f78e70af4', 0, '2014-02-02 12:07:16', 0),
('2f8e7268-acfa-632a-7202-52ee344e2e18', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e58d8995-3aef-bd30-bc56-520f784502d7', 0, '2014-02-02 12:07:16', 0),
('300daa17-1fe9-334c-2004-52ee34588c6c', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e334fb0f-f348-723f-76cd-520f78b21c99', 0, '2014-02-02 12:07:16', 0),
('30b96df3-3b17-bde9-536e-52ee34b9c15b', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e70bb540-0f26-f906-52e1-520f78b44c75', 0, '2014-02-02 12:07:16', 0),
('31261b12-b99a-23bb-346c-52ee342927be', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e2213e9d-be8b-8e6e-fca5-520f78aba057', 0, '2014-02-02 12:07:16', 0),
('31b22b65-5151-aa9e-208b-52ee34aa31d6', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '191fb058-c241-a827-f2e0-520f78f91999', 0, '2014-02-02 12:07:16', 0),
('3234074c-efc1-56bc-7216-52ee34b0b248', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1c4f1dfa-873c-b75c-ca71-520f78657263', 0, '2014-02-02 12:07:16', 0),
('32c5e30a-b859-a2f2-133b-52ee340f3da8', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1b86b8ae-850d-5935-43d6-520f789515d4', 0, '2014-02-02 12:07:16', 0),
('3354b597-5426-865e-f094-52ee34f6957c', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1e53b520-233b-37cc-eb17-520f78ccc118', 0, '2014-02-02 12:07:16', 0),
('33d64393-ea34-9be8-e80f-52ee34788a15', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1d2d0218-05c5-5b5d-04b1-520f7841ff95', 0, '2014-02-02 12:07:16', 0),
('34514684-e864-6120-f447-52ee34e400f3', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1ac77a1b-a230-7044-13be-520f7886ccc7', 0, '2014-02-02 12:07:16', 0),
('34d1a1c3-a37f-55e5-80ec-52ee34cb10cb', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1f24f16f-846f-0d4e-2e0a-520f786fcb6b', 0, '2014-02-02 12:07:16', 0),
('356a5473-d8bd-7339-ddd5-52ee3417fe83', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1a0bbe3c-143a-f5ee-ff0e-520f78e7176a', 0, '2014-02-02 12:07:16', 0),
('35edfaee-0306-4da9-151a-52ee3420bc03', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '611d3b77-ed7e-100d-f31b-520f78e51b4d', -98, '2014-02-02 12:07:16', 0),
('367ed95d-a2f7-1f91-ef5b-52ee34e5e4e2', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '642f8135-c732-cd72-a8fc-520f783507d4', 0, '2014-02-02 12:07:16', 0),
('36f5aa04-c15c-dac7-fafc-52ee34072fc0', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '63831829-dd2e-226c-ae13-520f78e09fe4', 0, '2014-02-02 12:07:16', 0),
('37b9001b-fcda-3e6c-d4f2-52ee34db7557', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '65d708fb-cba5-7331-c5f6-520f78a140e8', 0, '2014-02-02 12:07:16', 0),
('3833f9eb-a02a-d610-025f-52ee34433d5f', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '650b8895-c7d9-2aed-14c3-520f78514086', 0, '2014-02-02 12:07:16', 0),
('38e2993a-e3c0-1a8e-170c-52ee34ea7bf3', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '62c930ef-f17a-313a-798f-520f783768ea', 0, '2014-02-02 12:07:16', 0),
('397698b5-ccbb-c4fd-6546-52ee34c7809e', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '66a141af-829c-a6e5-be12-520f78b69501', 0, '2014-02-02 12:07:16', 0),
('3a07bdf9-583f-e43c-889e-52ee34b71c1b', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '61fde8b0-d598-ff95-a611-520f78717657', 0, '2014-02-02 12:07:16', 0),
('3a9b78d3-479d-4948-2018-52ee34bd42a8', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '7b3cd77c-6e12-1a6e-ae3b-520f78130363', 0, '2014-02-02 12:07:16', 0),
('3b1a4d1c-f468-0a16-6424-52ee34039395', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '7e991bcb-4d55-9c79-92ef-520f78dd89b7', 0, '2014-02-02 12:07:16', 0),
('3ba5412f-d520-114c-d576-52ee348de761', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '7dcf43d3-c1a4-95cd-b95b-520f783bfa15', 0, '2014-02-02 12:07:16', 0),
('3c3d6c51-a3f5-0c7d-5c8f-52ee34ce67d2', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '8042f887-807d-5d74-f8a0-520f7861a1ae', 0, '2014-02-02 12:07:16', 0),
('3cd637c3-a8ce-3ff3-d959-52ee34b8d55d', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '7f929818-96e0-fc98-31ba-520f7852ce87', 0, '2014-02-02 12:07:16', 0),
('3d489b68-2524-1cba-e131-52ee34b9133e', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '7cffb629-aaac-386a-4c30-520f7882d920', 0, '2014-02-02 12:07:16', 0),
('3ddd45b0-3bf6-2b30-8dce-52ee342a1b1b', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '81e6a7bb-681b-d218-f8ec-520f78fbd90c', 0, '2014-02-02 12:07:16', 0),
('3e5d0bcb-1220-6f31-d1bd-52ee34a46518', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '7c308b7c-33b8-431d-0aa5-520f78c7da6f', 0, '2014-02-02 12:07:16', 0),
('3efa1659-3cc5-c891-db0d-52ee340dbf76', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '6cb9fb2b-697f-3d7f-4827-520f78f6926b', 0, '2014-02-02 12:07:16', 0),
('3f8b8f51-58a7-03fa-211e-52ee34e863dd', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '6faee3d3-5b2f-9360-3328-520f78be4310', 0, '2014-02-02 12:07:16', 0),
('400a9739-6b30-d851-05b2-52ee34aa1a76', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '6eff9737-057f-5a8d-0b0a-520f786fd84e', 0, '2014-02-02 12:07:16', 0),
('408c10ae-2402-f2e6-2efa-52ee34a67767', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '71626ec8-1d5e-44d7-e6d6-520f784d0b9d', 0, '2014-02-02 12:07:16', 0),
('411c0ed3-56e3-4ecd-4834-52ee34de8395', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '707a0396-aac8-2098-0c2d-520f781d5922', 0, '2014-02-02 12:07:16', 0),
('41a1ba25-aa60-9f83-d7d7-52ee34f48880', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '6e3f4a0d-cd5f-2187-4dac-520f786e46bc', 0, '2014-02-02 12:07:16', 0),
('42268039-b720-6bae-23b5-52ee3442f36b', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '725b9a42-7444-c05b-1efa-520f7833ddf6', 0, '2014-02-02 12:07:16', 0),
('42c16dc4-21c1-11ab-e8fe-52ee34d6ab63', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '6d7f5bcb-b613-c675-c53a-520f7891fd8e', 0, '2014-02-02 12:07:16', 0),
('43416680-4b08-94cc-3200-52ee34d11fac', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'a20d7f87-be31-f31f-36ef-520f7899055c', 0, '2014-02-02 12:07:16', 0),
('43cd25b7-fd3c-1287-b9d0-52ee3430c5c4', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'a5b1901e-51b8-9246-d2d4-520f78e00507', 0, '2014-02-02 12:07:16', 0),
('44a4c060-375c-5aa4-8a12-52ee3459016e', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'a4ed9504-d2e8-dc46-0651-520f788d5496', 0, '2014-02-02 12:07:16', 0),
('452889d1-9203-e156-774a-52ee3415f271', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'a7583f1f-ae27-c673-1951-520f781e2f05', 0, '2014-02-02 12:07:16', 0),
('45c4c736-2aab-e50c-3408-52ee34d9e81a', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'a695ea07-7f30-9e5f-6a78-520f785a0b8f', 0, '2014-02-02 12:07:16', 0),
('46623c8a-b1bd-70b0-624f-52ee3479824b', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'a40058df-6e15-8bca-0a72-520f78ee4ee6', 0, '2014-02-02 12:07:16', 0),
('47023970-b9d3-2d64-e86e-52ee34dd0099', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'a837b3c1-40b7-714a-d5ad-520f78569df0', 0, '2014-02-02 12:07:16', 0),
('47753a51-fd21-240e-1be2-52ee341573ef', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'a31a7f3a-eb28-bb66-18e4-520f7853b9e0', 0, '2014-02-02 12:07:16', 0),
('480df61f-45a7-d30a-74c9-52ee3414a62c', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '53d12815-9985-7b34-b791-520f7897f58f', 0, '2014-02-02 12:07:16', 0),
('4891cc40-da51-15ea-a352-52ee34d22654', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '5761c2a2-f022-8b53-7b7a-520f780bb4a5', 0, '2014-02-02 12:07:16', 0),
('4937dcf6-78a7-95dc-a65c-52ee345e7727', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '566e0ff4-2a86-decb-29cb-520f789b420b', 0, '2014-02-02 12:07:16', 0),
('49ec708d-62be-99d0-f7f2-52ee344b3d5a', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '590de7fe-c218-cd5c-8120-520f78069d65', 0, '2014-02-02 12:07:16', 0),
('4a79afa3-e0d9-ab34-fc36-52ee349cf8c8', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '583098cb-64c5-c719-1eba-520f782cafe4', 0, '2014-02-02 12:07:16', 0),
('4b1d6989-ae4c-045f-17a9-52ee34b0fa31', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '558cc0df-6124-8bfd-aca6-520f78138eac', 0, '2014-02-02 12:07:16', 0),
('4b9f4593-5f4d-f247-1ae7-52ee34b8428f', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '59c8f530-173c-093a-8251-520f7823eaa1', 0, '2014-02-02 12:07:16', 0),
('4c28cdf0-2bbc-71de-62c2-52ee3493bc4f', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '54c88f31-6873-5ffe-3d13-520f783ba908', 0, '2014-02-02 12:07:16', 0),
('4cb8b6fe-ea0f-3dbf-4455-52ee34238f46', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '16aed2ef-c92c-ffd5-b84a-520f7864a008', 0, '2014-02-02 12:07:16', 0),
('4d5efc71-05e1-09a6-500e-52ee341aef8c', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1b17a67a-fc00-c544-bb61-520f786a3088', 0, '2014-02-02 12:07:16', 0),
('4de5c822-868e-1039-dbe7-52ee34f25879', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '19dd0549-f9b3-4b7b-4025-520f786ca107', 0, '2014-02-02 12:07:16', 0),
('4e730ae8-b74a-d85b-648b-52ee34759e92', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1d1a78f3-2efa-8afc-f5c0-520f78925cea', 0, '2014-02-02 12:07:16', 0),
('4f30bb71-05ac-3aac-8889-52ee34f19aa2', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1c2b9fc2-b2e6-c666-bca8-520f78a63730', 0, '2014-02-02 12:07:16', 0),
('4fa54c58-c3eb-a07d-c341-52ee34b604fd', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '18c6f906-3115-bae8-9f39-520f786e446a', 0, '2014-02-02 12:07:16', 0),
('502d26f6-491f-5422-0313-52ee34d3b019', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '1e2c8a08-0905-df7d-e668-520f78f9290d', 0, '2014-02-02 12:07:16', 0),
('50ca90a8-8e37-f789-b28f-52ee34476242', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '17d77024-5637-5f1d-9be3-520f78de60bc', 0, '2014-02-02 12:07:16', 0),
('5162d868-680b-212d-807f-52ee34045b53', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'c21bd645-e39e-107f-e9bd-520f786f27ef', 0, '2014-02-02 12:07:16', 0),
('523d521d-b557-5ab3-8cdf-52ee34fa3e25', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'c5c54da1-1282-74e2-4edd-520f78fb757e', 0, '2014-02-02 12:07:16', 0),
('52e26597-8bf9-e78a-bd46-52ee34f33a22', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'c4e4c9d3-b70b-8b2c-5c4e-520f7809bfb1', 0, '2014-02-02 12:07:16', 0),
('5375bf7a-696c-ad26-a66f-52ee34c6aa2b', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'c7a81714-fbc2-9dda-7139-520f78c1d54e', 0, '2014-02-02 12:07:16', 0),
('5400d318-2308-7832-5975-52ee341aeb76', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'c6a0252a-4634-e031-1fe0-520f7862ad30', 0, '2014-02-02 12:07:16', 0),
('549f9567-3cf2-d96d-3aea-52ee34f646dc', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'c40af388-b229-9929-9de7-520f78926f93', 0, '2014-02-02 12:07:16', 0),
('5547ac57-b80f-e3e3-052b-52ee340fd698', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'c8af79e0-64e3-26ae-092f-520f78978eab', 0, '2014-02-02 12:07:16', 0),
('55c2381a-9561-ff6a-8817-52ee34363604', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'c32d9b49-b96f-83a7-7e79-520f7845db00', 0, '2014-02-02 12:07:16', 0),
('564e961a-ab1a-451a-7d48-52ee342ffcfd', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '2c8adf34-e0e2-6e14-b947-520f78213d70', -98, '2014-02-02 12:07:16', 0),
('56d9f58b-c372-ddbb-1d3c-52ee347856e2', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '34756c84-e027-aff9-a442-520f7866f1b6', 0, '2014-02-02 12:07:16', 0),
('5782960e-58f0-6071-4045-52ee349a08a8', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '327e0810-9ab4-c926-da6a-520f7825c379', 0, '2014-02-02 12:07:16', 0),
('5825a91e-ae24-68f7-23c9-52ee34a47f92', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '3812a2d1-bd9c-7e99-d176-520f786d51b3', 0, '2014-02-02 12:07:16', 0),
('58b0c1d7-6831-9efb-922b-52ee341da446', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '362ba4ac-5545-f978-bef1-520f7855f643', 0, '2014-02-02 12:07:16', 0),
('5958fd84-93a2-3a33-7a84-52ee34077a3f', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '30bbe1e5-62e3-15b8-e2a7-520f78590ee6', 0, '2014-02-02 12:07:16', 0),
('59e0e1d8-1e6e-d9ee-901f-52ee3449ce83', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '39c98d75-e89d-263d-1cf3-520f78232c56', 0, '2014-02-02 12:07:16', 0),
('5a6df8cb-a99b-4f6d-0fea-52ee34c8b923', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '2ed118c7-a5d2-3a95-dbe1-520f78060bdf', 0, '2014-02-02 12:07:16', 0),
('5afc81b3-87e4-cda6-8dbe-52ee34b50af5', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '2d468e66-c349-d272-8be6-520f78b971e9', 0, '2014-02-02 12:07:16', 0),
('5bb007a8-074e-79c2-17f2-52ee34fb1039', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '309efa1c-05dc-18f4-d254-520f78dc753a', 0, '2014-02-02 12:07:16', 0),
('5c40f0dd-34d0-5528-f037-52ee341daa56', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '2fc492d2-5813-c080-35e8-520f78f5d5a8', 0, '2014-02-02 12:07:16', 0),
('5cce698b-da45-27d7-5ddc-52ee34c6618f', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '324e7445-2ce0-28d1-62d6-520f781f283f', 0, '2014-02-02 12:07:16', 0),
('5d9a19e6-d1b7-0f2c-3f45-52ee344bd936', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '3173d684-d31f-e905-36db-520f781aa65f', 0, '2014-02-02 12:07:16', 0),
('5e2f7353-2ddb-7b05-b001-52ee341f5f3a', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '2f084345-9585-5666-042d-520f78c7d4b0', 0, '2014-02-02 12:07:16', 0),
('5ec6fb86-b02f-41de-65c3-52ee34dc98a3', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '331bf500-dd96-801d-67c2-520f7847a229', 0, '2014-02-02 12:07:16', 0),
('5f981c2b-505b-f3ea-80ec-52ee34f0bd15', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '2e203e32-d6ea-b817-f4de-520f788349d1', 0, '2014-02-02 12:07:16', 0),
('603482fb-ab89-a003-3559-52ee34858da5', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'd075bcb2-8fff-59d3-eb40-520f78f27171', 0, '2014-02-02 12:07:16', 0),
('60ca9f0a-f42e-ad16-778a-52ee3414c515', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'd40dad28-74ad-b2cf-7ca2-520f7800a53c', 0, '2014-02-02 12:07:16', 0),
('619bd585-11c4-3dd7-e7ab-52ee345e5b26', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'd33a83f1-7a65-eced-436e-520f787cd2e6', 0, '2014-02-02 12:07:16', 0),
('62720068-9f6f-9d9c-e9ce-52ee3428f627', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'd6018b27-6719-e8a3-676b-520f7883b74c', 0, '2014-02-02 12:07:16', 0),
('630c5928-9124-bd71-155a-52ee34a658af', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'd50d7dfc-3ea9-02db-72f1-520f782d1f26', 0, '2014-02-02 12:07:16', 0),
('63ce123b-45f5-1d46-e7c5-52ee346fd1d6', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'd2632e7b-6e7c-b368-4afe-520f78a6f176', 0, '2014-02-02 12:07:16', 0),
('64687b4f-7ba0-b07c-9f8d-52ee34422c0d', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'd6e975c5-b73b-daa0-92f6-520f7896b879', 0, '2014-02-02 12:07:16', 0),
('64f8cdb2-95b3-81c6-6eee-52ee344ef1bc', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'd18906c4-553b-4cbf-0350-520f78aced5d', 0, '2014-02-02 12:07:16', 0),
('65a509fe-496c-cc9c-7e55-52ee34e609b3', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'ac4cfb56-60af-49f2-e3ca-520f78564952', -98, '2014-02-02 12:07:16', 0),
('66264ec5-d724-addc-0c0e-52ee34a4d073', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'afec73fa-5c70-47dd-dd0f-520f78048b43', 0, '2014-02-02 12:07:16', 0),
('66ba5566-b644-7625-d351-52ee34a6bf88', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'af1e6498-d6dc-d061-3998-520f782d5418', 0, '2014-02-02 12:07:16', 0),
('6757196e-7d64-64f4-3c19-52ee34aa2fdf', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'b19406f8-085e-25f5-b677-520f7825d434', 0, '2014-02-02 12:07:16', 0),
('67efa77c-c045-2da7-4610-52ee347a9c44', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'b0bd1c00-faae-d09d-e709-520f78be513f', 0, '2014-02-02 12:07:16', 0),
('689d3aa9-a5c8-689c-5d3a-52ee34aa28a0', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'adf0f2af-879b-e9c5-f8f9-520f78026f0d', 0, '2014-02-02 12:07:16', 0),
('698ec70c-9352-3942-f1ab-52ee34a24d72', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'b2735918-c5ba-ddc7-b440-520f787a94f3', 0, '2014-02-02 12:07:16', 0),
('6a1a0323-ad2f-bf7f-81d5-52ee348ccdde', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'ad152871-52d2-f4fa-fb63-520f78dfe746', 0, '2014-02-02 12:07:16', 0),
('6ad48c53-c120-393e-4468-52ee34015c75', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'da8dba87-9b2f-332b-7ee1-520f7811d1ed', 0, '2014-02-02 12:07:16', 0),
('6b6943a0-46a8-b02b-35ab-52ee3473156a', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e126a81a-d101-0c46-8d4d-520f7802fd81', 0, '2014-02-02 12:07:16', 0),
('6bfecef3-6744-4a11-076e-52ee34e8cd94', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'df549a06-6062-eaec-6aca-520f7839385b', 0, '2014-02-02 12:07:16', 0),
('6ca6ae3e-9ff7-3d28-b97d-52ee34920d95', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e48d98d9-c502-4674-3776-520f78fa9ff4', 0, '2014-02-02 12:07:16', 0),
('6d3f857f-150f-4558-29f5-52ee34d95a1a', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e306be4f-2602-e1b9-d7c5-520f78fbc8ec', 0, '2014-02-02 12:07:16', 0),
('6df66087-7ad1-9ff6-1eca-52ee346e4515', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'dd81a7f6-5cb8-b02b-6575-520f78dba31e', 0, '2014-02-02 12:07:16', 0),
('6ea5e97f-e1c5-ef68-6387-52ee34cbd978', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'e5d0bfbd-b3b2-6ecd-41a4-520f78e607c5', 0, '2014-02-02 12:07:16', 0),
('6f3aaddd-ecd2-c0f6-6f01-52ee345afb87', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'dbc340b3-6695-cc6c-6967-520f78a46ab2', 0, '2014-02-02 12:07:16', 0),
('6ff3a8cb-6033-a9ba-a660-52ee349df7c9', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '3bca0a80-01ad-10c0-658f-520f78683030', 0, '2014-02-02 12:07:16', 0),
('709caffb-3598-5eef-fdd0-52ee3425c7ec', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '751401d4-11c0-d119-227a-520f787be3b1', 0, '2014-02-02 12:07:16', 0),
('712f80ee-853c-6ecb-12d0-52ee346f0a13', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '67400e35-2eb8-e6d5-9366-520f785c1aa3', 0, '2014-02-02 12:07:16', 0),
('71e731a4-a1b7-b48b-0bbb-52ee34967c15', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '8eea0ca0-0f1b-8f36-0f1e-520f78f9d057', 0, '2014-02-02 12:07:16', 0),
('7279882e-7d30-5b8c-95c5-52ee347e4df9', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '820a0a65-f247-a163-a398-520f784740ed', 0, '2014-02-02 12:07:16', 0),
('73202fa2-cd33-f581-af2a-52ee34862ee0', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '59980c62-eb61-fdaf-d1a5-520f78389fc2', 0, '2014-02-02 12:07:16', 0),
('73b6d5d6-c9c0-9365-9ee6-52ee34bd6f14', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '9c2f078a-d7c8-609e-aa43-520f78a36360', 0, '2014-02-02 12:07:16', 0),
('74508f32-fe1c-c6e2-ccab-52ee34716deb', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '4a6d0a31-5870-b011-07ed-520f78820b82', 0, '2014-02-02 12:07:16', 0),
('74f26371-e998-557b-06e8-52ee34cce41e', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '30c9c246-8fe7-1ab4-2eac-520f78120ff2', 0, '2014-02-02 12:07:16', 0),
('757efff6-ff0b-5085-a75f-52ee34680ddb', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '3475f0b6-9edc-b8b5-5a49-520f7884e504', 0, '2014-02-02 12:07:16', 0),
('76348c4c-acad-1455-2e0c-52ee34a82315', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '338f3aff-a8f0-6c81-8054-520f78608cb7', 0, '2014-02-02 12:07:16', 0),
('76ff1e06-a7f5-6da8-199e-52ee34aec8e1', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '36499544-5297-66f2-3bd0-520f7858ebf1', 0, '2014-02-02 12:07:16', 0),
('7794daf2-507e-e3e0-20b3-52ee34cfd283', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '356ab463-88c3-005d-0feb-520f78298751', 0, '2014-02-02 12:07:16', 0),
('78500266-4bba-657d-0594-52ee34255a76', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '32b23dd4-0945-42b0-bf8f-520f789951fd', 0, '2014-02-02 12:07:16', 0),
('78f390cf-84f1-e012-fb59-52ee34a30738', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '374efd3a-d766-3bfa-7970-520f789bd5a0', 0, '2014-02-02 12:07:16', 0),
('799346e4-d924-adf2-44da-52ee348c5730', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '31a6438c-573b-6856-e5b3-520f78c627f3', 0, '2014-02-02 12:07:16', 0),
('7a623780-6a24-4722-af27-52ee34eb5966', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '4054c361-ae2e-dc0b-1c61-520f780866df', 0, '2014-02-02 12:07:16', 0),
('7b0b112a-dbd8-4eea-7f5d-52ee342d0650', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '43d17cb4-17ad-3c7a-2b76-520f78ade9ba', 0, '2014-02-02 12:07:16', 0),
('7ba64a1c-df03-6071-94b9-52ee34e86d8b', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '42ea5779-5751-0680-7fc8-520f7889f7c0', 0, '2014-02-02 12:07:16', 0),
('7c757468-78d3-4bb3-01bd-52ee34999137', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '458aab12-6bdd-5625-7c93-520f78879d82', 0, '2014-02-02 12:07:16', 0),
('7d1b5a5d-4337-2ea5-1ff3-52ee34a56074', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '44a93e04-1b7e-04dd-ec45-520f78fd55ef', 0, '2014-02-02 12:07:16', 0),
('7db77d8b-06bf-b78a-6975-52ee34b39967', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '41df2cc3-705b-3d94-3843-520f7820268d', 0, '2014-02-02 12:07:16', 0),
('7e7ef623-eef9-3a1a-5ce2-52ee345a0cda', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '466714df-1ed8-2d19-41ca-520f78e013d0', 0, '2014-02-02 12:07:16', 0),
('7f230426-25ba-506e-19aa-52ee34fabbf6', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '41264318-64a6-cf95-730f-520f78e2fdab', 0, '2014-02-02 12:07:16', 0),
('7fd87ecf-100f-d0c6-67dc-52ee34c636a1', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '3d73cc83-23fc-f509-856e-520f78afb3ac', 0, '2014-02-02 12:07:16', 0),
('807a75df-416a-1f23-859c-52ee34f8a3e0', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '41076f88-f570-1f17-cb08-520f789629b7', 0, '2014-02-02 12:07:16', 0),
('8121e631-27d2-7828-a955-52ee341b23f1', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '40266d6a-a9d1-2372-dcf0-520f783fdfee', 0, '2014-02-02 12:07:16', 0),
('81d509b1-4fbc-e33b-286f-52ee3405cca5', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '42c09c52-a7ba-2306-2699-520f785ec4c7', 0, '2014-02-02 12:07:16', 0),
('8283ea11-58e2-c238-47c7-52ee34c05dc2', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '41bd180f-705f-036f-0a65-520f784746de', 0, '2014-02-02 12:07:16', 0),
('8326c3f2-650f-e92f-4bd4-52ee3400bdf2', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '3f12bfe0-418c-0644-b827-520f787df8a7', 0, '2014-02-02 12:07:16', 0),
('83d5f572-b2ad-6a9d-4b18-52ee34fadbcf', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '43cb3fd3-7ae7-8cc1-d00f-520f78a97cdf', 0, '2014-02-02 12:07:16', 0),
('8483deaa-80f9-3ffe-25f0-52ee344da9a2', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '3e56cec2-d8b3-e453-9618-520f780a56cc', 0, '2014-02-02 12:07:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_users`
--

CREATE TABLE IF NOT EXISTS `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_roles_users`
--

INSERT INTO `acl_roles_users` (`id`, `role_id`, `user_id`, `date_modified`, `deleted`) VALUES
('b2a17a8b-7cf6-72ac-51d2-5358556e2455', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', '27f85892-8c01-22f6-ee95-535854ef16aa', '2014-04-24 00:05:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_audit`
--

CREATE TABLE IF NOT EXISTS `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE IF NOT EXISTS `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_contacts`
--

CREATE TABLE IF NOT EXISTS `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_leads`
--

CREATE TABLE IF NOT EXISTS `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_users`
--

CREATE TABLE IF NOT EXISTS `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_audit`
--

CREATE TABLE IF NOT EXISTS `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_log`
--

CREATE TABLE IF NOT EXISTS `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_trkrs`
--

CREATE TABLE IF NOT EXISTS `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE IF NOT EXISTS `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cases_audit`
--

CREATE TABLE IF NOT EXISTS `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_bugs`
--

CREATE TABLE IF NOT EXISTS `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('notify', 'fromaddress', 'do_not_reply@example.com'),
('notify', 'fromname', 'Tasken'),
('notify', 'send_by_default', '1'),
('notify', 'on', '1'),
('notify', 'send_from_assigning_user', '0'),
('info', 'sugar_version', '6.5.9'),
('MySettings', 'tab', 'YTo4OntpOjA7czo0OiJIb21lIjtpOjE7czoxOToiU1dOQV9TTlJXTE5FV0FDVElWRSI7aToyO3M6MjI6IkpXTkFfSlVOSU9SV0xORVdBQ1RJVkUiO2k6MztzOjI4OiJIV0xBX0hBUkFTQVdBSVRJTkdMSVNUQUNUSVZFIjtpOjQ7czoyMToiVldOQV9WSUxMQVdMTkVXQUNUSVZFIjtpOjU7czo4OiJBY2NvdW50cyI7aTo2O3M6ODoiQ29udGFjdHMiO2k6NztzOjMyOiJXTE1DQV9XQUlUSU5HTElTVE1TRENMSU5JQ0FDVElWRSI7fQ=='),
('portal', 'on', '0'),
('tracker', 'Tracker', '1'),
('system', 'skypeout_on', '1'),
('sugarfeed', 'enabled', '1'),
('sugarfeed', 'module_UserFeed', '1'),
('sugarfeed', 'module_Cases', '1'),
('sugarfeed', 'module_Contacts', '1'),
('sugarfeed', 'module_Leads', '1'),
('sugarfeed', 'module_Opportunities', '1'),
('Update', 'CheckUpdates', 'manual'),
('system', 'name', 'سراء لطلبات السكن'),
('system', 'adminwizard', '1'),
('MySettings', 'disable_useredit', 'yes'),
('MySettings', 'hide_subpanels', 'YToxMzp7czo5OiJkb2N1bWVudHMiO3M6OToiZG9jdW1lbnRzIjtzOjEzOiJwcm9zcGVjdGxpc3RzIjtzOjEzOiJwcm9zcGVjdGxpc3RzIjtzOjk6InByb3NwZWN0cyI7czo5OiJwcm9zcGVjdHMiO3M6NToibGVhZHMiO3M6NToibGVhZHMiO3M6NToibm90ZXMiO3M6NToibm90ZXMiO3M6ODoibWVldGluZ3MiO3M6ODoibWVldGluZ3MiO3M6NToiY2FzZXMiO3M6NToiY2FzZXMiO3M6ODoiYWNjb3VudHMiO3M6ODoiYWNjb3VudHMiO3M6NzoicHJvamVjdCI7czo3OiJwcm9qZWN0IjtzOjEzOiJvcHBvcnR1bml0aWVzIjtzOjEzOiJvcHBvcnR1bml0aWVzIjtzOjQ6ImJ1Z3MiO3M6NDoiYnVncyI7czoxMToiY2FtcGFpZ25sb2ciO3M6MTE6ImNhbXBhaWdubG9nIjtzOjg6ImNvbnRhY3RzIjtzOjg6ImNvbnRhY3RzIjt9'),
('notify', 'allow_default_outbound', '0'),
('proxy', 'on', '0'),
('proxy', 'host', ''),
('proxy', 'port', ''),
('proxy', 'auth', '0'),
('proxy', 'username', 'admin'),
('proxy', 'password', 'OYrvEo0yKzQ=');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_audit`
--

CREATE TABLE IF NOT EXISTS `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_bugs`
--

CREATE TABLE IF NOT EXISTS `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cases`
--

CREATE TABLE IF NOT EXISTS `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_users`
--

CREATE TABLE IF NOT EXISTS `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_accounts`
--

CREATE TABLE IF NOT EXISTS `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_bugs`
--

CREATE TABLE IF NOT EXISTS `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_cases`
--

CREATE TABLE IF NOT EXISTS `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_contacts`
--

CREATE TABLE IF NOT EXISTS `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_opportunities`
--

CREATE TABLE IF NOT EXISTS `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_revisions`
--

CREATE TABLE IF NOT EXISTS `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eapm`
--

CREATE TABLE IF NOT EXISTS `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emailman`
--

CREATE TABLE IF NOT EXISTS `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_beans`
--

CREATE TABLE IF NOT EXISTS `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_email_addr_rel`
--

CREATE TABLE IF NOT EXISTS `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_text`
--

CREATE TABLE IF NOT EXISTS `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE IF NOT EXISTS `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `email_address`, `email_address_caps`, `invalid_email`, `opt_out`, `date_created`, `date_modified`, `deleted`) VALUES
('24c94c74-4621-b307-e06e-53561dd1eb09', 'sraaa@mail.com', 'SRAAA@MAIL.COM', 0, 0, '2014-04-22 07:43:42', '2014-04-22 07:43:42', 0),
('2b519c72-19ff-58d3-b094-5358540140d1', 'ahmed@own-source.com', 'AHMED@OWN-SOURCE.COM', 0, 0, '2014-04-24 00:01:54', '2014-04-24 00:01:54', 0),
('629c7bae-1586-95e6-a4a9-520f79eba79c', 'ahmed@mail.com', 'AHMED@MAIL.COM', 0, 0, '2013-08-17 13:23:11', '2013-08-17 13:23:11', 0),
('bd510b3f-4bca-dbaf-2701-53561e8ad7cb', 'morad@mail.com', 'MORAD@MAIL.COM', 0, 0, '2014-04-22 07:46:59', '2014-04-22 07:46:59', 0),
('c977a14d-0171-05e3-72c3-53558968066f', 'admin@mail.com', 'ADMIN@MAIL.COM', 0, 0, '2014-04-21 21:11:30', '2014-04-21 21:11:30', 0),
('ce7b976e-24db-8621-d7ab-53563591259f', 'morad@own-source.com', 'MORAD@OWN-SOURCE.COM', 0, 0, '2014-04-22 09:24:36', '2014-04-22 09:24:36', 0),
('e59e2aed-aaed-09de-bee7-53561c628826', 'mail@mail.com', 'MAIL@MAIL.COM', 0, 0, '2014-04-22 07:40:25', '2014-04-22 07:40:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_addr_bean_rel`
--

CREATE TABLE IF NOT EXISTS `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addr_bean_rel`
--

INSERT INTO `email_addr_bean_rel` (`id`, `email_address_id`, `bean_id`, `bean_module`, `primary_address`, `reply_to_address`, `date_created`, `date_modified`, `deleted`) VALUES
('24ac40c6-717e-b5c6-740b-53561ded3ea3', '24c94c74-4621-b307-e06e-53561dd1eb09', 'def89416-e718-d948-9635-53561c7d2a9b', 'Users', 1, 0, '2014-04-22 07:43:42', '2014-04-22 07:43:42', 0),
('2b3f2d46-d4f1-dcce-791e-535854a7c18a', '2b519c72-19ff-58d3-b094-5358540140d1', '27f85892-8c01-22f6-ee95-535854ef16aa', 'Users', 1, 0, '2014-04-24 00:01:54', '2014-04-24 00:01:54', 0),
('6281822c-6285-ada2-362f-520f79a7463a', '629c7bae-1586-95e6-a4a9-520f79eba79c', '1', 'Users', 1, 0, '2013-08-17 13:23:11', '2013-08-17 13:23:11', 0),
('bd3c4afd-eb59-fe5e-05dc-53561e15bd32', 'bd510b3f-4bca-dbaf-2701-53561e8ad7cb', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'Users', 1, 0, '2014-04-22 07:46:59', '2014-04-22 07:46:59', 1),
('c543fd85-e1fc-466d-0942-53558923db68', 'c977a14d-0171-05e3-72c3-53558968066f', 'c110dda1-5b21-a328-666e-5355894d667c', 'Users', 1, 0, '2014-04-21 21:11:30', '2014-04-21 21:11:30', 0),
('ce4fff58-e29c-7000-eb37-53563599cbdf', 'ce7b976e-24db-8621-d7ab-53563591259f', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'Users', 1, 0, '2014-04-22 09:24:36', '2014-04-22 09:24:36', 0),
('e34774f5-bd5f-3b99-ceaa-53561c33e84d', 'e59e2aed-aaed-09de-bee7-53561c628826', 'def89416-e718-d948-9635-53561c7d2a9b', 'Users', 1, 0, '2014-04-22 07:40:25', '2014-04-22 07:40:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_cache`
--

CREATE TABLE IF NOT EXISTS `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing`
--

CREATE TABLE IF NOT EXISTS `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing_prospect_lists`
--

CREATE TABLE IF NOT EXISTS `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `published`, `name`, `description`, `subject`, `body`, `body_html`, `deleted`, `assigned_user_id`, `text_only`, `type`) VALUES
('d81a6b10-9e35-7d8c-c5a6-520f780c0c1a', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width="550"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL),
('dce3ae2f-2c55-1154-6275-520f785aa757', '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user''s account password.', 'Reset your account password', '\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid', '<div><table width="550"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fields_meta_data`
--

CREATE TABLE IF NOT EXISTS `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields_meta_data`
--

INSERT INTO `fields_meta_data` (`id`, `name`, `vname`, `comments`, `help`, `custom_module`, `type`, `len`, `required`, `default_value`, `date_modified`, `deleted`, `audited`, `massupdate`, `duplicate_merge`, `reportable`, `importable`, `ext1`, `ext2`, `ext3`, `ext4`) VALUES
('HWLA_HARASAWAITINGLISTACTIVEappdate_c', 'appdate_c', 'LBL_APPDATE', '', '', 'HWLA_HARASAWAITINGLISTACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:54:19', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('HWLA_HARASAWAITINGLISTACTIVEgrade_c', 'grade_c', 'LBL_GRADE', '', '', 'HWLA_HARASAWAITINGLISTACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:53:38', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('HWLA_HARASAWAITINGLISTACTIVEmilmsd_c', 'milmsd_c', 'LBL_MILMSD', '', '', 'HWLA_HARASAWAITINGLISTACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:53:20', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('HWLA_HARASAWAITINGLISTACTIVEmsd_c', 'msd_c', 'LBL_MSD', '', '', 'HWLA_HARASAWAITINGLISTACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:52:54', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('HWLA_HARASAWAITINGLISTACTIVEnoofdep_c', 'noofdep_c', 'LBL_NOOFDEP', '', '', 'HWLA_HARASAWAITINGLISTACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:54:46', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('HWLA_HARASAWAITINGLISTACTIVEpaccom_c', 'paccom_c', 'LBL_PACCOM', '', '', 'HWLA_HARASAWAITINGLISTACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:53:57', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('HWLA_HARASAWAITINGLISTACTIVEremarks_c', 'remarks_c', 'LBL_REMARKS', '', '', 'HWLA_HARASAWAITINGLISTACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:55:33', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('HWLA_HARASAWAITINGLISTACTIVEsno_c', 'sno_c', 'LBL_SNO', '', '', 'HWLA_HARASAWAITINGLISTACTIVE', 'varchar', 255, 1, '', '2014-04-21 19:51:28', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('JWNA_JUNIORWLNEWACTIVEappdate_c', 'appdate_c', 'LBL_APPDATE', '', '', 'JWNA_JUNIORWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:38:35', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('JWNA_JUNIORWLNEWACTIVEgrade_c', 'grade_c', 'LBL_GRADE', '', '', 'JWNA_JUNIORWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:37:55', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('JWNA_JUNIORWLNEWACTIVEmilmsd_c', 'milmsd_c', 'LBL_MILMSD', '', '', 'JWNA_JUNIORWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:37:36', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('JWNA_JUNIORWLNEWACTIVEmsd_c', 'msd_c', 'LBL_MSD', '', '', 'JWNA_JUNIORWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:37:19', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('JWNA_JUNIORWLNEWACTIVEnoofdep_c', 'noofdep_c', 'LBL_NOOFDEP', '', '', 'JWNA_JUNIORWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:38:56', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('JWNA_JUNIORWLNEWACTIVEpaccom_c', 'paccom_c', 'LBL_PACCOM', '', '', 'JWNA_JUNIORWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:38:12', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('JWNA_JUNIORWLNEWACTIVEremarks_c', 'remarks_c', 'LBL_REMARKS', '', '', 'JWNA_JUNIORWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:39:10', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('JWNA_JUNIORWLNEWACTIVEsno_c', 'sno_c', 'LBL_SNO', '', '', 'JWNA_JUNIORWLNEWACTIVE', 'varchar', 255, 1, '', '2014-04-21 20:37:01', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Plcs_File_taskenappdate_c', 'appdate_c', 'LBL_APPDATE', NULL, NULL, 'Plcs_File_tasken', 'varchar', 255, 0, NULL, '2014-04-17 09:05:05', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Plcs_File_taskengrade_c', 'grade_c', 'LBL_GRADE', NULL, NULL, 'Plcs_File_tasken', 'varchar', 255, 0, NULL, '2014-04-17 09:05:21', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Plcs_File_taskenmilmsd_c', 'milmsd_c', 'LBL_MILMSD', NULL, NULL, 'Plcs_File_tasken', 'varchar', 255, 0, NULL, '2014-04-17 09:09:52', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Plcs_File_taskenmsd_c', 'msd_c', 'LBL_MSD', NULL, NULL, 'Plcs_File_tasken', 'varchar', 255, 0, NULL, '2014-04-17 09:02:51', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Plcs_File_taskennoofdep_c', 'noofdep_c', 'LBL_NOOFDEP', NULL, NULL, 'Plcs_File_tasken', 'varchar', 255, 0, NULL, '2014-04-17 09:10:31', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('Plcs_File_taskenpaccom_c', 'paccom_c', 'LBL_PACCOM', '', '', 'Plcs_File_tasken', 'varchar', 255, 0, '', '2014-04-17 08:50:10', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Plcs_File_taskenremarks_c', 'remarks_c', 'LBL_REMARKS', '', '', 'Plcs_File_tasken', 'varchar', 255, 0, '', '2014-04-17 08:51:59', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('Plcs_File_taskensno_c', 'sno_c', 'LBL_SNO', NULL, NULL, 'Plcs_File_tasken', 'varchar', 255, 0, NULL, '2014-04-17 09:03:17', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('SWNA_SNRWLNEWACTIVEappdate_c', 'appdate_c', 'LBL_APPDATE', '', '', 'SWNA_SNRWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:21:44', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('SWNA_SNRWLNEWACTIVEgrade_c', 'grade_c', 'LBL_GRADE', '', '', 'SWNA_SNRWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:20:40', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('SWNA_SNRWLNEWACTIVEmilmsd_c', 'milmsd_c', 'LBL_MILMSD', '', '', 'SWNA_SNRWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:20:03', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('SWNA_SNRWLNEWACTIVEmsd_c', 'msd_c', 'LBL_MSD', NULL, NULL, 'SWNA_SNRWLNEWACTIVE', 'varchar', 255, 0, NULL, '2014-04-21 19:19:34', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('SWNA_SNRWLNEWACTIVEnoofdep_c', 'noofdep_c', 'LBL_NOOFDEP', '', '', 'SWNA_SNRWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:22:11', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('SWNA_SNRWLNEWACTIVEpaccom_c', 'paccom_c', 'LBL_PACCOM', '', '', 'SWNA_SNRWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:21:16', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('SWNA_SNRWLNEWACTIVEremarks_c', 'remarks_c', 'LBL_REMARKS', '', '', 'SWNA_SNRWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 19:22:26', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('SWNA_SNRWLNEWACTIVEsno_c', 'sno_c', 'LBL_SNO', '', '', 'SWNA_SNRWLNEWACTIVE', 'varchar', 255, 1, '', '2014-04-21 19:18:51', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('VWNA_VILLAWLNEWACTIVEappdate_c', 'appdate_c', 'LBL_APPDATE', NULL, NULL, 'VWNA_VILLAWLNEWACTIVE', 'varchar', 255, 0, NULL, '2014-04-21 18:50:08', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('VWNA_VILLAWLNEWACTIVEgrade_c', 'grade_c', 'LBL_GRADE', '', '', 'VWNA_VILLAWLNEWACTIVE', 'varchar', 255, 1, '', '2014-04-21 18:43:18', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('VWNA_VILLAWLNEWACTIVEmilmsd_c', 'milmsd_c', 'LBL_MILMSD', '', '', 'VWNA_VILLAWLNEWACTIVE', 'varchar', 255, 1, '', '2014-04-21 18:41:00', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('VWNA_VILLAWLNEWACTIVEmsd_c', 'msd_c', 'LBL_MSD', '', '', 'VWNA_VILLAWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 18:40:28', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('VWNA_VILLAWLNEWACTIVEnoofdep_c', 'noofdep_c', 'LBL_NOOFDEP', '', '', 'VWNA_VILLAWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 18:48:44', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('VWNA_VILLAWLNEWACTIVEpaccom_c', 'paccom_c', 'LBL_PACCOM', '', '', 'VWNA_VILLAWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 18:44:50', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('VWNA_VILLAWLNEWACTIVEremarks_c', 'remarks_c', 'LBL_REMARKS', '', '', 'VWNA_VILLAWLNEWACTIVE', 'varchar', 255, 0, '', '2014-04-21 18:49:13', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('VWNA_VILLAWLNEWACTIVEsno_c', 'sno_c', 'LBL_SNO', '', '', 'VWNA_VILLAWLNEWACTIVE', 'varchar', 255, 1, '', '2014-04-21 18:38:46', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('WLMCA_WAITINGLISTMSDCLINICACTIVEappdate_c', 'appdate_c', 'LBL_APPDATE', '', '', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:47:08', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('WLMCA_WAITINGLISTMSDCLINICACTIVEgrade_c', 'grade_c', 'LBL_GRADE', '', '', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:46:35', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('WLMCA_WAITINGLISTMSDCLINICACTIVEmilmsd_c', 'milmsd_c', 'LBL_MILMSD', '', '', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:46:23', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('WLMCA_WAITINGLISTMSDCLINICACTIVEmsd_c', 'msd_c', 'LBL_MSD', '', '', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:46:12', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('WLMCA_WAITINGLISTMSDCLINICACTIVEnoofdep_c', 'noofdep_c', 'LBL_NOOFDEP', '', '', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:47:27', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('WLMCA_WAITINGLISTMSDCLINICACTIVEpaccom_c', 'paccom_c', 'LBL_PACCOM', '', '', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:46:49', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('WLMCA_WAITINGLISTMSDCLINICACTIVEremarks_c', 'remarks_c', 'LBL_REMARKS', '', '', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'varchar', 255, 0, '', '2014-04-21 20:47:38', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('WLMCA_WAITINGLISTMSDCLINICACTIVEsno_c', 'sno_c', 'LBL_SNO', '', '', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'varchar', 255, 1, '', '2014-04-21 20:45:54', 0, 0, 0, 0, 1, 'true', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_rel`
--

CREATE TABLE IF NOT EXISTS `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_subscriptions`
--

CREATE TABLE IF NOT EXISTS `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hmng_homing`
--

CREATE TABLE IF NOT EXISTS `hmng_homing` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hmng_homing_audit`
--

CREATE TABLE IF NOT EXISTS `hmng_homing_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_hmng_homing_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hwla_harasawaitinglistactive`
--

CREATE TABLE IF NOT EXISTS `hwla_harasawaitinglistactive` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hwla_harasawaitinglistactive_audit`
--

CREATE TABLE IF NOT EXISTS `hwla_harasawaitinglistactive_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_hwla_harasawaitinglistactive_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hwla_harasawaitinglistactive_cstm`
--

CREATE TABLE IF NOT EXISTS `hwla_harasawaitinglistactive_cstm` (
  `id_c` char(36) NOT NULL,
  `sno_c` varchar(255) DEFAULT NULL,
  `msd_c` varchar(255) DEFAULT NULL,
  `milmsd_c` varchar(255) DEFAULT NULL,
  `grade_c` varchar(255) DEFAULT NULL,
  `paccom_c` varchar(255) DEFAULT NULL,
  `appdate_c` varchar(255) DEFAULT NULL,
  `noofdep_c` varchar(255) DEFAULT NULL,
  `remarks_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `import_maps`
--

CREATE TABLE IF NOT EXISTS `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `import_maps`
--

INSERT INTO `import_maps` (`id`, `name`, `source`, `enclosure`, `delimiter`, `module`, `content`, `default_values`, `has_header`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `is_published`) VALUES
('98d1f023-15cc-4255-715d-534f9bab912f', 'الإفتراضي', 'outlook', '"', ',', 'Plcs_File_tasken', 'S.NO=sno_c&NAME=full_name&DEPT=department&MSD #=msd_c&MIL/MSD=milmsd_c&GRADE=grade_c&P. ACCOM.=paccom_c&APP. DATE=appdate_c&NO. OF DEP.=noofdep_c&REMARKS=remarks_c&importlocale_charset=UTF-8&importlocale_dateformat=m/d/Y&importlocale_timeformat=h:ia&importlocale_timezone=UTC&importlocale_currency=-99&importlocale_default_currency_significant_digits=2&importlocale_num_grp_sep=,&importlocale_dec_sep=.&importlocale_default_locale_name_format=s f l', '', 1, 0, '2014-04-17 09:14:23', '2014-04-17 09:14:23', '1', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email`
--

CREATE TABLE IF NOT EXISTS `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_autoreply`
--

CREATE TABLE IF NOT EXISTS `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_cache_ts`
--

CREATE TABLE IF NOT EXISTS `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_queue`
--

CREATE TABLE IF NOT EXISTS `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jwna_juniorwlnewactive`
--

CREATE TABLE IF NOT EXISTS `jwna_juniorwlnewactive` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jwna_juniorwlnewactive`
--

INSERT INTO `jwna_juniorwlnewactive` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`) VALUES
('5f29bbfc-b157-4dae-d92f-53558724e517', '2014-04-21 21:04:49', '2014-04-21 21:04:49', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Assiri, Mohd. Ahmed', NULL, 'Ambulance', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('62f4b21c-d3f4-e827-360a-535587cf1957', '2014-04-21 21:04:49', '2014-04-21 21:04:49', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Qahtani, Ali Saeed', NULL, 'Training', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6703a9b9-0faa-3cd8-b4f4-5355875fb4f0', '2014-04-21 21:04:49', '2014-04-21 21:04:49', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Aboodi, Abdullah Mohd.', NULL, 'Training', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('69a549fe-450d-9a9b-278b-53558718b9de', '2014-04-21 21:04:49', '2014-04-21 21:04:49', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Harti, Badar Rabah 4957022', NULL, 'F & C Med.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('6c4f3183-770d-b852-a7cd-5355874e13df', '2014-04-21 21:04:49', '2014-04-21 21:04:49', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Ghanim, Mussad Dakeel', NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jwna_juniorwlnewactive_audit`
--

CREATE TABLE IF NOT EXISTS `jwna_juniorwlnewactive_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jwna_juniorwlnewactive_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jwna_juniorwlnewactive_cstm`
--

CREATE TABLE IF NOT EXISTS `jwna_juniorwlnewactive_cstm` (
  `id_c` char(36) NOT NULL,
  `sno_c` varchar(255) DEFAULT NULL,
  `msd_c` varchar(255) DEFAULT NULL,
  `milmsd_c` varchar(255) DEFAULT NULL,
  `grade_c` varchar(255) DEFAULT NULL,
  `paccom_c` varchar(255) DEFAULT NULL,
  `appdate_c` varchar(255) DEFAULT NULL,
  `noofdep_c` varchar(255) DEFAULT NULL,
  `remarks_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jwna_juniorwlnewactive_cstm`
--

INSERT INTO `jwna_juniorwlnewactive_cstm` (`id_c`, `sno_c`, `msd_c`, `milmsd_c`, `grade_c`, `paccom_c`, `appdate_c`, `noofdep_c`, `remarks_c`) VALUES
('5f29bbfc-b157-4dae-d92f-53558724e517', '1', '80445', 'Military', '12', 'outside', '27-Oct-91', 'wife & 7 children', ''),
('62f4b21c-d3f4-e827-360a-535587cf1957', '2', '231459', 'Military', 'Sgt', 'outside', '24-Sep-94', 'wife', ''),
('6703a9b9-0faa-3cd8-b4f4-5355875fb4f0', '3', '244323', 'Military', 'Sgt', 'outside', '4-Jun-95', 'wife', ''),
('69a549fe-450d-9a9b-278b-53558718b9de', '4', '244322', 'Military', 'W.Raq', 'outside', '3-Mar-96', 'wife & 3 children', '541752993'),
('6c4f3183-770d-b852-a7cd-5355874e13df', '5', '90203499', 'MSD', 'M-5', 'outside', '19-Jan-97', 'wife', '');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_audit`
--

CREATE TABLE IF NOT EXISTS `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `linked_documents`
--

CREATE TABLE IF NOT EXISTS `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE IF NOT EXISTS `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_contacts`
--

CREATE TABLE IF NOT EXISTS `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_leads`
--

CREATE TABLE IF NOT EXISTS `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_users`
--

CREATE TABLE IF NOT EXISTS `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

CREATE TABLE IF NOT EXISTS `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_audit`
--

CREATE TABLE IF NOT EXISTS `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_contacts`
--

CREATE TABLE IF NOT EXISTS `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email`
--

CREATE TABLE IF NOT EXISTS `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oe_user_id_idx` (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbound_email`
--

INSERT INTO `outbound_email` (`id`, `name`, `type`, `user_id`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`) VALUES
('398b0512-303f-229c-8bfa-5358547526a2', 'system', 'system-override', '27f85892-8c01-22f6-ee95-535854ef16aa', 'SMTP', 'other', 'smtp://own-source.com', 26, 'admin', 'LzoSupuRkDs=', 1, 0),
('727fa0ba-1e98-3632-eaec-53561d9c622c', 'system', 'system-override', 'def89416-e718-d948-9635-53561c7d2a9b', 'SMTP', 'other', 'smtp://own-source.com', 26, 'sraaa', 'Zv/tW/v6Kbs=', 1, 0),
('c5e7c94b-3211-85f5-042d-53561e37e93a', 'system', 'system-override', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'SMTP', 'other', 'smtp://own-source.com', 26, 'morad', 'jgNRwpxDdzo=', 1, 0),
('d487b049-3a36-60f0-6541-53558948da68', 'system', 'system-override', 'c110dda1-5b21-a328-666e-5355894d667c', 'SMTP', 'other', 'smtp://own-source.com', 26, 'admin', 'LzoSupuRkDs=', 1, 0),
('e3f0b730-175d-8127-dc8b-520f781ec1fc', 'system', 'system', '1', 'SMTP', 'other', 'smtp://own-source.com', 26, 'tasken', 'MByGouLzzS4P0/kWZtd87g==', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plcs_file_tasken`
--

CREATE TABLE IF NOT EXISTS `plcs_file_tasken` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plcs_file_tasken`
--

INSERT INTO `plcs_file_tasken` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`) VALUES
('85000b05-4411-1e15-c356-534f9b152d81', '2014-04-17 09:14:23', '2014-04-17 09:14:23', '1', '1', NULL, 0, '1', NULL, 'Al', 'Assiri, Mohd. Ahmed', NULL, 'Ambulance', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('89e6fb1a-8ac9-ee30-41a2-534f9b3d93f8', '2014-04-17 09:14:23', '2014-04-17 09:14:23', '1', '1', NULL, 0, '1', NULL, 'Al', 'Qahtani, Ali Saeed', NULL, 'Training', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8e03fb5a-4373-238f-fc24-534f9b8b041c', '2014-04-17 09:14:23', '2014-04-17 09:14:23', '1', '1', NULL, 0, '1', NULL, 'Al', 'Aboodi, Abdullah Mohd.', NULL, 'Training', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('91cc956e-1093-ddb7-5e90-534f9baca43a', '2014-04-17 09:14:23', '2014-04-17 09:14:23', '1', '1', NULL, 0, '1', NULL, 'Al', 'Harti, Badar Rabah 4957022', NULL, 'F & C Med.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('95735b2d-d469-9a9b-e59d-534f9b4f51ed', '2014-04-17 09:14:23', '2014-04-17 09:14:23', '1', '1', NULL, 0, '1', NULL, 'Al', 'Ghanim, Mussad Dakeel', NULL, '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plcs_file_tasken_audit`
--

CREATE TABLE IF NOT EXISTS `plcs_file_tasken_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_plcs_file_tasken_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plcs_file_tasken_cstm`
--

CREATE TABLE IF NOT EXISTS `plcs_file_tasken_cstm` (
  `id_c` char(36) NOT NULL,
  `sno_c` varchar(255) DEFAULT NULL,
  `msd_c` varchar(255) DEFAULT NULL,
  `milmsd_c` varchar(255) DEFAULT NULL,
  `grade_c` varchar(255) DEFAULT NULL,
  `paccom_c` varchar(255) DEFAULT NULL,
  `appdate_c` varchar(255) DEFAULT NULL,
  `noofdep_c` varchar(255) DEFAULT NULL,
  `remarks_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plcs_file_tasken_cstm`
--

INSERT INTO `plcs_file_tasken_cstm` (`id_c`, `sno_c`, `msd_c`, `milmsd_c`, `grade_c`, `paccom_c`, `appdate_c`, `noofdep_c`, `remarks_c`) VALUES
('85000b05-4411-1e15-c356-534f9b152d81', '1', '80445', 'Military', '12', 'outside', '27-Oct-91', 'wife & 7 children', ''),
('89e6fb1a-8ac9-ee30-41a2-534f9b3d93f8', '2', '231459', 'Military', 'Sgt', 'outside', '24-Sep-94', 'wife', ''),
('8e03fb5a-4373-238f-fc24-534f9b8b041c', '3', '244323', 'Military', 'Sgt', 'outside', '4-Jun-95', 'wife', ''),
('91cc956e-1093-ddb7-5e90-534f9baca43a', '4', '244322', 'Military', 'W.Raq', 'outside', '3-Mar-96', 'wife & 3 children', '541752993'),
('95735b2d-d469-9a9b-e59d-534f9b4f51ed', '5', '90203499', 'MSD', 'M-5', 'outside', '19-Jan-97', 'wife', '');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_accounts`
--

CREATE TABLE IF NOT EXISTS `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_bugs`
--

CREATE TABLE IF NOT EXISTS `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_cases`
--

CREATE TABLE IF NOT EXISTS `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_contacts`
--

CREATE TABLE IF NOT EXISTS `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_opportunities`
--

CREATE TABLE IF NOT EXISTS `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_products`
--

CREATE TABLE IF NOT EXISTS `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task`
--

CREATE TABLE IF NOT EXISTS `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task_audit`
--

CREATE TABLE IF NOT EXISTS `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospects`
--

CREATE TABLE IF NOT EXISTS `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists`
--

CREATE TABLE IF NOT EXISTS `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists_prospects`
--

CREATE TABLE IF NOT EXISTS `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_list_campaigns`
--

CREATE TABLE IF NOT EXISTS `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE IF NOT EXISTS `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('16e68241-dd4a-ac97-f455-5355830841de', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('17209526-e9b5-0f92-492f-53558357383c', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('174b1391-9eb6-c845-28e9-53558313fdf7', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('1773415a-dcee-613d-4913-535583466131', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('179d25b3-2d57-bfd1-6ed0-5355831f1f78', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('17c8dd9d-728e-1213-91a4-535583eee330', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('17fb058b-fcc6-c886-bfec-535583400f80', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('18249bf9-e232-7dea-187c-5355830b94fe', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('184da9dc-5ebc-5c1a-4b48-53558333da2e', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('18847df7-a8d5-de5e-a5ff-5355838a03ea', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('18afc892-6280-4a16-4ae3-535583b127cd', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('19b45702-91ff-b40c-d274-535583cfc4a9', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', 0, 0),
('19dc424a-880b-a372-da5a-535583f7029c', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', 0, 0),
('1a039638-4fac-68d9-a1b0-53558347ce86', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('1a2a4fb5-e761-023b-f78a-535583b21e39', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('1a511481-269d-d0f6-fb1f-5355836c8f76', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', 0, 0),
('1a81c4d8-c49e-3b69-b010-5355837fc142', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', 0, 0),
('1aa8d52f-9953-9214-bcf7-53558396bc4c', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('1ad06b3f-8d1c-21d5-c040-535583b4fe14', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', 0, 0),
('1af733ab-56d5-79cd-88d8-535583ac03a3', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', 0, 0),
('1be2f048-ae7e-b27b-8b82-5355836838e7', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('1c1af736-d5e3-6a4a-586a-535583515975', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('1c4e11d5-04aa-47aa-6f3e-5355836964ef', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('1c73faa5-b3ed-e7a1-994c-535583f3adf1', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('1c9da946-1acb-285b-9b32-535583463ea4', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('1ccbfe31-3ed2-31d9-10ad-535583589fa6', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', NULL, NULL, 0, 0),
('1cfe843e-ae5e-a7a6-afc1-535583d4e171', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', 0, 0),
('1d2bd806-92a8-d93b-4fdb-535583ff3ef0', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', 0, 0),
('1d56cbf8-373b-1713-3801-535583a31891', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', 0, 0),
('1d831f07-4a82-b318-ae5c-535583a455d7', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', 0, 0),
('219c5521-8569-748d-7fef-535583e362f0', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', 0, 0),
('21d7911f-5d58-c531-917a-5355835a8a0b', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('220eeacb-8f73-b7a1-0ce0-535583262a92', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('22455bb5-b049-d8cd-bc92-535583c77537', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('2283649e-3be2-e878-77aa-535583b0b66e', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('22ba75a8-b4ad-3890-8ed8-5355837d8bed', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('22f80fff-f680-077b-77f9-5355834a1f57', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('2336e8f3-7f68-0865-bdfc-5355832e9a19', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', NULL, NULL, 0, 0),
('236dc7ea-22a9-efb3-34dd-535583ae8bc9', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('239f86ea-20ea-59cc-17b2-535583ad3f3a', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', NULL, NULL, 0, 0),
('23d6a2a3-e4bc-1374-7029-535583a62c1e', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', 0, 0),
('240639e4-d99b-056e-d721-535583a6f8f4', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('2434d686-3e75-8a15-42a3-535583a797da', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('246d283c-7244-ed23-3cc6-535583c00095', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('24a7fdbd-7935-19f3-b573-5355830baab4', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('24e6b0bf-3c21-1a87-0cdd-53558377ca98', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('25ee06ae-eaf8-0dac-4d04-535583474071', 'jwna_juniorwlnewactive_modified_user', 'Users', 'users', 'id', 'JWNA_JUNIORWLNEWACTIVE', 'jwna_juniorwlnewactive', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('288600d9-9d81-ac06-1dc1-535583c19e47', 'jwna_juniorwlnewactive_created_by', 'Users', 'users', 'id', 'JWNA_JUNIORWLNEWACTIVE', 'jwna_juniorwlnewactive', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2f600484-e750-84ee-2a2f-53558306f0c7', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('37fc02f2-dab7-2ed8-6d9c-535583b0ec36', 'jwna_juniorwlnewactive_assigned_user', 'Users', 'users', 'id', 'JWNA_JUNIORWLNEWACTIVE', 'jwna_juniorwlnewactive', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3b660172-e137-932e-4883-535583b9dc09', 'jwna_juniorwlnewactive_email_addresses', 'JWNA_JUNIORWLNEWACTIVE', 'jwna_juniorwlnewactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'JWNA_JUNIORWLNEWACTIVE', 0, 0),
('3eca0b79-8e5b-cf5c-ca5c-53558345b405', 'jwna_juniorwlnewactive_email_addresses_primary', 'JWNA_JUNIORWLNEWACTIVE', 'jwna_juniorwlnewactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('56e00213-1f55-a564-b26d-5355831b0fdf', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('61eb01dc-88ec-a75d-fa86-5355830274c0', 'swna_snrwlnewactive_modified_user', 'Users', 'users', 'id', 'SWNA_SNRWLNEWACTIVE', 'swna_snrwlnewactive', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('64cd00f8-0410-7098-5bc7-5355831e692a', 'swna_snrwlnewactive_created_by', 'Users', 'users', 'id', 'SWNA_SNRWLNEWACTIVE', 'swna_snrwlnewactive', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67340b27-2e19-a7e1-1f8f-53558351316a', 'swna_snrwlnewactive_assigned_user', 'Users', 'users', 'id', 'SWNA_SNRWLNEWACTIVE', 'swna_snrwlnewactive', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('69c60c80-e62d-ded8-00ff-535583f8c9a8', 'swna_snrwlnewactive_email_addresses', 'SWNA_SNRWLNEWACTIVE', 'swna_snrwlnewactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'SWNA_SNRWLNEWACTIVE', 0, 0),
('6c4902f1-13fd-b477-f5ad-535583696201', 'swna_snrwlnewactive_email_addresses_primary', 'SWNA_SNRWLNEWACTIVE', 'swna_snrwlnewactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('6ed81531-7b51-2420-6a0a-535583a39b55', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6f0faae9-4873-81c4-75b5-5355838081f3', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('70213e53-c375-d2c4-6686-5355831fe63b', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('704ebeb3-bd77-56c3-0e70-535583d68150', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('708f69f0-9641-c066-56d2-5355832fc6c5', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('70bee652-1354-8f1b-67de-535583dbdddf', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('70f4df12-5788-2299-a67f-535583cc7c1d', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('711ca735-e49f-8032-d1ae-5355839a0b2b', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('713e9cba-127f-5df7-0211-5355836b2aca', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('7161de7e-8fb0-f85b-d3e3-535583322f36', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('7183d850-6e00-836c-647c-535583326be5', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('71a8862c-6761-7b0c-b997-5355834defd0', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('73fbd991-5a22-a619-3728-5355836966f2', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('742a606d-6777-9c25-8d11-5355839279e9', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('744d78d0-e8ae-bdd2-6db9-5355830401bd', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('747312b0-ec6e-d38e-883c-535583677b7c', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('749f8d0a-7c04-a97d-61fa-535583e74199', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('75bcf205-bbd7-ee9e-e94c-5355835268ca', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('75eb7ed0-847c-a237-ce8e-535583270fcf', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('760bf48b-b1e2-40a5-33a1-53558326cf89', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('788d7d11-2280-3478-34c2-5355835f1129', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('78c21a86-6be7-11d9-cba4-5355835dd54b', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('78f7f4fa-7b21-05ba-b78e-535583b0c103', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7925dd27-b207-c32a-7350-5355838bd30d', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('795e122d-b2b0-5305-d445-535583d6da19', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('7993eb2f-4170-56f1-5916-535583518577', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('79c3eea3-d714-d1c4-cbea-535583a12c6b', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('79f00e17-3d3a-37ab-7c2a-5355838cfb6b', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('7a215c52-ec61-4f6b-02db-535583a7d6c7', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7a543268-bc96-6ac3-6f6c-5355836ef6fd', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7afed854-0679-60d7-e322-535583607f68', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7b39bec4-996b-cb2f-a22e-5355835fa6f9', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('7c14c114-e455-344c-c864-5355836ae1f3', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('7d8fe232-f284-d56d-bfd3-535583ff2dbd', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7dc0ed16-4fc5-39b2-cb60-535583e55bee', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7df297fc-7aee-6e70-abed-535583ae47c2', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7e233a29-442d-a7ff-59da-5355837b833f', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('832c4340-c303-9043-9ea9-5355838eed7f', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('850c8890-0e38-9e16-b815-535583776eb2', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('853e8e18-98fa-d87a-2017-535583b7c89c', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('8570889a-4478-bf94-c513-535583d449c8', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('85a22f03-21b9-7147-debe-53558328b7ff', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('85d3bd4a-3fb3-d54b-c1e5-535583d162dd', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('8605b02c-7e58-99a8-0082-535583391b86', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('86371ce9-e28d-de09-2d41-5355832e52e1', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('86677c84-b6b9-4db6-9365-5355835e0eb9', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('868eb408-f7e0-8e7c-7141-535583bc020b', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('89a65ed0-6c4b-9fde-2637-535583a92cc1', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('89d85d5a-8ca9-c1bd-373b-535583a2997f', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('8a048fac-dc90-aab7-7c72-5355834ff622', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('8a30725b-500a-4428-7ffe-5355837a4ea6', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('8b68f6ff-b64a-2a84-f863-5355830322a6', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('8b969c2a-957d-8af3-1484-535583a1c769', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8bbd91b2-e681-3f7b-2fed-535583a67eb3', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8be542fc-25e8-9b4f-9b10-535583077f65', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8e49be7e-258e-d04c-288f-5355831ff653', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8e786258-85f5-5cc8-64c2-535583b101b7', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8e9e58f8-4e92-a056-cdb4-535583d22d1a', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8ec648e0-15b5-3c44-6018-5355835acca3', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8eedf246-2290-45af-b56a-535583b61785', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8f1b1ce1-06af-f8be-6a76-5355837e9555', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8f52bba7-f679-b234-e26e-53558318b4c8', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a7750bb1-197b-7549-a77f-535583939a4d', 'hwla_harasawaitinglistactive_modified_user', 'Users', 'users', 'id', 'HWLA_HARASAWAITINGLISTACTIVE', 'hwla_harasawaitinglistactive', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a7e458a4-1a83-4f83-67be-53558345c948', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a9aa2a99-5292-709d-b4cb-535583815e80', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a9b306e3-bfe4-7777-5cc6-535583f166d4', 'hwla_harasawaitinglistactive_created_by', 'Users', 'users', 'id', 'HWLA_HARASAWAITINGLISTACTIVE', 'hwla_harasawaitinglistactive', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a9d3b755-802c-f8b4-9896-53558323981e', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a9fc8f9a-63ef-913c-dbf5-53558337070d', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('aa220a06-3d84-30c2-4349-53558307ad9e', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('aa4f1f99-fa10-f7d6-7db0-5355833becfd', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('abff040e-2336-6e9c-b463-535583dec5c4', 'hwla_harasawaitinglistactive_assigned_user', 'Users', 'users', 'id', 'HWLA_HARASAWAITINGLISTACTIVE', 'hwla_harasawaitinglistactive', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ae6a0144-da07-0788-61a1-53558312d78b', 'hwla_harasawaitinglistactive_email_addresses', 'HWLA_HARASAWAITINGLISTACTIVE', 'hwla_harasawaitinglistactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'HWLA_HARASAWAITINGLISTACTIVE', 0, 0),
('af2c1c14-2cea-cd21-50f5-5355836ae45c', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b16d0e3c-c22b-7135-3057-535583d9e07c', 'hwla_harasawaitinglistactive_email_addresses_primary', 'HWLA_HARASAWAITINGLISTACTIVE', 'hwla_harasawaitinglistactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('b171721e-5036-3f98-fa9f-535583ef1119', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b19d65f7-7e08-ffe0-6124-535583343817', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b1ce9e60-6dc3-1548-b9b9-535583471f33', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b1f93cfe-9948-0e6e-e0a5-53558366ced5', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('b22b48c2-6227-38a7-4b9a-535583bd51f4', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('b2588c21-ce31-77c1-bff9-535583122eff', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('b2826d9f-50d6-261f-3b2b-535583a1cf7f', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('b2ad1c1c-fa53-0f88-5a29-535583b94175', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('b2d6aeea-399b-16f7-671f-5355833a3de2', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('b3058476-c731-6b56-a30d-535583057249', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('b32ae392-1f70-fc9e-8a12-535583083978', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b4143253-5b9a-d552-3dbd-535583288c73', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b4ee5886-797b-37e4-5e3e-535583ec8d9a', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b931c863-369d-a0f8-64c7-535583890b6d', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('b96318fc-26c4-3a98-cacb-5355831ca4c4', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b98b7cce-8042-ea02-0dc7-53558388c622', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b9e9f26a-2c5c-ce66-d19e-5355835c769a', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'schedulersjobs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bc6db411-e249-fa54-12db-53558331f433', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bca025c0-5874-5ff6-fc35-535583f39757', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bccf220f-ebff-7d6c-9700-535583f42b0a', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd0307fe-5f50-9111-8647-535583f6a9fd', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('bd2bffdf-4b61-dc41-511b-535583496535', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('bd4da223-e7b6-50ac-cf0d-5355839964f2', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd7bb5bf-6632-5291-08d7-535583db9e53', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bdaa8739-4898-c5a9-ba96-535583cf0aef', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bdd61c9b-1606-f7ee-53b3-535583472746', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('be0f94b7-13dd-46b4-1da1-5355830f5410', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('be3c6432-a93f-2304-a352-5355831a2175', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c138a9dd-a256-2a8c-895d-535583438954', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c166e30a-8338-1c17-1cf5-5355838b86c8', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c18d0718-3b63-26b9-1141-53558362428a', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c1b39393-abf1-5c8f-663e-5355830bf892', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('c1d9c8b8-14f4-06c7-5ae0-535583ad4750', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('c200c8a6-e426-fafe-b089-53558338531f', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c22cce16-6903-0331-e095-535583d04327', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c2536913-2be9-dcaa-ab90-5355839f42c3', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('c279b081-da44-63a7-40a8-535583f51fe5', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('c29fb2f0-1e0c-d1d5-2c9b-5355837c2943', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('c2c6024d-258d-517d-ca9f-535583d14686', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('c2ebf81b-e10f-73b3-b9c9-535583b2a6cf', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('c313942a-82bb-9b3f-4a9e-535583ef2105', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c339d906-f865-1c43-e0e9-535583ff4388', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c50b4230-ea75-37be-1378-53558310f9c2', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c535fecb-4bf9-d27d-1c16-535583af8a56', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c55b2f4c-ec2b-9dc9-dffb-535583b6450a', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c57a0802-71e9-2e74-4a0d-535583a782e6', 'wlmca_waitinglistmsdclinicactive_modified_user', 'Users', 'users', 'id', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'wlmca_waitinglistmsdclinicactive', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c587a27b-4aea-c88f-d2ee-535583d6c6b6', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('c5ade4db-d826-f9dc-5df0-5355833efcd4', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('c5d398b7-910c-94e2-7b39-5355838d9af3', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('c5f96ab9-a46d-9cba-30eb-5355836302d1', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('c61e9040-12a8-d440-6201-5355832c6f6d', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('c643dfdc-ccb5-e5e5-fac2-5355830e8791', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c66c5a95-b377-deba-52d1-53558343b053', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c69167d4-fbc3-d0b2-e866-5355834683c5', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c7c15ddf-9d4d-77fc-24ee-535583d414c1', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c7cb0041-908c-c85f-41f6-535583515bda', 'wlmca_waitinglistmsdclinicactive_created_by', 'Users', 'users', 'id', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'wlmca_waitinglistmsdclinicactive', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c9319c92-278d-2442-d44f-53558300c773', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c95906ed-1dad-1701-9b21-535583384c29', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c98af64d-9c34-170e-b218-535583d7cbda', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ca6300c1-fbb9-15aa-b558-5355832af67d', 'wlmca_waitinglistmsdclinicactive_assigned_user', 'Users', 'users', 'id', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'wlmca_waitinglistmsdclinicactive', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cca505d5-3ece-5171-3802-5355832b7364', 'wlmca_waitinglistmsdclinicactive_email_addresses', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'wlmca_waitinglistmsdclinicactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 0, 0),
('ccb7f5c3-2d6e-e843-f9d8-535583f977ce', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ccedaf38-b429-c128-0c4f-535583cd625e', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cd1a38e6-3462-53b3-de3f-535583cd94e9', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cd47d746-fa6f-0335-670a-535583f1a0ef', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Calls', 0, 0),
('cf0101eb-8a03-a2ef-2bd7-535583dbc511', 'wlmca_waitinglistmsdclinicactive_email_addresses_primary', 'WLMCA_WAITINGLISTMSDCLINICACTIVE', 'wlmca_waitinglistmsdclinicactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('d0fccb3d-80ae-774d-03d9-535583a9ef14', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d36ddfff-2f7a-ea30-989e-535583885acb', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d3d91df9-ae8d-02c4-1285-5355834f8973', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d40cfb3d-b7ce-8a58-ab17-535583c07abc', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d43b3b62-9c61-510c-02fe-53558396040e', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d7128f96-79a1-39a1-ba12-5355836327b3', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d74bacfb-0844-5802-7de4-53558379765f', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d77f21fd-fd89-854a-891f-535583fe5111', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d7a99c72-c1de-cbed-88d8-53558394c2ec', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('d94f56c6-5a49-9420-2f4c-535583764d62', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d978d086-269f-3a2a-b7e5-535583e9bb15', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d99ee421-0deb-acc8-0409-5355831e9d47', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d9c56e1a-a95e-a28b-bf20-5355833213f0', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e25da62b-7470-c499-9ecd-535583ae02df', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e28e97ab-a841-7ff3-4fca-535583a69543', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e2b61a79-2ee0-8da2-f5fc-535583f657d2', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e2db2d9a-b042-7c3e-0346-535583847c33', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e3cd0efd-2207-ff7a-bf1f-535583749643', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e7db40cb-3c92-08ac-c9bc-5355835adcb2', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('e801c5fe-b0cd-9571-54f8-5355839e6f54', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('e925b1ff-e9d4-1338-9cdb-5355838ee9e1', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ebee9116-734f-ff34-043c-5355835c0160', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec15fa13-795f-cdb3-b31e-535583fbed88', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ec3ac3cc-f593-b4ef-5113-53558387a983', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f03021f1-0ff7-2f9a-72d9-5355830d74f6', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f04708c5-e99e-9d68-feef-535583257a7b', 'vwna_villawlnewactive_modified_user', 'Users', 'users', 'id', 'VWNA_VILLAWLNEWACTIVE', 'vwna_villawlnewactive', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f19058f4-1d1b-7879-c465-53558312bd71', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f1b0c033-5ed9-71e3-ec0d-5355839c204d', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f3166bee-feba-f747-b3a9-535583b24114', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f32b050a-6d07-0d81-cc1b-535583427c3b', 'vwna_villawlnewactive_created_by', 'Users', 'users', 'id', 'VWNA_VILLAWLNEWACTIVE', 'vwna_villawlnewactive', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f33f2541-ac0b-5d61-2fcd-535583ac1d44', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f36ce051-3696-4fae-c33c-535583b74435', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f57904f6-2837-fd83-991d-535583ce6fc6', 'vwna_villawlnewactive_assigned_user', 'Users', 'users', 'id', 'VWNA_VILLAWLNEWACTIVE', 'vwna_villawlnewactive', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f7c40db8-0c81-fc6b-7851-535583251c5f', 'vwna_villawlnewactive_email_addresses', 'VWNA_VILLAWLNEWACTIVE', 'vwna_villawlnewactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'VWNA_VILLAWLNEWACTIVE', 0, 0),
('fa1f0a09-15a5-95ec-8a93-535583a0540c', 'vwna_villawlnewactive_email_addresses_primary', 'VWNA_VILLAWLNEWACTIVE', 'vwna_villawlnewactive', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `releases`
--

CREATE TABLE IF NOT EXISTS `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_modules`
--

CREATE TABLE IF NOT EXISTS `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE IF NOT EXISTS `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedulers`
--

CREATE TABLE IF NOT EXISTS `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedulers`
--

INSERT INTO `schedulers` (`id`, `deleted`, `date_entered`, `date_modified`, `created_by`, `modified_user_id`, `name`, `job`, `date_time_start`, `date_time_end`, `job_interval`, `time_from`, `time_to`, `last_run`, `status`, `catch_up`) VALUES
('a4b80ad4-b168-1a57-414a-520f787bcabf', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2005-01-01 18:00:01', '2020-12-31 23:59:59', '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('a668223f-dfe1-de0c-1116-520f78737ba4', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxes', '2005-01-01 15:30:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('a77b102d-e3fd-f108-7391-520f78f5b633', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2005-01-01 08:45:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('a89da70d-958b-fe69-9676-520f789ba2ba', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2005-01-01 14:00:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('a9abadfe-378d-92a6-0d23-520f78895c5a', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2005-01-01 16:30:01', '2020-12-31 23:59:59', '0::4::1::*::*', NULL, NULL, NULL, 'Inactive', 0),
('aaba3330-0dfb-3d03-0434-520f78d1b112', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2008-01-01 17:45:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('abe5f98f-c6a7-a222-c558-520f78d2570f', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2012-01-01 13:45:01', '2030-12-31 23:59:59', '0::5::*::*::*', NULL, NULL, NULL, 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sugarfeed`
--

CREATE TABLE IF NOT EXISTS `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `swna_snrwlnewactive`
--

CREATE TABLE IF NOT EXISTS `swna_snrwlnewactive` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `swna_snrwlnewactive`
--

INSERT INTO `swna_snrwlnewactive` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`) VALUES
('83d373d3-3d29-8aaa-53cb-535618bfb73e', '2014-04-22 07:22:57', '2014-04-22 07:22:57', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Shamrani, Saleh Mohd.', NULL, 'Dental', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8a2a3d20-a1c8-bdfb-ddab-535618b49e21', '2014-04-22 07:22:57', '2014-04-22 07:22:57', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Zwahmah, Mohd. Hassan', NULL, 'Neurology', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8cbe2b3d-24a1-7288-8a96-5356189411f0', '2014-04-22 07:22:57', '2014-04-22 07:22:57', '1', '1', NULL, 0, '1', NULL, NULL, 'Eskandarani, Mahmoud Mohd', NULL, 'Pharmacy', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('8f60a76b-3e94-3892-f771-5356189df7d4', '2014-04-22 07:22:57', '2014-04-22 07:22:57', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Qazlan, Khalid Abdulrehman', NULL, 'Supplies', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('91f90f47-d324-64af-3f43-535618eb215d', '2014-04-22 07:22:57', '2014-04-22 07:22:57', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Omari, Ahmed Hamid', NULL, 'F&C Med.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('9cae2977-d6cc-604b-0193-535618f095d6', '2014-04-22 07:22:57', '2014-04-22 07:22:57', '1', '1', NULL, 0, '1', NULL, NULL, 'Al Otaibi, Shuja Nasr Shuja', NULL, 'Dental', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('9d3e06ec-04d0-6962-581a-5356181bb6e1', '2014-04-22 07:21:04', '2014-04-22 07:23:30', '1', '1', NULL, 1, '1', NULL, NULL, 'Al Shamrani, Saleh Mohd.', NULL, 'Dental', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('b8b1f092-7ad5-a2ff-e8fd-535618c2623a', '2014-04-22 07:21:04', '2014-04-22 07:23:30', '1', '1', NULL, 1, '1', NULL, NULL, 'Al Zwahmah, Mohd. Hassan', NULL, 'Neurology', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('bafd640a-7b01-28da-b051-5356187ab1d8', '2014-04-22 07:21:04', '2014-04-22 07:23:30', '1', '1', NULL, 1, '1', NULL, NULL, 'Eskandarani, Mahmoud Mohd', NULL, 'Pharmacy', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('c1c4fc00-cb8f-c5af-f4ea-535618c289c8', '2014-04-22 07:21:04', '2014-04-22 07:23:30', '1', '1', NULL, 1, '1', NULL, NULL, 'Al Qazlan, Khalid Abdulrehman', NULL, 'Supplies', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('c359be3d-1715-1f37-128f-5356189f6887', '2014-04-22 07:21:04', '2014-04-22 07:23:30', '1', '1', NULL, 1, '1', NULL, NULL, 'Al Omari, Ahmed Hamid', NULL, 'F&C Med.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('c548d963-5692-5964-c235-535618ae88aa', '2014-04-22 07:21:04', '2014-04-22 07:23:30', '1', '1', NULL, 1, '1', NULL, NULL, 'Al Otaibi, Shuja Nasr Shuja', NULL, 'Dental', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `swna_snrwlnewactive_audit`
--

CREATE TABLE IF NOT EXISTS `swna_snrwlnewactive_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_swna_snrwlnewactive_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `swna_snrwlnewactive_cstm`
--

CREATE TABLE IF NOT EXISTS `swna_snrwlnewactive_cstm` (
  `id_c` char(36) NOT NULL,
  `sno_c` varchar(255) DEFAULT NULL,
  `msd_c` varchar(255) DEFAULT NULL,
  `milmsd_c` varchar(255) DEFAULT NULL,
  `grade_c` varchar(255) DEFAULT NULL,
  `paccom_c` varchar(255) DEFAULT NULL,
  `appdate_c` varchar(255) DEFAULT NULL,
  `noofdep_c` varchar(255) DEFAULT NULL,
  `remarks_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `swna_snrwlnewactive_cstm`
--

INSERT INTO `swna_snrwlnewactive_cstm` (`id_c`, `sno_c`, `msd_c`, `milmsd_c`, `grade_c`, `paccom_c`, `appdate_c`, `noofdep_c`, `remarks_c`) VALUES
('83d373d3-3d29-8aaa-53cb-535618bfb73e', '114', '16609', 'Military', 'Major', 'outside', '8-Dec-09', 'wife & 1 child', ''),
('8a2a3d20-a1c8-bdfb-ddab-535618b49e21', '115', '16606', 'Military', 'Major', 'outside', '22-Jun-10', 'wife & 5 children', ''),
('8cbe2b3d-24a1-7288-8a96-5356189411f0', '116', '90018828', 'Civilian', '12', 'Outside', '26-Jul-10', 'wife+4Children', ''),
('8f60a76b-3e94-3892-f771-5356189df7d4', '117', '15346', 'Military', 'Major', '167/A-05', '1-Aug-10', 'wife & 4 children', ''),
('91f90f47-d324-64af-3f43-535618eb215d', '118', '19194', 'Military', 'Major', 'outside', '16-Aug-10', 'wife & 2 children', ''),
('9cae2977-d6cc-604b-0193-535618f095d6', '119', '16613', 'Military', 'Major', 'Outside', '3-Oct-10', 'Wife+2Children', '505240254'),
('9d3e06ec-04d0-6962-581a-5356181bb6e1', '114', NULL, '', '', '', '', '', ''),
('b8b1f092-7ad5-a2ff-e8fd-535618c2623a', '115', NULL, '', '', '', '', '', ''),
('bafd640a-7b01-28da-b051-5356187ab1d8', '116', NULL, '', '', '', '', '', ''),
('c1c4fc00-cb8f-c5af-f4ea-535618c289c8', '117', NULL, '', '', '', '', '', ''),
('c359be3d-1715-1f37-128f-5356189f6887', '118', NULL, '', '', '', '', '', ''),
('c548d963-5692-5964-c235-535618ae88aa', '119', NULL, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`id`, `monitor_id`, `user_id`, `module_name`, `item_id`, `item_summary`, `date_modified`, `action`, `session_id`, `visible`, `deleted`) VALUES
(4, '3e716f23-8620-f56d-e5a3-534fd348a3af', '1', 'Plcs_File_tasken', '85000b05-4411-1e15-c356-534f9b152d81', 'Al Assiri, Mohd. Ahmed', '2014-04-17 13:13:36', 'editview', 'pmsl22bhp5pl55sjm276pen7v0', 1, 0),
(5, '25c9361b-a3b0-63ed-c741-5355899369b6', '1', 'Employees', '2115e88f-94f1-5efc-cd6e-5355892b246a', 'Administrator', '2014-04-21 21:09:38', 'save', '2ac75901225acfc37bc124081c445414', 1, 0),
(38, 'e78c1cd0-51b8-62e0-ae7c-535624676440', '1', 'Users', '1', 'ahmed Administrator', '2014-04-22 08:14:15', 'editview', 'e7b9bde05579e9ffd9cdc599f14034f4', 1, 0),
(47, 'a0a228ef-383d-e6ef-7042-5356adb8d1bc', '1', 'Users', 'def89416-e718-d948-9635-53561c7d2a9b', 'sraaa', '2014-04-22 17:58:04', 'detailview', '69cee91e566c3085957b1acb856a81f0', 1, 0),
(53, '4bff5fdd-54f3-f72f-9837-53575856a8ce', '1', 'SWNA_SNRWLNEWACTIVE', '9cae2977-d6cc-604b-0193-535618f095d6', 'Al Otaibi, Shuja Nasr Shuja', '2014-04-23 06:07:24', 'detailview', '2fc0f3883e7a92ed90c82ff875c59b55', 1, 0),
(55, '19343b54-a422-a596-5577-535854d36c9f', '1', 'Users', '27f85892-8c01-22f6-ee95-535854ef16aa', 'mohamed el sahly', '2014-04-24 00:01:55', 'detailview', '8de1b0776548f8d5bb2c5ff7a520cdbb', 1, 0),
(56, 'be61ba3b-9cdb-9c78-d1a1-535854d33219', '1', 'Employees', 'c110dda1-5b21-a328-666e-5355894d667c', 'Administrator', '2014-04-24 00:02:26', 'detailview', '8de1b0776548f8d5bb2c5ff7a520cdbb', 1, 0),
(58, '2f2cab8e-a7de-34cc-e135-535855d6bb31', '1', 'ACLRoles', 'f2c8fe51-1fab-67e2-d00a-52ee34a663f5', 'Sales Person', '2014-04-24 00:05:05', 'detailview', '8de1b0776548f8d5bb2c5ff7a520cdbb', 1, 0),
(67, '84d729cf-d7b7-bfe0-a54f-5358574d214d', '1', 'Users', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'morad mohsen', '2014-04-24 00:16:16', 'detailview', 'ec1a283c60da3f3a7c43cd11d10be436', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_history`
--

CREATE TABLE IF NOT EXISTS `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upgrade_history`
--

INSERT INTO `upgrade_history` (`id`, `filename`, `md5sum`, `type`, `status`, `version`, `name`, `description`, `id_name`, `manifest`, `date_entered`, `enabled`) VALUES
('3f621434-771e-2824-8a20-5355610796bd', 'upload/upgrades/module/JUNIORWLNEWACTIVE2014_04_21_132054.zip', '2258341c4d23f233fbb9610b6f723f26', 'module', 'installed', '1398104454', 'JUNIORWLNEWACTIVE', '', 'JUNIORWLNEWACTIVE', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6NDoiSldOQSI7czo2OiJhdXRob3IiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7czowOiIiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6MTc6IkpVTklPUldMTkVXQUNUSVZFIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNC0wNC0yMSAxODoyMDo1NCI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjEzOTgxMDQ0NTQ7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo3OntzOjI6ImlkIjtzOjE3OiJKVU5JT1JXTE5FV0FDVElWRSI7czo1OiJiZWFucyI7YToxOntpOjA7YTo0OntzOjY6Im1vZHVsZSI7czoyMjoiSldOQV9KVU5JT1JXTE5FV0FDVElWRSI7czo1OiJjbGFzcyI7czoyMjoiSldOQV9KVU5JT1JXTE5FV0FDVElWRSI7czo0OiJwYXRoIjtzOjU3OiJtb2R1bGVzL0pXTkFfSlVOSU9SV0xORVdBQ1RJVkUvSldOQV9KVU5JT1JXTE5FV0FDVElWRS5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjA6e31zOjEzOiJyZWxhdGlvbnNoaXBzIjthOjA6e31zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo1NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9KV05BX0pVTklPUldMTkVXQUNUSVZFIjtzOjI6InRvIjtzOjMwOiJtb2R1bGVzL0pXTkFfSlVOSU9SV0xORVdBQ1RJVkUiO319czo4OiJsYW5ndWFnZSI7YToxOntpOjA7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2VuX3VzLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO319fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9', '2014-04-21 18:20:54', 1),
('740361c9-8bcb-d0df-7429-53502a9ac3cc', 'upload/upgrades/langpack/ar4enterprise-0.9.6.zip', 'b17b4c4e1e2d7e31083a50efe7ace720', 'langpack', 'installed', NULL, 'ar_eg (enterprise)', NULL, 'ar_eg', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjY6e3M6NDoibmFtZSI7czoxODoiYXJfZWcgKGVudGVycHJpc2UpIjtzOjQ6InR5cGUiO3M6ODoibGFuZ3BhY2siO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO3M6MzoiWWVzIjtzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6MDp7fXM6NjoiYXV0aG9yIjtzOjEwOiJJVCBTeW5lcmd5IjtzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjA6e319czoxMToiaW5zdGFsbGRlZnMiO2E6Mzp7czoyOiJpZCI7czo1OiJhcl9lZyI7czo5OiJpbWFnZV9kaXIiO3M6MTc6IjxiYXNlcGF0aD4vaW1hZ2VzIjtzOjQ6ImNvcHkiO2E6Mjp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjE4OiI8YmFzZXBhdGg+L2luY2x1ZGUiO3M6MjoidG8iO3M6NzoiaW5jbHVkZSI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czoxODoiPGJhc2VwYXRoPi9tb2R1bGVzIjtzOjI6InRvIjtzOjc6Im1vZHVsZXMiO319fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9', '2014-04-17 19:25:06', 1),
('9556c79c-0249-7614-b5c6-535560e9a067', 'upload/upgrades/module/SNRWLNEWACTIVE2014_04_21_131606.zip', 'fe1ecaf1ea86fa89ad50f1af451d73d0', 'module', 'installed', '1398104166', 'SNRWLNEWACTIVE', '', 'SNRWLNEWACTIVE', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6NDoiU1dOQSI7czo2OiJhdXRob3IiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7czowOiIiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6MTQ6IlNOUldMTkVXQUNUSVZFIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNC0wNC0yMSAxODoxNjowNiI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjEzOTgxMDQxNjY7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo3OntzOjI6ImlkIjtzOjE0OiJTTlJXTE5FV0FDVElWRSI7czo1OiJiZWFucyI7YToxOntpOjA7YTo0OntzOjY6Im1vZHVsZSI7czoxOToiU1dOQV9TTlJXTE5FV0FDVElWRSI7czo1OiJjbGFzcyI7czoxOToiU1dOQV9TTlJXTE5FV0FDVElWRSI7czo0OiJwYXRoIjtzOjUxOiJtb2R1bGVzL1NXTkFfU05SV0xORVdBQ1RJVkUvU1dOQV9TTlJXTE5FV0FDVElWRS5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjA6e31zOjEzOiJyZWxhdGlvbnNoaXBzIjthOjA6e31zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo1MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9TV05BX1NOUldMTkVXQUNUSVZFIjtzOjI6InRvIjtzOjI3OiJtb2R1bGVzL1NXTkFfU05SV0xORVdBQ1RJVkUiO319czo4OiJsYW5ndWFnZSI7YToxOntpOjA7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2VuX3VzLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO319fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9', '2014-04-21 18:16:06', 1),
('9dc8f788-6436-846f-979b-5355819f289f', 'upload/upgrades/module/WAITINGLISTMSDCLINICACTIVE2014_04_21_153530.zip', '2ac7524e4f36426f5fd3b38578e37828', 'module', 'installed', '1398112530', 'WAITINGLISTMSDCLINICACTIVE', '', 'WAITINGLISTMSDCLINICACTIVE', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6NToiV0xNQ0EiO3M6NjoiYXV0aG9yIjtzOjc6IkJhc2lvbmkiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjA6IiI7czo0OiJpY29uIjtzOjA6IiI7czoxNjoiaXNfdW5pbnN0YWxsYWJsZSI7YjoxO3M6NDoibmFtZSI7czoyNjoiV0FJVElOR0xJU1RNU0RDTElOSUNBQ1RJVkUiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjE5OiIyMDE0LTA0LTIxIDIwOjM1OjMwIjtzOjQ6InR5cGUiO3M6NjoibW9kdWxlIjtzOjc6InZlcnNpb24iO2k6MTM5ODExMjUzMDtzOjEzOiJyZW1vdmVfdGFibGVzIjtzOjY6InByb21wdCI7fXM6MTE6Imluc3RhbGxkZWZzIjthOjc6e3M6MjoiaWQiO3M6MjY6IldBSVRJTkdMSVNUTVNEQ0xJTklDQUNUSVZFIjtzOjU6ImJlYW5zIjthOjE6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjMyOiJXTE1DQV9XQUlUSU5HTElTVE1TRENMSU5JQ0FDVElWRSI7czo1OiJjbGFzcyI7czozMjoiV0xNQ0FfV0FJVElOR0xJU1RNU0RDTElOSUNBQ1RJVkUiO3M6NDoicGF0aCI7czo3NzoibW9kdWxlcy9XTE1DQV9XQUlUSU5HTElTVE1TRENMSU5JQ0FDVElWRS9XTE1DQV9XQUlUSU5HTElTVE1TRENMSU5JQ0FDVElWRS5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjA6e31zOjEzOiJyZWxhdGlvbnNoaXBzIjthOjA6e31zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo2NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9XTE1DQV9XQUlUSU5HTElTVE1TRENMSU5JQ0FDVElWRSI7czoyOiJ0byI7czo0MDoibW9kdWxlcy9XTE1DQV9XQUlUSU5HTElTVE1TRENMSU5JQ0FDVElWRSI7fX1zOjg6Imxhbmd1YWdlIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=', '2014-04-21 20:35:30', 1),
('a7504382-484c-9fcd-013d-535562d2bd56', 'upload/upgrades/module/HARASAWAITINGLISTACTIVE2014_04_21_132300.zip', '9de2dc67f4bafd5c2f61b6f15e19c25c', 'module', 'installed', '1398104580', 'HARASAWAITINGLISTACTIVE', '', 'HARASAWAITINGLISTACTIVE', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6NDoiSFdMQSI7czo2OiJhdXRob3IiO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7czowOiIiO3M6NDoiaWNvbiI7czowOiIiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6Im5hbWUiO3M6MjM6IkhBUkFTQVdBSVRJTkdMSVNUQUNUSVZFIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNC0wNC0yMSAxODoyMzowMCI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjEzOTgxMDQ1ODA7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo3OntzOjI6ImlkIjtzOjIzOiJIQVJBU0FXQUlUSU5HTElTVEFDVElWRSI7czo1OiJiZWFucyI7YToxOntpOjA7YTo0OntzOjY6Im1vZHVsZSI7czoyODoiSFdMQV9IQVJBU0FXQUlUSU5HTElTVEFDVElWRSI7czo1OiJjbGFzcyI7czoyODoiSFdMQV9IQVJBU0FXQUlUSU5HTElTVEFDVElWRSI7czo0OiJwYXRoIjtzOjY5OiJtb2R1bGVzL0hXTEFfSEFSQVNBV0FJVElOR0xJU1RBQ1RJVkUvSFdMQV9IQVJBU0FXQUlUSU5HTElTVEFDVElWRS5waHAiO3M6MzoidGFiIjtiOjE7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjA6e31zOjEzOiJyZWxhdGlvbnNoaXBzIjthOjA6e31zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9IV0xBX0hBUkFTQVdBSVRJTkdMSVNUQUNUSVZFIjtzOjI6InRvIjtzOjM2OiJtb2R1bGVzL0hXTEFfSEFSQVNBV0FJVElOR0xJU1RBQ1RJVkUiO319czo4OiJsYW5ndWFnZSI7YToxOntpOjA7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2VuX3VzLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO319fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9', '2014-04-21 18:23:00', 1),
('ade5379e-b4c5-fefa-83a7-535563891424', 'upload/upgrades/module/VILLAWLNEWACTIVE2014_04_21_132924.zip', '79f990a6a47360b5d412f545b6fb0755', 'module', 'installed', '1398104964', 'VILLAWLNEWACTIVE', '', 'VILLAWLNEWACTIVE', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6NDoiVldOQSI7czo2OiJhdXRob3IiO3M6NzoiQmFzaW9uaSI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjE2OiJWSUxMQVdMTkVXQUNUSVZFIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNC0wNC0yMSAxODoyOToyNCI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjEzOTgxMDQ5NjQ7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo3OntzOjI6ImlkIjtzOjE2OiJWSUxMQVdMTkVXQUNUSVZFIjtzOjU6ImJlYW5zIjthOjE6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjIxOiJWV05BX1ZJTExBV0xORVdBQ1RJVkUiO3M6NToiY2xhc3MiO3M6MjE6IlZXTkFfVklMTEFXTE5FV0FDVElWRSI7czo0OiJwYXRoIjtzOjU1OiJtb2R1bGVzL1ZXTkFfVklMTEFXTE5FV0FDVElWRS9WV05BX1ZJTExBV0xORVdBQ1RJVkUucGhwIjtzOjM6InRhYiI7YjoxO319czoxMDoibGF5b3V0ZGVmcyI7YTowOnt9czoxMzoicmVsYXRpb25zaGlwcyI7YTowOnt9czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6NDoiY29weSI7YToxOntpOjA7YToyOntzOjQ6ImZyb20iO3M6NTM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvVldOQV9WSUxMQVdMTkVXQUNUSVZFIjtzOjI6InRvIjtzOjI5OiJtb2R1bGVzL1ZXTkFfVklMTEFXTE5FV0FDVElWRSI7fX1zOjg6Imxhbmd1YWdlIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=', '2014-04-21 18:29:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`) VALUES
('1', 'admin', '$1$Uv4.NK0.$SzAu4jfHoUjzs.YSFmIwr/', 0, NULL, NULL, 1, 'ahmed', 'Administrator', 1, 0, 1, NULL, '2013-08-17 13:21:13', '2013-08-17 13:23:11', '1', '', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, '', 0),
('2115e88f-94f1-5efc-cd6e-5355892b246a', '', NULL, 0, NULL, NULL, 1, NULL, 'Administrator', 0, 0, 1, NULL, '2014-04-21 21:09:38', '2014-04-21 21:09:48', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Inactive', NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 'Terminated', NULL, NULL, '', 0),
('27f85892-8c01-22f6-ee95-535854ef16aa', 'mohamed', NULL, 0, NULL, NULL, 1, 'mohamed', 'el sahly', 0, 0, 1, '', '2014-04-24 00:01:54', '2014-04-24 00:01:54', '1', '1', '', '', '', '', '', '', '', 'Active', '', '', '', '', '', 0, 0, 1, 'Active', '', '', '', 0),
('ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'morad', NULL, 0, NULL, NULL, 1, 'morad', 'mohsen', 1, 0, 1, NULL, '2014-04-22 07:46:59', '2014-04-24 00:16:15', '1', '1', 'morad', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, '', 0),
('c110dda1-5b21-a328-666e-5355894d667c', 'administrator', NULL, 0, NULL, NULL, 1, '', 'Administrator', 1, 0, 1, '', '2014-04-21 21:11:30', '2014-04-21 21:11:30', '1', '1', '', '', '', '', '', '', '', 'Active', '', '', '', '', '', 0, 0, 1, 'Active', '', '', '', 0),
('def89416-e718-d948-9635-53561c7d2a9b', 'sraaa', NULL, 0, NULL, NULL, 1, NULL, 'sraaa', 0, 0, 1, NULL, '2014-04-22 07:40:25', '2014-04-22 07:43:42', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_feeds`
--

CREATE TABLE IF NOT EXISTS `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_last_import`
--

CREATE TABLE IF NOT EXISTS `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_last_import`
--

INSERT INTO `users_last_import` (`id`, `assigned_user_id`, `import_module`, `bean_type`, `bean_id`, `deleted`) VALUES
('88bb2f19-630a-eeff-32f8-53561828be07', '1', 'SWNA_SNRWLNEWACTIVE', 'SWNA_SNRWLNEWACTIVE', '83d373d3-3d29-8aaa-53cb-535618bfb73e', 0),
('8b622aa3-04b0-0256-39dc-535618e8ddbf', '1', 'SWNA_SNRWLNEWACTIVE', 'SWNA_SNRWLNEWACTIVE', '8a2a3d20-a1c8-bdfb-ddab-535618b49e21', 0),
('8e053331-480d-c0cf-f140-5356189c6ced', '1', 'SWNA_SNRWLNEWACTIVE', 'SWNA_SNRWLNEWACTIVE', '8cbe2b3d-24a1-7288-8a96-5356189411f0', 0),
('909dfc81-ada9-53f9-ce98-535618204c89', '1', 'SWNA_SNRWLNEWACTIVE', 'SWNA_SNRWLNEWACTIVE', '8f60a76b-3e94-3892-f771-5356189df7d4', 0),
('9b315af3-7130-d2b4-0ae0-53561851b1c7', '1', 'SWNA_SNRWLNEWACTIVE', 'SWNA_SNRWLNEWACTIVE', '91f90f47-d324-64af-3f43-535618eb215d', 0),
('9decf8f2-a160-e5cd-6231-535618879630', '1', 'SWNA_SNRWLNEWACTIVE', 'SWNA_SNRWLNEWACTIVE', '9cae2977-d6cc-604b-0193-535618f095d6', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_password_link`
--

CREATE TABLE IF NOT EXISTS `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_password_link`
--

INSERT INTO `users_password_link` (`id`, `username`, `date_generated`, `deleted`) VALUES
('72041ff7-94bc-caf3-1b5b-5356356a3797', 'morad', '2014-04-22 09:26:27', NULL),
('8a825ee8-aaf9-f376-90c0-535856622a3a', 'morad', '2014-04-24 00:09:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_signatures`
--

CREATE TABLE IF NOT EXISTS `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE IF NOT EXISTS `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('10dabd21-ba7a-41e2-f237-535238aee60b', 'Employees2_EMPLOYEE', 0, '2014-04-19 08:48:23', '2014-04-19 08:48:23', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('12ef2650-df9a-79ba-904b-534c49291df3', 'Plcs_File_tasken2_PLCS_FILE_TASKEN', 0, '2014-04-14 20:48:40', '2014-04-21 19:51:34', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czo5OiJyZW1hcmtzX2MiO3M6OToic29ydE9yZGVyIjtzOjM6IkFTQyI7fX0='),
('170dfab6-58aa-f1c5-6a21-520f79639d97', 'Home', 0, '2013-08-17 13:23:11', '2014-04-21 20:03:39', '1', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImRjMjZiYzMwLTZmYWUtMGM3OS1hODU3LTUzNTU3OWYzMTk1NCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoyMzoiUGxjc19GaWxlX3Rhc2tlbkRhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjE2OiJQbGNzX0ZpbGVfdGFza2VuIjtzOjc6Im9wdGlvbnMiO2E6MDp7fXM6MTI6ImZpbGVMb2NhdGlvbiI7czo4NToibW9kdWxlcy9QbGNzX0ZpbGVfdGFza2VuL0Rhc2hsZXRzL1BsY3NfRmlsZV90YXNrZW5EYXNobGV0L1BsY3NfRmlsZV90YXNrZW5EYXNobGV0LnBocCI7fXM6MzY6IjQzOGEwNzVmLTUyMjQtMGVmNi0zN2I2LTUzNTU3OWMxZTFmOCI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoyODoiVldOQV9WSUxMQVdMTkVXQUNUSVZFRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MjE6IlZXTkFfVklMTEFXTE5FV0FDVElWRSI7czo3OiJvcHRpb25zIjthOjA6e31zOjEyOiJmaWxlTG9jYXRpb24iO3M6MTAwOiJtb2R1bGVzL1ZXTkFfVklMTEFXTE5FV0FDVElWRS9EYXNobGV0cy9WV05BX1ZJTExBV0xORVdBQ1RJVkVEYXNobGV0L1ZXTkFfVklMTEFXTE5FV0FDVElWRURhc2hsZXQucGhwIjt9czozNjoiOGQyN2U5MzAtN2Y4OC1jZDZmLWQ5NmUtNTM1NTc5ZGJmODNkIjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjI2OiJTV05BX1NOUldMTkVXQUNUSVZFRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTk6IlNXTkFfU05SV0xORVdBQ1RJVkUiO3M6Nzoib3B0aW9ucyI7YTowOnt9czoxMjoiZmlsZUxvY2F0aW9uIjtzOjk0OiJtb2R1bGVzL1NXTkFfU05SV0xORVdBQ1RJVkUvRGFzaGxldHMvU1dOQV9TTlJXTE5FV0FDVElWRURhc2hsZXQvU1dOQV9TTlJXTE5FV0FDVElWRURhc2hsZXQucGhwIjt9czozNjoiZDJhZWQzNmItYzhmMi1hYWE5LTY4ZDUtNTM1NTc5MzNlMDIxIjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjI4OiJWV05BX1ZJTExBV0xORVdBQ1RJVkVEYXNobGV0IjtzOjY6Im1vZHVsZSI7czoyMToiVldOQV9WSUxMQVdMTkVXQUNUSVZFIjtzOjc6Im9wdGlvbnMiO2E6MDp7fXM6MTI6ImZpbGVMb2NhdGlvbiI7czoxMDA6Im1vZHVsZXMvVldOQV9WSUxMQVdMTkVXQUNUSVZFL0Rhc2hsZXRzL1ZXTkFfVklMTEFXTE5FV0FDVElWRURhc2hsZXQvVldOQV9WSUxMQVdMTkVXQUNUSVZFRGFzaGxldC5waHAiO31zOjM2OiJhYzAwM2U3Ni0xYmUyLWFkYjQtZTdkZC01MzU1NzkxYWY2MzUiO2E6NDp7czo5OiJjbGFzc05hbWUiO3M6Mjk6IkpXTkFfSlVOSU9SV0xORVdBQ1RJVkVEYXNobGV0IjtzOjY6Im1vZHVsZSI7czoyMjoiSldOQV9KVU5JT1JXTE5FV0FDVElWRSI7czo3OiJvcHRpb25zIjthOjA6e31zOjEyOiJmaWxlTG9jYXRpb24iO3M6MTAzOiJtb2R1bGVzL0pXTkFfSlVOSU9SV0xORVdBQ1RJVkUvRGFzaGxldHMvSldOQV9KVU5JT1JXTE5FV0FDVElWRURhc2hsZXQvSldOQV9KVU5JT1JXTE5FV0FDVElWRURhc2hsZXQucGhwIjt9czozNjoiOGFkODA2MDEtNWQwOC03YWZhLTE2OWEtNTM1NTc5NGU1ZWY0IjthOjQ6e3M6OToiY2xhc3NOYW1lIjtzOjM1OiJIV0xBX0hBUkFTQVdBSVRJTkdMSVNUQUNUSVZFRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6Mjg6IkhXTEFfSEFSQVNBV0FJVElOR0xJU1RBQ1RJVkUiO3M6Nzoib3B0aW9ucyI7YTowOnt9czoxMjoiZmlsZUxvY2F0aW9uIjtzOjEyMToibW9kdWxlcy9IV0xBX0hBUkFTQVdBSVRJTkdMSVNUQUNUSVZFL0Rhc2hsZXRzL0hXTEFfSEFSQVNBV0FJVElOR0xJU1RBQ1RJVkVEYXNobGV0L0hXTEFfSEFSQVNBV0FJVElOR0xJU1RBQ1RJVkVEYXNobGV0LnBocCI7fX1zOjU6InBhZ2VzIjthOjE6e2k6MDthOjM6e3M6NzoiY29sdW1ucyI7YToyOntpOjA7YToyOntzOjU6IndpZHRoIjtzOjM6IjYwJSI7czo4OiJkYXNobGV0cyI7YTo2OntpOjA7czozNjoiYWMwMDNlNzYtMWJlMi1hZGI0LWU3ZGQtNTM1NTc5MWFmNjM1IjtpOjE7czozNjoiOGFkODA2MDEtNWQwOC03YWZhLTE2OWEtNTM1NTc5NGU1ZWY0IjtpOjI7czozNjoiZDJhZWQzNmItYzhmMi1hYWE5LTY4ZDUtNTM1NTc5MzNlMDIxIjtpOjM7czozNjoiOGQyN2U5MzAtN2Y4OC1jZDZmLWQ5NmUtNTM1NTc5ZGJmODNkIjtpOjQ7czozNjoiNDM4YTA3NWYtNTIyNC0wZWY2LTM3YjYtNTM1NTc5YzFlMWY4IjtpOjU7czozNjoiZGMyNmJjMzAtNmZhZS0wYzc5LWE4NTctNTM1NTc5ZjMxOTU0Ijt9fWk6MTthOjI6e3M6NToid2lkdGgiO3M6MzoiNDAlIjtzOjg6ImRhc2hsZXRzIjthOjE6e2k6MDtzOjA6IiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIyIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),
('18a8e74a-b73f-18ec-05b4-52ee3351e90b', 'Cases2_CASE', 0, '2014-02-02 12:01:11', '2014-02-02 12:01:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('18e1f85f-e627-7e22-8cb4-520f7965e201', 'Home2_CALL', 0, '2013-08-17 13:23:11', '2013-08-17 13:23:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('19b36619-a3d8-505d-b5f1-520f79b10974', 'Home2_MEETING', 0, '2013-08-17 13:23:11', '2013-08-17 13:23:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('1a7f65f0-d10c-fdc7-d568-520f79b75dd0', 'Home2_OPPORTUNITY', 0, '2013-08-17 13:23:11', '2013-08-17 13:23:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('1b3f87de-ac26-d896-8105-520f7962d3d7', 'Home2_ACCOUNT', 0, '2013-08-17 13:23:11', '2013-08-17 13:23:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('1d32ea96-6a3c-2975-be37-535565e731d1', 'SWNA_SNRWLNEWACTIVE2_SWNA_SNRWLNEWACTIVE', 0, '2014-04-21 18:36:48', '2014-04-24 04:13:01', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('2110a863-eae0-cbe9-07db-520f79ed36f6', 'Home2_LEAD', 0, '2013-08-17 13:23:11', '2013-08-17 13:23:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('21d11267-a394-7751-3d88-520f790c2a37', 'Home2_SUGARFEED', 0, '2013-08-17 13:23:11', '2013-08-17 13:23:11', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('239d654a-8571-262e-9a52-52ee35b3d125', 'Accounts2_ACCOUNT', 0, '2014-02-02 12:07:28', '2014-02-02 12:07:28', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('318f9ec3-92b6-cb04-8746-5358549392a6', 'global', 0, '2014-04-24 00:01:54', '2014-04-24 00:01:54', '27f85892-8c01-22f6-ee95-535854ef16aa', 'YTozMjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoxMzoic3VicGFuZWxfdGFicyI7czoyOiJvbiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6LTE7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTotMTtzOjg6InRpbWV6b25lIjtzOjE1OiJBbWVyaWNhL0NoaWNhZ28iO3M6MjoidXQiO3M6MToiMCI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjE1OiJtYWlsX3NtdHBzZXJ2ZXIiO3M6MjE6InNtdHA6Ly9vd24tc291cmNlLmNvbSI7czoxMzoibWFpbF9zbXRwdXNlciI7czo1OiJhZG1pbiI7czoxMzoibWFpbF9zbXRwcGFzcyI7czo1OiJhZG1pbiI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjM2OiIzMTVlY2I0Ni05NWRmLWUyYzQtOTVhYy01MzU4NTRiMjUzNzIiO30='),
('33e48d87-105d-dca5-c90a-534fd3a33e7f', 'Plcs_File_tasken', 0, '2014-04-17 13:15:09', '2014-04-17 13:15:09', '1', 'YToxOntzOjIyOiJMaXN0Vmlld0Rpc3BsYXlDb2x1bW5zIjthOjA6e319'),
('37101423-b420-1c5f-1457-535564ab32d6', 'VWNA_VILLAWLNEWACTIVE2_VWNA_VILLAWLNEWACTIVE', 0, '2014-04-21 18:34:02', '2014-04-21 18:34:02', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('44bd509c-9c4a-ff66-9330-5358573e4cc0', 'ETag', 0, '2014-04-24 00:15:21', '2014-04-24 00:16:15', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mjt9'),
('45f203a5-5b8e-5826-bfce-535587f2ad23', 'WLMCA_WAITINGLISTMSDCLINICACTIVE2_WLMCA_WAITINGLIS', 0, '2014-04-21 21:02:43', '2014-04-21 21:02:43', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('4853051c-668e-2f1b-0dd1-53562576bbb6', 'ETag', 1, '2014-04-22 08:17:41', '2014-04-24 00:12:35', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mzt9'),
('4d7450d9-7cfe-475e-79b2-534c478bcb27', 'Notes2_NOTE', 0, '2014-04-14 20:40:50', '2014-04-14 20:40:50', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('4fa31622-3fa2-7398-82b7-535579e7f28c', 'Home2_VWNA_VILLAWLNEWACTIVE', 0, '2014-04-21 20:02:56', '2014-04-21 20:02:56', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('5579dc3b-a315-0256-7b4b-52ee33f9831e', 'Documents2_DOCUMENT', 0, '2014-02-02 12:01:49', '2014-02-02 12:01:49', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('60af36d7-9c93-6876-a1b5-53561822d5c9', 'HWLA_HARASAWAITINGLISTACTIVE2_HWLA_HARASAWAITINGLI', 0, '2014-04-22 07:20:33', '2014-04-22 07:20:33', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('61728dca-9432-9755-93a2-53585709bd2f', 'global', 0, '2014-04-24 00:12:57', '2014-04-24 00:16:15', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'YTozMjp7czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6MjoidXQiO3M6MToiMCI7czo4OiJ0aW1lem9uZSI7czoxNToiQW1lcmljYS9DaGljYWdvIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mzoib2ZmIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjI6Im9uIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjEzOiJyZW1pbmRlcl90aW1lIjtpOi0xO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO2k6LTE7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czozOiJIOmkiO3M6MTU6Im1haWxfc210cHNlcnZlciI7czoyMToic210cDovL293bi1zb3VyY2UuY29tIjtzOjEzOiJtYWlsX3NtdHB1c2VyIjtzOjU6Im1vcmFkIjtzOjEzOiJtYWlsX3NtdHBwYXNzIjtzOjA6IiI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjY6Im1haWx0byI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czowOiIiO30='),
('63a60360-a4a2-75b0-de5d-520f79f37623', 'ETag', 0, '2013-08-17 13:23:11', '2014-04-21 20:35:30', '1', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTQ7fQ=='),
('6476d4c6-8526-3abb-53bd-53540cc98933', 'Home2_PLCS_FILE_TASKEN', 0, '2014-04-20 18:07:52', '2014-04-20 18:07:52', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('64eb354b-9870-cb59-b0a8-535857ea098d', 'Reports', 0, '2014-04-24 00:12:57', '2014-04-24 00:12:57', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'YToxOntzOjk6ImZhdm9yaXRlcyI7Tjt9'),
('653e29f0-64ec-0a8c-1d44-5358578e9136', 'home', 0, '2014-04-24 00:12:57', '2014-04-24 00:12:57', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'YToyOntzOjU6InBhZ2VzIjtOO3M6ODoiZGFzaGxldHMiO047fQ=='),
('67c3d028-1e6a-c216-5caa-534f9b2f2aac', 'Import2_PLCS_FILE_TASKEN', 0, '2014-04-17 09:14:23', '2014-04-17 09:14:23', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('69df5625-3022-2c9b-e103-53561d607051', 'ETag', 0, '2014-04-22 07:42:23', '2014-04-22 07:42:23', 'def89416-e718-d948-9635-53561c7d2a9b', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),
('6fb0f46f-ff27-c96e-2b18-5356229b1878', 'SWNA_SNRWLNEWACTIVE', 0, '2014-04-22 08:05:49', '2014-04-22 08:05:49', '1', 'YToxOntzOjIyOiJMaXN0Vmlld0Rpc3BsYXlDb2x1bW5zIjthOjA6e319'),
('70d78623-91a7-f167-b52c-5355874a2af6', 'Import2_JWNA_JUNIORWLNEWACTIVE', 0, '2014-04-21 21:04:50', '2014-04-21 21:04:50', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('778c05be-23d3-84ec-feb1-535587f2fbca', 'JWNA_JUNIORWLNEWACTIVE2_JWNA_JUNIORWLNEWACTIVE', 0, '2014-04-21 21:02:59', '2014-04-21 21:02:59', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('8331b03d-3443-936f-08d5-535587eb10bc', 'HWLA_HARASAWAITINGLISTACTIVE2_HWLA_HARASAWAITINGLI', 0, '2014-04-21 21:02:58', '2014-04-21 21:02:58', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('833701d8-bccd-2717-5da2-52ee3351f1d9', 'Contacts2_CONTACT', 0, '2014-02-02 11:59:43', '2014-02-02 11:59:43', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('89df88c4-122a-aa98-6848-52ee348503f0', 'ACLRoles2_ACLROLE', 0, '2014-02-02 12:05:16', '2014-02-02 12:05:16', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('8f1af9b2-056c-400d-c044-5355790f8041', 'Home2_JWNA_JUNIORWLNEWACTIVE', 0, '2014-04-21 20:03:21', '2014-04-21 20:03:21', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('9a17a2c1-d49a-8df3-d2ab-535614e2cb19', 'WLMCA_WAITINGLISTMSDCLINICACTIVE2_WLMCA_WAITINGLIS', 0, '2014-04-22 07:02:40', '2014-04-22 07:02:40', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('9aa30b56-348b-a45b-3afb-53557961b502', 'Home2_SWNA_SNRWLNEWACTIVE', 0, '2014-04-21 20:03:06', '2014-04-21 20:03:06', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('a2e20d48-50ee-5a16-a9bb-520f7840e721', 'global', 0, '2013-08-17 13:21:13', '2014-04-24 04:12:36', '1', 'YTozMTp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6ImEyYTc1OGQ4LTkxNDctY2JlNS1lMDBjLTUyMGY3ODE1NzA5OSI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWdhcjUiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6ODoidGltZXpvbmUiO3M6MzoiVVRDIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTk6ImVtYWlsX3JlbWluZGVyX3RpbWUiO2k6LTE7czoyOiJ1dCI7czoxOiIxIjtzOjg6ImN1cnJlbmN5IjtzOjM6Ii05OSI7czozNToiZGVmYXVsdF9jdXJyZW5jeV9zaWduaWZpY2FudF9kaWdpdHMiO3M6MToiMiI7czoxMToibnVtX2dycF9zZXAiO3M6MToiLCI7czo3OiJkZWNfc2VwIjtzOjE6Ii4iO3M6NToiZGF0ZWYiO3M6NToibS9kL1kiO3M6NToidGltZWYiO3M6NDoiaDppYSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTQ6InVzZV9yZWFsX25hbWVzIjtzOjI6Im9uIjtzOjE3OiJtYWlsX3NtdHBhdXRoX3JlcSI7czowOiIiO3M6MTI6Im1haWxfc210cHNzbCI7aTowO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoxOToidGhlbWVfY3VycmVudF9ncm91cCI7czo4OiLYp9mE2YPZhCI7czoyNzoiRG9jdW1lbnRzX0RPQ1VNRU5UX09SREVSX0JZIjtzOjEzOiJkb2N1bWVudF9uYW1lIjtzOjE3OiJQbGNzX0ZpbGVfdGFza2VuUSI7YToyOTp7czo2OiJtb2R1bGUiO3M6MTY6IlBsY3NfRmlsZV90YXNrZW4iO3M6NjoiYWN0aW9uIjtzOjU6ImluZGV4IjtzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjEyOiJiYXNpY19zZWFyY2giO3M6NToicXVlcnkiO3M6NDoidHJ1ZSI7czoxNToicmVtYXJrc19jX2Jhc2ljIjtzOjA6IiI7czoxNToibm9vZmRlcF9jX2Jhc2ljIjtzOjA6IiI7czoxNDoibWlsbXNkX2NfYmFzaWMiO3M6MDoiIjtzOjEzOiJncmFkZV9jX2Jhc2ljIjtzOjA6IiI7czoxNDoicGFjY29tX2NfYmFzaWMiO3M6MDoiIjtzOjExOiJtc2RfY19iYXNpYyI7czowOiIiO3M6MTc6InNlYXJjaF9uYW1lX2Jhc2ljIjtzOjA6IiI7czoxMToic25vX2NfYmFzaWMiO3M6MToiMyI7czo2OiJidXR0b24iO3M6NjoiU2VhcmNoIjtzOjE4OiJyZW1hcmtzX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE2OiJncmFkZV9jX2FkdmFuY2VkIjtzOjA6IiI7czoxNzoibWlsbXNkX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE4OiJub29mZGVwX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE0OiJtc2RfY19hZHZhbmNlZCI7czowOiIiO3M6MTk6ImRlcGFydG1lbnRfYWR2YW5jZWQiO3M6MDoiIjtzOjE4OiJsYXN0X25hbWVfYWR2YW5jZWQiO3M6MDoiIjtzOjE0OiJzbm9fY19hZHZhbmNlZCI7czowOiIiO3M6OToic2hvd1NTRElWIjtzOjI6Im5vIjtzOjE3OiJzYXZlZF9zZWFyY2hfbmFtZSI7czowOiIiO3M6MTM6InNlYXJjaF9tb2R1bGUiO3M6MDoiIjtzOjE5OiJzYXZlZF9zZWFyY2hfYWN0aW9uIjtzOjA6IiI7czoxNDoiZGlzcGxheUNvbHVtbnMiO3M6ODM6IlJFTUFSS1NfQ3xOT09GREVQX0N8QVBQREFURV9DfFBBQ0NPTV9DfEdSQURFX0N8TUlMTVNEX0N8TVNEX0N8REVQQVJUTUVOVHxOQU1FfFNOT19DIjtzOjg6ImhpZGVUYWJzIjtzOjE3MToiRE9fTk9UX0NBTEx8UEhPTkVfSE9NRXxQSE9ORV9NT0JJTEV8UEhPTkVfT1RIRVJ8UEhPTkVfRkFYfFRJVExFfEFERFJFU1NfU1RSRUVUfFBIT05FX1dPUkt8RU1BSUwxfEFERFJFU1NfQ0lUWXxBRERSRVNTX1NUQVRFfEFERFJFU1NfUE9TVEFMQ09ERXxEQVRFX0VOVEVSRUR8Q1JFQVRFRF9CWV9OQU1FIjtzOjc6Im9yZGVyQnkiO3M6OToiUkVNQVJLU19DIjtzOjk6InNvcnRPcmRlciI7czozOiJBU0MiO31zOjEwOiJFbXBsb3llZXNRIjthOjc6e3M6NjoibW9kdWxlIjtzOjk6IkVtcGxveWVlcyI7czo2OiJhY3Rpb24iO3M6NToiaW5kZXgiO3M6NToicXVlcnkiO3M6NDoidHJ1ZSI7czoxNjoic3VnYXJfdXNlcl90aGVtZSI7czo2OiJTdWdhcjUiO3M6MTQ6ImNrX2xvZ2luX2lkXzIwIjtzOjE6IjEiO3M6MjA6ImNrX2xvZ2luX2xhbmd1YWdlXzIwIjtzOjU6ImFyX2VnIjtzOjk6IlBIUFNFU1NJRCI7czozMjoiNTU3NjdhNzgzZmU1ZDRkNzgyZjU4YzEwOTEzNzM5NGIiO31zOjIwOiJTV05BX1NOUldMTkVXQUNUSVZFUSI7YToyNjp7czo2OiJtb2R1bGUiO3M6MTk6IlNXTkFfU05SV0xORVdBQ1RJVkUiO3M6NjoiYWN0aW9uIjtzOjU6ImluZGV4IjtzOjEzOiJzZWFyY2hGb3JtVGFiIjtzOjE1OiJhZHZhbmNlZF9zZWFyY2giO3M6NToicXVlcnkiO3M6NDoidHJ1ZSI7czoxNDoic25vX2NfYWR2YW5jZWQiO3M6MDoiIjtzOjE4OiJsYXN0X25hbWVfYWR2YW5jZWQiO3M6MDoiIjtzOjE5OiJkZXBhcnRtZW50X2FkdmFuY2VkIjtzOjA6IiI7czoxNDoibXNkX2NfYWR2YW5jZWQiO3M6NToiMTY2MDkiO3M6MTc6Im1pbG1zZF9jX2FkdmFuY2VkIjtzOjA6IiI7czoxNjoiZ3JhZGVfY19hZHZhbmNlZCI7czowOiIiO3M6MTg6ImFwcGRhdGVfY19hZHZhbmNlZCI7czowOiIiO3M6MTc6InBhY2NvbV9jX2FkdmFuY2VkIjtzOjA6IiI7czoxODoibm9vZmRlcF9jX2FkdmFuY2VkIjtzOjA6IiI7czoxODoicmVtYXJrc19jX2FkdmFuY2VkIjtzOjA6IiI7czo5OiJzaG93U1NESVYiO3M6Mjoibm8iO3M6MTc6InNhdmVkX3NlYXJjaF9uYW1lIjtzOjA6IiI7czoxMzoic2VhcmNoX21vZHVsZSI7czowOiIiO3M6MTk6InNhdmVkX3NlYXJjaF9hY3Rpb24iO3M6MDoiIjtzOjE0OiJkaXNwbGF5Q29sdW1ucyI7czo4ODoiU05PX0N8TEFTVF9OQU1FfERFUEFSVE1FTlR8TVNEX0N8TUlMTVNEX0N8R1JBREVfQ3xQQUNDT01fQ3xBUFBEQVRFX0N8Tk9PRkRFUF9DfFJFTUFSS1NfQyI7czo4OiJoaWRlVGFicyI7czowOiIiO3M6OToic29ydE9yZGVyIjtzOjM6IkFTQyI7czo2OiJidXR0b24iO3M6Njoi2KjYrdirIjtzOjE2OiJzdWdhcl91c2VyX3RoZW1lIjtzOjY6IlN1Z2FyNSI7czoxNDoiY2tfbG9naW5faWRfMjAiO3M6MToiMSI7czoyMDoiY2tfbG9naW5fbGFuZ3VhZ2VfMjAiO3M6NToiYXJfZWciO3M6OToiUEhQU0VTU0lEIjtzOjMyOiI3YTFkMjZlZDZiZDQ0NTdjMDM3NTRlYjUxNzY1OGIwZiI7fX0='),
('a3cb370c-7887-a5e3-8e6f-5356184a40c1', 'Import2_SWNA_SNRWLNEWACTIVE', 0, '2014-04-22 07:21:05', '2014-04-22 07:21:05', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('ab8dd3ac-a1c7-5d42-b348-53561624ddab', 'WLMCA_WAITINGLISTMSDCLINICACTIVE2_WLMCA_WAITINGLIS', 0, '2014-04-22 07:11:26', '2014-04-22 07:11:26', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('b2c9fe9d-4a9c-313e-2d06-535736a62195', 'WLMCA_WAITINGLISTMSDCLINICACTIVE2_WLMCA_WAITINGLIS', 0, '2014-04-23 03:42:24', '2014-04-23 03:42:24', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('b53ebbcb-0af4-a599-cf18-534f9bf71b31', 'import', 0, '2014-04-17 09:13:21', '2014-04-22 07:19:48', '1', 'YToxOntzOjEyOiJmaWVsZF92YWx1ZXMiO3M6NDM0OiJ7ImN1c3RvbV9kZWxpbWl0ZXIiOiIsIiwiY3VzdG9tX2VuY2xvc3VyZSI6IiZxdW90OyIsImltcG9ydF90eXBlIjoiaW1wb3J0Iiwic291cmNlIjoiY3N2Iiwic291cmNlX2lkIjoiIiwiaW1wb3J0X21vZHVsZSI6IlNXTkFfU05SV0xORVdBQ1RJVkUiLCJoYXNfaGVhZGVyIjoib24iLCJpbXBvcnRsb2NhbGVfY2hhcnNldCI6IlVURi04IiwiaW1wb3J0bG9jYWxlX2RhdGVmb3JtYXQiOiJtXC9kXC9ZIiwiaW1wb3J0bG9jYWxlX3RpbWVmb3JtYXQiOiJoOmlhIiwiaW1wb3J0bG9jYWxlX3RpbWV6b25lIjoiVVRDIiwiaW1wb3J0bG9jYWxlX2N1cnJlbmN5IjoiLTk5IiwiaW1wb3J0bG9jYWxlX2RlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjoiMiIsImltcG9ydGxvY2FsZV9udW1fZ3JwX3NlcCI6IiwiLCJpbXBvcnRsb2NhbGVfZGVjX3NlcCI6Ii4ifSI7fQ=='),
('b7c6af9d-4a65-1b8f-f280-53561bcb9ae9', 'HWLA_HARASAWAITINGLISTACTIVE2_HWLA_HARASAWAITINGLI', 0, '2014-04-22 07:36:14', '2014-04-22 07:36:14', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('bdaf9a58-e397-35e9-18dc-53561e7be89b', 'global', 1, '2014-04-22 07:46:59', '2014-04-24 00:12:35', 'ba2e7a1f-92ff-039f-c470-53561edc8ca5', 'YTozMjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoxMzoic3VicGFuZWxfdGFicyI7czoyOiJvbiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6LTE7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTotMTtzOjg6InRpbWV6b25lIjtzOjE1OiJBbWVyaWNhL0NoaWNhZ28iO3M6MjoidXQiO3M6MToiMCI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjE1OiJtYWlsX3NtdHBzZXJ2ZXIiO3M6MjE6InNtdHA6Ly9vd24tc291cmNlLmNvbSI7czoxMzoibWFpbF9zbXRwdXNlciI7czo1OiJtb3JhZCI7czoxMzoibWFpbF9zbXRwcGFzcyI7czo4OiJtb3JhZDEyMyI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjM2OiJiZDg4ZDI0Mi03YzE3LWRiM2QtNzhiMC01MzU2MWVjMDdmOWIiO30='),
('c2ad9e73-1bc0-0258-ad14-53574ea9ef50', 'HWLA_HARASAWAITINGLISTACTIVE2_HWLA_HARASAWAITINGLI', 0, '2014-04-23 05:24:26', '2014-04-23 05:24:26', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('ca2928e2-d6c8-581c-47d9-535589ac07b3', 'global', 0, '2014-04-21 21:11:30', '2014-04-21 21:11:30', 'c110dda1-5b21-a328-666e-5355894d667c', 'YTozMjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoxMzoic3VicGFuZWxfdGFicyI7czoyOiJvbiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6LTE7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTotMTtzOjg6InRpbWV6b25lIjtzOjE1OiJBbWVyaWNhL0NoaWNhZ28iO3M6MjoidXQiO3M6MToiMCI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjE1OiJtYWlsX3NtdHBzZXJ2ZXIiO3M6MjE6InNtdHA6Ly9vd24tc291cmNlLmNvbSI7czoxMzoibWFpbF9zbXRwdXNlciI7czo1OiJhZG1pbiI7czoxMzoibWFpbF9zbXRwcGFzcyI7czo1OiJhZG1pbiI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjU6InN1Z2FyIjtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MjA6ImNhbGVuZGFyX3B1Ymxpc2hfa2V5IjtzOjM2OiJjOWVlOWVkZS0wMDU5LTQ3MzctMTk5Ny01MzU1ODliNGU5MGEiO30='),
('cfe421a6-1465-28de-975f-5356181d09e5', 'WLMCA_WAITINGLISTMSDCLINICACTIVE2_WLMCA_WAITINGLIS', 0, '2014-04-22 07:20:38', '2014-04-22 07:20:38', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d459693b-62e9-e4a6-b464-53561b63fbe9', 'WLMCA_WAITINGLISTMSDCLINICACTIVE2_WLMCA_WAITINGLIS', 0, '2014-04-22 07:36:20', '2014-04-22 07:36:20', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('e2262efc-cdd5-be82-80e0-535589401bd8', 'Users2_USER', 0, '2014-04-21 21:09:58', '2014-04-21 21:09:58', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('e8dc0021-c605-7dd6-98d7-53561ce936a6', 'global', 0, '2014-04-22 07:40:25', '2014-04-22 07:43:42', 'def89416-e718-d948-9635-53561c7d2a9b', 'YTozMjp7czoxMjoibWFpbG1lcmdlX29uIjtzOjM6Im9mZiI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoxMzoic3VicGFuZWxfdGFicyI7czoyOiJvbiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6LTE7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTotMTtzOjg6InRpbWV6b25lIjtzOjE1OiJBbWVyaWNhL0NoaWNhZ28iO3M6MjoidXQiO3M6MToiMCI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjE1OiJtYWlsX3NtdHBzZXJ2ZXIiO3M6MjE6InNtdHA6Ly9vd24tc291cmNlLmNvbSI7czoxMzoibWFpbF9zbXRwdXNlciI7czo1OiJzcmFhYSI7czoxMzoibWFpbF9zbXRwcGFzcyI7czo1OiIxMjM0NSI7czoyNjoiZGVmYXVsdF9sb2NhbGVfbmFtZV9mb3JtYXQiO3M6NToicyBmIGwiO3M6MTY6ImV4cG9ydF9kZWxpbWl0ZXIiO3M6MToiLCI7czoyMjoiZGVmYXVsdF9leHBvcnRfY2hhcnNldCI7czo1OiJVVEYtOCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNToiZW1haWxfbGlua190eXBlIjtzOjY6Im1haWx0byI7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIwOiJjYWxlbmRhcl9wdWJsaXNoX2tleSI7czozNjoiZTg5NmQ0MmEtYzM4OC0xYjk3LTUzMjEtNTM1NjFjNWFkOTgyIjt9'),
('ec9097a5-d39a-c61a-d23d-53557937a4e2', 'Home2_HWLA_HARASAWAITINGLISTACTIVE', 0, '2014-04-21 20:03:24', '2014-04-21 20:03:24', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `vcals`
--

CREATE TABLE IF NOT EXISTS `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_version` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_version` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `deleted`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `file_version`, `db_version`) VALUES
('2545414d-019c-80c0-22e0-5355833e15d1', 0, '2014-04-21 20:47:40', '2014-04-21 20:47:40', '1', '1', 'Rebuild Relationships', '4.0.0', '4.0.0'),
('3165bdaf-eaea-4b47-fab7-535583018c27', 0, '2014-04-21 20:47:40', '2014-04-21 20:47:40', '1', '1', 'Rebuild Extensions', '4.0.0', '4.0.0'),
('b9f0f413-88af-049e-8c27-520f789dc773', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'Chart Data Cache', '3.5.1', '3.5.1'),
('bb45cdf9-ae42-1eb9-4a3a-520f785f2061', 0, '2013-08-17 13:21:13', '2013-08-17 13:21:13', '1', '1', 'htaccess', '3.5.1', '3.5.1');

-- --------------------------------------------------------

--
-- Table structure for table `vwna_villawlnewactive`
--

CREATE TABLE IF NOT EXISTS `vwna_villawlnewactive` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vwna_villawlnewactive_audit`
--

CREATE TABLE IF NOT EXISTS `vwna_villawlnewactive_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_vwna_villawlnewactive_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vwna_villawlnewactive_cstm`
--

CREATE TABLE IF NOT EXISTS `vwna_villawlnewactive_cstm` (
  `id_c` char(36) NOT NULL,
  `sno_c` varchar(255) DEFAULT NULL,
  `msd_c` varchar(255) DEFAULT NULL,
  `milmsd_c` varchar(255) DEFAULT NULL,
  `grade_c` varchar(255) DEFAULT NULL,
  `paccom_c` varchar(255) DEFAULT NULL,
  `appdate_c` varchar(255) DEFAULT NULL,
  `noofdep_c` varchar(255) DEFAULT NULL,
  `remarks_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wlmca_waitinglistmsdclinicactive`
--

CREATE TABLE IF NOT EXISTS `wlmca_waitinglistmsdclinicactive` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wlmca_waitinglistmsdclinicactive_audit`
--

CREATE TABLE IF NOT EXISTS `wlmca_waitinglistmsdclinicactive_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_wlmca_waitinglistmsdclinicactive_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wlmca_waitinglistmsdclinicactive_cstm`
--

CREATE TABLE IF NOT EXISTS `wlmca_waitinglistmsdclinicactive_cstm` (
  `id_c` char(36) NOT NULL,
  `sno_c` varchar(255) DEFAULT NULL,
  `msd_c` varchar(255) DEFAULT NULL,
  `milmsd_c` varchar(255) DEFAULT NULL,
  `grade_c` varchar(255) DEFAULT NULL,
  `paccom_c` varchar(255) DEFAULT NULL,
  `appdate_c` varchar(255) DEFAULT NULL,
  `noofdep_c` varchar(255) DEFAULT NULL,
  `remarks_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
