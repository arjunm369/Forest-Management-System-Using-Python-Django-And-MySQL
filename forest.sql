-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 06:29 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forest`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add forest', 9, 'add_forest'),
(34, 'Can change forest', 9, 'change_forest'),
(35, 'Can delete forest', 9, 'delete_forest'),
(36, 'Can view forest', 9, 'view_forest'),
(37, 'Can add flora', 10, 'add_flora'),
(38, 'Can change flora', 10, 'change_flora'),
(39, 'Can delete flora', 10, 'delete_flora'),
(40, 'Can view flora', 10, 'view_flora'),
(41, 'Can add awareness_program', 11, 'add_awareness_program'),
(42, 'Can change awareness_program', 11, 'change_awareness_program'),
(43, 'Can delete awareness_program', 11, 'delete_awareness_program'),
(44, 'Can view awareness_program', 11, 'view_awareness_program'),
(45, 'Can add news', 12, 'add_news'),
(46, 'Can change news', 12, 'change_news'),
(47, 'Can delete news', 12, 'delete_news'),
(48, 'Can view news', 12, 'view_news'),
(49, 'Can add fauna', 13, 'add_fauna'),
(50, 'Can change fauna', 13, 'change_fauna'),
(51, 'Can delete fauna', 13, 'delete_fauna'),
(52, 'Can view fauna', 13, 'view_fauna'),
(53, 'Can add entrypass', 14, 'add_entrypass'),
(54, 'Can change entrypass', 14, 'change_entrypass'),
(55, 'Can delete entrypass', 14, 'delete_entrypass'),
(56, 'Can view entrypass', 14, 'view_entrypass'),
(57, 'Can add category', 15, 'add_category'),
(58, 'Can change category', 15, 'change_category'),
(59, 'Can delete category', 15, 'delete_category'),
(60, 'Can view category', 15, 'view_category'),
(61, 'Can add product', 16, 'add_product'),
(62, 'Can change product', 16, 'change_product'),
(63, 'Can delete product', 16, 'delete_product'),
(64, 'Can view product', 16, 'view_product'),
(65, 'Can add payment', 17, 'add_payment'),
(66, 'Can change payment', 17, 'change_payment'),
(67, 'Can delete payment', 17, 'delete_payment'),
(68, 'Can view payment', 17, 'view_payment'),
(69, 'Can add police', 18, 'add_police'),
(70, 'Can change police', 18, 'change_police'),
(71, 'Can delete police', 18, 'delete_police'),
(72, 'Can view police', 18, 'view_police');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department_awareness_program`
--

