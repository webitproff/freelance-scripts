<?php
/* ====================
 * [BEGIN_COT_EXT]
 * Code=services
 * Name=Services (Рынок услуг)
 * Description=Раздел размещения услуг индивидуальными исполнителями и мастерами
 * Version=2.6.0
 * Date=21.12.2021
 * Author=Cotonti Team
 * Copyright=Copyright &copy; Cotonti Team
 * Notes=Теперь с мета-тегами для поисковиков
 * Auth_guests=R
 * Lock_guests=12345A
 * Auth_members=RW
 * Lock_members=
 * Requires_plugins=
 * [END_COT_EXT]

 * [BEGIN_COT_EXT_CONFIG]
 * markup=01:radio::1:
 * parser=02:callback:cot_get_parsers():html:* 
 * pagelimit=03:select:1,2,3,4,5,10,15,20,25,30,35,40,45,50:20:Число записей на странице
 * shorttextlen=04:string::200:Обрезка текста в категориях
 * prevalidate=05:radio::0:Включить предварительную модерацию
 * preview=06:radio::1:Включить предварительный просмотр
 * servicessitemap=07:radio::1:Включить вывод в sitemap
 * servicessitemap_freq=08:select:default,always,hourly,daily,weekly,monthly,yearly,never:default:Частота изменений для sitemap
 * servicessitemap_prio=09:select:0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0:0.5:Приоритет для sitemap
 * description=10:string:::Описание модуля
 * servicessearch=11:radio::1:Включить в общий поиск
 * title_services=12:string::{TITLE} - {CATEGORY}:
 * count_admin=13:radio::0: 
 * notifservices_admin_moderate=14:radio::1:Уведомлять о новых услугах на проверке
 * serveditor=15:select:disable,minieditor,medieditor,editor:medieditor:
 * [END_COT_EXT_CONFIG]
 * 
 * [BEGIN_COT_EXT_CONFIG_STRUCTURE]
 * order=01:callback:cot_services_config_order():date:
 * way=02:select:asc,desc:asc:
 * maxrowsperpage=03:string::10:
 * truncatetext=04:string::0:
 * allowemptytext=05:radio::0:
 * keywords=06:string:::
 * metatitle=07:string:::
 * metadesc=08:string:::
 * [END_COT_EXT_CONFIG_STRUCTURE]
*/

/**
 * services module
 */

defined('COT_CODE') or die('Wrong URL');
