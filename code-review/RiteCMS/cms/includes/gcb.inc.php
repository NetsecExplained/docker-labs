<?php
if(!defined('IN_INDEX')) exit;

if(isset($_SESSION[$settings['session_prefix'].'user_id']))
 {
  if(isset($_GET['add_gcb']))
   {
    $content_auto_html = 1;
    $action = 'edit_gcb';
   }

  if(isset($_POST['edit_gcb_submit']))
   {
    $title = isset($_POST['title']) ? trim($_POST['title']) : '';
    $content = isset($_POST['content']) ? $_POST['content'] : '';
    $content_formatting = isset($_POST['content_formatting']) && $_POST['content_formatting']==1 ? 1 : 0;

    if(empty($title))
     {
      $errors[] = 'gcb_error_no_title';
     }

    if(isset($_POST['id']))
     {
      $dbr = Database::$content->prepare("SELECT COUNT(*) FROM ".Database::$db_settings['gcb_table']." WHERE lower(title)=:title AND id!=:id");
      $dbr->bindParam(':id', $_POST['id'], PDO::PARAM_INT);
     }
    else
     {
      $dbr = Database::$content->prepare("SELECT COUNT(*) FROM ".Database::$db_settings['gcb_table']." WHERE lower(title)=:title");
     }
    $dbr->bindValue(':title', mb_strtolower($title,CHARSET), PDO::PARAM_STR);
    $dbr->execute();
    if($dbr->fetchColumn()!=0)
     {
      $errors[] = 'gcb_title_exists_error';
     }

    if(empty($errors))
     {
      if(isset($_POST['id']))
       {
        $dbr = Database::$content->prepare("UPDATE ".Database::$db_settings['gcb_table']." SET title=:title, content=:content, content_formatting=:content_formatting WHERE id=:id");
        $dbr->bindParam(':id', $_POST['id'], PDO::PARAM_INT);
       }
      else
       {
        $dbr = Database::$content->prepare("INSERT INTO ".Database::$db_settings['gcb_table']." (title,content,content_formatting) VALUES (:title,:content,:content_formatting)");
       }
      $dbr->bindParam(':title', $title, PDO::PARAM_STR);
      $dbr->bindParam(':content', $content, PDO::PARAM_STR);
      $dbr->bindParam(':content_formatting', $content_formatting, PDO::PARAM_INT);
      $dbr->execute();
      if(isset($cache) && $cache->autoClear) $cache->clear();
      header('Location: '.BASE_URL.CMSHOME.'?mode=gcb');
      exit;
     }
    else
     {
      if(isset($_POST['id'])) $gcb['id'] = $_POST['id'];
      $gcb['title'] = isset($_POST['title']) ? htmlspecialchars($_POST['title']) : '';
      $gcb['content'] = isset($_POST['content']) ? htmlspecialchars($_POST['content']) : '';
      $gcb['content_formatting'] = isset($_POST['content_formatting']) && $_POST['content_formatting']==1 ? 1 : 0;
      $template->assign('gcb', $gcb);
      $template->assign('errors', $errors);
      $action = 'edit_gcb';
     }
   }

  if(isset($_GET['edit']))
   {
    $dbr = Database::$content->prepare("SELECT id, title, content, content_formatting FROM ".Database::$db_settings['gcb_table']." WHERE id=:id LIMIT 1");
    $dbr->bindParam(':id', $_GET['edit'], PDO::PARAM_INT);
    $dbr->execute();
    $data = $dbr->fetch();
    if(isset($data['id']))
     {
      $gcb['id'] = $data['id'];
      $gcb['title'] = htmlspecialchars($data['title']);
      $gcb['content'] = htmlspecialchars($data['content']);
      $gcb['content_formatting'] = $data['content_formatting'];
      $template->assign('gcb', $gcb);
      $action = 'edit_gcb';
     }
    else
     {
      $action = 'invalid_request';
     }
   }

  if(isset($_REQUEST['delete']))
   {
    if(isset($_REQUEST['confirmed']))
     {
      $dbr = Database::$content->prepare("DELETE FROM ".Database::$db_settings['gcb_table']." WHERE id=:id");
      $dbr->bindParam(':id', $_REQUEST['delete'], PDO::PARAM_INT);
      $dbr->execute();
      if(isset($cache) && $cache->autoClear) $cache->clear();
      header('Location: '.BASE_URL.CMSHOME.'?mode=gcb');
      exit;
     }
    else
     {
      $dbr = Database::$content->prepare("SELECT id, title FROM ".Database::$db_settings['gcb_table']." WHERE id=:id LIMIT 1");
      $dbr->bindParam(':id', $_GET['delete'], PDO::PARAM_INT);
      $dbr->execute();
      $data = $dbr->fetch();
      if(isset($data['id']))
       {
        $gcb['id'] = $data['id'];
        $gcb['title'] = htmlspecialchars($data['title']);
        $template->assign('gcb', $gcb);
        $action = 'delete_gcb';
       }
      else
       {
        $action = 'invalid_request';
       }
     }
   }

  if(isset($_REQUEST['action'])) $action = $_REQUEST['action'];
  if(empty($action)) $action='main';

  switch ($action)
   {
    case 'main':
     $dbr = Database::$content->query("SELECT id, title, content, content_formatting FROM ".Database::$db_settings['gcb_table']." ORDER BY id ASC");
     $i=0;
     while($data = $dbr->fetch())
      {
       $gcbs[$i]['id'] = $data['id'];
       $gcbs[$i]['title'] = htmlspecialchars($data['title']);
       if($data['content_formatting']==1)
        {
         $gcbs[$i]['content'] = nl2br(preg_replace('/\[\[([^|\]]+?)(?:\|([^\]]+))?\]\]/e', "'<a href=\"\$1\">'.(('\$2')?'\$2':'\$1').'</a>'", $data['content']));
        }
       else
        {
         $gcbs[$i]['content'] = $data['content'];
        }
       ++$i;
      }
     if(isset($gcbs))
      {
       $template->assign('gcbs', $gcbs);
      }
     $template->assign('subtitle', Localization::$lang['gcb']);
     $template->assign('subtemplate', 'gcb.inc.tpl');
     break;
    case 'edit_gcb':
     if(isset($gcb['id']))
      {
       $template->assign('subtitle', Localization::$lang['edit_gcb']);
      }
     else
      {
       $template->assign('subtitle', Localization::$lang['add_gcb']);
      }
     $template->assign('subtemplate', 'gcb_edit.inc.tpl');
     break;
    case 'delete_gcb':
     $template->assign('subtitle', Localization::$lang['delete_gcb']);
     $template->assign('subtemplate', 'gcb_delete.inc.tpl');
    break;
   }
 }
