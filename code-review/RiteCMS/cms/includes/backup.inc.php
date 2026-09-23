<?php
/* This will backup the database file. It is recommended before any major update. Just in case.
@copyright Ray Zhuang 2016 ray@ritecms.com
*/

if(!defined('IN_INDEX')) exit;
//$directory='data';
$fdata='content.db'; //
if(isset($_SESSION[$settings['session_prefix'].'user_id']))
 {
  //$template->assign('directory', DATA_DIR);
$template->assign('fdata', $fdata);
  if(isset($_REQUEST['action'])) $action = $_REQUEST['action'];
  if(empty($action)) $action = 'main';
  
   if(isset($_REQUEST['delete']))
  {
  if(isset($_REQUEST['confirmed'])&&(strpos($_REQUEST['delete'],'_content')!==false))
  {
     @chmod(BASE_PATH.DATA_DIR.$_REQUEST['delete'], 0777);
     if(!@unlink(BASE_PATH.DATA_DIR.$_REQUEST['delete'])) $errors[] = Localization::$lang['delete_file_error'];
     header('Location: '.BASE_URL.CMSHOME.'?mode=backup');
     exit;
     }
  }

  switch($action)
   {
    case 'main':
     $fp=opendir(BASE_PATH.DATA_DIR);
     while($file = readdir($fp))
      {
       if(is_file(BASE_PATH.DATA_DIR.$file)&&(substr($file,0,6)=='backup'))
        {
         $file_array[] = $file;
        }
      }
     closedir($fp);

     if(isset($file_array))
      {
       natcasesort($file_array);

       $i=0;
       foreach($file_array as $file)
        {
         $files[$i]['filename'] = htmlspecialchars($file);
         $files[$i]['size'] = number_format(filesize(BASE_PATH.DATA_DIR.$file)/1000,1,".",".");
         $files[$i]['last_modified'] = strftime(Localization::$lang['time_format'], filectime(BASE_PATH.DATA_DIR.$file));
         ++$i;
        }
       if(isset($files))
        {
         $template->assign('files', $files);
        }
      }
     $template->assign('subtitle', Localization::$lang['backup']);
     $template->assign('subtemplate', 'backup.inc.tpl');
    break;
    case 'copy':
    $file=BASE_PATH.DATA_DIR.$fdata;
    $newfile=BASE_PATH.DATA_DIR.'backup_'.date("mdY_Gis").'_'.$fdata;
    copy($file, $newfile);
    header('Location: '.BASE_URL.CMSHOME.'?mode=backup');
    
   }
 }
