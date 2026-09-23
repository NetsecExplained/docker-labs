<?php
//basic settings
define('CMSHOME', 'admin.php');
define('AMPERSAND_REPLACEMENT', ':AMP:');
define('BASE_PATH',realpath(__DIR__ .'/..').'/'); //define the base_bath based on /data/settings.php. If you are the website is not on a root folder, define it accordingly. For example, if your website is on ./web/ where data is located at ./web/data, define base_path as realpath(_DIR_.'/..).'/r/'
define('CACHE_DIR', 'data/cache/');
define('CATEGORY_IDENTIFIER', 'tag_');
define('CMS', 'cms/');
define('DATA_DIR','data/');
define('IMAGE_IDENTIFIER', 'photo');
define('MEDIA_DIR', 'media/');
define('SMILIES_DIR', 'media/smilies/');
define('TOKEN_SALT', 'monkey');
define('VALID_URL_CHARACTERS', '/^[a-zA-Z0-9._\-\/]+$/');
$base_url='';

//database settings
$data_path=realpath(__DIR__ );
// SQLite:
$db_settings['type'] =                'sqlite';
$db_settings['db_content_file'] =     $data_path.'/content.db';
$db_settings['settings_table'] =      'rite_settings';
$db_settings['pages_table'] =         'rite_pages';
$db_settings['menu_table'] =          'rite_menus';
$db_settings['gcb_table'] =           'rite_gcb';
$db_settings['news_table'] =          'rite_news';
$db_settings['notes_table'] =         'rite_notes';
$db_settings['photo_table'] =         'rite_photos';
$db_settings['banlists_table'] =      'rite_banlists';

$db_settings['db_entry_file'] =       $data_path.'/entries.db';
$db_settings['comment_table'] =       'rite_comments';

$db_settings['db_userdata_file'] =    $data_path.'/userdata.db';
$db_settings['userdata_table'] =      'rite_userdata';

/*
// mySQL:
$db_settings['type'] =                'mysql';

$db_settings['host'] =                'localhost';
$db_settings['user'] =                '';
$db_settings['password'] =            '';
$db_settings['database'] =            'rite';

$db_settings['settings_table'] =      'rite_settings';
$db_settings['pages_table'] =         'rite_pages';
$db_settings['menu_table'] =          'rite_menus';
$db_settings['gcb_table'] =           'rite_gcb';
$db_settings['news_table'] =          'rite_news';
$db_settings['news_table'] =          'rite_news';
$db_settings['notes_table'] =         'rite_notes';
$db_settings['photo_table'] =         'rite_photos';
$db_settings['banlists_table'] =      'rite_banlists';
$db_settings['comment_table'] =       'rite_comments';
$db_settings['userdata_table'] =      'rite_userdata';
*/

?>
