<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=ajax
 * [END_COT_EXT]
 */
/**
 * Payeer billing Plugin
 *
 * @package payeerbilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks Team 2015
 * @license BSD
 */
defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('payments', 'module');

if (isset($_POST['m_operation_id']) && isset($_POST['m_sign']))
{
	$m_key = $cfg['plugin']['payeerbilling']['key'];
	$arHash = array($_POST['m_operation_id'],
			$_POST['m_operation_ps'],
			$_POST['m_operation_date'],
			$_POST['m_operation_pay_date'],
			$_POST['m_shop'],
			$_POST['m_orderid'],
			$_POST['m_amount'],
			$_POST['m_curr'],
			$_POST['m_desc'],
			$_POST['m_status'],
			$m_key);
	$sign_hash = strtoupper(hash('sha256', implode(':', $arHash)));
	if ($_POST['m_sign'] == $sign_hash && $_POST['m_status'] == 'success')
	{
		if(cot_payments_updatestatus($_POST['m_orderid'], 'paid'))
		{
			echo $_POST['m_orderid'].'|success';
		}else{
			echo $_POST['m_orderid'].'|error';
		}
	}
	echo $_POST['m_orderid'].'|error';
}