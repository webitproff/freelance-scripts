<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=admin.home.sidepanel
Order=5
[END_COT_EXT]
==================== */

/**
 * orderservices plugin
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('orderservices', 'plug');

$tt = new XTemplate(cot_tplfile('orderservices.admin.home', 'plug', true));

$orderservicescount = $db->query("SELECT COUNT(*) FROM $db_services_orders WHERE 1");
$orderservicescount = $orderservicescount->fetchColumn();

$orderservicesclaims = $db->query("SELECT COUNT(*) FROM $db_services_orders WHERE order_status='claim'");
$orderservicesclaims = $orderservicesclaims->fetchColumn();

$orderservicesdone = $db->query("SELECT COUNT(*) FROM $db_services_orders WHERE order_status='done'");
$orderservicesdone = $orderservicesdone->fetchColumn();

$tt->assign(array(
	'ADMIN_HOME_ORDERS_URL' => cot_url('admin', 'm=other&p=orderservices'),
	'ADMIN_HOME_ORDERS_COUNT' => $orderservicescount,
	'ADMIN_HOME_CLAIMS_URL' => cot_url('admin', 'm=other&p=orderservices&status=claim'),
	'ADMIN_HOME_CLAIMS_COUNT' => $orderservicesclaims,
	'ADMIN_HOME_DONE_URL' => cot_url('admin', 'm=other&p=orderservices&status=done'),
	'ADMIN_HOME_DONE_COUNT' => $orderservicesdone,
));

$tt->parse('MAIN');

$line = $tt->text('MAIN');
