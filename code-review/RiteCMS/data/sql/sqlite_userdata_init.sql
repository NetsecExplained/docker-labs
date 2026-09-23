/*
 Navicat Premium Data Transfer

 Source Server         : ritedev_user
 Source Server Type    : SQLite
 Source Server Version : 3012001
 Source Database       : main

 Target Server Type    : SQLite
 Target Server Version : 3012001
 File Encoding         : utf-8

 Date: 03/03/2021 22:01:05 PM
*/

PRAGMA foreign_keys = false;

-- ----------------------------
--  Table structure for rite_userdata
-- ----------------------------
DROP TABLE IF EXISTS "rite_userdata";
CREATE TABLE rite_userdata (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(255) NOT NULL default '', type tinyint(4) NOT NULL default '0', pw varchar(255) NOT NULL default '', last_login int(11) NOT NULL default '0', wysiwyg tinyint(4) NOT NULL default '0');
INSERT INTO "main".sqlite_sequence (name, seq) VALUES ("rite_userdata", '2');

-- ----------------------------
--  Records of rite_userdata
-- ----------------------------
BEGIN;
INSERT INTO "rite_userdata" VALUES (1, 'admin', 1, '3e250c2bfd46362687d3a871c12b50c7d558904b65860c1bf5', 1614826028, 1);
COMMIT;

PRAGMA foreign_keys = true;
