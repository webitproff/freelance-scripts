<?php defined('COT_CODE') or die('Wrong URL');
/* ====================
[BEGIN_COT_EXT]
Hooks=header.main
[END_COT_EXT]
==================== */

if (cot_auth('services', 'any', 'A'))
{	
	$serv_moderated = $db->query("SELECT COUNT(*) FROM {$db_services} WHERE item_state=2")->fetchColumn();
	$notifyservices_moderated = ($serv_moderated > 0) ? array(cot_url('admin', 'm=services&state=2'), cot_declension($serv_moderated, $Ls['services_headermoderated'])) : '';
	if (!empty($notifyservices_moderated))
	{
		$out['notices_array'][] = $notifyservices_moderated;
	}
}