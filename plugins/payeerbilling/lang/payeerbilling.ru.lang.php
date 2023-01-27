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

$L['info_desc'] = 'Payeer прием онлайн платежей для сайта биржи услуг и фриланса на CMS Cotonti<br /> [<a target="_blank" href="http://freelance-script.abuyfile.com/plugin-payeerbilling/">Документация по плагину, помощь, поддержка</a>]';

$L['cfg_shop'] = array('Идентификатор магазина', '');
$L['cfg_key'] = array('Секретный ключ', '');
$L['cfg_curr'] = array('Валюта платежа', '');
$L['cfg_rate'] = array('Соотношение суммы к валюте сайта', '');

$L['payeerbilling_title'] = 'Payeer';

$L['payeerbilling_formtext'] = 'Сейчас вы будете перенаправлены на сайт платежной системы Payeer для проведения оплаты. Если этого не произошло, нажмите кнопку "Перейти к оплате".';
$L['payeerbilling_formbuy'] = 'Перейти к оплате';
$L['payeerbilling_error_paid'] = 'Оплата прошла успешно. В ближайшее время услуга будет активирована!';
$L['payeerbilling_error_done'] = 'Оплата прошла успешно.';
$L['payeerbilling_error_incorrect'] = 'Некорректная подпись';
$L['payeerbilling_error_otkaz'] = 'Отказ от оплаты.';
$L['payeerbilling_error_title'] = 'Результат операции оплаты';
$L['payeerbilling_error_fail'] = 'Оплата не произведена! Пожалуйста, повторите попытку. Если ошибка повторится, обратитесь к администратору сайта';

$L['payeerbilling_redirect_text'] = 'Сейчас произойдет редирект на страницу оплаченной услуги. Если этого не произошло, перейдите по <a href="%1$s">ссылке</a>.';