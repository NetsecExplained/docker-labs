PRAGMA foreign_keys = false;

-- ----------------------------
--  Table structure for rite_comments
-- ----------------------------
DROP TABLE IF EXISTS "rite_comments";
CREATE TABLE "rite_comments" (id INTEGER PRIMARY KEY AUTOINCREMENT, type tinyint(4) NOT NULL default '0', comment_id int(11) NOT NULL default '0', time int(11) NOT NULL default '0', ip varchar(255) NOT NULL default '', name varchar(255) NOT NULL default '', email_hp varchar(255) NOT NULL default '', comment text NOT NULL);
INSERT INTO "main".sqlite_sequence (name, seq) VALUES ("rite_comments", '1');

PRAGMA foreign_keys = true;
