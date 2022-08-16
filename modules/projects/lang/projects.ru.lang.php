<?php
 
/**
 * projects module
 */

defined('COT_CODE') or die('Wrong URL.');

/**
 * Module Config
 */
$L['cfg_pagelimit'] = array('Число записей в списках');
$L['cfg_indexlimit'] = array('Число записей на главной');
$L['cfg_offersperpage'] = array('Число предложений на странице');
$L['cfg_shorttextlen'] = array('Количество символов в списках');
$L['cfg_prevalidate'] = array('Включить предварительную модерацию');
$L['cfg_preview'] = array('Включить предварительный просмотр');
$L['cfg_prjsitemap'] = 'Включить в Sitemap';
$L['cfg_prjsitemap_freq'] = 'Частота изменения в Sitemap';
$L['cfg_prjsitemap_freq_params'] = $sitemap_freqs;
$L['cfg_prjsitemap_prio'] = array('Приоритет в Sitemap');
$L['cfg_description'] = array('Description');
$L['cfg_prjsearch'] = array('Включить в общий поиск');
$L['cfg_license'] = array('Лицензионный ключ');
$L['cfg_default_type'] = array('Тип Задания по-умолчанию');
$L['cfg_notif_admin_moderate'] = array('Уведомлять о новых проектах на проверке','Отправка уведомления на системный email о новых проектах на премодерации');
$L['cfg_prjeditor'] = 'Выбор конфигурации визуального редактора';
$L['cfg_prjeditor_params'] = 'Отключено,Минимальный набор кнопок,Стандартный набор кнопок,Расширенный набор кнопок'; 

$L['info_desc'] = 'Модуль публикации Заданий';

$L['projects_select_cat'] = "Выберите категорию";
$L['projects_locked_cat'] = "Выбранная категория заблокирована";
$L['projects_empty_title'] = "Не указано название Задания";
$L['projects_empty_text'] = "Описание Задания не может быть пустым";

$L['projects_forreview'] = 'Ваш Задание находится на проверке. Модератор утвердит его публикацию в ближайшее время.';
$L['projects_isrealized'] = 'Исполненный';
$L['projects_title'] = 'Стол Заданий';
$L['projects_descr'] = 'Каталог заданий и заявок на оказание профессиональных услуг доставки';
$L['projects'] = 'Задания и Заявки';
$L['projects_projects'] = 'Задания, Заявки, Проекты';
$L['projects_myprojects'] = 'Мои Задания и Заявки';
$L['projects_myprojects_tooltip'] = 'Список всех Ваших публикаций в разделе сайта «Задания и Заявки»';
$L['catalog'] = 'Каталог';
$L['projects_add_to_catalog'] = 'Разместить своё Задание';
$L['projects_add_tooltip'] = 'Опубликовать на сайте собственную заявку для выполнения какой-либо работы или решения конкретной задачи';
$L['projects_edit_project'] = 'Редактировать Задание';
$L['projects_add_project_title'] = 'Публикация Задания';
$L['projects_edit_project_title'] = 'Редактирование Задания';

$L['projects_hidden'] = 'Задание не опубликовано';
$L['projects_success_projects'] = 'Успешные Задания';
$L['projects_next'] = 'Далее';
$L['projects_reputation'] = 'Репутация';
$L['projects_aliascharacters'] = 'Недопустимо использование символов \'+\', \'/\', \'?\', \'%\', \'#\', \'&\' в алиасах';

$L['projects_status_published'] = 'Опубликовано';
$L['projects_status_moderated'] = 'На проверке';
$L['projects_status_hidden'] = 'Скрыто';
$L['projects_admin_home_valqueue'] = 'На проверке';
$L['projects_admin_home_public'] = 'Опубликовано';
$L['projects_admin_home_hidden'] = 'Скрытые';

$L['project_added_mail_subj'] = 'Ваше Задание опубликовано';
$L['project_senttovalidation_mail_subj'] = 'Ваше Задание отправлено на проверку';

$L['project_added_mail_body'] = 'Здравствуйте, {$user_name}. '."\n\n".'Ваше Задание "{$prj_name}" было опубликовано на сайте {$sitename} - {$link}';
$L['project_senttovalidation_mail_body'] = 'Здравствуйте, {$user_name}.'."\n\n".'Ваше Задание "{$prj_name}" было отправлено на проверку. Модератор утвердит его публикацию в ближайшее время.';

$L['projects_price'] = 'Бюджет Задания';

$L['projects_types_edit'] = 'Правка типов';
$L['projects_types_new'] = 'Создать категорию';
$L['projects_types_editor'] = 'Редактор типов Заданий';


$L['projects_sendoffer'] = 'Оставить предложение';
$L['projects_step2_title'] = 'Предпросмотр Задания';
$L['projects_step2_buy'] = 'Оплатить';
$L['projects_step2_selectproject'] = 'Выделить Задание';
$L['projects_nomoney'] = 'У вас недостаточно средств на счете, чтобы оплатить данную услугу.';

