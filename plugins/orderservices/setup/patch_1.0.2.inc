<?php
/**
 * 1.0.2
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('services', 'module');
require_once cot_incfile('orderservices', 'plug');

global $db_services_orders, $db_services, $cfg;

if (!$db->fieldExists($db_services_orders, "order_seller"))
{
	$db->query("ALTER TABLE `$db_services_orders` ADD COLUMN `order_seller` int(11) NOT NULL");
}

$orderservices = $db->query("SELECT * FROM $db_services_orders AS o
	LEFT JOIN $db_services AS m ON m.item_id=o.order_pid
	WHERE 1")->fetchAll();
foreach ($orderservices as $orderservice)
{
	if($orderservice['item_userid'] > 0)
	{
		$db->update($db_services_orders, array('order_seller' => $orderservice['item_userid']), 'order_id='.$orderservice['order_id']);
	}
}
