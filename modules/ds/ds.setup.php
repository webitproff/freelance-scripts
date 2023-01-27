<?php
/* ====================
[BEGIN_COT_EXT]
Name=Чаты и Диалоги
Description=User communication with ajax update and send
Version=2.6.2
Date=2020-03-16
Author=
Auth_guests=RW
Lock_guests=12345A
Auth_members=RW
Lock_members=
[END_COT_EXT]

[BEGIN_COT_EXT_CONFIG]
turnajax=01:hidden::1:
sound=02:radio::1:Включить звуковые оповещания
hideimport=03:radio::0:Скрыть функцию импорта сообщений в админке
filepath=04:string::datas/ds:Директория для файлов
extensions=05:string::jpg,jpeg,png,gif,bmp,txt,doc,docx,xls,pdf,rar,zip:Допустимые расширения файлов
timesend=06:string::10:Частота рассылки (в минутах)
wpm_fromuserid=05:string::1:Приветственное сообщение, укажите id отправителя (админ или поддержка)
wpm_message=06:text::Добро пожаловать, {$user}:Текст приветственного сообщения, можно использовать тег {$user} - имя пользователя
hideset=08:hidden:::
[END_COT_EXT_CONFIG]
==================== */

/**
 * DS setup file
 * @version 2.2
 * @package DS
 * @copyright (c) 
 */
