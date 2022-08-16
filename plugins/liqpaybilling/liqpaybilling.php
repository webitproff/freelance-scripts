<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=standalone
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
defined('COT_CODE') && defined('COT_PLUG') or die('Wrong URL');

require_once cot_incfile('liqpaybilling', 'plug');
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
		
		$private_key = $cfg['plugin']['liqpaybilling']['signature'];
		$public_key = $cfg['plugin']['liqpaybilling']['merchant_id'];
		$currency = $cfg['plugin']['liqpaybilling']['currency'];
		$amount = number_format($pinfo['pay_summ']*$cfg['plugin']['liqpaybilling']['rate'], 2, '.', '');
		$result_url = $cfg['mainurl']."/".cot_url('liqpaybilling', "m=result");
		$server_url = $cfg['mainurl']."/".cot_url('index','r=liqpaybilling');
		
		$sign = base64_encode(sha1($private_key.$amount.$currency.$public_key.$pid.'buy'.$pinfo['pay_desc'].$result_url.$server_url, 1));
		
		$liqpay_form = "<form id=\"liqpayform\" method=\"POST\" action=\"https://www.liqpay.ua/api/pay\" accept-charset=\"utf-8\">
			<input type=\"hidden\" name=\"public_key\" value=\"".$public_key."\" />
			<input type=\"hidden\" name=\"amount\" value=\"".$amount."\" />
			<input type=\"hidden\" name=\"currency\" value=\"".$currency."\" />
			<input type=\"hidden\" name=\"description\" value=\"".$pinfo['pay_desc']."\" />
			<input type=\"hidden\" name=\"order_id\" value=\"".$pid."\" />
			<input type=\"hidden\" name=\"result_url\" value=\"".$result_url."\" />
			<input type=\"hidden\" name=\"server_url\" value=\"".$server_url."\" />  
			<input type=\"hidden\" name=\"type\" value=\"buy\" />
			<input type=\"hidden\" name=\"signature\" value=\"".$sign."\" />
			<input type=\"hidden\" name=\"language\" value=\"ru\" />
			<input type=\"hidden\" name=\"sandbox\" value=\"".$cfg['plugin']['liqpaybilling']['testmode']."\" />
			<input type=\"submit\" class=\"btn btn-success\" value=\"".$L['liqpaybilling_formbuy']."\"/>
		  </form>";
		
		$t->assign(array(
			'BILLING_FORM' => $liqpay_form,
		));
		$t->parse("MAIN.BILLINGFORM");
		
		cot_payments_updatestatus($pid, 'process'); // Изменяем статус "в процессе оплаты"
	}
	else
	{
		cot_die();
	}
}
elseif ($m == 'result')
{
	$plugin_body = $L['liqpaybilling_error_wait'];

	$t->assign(array(
		"BILLING_TITLE" => $L['liqpaybilling_error_title'],
		"BILLING_ERROR" => $plugin_body
	));
	$t->parse("MAIN.ERROR");
}
elseif ($m == 'fail')
{
	$t->assign(array(
		"BILLING_TITLE" => $L['liqpaybilling_error_title'],
		"BILLING_ERROR" => $L['liqpaybilling_error_fail']
	));
	$t->parse("MAIN.ERROR");
}
?>