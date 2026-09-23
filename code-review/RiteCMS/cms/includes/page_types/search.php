<?php
if(!defined('IN_INDEX')) exit;

switch(Database::$db_settings['type'])
 {
  case 'sqlite':
  case 'sqlite2':
   $general_clause = "(page || title || page_title || content || headline || keywords || description || sidebar_1 || sidebar_2 || sidebar_3) LIKE ?";
   $special_clause = "(page || title || page_title || keywords || description) LIKE ?";
   $photo_clause = "(title || subtitle || description) LIKE ?";
   break;
  default:
   $general_clause = "CONCAT(page, title, page_title, content, headline, keywords, description, sidebar_1, sidebar_2, sidebar_3) LIKE ?";
   $special_clause = "CONCAT(page, title, page_title, keywords, description) LIKE ?";
   $photo_clause = "CONCAT(title, subtitle, description) LIKE ?";
 }

if(isset($_POST['q']))
 {
  $q = str_replace(',','',$_POST['q']);
  $q = urlencode($q);
  if(trim($q)!='') header('Location: '.BASE_URL.PAGE.',,'.$q);
  else header('Location: '.BASE_URL.PAGE);
  exit;
 }
elseif(isset($_GET['get_2']))
 {
  $q = $_GET['get_2'];
  $q = urldecode($q);
  $no_cache = true;
 }

if(isset($_GET['get_3'])) $current_page = intval($_GET['get_3']);
else $current_page = 1;

if(isset($q))
 {
  $q = trim($q);
  $template->assign('q', htmlspecialchars($q));
  $q = mb_substr($q, 0, 255);
  $q_encoded = urlencode(htmlspecialchars($q));
  $template->assign('q_encoded', $q_encoded);

  $cookie_data = $q_encoded.' '.$current_page;
  setcookie($settings['session_prefix'].'search',$cookie_data);

  $q = str_replace('"', '', $q);
  $q_array = explode(" ", $q);

  $number_of_words = count($q_array);
  if($number_of_words > 3)
   {
    $number_of_words = 3;
   }

  $dbr = Database::$content->query("SELECT id,page,title,description FROM ".Database::$db_settings['pages_table']." WHERE status>1");
  $dbr->execute();
  while($data = $dbr->fetch())
   {
    $pages[$data['id']]['page']=$data['page'];
    $pages[$data['id']]['title']=$data['title'];
    $pages[$data['id']]['description']=$data['description'];
   }

  // search pages:
  $general_search_clause = '';
  $special_search_clause = '';
  for($i=0;$i<$number_of_words;++$i)
   {
    $general_search_clause .= $general_clause;
    $special_search_clause .= $special_clause;
    if($i<$number_of_words-1)
     {
      $general_search_clause .= ' AND ';
      $special_search_clause .= ' AND ';
     }
   }
  // search all fields:

  $dbr = Database::$content->prepare("SELECT id FROM ".Database::$db_settings['pages_table']." WHERE status>1 AND ".$general_search_clause);
  for($i=0;$i<$number_of_words;++$i)
   {
    $dbr->bindValue($i+1, '%'.$q_array[$i].'%', PDO::PARAM_STR);
   }
  $dbr->execute();
  while($data = $dbr->fetch())
   {
    $result_pages[$data['id']]['id'] = $data['id'];
    $result_pages[$data['id']]['type'] = 0;
    $result_pages[$data['id']]['relevance'] = 0;
    $result_pages[$data['id']]['page'] = $pages[$data['id']]['page'];
    $result_pages[$data['id']]['title'] = $pages[$data['id']]['title'];
    $result_pages[$data['id']]['description'] = $pages[$data['id']]['description'];
   }
  if(isset($pages))
   {
    // search in special fields:
    $dbr = Database::$content->prepare("SELECT id FROM ".Database::$db_settings['pages_table']." WHERE status>1 AND ".$special_search_clause);
    for($i=0;$i<$number_of_words;++$i)
     {
      $dbr->bindValue($i+1, '%'.$q_array[$i].'%', PDO::PARAM_STR);
     }
    $dbr->execute();
    while($data = $dbr->fetch())
     {
      // enhance relevace if word found in special fields:
      if(isset($pages[$data['id']]))
       {
        ++$result_pages[$data['id']]['relevance'];
       }
     }
   }

  $photo_search_clause = '';
  for($i=0;$i<$number_of_words;++$i)
   {
    $photo_search_clause .= $photo_clause;
    if($i<$number_of_words-1)
     {
      $photo_search_clause .= ' AND ';
     }
   }
  $dbr = Database::$content->prepare("SELECT id,title,subtitle,description FROM ".Database::$db_settings['photo_table']." WHERE ".$photo_search_clause);
  for($i=0;$i<$number_of_words;++$i)
   {
    $dbr->bindValue($i+1, '%'.$q_array[$i].'%', PDO::PARAM_STR);
   }
  $dbr->execute();
  while($data = $dbr->fetch())
   {
    $result_photos[$data['id']]['id'] = $data['id'];
    $result_photos[$data['id']]['type'] = 1;
    $result_photos[$data['id']]['relevance'] = 0;
    $result_photos[$data['id']]['page'] = PAGE.','.IMAGE_IDENTIFIER.','.$data['id'];
    $result_photos[$data['id']]['title'] = $data['title'];
    $result_photos[$data['id']]['description'] = '';
   }

  // merge results:
  if(isset($result_pages))
   {
    foreach($result_pages as $result_page)
     {
      $results[] = $result_page;
     }
   }
  if(isset($result_photos))
   {
    foreach($result_photos as $result_photo)
     {
      $results[] = $result_photo;
     }
   }

  if(isset($results))
   {
    // sort by relevance:
    foreach($results as $key => $val)
     {
      $relevance[$key] = $val['relevance'];
     }
    array_multisort($relevance, SORT_DESC, $results);

    $result_count = count($results);

    $total_pages = ceil($result_count / $settings['search_results_per_page']);
    if($current_page>$total_pages) $curret_page = $total_pages;
    if($current_page<1) $current_page=1;
    for($i=($current_page-1)*$settings['search_results_per_page'];$i<$current_page*$settings['search_results_per_page'];++$i)
     {
      if(isset($results[$i]))
       {
        $displayed_results[] = $results[$i];
       }
     }

    $template->assign('pagination', pagination($total_pages,$current_page));

    $template->assign('results', $displayed_results);

    switch($result_count)
     {
      case 0:
       $localization->selectVariant('search_number_of_results', 0);
       break;
      case 1:
       $localization->selectVariant('search_number_of_results', 1);
       break;
      default:
       $localization->selectVariant('search_number_of_results', 2);
       $localization->replacePlaceholder('pages', $result_count, 'search_number_of_results');
     }
    $localization->replacePlaceholder('current_page', $current_page, 'pagination');
    $localization->replacePlaceholder('total_pages', $total_pages, 'pagination');
   }
 }

$template->assign('subtemplate', 'search.inc.tpl');

if(isset($cache) && empty($no_cache))
 {
  $cache->cacheId = PAGE;
 }
?>
