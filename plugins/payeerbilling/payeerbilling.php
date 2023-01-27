<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=standalone
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
defined('COT_CODE') && defined('COT_PLUG') or die('Wrong URL');

require_once cot_incfile('payeerbilling', 'plug');
require_once cot_incfile('payments', 'module');

$m = cot_import('m', 'G', 'ALP');
$pid = cot_import('pid', 'G', 'INT');

if (empty($m))
{
	// Получаем информацию о заказе
	if (!empty($pid) && $pinfo = cot_payments_payinfo($pid))
	{
		cot_block($usr['id'] == $pinfo['pay_userid']);
		cot_block($pinfo['pay_status'] == 'new' || $pinfo['pay_status'] == 'process');

		$amount = $pinfo['pay_summ']*$cfg['plugin']['payeerbilling']['rate'];
		$amount = number_format($amount, 2, '.', '');
		
		$arHash = array(
			$cfg['plugin']['payeerbilling']['shop'],
			$pid,
			$amount,
			$cfg['plugin']['payeerbilling']['curr'],
			base64_encode($pinfo['pay_desc']),
			$cfg['plugin']['payeerbilling']['key']
		);
		$sign = strtoupper(hash('sha256', implode(':', $arHash)));

		$payeer_form = "<form id=\"payeerform\" method=\"GET\" action=\"//payeer.com/merchant/\">
			<input type=\"hidden\" name=\"m_shop\" value=\"".$cfg['plugin']['payeerbilling']['shop']."\">
			<input type=\"hidden\" name=\"m_orderid\" value=\"".$pid."\">
			<input type=\"hidden\" name=\"m_amount\" value=\"".$amount."\">
			<input type=\"hidden\" name=\"m_curr\" value=\"".$cfg['plugin']['payeerbilling']['curr']."\">
			<input type=\"hidden\" name=\"m_desc\" value=\"".base64_encode($pinfo['pay_desc'])."\">
			<input type=\"hidden\" name=\"m_sign\" value=\"".$sign."\">
			<input type=\"submit\" name=\"m_process\" value=\"".$L['payeerbilling_formbuy']."\" class=\"btn btn-success btn-large\">
			</form>";

		$t->assign(array(
			'BILLING_FORM' => $payeer_form,
		));
		$t->parse("MAIN.BILLINGFORM");
		
		cot_payments_updatestatus($pid, 'process'); // Изменяем статус "в процессе оплаты"
	}
	else
	{
		cot_die();
	}
}
elseif ($m == 'success')
{
	$m_orderid = cot_import('m_orderid', 'G', 'INT');
	if (!empty($m_orderid))
	{
		$pinfo = cot_payments_payinfo($m_orderid);
		if ($pinfo['pay_status'] == 'done')
		{
			$plugin_body = $L['payeerbilling_error_done'];
			$redirect = $pinfo['pay_redirect'];
		}
		elseif ($pinfo['pay_status'] == 'paid')
		{
			$plugin_body = $L['payeerbilling_error_paid'];
		}
	}
	
	$t->assign(array(
		"BILLING_TITLE" => $L['payeerbilling_error_title'],
		"BILLING_ERROR" => $L['payeerbilling_error_paid']
	));
	
	if($redirect){
		$t->assign(array(
			"BILLING_REDIRECT_TEXT" => sprintf($L['payeerbilling_redirect_text'], $redirect),
			"BILLING_REDIRECT_URL" => $redirect,
		));
	}
	
	$t->parse("MAIN.ERROR");
}
elseif ($m == 'fail')
{
	$t->assign(array(
		"BILLING_TITLE" => $L['payeerbilling_error_title'],
		"BILLING_ERROR" => $L['payeerbilling_error_fail']
	));
	$t->parse("MAIN.ERROR");
}
?>