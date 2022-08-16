<?php

/**
 * orderservices plugin
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_warranty'] = array('Гарантийный срок (дней)');
$L['cfg_tax'] = array('Комиссия за продажи (%)');
$L['cfg_ordersperpage'] = array('Число заказов на странице');
$L['cfg_adminid'] = array('ID пользователя для зачисления комиссии');
$L['cfg_showneworderswithoutpayment'] = array('Показывать заказы ожидающие оплату');
$L['cfg_acceptzerocostorders'] = array('Разрешать покупку товаров с ценой 0 '.((is_array($cfg) && is_array($cfg['payments'])) ? $cfg['payments']['valuta'] : ''));

$L['orderservices'] = 'Заказы на рынке услуг';

$L['orderservices_admin_home_all'] = 'Все заказы';
$L['orderservices_admin_home_claims'] = 'Проблемные заказы';
$L['orderservices_admin_home_done'] = 'Исполненные заказы';
$L['orderservices_admin_home_cancel'] = 'Отмененные заказы';

$L['orderservices_mysales'] = 'Мои продажи';
$L['orderservices_mypurchases'] = 'Мои покупки';

$L['orderservices_sales_title'] = 'Мои продажи';
$L['orderservices_purchases_title'] = 'Мои покупки';
$L['orderservices_empty'] = 'Заказов нет';

$L['orderservices_neworder_pay'] = 'Оплатить заказ';
$L['orderservices_neworder_button_your'] = 'Ваша услуга продаётся';
$L['orderservices_neworder_button_your_tooltip'] = 'Это карточка вашей услуги! Ваша услуга продаётся и доступна к оформлению заказа другим авторизованным пользователям сайта';
$L['orderservices_neworder_button_no_file'] = 'Файл для продажи отсутствует';
$L['orderservices_neworder_button_your_no_file_tooltip'] = 'Файл для скачивания, после оформления и оплаты услуги отсутствует (наличие зависит от вида, типа, рода услуги)';
$L['orderservices_neworder_button'] = 'Оформить заказ услуги';
$L['orderservices_neworder_title'] = 'Оформление заказа';
$L['orderservices_neworder_product'] = 'Наименование услуги';
$L['orderservices_neworder_count'] = 'Количество';
$L['orderservices_neworder_comment'] = 'Комментарий к заказу';
$L['orderservices_neworder_total'] = 'Итого к оплате';
$L['orderservices_neworder_email'] = 'Email';

$L['orderservices_neworder_error_count'] = 'Не указано количество';
$L['orderservices_order_error_claimtext'] = 'Не заполнен текст жалобы';

$L['orderservices_title'] = 'Информация о заказе';
$L['orderservices_product'] = 'Наименование услуги';
$L['orderservices_count'] = 'Количество';
$L['orderservices_comment'] = 'Комментарий к заказу';
$L['orderservices_cost'] = 'Сумма заказа';
$L['orderservices_paid'] = 'Дата оплаты';
$L['orderservices_warranty'] = 'Гарантийный срок';

$L['orderservices_buyers'] = 'Покупатели';

$L['orderservices_done_payments_desc'] = 'Выплата по заказу № {$order_id} ({$product_title})';
$L['orderservices_tax_payments_desc'] = 'Доход с продажи по заказу № {$order_id} ({$product_title})';

$L['orderservices_paid_mail_toseller_header'] = 'Новый заказ № {$order_id} ({$product_title})';
$L['orderservices_paid_mail_toseller_body'] = 'Поздравляем! Пользователь {$user_name}, оформил и оплатил заказ № {$order_id} ([{$product_id}] {$product_title}). Если у покупателя не будет претензий к приобретенному товару/услуге, то по истечению гарантийного срока ({$warranty} дней) на ваш счет поступит оплата в размере {$summ} с учетом комиссии сервиса {$tax}%. Подробности заказа смотрите по ссылке:  {$link}';

$L['orderservices_paid_mail_tocustomer_header'] = 'Заказ № {$order_id} оплачен';
$L['orderservices_paid_mail_tocustomer_body'] = 'Поздравляем! Вы оплатили заказ № {$order_id} ([{$product_id}] {$product_title}) на сумму {$cost}. Подробности заказа смотрите по ссылке:  {$link}';

$L['orderservices_done_mail_toseller_header'] = 'Выплата по заказу № {$order_id} ({$product_title})';
$L['orderservices_done_mail_toseller_body'] = 'Поздравляем! На ваш счет поступила оплата по заказу № {$order_id} ([{$product_id}] {$product_title}) в размере {$summ} с учетом комиссии сервиса {$tax}%. Подробности заказа смотрите по ссылке: {$link}';

$L['orderservices_sales_paidorders'] = 'Оплаченные заказы';
$L['orderservices_sales_doneorders'] = 'Исполненные заказы';
$L['orderservices_sales_claimorders'] = 'Проблемные заказы';
$L['orderservices_sales_cancelorders'] = 'Отмененные заказы';

$L['orderservices_purchases_paidorders'] = 'Оплаченные покупки';
$L['orderservices_purchases_doneorders'] = 'Исполненные покупки';
$L['orderservices_purchases_claimorders'] = 'Проблемные покупки';
$L['orderservices_purchases_cancelorders'] = 'Отмененные покупки';
$L['orderservices_purchases_new'] = 'Ожидают оплаты';

$L['orderservices_status_paid'] = 'Оплаченный';
$L['orderservices_status_done'] = 'Исполненный';
$L['orderservices_status_claim'] = 'Проблемный';
$L['orderservices_status_cancel'] = 'Отмененный';

$L['orderservices_addclaim_title'] = 'Подача жалобы по заказу';
$L['orderservices_addclaim_button'] = 'Подать жалобу в арбитраж';
$L['orderservices_claim_title'] = 'Жалоба';
$L['orderservices_claim_accept'] = 'Отменить заказ';
$L['orderservices_claim_cancel'] = 'Отказать в жалобе';

$L['orderservices_claim_payments_seller_desc'] = 'Выплата за заказ №{$order_id} ([ID {$product_id}] {$product_title}), согласно решению администрации сайта.';
$L['orderservices_claim_payments_customer_desc'] = 'Возврат за заказ №{$order_id} ([ID {$product_id}] {$product_title}), согласно решению администрации сайта.';

$L['orderservices_claim_error_cost'] = 'Сумма выплат не соответствует общей стоимости заказа';

$L['orderservices_addclaim_mail_toseller_header'] = 'Жалоба по заказу № {$order_id}';
$L['orderservices_addclaim_mail_toseller_body'] = 'Покупатель подал жалобу по заказу № {$order_id} ([ID {$product_id}] {$product_title}). Подробность смотрите по ссылке: {$link}';

$L['orderservices_addclaim_mail_toadmin_header'] = 'Жалоба по заказу № {$order_id}';
$L['orderservices_addclaim_mail_toadmin_body'] = 'Покупатель подал жалобу по заказу № {$order_id} ([ID {$product_id}] {$product_title}). Подробность смотрите по ссылке: {$link}';

$L['orderservices_acceptclaim_mail_toseller_header'] = 'Отмена заказа № {$order_id}';
$L['orderservices_acceptclaim_mail_toseller_body'] = 'Заказ № {$order_id} ([ID {$product_id}] {$product_title}) отменен в связи с тем, что покупатель подал жалобу. Подробности смотрите по ссылке: {$link}';

$L['orderservices_acceptclaim_mail_tocustomer_header'] = 'Отмена заказа № {$order_id}';
$L['orderservices_acceptclaim_mail_tocustomer_body'] = 'Заказ № {$order_id} ([ID {$product_id}] {$product_title}) отменен в связи с вашей жалобой. Подробности смотрите по ссылке: {$link}';

$L['orderservices_cancelclaim_mail_tocustomer_header'] = 'Жалобы по заказу № {$order_id} отклонена';
$L['orderservices_cancelclaim_mail_tocustomer_body'] = 'Ваша жалоба по заказу № {$order_id} ([ID {$product_id}] {$product_title}) отклонена администрацией сайта. Подробности смотрите по ссылке: {$link}';

$L['orderservices_file'] = 'Файлы для продажи';
$L['orderservices_file_for_download'] = 'Файлы для скачивания';
$L['orderservices_file_download'] = 'Скачать';
