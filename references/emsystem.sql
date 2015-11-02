/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : ftrs

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-11-02 16:57:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of country
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_article_type
-- ----------------------------
DROP TABLE IF EXISTS `dp0_article_type`;
CREATE TABLE `dp0_article_type` (
  `iddp0_article_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddp0_article_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_article_type
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_continents
-- ----------------------------
DROP TABLE IF EXISTS `dp0_continents`;
CREATE TABLE `dp0_continents` (
  `iddp0_continents` tinyint(4) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`iddp0_continents`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_continents
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_country
-- ----------------------------
DROP TABLE IF EXISTS `dp0_country`;
CREATE TABLE `dp0_country` (
  `iddp0_country` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `iddp0_continents` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddp0_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_country
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_editor_decision
-- ----------------------------
DROP TABLE IF EXISTS `dp0_editor_decision`;
CREATE TABLE `dp0_editor_decision` (
  `iddp0_editor_decision` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`iddp0_editor_decision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_editor_decision
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_file_type
-- ----------------------------
DROP TABLE IF EXISTS `dp0_file_type`;
CREATE TABLE `dp0_file_type` (
  `iddp0_file_type` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddp0_file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_file_type
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_letter_description
-- ----------------------------
DROP TABLE IF EXISTS `dp0_letter_description`;
CREATE TABLE `dp0_letter_description` (
  `iddp0_letter_description` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `iddp0_letter_types` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iddp0_letter_description`),
  KEY `iddp0_letter_types` (`iddp0_letter_types`) USING BTREE,
  CONSTRAINT `dp0_letter_description_ibfk_1` FOREIGN KEY (`iddp0_letter_types`) REFERENCES `dp0_letter_types` (`iddp0_letter_types`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_letter_description
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_letter_types
-- ----------------------------
DROP TABLE IF EXISTS `dp0_letter_types`;
CREATE TABLE `dp0_letter_types` (
  `iddp0_letter_types` tinyint(4) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddp0_letter_types`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_letter_types
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_recommendation_type
-- ----------------------------
DROP TABLE IF EXISTS `dp0_recommendation_type`;
CREATE TABLE `dp0_recommendation_type` (
  `iddp0_recommendation_type` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`iddp0_recommendation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_recommendation_type
-- ----------------------------

-- ----------------------------
-- Table structure for dp0_roles
-- ----------------------------
DROP TABLE IF EXISTS `dp0_roles`;
CREATE TABLE `dp0_roles` (
  `iddp0_roles` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iddp0_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp0_roles
-- ----------------------------

-- ----------------------------
-- Table structure for dp1_classification
-- ----------------------------
DROP TABLE IF EXISTS `dp1_classification`;
CREATE TABLE `dp1_classification` (
  `iddp1_classification` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `iddp1_subject` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp1_classification`),
  KEY `iddp1_subject` (`iddp1_subject`) USING BTREE,
  CONSTRAINT `dp1_classification_ibfk_1` FOREIGN KEY (`iddp1_subject`) REFERENCES `dp1_subject` (`iddp1_subject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp1_classification
-- ----------------------------

-- ----------------------------
-- Table structure for dp1_journal
-- ----------------------------
DROP TABLE IF EXISTS `dp1_journal`;
CREATE TABLE `dp1_journal` (
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
  KEY `iddp1_organization` (`iddp1_organization`) USING BTREE,
  CONSTRAINT `dp1_journal_ibfk_3` FOREIGN KEY (`iddp1_organization`) REFERENCES `dp1_organization` (`iddp1_organization`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp1_journal_ibfk_4` FOREIGN KEY (`iddp1_subject`) REFERENCES `dp1_subject` (`iddp1_subject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp1_journal
-- ----------------------------

-- ----------------------------
-- Table structure for dp1_organization
-- ----------------------------
DROP TABLE IF EXISTS `dp1_organization`;
CREATE TABLE `dp1_organization` (
  `iddp1_organization` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iddp1_organization`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp1_organization
-- ----------------------------

-- ----------------------------
-- Table structure for dp1_subject
-- ----------------------------
DROP TABLE IF EXISTS `dp1_subject`;
CREATE TABLE `dp1_subject` (
  `iddp1_subject` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `iddp1_organization` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp1_subject`),
  KEY `dp1_subject_ibfk_1` (`iddp1_organization`) USING BTREE,
  CONSTRAINT `dp1_subject_ibfk_1` FOREIGN KEY (`iddp1_organization`) REFERENCES `dp1_organization` (`iddp1_organization`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp1_subject
-- ----------------------------

-- ----------------------------
-- Table structure for dp1_users
-- ----------------------------
DROP TABLE IF EXISTS `dp1_users`;
CREATE TABLE `dp1_users` (
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
  KEY `iddp3_profile` (`iddp3_profile`) USING BTREE,
  CONSTRAINT `dp1_users_ibfk_4` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp1_users
-- ----------------------------

-- ----------------------------
-- Table structure for dp2_subclassification
-- ----------------------------
DROP TABLE IF EXISTS `dp2_subclassification`;
CREATE TABLE `dp2_subclassification` (
  `iddp2_subclassification` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `iddp1_classification` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp2_subclassification`),
  KEY `iddp1_classification` (`iddp1_classification`) USING BTREE,
  CONSTRAINT `dp2_subclassification_ibfk_1` FOREIGN KEY (`iddp1_classification`) REFERENCES `dp1_classification` (`iddp1_classification`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp2_subclassification
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_address
-- ----------------------------
DROP TABLE IF EXISTS `dp3_address`;
CREATE TABLE `dp3_address` (
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
  KEY `iddp0_country` (`iddp0_country`) USING BTREE,
  CONSTRAINT `dp3_address_ibfk_3` FOREIGN KEY (`iddp0_country`) REFERENCES `dp0_country` (`iddp0_country`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp3_address_ibfk_4` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_address
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_article
-- ----------------------------
DROP TABLE IF EXISTS `dp3_article`;
CREATE TABLE `dp3_article` (
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
  KEY `iddp0_article_type` (`iddp0_article_type`) USING BTREE,
  CONSTRAINT `dp3_article_ibfk_3` FOREIGN KEY (`iddp0_article_type`) REFERENCES `dp0_article_type` (`iddp0_article_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp3_article_ibfk_4` FOREIGN KEY (`iddp1_journal`) REFERENCES `dp1_journal` (`iddp1_journal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_article
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_article_author
-- ----------------------------
DROP TABLE IF EXISTS `dp3_article_author`;
CREATE TABLE `dp3_article_author` (
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
  KEY `article_region` (`article_region`) USING BTREE,
  CONSTRAINT `dp3_article_author_ibfk_3` FOREIGN KEY (`iddp0_country`) REFERENCES `dp0_country` (`iddp0_country`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp3_article_author_ibfk_4` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_article_author
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_article_comments
-- ----------------------------
DROP TABLE IF EXISTS `dp3_article_comments`;
CREATE TABLE `dp3_article_comments` (
  `iddp3_article_comments` int(11) NOT NULL AUTO_INCREMENT,
  `comments` text,
  `iddp3_article` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_article_comments`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  CONSTRAINT `dp3_article_comments_ibfk_1` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_article_comments
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_article_pdf
-- ----------------------------
DROP TABLE IF EXISTS `dp3_article_pdf`;
CREATE TABLE `dp3_article_pdf` (
  `iddp3_article_pdf` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_article` int(11) DEFAULT NULL,
  `pdf_path` varchar(200) DEFAULT NULL,
  `pdf_name` varchar(200) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_article_pdf`),
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  CONSTRAINT `dp3_article_pdf_ibfk_1` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_article_pdf
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_article_uploades
-- ----------------------------
DROP TABLE IF EXISTS `dp3_article_uploades`;
CREATE TABLE `dp3_article_uploades` (
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
  KEY `iddp0_file_type` (`iddp0_file_type`) USING BTREE,
  CONSTRAINT `dp3_article_uploades_ibfk_3` FOREIGN KEY (`iddp0_file_type`) REFERENCES `dp0_file_type` (`iddp0_file_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp3_article_uploades_ibfk_4` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_article_uploades
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_people_notes
-- ----------------------------
DROP TABLE IF EXISTS `dp3_people_notes`;
CREATE TABLE `dp3_people_notes` (
  `iddp3_people_notes` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_profile` int(11) DEFAULT NULL,
  `people_notes` longtext,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_people_notes`),
  KEY `iddp3_profile` (`iddp3_profile`) USING BTREE,
  CONSTRAINT `dp3_people_notes_ibfk_1` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_people_notes
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_personal_keywords
-- ----------------------------
DROP TABLE IF EXISTS `dp3_personal_keywords`;
CREATE TABLE `dp3_personal_keywords` (
  `iddp3_personal_keywords` int(11) NOT NULL AUTO_INCREMENT,
  `iddp3_profile` int(11) DEFAULT NULL,
  `personal_keywords` longtext,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp3_personal_keywords`),
  KEY `iddp3_profile` (`iddp3_profile`) USING BTREE,
  CONSTRAINT `dp3_personal_keywords_ibfk_1` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_personal_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_profile
-- ----------------------------
DROP TABLE IF EXISTS `dp3_profile`;
CREATE TABLE `dp3_profile` (
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
  KEY `dp3_profile_ibfk_1` (`iddp1_subject`) USING BTREE,
  CONSTRAINT `dp3_profile_ibfk_1` FOREIGN KEY (`iddp1_subject`) REFERENCES `dp1_subject` (`iddp1_subject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_profile
-- ----------------------------

-- ----------------------------
-- Table structure for dp3_suggest_reviewer
-- ----------------------------
DROP TABLE IF EXISTS `dp3_suggest_reviewer`;
CREATE TABLE `dp3_suggest_reviewer` (
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
  KEY `iddp3_article` (`iddp3_article`) USING BTREE,
  CONSTRAINT `dp3_suggest_reviewer_ibfk_1` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp3_suggest_reviewer
-- ----------------------------

-- ----------------------------
-- Table structure for dp4_article_classification
-- ----------------------------
DROP TABLE IF EXISTS `dp4_article_classification`;
CREATE TABLE `dp4_article_classification` (
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
  KEY `iddp2_subclassification` (`iddp2_subclassification`) USING BTREE,
  CONSTRAINT `dp4_article_classification_ibfk_3` FOREIGN KEY (`iddp1_classification`) REFERENCES `dp1_classification` (`iddp1_classification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp4_article_classification_ibfk_4` FOREIGN KEY (`iddp2_subclassification`) REFERENCES `dp2_subclassification` (`iddp2_subclassification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp4_article_classification_ibfk_5` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp4_article_classification
-- ----------------------------

-- ----------------------------
-- Table structure for dp4_article_editor
-- ----------------------------
DROP TABLE IF EXISTS `dp4_article_editor`;
CREATE TABLE `dp4_article_editor` (
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
  KEY `iddp0_editor_decision` (`iddp0_editor_decision`),
  CONSTRAINT `dp4_article_editor_ibfk_2` FOREIGN KEY (`iddp0_editor_decision`) REFERENCES `dp0_editor_decision` (`iddp0_editor_decision`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp4_article_editor_ibfk_3` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp4_article_editor
-- ----------------------------

-- ----------------------------
-- Table structure for dp4_assign_reviewer
-- ----------------------------
DROP TABLE IF EXISTS `dp4_assign_reviewer`;
CREATE TABLE `dp4_assign_reviewer` (
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
  KEY `iddp4_article_editor` (`iddp4_article_editor`) USING BTREE,
  CONSTRAINT `dp4_assign_reviewer_ibfk_2` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp4_assign_reviewer_ibfk_3` FOREIGN KEY (`iddp4_article_editor`) REFERENCES `dp4_article_editor` (`iddp4_article_editor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp4_assign_reviewer
-- ----------------------------

-- ----------------------------
-- Table structure for dp4_expertise
-- ----------------------------
DROP TABLE IF EXISTS `dp4_expertise`;
CREATE TABLE `dp4_expertise` (
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
  KEY `iddp2_subclassification` (`iddp2_subclassification`) USING BTREE,
  CONSTRAINT `dp4_expertise_ibfk_3` FOREIGN KEY (`iddp1_classification`) REFERENCES `dp1_classification` (`iddp1_classification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp4_expertise_ibfk_4` FOREIGN KEY (`iddp2_subclassification`) REFERENCES `dp2_subclassification` (`iddp2_subclassification`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp4_expertise_ibfk_5` FOREIGN KEY (`iddp3_profile`) REFERENCES `dp3_profile` (`iddp3_profile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp4_expertise
-- ----------------------------

-- ----------------------------
-- Table structure for dp4_user_role
-- ----------------------------
DROP TABLE IF EXISTS `dp4_user_role`;
CREATE TABLE `dp4_user_role` (
  `iddp4_user_role` int(11) NOT NULL AUTO_INCREMENT,
  `iddp0_roles` int(11) DEFAULT NULL,
  `iddp1_users` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddp4_user_role`),
  KEY `iddp0_roles` (`iddp0_roles`),
  KEY `iddp1_users` (`iddp1_users`),
  CONSTRAINT `dp4_user_role_ibfk_1` FOREIGN KEY (`iddp0_roles`) REFERENCES `dp0_roles` (`iddp0_roles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp4_user_role_ibfk_2` FOREIGN KEY (`iddp1_users`) REFERENCES `dp1_users` (`iddp1_users`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp4_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for dp5_letter_description
-- ----------------------------
DROP TABLE IF EXISTS `dp5_letter_description`;
CREATE TABLE `dp5_letter_description` (
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
  KEY `iddp0_letter_types` (`iddp0_letter_types`) USING BTREE,
  CONSTRAINT `dp5_letter_description_ibfk_3` FOREIGN KEY (`iddp0_letter_types`) REFERENCES `dp0_letter_types` (`iddp0_letter_types`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp5_letter_description_ibfk_4` FOREIGN KEY (`iddp1_subject`) REFERENCES `dp1_subject` (`iddp1_subject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp5_letter_description
-- ----------------------------

-- ----------------------------
-- Table structure for dp5_login_history
-- ----------------------------
DROP TABLE IF EXISTS `dp5_login_history`;
CREATE TABLE `dp5_login_history` (
  `iddp5_login_history` int(11) NOT NULL AUTO_INCREMENT,
  `iddp1_users` int(11) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `client_ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`iddp5_login_history`),
  KEY `iddp1_users` (`iddp1_users`) USING BTREE,
  CONSTRAINT `dp5_login_history_ibfk_1` FOREIGN KEY (`iddp1_users`) REFERENCES `dp1_users` (`iddp1_users`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp5_login_history
-- ----------------------------

-- ----------------------------
-- Table structure for dp5_reviewer_comments
-- ----------------------------
DROP TABLE IF EXISTS `dp5_reviewer_comments`;
CREATE TABLE `dp5_reviewer_comments` (
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
  KEY `iddp0_recommendation_type` (`iddp0_recommendation_type`) USING BTREE,
  CONSTRAINT `dp5_reviewer_comments_ibfk_4` FOREIGN KEY (`iddp0_recommendation_type`) REFERENCES `dp0_recommendation_type` (`iddp0_recommendation_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp5_reviewer_comments_ibfk_5` FOREIGN KEY (`iddp3_article`) REFERENCES `dp3_article` (`iddp3_article`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dp5_reviewer_comments_ibfk_6` FOREIGN KEY (`iddp4_article_editor`) REFERENCES `dp4_article_editor` (`iddp4_article_editor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dp5_reviewer_comments
-- ----------------------------
