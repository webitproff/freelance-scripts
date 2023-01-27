<?php

/**
 * market module
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_pagelimit'] = array('Число записів у списках');
$L['cfg_shorttextlen'] = array('Кількість символів у списках');
$L['cfg_prevalidate'] = array('Включити попередню модерацію');
$L['cfg_preview'] = array('Включити попередній перегляд');
$L['cfg_marketsitemap'] = 'Включить в Sitemap';
$L['cfg_marketsitemap_freq'] = 'Частота зміни у Sitemap';
$L['cfg_marketsitemap_freq_params'] = $sitemap_freqs;
$L['cfg_marketsitemap_prio'] = array('Пріоритет в Sitemap');
$L['cfg_description'] = array('Опис');
$L['cfg_marketsearch'] = array('Включити до загального пошуку');
$L['cfg_warranty'] = array('Гарантійний термін (днів)');
$L['cfg_tax'] = array('Комісія за продажі (%)');
$L['cfg_ordersperpage'] = array('Кількість замовлень на сторінці');
$L['cfg_notifmarket_admin_moderate'] = array('Повідомляти про нові товари на перевірці','Надсилання повідомлення на системний email про нові товари на премодерації');
$L['cfg_prdeditor'] = 'Вибір конфігурації візуального редактора';
$L['cfg_prdeditor_params'] = 'Відключено, Мінімальний набір кнопок, Стандартний набір кнопок, Розширений набір кнопок'; 

$L['info_desc'] = 'Products Marketplace - Розділ розміщення товарів індивідуальними продавцями';

$L['market_select_cat'] = "Виберіть розділ";
$L['market_locked_cat'] = "Вибрана категорія заблокована";
$L['market_empty_title'] = "Назва не може бути порожньою";
$L['market_empty_text'] = "Опис не може бути порожнім";
$L['market_large_img'] = "Зображення занадто велике";

$L['market_forreview'] = 'Ваш товар перебуває на перевірці. Модератор затвердить його публікацію найближчим часом.';

$L['market_title'] = 'Продукція та товари';
$L['market_descr'] = 'Каталог товарів та продукції від професійоних продавців';
$L['market_myproducts'] = 'Мої розробки';

$L['market_catalog'] = 'Каталог категорій';
$L['market_add_product'] = 'Додати товар';
$L['market_edit_product'] = 'Редагувати товар';
$L['market_add_product_title'] = 'Додавання товару до магазину';
$L['market_edit_product_title'] = 'Редагування товару із магазину';

$L['market_hidden'] = 'Товар не опубліковано';
$L['market_location'] = 'Розташування';
$L['market_price'] = 'Ціна';
$L['market_image_limit'] = 'Дозволені формати JPEG, GIF, JPG, PNG. Максимальний розмір: 1Мб.';
$L['market_aliascharacters'] = 'Неприпустиме використання символів \'+\', \'/\', \'?\', \'%\', \'#\', \'&\' в альясах';

$L['market_costasc'] = 'Ціна за зростанням';
$L['market_costdesc'] = 'Ціна за спаданням';
$L['market_mostrelevant'] = 'Найбільш актуальні';

$L['market_notfound'] = 'Продукції та товарів не знайдено';
$L['market_empty'] = 'Публікацій не має';

$L['market_added_mail_subj'] = 'Ваш товар опубліковано';
$L['market_senttovalidation_mail_subj'] = 'Ваш товар надіслано на перевірку';
$L['market_admin_home_valqueue'] = 'На перевірці';
$L['market_admin_home_public'] = 'Опубліковано';
$L['market_admin_home_hidden'] = 'Приховані';

$L['market_added_mail_body'] = 'Доброго дня, {$user_name}. '."\n\n".'Ваш товар "{$prd_name}" був опублікований на сайті {$sitename} - {$link}';
$L['market_senttovalidation_mail_body'] = 'Доброго дня, {$user_name}.'."\n\n".'Ваш товар "{$prd_name}" було відправлено на перевірку. Модератор затвердить його публікацію найближчим часом.';

$L['market_notif_admin_moderate_mail_subj'] = 'Новий товар на перевірку';
$L['market_notif_admin_moderate_mail_body'] = 'Доброго дня, '."\n\n".'Користувач {$user_name} відправив на перевірку новий товар "{$prd_name}".'."\n\n".'{$link}';

$L['market_status_published'] = 'Опубліковано';
$L['market_status_moderated'] = 'На перевірці';
$L['market_status_hidden'] = 'Приховано';

$L['plu_market_set_sec'] = 'Категорії маркетплейса';
$L['plu_market_res_sort1'] = 'Даті публікації';
$L['plu_market_res_sort2'] = 'Назвою';
$L['plu_market_res_sort3'] = 'Популярності';
$L['plu_market_res_sort4'] = 'Категорії';
$L['plu_market_search_names'] = 'Пошук у назвах товарів';
$L['plu_market_search_text'] = 'Пошук в описі';
$L['plu_market_set_subsec'] = 'Пошук у підрозділах';

$Ls['market_headermoderated'] = "товар на перевірці, товару на перевірці, товарів на перевірці";