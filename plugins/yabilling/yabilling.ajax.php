<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=ajax
 * [END_COT_EXT]
 */
/**
 * Yandex money billing Plugin
 *
 * @package yabilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright (c) CMSWorks Team 2013
 * @license BSD
 */
defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('payments', 'module');

$status_data = $_POST;

$notification_secret = $cfg['plugin']['yabilling']['secret_key'];

$par_string = $status_data['notification_type'] . '&' .
		$status_data['operation_id'] . '&' .
		$status_data['amount'] . '&' .
		$status_data['currency'] . '&' .
		$status_data['datetime'] . '&' .
		$status_data['sender'] . '&' .
		$status_data['codepro'] . '&' .
		$notification_secret . '&' .
		$status_data['label'];

$sha1_hash = sha1($par_string);

if ($sha1_hash == $status_data['sha1_hash'] && !$status_data['test_notification'])
{
	$pinfo = $db->query("SELECT * FROM $db_payments
		WHERE pay_id='" . (int)$status_data['label'] . "' 
			AND pay_status='process'")->fetch();

	if(empty($pinfo))
	{
		header ( 'HTTP/1.1 302' );
	}
	else
	{	
		$amount = number_format($pinfo['pay_summ']*$cfg['plugin']['yabilling']['rate'], 2, '.', '');
		if($status_data['withdraw_amount'] == $amount)
		{
			if(cot_payments_updatestatus($status_data['label'], 'paid'))
			{
				header ( 'HTTP/1.1 200' );
			}
			else
			{
				header ( 'HTTP/1.1 302' );
			}
		}
		else
		{
			header ( 'HTTP/1.1 302' );
		}
	}
}
elseif($status_data['test_notification'])
{
	header ( 'HTTP/1.1 200' );
}	
else
{
	header ( 'HTTP/1.1 302' );
}

?>