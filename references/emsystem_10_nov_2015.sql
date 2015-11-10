-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2015 at 01:58 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `emsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_article_type`
--

CREATE TABLE IF NOT EXISTS `dp0_article_type` (
  `iddp0_article_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddp0_article_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_continents`
--

CREATE TABLE IF NOT EXISTS `dp0_continents` (
  `iddp0_continents` tinyint(4) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`iddp0_continents`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_country`
--

CREATE TABLE IF NOT EXISTS `dp0_country` (
  `iddp0_country` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `iddp0_continents` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddp0_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_editor_decision`
--

CREATE TABLE IF NOT EXISTS `dp0_editor_decision` (
  `iddp0_editor_decision` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`iddp0_editor_decision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_file_type`
--

CREATE TABLE IF NOT EXISTS `dp0_file_type` (
  `iddp0_file_type` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddp0_file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_letter_description`
--

CREATE TABLE IF NOT EXISTS `dp0_letter_description` (
  `iddp0_letter_description` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `iddp0_letter_types` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddp0_letter_description`),
  KEY `iddp0_letter_types` (`iddp0_letter_types`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_letter_types`
--

CREATE TABLE IF NOT EXISTS `dp0_letter_types` (
  `iddp0_letter_types` tinyint(4) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddp0_letter_types`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_recommendation_type`
--

CREATE TABLE IF NOT EXISTS `dp0_recommendation_type` (
  `iddp0_recommendation_type` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`iddp0_recommendation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp0_roles`
--

CREATE TABLE IF NOT EXISTS `dp0_roles` (
  `iddp0_roles` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iddp0_roles`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `dp0_roles`
--

INSERT INTO `dp0_roles` (`iddp0_roles`, `name`) VALUES
(1, 'Super Admin'),
(2, 'Admin'),
(4, 'Manager (M3)'),
(6, 'Assistant Managing Editor (AME)'),
(7, 'Editor'),
(8, 'Author'),
(9, 'Reviewer');

-- --------------------------------------------------------

--
-- Table structure for table `dp1_classification`
--

CREATE TABLE IF NOT EXISTS `dp1_classification` (
  `iddp1_classification` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `iddp1_subject` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp1_classification`),
  KEY `iddp1_subject` (`iddp1_subject`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp1_journal`
--

CREATE TABLE IF NOT EXISTS `dp1_journal` (
  `iddp1_journal` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `journal_email` varchar(100) DEFAULT NULL,
  `journal_url` varchar(150) DEFAULT NULL,
  `iddp1_subject` int(11) DEFAULT NULL,
  `iddp1_organization` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp1_journal`),
  KEY `iddp1_subject` (`iddp1_subject`) USING BTREE,
  KEY `iddp1_organization` (`iddp1_organization`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp1_organization`
--

CREATE TABLE IF NOT EXISTS `dp1_organization` (
  `iddp1_organization` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iddp1_organization`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dp1_organization`
--

INSERT INTO `dp1_organization` (`iddp1_organization`, `name`) VALUES
(1, 'Omics');

-- --------------------------------------------------------

--
-- Table structure for table `dp1_subject`
--

CREATE TABLE IF NOT EXISTS `dp1_subject` (
  `iddp1_subject` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `iddp1_organization` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp1_subject`),
  KEY `dp1_subject_ibfk_1` (`iddp1_organization`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dp1_subject`
--

INSERT INTO `dp1_subject` (`iddp1_subject`, `name`, `iddp1_organization`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
(1, 'Medical', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dp1_users`
--

CREATE TABLE IF NOT EXISTS `dp1_users` (
  `iddp1_users` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_profile` int(11) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `available_reviewer` tinyint(4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp1_users`),
  KEY `iddp3_profile` (`iddp3_profile`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dp1_users`
--

INSERT INTO `dp1_users` (`iddp1_users`, `iddp3_profile`, `username`, `password`, `available_reviewer`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
(1, 1, 'chiru', 'chiru', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dp2_subclassification`
--

CREATE TABLE IF NOT EXISTS `dp2_subclassification` (
  `iddp2_subclassification` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `iddp1_classification` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp2_subclassification`),
  KEY `iddp1_classification` (`iddp1_classification`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_address`
--

CREATE TABLE IF NOT EXISTS `dp3_address` (
  `iddp3_address` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_profile` int(11) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `institution` varchar(250) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `street_address` text,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` int(10) DEFAULT NULL,
  `iddp0_country` int(11) DEFAULT NULL,
  `address_for` enum('work','home','other') DEFAULT NULL,
  `available_as_reviewer` tinyint(4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_address`),
  KEY `dp3_address_ibfk_1` (`iddp3_profile`) USING BTREE,
  KEY `iddp0_country` (`iddp0_country`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_article`
--

CREATE TABLE IF NOT EXISTS `dp3_article` (
  `iddp3_article` int(11) NOT NULL AUTO_INCREMENT,
  `iddp0_article_type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(200) DEFAULT NULL,
  `iddp1_journal` int(11) DEFAULT NULL,
  `abstract` longtext,
  `keywords` text,
  `manuscript_no` varchar(30) DEFAULT NULL,
  `approved_status` tinyint(4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `article_status` varchar(100) DEFAULT NULL,
  `revised_status` varchar(20) DEFAULT NULL,
  `revised_date` date DEFAULT NULL,
  PRIMARY KEY (`iddp3_article`),
  KEY `iddp1_journal` (`iddp1_journal`) USING BTREE,
  KEY `iddp0_article_type` (`iddp0_article_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_article_author`
--

CREATE TABLE IF NOT EXISTS `dp3_article_author` (
  `iddp3_article_author` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `title` varchar(10) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `academic_degree` varchar(50) DEFAULT NULL,
  `affiliation` text,
  `email` varchar(100) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `institution` varchar(250) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `street_address` text,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` int(10) DEFAULT NULL,
  `iddp0_country` int(11) DEFAULT NULL,
  `corresponding_author` tinyint(4) DEFAULT NULL,
  `article_region` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_article_author`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  KEY `iddp0_country` (`iddp0_country`) USING BTREE,
  KEY `article_region` (`article_region`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_article_comments`
--

CREATE TABLE IF NOT EXISTS `dp3_article_comments` (
  `iddp3_article_comments` int(11) NOT NULL AUTO_INCREMENT,
  `comments` text,
  `iddp3_article` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_article_comments`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_article_pdf`
--

CREATE TABLE IF NOT EXISTS `dp3_article_pdf` (
  `iddp3_article_pdf` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `pdf_path` varchar(200) DEFAULT NULL,
  `pdf_name` varchar(200) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_article_pdf`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_article_uploades`
--

CREATE TABLE IF NOT EXISTS `dp3_article_uploades` (
  `iddp3_article_uploades` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `file_order` tinyint(4) DEFAULT NULL,
  `iddp0_file_type` tinyint(4) DEFAULT NULL,
  `descritpion` varchar(200) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_size` varchar(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_article_uploades`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  KEY `iddp0_file_type` (`iddp0_file_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_people_notes`
--

CREATE TABLE IF NOT EXISTS `dp3_people_notes` (
  `iddp3_people_notes` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_profile` int(11) DEFAULT NULL,
  `people_notes` longtext,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_people_notes`),
  KEY `iddp3_profile` (`iddp3_profile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_personal_keywords`
--

CREATE TABLE IF NOT EXISTS `dp3_personal_keywords` (
  `iddp3_personal_keywords` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_profile` int(11) DEFAULT NULL,
  `personal_keywords` longtext,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_personal_keywords`),
  KEY `iddp3_profile` (`iddp3_profile`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp3_profile`
--

CREATE TABLE IF NOT EXISTS `dp3_profile` (
  `iddp3_profile` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `qualification` varchar(20) DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `primary_phone` int(15) DEFAULT NULL,
  `secondary_phone` int(15) DEFAULT NULL,
  `secondary_phone_for` enum('Mobile','Beeper','Home','Work','Admin.asst.') DEFAULT NULL,
  `fax_number` int(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `preferred_contact_method` enum('E-mail','Fax','Postal Mail','Telephone') DEFAULT NULL,
  `iddp1_subject` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_profile`),
  KEY `dp3_profile_ibfk_1` (`iddp1_subject`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dp3_profile`
--

INSERT INTO `dp3_profile` (`iddp3_profile`, `title`, `first_name`, `middle_name`, `last_name`, `qualification`, `country_code`, `primary_phone`, `secondary_phone`, `secondary_phone_for`, `fax_number`, `email`, `preferred_contact_method`, `iddp1_subject`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
(1, NULL, 'chiru', NULL, 'k', 'mca', NULL, NULL, NULL, 'Mobile', NULL, 'chiranjeevi_k@omicsgroup.co.in', 'E-mail', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dp3_suggest_reviewer`
--

CREATE TABLE IF NOT EXISTS `dp3_suggest_reviewer` (
  `iddp3_suggest_reviewer` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `academic_degree` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `institution` varchar(250) DEFAULT NULL,
  `department` varchar(250) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `reason` text,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_suggest_reviewer`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp4_article_classification`
--

CREATE TABLE IF NOT EXISTS `dp4_article_classification` (
  `iddp4_article_classification` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `iddp1_classification` int(11) DEFAULT NULL,
  `iddp2_subclassification` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp4_article_classification`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  KEY `iddp1_classification` (`iddp1_classification`) USING BTREE,
  KEY `iddp2_subclassification` (`iddp2_subclassification`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp4_article_editor`
--

CREATE TABLE IF NOT EXISTS `dp4_article_editor` (
  `iddp4_article_editor` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `iddp3_profile` int(11) DEFAULT NULL,
  `assignment_accept_status` tinyint(4) DEFAULT NULL,
  `active_status` tinyint(4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `iddp0_editor_decision` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddp4_article_editor`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  KEY `iddp0_editor_decision` (`iddp0_editor_decision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp4_assign_reviewer`
--

CREATE TABLE IF NOT EXISTS `dp4_assign_reviewer` (
  `iddp4_assign_reviewer` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `iddp4_article_editor` int(11) DEFAULT NULL,
  `assignment_accept_status` tinyint(4) DEFAULT NULL,
  `active_status` tinyint(4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `article_decision` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddp4_assign_reviewer`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  KEY `iddp4_article_editor` (`iddp4_article_editor`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp4_expertise`
--

CREATE TABLE IF NOT EXISTS `dp4_expertise` (
  `iddp4_expertise` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_profile` int(11) DEFAULT NULL,
  `iddp1_classification` int(11) DEFAULT NULL,
  `iddp2_subclassification` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp4_expertise`),
  KEY `iddp3_profile` (`iddp3_profile`) USING BTREE,
  KEY `iddp1_classification` (`iddp1_classification`) USING BTREE,
  KEY `iddp2_subclassification` (`iddp2_subclassification`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp4_user_role`
--

CREATE TABLE IF NOT EXISTS `dp4_user_role` (
  `iddp4_user_role` int(11) NOT NULL AUTO_INCREMENT,
  `iddp0_roles` int(11) DEFAULT NULL,
  `iddp1_users` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp4_user_role`),
  KEY `iddp0_roles` (`iddp0_roles`),
  KEY `iddp1_users` (`iddp1_users`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dp4_user_role`
--

INSERT INTO `dp4_user_role` (`iddp4_user_role`, `iddp0_roles`, `iddp1_users`, `created_date`, `created_by`, `modified_date`, `modified_by`) VALUES
(1, 2, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dp5_letter_description`
--

CREATE TABLE IF NOT EXISTS `dp5_letter_description` (
  `iddp0_letter_description` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `iddp1_subject` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `article_decision` tinyint(4) DEFAULT NULL,
  `iddp0_letter_types` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddp0_letter_description`),
  KEY `iddp1_subject` (`iddp1_subject`) USING BTREE,
  KEY `iddp0_letter_types` (`iddp0_letter_types`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp5_login_history`
--

CREATE TABLE IF NOT EXISTS `dp5_login_history` (
  `iddp5_login_history` int(11) NOT NULL AUTO_INCREMENT,
  `iddp1_users` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `client_ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`iddp5_login_history`),
  KEY `iddp1_users` (`iddp1_users`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dp5_reviewer_comments`
--

CREATE TABLE IF NOT EXISTS `dp5_reviewer_comments` (
  `iddp5_reviewer_comments` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `iddp4_article_editor` int(11) DEFAULT NULL,
  `iddp0_recommendation_type` tinyint(4) DEFAULT NULL,
  `comments` longtext,
  `confdential_comments` longtext,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `article_decision` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddp5_reviewer_comments`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  KEY `iddp4_article_editor` (`iddp4_article_editor`) USING BTREE,
  KEY `iddp0_recommendation_type` (`iddp0_recommendation_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dp0_letter_description`
--
ALTER TABLE `dp0_letter_description`
  ADD CONSTRAINT `dp0_letter_description_ibfk_1` FOREIGN KEY (`iddp0_letter_types`) REFERENCES `dp0_letter_types` (`iddp0_letter_types`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp1_classification`
--
ALTER TABLE `dp1_classification`
  ADD CONSTRAINT `dp1_classification_ibfk_1` FOREIGN KEY (`iddp1_subject`) REFERENCES `dp1_subject` (`iddp1_subject`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp1_journal`
--
ALTER TABLE `dp1_journal`
  ADD CONSTRAINT `dp1_journal_ibfk_3` FOREIGN KEY (`iddp1_organization`) REFERENCES `dp1_organization` (`iddp1_organization`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp1_journal_ibfk_4` FOREIGN KEY (`iddp1_subject`) REFERENCES `dp1_subject` (`iddp1_subject`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp1_subject`
--
ALTER TABLE `dp1_subject`
  ADD CONSTRAINT `dp1_subject_ibfk_1` FOREIGN KEY (`iddp1_organization`) REFERENCES `dp1_organization` (`iddp1_organization`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp1_users`
--
ALTER TABLE `dp1_users`
  ADD CONSTRAINT `dp1_users_ibfk_4` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp2_subclassification`
--
ALTER TABLE `dp2_subclassification`
  ADD CONSTRAINT `dp2_subclassification_ibfk_1` FOREIGN KEY (`iddp1_classification`) REFERENCES `dp1_classification` (`iddp1_classification`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_address`
--
ALTER TABLE `dp3_address`
  ADD CONSTRAINT `dp3_address_ibfk_3` FOREIGN KEY (`iddp0_country`) REFERENCES `dp0_country` (`iddp0_country`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp3_address_ibfk_4` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_article`
--
ALTER TABLE `dp3_article`
  ADD CONSTRAINT `dp3_article_ibfk_3` FOREIGN KEY (`iddp0_article_type`) REFERENCES `dp0_article_type` (`iddp0_article_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp3_article_ibfk_4` FOREIGN KEY (`iddp1_journal`) REFERENCES `dp1_journal` (`iddp1_journal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_article_author`
--
ALTER TABLE `dp3_article_author`
  ADD CONSTRAINT `dp3_article_author_ibfk_3` FOREIGN KEY (`iddp0_country`) REFERENCES `dp0_country` (`iddp0_country`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp3_article_author_ibfk_4` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_article_comments`
--
ALTER TABLE `dp3_article_comments`
  ADD CONSTRAINT `dp3_article_comments_ibfk_1` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_article_pdf`
--
ALTER TABLE `dp3_article_pdf`
  ADD CONSTRAINT `dp3_article_pdf_ibfk_1` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_article_uploades`
--
ALTER TABLE `dp3_article_uploades`
  ADD CONSTRAINT `dp3_article_uploades_ibfk_3` FOREIGN KEY (`iddp0_file_type`) REFERENCES `dp0_file_type` (`iddp0_file_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp3_article_uploades_ibfk_4` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_people_notes`
--
ALTER TABLE `dp3_people_notes`
  ADD CONSTRAINT `dp3_people_notes_ibfk_1` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_personal_keywords`
--
ALTER TABLE `dp3_personal_keywords`
  ADD CONSTRAINT `dp3_personal_keywords_ibfk_1` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_profile`
--
ALTER TABLE `dp3_profile`
  ADD CONSTRAINT `dp3_profile_ibfk_1` FOREIGN KEY (`iddp1_subject`) REFERENCES `dp1_subject` (`iddp1_subject`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp3_suggest_reviewer`
--
ALTER TABLE `dp3_suggest_reviewer`
  ADD CONSTRAINT `dp3_suggest_reviewer_ibfk_1` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp4_article_classification`
--
ALTER TABLE `dp4_article_classification`
  ADD CONSTRAINT `dp4_article_classification_ibfk_3` FOREIGN KEY (`iddp1_classification`) REFERENCES `dp1_classification` (`iddp1_classification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp4_article_classification_ibfk_4` FOREIGN KEY (`iddp2_subclassification`) REFERENCES `dp2_subclassification` (`iddp2_subclassification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp4_article_classification_ibfk_5` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp4_article_editor`
--
ALTER TABLE `dp4_article_editor`
  ADD CONSTRAINT `dp4_article_editor_ibfk_2` FOREIGN KEY (`iddp0_editor_decision`) REFERENCES `dp0_editor_decision` (`iddp0_editor_decision`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp4_article_editor_ibfk_3` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp4_assign_reviewer`
--
ALTER TABLE `dp4_assign_reviewer`
  ADD CONSTRAINT `dp4_assign_reviewer_ibfk_2` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp4_assign_reviewer_ibfk_3` FOREIGN KEY (`iddp4_article_editor`) REFERENCES `dp4_article_editor` (`iddp4_article_editor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp4_expertise`
--
ALTER TABLE `dp4_expertise`
  ADD CONSTRAINT `dp4_expertise_ibfk_3` FOREIGN KEY (`iddp1_classification`) REFERENCES `dp1_classification` (`iddp1_classification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp4_expertise_ibfk_4` FOREIGN KEY (`iddp2_subclassification`) REFERENCES `dp2_subclassification` (`iddp2_subclassification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp4_expertise_ibfk_5` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp4_user_role`
--
ALTER TABLE `dp4_user_role`
  ADD CONSTRAINT `dp4_user_role_ibfk_1` FOREIGN KEY (`iddp0_roles`) REFERENCES `dp0_roles` (`iddp0_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp4_user_role_ibfk_2` FOREIGN KEY (`iddp1_users`) REFERENCES `dp1_users` (`iddp1_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp5_letter_description`
--
ALTER TABLE `dp5_letter_description`
  ADD CONSTRAINT `dp5_letter_description_ibfk_3` FOREIGN KEY (`iddp0_letter_types`) REFERENCES `dp0_letter_types` (`iddp0_letter_types`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp5_letter_description_ibfk_4` FOREIGN KEY (`iddp1_subject`) REFERENCES `dp1_subject` (`iddp1_subject`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp5_login_history`
--
ALTER TABLE `dp5_login_history`
  ADD CONSTRAINT `dp5_login_history_ibfk_1` FOREIGN KEY (`iddp1_users`) REFERENCES `dp1_users` (`iddp1_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dp5_reviewer_comments`
--
ALTER TABLE `dp5_reviewer_comments`
  ADD CONSTRAINT `dp5_reviewer_comments_ibfk_4` FOREIGN KEY (`iddp0_recommendation_type`) REFERENCES `dp0_recommendation_type` (`iddp0_recommendation_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp5_reviewer_comments_ibfk_5` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dp5_reviewer_comments_ibfk_6` FOREIGN KEY (`iddp4_article_editor`) REFERENCES `dp4_article_editor` (`iddp4_article_editor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
