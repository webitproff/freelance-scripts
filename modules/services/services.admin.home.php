<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=admin.home.sidepanel
Order=2
[END_COT_EXT]
==================== */

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('services', 'module');

$tt = new XTemplate(cot_tplfile('services.admin.home', 'module', true));

$publicservices = $db->query("SELECT COUNT(*) FROM $db_services WHERE item_state='0'");
$publicservices = $publicservices->fetchColumn();

$hiddenservices = $db->query("SELECT COUNT(*) FROM $db_services WHERE item_state='1'");
$hiddenservices = $hiddenservices->fetchColumn();

$servicesqueued = $db->query("SELECT COUNT(*) FROM $db_services WHERE item_state='2'");
$servicesqueued = $servicesqueued->fetchColumn();

$tt->assign(array(
	'ADMIN_HOME_SERVICES_QUEUED_URL' => cot_url('admin', 'm=services&state=2'),
	'ADMIN_HOME_SERVICES_PUBLIC_URL' => cot_url('admin', 'm=services&state=0'),
	'ADMIN_HOME_SERVICES_HIDDEN_URL' => cot_url('admin', 'm=services&state=1'),
	'ADMIN_HOME_SERVICES_QUEUED' => $servicesqueued,
	'ADMIN_HOME_SERVICES_PUBLIC' => $publicservices,
	'ADMIN_HOME_SERVICES_HIDDEN' => $hiddenservices,
));

$tt->parse('MAIN');

$line = $tt->text('MAIN');