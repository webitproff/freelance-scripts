<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=ajax
 * [END_COT_EXT]
 */
/**
 * liqpay billing Plugin
 *
 * @package liqpaybilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks Team 2013
 * @license BSD
 */
defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('payments', 'module');
$public_key		 	= $_POST['public_key'];
$amount				= $_POST['amount'];
$currency			= $_POST['currency'];
$description		= $_POST['description'];
$order_id			= $_POST['order_id'];
$type				= $_POST['type'];
$signature			= $_POST['signature'];
$status				= $_POST['status'];
$transaction_id		= $_POST['transaction_id'];
$sender_phone		= $_POST['sender_phone']; 

$sign = base64_encode(sha1($cfg['plugin']['liqpaybilling']['signature'].$amount.$currency.$public_key.$order_id.$type.$description.$status.$transaction_id.$sender_phone, 1));

if ($signature == $sign)
{
	if(!empty($order_id) && ($status == 'success' && !$cfg['plugin']['liqpaybilling']['testmode'] || $status == 'sandbox' && $cfg['plugin']['liqpaybilling']['testmode']))
	{
		cot_payments_updatestatus($order_id, 'paid');
	}
}

?>