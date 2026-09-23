PRAGMA foreign_keys = false;

-- ----------------------------
--  Table structure for rite_banlists
-- ----------------------------
DROP TABLE IF EXISTS "rite_banlists";
CREATE TABLE "rite_banlists" (name varchar(255) NOT NULL default '', list text NOT NULL);

-- ----------------------------
--  Records of rite_banlists
-- ----------------------------
BEGIN;
INSERT INTO "rite_banlists" VALUES ('user_agents', '');
INSERT INTO "rite_banlists" VALUES ('ips', '');
INSERT INTO "rite_banlists" VALUES ('words', '');
COMMIT;

-- ----------------------------
--  Table structure for rite_gcb
-- ----------------------------
DROP TABLE IF EXISTS "rite_gcb";
CREATE TABLE "rite_gcb" (id INTEGER PRIMARY KEY AUTOINCREMENT, title varchar(255) NOT NULL default '', content text NOT NULL, content_formatting tinyint(4) default '0');
INSERT INTO "main".sqlite_sequence (name, seq) VALUES ("rite_gcb", '3');

-- ----------------------------
--  Records of rite_gcb
-- ----------------------------
BEGIN;
INSERT INTO "rite_gcb" VALUES (2, 'Middle', 'Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, pa', 0);
COMMIT;

-- ----------------------------
--  Table structure for rite_menus
-- ----------------------------
DROP TABLE IF EXISTS "rite_menus";
CREATE TABLE "rite_menus" (
	 "id" INTEGER PRIMARY KEY AUTOINCREMENT,
	 "menu" varchar(255,0) NOT NULL DEFAULT '',
	 "sequence" int(11,0) NOT NULL DEFAULT '1',
	 "name" varchar(255,0) NOT NULL DEFAULT '',
	 "title" varchar(255,0) NOT NULL DEFAULT '',
	 "link" varchar(255,0) NOT NULL DEFAULT '',
	 "section" varchar(255,0) NOT NULL DEFAULT '',
	 "accesskey" varchar(255,0) NOT NULL DEFAULT '',
	 "submenu" varchar(255,0)
);
INSERT INTO "main".sqlite_sequence (name, seq) VALUES ("rite_menus", '8');

-- ----------------------------
--  Records of rite_menus
-- ----------------------------
BEGIN;
INSERT INTO "rite_menus" VALUES (1, 'main_menu', 1, 'home', 'home', '', 'home', 0, '');
INSERT INTO "rite_menus" VALUES (2, 'main_menu', 2, 'products', 'products', 'products', 'products', 'p', 'products');
INSERT INTO "rite_menus" VALUES (3, 'main_menu', 3, 'news', 'news', 'news', 'news', 'd', '');
INSERT INTO "rite_menus" VALUES (4, 'main_menu', 4, 'faq', 'faq', 'faq', 'faq', '', '');
INSERT INTO "rite_menus" VALUES (5, 'main_menu', 5, 'contact', 'contact', 'contact', 'contact', '', '');
INSERT INTO "rite_menus" VALUES (7, 'products', 1, 'customer service', 'customer service', 'customer_service', 'customer service', '', '');
INSERT INTO "rite_menus" VALUES (8, 'products', 2, 'reviews', 'reviews', 'reviews', 'reviews', '', '');
COMMIT;

-- ----------------------------
--  Table structure for rite_news
-- ----------------------------
DROP TABLE IF EXISTS "rite_news";
CREATE TABLE "rite_news" ("id" INTEGER PRIMARY KEY  NOT NULL , "page_id" INTEGER, "time" INTEGER, "title" VARCHAR NOT NULL , "teaser" TEXT, "text" TEXT, "text_formatting" INTEGER);

