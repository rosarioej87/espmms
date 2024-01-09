/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : laravel

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 07/01/2024 03:05:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int NULL DEFAULT NULL,
  `order` int NOT NULL,
  `name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `slug` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING HASH,
  INDEX `parent_id`(`parent_id` ASC) USING BTREE,
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, NULL, 1, 'Category 1', 'category-1', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338);
INSERT INTO `categories` VALUES (2, NULL, 1, 'Category 2', 'category-2', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338);

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_type_id` int NOT NULL,
  `field` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `display_name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `required` int NOT NULL,
  `browse` int NOT NULL,
  `read` int NOT NULL,
  `edit` int NOT NULL,
  `add` int NOT NULL,
  `delete` int NOT NULL,
  `details` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_type_id`(`data_type_id` ASC) USING BTREE,
  CONSTRAINT `data_rows_ibfk_1` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES (1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` VALUES (4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5);
INSERT INTO `data_rows` VALUES (6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6);
INSERT INTO `data_rows` VALUES (7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7);
INSERT INTO `data_rows` VALUES (8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8);
INSERT INTO `data_rows` VALUES (9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10);
INSERT INTO `data_rows` VALUES (10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11);
INSERT INTO `data_rows` VALUES (11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12);
INSERT INTO `data_rows` VALUES (12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9);
INSERT INTO `data_rows` VALUES (22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2);
INSERT INTO `data_rows` VALUES (24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3);
INSERT INTO `data_rows` VALUES (25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4);
INSERT INTO `data_rows` VALUES (26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5);
INSERT INTO `data_rows` VALUES (27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6);
INSERT INTO `data_rows` VALUES (28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7);
INSERT INTO `data_rows` VALUES (29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4);
INSERT INTO `data_rows` VALUES (33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6);
INSERT INTO `data_rows` VALUES (35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7);
INSERT INTO `data_rows` VALUES (36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8);
INSERT INTO `data_rows` VALUES (37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9);
INSERT INTO `data_rows` VALUES (38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10);
INSERT INTO `data_rows` VALUES (39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11);
INSERT INTO `data_rows` VALUES (40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12);
INSERT INTO `data_rows` VALUES (41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13);
INSERT INTO `data_rows` VALUES (42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14);
INSERT INTO `data_rows` VALUES (43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15);
INSERT INTO `data_rows` VALUES (44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2);
INSERT INTO `data_rows` VALUES (46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` VALUES (47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4);
INSERT INTO `data_rows` VALUES (48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6);
INSERT INTO `data_rows` VALUES (50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7);
INSERT INTO `data_rows` VALUES (51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8);
INSERT INTO `data_rows` VALUES (52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9);
INSERT INTO `data_rows` VALUES (53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10);
INSERT INTO `data_rows` VALUES (54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11);
INSERT INTO `data_rows` VALUES (55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12);

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `slug` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `display_name_singular` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `display_name_plural` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `icon` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `model_name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `generate_permissions` int NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  `server_side` int NOT NULL,
  `controller` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `policy_name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `details` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `data_types_name_unique`(`name`) USING HASH,
  UNIQUE INDEX `data_types_slug_unique`(`slug`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', '', 1, 0x323032342D30312D30362031373A34303A3337, 0x323032342D30312D30362031373A34303A3337, 0, 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', 'TCG\\Voyager\\Policies\\UserPolicy', NULL);
INSERT INTO `data_types` VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', '', 1, 0x323032342D30312D30362031373A34303A3337, 0x323032342D30312D30362031373A34303A3337, 0, '', NULL, NULL);
INSERT INTO `data_types` VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', '', 1, 0x323032342D30312D30362031373A34303A3337, 0x323032342D30312D30362031373A34303A3337, 0, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, NULL);
INSERT INTO `data_types` VALUES (4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', '', 1, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 0, '', NULL, NULL);
INSERT INTO `data_types` VALUES (5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', '', 1, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 0, '', 'TCG\\Voyager\\Policies\\PostPolicy', NULL);
INSERT INTO `data_types` VALUES (6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', '', 1, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 0, '', NULL, NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `connection` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `queue` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payload` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `exception` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `failed_at` longblob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NULL DEFAULT NULL,
  `title` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `url` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `target` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `icon_class` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `color` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `parent_id` int NULL DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  `route` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `parameters` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, 0x323032342D30312D30362031373A34303A3337, 0x323032342D30312D30362031373A34303A3337, 'voyager.dashboard', NULL);
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, 0x323032342D30312D30362031373A34303A3337, 0x323032342D30312D30362031373A34303A3337, 'voyager.media.index', NULL);
INSERT INTO `menu_items` VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, 0x323032342D30312D30362031373A34303A3337, 0x323032342D30312D30362031373A34303A3337, 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, NULL, NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'voyager.bread.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'voyager.settings.index', NULL);
INSERT INTO `menu_items` VALUES (11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'voyager.categories.index', NULL);
INSERT INTO `menu_items` VALUES (12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'voyager.posts.index', NULL);
INSERT INTO `menu_items` VALUES (13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339, 'voyager.pages.index', NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menus_name_unique`(`name`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'admin', 0x323032342D30312D30362031373A34303A3337, 0x323032342D30312D30362031373A34303A3337);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `migration` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (4, '2016_01_01_000000_add_voyager_user_fields', 1);
INSERT INTO `migrations` VALUES (5, '2016_01_01_000000_create_data_types_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_01_01_000000_create_pages_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_01_01_000000_create_posts_table', 1);
INSERT INTO `migrations` VALUES (8, '2016_02_15_204651_create_categories_table', 1);
INSERT INTO `migrations` VALUES (9, '2016_05_19_173453_create_menu_table', 1);
INSERT INTO `migrations` VALUES (10, '2016_10_21_190000_create_roles_table', 1);
INSERT INTO `migrations` VALUES (11, '2016_10_21_190000_create_settings_table', 1);
INSERT INTO `migrations` VALUES (12, '2016_11_30_135954_create_permission_table', 1);
INSERT INTO `migrations` VALUES (13, '2016_11_30_141208_create_permission_role_table', 1);
INSERT INTO `migrations` VALUES (14, '2016_12_26_201236_data_types__add__server_side', 1);
INSERT INTO `migrations` VALUES (15, '2017_01_13_000000_add_route_to_menu_items_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_01_14_005015_create_translations_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_03_06_000000_add_controller_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_04_11_000000_alter_post_nullable_fields_table', 1);
INSERT INTO `migrations` VALUES (20, '2017_04_21_000000_add_order_to_data_rows_table', 1);
INSERT INTO `migrations` VALUES (21, '2017_07_05_210000_add_policyname_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (22, '2017_08_05_000000_add_group_to_settings_table', 1);
INSERT INTO `migrations` VALUES (23, '2017_11_26_013050_add_user_role_relationship', 1);
INSERT INTO `migrations` VALUES (24, '2017_11_26_015000_create_user_roles_table', 1);
INSERT INTO `migrations` VALUES (25, '2018_03_11_000000_add_user_settings', 1);
INSERT INTO `migrations` VALUES (26, '2018_03_14_000000_add_details_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (27, '2018_03_16_000000_make_settings_value_nullable', 1);
INSERT INTO `migrations` VALUES (28, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (29, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (30, '2023_11_08_161221_create_sessions_table', 1);

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `excerpt` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `body` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `image` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `slug` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `meta_description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `meta_keywords` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `status` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pages_slug_unique`(`slug`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_permission_id_index`(`permission_id` ASC) USING BTREE,
  INDEX `permission_role_role_id_index`(`role_id` ASC) USING BTREE,
  CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (3, 1);
INSERT INTO `permission_role` VALUES (4, 1);
INSERT INTO `permission_role` VALUES (5, 1);
INSERT INTO `permission_role` VALUES (6, 1);
INSERT INTO `permission_role` VALUES (7, 1);
INSERT INTO `permission_role` VALUES (8, 1);
INSERT INTO `permission_role` VALUES (9, 1);
INSERT INTO `permission_role` VALUES (10, 1);
INSERT INTO `permission_role` VALUES (11, 1);
INSERT INTO `permission_role` VALUES (12, 1);
INSERT INTO `permission_role` VALUES (13, 1);
INSERT INTO `permission_role` VALUES (14, 1);
INSERT INTO `permission_role` VALUES (15, 1);
INSERT INTO `permission_role` VALUES (16, 1);
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (23, 1);
INSERT INTO `permission_role` VALUES (24, 1);
INSERT INTO `permission_role` VALUES (25, 1);
INSERT INTO `permission_role` VALUES (26, 1);
INSERT INTO `permission_role` VALUES (27, 1);
INSERT INTO `permission_role` VALUES (28, 1);
INSERT INTO `permission_role` VALUES (29, 1);
INSERT INTO `permission_role` VALUES (30, 1);
INSERT INTO `permission_role` VALUES (31, 1);
INSERT INTO `permission_role` VALUES (32, 1);
INSERT INTO `permission_role` VALUES (33, 1);
INSERT INTO `permission_role` VALUES (34, 1);
INSERT INTO `permission_role` VALUES (35, 1);
INSERT INTO `permission_role` VALUES (36, 1);
INSERT INTO `permission_role` VALUES (37, 1);
INSERT INTO `permission_role` VALUES (38, 1);
INSERT INTO `permission_role` VALUES (39, 1);
INSERT INTO `permission_role` VALUES (40, 1);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  `table_name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permissions_key_index`(`key`(3072) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'browse_admin', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, NULL);
INSERT INTO `permissions` VALUES (2, 'browse_bread', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, NULL);
INSERT INTO `permissions` VALUES (3, 'browse_database', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, NULL);
INSERT INTO `permissions` VALUES (4, 'browse_media', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, NULL);
INSERT INTO `permissions` VALUES (5, 'browse_compass', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, NULL);
INSERT INTO `permissions` VALUES (6, 'browse_menus', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'menus');
INSERT INTO `permissions` VALUES (7, 'read_menus', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'menus');
INSERT INTO `permissions` VALUES (8, 'edit_menus', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'menus');
INSERT INTO `permissions` VALUES (9, 'add_menus', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'menus');
INSERT INTO `permissions` VALUES (10, 'delete_menus', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'menus');
INSERT INTO `permissions` VALUES (11, 'browse_roles', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'roles');
INSERT INTO `permissions` VALUES (12, 'read_roles', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'roles');
INSERT INTO `permissions` VALUES (13, 'edit_roles', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'roles');
INSERT INTO `permissions` VALUES (14, 'add_roles', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'roles');
INSERT INTO `permissions` VALUES (15, 'delete_roles', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'roles');
INSERT INTO `permissions` VALUES (16, 'browse_users', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'users');
INSERT INTO `permissions` VALUES (17, 'read_users', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'users');
INSERT INTO `permissions` VALUES (18, 'edit_users', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'users');
INSERT INTO `permissions` VALUES (19, 'add_users', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'users');
INSERT INTO `permissions` VALUES (20, 'delete_users', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'users');
INSERT INTO `permissions` VALUES (21, 'browse_settings', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'settings');
INSERT INTO `permissions` VALUES (22, 'read_settings', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'settings');
INSERT INTO `permissions` VALUES (23, 'edit_settings', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'settings');
INSERT INTO `permissions` VALUES (24, 'add_settings', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'settings');
INSERT INTO `permissions` VALUES (25, 'delete_settings', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'settings');
INSERT INTO `permissions` VALUES (26, 'browse_categories', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'categories');
INSERT INTO `permissions` VALUES (27, 'read_categories', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'categories');
INSERT INTO `permissions` VALUES (28, 'edit_categories', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'categories');
INSERT INTO `permissions` VALUES (29, 'add_categories', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'categories');
INSERT INTO `permissions` VALUES (30, 'delete_categories', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'categories');
INSERT INTO `permissions` VALUES (31, 'browse_posts', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'posts');
INSERT INTO `permissions` VALUES (32, 'read_posts', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'posts');
INSERT INTO `permissions` VALUES (33, 'edit_posts', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'posts');
INSERT INTO `permissions` VALUES (34, 'add_posts', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'posts');
INSERT INTO `permissions` VALUES (35, 'delete_posts', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'posts');
INSERT INTO `permissions` VALUES (36, 'browse_pages', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339, 'pages');
INSERT INTO `permissions` VALUES (37, 'read_pages', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339, 'pages');
INSERT INTO `permissions` VALUES (38, 'edit_pages', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339, 'pages');
INSERT INTO `permissions` VALUES (39, 'add_pages', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339, 'pages');
INSERT INTO `permissions` VALUES (40, 'delete_pages', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339, 'pages');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int NULL DEFAULT NULL,
  `title` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `seo_title` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `body` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `slug` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `featured` longblob NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  `excerpt` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `meta_description` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `meta_keywords` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `posts_slug_unique`(`slug`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 0, NULL, 'Lorem Ipsum Post', NULL, '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'PUBLISHED', 0x30, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'This is the excerpt for the Lorem Ipsum Post', 'This is the meta description', 'keyword1, keyword2, keyword3');
INSERT INTO `posts` VALUES (2, 0, NULL, 'My Sample Post', NULL, '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'PUBLISHED', 0x30, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'This is the excerpt for the sample Post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3');
INSERT INTO `posts` VALUES (3, 0, NULL, 'Latest Post', NULL, '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'PUBLISHED', 0x30, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'This is the excerpt for the latest post', 'This is the meta description', 'keyword1, keyword2, keyword3');
INSERT INTO `posts` VALUES (4, 0, NULL, 'Yarr Post', NULL, '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'PUBLISHED', 0x30, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', 'this be a meta descript', 'keyword1, keyword2, keyword3');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `display_name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338);
INSERT INTO `roles` VALUES (2, 'user', 'Normal User', 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `display_name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `details` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `type` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `order` int NOT NULL,
  `group` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `value` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'site.title', 'Site Title', '', 'text', 1, 'Site', 'Site Title');
INSERT INTO `settings` VALUES (2, 'site.description', 'Site Description', '', 'text', 2, 'Site', 'Site Description');
INSERT INTO `settings` VALUES (3, 'site.logo', 'Site Logo', '', 'image', 3, 'Site', '');
INSERT INTO `settings` VALUES (4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', 'text', 4, 'Site', '');
INSERT INTO `settings` VALUES (5, 'admin.bg_image', 'Admin Background Image', '', 'image', 5, 'Admin', '');
INSERT INTO `settings` VALUES (6, 'admin.title', 'Admin Title', '', 'text', 1, 'Admin', 'Voyager');
INSERT INTO `settings` VALUES (7, 'admin.description', 'Admin Description', '', 'text', 2, 'Admin', 'Welcome to Voyager. The Missing Admin for Laravel');
INSERT INTO `settings` VALUES (8, 'admin.loader', 'Admin Loader', '', 'image', 3, 'Admin', '');
INSERT INTO `settings` VALUES (9, 'admin.icon_image', 'Admin Icon Image', '', 'image', 4, 'Admin', '');
INSERT INTO `settings` VALUES (10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', 'text', 1, 'Admin', '');

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sqlite_sequence`;
CREATE TABLE `sqlite_sequence`  (
  `name` longblob NULL,
  `seq` longblob NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO `sqlite_sequence` VALUES (0x6D6967726174696F6E73, 0x3330);
INSERT INTO `sqlite_sequence` VALUES (0x7065726D697373696F6E73, 0x3430);
INSERT INTO `sqlite_sequence` VALUES (0x706F737473, 0x34);
INSERT INTO `sqlite_sequence` VALUES (0x7573657273, 0x31);
INSERT INTO `sqlite_sequence` VALUES (0x73657474696E6773, 0x3130);
INSERT INTO `sqlite_sequence` VALUES (0x646174615F7479706573, 0x36);
INSERT INTO `sqlite_sequence` VALUES (0x646174615F726F7773, 0x3535);
INSERT INTO `sqlite_sequence` VALUES (0x6D656E7573, 0x31);
INSERT INTO `sqlite_sequence` VALUES (0x6D656E755F6974656D73, 0x3133);
INSERT INTO `sqlite_sequence` VALUES (0x726F6C6573, 0x32);
INSERT INTO `sqlite_sequence` VALUES (0x63617465676F72696573, 0x32);
INSERT INTO `sqlite_sequence` VALUES (0x7061676573, 0x31);
INSERT INTO `sqlite_sequence` VALUES (0x7472616E736C6174696F6E73, 0x3330);

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `table_name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `column_name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foreign_key` int NOT NULL,
  `locale` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `value` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translations_table_name_column_name_foreign_key_locale_unique`(`table_name`, `column_name`, `foreign_key`, `locale`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of translations
-- ----------------------------
INSERT INTO `translations` VALUES (1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (13, 'categories', 'slug', 1, 'pt', 'categoria-1', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (14, 'categories', 'name', 1, 'pt', 'Categoria 1', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (15, 'categories', 'slug', 2, 'pt', 'categoria-2', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (16, 'categories', 'name', 2, 'pt', 'Categoria 2', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (17, 'pages', 'title', 1, 'pt', 'Olá Mundo', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (18, 'pages', 'slug', 1, 'pt', 'ola-mundo', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (21, 'menu_items', 'title', 2, 'pt', 'Media', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (22, 'menu_items', 'title', 12, 'pt', 'Publicações', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (24, 'menu_items', 'title', 11, 'pt', 'Categorias', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (25, 'menu_items', 'title', 13, 'pt', 'Páginas', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (26, 'menu_items', 'title', 4, 'pt', 'Funções', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (28, 'menu_items', 'title', 6, 'pt', 'Menus', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (29, 'menu_items', 'title', 7, 'pt', 'Base de dados', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);
INSERT INTO `translations` VALUES (30, 'menu_items', 'title', 10, 'pt', 'Configurações', 0x323032342D30312D30362031373A34303A3339, 0x323032342D30312D30362031373A34303A3339);

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_role_id_index`(`role_id` ASC) USING BTREE,
  INDEX `user_roles_user_id_index`(`user_id` ASC) USING BTREE,
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email_verified_at` longblob NULL,
  `password` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `remember_token` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `current_team_id` int NULL DEFAULT NULL,
  `profile_photo_path` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_at` longblob NULL,
  `updated_at` longblob NULL,
  `two_factor_secret` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `two_factor_recovery_codes` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `two_factor_confirmed_at` longblob NULL,
  `avatar` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `role_id` int NULL DEFAULT NULL,
  `settings` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING HASH
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'SUperAdmin', 'admin@admin.com', NULL, '$2y$10$9UfPul6tfcGsPmmMe7MP3.YGhfRqAvWcz2dHhggrWPArgC1nBGvNO', 'NdpZEyEXWJbCNpfug9c18BFOi9mamxCzBh5ozKyJo6MpCFlPEPxIatqAvLgd', NULL, NULL, 0x323032342D30312D30362031373A34303A3338, 0x323032342D30312D30362031373A34303A3338, NULL, NULL, NULL, 'users/default.png', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