$L['projects_costasc'] = 'Цена по возрастанию';
$L['projects_costdesc'] = 'Цена по убыванию';
$L['projects_mostrelevant'] = 'Наиболее актуальные';

$L['projects_notfound'] = 'Задания не найдены';
$L['projects_empty'] = 'Заданий нет';

$L['offers_timetype'] = array('часов', 'дней', 'месяцев');

$L['offers_text_predl'] = 'Текст предложения';
$L['offers_hide_offer'] = 'Сделать предложение видимым только для заказчика';
$L['offers_for_guest'] = 'Оставлять свои предложения по <strong>Заданию, Заявке, Заданию</strong> могут только зарегистрированные пользователи с аккаунтом специалиста.<br />
	<a href="'.cot_url('users', 'm=register').'">Зарегистрируйтесь</a> или <a href="'.cot_url('login').'">войдите</a> на сайт под своим именем.';

$L['offers_view_all'] = 'Посмотреть все';
$L['offers_add_offer'] = 'Оставить предложение';
$L['offers_upload'] = 'Загрузить';
$L['offers_offers'] = 'Предложения исполнителей, специалистов, мастеров';
$L['offers_useroffers'] = 'Мои предложения';
$L['offers_budget'] = 'Бюджет';
$L['offers_sroki'] = 'Сроки';
$L['offers_ot'] = 'от';
$L['offers_do'] = 'до';
$L['offers_otkazat'] = 'Отказать';
$L['offers_otkazali'] = 'Отказали';
$L['offers_ispolnitel'] = 'Исполнитель';
$L['offers_vibran_ispolnitel'] = 'Выбран исполнителем';
$L['offers_ostavit_predl'] = 'Оставьте свое предложение';
$L['offers_add_predl'] = 'Добавить предложение';
$L['offers_empty'] = 'Предложений нет';

$L['offers_useroffers_none'] = 'Не определен';
$L['offers_useroffers_performer'] = 'Исполнитель';
$L['offers_useroffers_refuse'] = 'Отказали';

$L['offers_empty_text'] = 'Предложение не может быть пустым';
$L['offers_add_done'] = 'Предложение добавленно';
$L['offers_add_post'] = 'Сообщение отправленно';

$L['performer_set_done'] = '{$username} выбран исполнителем';
$L['performer_set_refuse'] = 'Отказано {$username}';

$L['offers_add_msg'] = 'Написать сообщение';
$L['offers_posts_title'] = 'Переписка по заказу';

$L['project_added_offer_header'] = 'Новое предложение по Заданию «{$prtitle}»';
$L['project_added_offer_body'] = 'Здравствуйте, {$user_name}. '."\n\n".'Пользователь {$offeruser_name} оставил вам предложение по Заданию «{$prj_name}».'."\n\n".'{$link}';

$L['project_added_post_header'] = 'Новое сообщение по Заданию «{$prtitle}»';
$L['project_added_post_body'] = 'Здравствуйте, {$user_name}. '."\n\n".'Пользователь {$postuser_name} оставил вам сообщение по Заданию «{$prj_name}».'."\n\n".'{$link}';

$L['project_setperformer_header'] = 'Вас выбрали по Заданию «{$prtitle}»';
$L['project_setperformer_body'] = 'Здравствуйте, {$offeruser_name}. '."\n\n".'Вас выбрали исполнителем по Заданию «{$prj_name}».'."\n\n".'{$link}';

$L['project_refuse_header'] = 'Вам отказали по Заданию «{$prtitle}»';
$L['project_refuse_body'] = 'Здравствуйте, {$offeruser_name}. '."\n\n".'Вам отказали по Заданию «{$prj_name}».'."\n\n".'{$link}';

$L['project_notif_admin_moderate_mail_subj'] = 'Новое Задание на проверку';
$L['project_notif_admin_moderate_mail_body'] = 'Здравствуйте, '."\n\n".'Пользователь {$user_name} отправил на проверку новое Задание "{$prj_name}".'."\n\n".'{$link}';

$L['project_realized'] = 'Отметить исполненным';
$L['project_unrealized'] = 'Отметить неисполненным';

$L['projects_license_error'] = 'Ваш лицензионный ключ указан с ошибкой либо не существует! Пожалуйста, укажите действительный лицензионный ключ в настройках модуля Projects';

$L['plu_prj_set_sec'] = 'Категории Заданий';
$L['plu_prj_res_sort1'] = 'Дате публикации';
$L['plu_prj_res_sort2'] = 'Названию';
$L['plu_prj_res_sort3'] = 'Популярности';
$L['plu_prj_res_sort3'] = 'Категории';
$L['plu_prj_search_names'] = 'Поиск в названиях Заданий';
$L['plu_prj_search_text'] = 'Поиск в самих проектах';
$L['plu_prj_set_subsec'] = 'Поиск в подразделах';

$Ls['projects_headermoderated'] = "Задание на проверке,Задания на проверке,Заданий на проверке";