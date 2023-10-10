<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=header.main
Tags=header.tpl:{HEADER_USER_PMS},{HEADER_USER_PMREMINDER},{HEADER_USER_PM_URL},{HEADER_USER_PM_COUNT}
[END_COT_EXT]
==================== */

/**
 * Dialog System
 * @version 2.2
 * @package DS
 * @copyright (c) Alexeev Vlad
 */

defined('COT_CODE') or die('Wrong URL.');
if ($usr['id'] > 0)
{
  require_once cot_incfile('ds', 'module');

  $usr['messages'] = 0;

  $newmsg = $db->query("SELECT COUNT(*) FROM $db_ds_dialog WHERE (toid='".$usr['id']."' AND tostatus = 1) OR (fromid='".$usr['id']."' AND fromstatus = 1)")->fetchColumn();
	if ($newmsg > 0)
	{
		$usr['messages'] = $db->query("SELECT COUNT(*) FROM $db_ds_msg WHERE touser='".$usr['id']."' AND status = 1")->fetchColumn();
	}

	$out['pmreminder'] = ($usr['messages'] > 0) ? cot_declension($usr['messages'], $Ls['Privatemessages']) : $L['hea_noprivatemessages'];

  $out['pms'] = cot_rc_link(cot_url('ds'), $L['Private_Messages'], array('id' => 'dscountnewmsgs'));

	$t->assign(array(
		'HEADER_USER_PM_URL' => cot_url('ds'),
		'HEADER_USER_PMS' => $out['pms'],
    'HEADER_USER_PM_COUNT' => $usr['messages'],
		'HEADER_USER_PMREMINDER' => cot_rc_link(cot_url('ds'), $out['pmreminder'], array('id' => 'dscountnewmsgs'))
	));
}
