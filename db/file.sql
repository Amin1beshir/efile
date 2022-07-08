-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2022 at 12:31 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `file`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_actions_log`
--

CREATE TABLE `tbl_actions_log` (
  `id` int(11) NOT NULL,
  `action` int(2) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_user` text DEFAULT NULL,
  `affected_file` int(11) DEFAULT NULL,
  `affected_account` int(11) DEFAULT NULL,
  `affected_file_name` text DEFAULT NULL,
  `affected_account_name` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_actions_log`
--

INSERT INTO `tbl_actions_log` (`id`, `action`, `owner_id`, `owner_user`, `affected_file`, `affected_account`, `affected_file_name`, `affected_account_name`, `details`, `timestamp`) VALUES
(2, 1, 1, 'amin1', NULL, NULL, NULL, 'Amin Beshir', NULL, '2022-06-18 21:12:50'),
(3, 5, 1, 'amin1', 1, NULL, 'pdf.pdf', 'amin1', NULL, '2022-06-18 21:14:51'),
(4, 32, 1, 'amin1', 1, NULL, 'pdf.pdf', NULL, NULL, '2022-06-18 21:15:33'),
(5, 41, 1, 'amin1', 1, 1, 'report.pdf', NULL, NULL, '2022-06-18 21:16:16'),
(6, 7, 1, 'amin1', 1, 1, 'report.pdf', NULL, NULL, '2022-06-18 21:16:28'),
(7, 5, 1, 'amin1', 2, NULL, 'judah.PNG', 'amin1', NULL, '2022-06-18 21:16:58'),
(8, 32, 1, 'amin1', 2, NULL, 'judah.PNG', NULL, NULL, '2022-06-18 21:17:02'),
(9, 41, 1, 'amin1', 2, 1, 'judah.PNG', NULL, NULL, '2022-06-18 21:17:11'),
(10, 7, 1, 'amin1', 2, 1, 'judah.PNG', NULL, NULL, '2022-06-18 21:17:22'),
(11, 34, 1, 'amin1', NULL, 1, NULL, 'pdf', NULL, '2022-06-18 21:18:33'),
(12, 32, 1, 'amin1', 1, NULL, 'pdf.pdf', NULL, NULL, '2022-06-18 21:19:16'),
(13, 31, 1, 'amin1', NULL, NULL, NULL, 'Amin Beshir', NULL, '2022-06-18 21:20:33'),
(14, 1, 1, 'amin1', NULL, NULL, NULL, 'Amin Beshir', NULL, '2022-06-18 21:25:46'),
(15, 31, 1, 'amin1', NULL, NULL, NULL, 'Amin Beshir', NULL, '2022-06-18 21:40:26'),
(16, 1, 1, 'amin1', NULL, NULL, NULL, 'Amin Beshir', NULL, '2022-06-18 21:59:28'),
(17, 31, 1, 'amin1', NULL, NULL, NULL, 'Amin Beshir', NULL, '2022-06-18 22:04:29'),
(18, 1, 1, 'amin1', NULL, NULL, NULL, 'Amin Beshir', NULL, '2022-06-18 22:14:25'),
(29, 31, 1, 'amin1', NULL, NULL, NULL, 'Amin Beshir', NULL, '2022-06-18 22:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`id`, `name`, `parent`, `description`, `created_by`, `timestamp`) VALUES
(1, 'pdf', NULL, 'this are pdf files', 'amin1', '2022-06-18 21:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories_relations`
--

CREATE TABLE `tbl_categories_relations` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_categories_relations`
--

INSERT INTO `tbl_categories_relations` (`id`, `file_id`, `cat_id`, `timestamp`) VALUES
(1, 1, 1, '2022-06-18 21:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_downloads`
--

CREATE TABLE `tbl_downloads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_id` int(11) NOT NULL,
  `remote_ip` varchar(45) DEFAULT NULL,
  `remote_host` text DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_downloads`
--

INSERT INTO `tbl_downloads` (`id`, `user_id`, `file_id`, `remote_ip`, `remote_host`, `anonymous`, `timestamp`) VALUES
(1, 1, 1, '127.0.0.1', NULL, 0, '2022-06-18 21:16:28'),
(2, 1, 2, '127.0.0.1', NULL, 0, '2022-06-18 21:17:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_files`
--

