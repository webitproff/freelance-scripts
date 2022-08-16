<?php
/**
 * ikassabilling plugin
 *
 * @package ikassabilling
 * @author Cotonti CMF (http://cotonti.com/) 
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_shop_id'] = array('Ідентифікатор магазину (Checkout ID)', '');
$L['cfg_test_key'] = array('Тестовий ключ', '');
$L['cfg_secret_key'] = array('Секретний ключ', '');
$L['cfg_enablepost'] = array('Увімкнути post запити');
$L['cfg_rate'] = array('Співвідношення суми до валюти сайту', '');
$L['cfg_currency'] = array('Валюта платіжок', '');

$L['ikassabilling_title'] = 'Інтеркаса';

$L['ikassabilling_formtext'] = 'Зараз ви будете перенаправлені на сайт платіжної системи Interkassa для проведення оплати. Якщо цього не сталося, натисніть кнопку "Перейти до оплати".';
$L['ikassabilling_formbuy'] = 'Перейти до оплати';
$L['ikassabilling_error_paid'] = 'Оплата пройшла успішно. Найближчим часом послуга буде активована!';
$L['ikassabilling_error_done'] = 'Оплата пройшла успішно.';
$L['ikassabilling_error_incorrect'] = 'Некоректний підпис';
$L['ikassabilling_error_otkaz'] = 'Відмова від оплати.';
$L['ikassabilling_error_title'] = 'Результат операції оплати';
$L['ikassabilling_error_wait'] = 'Платіж очікує обробки. Будь ласка, зачекайте.';
$L['ikassabilling_error_canceled'] = 'Платіж скасований платіжною системою. Будь ласка, спробуйте ще раз. Якщо помилка повториться, зверніться до адміністратора сайту.';
$L['ikassabilling_error_fail'] = 'Оплата не зроблена! Будь ласка, спробуйте ще раз. Якщо помилка повториться, зверніться до адміністратора сайту';

$L['ikassabilling_redirect_text'] = 'Зараз відбудеться перенаправлення на сторінку оплаченої послуги. Якщо цього не сталося, перейдіть за <a href="%1$s">посиланням</a>.';