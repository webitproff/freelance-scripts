<?php
/**
 * Paypro plugin
 *
 * @package paypro
 * @version 1.0
 * @author CMSWorks Team
 * @copyright Copyright (c) CMSWorks.ru, littledev.ru
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_cost'] = array('Стоимость в месяц', '');
$L['cfg_offerslimit'] = array('Лимит ответов на проекты для обычных пользователей', '');
$L['cfg_projectslimit'] = array('Лимит проектов для обычных пользователей', '');

$L['info_desc'] = 'Pro-аккаунты';

$L['paypro_forpro'] = 'Только для PRO';

$L['paypro_buypro_title'] = 'Покупка PRO';
$L['paypro_buypro_paydesc'] = 'Покупка PRO';
$L['paypro_costofmonth'] = 'Стоимость за месяц';
$L['paypro_error_months'] = 'Укажите срок действия услуги';

$L['paypro_buy'] = 'Купить';
$L['paypro_month'] = 'месяц';

$L['paypro_header_buy'] = 'Купить PRO';
$L['paypro_header_expire'] = 'PRO действует до';
$L['paypro_header_expire_short'] = 'PRO до';
$L['paypro_header_extend'] = 'Продлить услугу';

$L['paypro_warning_projectslimit_empty'] = 'Вы больше не можете публиковать проекты. Максимальное число проектов для публикации составляет: '.$cfg['plugin']['paypro']['projectslimit'].' ' . ($cfg['plugin']['paypro']['projectslimitoffset'] > 1 ? 'за '.cot_declension($cfg['plugin']['paypro']['projectslimitoffset'], $Ls['Days']) : 'в сутки') . '. Чтобы снять это ограничение, воспользуйтесь <a href="'.cot_url('plug', 'e=paypro').'">услугой PRO-аккаунт.</a>';
$L['paypro_warning_projectslimit_guest'] = 'Доступное количество новых бесплатных публикаций заданий в разделе: '.$cfg['plugin']['paypro']['projectslimit'].' ' . ($cfg['plugin']['paypro']['projectslimitoffset'] > 1 ? 'за '.cot_declension($cfg['plugin']['paypro']['projectslimitoffset'], $Ls['Days']) : 'в сутки') . ' для пользователей с базовым аккаунтом. Если у Вас PRO-аккаунт, -  у Вас таких ограничений нет.';
$L['paypro_warning_marketlimit_guest'] = 'Доступное количество новых бесплатных публикаций о предложении своих товаров и услуг в разделе: '.$cfg['plugin']['paypro']['marketlimit'].' ' . ($cfg['plugin']['paypro']['marketlimitoffset'] > 1 ? 'за '.cot_declension($cfg['plugin']['paypro']['marketlimitoffset'], $Ls['Days']) : 'в сутки') . ' для пользователей с базовым аккаунтом. <br>Если у Вас PRO-аккаунт, -  у Вас таких ограничений нет.';
$L['paypro_warning_offerslimit_empty'] = 'Вы больше не можете оставлять предложения по проектам. Максимальное число откликов на проекты составляет: '.$cfg['plugin']['paypro']['offerslimit'].' ' . ($cfg['plugin']['paypro']['offerslimitoffset'] > 1 ? 'за '.cot_declension($cfg['plugin']['paypro']['offerslimitoffset'], $Ls['Days']) : 'в сутки') . '. Чтобы снять это ограничение, воспользуйтесь <a href="'.cot_url('plug', 'e=paypro').'">услугой PRO-аккаунт.</a>';
$L['paypro_warning_marketlimit_empty'] = 'Вы больше не можете публиковать товары в магазине. Максимальное число товаров составляет: '.$cfg['plugin']['paypro']['marketlimit'].' ' . ($cfg['plugin']['paypro']['marketlimitoffset'] > 1 ? 'за '.cot_declension($cfg['plugin']['paypro']['marketlimitoffset'], $Ls['Days']) : 'в сутки') . '. Чтобы снять это ограничение, воспользуйтесь <a href="'.cot_url('plug', 'e=paypro').'">услугой PRO-аккаунт.</a>';
$L['paypro_warning_forumslimit_empty'] = 'Вы больше не оставлять сообщения на форуме. Максимальное число сообщения составляет: '.$cfg['plugin']['paypro']['forumslimit'].' ' . ($cfg['plugin']['paypro']['forumslimitoffset'] > 1 ? 'за '.cot_declension($cfg['plugin']['paypro']['forumslimitoffset'], $Ls['Days']) : 'в сутки') . '. Чтобы снять это ограничение, воспользуйтесь <a href="'.cot_url('plug', 'e=paypro').'">услугой PRO-аккаунт.</a>';
$L['paypro_warning_onlyforpro'] = 'Вы не можете оставлять предложения по данному проекту, так как он доступен только для пользователей с PRO-аккаунтом. Чтобы снять это ограничение, воспользуйтесь <a href="'.cot_url('plug', 'e=paypro').'">услугой PRO-аккаунт.</a>';

$L['paypro_error_username'] = 'Не указан логин пользователя';
$L['paypro_error_userempty'] = 'Такого пользователя не существует';
$L['paypro_error_monthsempty'] = 'Срок действия услуги не указан';
$L['paypro_addproacc'] = 'Добавление PRO-аккаунта для пользователя';

$L['paypro_giftpro'] = 'Подарить PRO-аккаунт';
$L['paypro_giftfor'] = 'Подарить пользователю';
$L['paypro_giftpro_paydesc'] = 'Покупка PRO в подарок для ';
$L['paypro_error_user'] = 'Пользователь не найден';
$L['paypro_mail_subject_user'] = 'PRO-аккаунт приобретен!';
$L['paypro_mail_body_user'] = 'Здравствуйте {$user_name}! 
Вы оплатили и приобрели статус PRO-аккаунт на сайте {$sitetitle} ({$siteurl}).
Если в личном кабинете Вы не видете свой PRO-аккаунт, - Вам следует выйти и снова зайти в свой аккаунт на сайте ({$siteurl}) .';
$L['paypro_mail_subject_admin'] = 'PRO-аккаунт, Оплачено!';
$L['paypro_mail_body_admin'] = 'Здравствуйте Administrator! 
На сайте {$sitetitle} ({$siteurl}) был оплачен и приобретен статус PRO-аккаунт.';
