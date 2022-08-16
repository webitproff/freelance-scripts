<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=servicestags.main
 * [END_COT_EXT]
 */

/**
 * orderservices plugin
 */

defined('COT_CODE') or die('Wrong URL');

global $db_services_orders;

$key = cot_import('key', 'G', 'TXT');

$orderservice = $db->query("SELECT * FROM $db_services_orders  AS o
	LEFT JOIN $db_services AS m ON m.item_id=o.order_pid
	WHERE order_pid=".$item_data['item_id']." AND order_status!='new' AND order_userid=".$usr['id']." LIMIT 1")->fetch();

if(!empty($key)){
	$hash = sha1($orderservice['order_email'].'&'.$orderservice['order_id']);
}
if ($orderservice && ($usr['id'] > 0 || $usr['id'] == 0 && !empty($key) && $key == $hash)){
	$temp_array['ORDER_ID'] = $orderservice['order_id'];
	$temp_array['ORDER_URL'] = cot_url('orderservices', 'id='.$orderservice['order_id'].'&key='.$key);
	$temp_array['ORDER_COUNT'] = $orderservice['order_count'];
	$temp_array['ORDER_COST'] = $orderservice['order_cost'];
	$temp_array['ORDER_TITLE'] = $orderservice['order_title'];
	$temp_array['ORDER_COMMENT'] = $orderservice['order_text'];
	$temp_array['ORDER_EMAIL'] = $orderservice['order_email'];
	$temp_array['ORDER_PAID'] = $orderservice['order_paid'];
	$temp_array['ORDER_DONE'] = $orderservice['order_done'];
	$temp_array['ORDER_STATUS'] = $orderservice['order_status'];
	$temp_array['ORDER_DOWNLOAD'] = (in_array($orderservice['order_status'], array('paid', 'done')) && !empty($orderservice['item_file']) && file_exists($cfg['plugin']['orderservices']['filepath'].'/'.$orderservice['item_file'])) ? cot_url('plug', 'r=orderservices&m=download&id='.$orderservice['order_id'].'&key='.$key) : '';
	$temp_array['ORDER_LOCALSTATUS'] = $L['orderservices_status_'.$orderservice['order_status']];
	$temp_array['ORDER_WARRANTYDATE'] = $orderservice['order_paid'] + $cfg['plugin']['orderservices']['warranty']*60*60*24;
}