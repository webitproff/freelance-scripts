<?php

/**
 * folio module
 *
 * @package folio
 * @author Cotonti CMF (http://cotonti.com/) 
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_pagelimit'] = array('Число записів у списках');
$L['cfg_shorttextlen'] = array('Кількість символів у списках');
$L['cfg_prevalidate'] = array('Включити попередню модерацію');
$L['cfg_preview'] = array('Включити попередній перегляд');
$L['cfg_foliositemap'] = 'Додавати до Sitemap';
$L['cfg_foliositemap_freq'] = 'Частота змін в Sitemap';
$L['cfg_foliositemap_freq_params'] = $sitemap_freqs;
$L['cfg_foliositemap_prio'] = array('Пріорітет в Sitemap');
$L['cfg_description'] = array('Опис');
$L['cfg_foliosearch'] = array('Додати в загальний пошук');

$L['folio_select_cat'] = "Виберіть розділ";
$L['folio_empty_title'] = "Назва не може бути порожньою";
$L['folio_empty_text'] = "Опис не може бути порожнім";
$L['folio_large_img'] = "Зображення занадто велике";

$L['folio_forreview'] = 'Ваша робота знаходиться на перевірці. Модератор затвердить її публікацію найближчим часом.';
$L['folio_title'] = 'Портфоліо';
$L['folio_descr'] = 'Каталог демонстрації досягнень, виконанних робіт та отриманних сертифікатів професійними продавцями й виконавцями нашого онлайн сервісу';
$L['folio'] = 'Портфоліо';
$L['folio_catalog'] = 'Каталог';
$L['folio_add_to_catalog'] = 'Додати роботу';
$L['folio_add_work'] = 'Додати роботу';
$L['folio_edit_work'] = 'Редагувати роботу';
$L['folio_add_work_title'] = 'Додавання роботи в портфоліо';
$L['folio_edit_work_title'] = 'Редагування роботи з портфоліо';

$L['folio_hidden'] = 'Робота не опублікована';
$L['folio_location'] = 'Місцезнаходження';
$L['folio_price'] = 'Бюджет роботи';
$L['folio_image_limit'] = 'Дозволені формати JPEG, GIF, JPG, PNG. Максимальний розмір 1Мб.';
$L['folio_aliascharacters'] = 'Неприпустимо використання символів \'+\', \'/\', \'?\', \'%\', \'#\', \'&\' в аліасах';

$L['folio_costasc'] = 'Ціна за зростанням';
$L['folio_costdesc'] = 'Ціна за спаданням';
$L['folio_mostrelevant'] = 'Найбільш актуальні';

$L['folio_notfound'] = 'Роботи не знайдені';
$L['folio_empty'] = 'Робіт немає';

$L['folio_added_mail_subj'] = 'Робота додана в Портфоліо';
$L['folio_senttovalidation_mail_subj'] = 'Ваша нова робота з Портфоліо була відправлена на перевірку';
$L['folio_admin_home_valqueue'] = 'На перевірці';
$L['folio_admin_home_public'] = 'Опубліковано';
$L['folio_admin_home_hidden'] = 'Приховані';

$L['folio_added_mail_body'] = 'Вітаю, {$user_name}. '."\n\n".'Робота "{$prd_name}" додана у ваше Портфоліо на сайті {$sitename} - {$link}';
$L['folio_senttovalidation_mail_body'] = 'Вітаю, {$user_name}.'."\n\n".'Ваша робота "{$prd_name}" з Портфоліо була відправлена на перевірку. Модератор затвердить її публікацію найближчим часом.';

$L['folio_status_published'] = 'Опубліковано';
$L['folio_status_moderated'] = 'На перевірці';
$L['folio_status_hidden'] = 'Приховано';

$L['plu_folio_set_sec'] = 'Категорії робіт';
$L['plu_folio_res_sort1'] = 'Даті публікації';
$L['plu_folio_res_sort2'] = 'Назвою';
$L['plu_folio_res_sort3'] = 'Популярності';
$L['plu_folio_res_sort3'] = 'Категорії';
$L['plu_folio_search_names'] = 'Пошук в назвах';
$L['plu_folio_search_text'] = 'Пошук в описі';
$L['plu_folio_set_subsec'] = 'Пошук в підрозділах';