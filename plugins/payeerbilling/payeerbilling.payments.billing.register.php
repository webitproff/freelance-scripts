<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=payments.billing.register
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
defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('payeerbilling', 'plug');

$cot_billings['payeer'] = array(
	'plug' => 'payeerbilling',
	'title' => $L['payeerbilling_title'],
	'icon' => $cfg['plugins_dir'] . '/payeerbilling/images/payeer.png'
);

?>