CREATE TABLE `tbl_files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url` text NOT NULL,
  `original_url` text NOT NULL,
  `filename` text NOT NULL,
  `description` text DEFAULT NULL,
  `uploader` varchar(60) NOT NULL,
  `expires` int(1) NOT NULL DEFAULT 0,
  `expiry_date` timestamp NOT NULL DEFAULT '2023-01-01 00:00:00',
  `public_allow` int(1) NOT NULL DEFAULT 0,
  `public_token` varchar(32) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_files`
--

INSERT INTO `tbl_files` (`id`, `user_id`, `url`, `original_url`, `filename`, `description`, `uploader`, `expires`, `expiry_date`, `public_allow`, `public_token`, `timestamp`) VALUES
(1, 1, '1655586891-478f4465f827349d386a64f0ff186bb6d424f209-pdf.pdf', 'pdf.pdf', 'report.pdf', 'this is a report sent to mr x', 'amin1', 0, '2022-07-17 23:00:00', 0, 'yLTWoqo1AAIDFxiw8qH4rzvlEqNrO411', '2022-06-18 21:14:51'),
(2, 1, '1655587018-478f4465f827349d386a64f0ff186bb6d424f209-judah.PNG', 'judah.PNG', 'judah.PNG', '', 'amin1', 0, '2022-07-17 23:00:00', 0, 'Ip45n2AGnXlQUMuvhIk1DYpbONhbOjuy', '2022-06-18 21:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_files_relations`
--

CREATE TABLE `tbl_files_relations` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `hidden` int(1) NOT NULL,
  `download_count` int(16) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_folders`
--

CREATE TABLE `tbl_folders` (
  `id` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_groups`
--

CREATE TABLE `tbl_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `public_token` varchar(32) DEFAULT NULL,
  `created_by` varchar(32) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_members`
--

