<?php
/**
 * Install script Script Freelance MarketPlace (SFM) 10/10/2023
 *
 * @package Cotonti
 * @version 0.9.24
 * @license BSD
 */


defined('COT_CODE') or die('Wrong URL');
$default_modules = array('index', 'page', 'users', 'market', 'payments', 'projects');
$default_plugins = array('ckeditor', 'html', 'htmlpurifier', 'locationselector', 'mcaptcha', 'search', 'paypro', 'paytop', 'reviews', 'useragreement', 'usercategories', 'usergroupselector', 'userpoints', 'nullbilling', 'contact');

$L['install_body_message1'] = "Установка «Script Freelance MarketPlace»<br/>Сборка сайта маркетплейса услуг v3.0.23 под PHP v7.4 на Cotonti Siena v0.9.24 <br>Сборку собрал <a href='https://github.com/webitproff' target='blank'>Webitproff</a><br><a href='https://t.me/webitproff' target='_blank'  title='написать в TELEGRAM'><strong>Персональная поддержка</strong></a><br/><br/>".$L['install_body_message1'];

function cot_install_step2_tags()
{
	global $t, $db_name;
	$db_x = "xpert_";
	
	$t->assign(array(
		'INSTALL_DB_X' => $db_x,
		'INSTALL_DB_X_INPUT' => cot_inputbox('text', 'db_x',  $db_x, 'size="32"'),	
		'INSTALL_DB_NAME_INPUT' => cot_inputbox('text', 'db_name',  is_null($db_name) ? 'xpert' : $db_name, 'size="32"'),
	));
}

