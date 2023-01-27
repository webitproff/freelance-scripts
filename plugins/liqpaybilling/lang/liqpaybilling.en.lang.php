<?php
/**
 * liqpaybilling plugin
 *
 * @package liqpaybilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright Copyright (c) CMSWorks Team 2013
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */

$L['info_desc'] = 'Payment plugin LiqPay';

$L['cfg_merchant_id'] = array('Merchant', '');
$L['cfg_signature'] = array('Signature', '');
$L['cfg_currency'] = array('Currency code (UAH,USD,RUR,EUR)', '');
$L['cfg_rate'] = array('Exchange rate', '');
$L['cfg_testmode'] = array('Test mode', '');

$L['liqpaybilling_title'] = 'LiqPay';

$L['liqpaybilling_formtext'] = 'Now you will be redirected to the payment system LiqPay for payment. If not, click the "Go to payment".';
$L['liqpaybilling_formbuy'] = 'Go to payment';
$L['liqpaybilling_error_paid'] = 'Payment was successful. In the near future the service will be activated!';
$L['liqpaybilling_error_wait'] = 'Payment is by check. Please wait.';
$L['liqpaybilling_error_done'] = 'Payment was successful.';
$L['liqpaybilling_error_incorrect'] = 'The signature is incorrect!';
$L['liqpaybilling_error_otkaz'] = 'Failure to pay.';
$L['liqpaybilling_error_title'] = 'Result of the operation of payment';
$L['liqpaybilling_error_fail'] = 'Payment is not made! Please try again. If the problem persists, contact your site administrator';

?>