-- ----------------------------
--  Table structure for rite_notes
-- ----------------------------
DROP TABLE IF EXISTS "rite_notes";
CREATE TABLE "rite_notes" (id INTEGER PRIMARY KEY AUTOINCREMENT, note_section varchar(255) NOT NULL default '', sequence int(11) NOT NULL default '1', time int(11) NOT NULL default '0', title varchar(255) NOT NULL default '', text TEXT NOT NULL, text_formatting tinyint(4) default '0', link varchar(255) NOT NULL default '', "teaser" TEXT);
INSERT INTO "main".sqlite_sequence (name, seq) VALUES ("rite_notes", '4');

-- ----------------------------
--  Table structure for rite_pages
-- ----------------------------
DROP TABLE IF EXISTS "rite_pages";
CREATE TABLE "rite_pages" (
	 "id" INTEGER PRIMARY KEY AUTOINCREMENT,
	 "page" varchar(255,0) NOT NULL DEFAULT '',
	 "author" int(11,0) NOT NULL DEFAULT '0',
	 "type" varchar(255,0) NOT NULL DEFAULT '',
	 "type_addition" varchar(255,0) NOT NULL DEFAULT '',
	 "time" int(11,0) NOT NULL DEFAULT '0',
	 "display_time" tinyint(4,0) DEFAULT '0',
	 "last_modified" int(11,0) NOT NULL DEFAULT '0',
	 "last_modified_by" int(11,0) NOT NULL DEFAULT '0',
	 "title" varchar(255,0) NOT NULL DEFAULT '',
	 "page_title" varchar(255,0) NOT NULL DEFAULT '',
	 "description" varchar(255,0) NOT NULL DEFAULT '',
	 "keywords" varchar(255,0) NOT NULL DEFAULT '',
	 "page_info" varchar(255,0) NOT NULL DEFAULT '',
	 "language_file" varchar(255,0) NOT NULL DEFAULT '',
	 "breadcrumbs" varchar(255,0) NOT NULL DEFAULT '',
	 "sections" varchar(255,0) NOT NULL DEFAULT '',
	 "include_page" int(11,0) NOT NULL DEFAULT '0',
	 "include_order" int(11,0) NOT NULL DEFAULT '0',
	 "include_rss" int(11,0) NOT NULL DEFAULT '0',
	 "include_sitemap" int(11,0) NOT NULL DEFAULT '0',
	 "menu_1" varchar(255,0) NOT NULL DEFAULT '',
	 "menu_2" varchar(255,0) NOT NULL DEFAULT '',
	 "menu_3" varchar(255,0) NOT NULL DEFAULT '',
	 "gcb_1" int(11,0) NOT NULL DEFAULT '0',
	 "gcb_2" int(11,0) NOT NULL DEFAULT '0',
	 "gcb_3" int(11,0) NOT NULL DEFAULT '0',
	 "template" varchar(255,0) NOT NULL DEFAULT '',
	 "content_type" varchar(255,0) NOT NULL DEFAULT '',
	 "charset" varchar(255,0) NOT NULL DEFAULT '',
	 "headline" varchar(255,0) NOT NULL DEFAULT '',
	 "teaser_headline" varchar(255,0) NOT NULL DEFAULT '',
	 "teaser" TEXT,
	 "teaser_formatting" tinyint(4,0) DEFAULT '0',
	 "teaser_img" varchar(255,0) NOT NULL DEFAULT '',
	 "content" TEXT,
	 "content_formatting" tinyint(4,0) DEFAULT '0',
	 "sidebar_1" TEXT,
	 "sidebar_1_formatting" tinyint(4,0) DEFAULT '0',
	 "sidebar_2" TEXT,
	 "sidebar_2_formatting" tinyint(4,0) DEFAULT '0',
	 "sidebar_3" TEXT,
	 "sidebar_3_formatting" tinyint(4,0) DEFAULT '0',
	 "page_notes" TEXT,
	 "edit_permission" varchar(255,0) NOT NULL DEFAULT '',
	 "edit_permission_general" tinyint(4,0) DEFAULT '0',
	 "custom_values" varchar(255,0) NOT NULL DEFAULT '',
	 "status" tinyint(4,0) DEFAULT '2',
	 "views" int(11,0) NOT NULL DEFAULT '0',
	 "include_news" INTEGER DEFAULT 0,
	 "category" VARCHAR,
	 "inline_css" TEXT,
	 "template_mobile" VARCHAR(255,0)
);
INSERT INTO "main".sqlite_sequence (name, seq) VALUES ("rite_pages", '30');

