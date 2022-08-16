<?php

/**
 * Payments module
 *
 * @package payments
 * @author Cotonti CMF (http://cotonti.com/) 
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_balance_enabled'] = array('Включити внутрішні рахунки');
$L['cfg_valuta'] = array('Валюта сайту');
$L['cfg_transfers_enabled'] = array('Включити перекази між користувачами');
$L['cfg_transfertax'] = array('Комісія за перекази між користувачами', '%');
$L['cfg_transfermin'] = array('Мінімальна сума переказу між користувачами', $cfg['payments']['valuta']);
$L['cfg_transfermax'] = array('Максимальна сума переказу між користувачами', $cfg['payments']['valuta']);
$L['cfg_transfertaxfromrecipient'] = array('Утримувати комісію з одержувача переказу');
$L['cfg_payouts_enabled'] = array('Включити заявки на виведення з рахунку');
$L['cfg_payouttax'] = array('Комісія за виведення з рахунку', '%');
$L['cfg_payoutmin'] = array('Мінімальна сума для виведення з рахунку', $cfg['payments']['valuta']);
$L['cfg_payoutmax'] = array('Максимальна сума для виведення з рахунку', $cfg['payments']['valuta']);
$L['cfg_clearpaymentsdays'] = array('Очищати базу від неоплачених платежів через', 'днів');

$L['payments_mybalance'] = 'Мій рахунок';
$L['payments_balance'] = 'На рахунку';
$L['payments_paytobalance'] = 'Поповнити рахунок';
$L['payments_history'] = 'Історія операцій';
$L['payments_payouts'] = 'Вивід з рахунку';
$L['payments_balance_payouts_button'] = 'Нова заявка';
$L['payments_balance_payout_error_summ'] = 'Не вказана сума';
$L['payments_balance_payout_list'] = 'Заявки на виведення коштів з рахунку';
$L['payments_balance_payout_title'] = 'Заявки на виведення з рахунку';
$L['payments_balance_payout_desc'] = 'Вивід з рахунку за заявкою';
$L['payments_balance_payout_summ'] = 'Вкажіть суму';
$L['payments_balance_payout_tax'] = "Комісія";
$L['payments_balance_payout_total'] = "Сума до списання";
$L['payments_balance_payout_details'] = 'Реквізити рахунку або гаманця';
$L['payments_balance_payout_error_details'] = 'Не вказані реквізити';
$L['payments_balance_payout_error_balance'] = 'Зазначена сума перевищує баланс вашого рахунку';
$L['payments_balance_payout_error_min'] = 'Сума для виведення не повинна бути менше %1$s %2$s';
$L['payments_balance_payout_error_max'] = 'Сума для виведення не повинна бути більше %1$s %2$s';

$L['payments_balance_billing_error_summ'] = 'Не указана сумма';
$L['payments_balance_billing_desc'] = 'Поповнення рахунку';
$L['payments_balance_billing_summ'] = 'Вкажіть суму';

$L['payments_balance_billing_admin_subject'] = 'Поповнення рахунку на сайті';
$L['payments_balance_billing_admin_body'] = 'Доброго дня,

Користувач %1$s поповнив рахунок на сайті.

Детальна інформація:

Сума: %2$s
Номер операції: %3$s.
Дата операції: %4$s.

';

$L['payments_balance_payout_admin_subject'] = 'Заявка на вивід з рахунку';
$L['payments_balance_payout_admin_body'] = 'Доброго дня,

Користувач %1$s залишив заявку на виведення грошей з його рахунку на сайті.

Детальна інформація:

Сума: %2$s
Номер заявки: %3$s
Дата подачі заявки: %4$s
Реквізити: %5$s.

';

$L['payments_balance_transfer_admin_subject'] = 'Переказ користувачеві';
$L['payments_balance_transfer_admin_body'] = 'Доброго дня,

Користувач %1$s здійснив переказ на рахунок користувача %2$s.

Детальна інформація:

Сума переказу: %3$s %7$s
Комісія: %4$s %7$s
Списано з відправника: %5$s %7$s
Нараховано одержувачу: %6$s %7$s
Дата переказу: %8$s
Коментар: %9$s

';

$L['payments_balance_transfer_recipient_subject'] = 'Переказ від користувача';
$L['payments_balance_transfer_recipient_body'] = 'Доброго дня, %2$s

Користувач %1$s здійснив переказ на ваш рахунок на сайті.

Детальна інформація:

Сума переказу: %3$s %7$s
Комісія: %4$s %7$s
Вам нараховано: %6$s %7$s
Дата переказу: %8$s
Коментар: %9$s

';

$L['payments_transfer'] = 'Переказ користувачеві';
$L['payments_balance_transfer_desc'] = "Переказ від %1\$s для %2\$s (%3\$s)";
$L['payments_balance_transfer_comment'] = "Коментар";
$L['payments_balance_transfer_summ'] = "Вкажіть суму";
$L['payments_balance_transfer_tax'] = "Комісія";
$L['payments_balance_transfer_total'] = "Сума до списання";
$L['payments_balance_transfer_username'] = "Логін одержувача";
$L['payments_balance_transfer_error_username'] = "Такого користувача не існує";
$L['payments_balance_transfer_error_summ'] = 'Не вказана сума';
$L['payments_balance_transfer_error_balance'] = 'Сума перевищує баланс вашого рахунку';
$L['payments_balance_transfer_error_comment'] = 'Не вказані коментарі до перекладу';
$L['payments_balance_transfer_error_min'] = 'Сума для переказу не повинна бути менше %1$s %2$s';
$L['payments_balance_transfer_error_max'] = 'Сума для переказу не повинна бути більше %1$s %2$s';

$L['payments_billing_title'] = 'Способи оплати';
$L['payments_emptybillings'] = 'На даний момент способи оплати недоступні. Будь ласка, спробуйте виконати оплату пізніше.';

$L['payments_allusers'] = 'Всі користувачі';
$L['payments_siteinvoices'] = 'Рахунок на сайті';
$L['payments_debet'] = 'дебет';
$L['payments_credit'] = 'кредіт';
$L['payments_allpayments'] = 'Сума всіх платежів';
$L['payments_area'] = 'Тип';
$L['payments_code'] = 'Код';
$L['payments_desc'] = 'Призначення';
$L['payments_summ'] = 'Сума';

$L['payments_error_message_'] = 'Сталася помилка в запиті! Будь ласка, зв’яжіться з адміністрацією сайту і повідомте які дії привели вас до цього повідомлення про помилку.';
$L['payments_error_message_1'] = 'Такої сторінки не існує! Будь ласка, зв’яжіться з адміністрацією сайту і повідомте які дії привели вас до цього повідомлення про помилку.';
$L['payments_error_message_2'] = 'Неприпустима операція! Будь ласка, зв’яжіться з адміністрацією сайту і повідомте які дії привели вас до цього повідомлення про помилку.';
$L['payments_error_message_3'] = 'Сума до оплати не відповідає вартості послуги! Будь ласка, зв’яжіться з адміністрацією сайту і повідомте які дії привели вас до цього повідомлення про помилку.';