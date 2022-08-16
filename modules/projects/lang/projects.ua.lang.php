<?php
 
/**
 * projects module
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_pagelimit'] = array('Число записів у списках');
$L['cfg_indexlimit'] = array('Число записів на головній');
$L['cfg_offersperpage'] = array('Число пропозицій на сторінці');
$L['cfg_shorttextlen'] = array('Кількість символів у списках');
$L['cfg_prevalidate'] = array('Включити попередню модерацію');
$L['cfg_preview'] = array('Включити попередній перегляд');
$L['cfg_prjsitemap'] = 'Включитм в Sitemap';
$L['cfg_prjsitemap_freq'] = 'Частота зміни у Sitemap';
$L['cfg_prjsitemap_freq_params'] = $sitemap_freqs;
$L['cfg_prjsitemap_prio'] = array('Пріоритет в Sitemap');
$L['cfg_description'] = array('Опис');
$L['cfg_prjsearch'] = array('Включити до загального пошуку');
$L['cfg_license'] = array('Ліцензійний ключ');
$L['cfg_default_type'] = array('Тип Завдання за замовчуванням');
$L['cfg_notif_admin_moderate'] = array('Повідомляти про нові проекти на перевірці','Надсилання повідомлення на системний email про нові проекти на премодерації');
$L['cfg_prjeditor'] = 'Вибір конфігурації візуального редактора';
$L['cfg_prjeditor_params'] = 'Відключено, Мінімальний набір кнопок, Стандартний набір кнопок, Розширений набір кнопок'; 

$L['info_desc'] = 'Модуль публікації Завдань та проектів';

$L['projects_select_cat'] = "Оберіть категорію";
$L['projects_locked_cat'] = "Вибрана категорія заблокована";
$L['projects_empty_title'] = "Не вказано назву Завдання";
$L['projects_empty_text'] = "Опис Завдання не може бути порожнім";

$L['projects_forreview'] = 'Ваше завдання знаходиться на перевірці. Модератор затвердить його публікацію найближчим часом.';
$L['projects_isrealized'] = 'Виконаний';
$L['projects_title'] = 'Замовлення та Завдання';
$L['projects_descr'] = 'Розділ потреб замовників. Завдання виконавцям, замовлення про надання послуг, виконання робіт чи поставку продукції';
$L['projects'] = 'Стіл замовлень та завдань';
$L['projects_projects'] = 'Завдання та замовлення';
$L['projects_myprojects'] = 'Мої Завдання та Заявки';
$L['projects_myprojects_tooltip'] = 'Список усіх Ваших публікацій у розділі сайту «Завдання та Заявки»';
$L['catalog'] = 'Каталог';
$L['projects_add_to_catalog'] = 'Розмістити своє Завдання';
$L['projects_add_tooltip'] = 'Опублікувати на сайті власну заявку для виконання будь-якої роботи або вирішення конкретного завдання';
$L['projects_edit_project'] = 'Редагувати Завдання';
$L['projects_add_project_title'] = 'Публікація Завдання';
$L['projects_edit_project_title'] = 'Редагування Завдання';

$L['projects_hidden'] = 'Завдання не опубліковано';
$L['projects_success_projects'] = 'Успішні Завдання';
$L['projects_next'] = 'Далі';
$L['projects_reputation'] = 'Репутація';
$L['projects_aliascharacters'] = 'Неприпустиме використання символів \'+\', \'/\', \'?\', \'%\', \'#\', \'&\' в альясах';

$L['projects_status_published'] = 'Опубліковано';
$L['projects_status_moderated'] = 'На перевірці';
$L['projects_status_hidden'] = 'Приховано';
$L['projects_admin_home_valqueue'] = 'На перевірці';
$L['projects_admin_home_public'] = 'Опубліковано';
$L['projects_admin_home_hidden'] = 'Приховані';

$L['project_added_mail_subj'] = 'Ваше Завдання опубліковано';
$L['project_senttovalidation_mail_subj'] = 'Ваше Завдання надіслано на перевірку';

$L['project_added_mail_body'] = 'Доброго дня, {$user_name}. '."\n\n".'Ваше Завдання "{$prj_name}" було опубліковано на сайті {$sitename} - {$link}';
$L['project_senttovalidation_mail_body'] = 'Доброго дня, {$user_name}.'."\n\n".'Ваше Завдання "{$prj_name}" було відправлено на перевірку. Модератор затвердить його публікацію найближчим часом.';

$L['projects_price'] = 'Бюджет Завдання';

$L['projects_types_edit'] = 'Виправлення типів';
$L['projects_types_new'] = 'Створити категорію';
$L['projects_types_editor'] = 'Редактор типів Задань';


$L['projects_sendoffer'] = 'Залишити пропозицію';
$L['projects_step2_title'] = 'Перегляд Завдання';
$L['projects_step2_buy'] = 'Сплатити';
$L['projects_step2_selectproject'] = 'Виділити Завдання';
$L['projects_nomoney'] = 'У вас недостатньо коштів на рахунку, щоб сплатити цю послугу.';

$L['projects_costasc'] = 'Ціна за зростанням';
$L['projects_costdesc'] = 'Ціна на зниження';
$L['projects_mostrelevant'] = 'Найбільш актуальні';

$L['projects_notfound'] = 'Завдання не знайдено';
$L['projects_empty'] = 'Задань немає';

$L['offers_timetype'] = array('годин', 'днів', 'місяців');

$L['offers_text_predl'] = 'Текст пропозиції';
$L['offers_hide_offer'] = 'Зробити пропозицію видимою тільки для замовника';
$L['offers_for_guest'] = 'Залишати свої пропозиції по <strong>Завданню, Заявці</strong> можуть лише зареєстровані користувачі з обліковим записом спеціаліста.<br />
	<a href="'.cot_url('users', 'm=register').'">Зареєструйтесь</a> чи <a href="'.cot_url('login').'">зайдіть</a> на сайт під своїм іменем.';

$L['offers_view_all'] = 'Подивитись все';
$L['offers_add_offer'] = 'Залишити пропозицію';
$L['offers_upload'] = 'Завантажити';
$L['offers_offers'] = 'Пропозиції виконавців, спеціалістів, майстрів';
$L['offers_useroffers'] = 'Мої пропозиції';
$L['offers_budget'] = 'Бюджет';
$L['offers_sroki'] = 'Строки';
$L['offers_ot'] = 'від';
$L['offers_do'] = 'до';
$L['offers_otkazat'] = 'Відмовити';
$L['offers_otkazali'] = 'Відмовили';
$L['offers_ispolnitel'] = 'Виконавець';
$L['offers_vibran_ispolnitel'] = 'Вибраний виконавцем';
$L['offers_ostavit_predl'] = 'Залишіть свою пропозицію';
$L['offers_add_predl'] = 'Додати пропозицію';
$L['offers_empty'] = 'Пропозицій немає';

$L['offers_useroffers_none'] = 'Не визначений';
$L['offers_useroffers_performer'] = 'Виконавець';
$L['offers_useroffers_refuse'] = 'Відмовили';

$L['offers_empty_text'] = 'Пропозиція не може бути порожньою';
$L['offers_add_done'] = 'Пропозиція додана';
$L['offers_add_post'] = 'Повідомлення надіслано';

$L['performer_set_done'] = '{$username} обраний виконавцем';
$L['performer_set_refuse'] = 'Відмовлено {$username}';

$L['offers_add_msg'] = 'Написати повідомлення';
$L['offers_posts_title'] = 'Листування по замовленню';

$L['project_added_offer_header'] = 'Нова пропозиція щодо Завдання «{$prtitle}»';
$L['project_added_offer_body'] = 'Доброго дня, {$user_name}. '."\n\n".'Користувач {$offeruser_name} залишив вам пропозицію щодо завдання «{$prj_name}».'."\n\n".'{$link}';

$L['project_added_post_header'] = 'Нове повідомлення на Завдання «{$prtitle}»';
$L['project_added_post_body'] = 'Доброго дня, {$user_name}. '."\n\n".'Користувач {$postuser_name} залишив вам повідомлення по завданню «{$prj_name}».'."\n\n".'{$link}';

$L['project_setperformer_header'] = 'Вас вибрали за завданням «{$prtitle}»';
$L['project_setperformer_body'] = 'Доброго дня, {$offeruser_name}. '."\n\n".'Вас обрали виконавцем за завданням «{$prj_name}».'."\n\n".'{$link}';

$L['project_refuse_header'] = 'Вам відмовили за завданням «{$prtitle}»';
$L['project_refuse_body'] = 'Доброго дня, {$offeruser_name}. '."\n\n".'Вам відмовили за завданням «{$prj_name}».'."\n\n".'{$link}';

$L['project_notif_admin_moderate_mail_subj'] = 'Нове Завдання на перевірку';
$L['project_notif_admin_moderate_mail_body'] = 'Доброго дня, '."\n\n".'Користувач {$user_name} надіслав на перевірку нове Завдання "{$prj_name}".'."\n\n".'{$link}';

$L['project_realized'] = 'Відзначити виконаним';
$L['project_unrealized'] = 'Відзначити невиконаним';

$L['projects_license_error'] = 'Ваш ліцензійний ключ вказано з помилкою або не існує! Будь ласка, вкажіть дійсний ліцензійний ключ у налаштуваннях модуля Projects';

$L['plu_prj_set_sec'] = 'Категорії завдань';
$L['plu_prj_res_sort1'] = 'Даті публикації';
$L['plu_prj_res_sort2'] = 'Назві';
$L['plu_prj_res_sort3'] = 'Популярності';
$L['plu_prj_res_sort3'] = 'Категорії';
$L['plu_prj_search_names'] = 'Пошук у назвах Задань';
$L['plu_prj_search_text'] = 'Пошук у самих проектах';
$L['plu_prj_set_subsec'] = 'Пошук у підрозділах';

$Ls['projects_headermoderated'] = "Завдання на перевірці,Завдання на перевірці,Завдань на перевірці";