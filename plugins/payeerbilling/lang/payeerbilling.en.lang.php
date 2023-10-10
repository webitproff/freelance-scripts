<?php
/**
 * payeerbilling plugin
 *
 * @package payeerbilling
 * @version 1.0
 * @author devkont (Yusupov)
 * @copyright Copyright (c) CMSWorks Team 2015
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */

$L['info_desc'] = 'Payment plugin Payeer';

$L['cfg_shop'] = array('Shop id', '');
$L['cfg_key'] = array('Secret key', '');
$L['cfg_curr'] = array('Currency', '');
$L['cfg_rate'] = array('Exchange rate', '');

$L['payeerbilling_title'] = 'Payeer';

$L['payeerbilling_formtext'] = 'Now you will be redirected to the payment system Payeer for payment. If not, click the "Go to payment".';
$L['payeerbilling_formbuy'] = 'Go to payment';
$L['payeerbilling_error_paid'] = 'Payment was successful. In the near future the service will be activated!';
$L['payeerbilling_error_done'] = 'Payment was successful.';
$L['payeerbilling_error_incorrect'] = 'The signature is incorrect!';
$L['payeerbilling_error_otkaz'] = 'Failure to pay.';
$L['payeerbilling_error_title'] = 'Result of the operation of payment';
$L['payeerbilling_error_fail'] = 'Payment is not made! Please try again. If the problem persists, contact your site administrator';

$L['payeerbilling_redirect_text'] = 'Now will redirect to the page of the paid services. If it does not, click <a href="%1$s">here</a>.';