CREATE TABLE `tbl_members` (
  `id` int(11) NOT NULL,
  `added_by` varchar(32) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_members_requests`
--

CREATE TABLE `tbl_members_requests` (
  `id` int(11) NOT NULL,
  `requested_by` varchar(32) NOT NULL,
  `client_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `denied` int(1) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `upload_type` int(11) NOT NULL,
  `sent_status` int(2) NOT NULL,
  `times_failed` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_options`
--

CREATE TABLE `tbl_options` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_options`
--

INSERT INTO `tbl_options` (`id`, `name`, `value`) VALUES
(1, 'base_uri', 'http://localhost/file-sharing/'),
(2, 'max_thumbnail_width', '100'),
(3, 'max_thumbnail_height', '100'),
(4, 'thumbnails_folder', '../../assets/img/custom/thumbs/'),
(5, 'thumbnail_default_quality', '90'),
(6, 'max_logo_width', '300'),
(7, 'max_logo_height', '300'),
(8, 'this_install_title', 'File Sharing Management System'),
(9, 'selected_clients_template', 'default'),
(10, 'logo_thumbnails_folder', '/assets/img/custom/thumbs'),
(11, 'timezone', 'America/Argentina/Buenos_Aires'),
(12, 'timeformat', 'd/m/Y'),
(13, 'allowed_file_types', '7z,ace,ai,avi,bin,bmp,bz2,cdr,doc,docm,docx,eps,fla,flv,gif,gz,gzip,htm,html,iso,jpeg,jpg,mp3,mp4,mpg,odt,oog,ppt,pptx,pptm,pps,ppsx,pdf,png,psd,rar,rtf,tar,tif,tiff,tgz,txt,wav,xls,xlsm,xlsx,xz,zip'),
(14, 'logo_filename', NULL),
(15, 'admin_email_address', 'aminbeshir265@gmail.com'),
(16, 'clients_can_register', '0'),
(17, 'last_update', '1335'),
(18, 'mail_system_use', 'mail'),
(19, 'mail_smtp_host', ''),
(20, 'mail_smtp_port', ''),
(21, 'mail_smtp_user', ''),
(22, 'mail_smtp_pass', ''),
(23, 'mail_from_name', 'File Sharing Management System'),
(24, 'thumbnails_use_absolute', '0'),
(25, 'mail_copy_user_upload', ''),
(26, 'mail_copy_client_upload', ''),
(27, 'mail_copy_main_user', ''),
(28, 'mail_copy_addresses', ''),
(29, 'version_last_check', '18-06-2022'),
(30, 'version_new_found', '0'),
(31, 'version_new_number', ''),
(32, 'version_new_url', ''),
(33, 'version_new_chlog', ''),
(34, 'version_new_security', ''),
(35, 'version_new_features', ''),
(36, 'version_new_important', ''),
(37, 'clients_auto_approve', '0'),
(38, 'clients_auto_group', '0'),
(39, 'clients_can_upload', '1'),
(40, 'clients_can_set_expiration_date', '0'),
(41, 'email_new_file_by_user_customize', '0'),
(42, 'email_new_file_by_client_customize', '0'),
(43, 'email_new_client_by_user_customize', '0'),
(44, 'email_new_client_by_self_customize', '0'),
(45, 'email_new_user_customize', '0'),
(46, 'email_new_file_by_user_text', ''),
(47, 'email_new_file_by_client_text', ''),
(48, 'email_new_client_by_user_text', ''),
(49, 'email_new_client_by_self_text', ''),
(50, 'email_new_user_text', ''),
(51, 'email_header_footer_customize', '0'),
(52, 'email_header_text', ''),
(53, 'email_footer_text', ''),
(54, 'email_pass_reset_customize', '0'),
(55, 'email_pass_reset_text', ''),
(56, 'expired_files_hide', '1'),
(57, 'notifications_max_tries', '2'),
(58, 'notifications_max_days', '15'),
(59, 'file_types_limit_to', 'all'),
(60, 'pass_require_upper', '0'),
(61, 'pass_require_lower', '0'),
(62, 'pass_require_number', '0'),
(63, 'pass_require_special', '0'),
(64, 'mail_smtp_auth', 'none'),
(65, 'use_browser_lang', '0'),
(66, 'clients_can_delete_own_files', '0'),
(67, 'google_client_id', ''),
(68, 'google_client_secret', ''),
(69, 'google_signin_enabled', '0'),
(70, 'recaptcha_enabled', '0'),
(71, 'recaptcha_site_key', ''),
(72, 'recaptcha_secret_key', ''),
(73, 'clients_can_select_group', 'none'),
(74, 'files_descriptions_use_ckeditor', '0'),
(75, 'enable_landing_for_all_files', '0'),
(76, 'footer_custom_enable', '0'),
(77, 'footer_custom_content', ''),
(78, 'email_new_file_by_user_subject_customize', '0'),
(79, 'email_new_file_by_client_subject_customize', '0'),
(80, 'email_new_client_by_user_subject_customize', '0'),
(81, 'email_new_client_by_self_subject_customize', '0'),
(82, 'email_new_user_subject_customize', '0'),
(83, 'email_pass_reset_subject_customize', '0'),
(84, 'email_new_file_by_user_subject', ''),
(85, 'email_new_file_by_client_subject', ''),
(86, 'email_new_client_by_user_subject', ''),
(87, 'email_new_client_by_self_subject', ''),
(88, 'email_new_user_subject', ''),
(89, 'email_pass_reset_subject', ''),
(90, 'privacy_noindex_site', '0'),
(91, 'email_account_approve_subject_customize', '0'),
(92, 'email_account_deny_subject_customize', '0'),
(93, 'email_account_approve_customize', '0'),
(94, 'email_account_deny_customize', '0'),
(95, 'email_account_approve_subject', ''),
(96, 'email_account_deny_subject', ''),
(97, 'email_account_approve_text', ''),
(98, 'email_account_deny_text', ''),
(99, 'email_client_edited_subject_customize', '0'),
(100, 'email_client_edited_customize', '0'),
(101, 'email_client_edited_subject', ''),
(102, 'email_client_edited_text', ''),
(103, 'public_listing_page_enable', '0'),
(104, 'public_listing_logged_only', '0'),
(105, 'public_listing_show_all_files', '0'),
(106, 'public_listing_use_download_link', '0'),
(107, 'svg_show_as_thumbnail', '0'),
(108, 'pagination_results_per_page', '10'),
(109, 'section', 'branding'),
(110, 'MAX_FILE_SIZE', '1000000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_password_reset`
--

CREATE TABLE `tbl_password_reset` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(32) NOT NULL,
  `used` int(1) DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `user` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(60) NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `contact` text DEFAULT NULL,
  `created_by` varchar(60) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `account_requested` tinyint(1) NOT NULL DEFAULT 0,
  `account_denied` tinyint(1) NOT NULL DEFAULT 0,
  `max_file_size` int(20) NOT NULL DEFAULT 0,
  `can_upload_public` int(20) NOT NULL DEFAULT 0,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `user`, `password`, `name`, `email`, `level`, `address`, `phone`, `notify`, `contact`, `created_by`, `active`, `account_requested`, `account_denied`, `max_file_size`, `can_upload_public`, `timestamp`) VALUES
(1, 'amin1', '$2y$08$2G4lkoYVtIo5RfopxK39W.lyPZmfrpbo4u4Mf0ZNuTPK67OnfAXd2', 'Amin Beshir', 'aminbeshir265@gmail.com', 9, NULL, NULL, 0, NULL, NULL, 1, 0, 0, 0, 0, '2022-06-18 21:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_meta`
--

CREATE TABLE `tbl_user_meta` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_actions_log`
--
ALTER TABLE `tbl_actions_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `tbl_categories_relations`
--
ALTER TABLE `tbl_categories_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `tbl_downloads`
--
ALTER TABLE `tbl_downloads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `tbl_files`
--
ALTER TABLE `tbl_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_files_relations`
--
ALTER TABLE `tbl_files_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `folder_id` (`folder_id`);

--
-- Indexes for table `tbl_folders`
--
ALTER TABLE `tbl_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_members`
--
ALTER TABLE `tbl_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tbl_members_requests`
--
ALTER TABLE `tbl_members_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `tbl_options`
--
ALTER TABLE `tbl_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_password_reset`
--
ALTER TABLE `tbl_password_reset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_meta`
--
ALTER TABLE `tbl_user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_actions_log`
--
ALTER TABLE `tbl_actions_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_categories_relations`
--
ALTER TABLE `tbl_categories_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_downloads`
--
ALTER TABLE `tbl_downloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_files`
--
ALTER TABLE `tbl_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_files_relations`
--
ALTER TABLE `tbl_files_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_folders`
--
ALTER TABLE `tbl_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_members`
--
ALTER TABLE `tbl_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_members_requests`
--
ALTER TABLE `tbl_members_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_options`
--
ALTER TABLE `tbl_options`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `tbl_password_reset`
--
ALTER TABLE `tbl_password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_user_meta`
--
ALTER TABLE `tbl_user_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD CONSTRAINT `tbl_categories_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_categories_relations`
--
ALTER TABLE `tbl_categories_relations`
  ADD CONSTRAINT `tbl_categories_relations_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `tbl_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_categories_relations_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `tbl_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_downloads`
--
ALTER TABLE `tbl_downloads`
  ADD CONSTRAINT `tbl_downloads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_downloads_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `tbl_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_files`
--
ALTER TABLE `tbl_files`
  ADD CONSTRAINT `tbl_files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_files_relations`
--
ALTER TABLE `tbl_files_relations`
  ADD CONSTRAINT `tbl_files_relations_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `tbl_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_files_relations_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_files_relations_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_files_relations_ibfk_4` FOREIGN KEY (`folder_id`) REFERENCES `tbl_folders` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_folders`
--
ALTER TABLE `tbl_folders`
  ADD CONSTRAINT `tbl_folders_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `tbl_folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_folders_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_folders_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_members`
--
ALTER TABLE `tbl_members`
  ADD CONSTRAINT `tbl_members_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_members_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_members_requests`
--
ALTER TABLE `tbl_members_requests`
  ADD CONSTRAINT `tbl_members_requests_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_members_requests_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `tbl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD CONSTRAINT `tbl_notifications_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `tbl_files` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_notifications_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_password_reset`
--
ALTER TABLE `tbl_password_reset`
  ADD CONSTRAINT `tbl_password_reset_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user_meta`
--
ALTER TABLE `tbl_user_meta`
  ADD CONSTRAINT `tbl_user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
