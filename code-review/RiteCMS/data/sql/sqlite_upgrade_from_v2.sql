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

BEGIN TRANSACTION;
insert into 'rite_settings' (name,value) VALUES ('default_template_mobile','mobile.tpl');
insert into 'rite_settings' (name,value) VALUES ('securimage','1');
insert into 'rite_settings' (name,value) VALUES ('securimage_comments','1');
insert into 'rite_settings' (name,value) VALUES ('securimage_inc','cms/modules/securimage/');
insert into 'rite_settings' (name,value) VALUES ('powered_by','RiteCMS');
insert into 'rite_settings' (name,value) VALUES ('website_top_1','');
insert into 'rite_settings' (name,value) VALUES ('website_top_2','');
insert into 'rite_settings' (name,value) VALUES ('website_topnav_1','');
insert into 'rite_settings' (name,value) VALUES ('website_topnav_2','');
insert into 'rite_settings' (name,value) VALUES ('default_as_blog','');
insert into 'rite_settings' (name,value) VALUES ('default_as_blog_words','30');
insert into 'rite_pages' (page,author,type,type_addition) VALUES ('a',1,'redirect','admin.php');
delete from 'rite_settings' where name LIKE '%base_%';
delete from 'rite_settings' where name='psc_version';

COMMIT;

PRAGMA foreign_keys = true;
