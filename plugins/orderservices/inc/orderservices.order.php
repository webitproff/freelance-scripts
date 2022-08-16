<?php

/**
 * orderservices plugin
 *
 * @package orderservices
 * @version 1.0.0
 * @author CMSWorks Team
 * @copyright Copyright (c) CMSWorks.ru
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL');

$id = cot_import('id', 'G', 'INT');
$key = cot_import('key', 'G', 'TXT');

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('plug', 'orderservices');
cot_block($usr['auth_read']);

if ($id > 0)
{
	$sql = $db->query("SELECT * FROM $db_services_orders  AS o
		LEFT JOIN $db_services AS m ON m.item_id=o.order_pid
		WHERE ".(!$cfg['plugin']['orderservices']['showneworderswithoutpayment'] ? "order_status!='new' AND" : "")." order_id=".$id." LIMIT 1");
}

if (!$id || !$sql || $sql->rowCount() == 0)
{
	cot_die_message(404, TRUE);
}
$orderservice = $sql->fetch();

cot_block($usr['isadmin'] || $usr['id'] == $orderservice['order_userid'] || $usr['id'] == $orderservice['order_seller'] || !empty($key) && $usr['id'] == 0);

if($usr['id'] == 0)
{
	$hash = sha1($orderservice['order_email'].'&'.$orderservice['order_id']);
	cot_block($key == $hash);
}

/* === Hook === */
$extp = cot_getextplugins('orderservices.order.first');
foreach ($extp as $pl)
{
	include $pl;
}
/* ===== */

$out['subtitle'] = $L['orderservices_title'];
$out['head'] .= $R['code_noindex'];

$mskin = cot_tplfile(array('orderservices', 'order', $structure['services'][$orderservice['item_cat']]['tpl']), 'plug');

/* === Hook === */
foreach (cot_getextplugins('orderservices.order.main') as $pl)
{
	include $pl;
}
/* ===== */

$t = new XTemplate($mskin);

$catpatharray[] = array(cot_url('services'), $L['services']);
//$catpatharray = array_merge($catpatharray, cot_structure_buildpath('services', $item['item_cat']));
//$catpatharray[] = array(cot_url('services', 'id='.$id), $orderservice['item_title']);
$catpatharray[] = array('', $L['orderservices_title']);

$catpath = cot_breadcrumbs($catpatharray, $cfg['homebreadcrumb'], true);

$t->assign(array(
	"BREADCRUMBS" => $catpath,
));

// Error and message handling
cot_display_messages($t);

$t->assign(cot_generate_servicestags($orderservice['order_pid'], 'ORDER_SERV_', $cfg['services']['shorttextlen'], $usr['isadmin'], $cfg['homebreadcrumb']));
$t->assign(cot_generate_usertags($orderservice['order_seller'], 'ORDER_SELLER_'));
$t->assign(cot_generate_usertags($orderservice['order_userid'], 'ORDER_CUSTOMER_'));

$t->assign(array(
	"ORDER_ID" => $orderservice['order_id'],
	"ORDER_COUNT" => $orderservice['order_count'],
	"ORDER_COST" => $orderservice['order_cost'],
	"ORDER_TITLE" => $orderservice['order_title'],
	"ORDER_COMMENT" => $orderservice['order_text'],
	"ORDER_EMAIL" => $orderservice['order_email'],
	"ORDER_PAID" => $orderservice['order_paid'],
	"ORDER_DONE" => $orderservice['order_done'],
	"ORDER_STATUS" => $orderservice['order_status'],
	"ORDER_DOWNLOAD" => (in_array($orderservice['order_status'], array('paid', 'done')) && !empty($orderservice['item_file']) && file_exists($cfg['plugin']['orderservices']['filepath'].'/'.$orderservice['item_file'])) ? cot_url('plug', 'r=orderservices&m=download&id='.$orderservice['order_id'].'&key='.$key) : '',
	"ORDER_LOCALSTATUS" => $L['orderservices_status_'.$orderservice['order_status']],
	"ORDER_WARRANTYDATE" => $orderservice['order_paid'] + $cfg['plugin']['orderservices']['warranty']*60*60*24,
));

