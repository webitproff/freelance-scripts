<?PHP
/* ====================
[BEGIN_COT_EXT]
Code=newuserpm
Name=Новый пользователь Оповещение
Description=Оповещение о регистрации новых пользователей<br />[<a target="_blank" href="http://freelance-script.abuyfile.com/plugin-newuserpm/">Документация по плагину, помощь, поддержка</a>]
Version=1
Date=10-31-2020
Author=Cotonti Team
Copyright=This plugin can be used for free.
Notes=
SQL=
Auth_guests=R
Lock_guests=12345A
Auth_members=RW
Lock_members=12345A
[END_COT_EXT]

[BEGIN_COT_EXT_CONFIG]
fromuserid=01:string::no-reply@webitproff.com:The email from
touserid=02:string::webitproff@gmail.com:The email to
fromusername=03:string::NO REPLY:Name of the sender
messagetitle=04:string::New member [user] has been registered
message=05:words::Привет Administrator, на сайте [mainurl] зарегистрировался новый пользователь [user] Контактный email [email] указанный пользователем, должен быть действительным, для возможности авторизации и управления своим аккаунтом. Просмотреть профиль нового пользователя - [mainurl]/users/[user] :Write what you want every new member to read. Use [user] for there name and [email] for the email to display
[END_COT_EXT_CONFIG]
==================== */

if ( !defined('SED_CODE') ) { die("Wrong URL."); }

?>
