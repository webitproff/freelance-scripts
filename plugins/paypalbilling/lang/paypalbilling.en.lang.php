<?php
/**
 * paypalbilling plugin
 *
 * @package paypalbilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright Copyright (c) CMSWorks Team 2013
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */

$L['info_desc'] = 'Payment plugin PayPal';

$L['cfg_email'] = array('Email ID', '');
$L['cfg_currency'] = array('Currency code (USD,RUB,EUR,GBP,YEN,CAD etc.)', '');
$L['cfg_testmode'] = array('Test mode', '');
$L['cfg_rate'] = array('Exchange rate', '');

$L['paypalbilling_title'] = 'PayPal';

$L['paypalbilling_formtext'] = 'Now you will be redirected to the payment system PayPal for payment. If not, click the "Go to payment".';
$L['paypalbilling_formbuy'] = 'Go to payment';
$L['paypalbilling_error_paid'] = 'Payment was successful. In the near future the service will be activated!';
$L['paypalbilling_error_done'] = 'Payment was successful.';
$L['paypalbilling_error_incorrect'] = 'The signature is incorrect!';
$L['paypalbilling_error_otkaz'] = 'Failure to pay.';
$L['paypalbilling_error_title'] = 'Result of the operation of payment';
$L['paypalbilling_error_fail'] = 'Payment is not made! Please try again. If the problem persists, contact your site administrator';

?>