if($orderservice['order_status'] == 'claim')
{
	$t->assign(array(
		"CLAIM_DATE" => $orderservice['order_claim'],
		"CLAIM_TEXT" => $orderservice['order_claimtext'],
	));

	/* === Hook === */
	foreach (cot_getextplugins('orderservices.order.claim') as $pl)
	{
		include $pl;
	}
	/* ===== */

	if($usr['isadmin'])
	{
		// Отменяем заказ, возвращаем оплату покупателю
		if($a == 'acceptclaim')
		{
			$rorder['order_cancel'] = $sys['now'];
			$rorder['order_status'] = 'cancel';

			if($db->update($db_services_orders, $rorder, 'order_id='.$id))
			{
				if($orderservice['order_userid'] > 0)
				{
					$payinfo['pay_userid'] = $orderservice['order_userid'];
					$payinfo['pay_area'] = 'balance';
					$payinfo['pay_code'] = 'services:'.$orderservice['order_id'];
					$payinfo['pay_summ'] = $orderservice['order_cost'];
					$payinfo['pay_cdate'] = $sys['now'];
					$payinfo['pay_pdate'] = $sys['now'];
					$payinfo['pay_adate'] = $sys['now'];
					$payinfo['pay_status'] = 'done';
					$payinfo['pay_desc'] = cot_rc($L['orderservices_claim_payments_customer_desc'],
						array(
							'product_title' => $orderservice['item_title'],
							'order_id' => $orderservice['order_id']
						)
					);

					$db->insert($db_payments, $payinfo);
				}

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

				// Уведопляем продавца об отмене заказа
				$rsubject = cot_rc($L['orderservices_acceptclaim_mail_toseller_header'], array('order_id' => $orderservice['order_id'], 'product_title' => $orderservice['item_title']));
				$rbody = cot_rc($L['orderservices_acceptclaim_mail_toseller_body'], array(
					'product_id' => $orderservice['item_id'],
					'product_title' => $orderservice['item_title'],
					'order_id' => $orderservice['order_id'],
					'sitename' => $cfg['maintitle'],
					'link' => COT_ABSOLUTE_URL . cot_url('orderservices', "id=" . $orderservice['order_id'], '', true)
				));
				cot_mail ($seller['user_email'], $rsubject, $rbody);

				// Уведопляем покупателя об отмене заказа
				$rsubject = cot_rc($L['orderservices_acceptclaim_mail_tocustomer_header'], array('order_id' => $orderservice['order_id'], 'product_title' => $orderservice['item_title']));
				$rbody = cot_rc($L['orderservices_acceptclaim_mail_tocustomer_body'], array(
					'product_id' => $orderservice['item_id'],
					'product_title' => $orderservice['item_title'],
					'order_id' => $orderservice['order_id'],
					'sitename' => $cfg['maintitle'],
					'link' => COT_ABSOLUTE_URL . cot_url('orderservices', "id=" . $orderservice['order_id'], '', true)
				));

				/* === Hook === */
				foreach (cot_getextplugins('orderservices.order.acceptclaim.done') as $pl)
				{
					include $pl;
				}
				/* ===== */

				cot_mail ($customer['user_email'], $rsubject, $rbody);

				cot_redirect(cot_url('orderservices', 'm=order&id=' . $id, '', true));
				exit;
			}

			cot_redirect(cot_url('orderservices', 'm=order&id=' . $id, '', true));
			exit;
		}

		// Отменяем жалобу
		if($a == 'cancelclaim')
		{
			$rorder['order_claim'] = 0;
			$rorder['order_status'] = 'paid';

			if($db->update($db_services_orders, $rorder, 'order_id='.$id))
			{
				$customer = $db->query("SELECT * FROM $db_users WHERE user_id=".$orderservice['order_userid'])->fetch();

				// Уведопляем покупателя об отклонении жалобы
				$rsubject = cot_rc($L['orderservices_cancelclaim_mail_tocustomer_header'], array('order_id' => $orderservice['order_id'], 'product_title' => $orderservice['item_title']));
				$rbody = cot_rc($L['orderservices_cancelclaim_mail_tocustomer_body'], array(
					'product_title' => $orderservice['item_title'],
					'order_id' => $orderservice['order_id'],
					'sitename' => $cfg['maintitle'],
					'link' => COT_ABSOLUTE_URL . cot_url('orderservices', "id=" . $orderservice['order_id'], '', true)
				));

				/* === Hook === */
				foreach (cot_getextplugins('orderservices.order.cancelclaim.done') as $pl)
				{
					include $pl;
				}
				/* ===== */

				cot_mail ($customer['user_email'], $rsubject, $rbody);
			}

			cot_redirect(cot_url('orderservices', 'm=order&id=' . $id, '', true));
			exit;
		}

		$t->parse('MAIN.CLAIM.ADMINCLAIM');
	}
	$t->parse('MAIN.CLAIM');
}

/* === Hook === */
foreach (cot_getextplugins('orderservices.order.tags') as $pl)
{
	include $pl;
}
/* ===== */
