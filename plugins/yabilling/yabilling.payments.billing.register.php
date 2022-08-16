<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=payments.billing.register
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
defined('COT_CODE') or die('Wrong URL.');

require_once cot_incfile('yabilling', 'plug');

$cot_billings['yabilling'] = array(
	'plug' => 'yabilling',
	'title' => $L['yabilling_title'],
	'icon' => $cfg['plugins_dir'] . '/yabilling/images/io.svg',
  'extra' => array(),
);

if($cfg['plugin']['yabilling']['typechoise']) {
  $cot_billings['yabilling']['extra'][] = array(
    'title' => $L['yabilling_title'],
    'variants' => array(
      array(
        'active' => 1,
        'code' => 'PC',
        'operator' => '',
        'title' => $L['yabilling_paymenttype_yandex'],
        'img' => 'plugins/yabilling/images/io.svg',
      ),
      array(
        'active' => 1,
        'code' => 'AC',
        'operator' => '',
        'title' => $L['yabilling_paymenttype_card'],
        'img' => 'plugins/unitpay/images/card.svg',
      )
    )
  );
}

?>