CREATE TABLE `department_awareness_program` (
  `programid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_awareness_program`
--

INSERT INTO `department_awareness_program` (`programid`, `title`, `cname`, `date`, `description`) VALUES
(1, 'non alcoholic society', 'leela', '2022-04-08', 'jhbxzcuvygfsovygkshcbkjhfbkvuygkhcbkfygvbkhfbcjhb,cjhbf,jvhbxjhcb jfdhbvzxjb'),
(2, 'women empowerment', 'sheeja', '2022-04-15', 'khsbflvhblekfjlnwer.lnvmkj'),
(4, 'hsbduvyghwoelfh', 'khsjbdfliuvhliekjfv', '2022-04-16', 'shdjlfvhgwleiyfvkhbsj,hmcnb'),
(5, 'hsbdkfjvhbwkefjhvb', 'khsbdkfvyhgwblifyvhb', '2022-04-16', 'hsbflvhgwleiufvjlkjsnc');

-- --------------------------------------------------------

--
-- Table structure for table `department_category`
--

CREATE TABLE `department_category` (
  `categoryid` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_category`
--

INSERT INTO `department_category` (`categoryid`, `category`) VALUES
(1, 'hbvhsbfv'),
(2, 'simple'),
(3, 'gbdfgbgvbgdfg'),
(6, 'xcvb fghnfxbfg'),
(7, 'xcv fgnvb xcghnh ');

-- --------------------------------------------------------

--
-- Table structure for table `department_entrypass`
--

CREATE TABLE `department_entrypass` (
  `entrypassid` int(11) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `status` varchar(30) NOT NULL,
  `forest_id` int(11) DEFAULT NULL,
  `userid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_entrypass`
--

INSERT INTO `department_entrypass` (`entrypassid`, `date`, `description`, `status`, `forest_id`, `userid_id`) VALUES
(1, '2022-04-30', 'hgasvdctgfwvidkucyhdsc', 'waiting', 5, 1),
(2, '2022-04-30', 'gsvdckugeifkuvyhjbsc', 'approved', 5, 1),
(3, '2022-05-13', 'gdvciyjtgsdvkcuhjecd', 'rejected', 2, 1),
(4, '2022-06-09', 'gsvkctgwekuyjchd', 'waiting', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department_fauna`
--

CREATE TABLE `department_fauna` (
  `faunaid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `habitat` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `forest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_fauna`
--

INSERT INTO `department_fauna` (`faunaid`, `name`, `category`, `habitat`, `description`, `photo`, `forest_id`) VALUES
(2, 'jhbdfkhvef', 'kjsbldviulwhjerk', 'kjsbdflviuuwerkv', 'kjsbdflviuhwgelbrivhb', 'images/attachment_64259490_h6iZ5D5.jpg', 2),
(3, 'onnumilla', 'nothing', 'simple', 'shbdkuyhgekbhjc', 'images/images.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `department_flora`
--

CREATE TABLE `department_flora` (
  `floraid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `botanical` varchar(100) NOT NULL,
  `habitat` varchar(100) NOT NULL,
  `vegetation` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `forest_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_flora`
--

INSERT INTO `department_flora` (`floraid`, `name`, `botanical`, `habitat`, `vegetation`, `description`, `photo`, `forest_id`) VALUES
(4, 'manu', 'hagskducyhgdskcb', 'simple', 'ntg', 'kjbwdeliyuhj2lrbk', 'images/logo1_EpOOxlQ.jpg', 5),
(6, 'jhsdfbvkuyhdjbv', 'khdsbkvjhfbv', 'hdbkvhjfbv', 'hsdbfkvyhjfbv', 'hjsbdkvyhlfbnvd', 'images/ABHI_9wSDMnT.jpg', 5),
(7, 'kjhblcivuhlseifuvj', 'kjhsdblfiuvhlifukvj', 'kjbsdlvhjblsfjkh', 'kjsbdlfvkjsbfv', 'hksdbflivuhgleiufkrjv', 'images/ABHI_XNTx9qY.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `department_forest`
--

CREATE TABLE `department_forest` (
  `forestid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `area` varchar(100) NOT NULL,
  `district` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `attraction` varchar(200) NOT NULL,
  `website` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_forest`
--

INSERT INTO `department_forest` (`forestid`, `name`, `area`, `district`, `location`, `attraction`, `website`) VALUES
(2, 'abhi', 'dfgbrthg', 'dvtgb', 'kollam', 'nature', 'dfgbnruyhn'),
(5, 'hjbscuyhvfbvd', 'unknown', 'hcbv ouyfbeliducj', 'kasbdckuygerobyuvbh', 'jshbckuheryuvgherliufjbnjk', 'jashdbvkcuhekrbuyvhbhjnsxc');

-- --------------------------------------------------------

--
-- Table structure for table `department_login`
--

CREATE TABLE `department_login` (
  `logid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_login`
--

INSERT INTO `department_login` (`logid`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin'),
(6, 'abhi', 'abhi2123', 'user'),
(7, 'department', 'ddepartment', 'department');

-- --------------------------------------------------------

--
-- Table structure for table `department_news`
--

CREATE TABLE `department_news` (
  `newsid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_news`
--

INSERT INTO `department_news` (`newsid`, `title`, `date`, `description`) VALUES
(5, 'smoking', '2022-04-28', 'for teenagers'),
(6, 'kjcbv lifjdbgnlj knv  fgbfg', '2022-04-21', 'sdfsthggfbsdfgbrtbs'),
(7, 'hello', '2022-04-01', 'fun'),
(8, 'traffic', '2022-04-27', 'vehicle owners');

-- --------------------------------------------------------

--
-- Table structure for table `department_payment`
--

CREATE TABLE `department_payment` (
  `paymentid` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` varchar(100) NOT NULL,
  `cardtype` varchar(100) NOT NULL,
  `cardno` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department_police`
--

CREATE TABLE `department_police` (
  `policeid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `idno` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contactno` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_police`
--

INSERT INTO `department_police` (`policeid`, `name`, `idno`, `designation`, `address`, `contactno`) VALUES
(1, 'abhilash s', '3456', 'ertgbdfbbdzf', 'elampalloor veedu,templae nagar 405\r\nsakthikulangara p.o', '08606092915'),
(2, 'santhosh sreedharan', '83746958', 'jhdsbkfjhvbsnv', 'kannappezhathu padinjattathil\r\nchavara p.o panmana', '09400149088'),
(4, 'abhi', '827364', 'pc', 'elampalloor', '9645610883');

-- --------------------------------------------------------

--
-- Table structure for table `department_product`
--

CREATE TABLE `department_product` (
  `productid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `uses` varchar(300) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_product`
--

INSERT INTO `department_product` (`productid`, `name`, `uses`, `quantity`, `price`, `image`, `category_id`) VALUES
(1, 'abhilash s', 'so many', '5kg', '100', 'images/logo1_ZvySw4D.jpg', 3),
(2, 'jhsdbcksyhjbvnd', 'hbdfkushgekiruhbv', 'hbdsfkuhgkseiryuhbfrv', 'hsdfkiluygerkyufh', 'images/logo.jpg', 3),
(4, 'hgvkghvb', 'gfkuyjghgkjh', 'jgfkvujghgk,yjh', 'thgfjthgfmgj', 'images/attachment_64259490_cfS0uqZ.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `department_user`
--

CREATE TABLE `department_user` (
  `userid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileno` varchar(50) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `login_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department_user`
--

INSERT INTO `department_user` (`userid`, `name`, `address`, `email`, `mobileno`, `profile`, `login_id`) VALUES
(1, 'Abhidharsh s s', 'elampalloor veedu,templae nagar 405sakthikulangara p.o', 'abhidharsh6@gmail.com', '8606092915', 'images/ABHI.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'department', 'awareness_program'),
(15, 'department', 'category'),
(14, 'department', 'entrypass'),
(13, 'department', 'fauna'),
(10, 'department', 'flora'),
(9, 'department', 'forest'),
(7, 'department', 'login'),
(12, 'department', 'news'),
(17, 'department', 'payment'),
(18, 'department', 'police'),
(16, 'department', 'product'),
(8, 'department', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-04-18 05:49:39.830299'),
(2, 'auth', '0001_initial', '2022-04-18 05:49:40.455152'),
(3, 'admin', '0001_initial', '2022-04-18 05:49:40.580123'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-04-18 05:49:40.595744'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-18 05:49:40.595744'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-04-18 05:49:40.658232'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-04-18 05:49:40.705093'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-04-18 05:49:40.751957'),
(9, 'auth', '0004_alter_user_username_opts', '2022-04-18 05:49:40.751957'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-04-18 05:49:40.783292'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-04-18 05:49:40.783292'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-18 05:49:40.798822'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-04-18 05:49:40.830065'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-18 05:49:40.923792'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-04-18 05:49:40.970661'),
(16, 'auth', '0011_update_proxy_permissions', '2022-04-18 05:49:40.986277'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-18 05:49:41.033146'),
(18, 'department', '0001_initial', '2022-04-18 05:49:41.048762'),
(19, 'sessions', '0001_initial', '2022-04-18 05:49:41.111248'),
(20, 'department', '0002_user', '2022-04-19 16:31:15.788301'),
(21, 'department', '0003_auto_20220419_2204', '2022-04-19 16:34:40.859701'),
(22, 'department', '0004_forest', '2022-04-21 10:00:19.844505'),
(23, 'department', '0005_flora', '2022-04-21 13:44:32.384011'),
(24, 'department', '0006_awareness_program_fauna_news', '2022-04-22 16:20:12.280053'),
(25, 'department', '0007_entrypass', '2022-04-23 09:54:30.169357'),
(26, 'department', '0008_auto_20220424_2206', '2022-04-24 16:37:00.704814'),
(27, 'department', '0009_product', '2022-04-25 16:25:29.772021'),
(28, 'department', '0010_payment', '2022-04-28 15:33:54.415483'),
(29, 'department', '0011_auto_20220430_1742', '2022-04-30 12:15:56.088573');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0hrjig7t30dxlha73fhhu3h20qgduzro', 'e30:1ngqJ8:vBm5CFn-1vaaKg1HOXxB08ZG0i40QdGdGZbYVh_qMLM', '2022-05-03 16:02:26.749484'),
('41q92anx5kv5orl1uwrlkecbs5wvs3l0', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1nh4tm:GbdQJ7x9GibINBpJFERcWk4Wxq8PP-tpuVZo4kz7d_k', '2022-05-04 07:37:14.014046'),
('5yptcx649qa06lz7dniymgv9bfv8aw9u', 'eyJ1c2VybmFtZSI6ImFiaGkiLCJyb2xlIjoidXNlciIsImlkIjo2fQ:1nkhmy:pLa_ToQd6Eag_jTRb58qyScAGO0J8zD6fCSevzyzRFw', '2022-05-14 07:45:12.362658'),
('802vb6p2msxspfxon6gx2kyljssal29w', 'eyJ1c2VybmFtZSI6ImFiaGkiLCJyb2xlIjoidXNlciIsImlkIjo2fQ:1nkJGG:Vf4KBR6o1gLlRYOmNP0s576ngnq6o-sPMSTX1_sEeA8', '2022-05-13 05:33:48.005620'),
('aw87fnojgo0ojxmi0zb6jidf6r1pxi6g', 'eyJ1c2VybmFtZSI6ImFiaGkiLCJyb2xlIjoidXNlciIsImlkIjo2fQ:1nk6Nj:leZiwIJ1q4ByY4KGikxTo_0Xy1YXm4QoC41YPcYSN8A', '2022-05-12 15:48:39.902924'),
('deny9dal4tbjmtl5lfzkr7a325h78tpk', 'e30:1nkmS1:KSbZWSX2GCFICIVU9AQJClNGA9FnDSQ1z8floClM06U', '2022-05-14 12:43:53.683255'),
('e38rbx4i5x8vqz9c5a3r4gkt7um1njwr', 'eyJ1c2VybmFtZSI6ImFiaGkiLCJyb2xlIjoidXNlciIsImlkIjo2fQ:1njMQq:SXdopJKvQeX4SDimzPk24nYqjOhVOe50KtBMfZ08jys', '2022-05-10 14:44:48.392402'),
('e8lvwx3y74t04oz7hblsguq756cq3am8', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1niCV7:bbSaXb6Em-8fIxVpFUzqJV7SKsHMNa09AatiyzQ7WWk', '2022-05-07 09:56:25.491122'),
('g0ah9r8ozfz0hxeawkydfznvfxj4pr9w', 'e30:1nhtud:se3I9ssmGe8rY-Rt653o2KYPt-mNyExnAA-3xTL9JKY', '2022-05-06 14:05:31.896169'),
('hrh24g4lbbiudjt40w2x3ggpnz5jtceq', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1niqj3:Uwnk1Y5czugPgupXm5k-bD-LZ5qNvq-GSFMiJNxVz4o', '2022-05-09 04:53:29.022627'),
('lc20svhkmke75u0lsw9kng8xswlgry6m', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1nif2R:FEqq-l1WCzburA6r3kInoB3hti4ASR_BQFZVOx-Mw_M', '2022-05-08 16:24:43.413809'),
('nopwl7jrdcec4g6n90yb1ja3vqfl3jn8', 'e30:1nhZD2:FE7BdNTtIyhh5Y5u5PQ1xoKFdqdAY6CWl9UFh5fld74', '2022-05-05 15:59:08.322070'),
('nqy4pkw5z8dkg0oywdt9lz88wdj4xxgc', '.eJyrViotTi3KS8xNVbJSSkzJzcxT0lEqys9B5mamKFkZ1gIAMM4NdQ:1nkpoU:S1Lmna2oWfn8wjOE0CPmiBQouWDqJ2Pvw_eW_SZ5sfE', '2022-05-14 16:19:18.550919'),
('nu5tdp2wopo7hb94u8s35amcopas9rs1', 'e30:1nkTYb:3Zm5AxW86Dbndii9SeMB3FSTX4rjsoYUQlaF358oT-M', '2022-05-13 16:33:25.390942'),
('w50qlzygj0h7jkgw734on6cv469ge5a1', 'e30:1nhoHr:1mhjnZ0Z8Wuso1fGUzzQPz9Y7cSoTcv7afK7H24cnlY', '2022-05-06 08:05:07.134860'),
('zltisi9lpkqtracqqgw0sj4ugeg60fp4', 'e30:1nj1nw:U6EHPt_wa3Nrz2-V0AioufZQID5kY_NjZSYlrl-e99o', '2022-05-09 16:43:16.426409');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `department_awareness_program`
--
ALTER TABLE `department_awareness_program`
  ADD PRIMARY KEY (`programid`);

--
-- Indexes for table `department_category`
--
ALTER TABLE `department_category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `department_entrypass`
--
ALTER TABLE `department_entrypass`
  ADD PRIMARY KEY (`entrypassid`),
  ADD KEY `department_entrypass_forest_id_2337e691_fk_departmen` (`forest_id`),
  ADD KEY `department_entrypass_userid_id_aab1dff9_fk_departmen` (`userid_id`);

--
-- Indexes for table `department_fauna`
--
ALTER TABLE `department_fauna`
  ADD PRIMARY KEY (`faunaid`),
  ADD KEY `department_fauna_forest_id_78c04641_fk_departmen` (`forest_id`);

--
-- Indexes for table `department_flora`
--
ALTER TABLE `department_flora`
  ADD PRIMARY KEY (`floraid`),
  ADD KEY `department_flora_forest_id_a140cce2_fk_departmen` (`forest_id`);

--
-- Indexes for table `department_forest`
--
ALTER TABLE `department_forest`
  ADD PRIMARY KEY (`forestid`);

--
-- Indexes for table `department_login`
--
ALTER TABLE `department_login`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `department_news`
--
ALTER TABLE `department_news`
  ADD PRIMARY KEY (`newsid`);

--
-- Indexes for table `department_payment`
--
ALTER TABLE `department_payment`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `department_payment_product_id_5aa31f30_fk_departmen` (`product_id`),
  ADD KEY `department_payment_user_id_54ec8f66_fk_department_user_userid` (`user_id`);

--
-- Indexes for table `department_police`
--
ALTER TABLE `department_police`
  ADD PRIMARY KEY (`policeid`);

--
-- Indexes for table `department_product`
--
ALTER TABLE `department_product`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `department_product_category_id_28b19173_fk_departmen` (`category_id`);

--
-- Indexes for table `department_user`
--
ALTER TABLE `department_user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `department_user_login_id_d2b56db3_fk_department_login_logid` (`login_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department_awareness_program`
--
ALTER TABLE `department_awareness_program`
  MODIFY `programid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department_category`
--
ALTER TABLE `department_category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department_entrypass`
--
ALTER TABLE `department_entrypass`
  MODIFY `entrypassid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department_fauna`
--
ALTER TABLE `department_fauna`
  MODIFY `faunaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department_flora`
--
ALTER TABLE `department_flora`
  MODIFY `floraid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department_forest`
--
ALTER TABLE `department_forest`
  MODIFY `forestid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `department_login`
--
ALTER TABLE `department_login`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department_news`
--
ALTER TABLE `department_news`
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `department_payment`
--
ALTER TABLE `department_payment`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department_police`
--
ALTER TABLE `department_police`
  MODIFY `policeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department_product`
--
ALTER TABLE `department_product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department_user`
--
ALTER TABLE `department_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `department_entrypass`
--
ALTER TABLE `department_entrypass`
  ADD CONSTRAINT `department_entrypass_forest_id_2337e691_fk_departmen` FOREIGN KEY (`forest_id`) REFERENCES `department_forest` (`forestid`),
  ADD CONSTRAINT `department_entrypass_userid_id_aab1dff9_fk_departmen` FOREIGN KEY (`userid_id`) REFERENCES `department_user` (`userid`);

--
-- Constraints for table `department_fauna`
--
ALTER TABLE `department_fauna`
  ADD CONSTRAINT `department_fauna_forest_id_78c04641_fk_departmen` FOREIGN KEY (`forest_id`) REFERENCES `department_forest` (`forestid`);

--
-- Constraints for table `department_flora`
--
ALTER TABLE `department_flora`
  ADD CONSTRAINT `department_flora_forest_id_a140cce2_fk_departmen` FOREIGN KEY (`forest_id`) REFERENCES `department_forest` (`forestid`);

--
-- Constraints for table `department_payment`
--
ALTER TABLE `department_payment`
  ADD CONSTRAINT `department_payment_product_id_5aa31f30_fk_departmen` FOREIGN KEY (`product_id`) REFERENCES `department_product` (`productid`),
  ADD CONSTRAINT `department_payment_user_id_54ec8f66_fk_department_user_userid` FOREIGN KEY (`user_id`) REFERENCES `department_user` (`userid`);

--
-- Constraints for table `department_product`
--
ALTER TABLE `department_product`
  ADD CONSTRAINT `department_product_category_id_28b19173_fk_departmen` FOREIGN KEY (`category_id`) REFERENCES `department_category` (`categoryid`);

--
-- Constraints for table `department_user`
--
ALTER TABLE `department_user`
  ADD CONSTRAINT `department_user_login_id_d2b56db3_fk_department_login_logid` FOREIGN KEY (`login_id`) REFERENCES `department_login` (`logid`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
