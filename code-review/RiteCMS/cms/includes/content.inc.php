<?php
if(!defined('IN_INDEX')) exit;

// menus:
$template->assign('menus', get_menus());

// global content blocks:
if($settings['global_content_blocks']) $template->assign('gcb', get_global_content_blocks());

// content:
if(empty($data)) // might already be set if error page was loaded
 {
  if($data=get_content(PAGE))
   {
    // count views:
    if($settings['count_views']==1)
     {
      $dbr = Database::$content->prepare("UPDATE ".Database::$db_settings['pages_table']." SET views=views+1 WHERE id=:id");
      $dbr->bindParam(':id', $data['id'], PDO::PARAM_INT);
      $dbr->execute();
     }
   }
  else
   {
    $no_cache = true;
    if($data=get_content($settings['error_page']))
     {
      header($_SERVER['SERVER_PROTOCOL'] . " 404 Not Found");
      header("Status: 404 Not Found");
     }
    else
     {
      raise_error('404');
     }
   }
 }

if($data['language_file']=='') $language_file = $settings['default_page_language_file'];
else $language_file = $data['language_file'];
$localization = new Localization(BASE_PATH.CMS.'lang/'.$language_file);
mb_internal_encoding(Localization::$lang['charset']);
setlocale(LC_ALL, Localization::$lang['locale']);
define('CHARSET', Localization::$lang['charset']);
$type_addition = trim($data['type_addition']);
$template->assign('type_addition', $type_addition);
// breadcrumbs:
$template->assign('breadcrumbs', get_breadcrumbs($data['breadcrumbs']));
$page = $data['page'];
$content = $data['content'];
if($settings['content_auto_link']==1) $content = make_link($content);
if($settings['content_smilies']==1) $content = smilies($content);
if($data['content_formatting']==1) $content = auto_html($content);
$content = parse_special_tags($content);

$sidebar_1 = $data['sidebar_1'];
if($settings['content_auto_link']==1) $sidebar_1 = make_link($sidebar_1);
if($settings['content_smilies']==1) $sidebar_1 = smilies($sidebar_1);
if($data['sidebar_1_formatting']==1) $sidebar_1 = auto_html($sidebar_1);
if($sidebar_1!='') $sidebar_1 = parse_special_tags($sidebar_1);

$sidebar_2 = $data['sidebar_2'];
if($settings['content_auto_link']==1) $sidebar_2 = make_link($sidebar_2);
if($settings['content_smilies']==1) $sidebar_2 = smilies($sidebar_2);
if($data['sidebar_2_formatting']==1) $sidebar_2 = auto_html($sidebar_2);
if($sidebar_2!='') $sidebar_2 = parse_special_tags($sidebar_2);

$sidebar_3 = $data['sidebar_3'];
if($settings['content_auto_link']==1) $sidebar_3 = make_link($sidebar_3);
if($settings['content_smilies']==1) $sidebar_3 = smilies($sidebar_3);
if($data['sidebar_3_formatting']==1) $sidebar_3 = auto_html($sidebar_3);
if($sidebar_3!='') $sidebar_3 = parse_special_tags($sidebar_3);

$sections_array = explode(',',$data['sections']);
foreach($sections_array as $section)
 {
  $sections[] = $section;
 }
$template->assign('section', $sections);

$custom_values_array = explode(',',$data['custom_values']);
foreach($custom_values_array as $custom_value)
 {
  $custom_values[] = $custom_value;
 }
$template->assign('custom_value', $custom_values);

$page_id = $data['id'];


