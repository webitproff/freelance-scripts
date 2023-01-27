<?php
/* ====================
[BEGIN_COT_EXT]
Code=prdmap
Name=Карта для users, projects и market
Version=1.1.1
Date=09.11.2021
Author=Alexeev Vlad
Auth_guests=RW1
Lock_guests=2345A
Auth_members=RW1
Lock_members=
Recommends_modules=projects,market,users
[END_COT_EXT]

[BEGIN_COT_EXT_CONFIG]
rmscroll=01:radio::0:Запретить маштабирование карты колесиком мыши
apikey=02:string:::Google Map API key
rmicon=03:string:::Ссылка на свою иконку метки, если пусто - будет стандартная метка
indexlimit=04:string::30:Число товаров на карте (0 - все)
center=05:string::Москва:Карту какого города отображать на общей карте
disableui=06:radio::0:Скрыть UI на карте
zoom=07:select:10,11,12,13,14,15,16:13:Зум карты в проекте
zoomindex=08:select:3,4,5,6,7,8,9,10,11,12,13,14,15,16:13:Зум карты на главной
type=09:select:1,2,3,4:1:
[END_COT_EXT_CONFIG]
==================== */

defined('COT_CODE') or die('Wrong URL');
