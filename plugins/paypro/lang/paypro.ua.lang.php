<?php
/**
 * Paypro plugin
 *
 * @package paypro
 * @author Cotonti CMF (http://cotonti.com/) 
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Plugin Config
 */
$L['cfg_cost'] = array('Вартість в місяць', '');
$L['cfg_offerslimit'] = array('Ліміт відповідей на проекти для звичайних користувачів', '');
$L['cfg_projectslimit'] = array('Ліміт проектів для звичайних користувачів', '');

$L['paypro_forpro'] = 'Тільки для PRO';

$L['paypro_buypro_title'] = 'Купівля PRO';
$L['paypro_buypro_paydesc'] = 'Купівля PRO';
$L['paypro_costofmonth'] = 'Вартість за місяць';
$L['paypro_error_months'] = 'Вкажіть термін дії посгули';

$L['paypro_buy'] = 'Купити';
$L['paypro_month'] = 'місяць';

$L['paypro_header_buy'] = 'Купити PRO';
$L['paypro_header_expire'] = 'PRO дійсний до';
$L['paypro_header_expire_short'] = 'PRO до';
$L['paypro_header_extend'] = 'Продовжити послугу';

$L['paypro_warning_projectslimit_empty'] = 'Ви більше не можете публікувати проекти. Максимальне число проектів для публікації становить: '.$cfg['plugin']['paypro']['projectslimit'].' на добу. Щоб зняти це обмеження, скористайтеся послугою PRO-аккаунт.';
$L['paypro_warning_offerslimit_empty'] = 'Ви більше не можете залишати пропозиції щодо проектів. Максимальне число відгуків на проекти становить: '.$cfg['plugin']['paypro']['offerslimit'].' на добу. Щоб зняти це обмеження, скористайтеся послугою PRO-аккаунт.';
$L['paypro_warning_onlyforpro'] = 'Ви не можете залишати пропозиції по даному проекту, так як він доступний тільки для користувачів з PRO-аккаунтом. Щоб зняти це обмеження, скористайтеся послугою PRO-аккаунт.';

$L['paypro_error_username'] = 'Не вказано логін користувача';
$L['paypro_error_userempty'] = 'Такого користувача не існує';
$L['paypro_error_monthsempty'] = 'Термін дії послуги не вказано';
$L['paypro_addproacc'] = 'Додавання PRO-аккаунта для користувача';

$L['paypro_giftpro'] = 'Подарувати PRO-акаунт';
$L['paypro_giftfor'] = 'Подарувати користувачу';
$L['paypro_giftpro_paydesc'] = 'Купівля PRO в подарунок для ';
$L['paypro_error_user'] = 'Користувач не знайдено';