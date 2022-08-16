<?PHP

/* ====================
[BEGIN_COT_EXT]
Hooks=users.register.add.done
[END_COT_EXT]

==================== */

if ( !defined('COT_CODE') ) { die("Wrong URL."); }

require_once(cot_langfile('newuserpm'));


$repla1 = array("[user]", "[email]", "[mainurl]");
$repla2   = array($ruser['user_name'], $ruser['user_email'], $cfg['mainurl']);


$newusertext = str_replace($repla1, $repla2, $cfg['plugin']['newuserpm']['message']);
$newusertitle = str_replace($repla1, $repla2, $cfg['plugin']['newuserpm']['messagetitle']);


// The message
//$message = $ruser['user_name']." 1\r\n ".$ruser['user_email']." 2\r\nLine 3";

// In case any of our lines are larger than 70 characters, we should use wordwrap()
//$message = wordwrap($message, 70, "\r\n");



$from_email = $cfg['plugin']['newuserpm']['fromuserid'];
$from_name = $cfg['plugin']['newuserpm']['fromusername'];
$to_email = $cfg['plugin']['newuserpm']['touserid'];
$subject = $newusertitle;
$message = $newusertext;
$message = "$message";
	$message .= "Форма прислана с сайта: ". htmlentities($_SERVER["SERVER_NAME"],ENT_COMPAT,'UTF-8') ."\n";
	$message .= "Visitor IP address: ". htmlentities($_SERVER["REMOTE_ADDR"],ENT_COMPAT,'UTF-8') ."\n";
	
	
$headers   = array();
$headers[] = "MIME-Version: 1.1";
$headers[] = "Content-type: text/html; charset=utf-8";
$headers[] = "From: $from_name <$from_email>";
//$headers[] = "Bcc: JJ Chong <bcc@domain2.com>";
$headers[] = "Reply-To: $from_name <$from_email>";
$headers[] = "Subject: {$subject}";
$headers[] = "X-Mailer: PHP/".phpversion();



mail($to_email, $subject, $message, implode("\r\n", $headers));

// Send
//mail('zeesmobile@gmail.com', $newusertitle, $message);


?>
