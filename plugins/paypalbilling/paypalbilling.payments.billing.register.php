<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=payments.billing.register
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
defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('paypalbilling', 'plug');

$cot_billings['paypal'] = array(
	'plug' => 'paypalbilling',
	'title' => $L['paypalbilling_title'],
	'icon' => $cfg['plugins_dir'] . '/paypalbilling/images/paypal.png'
);

?>