// include news (simple news):
if($data['include_news'])
 {
  $dbr = Database::$content->prepare("SELECT page, type FROM ".Database::$db_settings['pages_table']." WHERE id=:id");
  $dbr->bindParam(':id', $data['include_news'], PDO::PARAM_INT);
  $dbr->execute();
  $include_news_page_data = $dbr->fetch();
  if(isset($include_news_page_data['page']))
   {
    if($include_news_page_data['type']=='simple_news')
     {
      $dbr = Database::$content->prepare("SELECT id, time, title, teaser, text, text_formatting FROM ".Database::$db_settings['news_table']." WHERE page_id=:page_id ORDER BY time DESC LIMIT ".$settings['include_news_items']);
     }
    else
     {
      $dbr = Database::$content->prepare("SELECT id, time, teaser_headline, headline, title, page_title, page, teaser, teaser_formatting, content, content_formatting FROM ".Database::$db_settings['pages_table']." WHERE include_page=:page_id ORDER BY time DESC LIMIT ".$settings['include_news_items']);
     }
    $dbr->bindParam(':page_id', $data['include_news'], PDO::PARAM_INT);
    $dbr->execute();
    $i=0;
    while($include_news_data = $dbr->fetch())
     {
      $include_news[$i]['id'] = $include_news_data['id'];
      $include_news[$i]['time'] = $include_news_data['time'];
      $localization->bindReplacePlaceholder($include_news_data['id'], 'time', $include_news_data['time'], 'include_news_time', Localization::FORMAT_TIME);
      
      if($include_news_page_data['type']=='simple_news')
       {
        $include_news[$i]['title'] = $include_news_data['title'];
        if($include_news_data['teaser'])
         {
          $include_news[$i]['teaser'] = $include_news_data['teaser'];
         }
        else
         {
          if($include_news_data['text_formatting']==1) $include_news[$i]['teaser'] = auto_html($include_news_data['text']);
          else $include_news[$i]['teaser'] = $include_news_data['text'];
         }
        $include_news[$i]['link'] = BASE_URL.$include_news_page_data['page'].','.$include_news_data['id'];       
       }
      else
       {
        if($include_news_data['teaser_headline']!='')
         {
          $include_news[$i]['title'] = $include_news_data['teaser_headline'];
         }
        elseif($include_news_data['headline']!='')
         {
          $include_news[$i]['title'] = $include_news_data['headline'];
         }
        else
         {
          $include_news[$i]['title'] = $include_news_data['title'];
         }
        if($include_news_data['teaser']!='')
         {
          if($include_news_data['teaser_formatting']==1)
           {
            $include_news[$i]['teaser'] = auto_html($include_news_data['teaser']);
           }
          else
           {
            $include_news[$i]['teaser'] = $include_news_data['teaser'];
           }
         }
        else
         {
          if($include_news_data['content_formatting']==1)
           {
            $include_news[$i]['teaser'] = auto_html($include_news_data['content']);
           }
          else
           {
            $include_news[$i]['teaser'] = $include_news_data['content'];
           }
         }      
        $include_news[$i]['link'] = BASE_URL.$include_news_data['page'];              
       }
      
      $i++;
     }
    if(isset($include_news))
     {
      $template->assign('include_news', $include_news);
     }
   }
 }

$template->assign('id', $data['id']);
$template->assign('page', $page);
$template->assign('settings', $settings);
$template->assign('type', $data['type']);
$template->assign('title', $data['title']);
$template->assign('page_title', $data['page_title']);
if($data['inline_css']) $template->assign('inline_css', $data['inline_css']);

if($data['keywords']) $template->assign('keywords', $data['keywords']);
elseif($settings['default_keywords']) $template->assign('keywords', $settings['default_keywords']);
else $template->assign('keywords', '');

if($data['description']) $template->assign('description', $data['description']);
elseif($settings['default_description']) $template->assign('description', $settings['default_description']);
else $template->assign('description', '');

$template->assign('category', htmlspecialchars($data['category']));
$template->assign('page_info', $data['page_info']);
$template->assign('headline', $data['headline']);
$template->assign('content', $content);
$template->assign('sidebar_1', $sidebar_1);
$template->assign('sidebar_2', $sidebar_2);
$template->assign('sidebar_3', $sidebar_3);
$template->assign('menu_1', $data['menu_1']);
$template->assign('menu_2', $data['menu_2']);
$template->assign('menu_3', $data['menu_3']);
$template->assign('gcb_1', intval($data['gcb_1']));
$template->assign('gcb_2', intval($data['gcb_2']));
$template->assign('gcb_3', intval($data['gcb_3']));
$template->assign('status', intval($data['status']));

if($data['page']==$settings['index_page']) $template->assign('canonical', BASE_URL);

if(isset($_SESSION[$settings['session_prefix'].'user_id']) && is_authorized_to_edit($_SESSION[$settings['session_prefix'].'user_id'],$_SESSION[$settings['session_prefix'].'user_type'],$data['author'],$data['edit_permission'],$data['edit_permission_general']))
 {
  $authorized_to_edit = true;
 }
else
 {
  $authorized_to_edit = false;
 }
$template->assign('authorized_to_edit', $authorized_to_edit);

$template->assign('timestamp', $data['time']);

if($data['display_time']==1)
 {
  $template->assign('display_time', true);
  $localization->replacePlaceholder('time', $data['time'], 'page_time', Localization::FORMAT_TIME);
 }
else
 {
  $template->assign('display_time', false);
 }

$localization->replacePlaceholder('last_modified', $data['last_modified'], 'page_last_modified', Localization::FORMAT_TIME);
$localization->replacePlaceholder('created', $data['time'], 'page_last_modified', Localization::FORMAT_TIME);

$content_type = $data['content_type'] ? $data['content_type'] : 'text/html';
$template_file = $data['template'];
$template_mobile_file=$data['template_mobile'];
$template->assign('template_mobile_file', $data['template_mobile']);
$template->assign('template_file', $data['template']);


if($data['type']!='default')
 {
  include(BASE_PATH.CMS.'includes/page_types.conf.php');
  if(isset($page_types[$data['type']]['page_type']))
   {
    include(BASE_PATH.CMS.'includes/page_types/'.$page_types[$data['type']]['page_type']);
   }
 }
else
 {
  if(isset($cache) && empty($no_cache))
   {
    $cache->cacheId = PAGE;
   }
 }
?>
