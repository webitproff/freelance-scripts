<?php
/**
 * payeerbilling plugin
 *
 * @package payeerbilling
 * @author Cotonti CMF (http://cotonti.com/) 
 */
defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */

$L['info_desc'] = 'Платіжний плагін Payeer';

$L['cfg_shop'] = array('Ідентифікатор магазину', '');
$L['cfg_key'] = array('Секретний ключ', '');
$L['cfg_curr'] = array('Валюта платежу', '');
$L['cfg_rate'] = array('Співвідношення суми до валюти сайту', '');

$L['payeerbilling_title'] = 'Payeer';

$L['payeerbilling_formtext'] = 'Зараз ви будете перенаправлені на сайт платіжної системи Payeer для проведення оплати. Якщо цього не сталося, натисніть кнопку "Перейти до оплати".';
$L['payeerbilling_formbuy'] = 'Перейти до оплати';
$L['payeerbilling_error_paid'] = 'Оплата пройшла успішно. Найближчим часом послуга буде активована!';
$L['payeerbilling_error_done'] = 'Оплата пройшла успішно.';
$L['payeerbilling_error_incorrect'] = 'Некоректний підпис';
$L['payeerbilling_error_otkaz'] = 'Відмова від оплати.';
$L['payeerbilling_error_title'] = 'Результат операції оплати';
$L['payeerbilling_error_fail'] = 'Оплата не зроблена! Будь ласка, спробуйте ще раз. Якщо помилка повториться, зверніться до адміністратора сайту';

$L['payeerbilling_redirect_text'] = 'Зараз відбудеться перенаправлення на сторінку оплаченої послуги. Якщо цього не сталося, перейдіть за <a href="%1$s">посиланням</a>.';