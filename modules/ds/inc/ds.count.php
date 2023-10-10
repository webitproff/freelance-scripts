<?php

/**
 * Dialog System
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad
 */

defined('COT_CODE') or die('Wrong URL');

if ($usr['id'] > 0)
{
  cot_sendheaders();
  require_once cot_incfile('ds', 'module');
  $newmsg = $db->query("SELECT COUNT(*) FROM $db_ds_dialog WHERE (toid='".$usr['id']."' AND tostatus = 1) OR (fromid='".$usr['id']."' AND fromstatus = 1)")->fetchColumn();
	if ($newmsg > 0)
	{
		$usr['messages'] = $db->query("SELECT COUNT(*) FROM $db_ds_msg WHERE touser='".$usr['id']."' AND status = 1")->fetchColumn();
	}

	$out['pmreminder'] = ($usr['messages'] > 0) ? cot_declension($usr['messages'], $Ls['Privatemessages']) : $L['hea_noprivatemessages'];

	echo $out['pmreminder'];
}
