/*
 Navicat Premium Data Transfer

 Source Server         : SQLite3
 Source Server Type    : SQLite
 Source Server Version : 3035005 (3.35.5)
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3035005 (3.35.5)
 File Encoding         : 65001

 Date: 07/01/2024 03:10:19
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS "categories";
CREATE TABLE "categories" (
  "id" integer NOT NULL,
  "parent_id" integer(11),
  "order" integer(11) NOT NULL,
  "name" text NOT NULL,
  "slug" text NOT NULL,
  "created_at" blob,
  "updated_at" blob,
  PRIMARY KEY ("id"),
  CONSTRAINT "categories_ibfk_1" FOREIGN KEY ("parent_id") REFERENCES "categories" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO "categories" VALUES (1, NULL, 1, 'Category 1', 'category-1', '2024-01-06 17:40:38', '2024-01-06 17:40:38');
INSERT INTO "categories" VALUES (2, NULL, 1, 'Category 2', 'category-2', '2024-01-06 17:40:38', '2024-01-06 17:40:38');

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS "data_rows";
CREATE TABLE "data_rows" (
  "id" integer NOT NULL,
  "data_type_id" integer(11) NOT NULL,
  "field" text NOT NULL,
  "type" text NOT NULL,
  "display_name" text NOT NULL,
  "required" integer(11) NOT NULL,
  "browse" integer(11) NOT NULL,
  "read" integer(11) NOT NULL,
  "edit" integer(11) NOT NULL,
  "add" integer(11) NOT NULL,
  "delete" integer(11) NOT NULL,
  "details" text,
  "order" integer(11) NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "data_rows_ibfk_1" FOREIGN KEY ("data_type_id") REFERENCES "data_types" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- ----------------------------
-- Records of data_rows
-- ----------------------------

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS "data_types";
CREATE TABLE "data_types" (
  "id" integer NOT NULL,
  "name" text NOT NULL,
  "slug" text NOT NULL,
  "display_name_singular" text NOT NULL,
  "display_name_plural" text NOT NULL,
  "icon" text,
  "model_name" text,
  "description" text,
  "generate_permissions" integer(11) NOT NULL,
  "created_at" blob,
  "updated_at" blob,
  "server_side" integer(11) NOT NULL,
  "controller" text,
  "policy_name" text,
  "details" text,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO "data_types" VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\Voyager\Models\User', '', 1, '2024-01-06 17:40:37', '2024-01-06 17:40:37', 0, 'TCG\Voyager\Http\Controllers\VoyagerUserController', 'TCG\Voyager\Policies\UserPolicy', NULL);
INSERT INTO "data_types" VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\Voyager\Models\Menu', '', 1, '2024-01-06 17:40:37', '2024-01-06 17:40:37', 0, '', NULL, NULL);
INSERT INTO "data_types" VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\Voyager\Models\Role', '', 1, '2024-01-06 17:40:37', '2024-01-06 17:40:37', 0, 'TCG\Voyager\Http\Controllers\VoyagerRoleController', NULL, NULL);
INSERT INTO "data_types" VALUES (4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\Voyager\Models\Category', '', 1, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 0, '', NULL, NULL);
INSERT INTO "data_types" VALUES (5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\Voyager\Models\Post', '', 1, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 0, '', 'TCG\Voyager\Policies\PostPolicy', NULL);
INSERT INTO "data_types" VALUES (6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\Voyager\Models\Page', '', 1, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 0, '', NULL, NULL);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "failed_jobs";
CREATE TABLE "failed_jobs" (
  "id" integer NOT NULL,
  "uuid" text NOT NULL,
  "connection" text NOT NULL,
  "queue" text NOT NULL,
  "payload" text NOT NULL,
  "exception" text NOT NULL,
  "failed_at" blob NOT NULL,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS "menu_items";
CREATE TABLE "menu_items" (
  "id" integer NOT NULL,
  "menu_id" integer(11),
  "title" text NOT NULL,
  "url" text NOT NULL,
  "target" text NOT NULL,
  "icon_class" text,
  "color" text,
  "parent_id" integer(11),
  "order" integer(11) NOT NULL,
  "created_at" blob,
  "updated_at" blob,
  "route" text,
  "parameters" text,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO "menu_items" VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2024-01-06 17:40:37', '2024-01-06 17:40:37', 'voyager.dashboard', NULL);
INSERT INTO "menu_items" VALUES (2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2024-01-06 17:40:37', '2024-01-06 17:40:37', 'voyager.media.index', NULL);
INSERT INTO "menu_items" VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2024-01-06 17:40:37', '2024-01-06 17:40:37', 'voyager.users.index', NULL);
INSERT INTO "menu_items" VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'voyager.roles.index', NULL);
INSERT INTO "menu_items" VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2024-01-06 17:40:38', '2024-01-06 17:40:38', NULL, NULL);
INSERT INTO "menu_items" VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, '5', 10, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'voyager.menus.index', NULL);
INSERT INTO "menu_items" VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, '5', 11, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'voyager.database.index', NULL);
INSERT INTO "menu_items" VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, '5', 12, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'voyager.compass.index', NULL);
INSERT INTO "menu_items" VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, '5', 13, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'voyager.bread.index', NULL);
INSERT INTO "menu_items" VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'voyager.settings.index', NULL);
INSERT INTO "menu_items" VALUES (11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'voyager.categories.index', NULL);
INSERT INTO "menu_items" VALUES (12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'voyager.posts.index', NULL);
INSERT INTO "menu_items" VALUES (13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2024-01-06 17:40:39', '2024-01-06 17:40:39', 'voyager.pages.index', NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS "menus";
CREATE TABLE "menus" (
  "id" integer NOT NULL,
  "name" text NOT NULL,
  "created_at" blob,
  "updated_at" blob,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO "menus" VALUES (1, 'admin', '2024-01-06 17:40:37', '2024-01-06 17:40:37');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "migrations";
CREATE TABLE "migrations" (
  "id" integer NOT NULL,
  "migration" text NOT NULL,
  "batch" integer(11) NOT NULL,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "migrations" VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO "migrations" VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO "migrations" VALUES (3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO "migrations" VALUES (4, '2016_01_01_000000_add_voyager_user_fields', 1);
INSERT INTO "migrations" VALUES (5, '2016_01_01_000000_create_data_types_table', 1);
INSERT INTO "migrations" VALUES (6, '2016_01_01_000000_create_pages_table', 1);
INSERT INTO "migrations" VALUES (7, '2016_01_01_000000_create_posts_table', 1);
INSERT INTO "migrations" VALUES (8, '2016_02_15_204651_create_categories_table', 1);
INSERT INTO "migrations" VALUES (9, '2016_05_19_173453_create_menu_table', 1);
INSERT INTO "migrations" VALUES (10, '2016_10_21_190000_create_roles_table', 1);
INSERT INTO "migrations" VALUES (11, '2016_10_21_190000_create_settings_table', 1);
INSERT INTO "migrations" VALUES (12, '2016_11_30_135954_create_permission_table', 1);
INSERT INTO "migrations" VALUES (13, '2016_11_30_141208_create_permission_role_table', 1);
INSERT INTO "migrations" VALUES (14, '2016_12_26_201236_data_types__add__server_side', 1);
INSERT INTO "migrations" VALUES (15, '2017_01_13_000000_add_route_to_menu_items_table', 1);
INSERT INTO "migrations" VALUES (16, '2017_01_14_005015_create_translations_table', 1);
INSERT INTO "migrations" VALUES (17, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1);
INSERT INTO "migrations" VALUES (18, '2017_03_06_000000_add_controller_to_data_types_table', 1);
INSERT INTO "migrations" VALUES (19, '2017_04_11_000000_alter_post_nullable_fields_table', 1);
INSERT INTO "migrations" VALUES (20, '2017_04_21_000000_add_order_to_data_rows_table', 1);
INSERT INTO "migrations" VALUES (21, '2017_07_05_210000_add_policyname_to_data_types_table', 1);
INSERT INTO "migrations" VALUES (22, '2017_08_05_000000_add_group_to_settings_table', 1);
INSERT INTO "migrations" VALUES (23, '2017_11_26_013050_add_user_role_relationship', 1);
INSERT INTO "migrations" VALUES (24, '2017_11_26_015000_create_user_roles_table', 1);
INSERT INTO "migrations" VALUES (25, '2018_03_11_000000_add_user_settings', 1);
INSERT INTO "migrations" VALUES (26, '2018_03_14_000000_add_details_to_data_types_table', 1);
INSERT INTO "migrations" VALUES (27, '2018_03_16_000000_make_settings_value_nullable', 1);
INSERT INTO "migrations" VALUES (28, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO "migrations" VALUES (29, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO "migrations" VALUES (30, '2023_11_08_161221_create_sessions_table', 1);

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS "pages";
CREATE TABLE "pages" (
  "id" integer NOT NULL,
  "author_id" integer(11) NOT NULL,
  "title" text NOT NULL,
  "excerpt" text,
  "body" text,
  "image" text,
  "slug" text NOT NULL,
  "meta_description" text,
  "meta_keywords" text,
  "status" text NOT NULL,
  "created_at" blob,
  "updated_at" blob,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO "pages" VALUES (1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>
<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2024-01-06 17:40:39', '2024-01-06 17:40:39');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS "password_resets";
CREATE TABLE "password_resets" (
  "email" varchar NOT NULL,
  "token" varchar NOT NULL,
  "created_at" datetime,
  PRIMARY KEY ("email")
);

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS "permission_role";
CREATE TABLE "permission_role" (
  "permission_id" integer(11) NOT NULL,
  "role_id" integer(11) NOT NULL,
  PRIMARY KEY ("permission_id", "role_id"),
  CONSTRAINT "permission_role_ibfk_1" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT "permission_role_ibfk_2" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of permission_role
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "permissions";
CREATE TABLE "permissions" (
  "id" integer NOT NULL,
  "key" text NOT NULL,
  "created_at" blob,
  "updated_at" blob,
  "table_name" text,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO "permissions" VALUES (1, 'browse_admin', '2024-01-06 17:40:38', '2024-01-06 17:40:38', NULL);
INSERT INTO "permissions" VALUES (2, 'browse_bread', '2024-01-06 17:40:38', '2024-01-06 17:40:38', NULL);
INSERT INTO "permissions" VALUES (3, 'browse_database', '2024-01-06 17:40:38', '2024-01-06 17:40:38', NULL);
INSERT INTO "permissions" VALUES (4, 'browse_media', '2024-01-06 17:40:38', '2024-01-06 17:40:38', NULL);
INSERT INTO "permissions" VALUES (5, 'browse_compass', '2024-01-06 17:40:38', '2024-01-06 17:40:38', NULL);
INSERT INTO "permissions" VALUES (6, 'browse_menus', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'menus');
INSERT INTO "permissions" VALUES (7, 'read_menus', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'menus');
INSERT INTO "permissions" VALUES (8, 'edit_menus', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'menus');
INSERT INTO "permissions" VALUES (9, 'add_menus', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'menus');
INSERT INTO "permissions" VALUES (10, 'delete_menus', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'menus');
INSERT INTO "permissions" VALUES (11, 'browse_roles', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'roles');
INSERT INTO "permissions" VALUES (12, 'read_roles', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'roles');
INSERT INTO "permissions" VALUES (13, 'edit_roles', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'roles');
INSERT INTO "permissions" VALUES (14, 'add_roles', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'roles');
INSERT INTO "permissions" VALUES (15, 'delete_roles', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'roles');
INSERT INTO "permissions" VALUES (16, 'browse_users', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'users');
INSERT INTO "permissions" VALUES (17, 'read_users', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'users');
INSERT INTO "permissions" VALUES (18, 'edit_users', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'users');
INSERT INTO "permissions" VALUES (19, 'add_users', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'users');
INSERT INTO "permissions" VALUES (20, 'delete_users', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'users');
INSERT INTO "permissions" VALUES (21, 'browse_settings', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'settings');
INSERT INTO "permissions" VALUES (22, 'read_settings', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'settings');
INSERT INTO "permissions" VALUES (23, 'edit_settings', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'settings');
INSERT INTO "permissions" VALUES (24, 'add_settings', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'settings');
INSERT INTO "permissions" VALUES (25, 'delete_settings', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'settings');
INSERT INTO "permissions" VALUES (26, 'browse_categories', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'categories');
INSERT INTO "permissions" VALUES (27, 'read_categories', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'categories');
INSERT INTO "permissions" VALUES (28, 'edit_categories', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'categories');
INSERT INTO "permissions" VALUES (29, 'add_categories', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'categories');
INSERT INTO "permissions" VALUES (30, 'delete_categories', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'categories');
INSERT INTO "permissions" VALUES (31, 'browse_posts', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'posts');
INSERT INTO "permissions" VALUES (32, 'read_posts', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'posts');
INSERT INTO "permissions" VALUES (33, 'edit_posts', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'posts');
INSERT INTO "permissions" VALUES (34, 'add_posts', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'posts');
INSERT INTO "permissions" VALUES (35, 'delete_posts', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'posts');
INSERT INTO "permissions" VALUES (36, 'browse_pages', '2024-01-06 17:40:39', '2024-01-06 17:40:39', 'pages');
INSERT INTO "permissions" VALUES (37, 'read_pages', '2024-01-06 17:40:39', '2024-01-06 17:40:39', 'pages');
INSERT INTO "permissions" VALUES (38, 'edit_pages', '2024-01-06 17:40:39', '2024-01-06 17:40:39', 'pages');
INSERT INTO "permissions" VALUES (39, 'add_pages', '2024-01-06 17:40:39', '2024-01-06 17:40:39', 'pages');
INSERT INTO "permissions" VALUES (40, 'delete_pages', '2024-01-06 17:40:39', '2024-01-06 17:40:39', 'pages');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS "personal_access_tokens";
CREATE TABLE "personal_access_tokens" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "tokenable_type" varchar NOT NULL,
  "tokenable_id" integer NOT NULL,
  "name" varchar NOT NULL,
  "token" varchar NOT NULL,
  "abilities" text,
  "last_used_at" datetime,
  "expires_at" datetime,
  "created_at" datetime,
  "updated_at" datetime
);

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS "posts";
CREATE TABLE "posts" (
  "id" integer NOT NULL,
  "author_id" integer(11) NOT NULL,
  "category_id" integer(11),
  "title" text NOT NULL,
  "seo_title" text,
  "body" text NOT NULL,
  "image" text,
  "slug" text NOT NULL,
  "status" text NOT NULL,
  "featured" blob NOT NULL,
  "created_at" blob,
  "updated_at" blob,
  "excerpt" text,
  "meta_description" text,
  "meta_keywords" text,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO "posts" VALUES (1, 0, NULL, 'Lorem Ipsum Post', NULL, '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'PUBLISHED', '0', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'This is the excerpt for the Lorem Ipsum Post', 'This is the meta description', 'keyword1, keyword2, keyword3');
INSERT INTO "posts" VALUES (2, 0, NULL, 'My Sample Post', NULL, '<p>This is the body for the sample post, which includes the body.</p>
                <h2>We can use all kinds of format!</h2>
                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'PUBLISHED', '0', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'This is the excerpt for the sample Post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3');
INSERT INTO "posts" VALUES (3, 0, NULL, 'Latest Post', NULL, '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'PUBLISHED', '0', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'This is the excerpt for the latest post', 'This is the meta description', 'keyword1, keyword2, keyword3');
INSERT INTO "posts" VALUES (4, 0, NULL, 'Yarr Post', NULL, '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>
<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>
<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'PUBLISHED', '0', '2024-01-06 17:40:38', '2024-01-06 17:40:38', 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', 'this be a meta descript', 'keyword1, keyword2, keyword3');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "roles";
CREATE TABLE "roles" (
  "id" integer NOT NULL,
  "name" text NOT NULL,
  "display_name" text NOT NULL,
  "created_at" blob,
  "updated_at" blob,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "roles" VALUES (1, 'admin', 'Administrator', '2024-01-06 17:40:38', '2024-01-06 17:40:38');
INSERT INTO "roles" VALUES (2, 'user', 'Normal User', '2024-01-06 17:40:38', '2024-01-06 17:40:38');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS "sessions";
CREATE TABLE "sessions" (
  "id" varchar NOT NULL,
  "user_id" integer,
  "ip_address" varchar,
  "user_agent" text,
  "payload" text NOT NULL,
  "last_activity" integer NOT NULL,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO "sessions" VALUES ('VK7gWq8EVBXwY67LbG4ruC8KpW0K6hsa6OHKye9N', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 OPR/105.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidzBNaWo1WHBnalBzRzVyWTZ6Z3VjZ2VEcmdtNXE3RThkalozVlZFWCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vdXNlcnMvMS9lZGl0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1704567677);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS "settings";
CREATE TABLE "settings" (
  "id" integer NOT NULL,
  "key" text NOT NULL,
  "display_name" text NOT NULL,
  "details" text,
  "type" text NOT NULL,
  "order" integer(11) NOT NULL,
  "group" text,
  "value" text,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO "settings" VALUES (1, 'site.title', 'Site Title', '', 'text', 1, 'Site', 'Site Title');
INSERT INTO "settings" VALUES (2, 'site.description', 'Site Description', '', 'text', 2, 'Site', 'Site Description');
INSERT INTO "settings" VALUES (3, 'site.logo', 'Site Logo', '', 'image', 3, 'Site', '');
INSERT INTO "settings" VALUES (4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', 'text', 4, 'Site', '');
INSERT INTO "settings" VALUES (5, 'admin.bg_image', 'Admin Background Image', '', 'image', 5, 'Admin', '');
INSERT INTO "settings" VALUES (6, 'admin.title', 'Admin Title', '', 'text', 1, 'Admin', 'Voyager');
INSERT INTO "settings" VALUES (7, 'admin.description', 'Admin Description', '', 'text', 2, 'Admin', 'Welcome to Voyager. The Missing Admin for Laravel');
INSERT INTO "settings" VALUES (8, 'admin.loader', 'Admin Loader', '', 'image', 3, 'Admin', '');
INSERT INTO "settings" VALUES (9, 'admin.icon_image', 'Admin Icon Image', '', 'image', 4, 'Admin', '');
INSERT INTO "settings" VALUES (10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', 'text', 1, 'Admin', '');

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name",
  "seq"
);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "sqlite_sequence" VALUES ('translations', 30);
INSERT INTO "sqlite_sequence" VALUES ('users', 1);

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS "translations";
CREATE TABLE "translations" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "table_name" varchar NOT NULL,
  "column_name" varchar NOT NULL,
  "foreign_key" integer NOT NULL,
  "locale" varchar NOT NULL,
  "value" text NOT NULL,
  "created_at" datetime,
  "updated_at" datetime
);

-- ----------------------------
-- Records of translations
-- ----------------------------
INSERT INTO "translations" VALUES (1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o''nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>
<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (21, 'menu_items', 'title', 2, 'pt', 'Media', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (26, 'menu_items', 'title', 4, 'pt', 'Funções', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (28, 'menu_items', 'title', 6, 'pt', 'Menus', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2024-01-06 17:40:39', '2024-01-06 17:40:39');
INSERT INTO "translations" VALUES (30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2024-01-06 17:40:39', '2024-01-06 17:40:39');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS "user_roles";
CREATE TABLE "user_roles" (
  "user_id" integer NOT NULL,
  "role_id" integer NOT NULL,
  PRIMARY KEY ("user_id", "role_id"),
  FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of user_roles
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" VARCHAR(255) NOT NULL COLLATE BINARY,
  "email" VARCHAR(255) NOT NULL COLLATE BINARY,
  "email_verified_at" DATETIME DEFAULT NULL,
  "password" VARCHAR(255) NOT NULL COLLATE BINARY,
  "remember_token" VARCHAR(255) DEFAULT NULL COLLATE BINARY,
  "current_team_id" INTEGER DEFAULT NULL,
  "profile_photo_path" VARCHAR(255) DEFAULT NULL COLLATE BINARY,
  "created_at" DATETIME DEFAULT NULL,
  "updated_at" DATETIME DEFAULT NULL,
  "two_factor_secret" CLOB DEFAULT NULL COLLATE BINARY,
  "two_factor_recovery_codes" CLOB DEFAULT NULL COLLATE BINARY,
  "two_factor_confirmed_at" DATETIME DEFAULT NULL,
  "avatar" VARCHAR(255) DEFAULT 'users/default.png' COLLATE BINARY,
  "role_id" BIGINT UNSIGNED DEFAULT NULL,
  "settings" text
);

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "users" VALUES (1, 'Admin', 'admin@admin.com', NULL, '$2y$10$9UfPul6tfcGsPmmMe7MP3.YGhfRqAvWcz2dHhggrWPArgC1nBGvNO', 'NdpZEyEXWJbCNpfug9c18BFOi9mamxCzBh5ozKyJo6MpCFlPEPxIatqAvLgd', NULL, NULL, '2024-01-06 17:40:38', '2024-01-06 17:40:38', NULL, NULL, NULL, 'users/default.png', 1, NULL);

-- ----------------------------
-- Indexes structure for table personal_access_tokens
-- ----------------------------
CREATE UNIQUE INDEX "personal_access_tokens_token_unique"
ON "personal_access_tokens" (
  "token" ASC
);
CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index"
ON "personal_access_tokens" (
  "tokenable_type" ASC,
  "tokenable_id" ASC
);

-- ----------------------------
-- Indexes structure for table sessions
-- ----------------------------
CREATE INDEX "sessions_last_activity_index"
ON "sessions" (
  "last_activity" ASC
);
CREATE INDEX "sessions_user_id_index"
ON "sessions" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for translations
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 30 WHERE name = 'translations';

-- ----------------------------
-- Indexes structure for table translations
-- ----------------------------
CREATE UNIQUE INDEX "translations_table_name_column_name_foreign_key_locale_unique"
ON "translations" (
  "table_name" ASC,
  "column_name" ASC,
  "foreign_key" ASC,
  "locale" ASC
);

-- ----------------------------
-- Indexes structure for table user_roles
-- ----------------------------
CREATE INDEX "user_roles_role_id_index"
ON "user_roles" (
  "role_id" ASC
);
CREATE INDEX "user_roles_user_id_index"
ON "user_roles" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for users
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'users';

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE UNIQUE INDEX "users_email_unique"
ON "users" (
  "email" ASC
);

PRAGMA foreign_keys = true;
