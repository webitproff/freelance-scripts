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

$L['info_desc'] = 'Платежный плагин LiqPay';

$L['cfg_merchant_id'] = array('Merchant', '');
$L['cfg_signature'] = array('Signature', '');
$L['cfg_currency'] = array('Код валюты (UAH,USD,RUR,EUR)', '');
$L['cfg_rate'] = array('Соотношение суммы к валюте сайта', '');
$L['cfg_testmode'] = array('Тестовый режим', '');

$L['liqpaybilling_title'] = 'LiqPay.ua';
$L['liqpaybilling_codes_currency'] = '(UAH,USD,RUR,EUR)';
$L['liqpaybilling_formtext'] = 'Сейчас вы будете перенаправлены на сайт платежной системы "liqpay.ua" для проведения оплаты. Если этого не произошло, нажмите кнопку "Перейти к оплате".';
$L['liqpaybilling_formbuy'] = 'Перейти к оплате';
$L['liqpaybilling_error_wait'] = 'Сайт "liqpay.ua" сообщает - Статус платежа: "В ожидании!". Платеж находится на проверке. Пожалуйста, подождите.';
$L['liqpaybilling_error_paid'] = 'Оплата прошла успешно. В ближайшее время услуга будет активирована!';
$L['liqpaybilling_error_done'] = 'Оплата прошла успешно.';
$L['liqpaybilling_error_incorrect'] = 'Некорректная подпись';
$L['liqpaybilling_error_otkaz'] = 'Отказ от оплаты.';
$L['liqpaybilling_error_title'] = 'Результат операции оплаты';
$L['liqpaybilling_error_fail'] = 'Оплата не произведена! Пожалуйста, повторите попытку. Если ошибка повторится, обратитесь к администратору сайта';

?>