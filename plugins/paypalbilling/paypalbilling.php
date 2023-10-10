<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=standalone
 * [END_COT_EXT]
 */
/**
 * paypal billing Plugin
 *
 * @package paypalbilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks Team 2013
 * @license BSD
 */
defined('COT_CODE') && defined('COT_PLUG') or die('Wrong URL');

require_once cot_incfile('paypalbilling', 'plug');
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
		
		$merchant_id = $cfg['plugin']['paypalbilling']['merchant_id'];
		$signature = $cfg['plugin']['paypalbilling']['signature'];
		
		$amount = number_format($pinfo['pay_summ']*$cfg['plugin']['paypalbilling']['rate'], 2, '.', '');
		
		$url = (!$cfg['plugin']['paypalbilling']['testmode']) ? 'https://www.paypal.com/cgi-bin/webscr' : 'https://www.sandbox.paypal.com/cgi-bin/webscr';
		
		$paypal_form = "<form id=\"paypalform\" action=\"".$url."\" method=\"post\">
			<input type=\"hidden\" name=\"cmd\" value=\"_xclick\" />
			<input type=\"hidden\" name=\"charset\" value=\"utf-8\" />
			<input type=\"hidden\" name=\"business\" value=\"".$cfg['plugin']['paypalbilling']['email']."\" />
			<input type=\"hidden\" name=\"item_name\" value=\"".$pinfo['pay_desc']."\" />
			<input type=\"hidden\" name=\"item_number\" value=\"".$pid."\" />
			<input type=\"hidden\" name=\"amount\" value=\"".$amount."\" />
			<input type=\"hidden\" name=\"currency_code\" value=\"".$cfg['plugin']['paypalbilling']['currency']."\" />
			<input type=\"hidden\" name=\"return\" value=\"".$cfg['mainurl']."/".cot_url('paypalbilling', 'm=return')."\" />
			<input type=\"hidden\" name=\"cancel_return\" value=\"".$cfg['mainurl']."/".cot_url('paypalbilling', 'm=cancel')."\" />
			<input type=\"hidden\" name=\"notify_url\" value=\"".$cfg['mainurl']."/index.php?r=paypalbilling\" />
			<button class=\"btn btn-success\" type=\"submit\">".$L['paypalbilling_formbuy']."</button>
			</p>
		</form>";

		$t->assign(array(
			'BILLING_FORM' => $paypal_form,
		));
		$t->parse("MAIN.BILLINGFORM");
		
		cot_payments_updatestatus($pid, 'process'); // Изменяем статус "в процессе оплаты"
	}
	else
	{
		cot_die();
	}
}
elseif ($m == 'return')
{
	$t->assign(array(
		"BILLING_TITLE" => $L['paypalbilling_error_title'],
		"BILLING_ERROR" => $plugin_body
	));
	$t->parse("MAIN.ERROR");
}
elseif ($m == 'cancel')
{
	$t->assign(array(
		"BILLING_TITLE" => $L['paypalbilling_error_title'],
		"BILLING_ERROR" => $L['paypalbilling_error_cancel']
	));
	$t->parse("MAIN.ERROR");
}
?>