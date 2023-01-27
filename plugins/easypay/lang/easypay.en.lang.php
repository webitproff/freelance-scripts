<?php

/**
 * easypay plugin
 *
 * @package easypay
 * @version 1.0.0
 * @author CMSWorks Team
 * @copyright Copyright (c) CMSWorks.ru
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_codes'] = array('Список платежек', '');

$L['easypay_admin_config_code'] = 'Код';
$L['easypay_admin_config_name'] = 'Название';
$L['easypay_admin_config_cost'] = 'Стоимость';
$L['easypay_admin_config_userid'] = 'ID пользователя (получателя)';

$L['easypay_buy_title'] = 'Оформление платежа';

$L['easypay_cost'] = 'Сумма к оплате';
$L['easypay_email'] = 'Email';
$L['easypay_buy'] = 'Оплатить';

$L['easypay_error_cost'] = 'Сумма к оплате не указана';

$L['easypay_header_buy'] = 'Оплатить';

$L['easypay_email_paid_user_subject'] = 'Информация об оплате';
$L['easypay_email_paid_user_body'] = 'Здравствуйте,

Пользователь %1$s произвел оплату на сайте.

Подробная информация:

Наименование: %2$s
Стоимость: %3$s
Номер платежа: %4$s
Дата оплаты: %5$s.

';

$L['easypay_email_paid_admin_subject'] = 'Информация об оплате';
$L['easypay_email_paid_admin_body'] = 'Здравствуйте,

Пользователь %1$s произвел оплату на сайте.

Подробная информация:

Наименование: %2$s
Стоимость: %3$s
Номер платежа: %4$s
Дата оплаты: %5$s.

';

$L['easypay_email_paid_customer_subject'] = 'Информация об оплате';
$L['easypay_email_paid_customer_body'] = 'Здравствуйте, %1$s,

Благодарим вас за оплату!

Оплата прошла успешно!

Подробная информация:

Наименование: %2$s
Стоимость: %3$s
Номер платежа: %4$s
Дата оплаты: %5$s.

';