-- ----------------------------
--  Records of rite_pages
-- ----------------------------
BEGIN;
INSERT INTO "rite_pages" VALUES (1, 'home', 1, 'default', '', 1612220400, 0, 1614713657, 1, 'home', '', '', '', '', '', '', 'home', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '<p>Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift.</p>', 0, '[function:slideshow(''"text1"::media/slide1.png||"text2"::media/slide2.png||"text3"::media/slide3.png||"text4"::media/slide4.png||"text5"::media/slide5.png'')]', 0, '', 0, '', 0, 'To create s slide show, just copy and past the following into Sidebar 1.
<div class="slideshow-container">
<div class="mySlides fade"><img src="media/slide1.png"><div class="text">Caption Text</div></div>
<div class="mySlides fade"><img src="media/slide2.png"><div class="text">Caption Two</div></div>
<div class="mySlides fade"><img src="media/slide3.png"><div class="text">Caption Three</div></div>
<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<div class="dots">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>', '', 0, '', 2, 11, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (2, 'about', 1, 'default', '', 1612220400, 0, 1612220400, 1, 'about', 'about', '', '', '', '', '', 'about', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', 'ABOUT US', '', '', 1, '', '
<h2>Our trademarks:</h2>
<p>Below is our logo. Please make sure you are buying the real Ocean Ivory.</p>
<p><strong>Red, standard logo:</strong></p>
<p><img src="../templates/images/logort100.png" alt="" /></p>
<p><strong>Black, for black and white environment:</strong></p>
<p><img src="../templates/images/logobt100.png" alt="" /></p>
<p><strong>Logo without the bird:</strong></p>
<p><img src="../templates/images/logotrt50.png" alt="" /></p>
<div style="background: #000; color: #fff; padding: 1em;">
<p>transparent logo:</p>
<p><img src="../templates/images/logowt100.png" alt="" /></p>
<p>transparent logo without bird:</p>
<p><img src="../templates/images/logotwt50.png" alt="" /></p>
</div>', 0, '', 0, '', 0, '', 0, '
<div class="content"><p>Whether you are web designer or developer, we need your help. We are currently looking for passionate team members join us. Please contact us today.</p></div>
</div>
', '', 0, '', 2, 0, 0, '', null, 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (3, 'search', 1, 'search', '', 1612220400, 0, 1613700724, 1, 'Search', '', '', '', '', '', '', '', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', 'Search', '', '', 1, '', '<p>Search within our website.</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 1, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (4, 'sitemap.xml', 1, 'sitemap', '', 1612220400, 0, 1612220400, 1, 'XML Sitemap', '', '', '', '', '', '', '', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '', 0, '', 0, '', 0, '', 0, '', '', 0, '', 1, 0, 0, null, null, 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (5, 404, 1, 'search', '', 1612220400, 0, 1612220400, 1, 'Not Found', '404 Not Found', '', '', '', '', '', '', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '<p><img src="../templates/images/404.png" alt="" /></p>
<p>In the meantime, please search within our site.</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 1, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (6, 'robots.txt', 1, 'default', '', 1612220400, 0, 1612220400, 1, 'robots.txt', '', '', '', '', '', '', '', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'plain.tpl', 'text/plain', '', '', '', '', 1, '', 'User-agent: *
Disallow:', 0, '', 0, '', 0, '', 0, '', '', 0, '', 1, 0, 0, null, null, 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (7, 'rss', 1, 'rss', '', 1612220400, 0, 1612220400, 1, 'RSS Feed', '', 'rss', '', '', '', '', '', '', 0, '', 4, 'main_menu', '', '', 0, 0, 0, 'rss.tpl', '', '', '', '', '', 1, '', '', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 0, '', '', null, 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (8, 'contact', 1, 'formmailer', 'none@ritecms.com', 1612220400, 0, 1612220400, 1, 'contact', '', '', '', '', '', '', 'contact', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '<p>Call us at (800) 888-8888 or email us below.</p>', 0, '', 0, '<img src="media/contact.jpg">', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (9, 'products', 1, 'overview', 'products', 1612220400, 0, 1612220400, 1, 'products', '', '', '', '', '', '', 'products', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '<p>(<a href="https://unsplash.com/photos/6LBBOwkPzyQ">P<em>hoto courtesy of Deanna Alys</em></a>)</p>', 0, '', 0, '<img src="media/deanna_alys.jpg">', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (10, 'faq', 1, 'default', '', 1612220400, 0, 1612220400, 1, 'faq', '', '', '', '', '', '', 'faq', 0, 0, 0, 4, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', 'Frequently Asked Questions', '', '', 1, '', '<p>(<em><a href="https://unsplash.com/photos/wn-KYaHwcis">Photo courtesy of Jesus Kiteque</a></em>)</p>
<h3>Who are you?</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
<h3>How to order?</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
<h3>Lorem ipsum?</h3>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
<p>&nbsp;</p>', 0, '', 0, '<img src="media/jesus_kiteque.jpg">', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (11, 'news', 1, 'news', 'news', 1612220400, 0, 1612220400, 1, 'news', '', '', '', '', '', '', 'news', 0, 0, 0, 4, 'main_menu', '', '', 2, 0, 0, 'default.tpl', '', '', 'NEWS', '', '', 1, '', '', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 1, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (18, 'reviews', 1, 'default', '', 1612220400, 0, 1612220400, 1, 'reviews', '', '', '', '', '', '', 'products', 0, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', 'Our customers said:', '', '', 1, '', '<p class="reviews">Research&amp;Development management model stealth value tail gamification niche launch freemium supply, incubator venture chain advisor hackathon buzz proposition direct effects, churn twitter ecosystem social testing on iPhone infographic canvas, metrics user scrum business-to-business design holy rockstar strategy mass. Development rockstar facebook metrics return sales traction tail canvas burn, stock stealth investment channels gen-z hanging vesting release twitter.</p>
<p class="reviewer">John Doe, 2020.11.1</p>
<p class="reviews">Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift.</p>
<p class="reviewer">John Smith, 2020.11.2</p>', 0, '', 0, '<img src="media/deanna_alys.jpg">', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (19, 'privacy_agreement_sample', 1, 'default', '', 1612220400, 0, 1614823108, 1, 'privacy', '', '', '', '', '', '', '', 0, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '<h2>privacy</h2>
<p>Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift.</p>
<p>&nbsp;</p>
<p>Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift</p>
<p>&nbsp;</p>
<p>Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 1, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (20, 'terms', 1, 'default', '', 1612220400, 0, 1613700796, 1, 'terms', '', '', '', '', '', '', '', 0, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '<h2>Terms &amp; conditions.</h2>
<p>Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift</p>
<p>&nbsp;</p>
<p>Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift</p>
<p>&nbsp;</p>
<p>Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (21, 'customer_service', 1, 'formmailer', 'none@ritecms.com', 1612220400, 0, 1612220400, 1, 'customer service', '', '', '', '', '', '', 'products', 0, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '<p>(<a href="https://unsplash.com/photos/GWe0dlVD9e0"><em>Photo courtesy of Benjamin Child</em></a>)</p>
<p>All products come with one year warranty.</p>
<p>For customer service, please call us at (888) 888-8888 or email us directly with the following form.</p>', 0, '', 0, '<img src="media/benjamin_child.jpg">', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (22, 'product_1', 1, 'default', '', 1612220400, 0, 1612220400, 1, 'product1', '', '', '', '', '', '1,9', '', 9, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', 'Great Product A', 'Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift.', 0, 'product_devin_avery_s.jpg', '<p><img src="../media/product_devin_avery.jpg" alt="" width="640" height="427" />Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift.</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (23, 'product_2', 1, 'default', '', 1612220400, 0, 1612220400, 1, 'product2', '', '', '', '', '', '1,9', '', 9, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', 'Great Product A', 'Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift.', 0, 'product_devin_avery_s.jpg', '<p><img src="media/product_devin_avery.jpg" alt="" width="640" height="427" />Iteration mailing testing a android sales beta curve marketing focus, crowdsource grail funding stock burn branding stealth paradigm business, buzz graphical hanging mover party financing tail validation termsheet, a/b value rockstar twitter partner iOS iPad startup. First backing period disruptive virality customer accelerator branding non-disclosure product, entrepreneur paradigm freemium niche a funding plan mass round, launch investment long chain market early management money burn model, party client direct traction experience validation research&amp;development bandwidth. Value churn focus direct niche pitch investor disruptive hanging adopters vesting long, termsheet bandwidth investment research&amp;development traction incubator on return buyer effects, interface virality lean prototype round equity partner paradigm beta shift.</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (24, 'news_happy-2021', 1, 'commentable_page', '', 1612220400, 0, 1614644423, 1, 'sample news', '', '', '', '', '', '1,11', 'news', 11, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', 'happy 2021', 'voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, '', '<p>Happy 2021</p>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (25, 'news_happy-2021-2', 1, 'default', '', 1612220400, 0, 1612220400, 1, 'sample news 2021-2,2', '', '', '', '', '', '1,11', 'news', 11, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', 'happy 2021 -2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 0, '', '<p>Happy 2021-2</p>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
INSERT INTO "rite_pages" VALUES (27, 'note1', 1, 'notes', 'tomorrow', 1612220400, 0, 1612220400, 1, 'note1', '', '', '', '', '', '', '', 0, 0, 0, 0, 'main_menu', '', '', 0, 0, 0, 'default.tpl', '', '', '', '', '', 1, '', '<p>note1</p>', 0, '', 0, '', 0, '', 0, '', '', 0, '', 2, 0, 0, '', '', 'mobile.tpl');
COMMIT;

-- ----------------------------
--  Table structure for rite_photos
-- ----------------------------
DROP TABLE IF EXISTS "rite_photos";
CREATE TABLE "rite_photos" (id INTEGER PRIMARY KEY AUTOINCREMENT, gallery varchar(255) NOT NULL default '', sequence int(11) NOT NULL default '1', photo_thumbnail varchar(255) NOT NULL default '', photo_normal varchar(255) NOT NULL default '', photo_large varchar(255) NOT NULL default '', photo_xlarge varchar(255) NOT NULL default '', width int(11) NOT NULL default '0', height int(11) NOT NULL default '0', large_width int(11) NOT NULL default '0', large_height int(11) NOT NULL default '0', title varchar(255) NOT NULL default '', subtitle varchar(255) NOT NULL default '', description TEXT NOT NULL, description_formatting tinyint(4) default '0', template varchar(255) NOT NULL default '', photos_per_row tinyint(4) NOT NULL default '4');
INSERT INTO "main".sqlite_sequence (name, seq) VALUES ("rite_photos", '1');

-- ----------------------------
--  Table structure for rite_settings
-- ----------------------------
DROP TABLE IF EXISTS "rite_settings";
CREATE TABLE "rite_settings" (name varchar(255) NOT NULL default '', value varchar(255) NOT NULL default '');

-- ----------------------------
--  Records of rite_settings
-- ----------------------------
BEGIN;
INSERT INTO "rite_settings" VALUES ('index_page', 'home');
INSERT INTO "rite_settings" VALUES ('error_page', 404);
INSERT INTO "rite_settings" VALUES ('comment_order', 1);
INSERT INTO "rite_settings" VALUES ('comments_per_page', 10);
INSERT INTO "rite_settings" VALUES ('default_page_language_file', 'English.lang.php');
INSERT INTO "rite_settings" VALUES ('website_title', 'RiteCMS 3.0 demo');
INSERT INTO "rite_settings" VALUES ('website_subtitle', '');
INSERT INTO "rite_settings" VALUES ('website_footnote_1', '&copy; RiteCMS 2021. All rights reserved.');
INSERT INTO "rite_settings" VALUES ('website_footnote_2', 'RiteCMS version v3.0');
INSERT INTO "rite_settings" VALUES ('news_per_page', 10);
INSERT INTO "rite_settings" VALUES ('email', 'noreply@ritecms.com');
INSERT INTO "rite_settings" VALUES ('comment_notification', 0);
INSERT INTO "rite_settings" VALUES ('comment_maxlength', 1000);
INSERT INTO "rite_settings" VALUES ('word_maxlength', 30);
INSERT INTO "rite_settings" VALUES ('name_maxlength', 50);
INSERT INTO "rite_settings" VALUES ('email_hp_maxlength', 100);
INSERT INTO "rite_settings" VALUES ('default_image_class', 'teaser');
INSERT INTO "rite_settings" VALUES ('default_thumbnail_class', 'teaser');
INSERT INTO "rite_settings" VALUES ('default_gallery_image_class', 'thumbnail');
INSERT INTO "rite_settings" VALUES ('image_classes', 'float-left, float-right, thumbnail');
INSERT INTO "rite_settings" VALUES ('photos_commentable', 0);
INSERT INTO "rite_settings" VALUES ('count_views', 1);
INSERT INTO "rite_settings" VALUES ('default_template', 'default.tpl');
INSERT INTO "rite_settings" VALUES ('default_photo_template', 'photo.tpl');
INSERT INTO "rite_settings" VALUES ('default_slideshow_template', 'slideshow.tpl');
INSERT INTO "rite_settings" VALUES ('location_maxlength', 50);
INSERT INTO "rite_settings" VALUES ('admin_entries_per_page', 20);
INSERT INTO "rite_settings" VALUES ('resize', 640);
INSERT INTO "rite_settings" VALUES ('resize_xy', 'x');
INSERT INTO "rite_settings" VALUES ('compression', 80);
INSERT INTO "rite_settings" VALUES ('session_prefix', 'RiteCMS_');
INSERT INTO "rite_settings" VALUES ('default_menu', 'main_menu');
INSERT INTO "rite_settings" VALUES ('smiley_directory', 'images/smilies');
INSERT INTO "rite_settings" VALUES ('comment_smilies', 1);
INSERT INTO "rite_settings" VALUES ('comment_auto_link', 1);
INSERT INTO "rite_settings" VALUES ('content_smilies', 0);
INSERT INTO "rite_settings" VALUES ('content_auto_link', 0);
INSERT INTO "rite_settings" VALUES ('default_description', 'RiteCMS');
INSERT INTO "rite_settings" VALUES ('default_keywords', 'RiteCMS');
INSERT INTO "rite_settings" VALUES ('akismet_key', '');
INSERT INTO "rite_settings" VALUES ('rss_maximum_items', 20);
INSERT INTO "rite_settings" VALUES ('search_results_per_page', 20);
INSERT INTO "rite_settings" VALUES ('counter_last_resetted', 1614822817);
INSERT INTO "rite_settings" VALUES ('notes_per_page', 10);
INSERT INTO "rite_settings" VALUES ('entries_show_email', 0);
INSERT INTO "rite_settings" VALUES ('mail_parameter', '');
INSERT INTO "rite_settings" VALUES ('default_photos_per_row', 3);
INSERT INTO "rite_settings" VALUES ('version', 3.0);
INSERT INTO "rite_settings" VALUES ('caching', 0);
INSERT INTO "rite_settings" VALUES ('breadcrumbs', 5);
INSERT INTO "rite_settings" VALUES ('slideshow', 0);
INSERT INTO "rite_settings" VALUES ('admin_language_file', 'English.admin.lang.php');
INSERT INTO "rite_settings" VALUES ('default_formatting', 0);
INSERT INTO "rite_settings" VALUES ('akismet_entry_check', 0);
INSERT INTO "rite_settings" VALUES ('akismet_mail_check', 0);
INSERT INTO "rite_settings" VALUES ('prevent_repeated_posts_minutes', 2);
INSERT INTO "rite_settings" VALUES ('comment_remove_blank_lines', 1);
INSERT INTO "rite_settings" VALUES ('admin_auto_clear_cache', 1);
INSERT INTO "rite_settings" VALUES ('check_access_permission', 0);
INSERT INTO "rite_settings" VALUES ('wysiwyg_editor', 1);
INSERT INTO "rite_settings" VALUES ('time_zone', 'America/New_York');
INSERT INTO "rite_settings" VALUES ('simple_news_per_page', 10);
INSERT INTO "rite_settings" VALUES ('global_content_blocks', 1);
INSERT INTO "rite_settings" VALUES ('include_news_items', 8);
INSERT INTO "rite_settings" VALUES ('content_functions', 1);
INSERT INTO "rite_settings" VALUES ('rss_feed', 'rss');
INSERT INTO "rite_settings" VALUES ('email_subject_maxlength', 100);
INSERT INTO "rite_settings" VALUES ('email_text_maxlength', 10000);
INSERT INTO "rite_settings" VALUES ('enable_fullfeeds', 1);
INSERT INTO "rite_settings" VALUES ('pingback_title_maxlength', 60);
INSERT INTO "rite_settings" VALUES ('pingbacks_enabled', 0);
INSERT INTO "rite_settings" VALUES ('lightbox_enabled', 0);
INSERT INTO "rite_settings" VALUES ('thumbnail_compression', 70);
INSERT INTO "rite_settings" VALUES ('thumbnail_postfix', '_tb');
INSERT INTO "rite_settings" VALUES ('thumbnail_prefix', '');
INSERT INTO "rite_settings" VALUES ('thumbnail_resize', 150);
INSERT INTO "rite_settings" VALUES ('thumbnail_resize_xy', 'x');
INSERT INTO "rite_settings" VALUES ('admin_articles_per_page', 20);
INSERT INTO "rite_settings" VALUES ('mobile', 1);
INSERT INTO "rite_settings" VALUES ('website_footnote_3', ' <a href="http://ritecms.com"><img src="templates/images/ritecms-powered.png"></a>');
INSERT INTO "rite_settings" VALUES ('sidebars_all', 1);
INSERT INTO "rite_settings" VALUES ('recaptcha', 0);
INSERT INTO "rite_settings" VALUES ('recaptcha_entry_check', 0);
INSERT INTO "rite_settings" VALUES ('recaptcha_key_public', '');
INSERT INTO "rite_settings" VALUES ('recaptcha_key_private', '');
INSERT INTO "rite_settings" VALUES ('recaptcha_mail_check', 0);
INSERT INTO "rite_settings" VALUES ('recaptcha_comment_check', 0);
INSERT INTO "rite_settings" VALUES ('token_salt', 'monkey2021');
INSERT INTO "rite_settings" VALUES ('powered_by', 'RiteCMS');
INSERT INTO "rite_settings" VALUES ('website_top_1', '<a href="/.m">mobile web</a>');
INSERT INTO "rite_settings" VALUES ('website_top_1', '<a href="/.m">mobile web</a>');
INSERT INTO "rite_settings" VALUES ('website_top_2', '<a href="./">main website.</a>');
INSERT INTO "rite_settings" VALUES ('website_topnav_1', '');
INSERT INTO "rite_settings" VALUES ('website_topnav_2', '');
INSERT INTO "rite_settings" VALUES ('default_template_mobile', 'mobile.tpl');
INSERT INTO "rite_settings" VALUES ('securimage', 1);
INSERT INTO "rite_settings" VALUES ('securimage_inc', 'cms/modules/securimage/');
INSERT INTO "rite_settings" VALUES ('securimage_comments', 1);
COMMIT;

PRAGMA foreign_keys = true;
