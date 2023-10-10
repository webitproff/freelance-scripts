<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=ajax
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
defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('payments', 'module');

$status_data = $_POST;
$pid = $status_data['item_number'];

$url = (!$cfg['plugin']['paypalbilling']['testmode']) ? 'https://www.paypal.com/cgi-bin/webscr' : 'https://www.sandbox.paypal.com/cgi-bin/webscr';

$postdata = "";
foreach ($status_data as $key=>$value) $postdata.=$key."=".urlencode($value)."&";
$postdata .= "cmd=_notify-validate"; 
$curl = curl_init($url);
curl_setopt ($curl, CURLOPT_HEADER, 0); 
curl_setopt ($curl, CURLOPT_POST, 1);
curl_setopt ($curl, CURLOPT_POSTFIELDS, $postdata);
curl_setopt ($curl, CURLOPT_SSL_VERIFYPEER, 0); 
curl_setopt ($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt ($curl, CURLOPT_SSL_VERIFYHOST, 1);
$response = curl_exec ($curl);
curl_close ($curl);

if ($response != "VERIFIED" || $status_data['receiver_email'] != $cfg['plugin']['paypalbilling']['email'] || $status_data["txn_type"] != "web_accept")
{
	cot_die();
}

if (!empty($pid) && $pinfo = cot_payments_payinfo($pid))
{
	$amount = number_format($pinfo['pay_summ']*$cfg['plugin']['paypalbilling']['rate'], 2, '.', '');
	if($status_data['mc_gross'] == $amount  && $status_data['mc_currency'] == $cfg['plugin']['paypalbilling']['currency'])
	{
		cot_payments_updatestatus($pid, 'paid');
	}	
	else
	{
		cot_die();
	}
}	
else
{
	cot_die();
}
