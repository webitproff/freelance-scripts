<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=payments.billing.register
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
defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('liqpaybilling', 'plug');

$cot_billings['liqpay'] = array(
	'plug' => 'liqpaybilling',
	'title' => $L['liqpaybilling_title'],
	'icon' => $cfg['plugins_dir'] . '/liqpaybilling/images/liqpay.png'
);

?>