<?php

/* ====================
[BEGIN_COT_EXT]
Hooks=global
Order=10
[END_COT_EXT]
==================== */

/**
 * PHPMailer for Cotonti CMF
 *
 * @version 1.6.2
 * @author Cotonti CMF
 * @copyright (c) 2020
 */
defined('COT_CODE') or die('Wrong URL.');
	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\Exception;
	use PHPMailer\PHPMailer\SMTP;
function cot_mail_custom($fmail, $subject, $body, $headers, $customtemplate, $additional_parameters, $html)
{
	global $cfg;
	
	if (is_array($cot_mail_senders) && count($cot_mail_senders) > 0)
	{
		foreach ($cot_mail_senders as $func)
		{
			$ret &= $func($fmail, $subject, $body, $headers, $additional_parameters, $html);
		}
		return $ret;
	}
	if (empty($fmail))
	{
		return(FALSE);
	}
	else
	{

		if (!$customtemplate)
		{
			$body_params = array(
				'SITE_TITLE' => $cfg['maintitle'],
				'SITE_URL' => $cfg['mainurl'],
				'SITE_DESCRIPTION' => $cfg['subtitle'],
				'ADMIN_EMAIL' => $cfg['adminemail'],
				'MAIL_SUBJECT' => $subject,
				'MAIL_BODY' => $body
			);

			$subject_params = array(
				'SITE_TITLE' => $cfg['maintitle'],
				'SITE_DESCRIPTION' => $cfg['subtitle'],
				'MAIL_SUBJECT' => $subject
			);

			$subject = cot_title($cfg['subject_mail'], $subject_params, false);
			$body = cot_title(str_replace("\r\n", "\n", $cfg['body_mail']), $body_params, false);
		}
		$subject = mb_encode_mimeheader($subject, 'UTF-8', 'B', "\n");
		
		require_once $cfg['plugins_dir'].'/phpmailer/src/Exception.php';
		require_once $cfg['plugins_dir'].'/phpmailer/src/PHPMailer.php';
		require_once $cfg['plugins_dir'].'/phpmailer/src/SMTP.php';
		
		// +++++++++++++++++++++++++++++++++++++++++++++
		global $error;

		//Create a new PHPMailer instance
		$mail = new PHPMailer;
		$mail->isSMTP();
		//$mail->SMTPDebug = 1;
		//$mail->Debugoutput = 'html';
		$mail->Host = $cfg['plugin']['phpmailer']['Host'];
		$mail->Port = $cfg['plugin']['phpmailer']['Port'];
		$mail->SMTPAuth = (bool)$cfg['plugin']['phpmailer']['SMTPAuth'];
		$mail->SMTPSecure = $cfg['plugin']['phpmailer']['SMTPSecure'];
		$mail->Username = $cfg['plugin']['phpmailer']['Username'];
		$mail->Password = $cfg['plugin']['phpmailer']['Password'];
		$mail->CharSet = 'UTF-8';
		$mail->setFrom($cfg['plugin']['phpmailer']['from'], $cfg['plugin']['phpmailer']['from_name']);
		if (!empty($cfg['plugin']['phpmailer']['reply'])) {
            $mail->addReplyTo($cfg['plugin']['phpmailer']['reply'], $cfg['plugin']['phpmailer']['reply_name']);
		} else {
            $mail->addReplyTo($cfg['plugin']['phpmailer']['from'], $cfg['plugin']['phpmailer']['from_name']);
        }
		$mail->addAddress($fmail);
		$mail->isHTML($html);
		$mail->Subject = $subject;
		$mail->Body = $body;
		
		if (!$mail->Send())
		{
			$error = 'Mail error: '.$mail->ErrorInfo;
		//	echo $error;
			cot_log($error, 'eml');
			return false;
		}
		else
		{
			$error = 'Message sent!'.$mail->ErrorInfo;
		//	echo $error;
			cot_log($error, 'eml');
			return true;
		}
		
		// +++++++++++++++++++++++++++++++++++++++++++++
		
		
	}
}

?>
