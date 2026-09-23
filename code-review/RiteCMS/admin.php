<?php
try
 {
  session_start();
  define('IN_INDEX', TRUE);
  require('./data/settings.php');
  $cms_include=BASE_PATH.CMS.'includes/';
  require($cms_include.'functions.inc.php');
  require($cms_include.'functions.admin.inc.php');
  if($base_url =='') { define('BASE_URL', get_base_url());}
  else { define('BASE_URL', $base_url);}

  // load replacement functions for the multibyte string functions
  // if they are not available:
  if(!defined('MB_CASE_LOWER')) require($cms_include.'functions.mb_replacements.inc.php');

  require($cms_include.'classes/Database.class.php');

  $database = new Database(1,$db_settings);

  $settings = get_settings();

  // access permission check for not registered users:
  if($settings['check_access_permission']==1 && !isset($_SESSION[$settings['session_prefix'].'user_id']))
   {
    if(is_access_denied()) raise_error('403');
   }

  define('WYSIWYG_EDITOR', 'cms/modules/tinymce/tinymce.min.js');

  if($settings['caching'])
   {
    $cache = new Cache(BASE_PATH.CACHE_DIR, $settings);
    if(empty($settings['admin_auto_clear_cache'])) $cache->autoClear=false;
   }

  if(isset($cache) && isset($_GET['clear_cache']) && isset($_SESSION[$settings['session_prefix'].'user_id']))
   {
    $cache->clear();
    header('Location: '.CMSHOME.'?msg=cache_cleared');
    exit;
   }

  // set timezone:
  if($settings['time_zone']) date_default_timezone_set($settings['time_zone']);
  $localization = new Localization(BASE_PATH.'cms/lang/'.$settings['admin_language_file']);
  define('CHARSET', Localization::$lang['charset']);

  require($cms_include.'classes/Template.class.php');
  $template = new Template();
  $template->assign('settings', $settings);
  // set local language settings:
  setlocale(LC_ALL, Localization::$lang['locale']);

  $mode = isset($_REQUEST['mode']) ? $_REQUEST['mode'] : 'admin_index';

  // go to login if not logged in:
  if(empty($_SESSION[$settings['session_prefix'].'user_id']))
   {
    $mode = 'login';
    $template->assign('admin',false);
   }
  else
   {
    $template->assign('admin',true);
    $template->assign('user_id', $_SESSION[$settings['session_prefix'].'user_id']);
    $template->assign('user_type', $_SESSION[$settings['session_prefix'].'user_type']);
   }

  // include required file for mode:


  switch($mode)
   {
    case 'login': include($cms_include.'login.inc.php'); break;
    case 'logout': include($cms_include.'login.inc.php'); break;
    case 'edit': include($cms_include.'edit.inc.php'); break;
    case 'pages': include($cms_include.'pages.inc.php'); break;
    case 'galleries': include($cms_include.'galleries.inc.php'); break;
    case 'gcb': include($cms_include.'gcb.inc.php'); break;
    case 'notes': include($cms_include.'notes.inc.php'); break;
    case 'comments': include($cms_include.'comments.inc.php'); break;
    case 'filemanager': include($cms_include.'filemanager.inc.php'); break;
    case 'spam_protection': include($cms_include.'spam_protection.inc.php'); break;
    case 'users': include($cms_include.'users.inc.php'); break;
    case 'settings': include($cms_include.'settings.inc.php'); break;
    case 'menus': include($cms_include.'menus.inc.php'); break;
    case 'image': include($cms_include.'insert_image.inc.php'); break;
    case 'thumbnail': include($cms_include.'insert_thumbnail.inc.php'); break;
    case 'ajaxprocess': include($cms_include.'ajaxprocess.inc.php'); break;
    case 'backup':include($cms_include.'backup.inc.php'); break;
    default: include($cms_include.'admin_index.inc.php');
   }

  $template->assign('mode',$mode);
  $template->assign('lang',Localization::$lang);

  header('Content-Type: text/html; charset='.Localization::$lang['charset']);
  if(empty($template_file))
   {
    $template_file = 'main.tpl';
   }

  $template->display(CMS.$template_file);
 } // end try

catch(Exception $exception)
 {
  include($cms_include.'exception.inc.php');
 }
?>
