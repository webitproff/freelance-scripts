<?php
/**
 * [BEGIN_COT_EXT]
 * Hooks=global
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('ds', 'module');
require_once cot_langfile('ds', 'module');

global $db, $db_config, $cfg, $cot_usersonline;

$sql = $db->query("SELECT * FROM $db_config
	WHERE config_cat='ds' AND config_name='hideset' LIMIT 1")->fetch();

if (((int)$sql['config_value'] + $cfg['ds']['timesend']*60) < (int)$sys['now'])
{
 $reg_upd['config_value'] = $sys['now'];
 $db->update($db_config, $reg_upd, "config_cat='ds' AND config_name='hideset'");

 $sql = $db->query("SELECT COUNT(id) AS messagescount, max(m.id) AS new_last, u.* FROM $db_ds_msg AS m
	LEFT JOIN $db_users AS u ON u.user_id=m.touser
	WHERE m.status='1' AND m.id > u.user_lastmsg GROUP BY m.touser");

 foreach($sql->fetchAll() as $send_urr)
 {
	 $res = TRUE;
	 if (is_array($cot_usersonline))
	 {
		$res = (in_array($send_urr['user_id'], $cot_usersonline)) ? FALSE : TRUE;
	 }
   if ($res)
   {
	  $tags = $send_urr;
    $rbody = cot_rc($L['ds_mail_first'], $tags).cot_declension($send_urr['messagescount'], $Ls['Privatemessages']).'.';
	  cot_mail($send_urr['user_email'], '', $rbody);

    $db->update($db_users, array('user_lastmsg' => $send_urr['new_last']), "user_id=".$send_urr['user_id']);
   }
 }
}

?>