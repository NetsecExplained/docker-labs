<?php
if(!defined('IN_INDEX')) exit;

if(isset($_SESSION[$settings['session_prefix'].'user_id']))
{
  // delete page:
  if(isset($_REQUEST['delete_page']))
   {
    $dbr = Database::$content->prepare("SELECT id, page, title, author, edit_permission, edit_permission_general FROM ".Database::$db_settings['pages_table']." WHERE id=:id LIMIT 1");
    $dbr->bindParam(':id', $_REQUEST['delete_page'], PDO::PARAM_INT);
    $dbr->execute();
    $data = $dbr->fetch();
    if(!isset($data['id']))
     {
      $action='invalid_page';
     }
    elseif(!is_authorized_to_edit($_SESSION[$settings['session_prefix'].'user_id'],$_SESSION[$settings['session_prefix'].'user_type'],$data['author'],$data['edit_permission'],$data['edit_permission_general']))
     {
      $action='no_authorization';
     }
    else
     {
      if(isset($_REQUEST['confirmed']))
       {
        // delete page:
        $dbr = Database::$content->prepare("DELETE FROM ".Database::$db_settings['pages_table']." WHERE id=:id");
        $dbr->bindParam(':id', $_REQUEST['delete_page'], PDO::PARAM_INT);
        $dbr->execute();
        // delete comments:
        $dbr = Database::$entries->prepare("DELETE FROM ".Database::$db_settings['comment_table']." WHERE comment_id=:id AND type=0");
        $dbr->bindParam(':id', $_REQUEST['delete_page'], PDO::PARAM_INT);
        $dbr->execute();
        // delete news entries:
        $dbr = Database::$content->prepare("DELETE FROM ".Database::$db_settings['news_table']." WHERE page_id=:id");
        $dbr->bindParam(':id', $_REQUEST['delete_page'], PDO::PARAM_INT);
        $dbr->execute();
        if(isset($cache) && $cache->autoClear) $cache->clear();
        header('Location: '.BASE_URL.CMSHOME.'?mode=pages');
        exit;
       }
      else $action='delete_page';
     }
   }

  if(isset($_GET['reset_views']) && $_SESSION[$settings['session_prefix'].'user_type']==1)
   {
    $timestamp_now = time();
    $dbr = Database::$content->query("UPDATE ".Database::$db_settings['pages_table']." SET views=0");
    $dbr = Database::$content->prepare("UPDATE ".Database::$db_settings['settings_table']." SET value=:value WHERE name='counter_last_resetted'");
    $dbr->bindParam(':value', $timestamp_now, PDO::PARAM_INT);
    $dbr->execute();
    $settings['counter_last_resetted'] = $timestamp_now;
    $action='main';
   }

  if(isset($_GET['action'])) $action = $_GET['action'];
  if(isset($_POST['action'])) $action = $_POST['action'];
  if(empty($action)) $action = 'main';

 switch($action)
  {
   case 'main':
     if(isset($_GET['order']))
      {
       switch($_GET['order'])
        {
         case 'title':
          $order='title';
         break;
         case 'time':
          $order='time';
         break;
         case 'last_modified':
          $order='last_modified';
         break;
         case 'views':
          $order='views';
         break;
         default:
          $order = 'page';
        }
      }
     else
      {
       $order = 'page';
      }
    $app=isset($settings['admin_articles_per_page']) ? $settings['admin_articles_per_page'] : 20 ;
    $cpage=isset($_GET['cpage'])?($_GET['cpage']-1) : 0;
    $articles=$cpage*$app;
     if(isset($_GET['descasc']) && $_GET['descasc']=='DESC') $descasc = 'DESC'; else $descasc = 'ASC';

     if(empty($order)) $order="id";
     if(empty($descasc)) $descasc="ASC";

     $template->assign('order',$order);
     $template->assign('descasc',$descasc);

     // user names:
     $user_result = Database::$userdata->query("SELECT id, name FROM ".Database::$db_settings['userdata_table']);
     while($userdata = $user_result->fetch())
      {
       $users[$userdata['id']] = htmlspecialchars($userdata['name']);
      }
     if(isset($users))
      {
       $template->assign('users',$users);
      }


$dbr = Database::$content->query("SELECT id, page, author, title, time, last_modified, last_modified_by, status, views, edit_permission, edit_permission_general FROM ".Database::$db_settings['pages_table']." ORDER BY ".$order." ".$descasc." limit $articles ,$app");
   $totalarticles = Database::$content->query("SELECT count(*) FROM ".Database::$db_settings['pages_table']);
   $totalarticles=$totalarticles->fetch();
   $template->assign('totalarticles',$totalarticles[0]);
   $template->assign('app',$app);
   $template->assign('cpage',$cpage);
     $i=0;
     while($row = $dbr->fetch())
      {
       $pages_data[$i]['id'] = $row['id'];
       $pages_data[$i]['page'] = $row['page'];
       $pages_data[$i]['author'] = $row['author'];
       $pages_data[$i]['title'] = $row['title'];
       $pages_data[$i]['time'] = $row['time'];
       $pages_data[$i]['last_modified'] = $row['last_modified'];
       $pages_data[$i]['last_modified_by'] = $row['last_modified_by'];
       $pages_data[$i]['status'] = $row['status'];
       $pages_data[$i]['views'] = $row['views'];
       if(is_authorized_to_edit($_SESSION[$settings['session_prefix'].'user_id'],$_SESSION[$settings['session_prefix'].'user_type'],$row['author'],$row['edit_permission'],$row['edit_permission_general']))
        {
         $pages_data[$i]['edit_permission'] = true;
        }
       else
        {
         $pages_data[$i]['edit_permission'] = false;
        }
       ++$i;
      }

     if(isset($pages_data))
      {
       $template->assign('pages',$pages_data);
       $template->assign('subtemplate', 'pages.inc.tpl');
      }
     break;
    case 'delete_page':
     $template->assign('page',$data);
     $template->assign('subtemplate', 'delete_page.inc.tpl');
     break;
    case 'invalid_page':
     $template->assign('error_message',Localization::$lang['page_doesnt_exist']);
     break;
    case 'no_authorization':
     $template->assign('error_message',Localization::$lang['no_authorization_edit']);
     break;
   }

 }
