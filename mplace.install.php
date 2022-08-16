<?php
/**
 * Install script Marketplace
 *
 * @package Cotonti
 * @version 0.9.20
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL');

// Modules and plugins checked by default
$default_modules = array('index', 'page', 'users', 'market', 'services', 'payments', 'projects', 'folio');
$default_plugins = array('ckeditor', 'cleaner', 'html', 'htmlpurifier', 'ipsearch', 'mcaptcha', 'search', 'paypro', 'paytop', 'reviews', 'useragreement', 'usercategories', 'usergroupselector', 'userpoints', 'nullbilling', 'newuserpm', 'contact');

$L['install_body_message1'] = "Установка Сборки сайта Фриланс-маркетплейса v3.0.20 под PHP v7.4 на Cotonti Siena v0.9.20 <br>Сборку собрал <a href='https://github.com/webitproff' target='blank'>Webitproff</a><br><a href='https://t.me/webitproff' target='_blank'  title='написать в TELEGRAM'><strong>Персональная поддержка</strong></a><br/>".$L['install_body_message1'];

function cot_install_step2_tags()
{
	global $t, $db_name;
	$db_x = "mplace_";
	
	$t->assign(array(
		'INSTALL_DB_X' => $db_x,
		'INSTALL_DB_X_INPUT' => cot_inputbox('text', 'db_x',  $db_x, 'size="32"'),	
		'INSTALL_DB_NAME_INPUT' => cot_inputbox('text', 'db_name',  is_null($db_name) ? 'starlance' : $db_name, 'size="32"'),
	));
}

function cot_install_step3_tags()
{
	global $t, $rtheme, $rscheme;

	$rtheme = 'masters';
	$t->assign(array(
			'INSTALL_THEME_SELECT' => cot_selectbox_theme($rtheme, $rscheme, 'theme'),
	));
}

function cot_install_step3_setup()
{
	global $file;
	$config_contents = file_get_contents($file['config']);
	cot_install_config_replace($config_contents, 'admintheme', 'controlcot');
	file_put_contents($file['config'], $config_contents);
}