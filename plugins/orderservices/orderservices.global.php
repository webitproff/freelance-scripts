<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=global
 * [END_COT_EXT]
 */

/**
 * orderservices plugin
 */

defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('orderservices', 'plug');
require_once cot_incfile('services', 'module');
require_once cot_incfile('payments', 'module');

// Проверяем платежки на оплату в маркете
if ($servicespays = cot_payments_getallpays('orderservices', 'paid'))
{
	foreach ($servicespays as $pay)
	{
		if (cot_payments_updatestatus($pay['pay_id'], 'done'))
		{
			$db->update($db_services_orders,  array('order_paid' => (int)$sys['now'], 'order_status' => 'paid'), "order_id=".(int)$pay['pay_code']);

			$orderservice = $db->query("SELECT * FROM $db_services_orders AS o
				LEFT JOIN $db_services AS m ON m.item_id=o.order_pid
				WHERE order_id=".$pay['pay_code'])->fetch();

			$seller = $db->query("SELECT * FROM $db_users WHERE user_id=".$orderservice['order_seller'])->fetch();
			if($orderservice['order_userid'] > 0)
			{
				$customer = $db->query("SELECT * FROM $db_users WHERE user_id=".$orderservice['order_userid'])->fetch();
			}
			else
			{
				$customer['user_name'] = $orderservice['order_email'];
				$customer['user_email'] = $orderservice['order_email'];
			}

			$summ = $orderservice['order_cost'] - $orderservice['order_cost']*$cfg['plugin']['orderservices']['tax']/100;

			// Уведопляем продавца о совершении покупки его товара
			$rsubject = cot_rc($L['orderservices_paid_mail_toseller_header'], array('order_id' => $orderservice['order_id'], 'product_title' => $orderservice['item_title']));
			$rbody = cot_rc($L['orderservices_paid_mail_toseller_body'], array(
				'user_name' => $customer['user_name'],
				'product_id' => $orderservice['item_id'],
				'product_title' => $orderservice['item_title'],
				'order_id' => $orderservice['order_id'],
				'summ' => $summ.' '.$cfg['payments']['valuta'],
				'tax' => $cfg['plugin']['orderservices']['tax'],
				'warranty' => $cfg['plugin']['orderservices']['warranty'],
				'sitename' => $cfg['maintitle'],
				'link' => COT_ABSOLUTE_URL . cot_url('orderservices', "id=" . $orderservice['order_id'], '', true)
			));
			cot_mail ($seller['user_email'], $rsubject, $rbody);

			// Уведопляем покупателя о совершении покупки
			if(!empty($orderservice['order_email']))
			{
				$key = sha1($orderservice['order_email'].'&'.$orderservice['order_id']);
			}

			$rsubject = cot_rc($L['orderservices_paid_mail_tocustomer_header'], array('order_id' => $orderservice['order_id'], 'product_title' => $orderservice['item_title']));
			$rbody = cot_rc($L['orderservices_paid_mail_tocustomer_body'], array(
				'user_name' => $customer['user_name'],
				'product_id' => $orderservice['item_id'],
				'product_title' => $orderservice['item_title'],
				'order_id' => $orderservice['order_id'],
				'cost' => $orderservice['order_cost'].' '.$cfg['payments']['valuta'],
				'tax' => $cfg['plugin']['orderservices']['tax'],
				'warranty' => $cfg['plugin']['orderservices']['warranty'],
				'sitename' => $cfg['maintitle'],
				'link' => COT_ABSOLUTE_URL . cot_url('orderservices', "id=" . $orderservice['order_id'] . '&key=' . $key, '', true)
			));
			cot_mail ($customer['user_email'], $rsubject, $rbody);

			/* === Hook === */
			foreach (cot_getextplugins('orderservices.order.paid') as $pl)
			{
				include $pl;
			}
			/* ===== */
		}
	}
}

if($cfg['plugin']['orderservices']['acceptzerocostorders']) {
	// Проверяем заказы с ценой 0 в маркете
	$orderservices = $db->query("SELECT * FROM $db_services_orders AS o
		LEFT JOIN $db_services AS m ON m.item_id=o.order_pid
		WHERE order_status='new' AND order_cost<=0")->fetchAll();
	foreach ($orderservices as $orderservice)
	{
		$db->update($db_services_orders,  array('order_paid' => (int)$sys['now'], 'order_status' => 'paid'), "order_id=".(int)$orderservice['order_id']);

		$seller = $db->query("SELECT * FROM $db_users WHERE user_id=".$orderservice['order_seller'])->fetch();
		if($orderservice['order_userid'] > 0)
		{
			$customer = $db->query("SELECT * FROM $db_users WHERE user_id=".$orderservice['order_userid'])->fetch();
		}
		else
		{
			$customer['user_name'] = $orderservice['order_email'];
			$customer['user_email'] = $orderservice['order_email'];
		}

		$summ = 0;

		// Уведопляем продавца о совершении покупки его товара
		$rsubject = cot_rc($L['orderservices_paid_mail_toseller_header'], array('order_id' => $orderservice['order_id'], 'product_title' => $orderservice['item_title']));
		$rbody = cot_rc($L['orderservices_paid_mail_toseller_body'], array(
			'user_name' => $customer['user_name'],
			'product_id' => $orderservice['item_id'],
			'product_title' => $orderservice['item_title'],
			'order_id' => $orderservice['order_id'],
			'summ' => $summ.' '.$cfg['payments']['valuta'],
			'tax' => $cfg['plugin']['orderservices']['tax'],
			'warranty' => $cfg['plugin']['orderservices']['warranty'],
			'sitename' => $cfg['maintitle'],
			'link' => COT_ABSOLUTE_URL . cot_url('orderservices', "id=" . $orderservice['order_id'], '', true)
		));
		cot_mail ($seller['user_email'], $rsubject, $rbody);

		// Уведопляем покупателя о совершении покупки
		if(!empty($orderservice['order_email']))
		{
			$key = sha1($orderservice['order_email'].'&'.$orderservice['order_id']);
		}

		$rsubject = cot_rc($L['orderservices_paid_mail_tocustomer_header'], array('order_id' => $orderservice['order_id'], 'product_title' => $orderservice['item_title']));
		$rbody = cot_rc($L['orderservices_paid_mail_tocustomer_body'], array(
			'user_name' => $customer['user_name'],
			'product_id' => $orderservice['item_id'],
			'product_title' => $orderservice['item_title'],
			'order_id' => $orderservice['order_id'],
			'cost' => $orderservice['order_cost'].' '.$cfg['payments']['valuta'],
			'tax' => $cfg['plugin']['orderservices']['tax'],
			'warranty' => $cfg['plugin']['orderservices']['warranty'],
			'sitename' => $cfg['maintitle'],
			'link' => COT_ABSOLUTE_URL . cot_url('orderservices', "id=" . $orderservice['order_id'] . '&key=' . $key, '', true)
		));
		cot_mail ($customer['user_email'], $rsubject, $rbody);

		/* === Hook === */
		foreach (cot_getextplugins('orderservices.order.paid') as $pl)
		{
			include $pl;
		}
		/* ===== */
	}
}

// Выплаты продавцам по завершению гарантийного срока по оформленным заказам
$warranty = $cfg['plugin']['orderservices']['warranty']*60*60*24;
$orderservices = $db->query("SELECT * FROM $db_services_orders AS o
	LEFT JOIN $db_services AS m ON m.item_id=o.order_pid
	WHERE order_status='paid' AND order_paid+".$warranty."<".$sys['now'])->fetchAll();
foreach ($orderservices as $orderservice)
{
	// Выплата продавцу на счет
	$seller = $db->query("SELECT * FROM $db_users WHERE user_id=".$orderservice['order_seller'])->fetch();

	if($orderservice['order_cost'] <= 0) {
		$rorder = array();
		$rorder['order_done'] = $sys['now'];
		$rorder['order_status'] = 'done';

		if($db->update($db_services_orders, $rorder, "order_id=".$orderservice['order_id']))
		{

		}

		/* === Hook === */
		foreach (cot_getextplugins('orderservices.order.done') as $pl)
		{
			include $pl;
		}
		/* ===== */

		continue;
	}

	$summ = $orderservice['order_cost'] - $orderservice['order_cost']*$cfg['plugin']['orderservices']['tax']/100;

	$payinfo['pay_userid'] = $orderservice['order_seller'];
	$payinfo['pay_area'] = 'balance';
	$payinfo['pay_code'] = 'orderservices:'.$orderservice['order_id'];
	$payinfo['pay_summ'] = $summ;
	$payinfo['pay_cdate'] = $sys['now'];
	$payinfo['pay_pdate'] = $sys['now'];
	$payinfo['pay_adate'] = $sys['now'];
	$payinfo['pay_status'] = 'done';
	$payinfo['pay_desc'] = cot_rc($L['orderservices_done_payments_desc'],
		array(
			'product_title' => $orderservice['item_title'],
			'order_id' => $orderservice['order_id']
		)
	);

	if($db->insert($db_payments, $payinfo))
	{
		// Уведомляем продавца о поступлении оплаты на его счет
		$rsubject = cot_rc($L['orderservices_done_mail_toseller_header'], array('order_id' => $orderservice['order_id'], 'product_title' => $orderservice['item_title']));
		$rbody = cot_rc($L['orderservices_done_mail_toseller_body'], array(
			'product_id' => $orderservice['item_id'],
			'product_title' => $orderservice['item_title'],
			'order_id' => $orderservice['order_id'],
			'summ' => $summ.' '.$cfg['payments']['valuta'],
			'tax' => $cfg['plugin']['orderservices']['tax'],
			'sitename' => $cfg['maintitle'],
			'link' => COT_ABSOLUTE_URL . cot_url('orderservices', "id=" . $orderservice['order_id'], '', true)
		));
		cot_mail ($seller['user_email'], $rsubject, $rbody);

		$rorder['order_done'] = $sys['now'];
		$rorder['order_status'] = 'done';

		if($db->update($db_services_orders, $rorder, "order_id=".$orderservice['order_id']))
		{
			if($cfg['plugin']['orderservices']['adminid'] > 0 && $cfg['plugin']['orderservices']['tax'] > 0)
			{
				$payinfo['pay_userid'] = $cfg['plugin']['orderservices']['adminid'];
				$payinfo['pay_area'] = 'balance';
				$payinfo['pay_code'] = 'orderservices:'.$orderservice['order_id'];
				$payinfo['pay_summ'] = $orderservice['order_cost']*$cfg['plugin']['orderservices']['tax']/100;
				$payinfo['pay_cdate'] = $sys['now'];
				$payinfo['pay_pdate'] = $sys['now'];
				$payinfo['pay_adate'] = $sys['now'];
				$payinfo['pay_status'] = 'done';
				$payinfo['pay_desc'] = cot_rc($L['orderservices_tax_payments_desc'],
					array(
						'product_title' => $orderservice['item_title'],
						'order_id' => $orderservice['order_id']
					)
				);

				$db->insert($db_payments, $payinfo);
			}
		}

		/* === Hook === */
		foreach (cot_getextplugins('orderservices.order.done') as $pl)
		{
			include $pl;
		}
		/* ===== */
	}
}
