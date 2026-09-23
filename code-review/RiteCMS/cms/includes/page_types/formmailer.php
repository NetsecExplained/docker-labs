<?php
if(!defined('IN_INDEX')) exit;

 
if(isset($_POST['send']))
 {
	if(isset($settings['securimage']) && $settings['securimage']==1){
 	require_once(BASE_PATH.CMS.'modules/securimage/securimage.php');
 	$securimage = new Securimage();
 	if (!$securimage->check($_POST['captcha_code'])) {
 		// the code was incorrect
		// you should handle the error so that the form processor doesn't continue
		// or you can use the following code if there is no validation or you do not know how
	die("<center>The security code entered was incorrect.<br /><br />Please go <a href='javascript:history.go(-1)'>back</a> and try again.</center>");
	}
  }
  
if(isset($settings['recaptcha_mail_check']) && $settings['recaptcha_mail_check']==1)
 {require_once(BASE_PATH.CMS.'modules/recaptchalib.php');
  $privatekey = $settings['recaptcha_key_private'];
  $resp = recaptcha_check_answer ($privatekey,
                                $_SERVER["REMOTE_ADDR"],
                                $_POST["recaptcha_challenge_field"],
                                $_POST["recaptcha_response_field"]);

  if (!$resp->is_valid) {
    // What happens when the CAPTCHA was entered incorrectly
    die ("The reCAPTCHA wasn't entered correctly. Go back and try it again." .
         "(reCAPTCHA said: " . $resp->error . ")");
  } 
  }
  
  // get posted data:
  $email = isset($_POST['email']) ? trim($_POST['email']) : '';
  $subject = isset($_POST['subject']) ? trim($_POST['subject']) : '';
  $message = isset($_POST['message']) ? trim($_POST['message']) : '';
  // instantiate $mail object:
  $mail = new Mail();
  // check data:
  if(!$mail->is_valid_email($email))
   {
    $errors[] = 'formmail_error_email_invalid';
   }
  if(empty($message))
   {
    $errors[] = 'formmail_error_no_message';
   }
  if(mb_strlen($message, CHARSET) > $settings['email_text_maxlength'])
   {
    $errors[] = 'formmail_error_text_too_long';
   }
  if(mb_strlen($subject, CHARSET) > $settings['email_subject_maxlength'])
   {
    $errors[] = 'formmail_error_subj_too_long';
   }
  if(empty($errors))
   {
        // Akismet spam check:
        if($settings['akismet_key']!='' && $settings['akismet_mail_check']==1)
         {
          $mail_parts = explode("@", $email);
          $check_mail['author'] = $mail_parts[0];
          $check_mail['email'] = $email;
          $check_mail['body'] = $message;
          $akismet = new Akismet(BASE_URL, $settings['akismet_key'], $check_mail);
          // test for errors
          if($akismet->errorsExist()) // returns true if any errors exist
           {
            if($akismet->isError(AKISMET_INVALID_KEY))
             {
              $errors[] = 'akismet_error_api_key';
             }
            elseif($akismet->isError(AKISMET_RESPONSE_FAILED))
             {
              $errors[] = 'akismet_error_connection';
             }
            elseif($akismet->isError(AKISMET_SERVER_NOT_FOUND))
             {
              $errors[] = 'akismet_error_connection';
             }
           }
          else
           {
            // No errors, check for spam
            if($akismet->isSpam())
             {
              $errors[] = 'akismet_spam_suspicion';
             }
           }
         }
       // End Akismet spam check:
   }
  if(empty($errors))
   {
    $mail->set_charset(CHARSET);
    if(empty($subject)) $subject = Localization::$lang['formmailer_no_subject'];
    if($mail->send($data['type_addition'], $email, $subject, $message, $settings['mail_parameter']))
     {
      $template->assign('mail_sent', true);
      $template->assign('hide_content', true);
     }
    else
     {
      $errors[] = 'formmail_error_mailserver';
     }
   }
 }

if(isset($errors))
 {
  $template->assign('email', htmlspecialchars($email));
  $template->assign('subject', htmlspecialchars($subject));
  $template->assign('message', htmlspecialchars($message));
  $template->assign('errors', $errors);
 }

$template->assign('subtemplate', 'formmailer.inc.tpl');

if(isset($cache))
 {
  $cache->cacheId = PAGE;
 }
?>
