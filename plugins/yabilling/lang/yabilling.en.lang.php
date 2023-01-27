<?php
/**
 * yabilling plugin
 *
 * @package yabilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright Copyright (c) CMSWorks Team 2013
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */

$L['info_desc'] = 'Payment plugin Yandex.Money';

$L['cfg_yandex_num'] = array('Yandex.money number', '');
$L['cfg_secret_key'] = array('Secret key', '');
$L['cfg_rate'] = array('Exchange rate', '');
$L['cfg_typechoise'] = array('Switch payment type choise', '');

$L['yabilling_title'] = 'Yandex.Money';

$L['yabilling_paymenttype_yandex'] = 'Yandex.Money';
$L['yabilling_paymenttype_card'] = 'Card';

$L['yabilling_formtext'] = 'Now you will be redirected to the payment system Yandex.Money for payment. If not, click the "Go to payment".';
$L['yabilling_formtext1'] = 'After clicking on "Go to payment" you will be redirected to the payment system Yandex.Money for payment.';
$L['yabilling_formbuy'] = 'Go to payment';
$L['yabilling_error_paid'] = 'Payment was successful. In the near future the service will be activated!';
$L['yabilling_error_done'] = 'Payment was successful.';
$L['yabilling_error_incorrect'] = 'The signature is incorrect!';
$L['yabilling_error_otkaz'] = 'Failure to pay.';
$L['yabilling_error_title'] = 'Result of the operation of payment';
$L['yabilling_error_fail'] = 'Payment is not made! Please try again. If the problem persists, contact your site administrator';

$L['yabilling_redirect_text'] = 'Now will redirect to the page of the paid services. If it does not, click <a href="%1$s">here</a>.';