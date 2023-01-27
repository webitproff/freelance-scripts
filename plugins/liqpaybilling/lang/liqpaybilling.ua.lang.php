<?php
/**
 * liqpaybilling plugin
 *
 * @package liqpaybilling
 * @author Cotonti CMF
 * @copyright Copyright (c) Cotonti CMF 2015 (http://cotonti.com/) 
 * @license BSD
 */
defined('COT_CODE') or die('Wrong URL.');
/**
 * Module Config
 */
$L['info_desc'] = 'Платіжний плагін LiqPay';
$L['cfg_merchant_id'] = array('Merchant', '');
$L['cfg_signature'] = array('Signature', '');
$L['cfg_currency'] = array('Код валюти (UAH,USD,EUR)', '');
$L['cfg_rate'] = array('Співвідношення суми до валюти сайту', '');
$L['cfg_testmode'] = array('Тестовий режим', '');
$L['liqpaybilling_title'] = 'LiqPay';
$L['liqpaybilling_formtext'] = 'Зараз ви будете перенаправлені на сайт платіжної системи LiqPay для проведення оплати. Якщо цього не сталося, натисніть кнопку "Перейти до оплати".';
$L['liqpaybilling_formbuy'] = 'Перейти до оплати';
$L['liqpaybilling_error_wait'] = 'Платіж перевіряється. Будь ласка, зачекайте.';
$L['liqpaybilling_error_paid'] = 'Оплата пройшла успішно. Найближчим часом послуга буде активована!';
$L['liqpaybilling_error_done'] = 'Оплата пройшла успішно.';
$L['liqpaybilling_error_incorrect'] = 'Некоректний підпис';
$L['liqpaybilling_error_otkaz'] = 'Відмова від оплати.';
$L['liqpaybilling_error_title'] = 'Результат операції оплати';
$L['liqpaybilling_error_fail'] = 'Оплата не проведена! Будь ласка, спробуйте ще раз. Якщо помилка повториться, зверніться до адміністратора сайту';