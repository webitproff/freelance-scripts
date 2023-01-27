<?php

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_pagelimit'] = array('Число записей в списках');
$L['cfg_shorttextlen'] = array('Количество символов в списках');
$L['cfg_prevalidate'] = array('Включить предварительную модерацию');
$L['cfg_preview'] = array('Включить предварительный просмотр');
$L['cfg_servicessitemap'] = 'Включить в Sitemap';
$L['cfg_servicessitemap_freq'] = 'Частота изменения в Sitemap';
$L['cfg_servicessitemap_freq_params'] = $sitemap_freqs;
$L['cfg_servicessitemap_prio'] = array('Приоритет в Sitemap');
$L['cfg_description'] = array('Description');
$L['cfg_servicessearch'] = array('Включить в общий поиск');
$L['cfg_warranty'] = array('Гарантийный срок (дней)');
$L['cfg_tax'] = array('Комиссия за продажи (%)');
$L['cfg_ordersperpage'] = array('Число заказов на странице');
$L['cfg_notifservices_admin_moderate'] = array('Уведомлять о новых услугах на проверке','Отправка уведомления на системный email о новых услугах на премодерации');
$L['cfg_serveditor'] = 'Выбор конфигурации визуального редактора';
$L['cfg_serveditor_params'] = 'Отключено,Минимальный набор кнопок,Стандартный набор кнопок,Расширенный набор кнопок'; 

$L['info_desc'] = 'Services Marketplace - Раздел размещения услуг индивидуальными исполнителями, специалистами, мастерами и пр.';

$L['services_select_cat'] = "Выберите раздел";
$L['services_locked_cat'] = "Выбранная категория заблокирована";
$L['services_empty_title'] = "Название не может быть пустым";
$L['services_empty_text'] = "Описание не может быть пустым";
$L['services_large_img'] = "Изображение слишком большое";

$L['services_forreview'] = 'Ваша услуга находится на проверке. Модератор утвердит публикацию в ближайшее время.';

$L['services_title'] = 'Послуги та Служби';
$L['services_descr'] = 'Розділ пропозицій професійних та побутових послуг';
$L['services_myproducts'] = 'Мои услуги по 1С';
$L['services_myproducts_tab'] = 'Страница моих услуг';

$L['services_catalog'] = 'Категории услуг';
$L['services_add_product'] = 'Разместить свои услуги';
$L['services_edit_product'] = 'Редактировать карточку услуги';
$L['services_add_service_title'] = 'Создание и размещение карточки вашей услуги';
$L['services_edit_service_title'] = 'Редактирование карточки услуги';

$L['services_hidden'] = 'Услуга не опубликована';
$L['services_location'] = 'Местоположение';
$L['services_price'] = 'Стоимость';
$L['services_image_limit'] = 'Разрешенные форматы JPEG, GIF, JPG, PNG. Максимальный размер 1Мб.';
$L['services_aliascharacters'] = 'Недопустимо использование символов \'+\', \'/\', \'?\', \'%\', \'#\', \'&\' в алиасах';

$L['services_costasc'] = 'Стоимость по возрастанию';
$L['services_costdesc'] = 'Стоимость по убыванию';
$L['services_mostrelevant'] = 'Наиболее актуальные';

$L['services_notfound'] = 'Размещенных услуг не найдено';
$L['services_empty'] = 'Размещенных услуг нет';

$L['services_added_mail_subj'] = 'Ваш услуга опубликована';
$L['services_senttovalidation_mail_subj'] = 'Ваш услуга отправлена на проверку';
$L['services_admin_home_valqueue'] = 'На проверке';
$L['services_admin_home_public'] = 'Опубликовано';
$L['services_admin_home_hidden'] = 'Скрытые';

$L['services_added_mail_body'] = 'Здравствуйте, {$user_name}. '."\n\n".'Ваш услуга "{$serv_name}" была опубликована на сайте {$sitename} - {$link}';
$L['services_senttovalidation_mail_body'] = 'Здравствуйте, {$user_name}.'."\n\n".'Ваш услуга "{$serv_name}" была отправлена на проверку. Модератор утвердит публикацию в ближайшее время.';

$L['services_notif_admin_moderate_mail_subj'] = 'Новая услуга на проверке';
$L['services_notif_admin_moderate_mail_body'] = 'Здравствуйте, '."\n\n".'Пользователь {$user_name} отправил на проверку публикацию новой услуги "{$serv_name}".'."\n\n".'{$link}';

$L['services_status_published'] = 'Опубликовано';
$L['services_status_moderated'] = 'На проверке';
$L['services_status_hidden'] = 'Скрыто';

$L['plu_services_set_sec'] = 'Категории рынка услуг';
$L['plu_services_res_sort1'] = 'Дате публикации';
$L['plu_services_res_sort2'] = 'Названию';
$L['plu_services_res_sort3'] = 'Популярности';
$L['plu_services_res_sort4'] = 'Категории';
$L['plu_services_search_names'] = 'Поиск в названиях услуг';
$L['plu_services_search_text'] = 'Поиск в описании';
$L['plu_services_set_subsec'] = 'Поиск в подразделах';

$Ls['services_headermoderated'] = "услуга на проверке,услуг на проверке,услуг на проверке";