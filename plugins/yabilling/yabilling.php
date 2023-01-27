<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=standalone
 * [END_COT_EXT]
 */
/**
 * Yandex money billing Plugin
 *
 * @package yabilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks
 * @license BSD
 */
defined('COT_CODE') && defined('COT_PLUG') or die('Wrong URL');

require_once cot_incfile('yabilling', 'plug');
require_once cot_incfile('payments', 'module');

$m = cot_import('m', 'G', 'ALP');
$pid = cot_import('pid', 'G', 'INT');

$paymentType = cot_import('paymentType', 'G', 'TXT');

if (empty($m))
{
	// Получаем информацию о заказе
	if (!empty($pid) && $pinfo = cot_payments_payinfo($pid))
	{
		cot_block($usr['id'] == $pinfo['pay_userid']);
		cot_block($pinfo['pay_status'] == 'new' || $pinfo['pay_status'] == 'process');

		$out_summ = number_format($pinfo['pay_summ']*$cfg['plugin']['yabilling']['rate'], 2, '.', '');
		$inv_id = $pid;
		$inv_desc = $pinfo['pay_desc'];
		$inv_desc2 = $pinfo['pay_desc'];
		
    if(!empty($paymentType) && in_array($paymentType, array('PC', 'AC'))) {
      $payment_type_choise = "<input type=\"hidden\" name=\"paymentType\" value=\"".$paymentType."\">";
      $cfg['plugin']['yabilling']['typechoise'] = 0;
    }

		if($cfg['plugin']['yabilling']['typechoise']){
			$payment_type_choise = "<label><input type=\"radio\" name=\"paymentType\"".(($paymentType == 'PC' || !in_array($paymentType, array('PC', 'AC'))) ? " checked=\"checked\"" : '')." value=\"PC\"> ".$L['yabilling_paymenttype_yandex']."</label><br/>
				<label><input type=\"radio\" name=\"paymentType\"".($paymentType == 'AC' ? " checked=\"checked\"" : '')." value=\"AC\"> ".$L['yabilling_paymenttype_card']."</label><br/><br/>";
		}
		
		$yandex_form = "<form id=yandexform action=\"https://money.yandex.ru/quickpay/confirm.xml\" method=\"POST\">
					<input type=\"hidden\" value=\"".$cfg['plugin']['yabilling']['yandex_num']."\" name=\"receiver\">
					<input type=\"hidden\" value=\"".$inv_id."\" name=\"label\">
					<input type=\"hidden\" value=\"".$inv_desc."\" name=\"FormComment\">
					<input type=\"hidden\" value=\"".$inv_desc."\" name=\"short-dest\">
					<input type=\"hidden\" name=\"quickpay-form\" value=\"shop\">
					<input type=\"hidden\" value=\"false\" name=\"writable-targets\">
					<input type=\"hidden\" value=\"false\" name=\"writable-sum\">
					<input type=\"hidden\" value=\"false\" name=\"comment-needed\">
					<input type=\"hidden\" value=\"".$inv_desc2."\" name=\"targets\">
					<input type=\"hidden\" value=\"".$out_summ."\" name=\"sum\">
					<input type=\"hidden\" value=\"".$cfg['mainurl']."/index.php?e=yabilling&m=success\" name=\"successUrl\">
					<input type=\"hidden\" value=\"".$cfg['mainurl']."/index.php?e=yabilling&m=fail\" name=\"failUrl\">
					".$payment_type_choise."
					<input type=\"submit\" value=\"".$L['yabilling_formbuy']."\" class=\"btn btn-success btn-large uk-button uk-button-success uk-margin\">
				</form>";

		$t->assign(array(
			'BILLING_FORM' => $yandex_form,
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
	$t->assign(array(
		"BILLING_TITLE" => $L['yabilling_error_title'],
		"BILLING_ERROR" => $L['yabilling_error_paid']
	));
	
	$t->parse("MAIN.ERROR");
}
elseif ($m == 'fail')
{
	$t->assign(array(
		"BILLING_TITLE" => $L['yabilling_error_title'],
		"BILLING_ERROR" => $L['yabilling_error_fail']
	));
	$t->parse("MAIN.ERROR");
}
?>