<?php
/**
 * Payprjtop plugin
 *
 * @package payprjtop
 * @author Cotonti CMF (http://cotonti.com/) 
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Plugin Config
 */
$L['cfg_cost'] = array('Вартість за день розміщення', '');

$L['payprjtop_buy_title'] = (isset($L['payprjtop_buy_title'])) ? $L['payprjtop_buy_title'] : 'Закріпити проект';
$L['payprjtop_buy_paydesc'] = (isset($L['payprjtop_buy_paydesc'])) ? $L['payprjtop_buy_paydesc'] : 'Послуга "Закріплений проект"';
$L['payprjtop_costofday'] = (isset($L['payprjtop_costofday'])) ? $L['payprjtop_costofday'] : 'Варстість за день';
$L['payprjtop_error_days'] = (isset($L['payprjtop_error_days'])) ? $L['payprjtop_error_days'] : 'Вкажіть термін дії послуги';

$L['payprjtop_buy'] = (isset($L['payprjtop_buy'])) ? $L['payprjtop_buy'] : 'Купити';
$L['payprjtop_day'] = (isset($L['payprjtop_day'])) ? $L['payprjtop_day'] : 'день';

$L['payprjtop_buy_prodlit'] = (isset($L['payprjtop_buy_prodlit'])) ? $L['payprjtop_buy_prodlit'] : "Закріплений до %1\$s. <a href=\"%2\$s\">Продовжити</a>";