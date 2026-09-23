<?php

session_start();

require('./data/settings.php');

// get query string passed by mod_rewrite:
if(isset($_GET['qs'])) $qs = $_GET['qs'];
else
 {$qs = '';}
/* comment the following line if you DONOT want to have automatic mobile web */
if(isset($_GET['mobile'])) {$mobile=TRUE;} else {$mobile=FALSE;}
// check if requested page is cached and if so displays it:
if(empty($_POST) && file_exists(BASE_PATH.CACHE_DIR.'settings.php'))
 {
  include(BASE_PATH.CACHE_DIR.'settings.php');
  if(empty($_SESSION[$settings['session_prefix'].'user_id']))
   {
    if($qs=='') $cache_file = rawurlencode(strtolower($settings['index_page'])).'.cache';
    else $cache_file = rawurlencode(strtolower($qs)).'.cache';
    if(file_exists(BASE_PATH.CACHE_DIR.$cache_file))
     {
      include(BASE_PATH.CACHE_DIR.$cache_file);
      exit; // that's it if cached page is available.
     }
   }
 }

define('IN_INDEX', TRUE);

try
 {
  require(BASE_PATH.CMS.'includes/functions.inc.php');

  // load replacement functions for the multibyte string functions
  // if they are not available:
  if(!defined('MB_CASE_LOWER')) require(BASE_PATH.CMS.'includes/functions.mb_replacements.inc.php');

  require(BASE_PATH.CMS.'includes/classes/Database.class.php');
  $database = new Database(0,$db_settings);

  $settings = get_settings();

  // access permission check for not registered users:
  if($settings['check_access_permission']==1 && !isset($_SESSION[$settings['session_prefix'].'user_id']))
   {
    if(is_access_denied()) raise_error('403');
   }

  // set timezone:
  if($settings['time_zone']) date_default_timezone_set($settings['time_zone']);

  if($base_url =='') { 
    define('BASE_URL', get_base_url());
   } else { define('BASE_URL', $base_url);}

  define('WYSIWYG_EDITOR', 'cms/modules/tiny_mce/tiny_mce.js');

  if($settings['content_functions']==1) require(BASE_PATH.CMS.'includes/functions.content.inc.php');

  require(BASE_PATH.CMS.'includes/classes/Template.class.php');
  $template = new Template();

  if($settings['caching'])
   {
    $cache = new Cache(BASE_PATH.CACHE_DIR, $settings);
    if(!empty($_POST) || isset($_SESSION[$settings['session_prefix'].'user_id']))
     {
      $cache->doCaching = false;
     }
   }

  if(isset($_SESSION[$settings['session_prefix'].'user_id']))
   {
    $template->assign('admin', true);
   }
  else
   {
    $template->assign('admin', false);
   }

  $template->assign('settings', $settings);

  $template->assign('BASE_URL', BASE_URL);

  $qsp = explode(',',$qs);
  if($qsp[0] == '')
   {
    define('PAGE', strtolower($settings['index_page']));
   }
  else
   {
    define('PAGE',strtolower($qsp[0]));
   }

  // append comma separated parameters to $_GET ($_GET['get_1'], $_GET['get_2'] etc.):
  if(isset($qsp[1]))
   {
    $items = count($qsp);
    for($i=1;$i<$items;++$i)
     {
      $_GET['get_'.$i] = $qsp[$i];
     }
   }

  if(isset($_GET['get_1']) && $_GET['get_1']==IMAGE_IDENTIFIER && isset($_GET['get_2']))
   {
    // photo:
    include(BASE_PATH.CMS.'includes/photo.inc.php');
   }
  else
   {
    // regular content:
    include(BASE_PATH.CMS.'includes/content.inc.php');
   }
  // comment the following line if you DONOT want to have automatic mobile web
if($mobile && $settings['mobile']=="1") $template_file=isset($template_mobile_file)?$template_mobile_file:$template_file;

  // display template:
  if(isset($template_file))
   {
    $template->assign('lang', Localization::$lang);
    $template->assign('content_type', $content_type);
    $template->assign('charset', Localization::$lang['charset']);
    header('Content-Type: '.$content_type.'; charset='.Localization::$lang['charset']);
    $template->display(BASE_PATH.'templates/'.$template_file);
    // create cache file:
    if(isset($cache))
     {
      if($cache->cacheId && $cache->doCaching)
       {
        $cache_content = $cache->createCacheContent($template->fetch(BASE_PATH.'templates/'.$template_file), $content_type, CHARSET);
        $cache->createChacheFile($cache_content);
       }
     }
   }
 } // end try
catch(Exception $exception)
 {
  include(BASE_PATH.CMS.'includes/exception.inc.php');
 }
?>
