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

$L['info_desc'] = 'Платежный плагин PayPal';

$L['cfg_email'] = array('Email ID', '');
$L['cfg_currency'] = array('Код валюты (USD,RUB,EUR,GBP,YEN,CAD и др)', '');
$L['cfg_testmode'] = array('Тестовый режим', '');
$L['cfg_rate'] = array('Соотношение суммы к валюте сайта', '');

$L['paypalbilling_title'] = 'PayPal';

$L['paypalbilling_formtext'] = 'Сейчас вы будете перенаправлены на сайт платежной системы PayPal для проведения оплаты. Если этого не произошло, нажмите кнопку "Перейти к оплате".';
$L['paypalbilling_formbuy'] = 'Перейти к оплате';
$L['paypalbilling_error_paid'] = 'Оплата прошла успешно. В ближайшее время услуга будет активирована!';
$L['paypalbilling_error_done'] = 'Оплата прошла успешно.';
$L['paypalbilling_error_incorrect'] = 'Некорректная подпись';
$L['paypalbilling_error_title'] = 'Результат операции оплаты';
$L['paypalbilling_error_cancel'] = 'Оплата отменена! Если у вас возникли проблемы при оплате, попробуйте снова или обратитесь к администратору сайта';

?>