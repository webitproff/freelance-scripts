<?php
/**
 * [BEGIN_COT_EXT]
 * Hooks=tools
 * [END_COT_EXT]
 */

/**
 * orderservices plugin
 */

defined('COT_CODE') or die('Wrong URL');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', 'orderservices', 'RWA');
cot_block($usr['isadmin']);

require_once cot_incfile('orderservices', 'plug');
require_once cot_incfile('services', 'module');
require_once cot_incfile('payments', 'module');
require_once cot_incfile('extrafields');

$status = cot_import('status', 'G', 'ALP');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', 'orderservices');
cot_block($usr['isadmin']);

if($cfg['plugin']['orderservices']['ordersperpage'] > 0)
{
	list($pn, $d, $d_url) = cot_import_pagenav('d', $cfg['plugin']['orderservices']['ordersperpage']);
}

/* === Hook === */
$extp = cot_getextplugins('orderservices.admin.first');
foreach ($extp as $pl)
{
	include $pl;
}
/* ===== */

$out['subtitle'] = $L['services_sales_title'];
$out['head'] .= $R['code_noindex'];

$mskin = cot_tplfile(array('orderservices', 'admin'), 'plug');

/* === Hook === */
foreach (cot_getextplugins('orderservices.admin.main') as $pl)
{
	include $pl;
}
/* ===== */

$t = new XTemplate($mskin);

switch($status)
{

	case 'paid':
		$where['order_status'] = "o.order_status='paid'";
		break;

	case 'done':
		$where['order_status'] = "o.order_status='done'";
		break;

	case 'claim':
		$where['order_status'] = "o.order_status='claim'";
		break;

	case 'cancel':
		$where['order_status'] = "o.order_status='cancel'";
		break;

	case 'new':
		if($cfg['plugin']['orderservices']['showneworderswithoutpayment']) {
			$where['order_status'] = "o.order_status='new'";
		} else {
			$where['order_status'] = "o.order_status!='new'";
		}
		break;

	default:
		if(!$cfg['plugin']['orderservices']['showneworderswithoutpayment']) {
			$where['order_status'] = "o.order_status!='new'";
		}
		break;
}

$order['date'] = 'o.order_date DESC';

/* === Hook === */
foreach (cot_getextplugins('orderservices.admin.query') as $pl)
{
	include $pl;
}
/* ===== */

$where = ($where) ? 'WHERE ' . implode(' AND ', $where) : '';
$order = ($order) ? 'ORDER BY ' . implode(', ', $order) : '';
$query_limit = ($cfg['plugin']['orderservices']['ordersperpage'] > 0) ? "LIMIT $d, ".$cfg['plugin']['orderservices']['ordersperpage'] : '';

$totalitems = $db->query("SELECT COUNT(*) FROM $db_services_orders AS o
	LEFT JOIN $db_services AS m ON o.order_pid=m.item_id
	" . $where . "")->fetchColumn();

$sql = $db->query("SELECT * FROM $db_services_orders AS o
	LEFT JOIN $db_services AS m ON o.order_pid=m.item_id
	" . $where . "
	" . $order . "
	" . $query_limit . "");

$pagenav = cot_pagenav('admin', 'm=other&p=orderservices&status=' . $status, $d, $totalitems, $cfg['plugin']['orderservices']['ordersperpage']);

$t->assign(array(
	"PAGENAV_COUNT" => $totalitems,
	"PAGENAV_PAGES" => $pagenav['main'],
	"PAGENAV_PREV" => $pagenav['prev'],
	"PAGENAV_NEXT" => $pagenav['next'],
));

/* === Hook === */
$extp = cot_getextplugins('orderservices.admin.loop');
/* ===== */

while ($orderservice = $sql->fetch())
{
	$t->assign(cot_generate_servicestags($orderservice, 'ORDER_ROW_SERV_'));
	$t->assign(cot_generate_usertags($orderservice['order_seller'], 'ORDER_ROW_SELLER_'));

	if($orderservice['order_userid'] > 0)
	{
		$t->assign(cot_generate_usertags($orderservice['order_userid'], 'ORDER_ROW_CUSTOMER_'));
	}

	$t->assign(array(
		"ORDER_ROW_ID" => $orderservice['order_id'],
		"ORDER_ROW_URL" => cot_url('orderservices','m=order&id='.$orderservice['order_id']),
		"ORDER_ROW_COUNT" => $orderservice['order_count'],
		"ORDER_ROW_COST" => $orderservice['order_cost'],
		"ORDER_ROW_COMMENT" => $orderservice['order_text'],
		"ORDER_ROW_EMAIL" => $orderservice['order_email'],
		"ORDER_ROW_DATE" => $orderservice['order_date'],
		"ORDER_ROW_PAID" => $orderservice['order_paid'],
		"ORDER_ROW_STATUS" => $orderservice['order_status'],
		"ORDER_ROW_WARRANTYDATE" => $orderservice['order_paid'] + $cfg['services']['warranty']*60*60*24,
	));

	/* === Hook - Part2 : Include === */
	foreach ($extp as $pl)
	{
		include $pl;
	}
	/* ===== */

	$t->parse("MAIN.ORDER_ROW");
}

/* === Hook === */
foreach (cot_getextplugins('orderservices.admin.tags') as $pl)
{
	include $pl;
}
/* ===== */

$t->parse("MAIN");
$plugin_body .= $t->text("MAIN");
