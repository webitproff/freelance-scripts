<?php
/**
/**
 * Install script Script Freelance MarketPlace (SFM)
 *
 * @package Cotonti
 * @version 0.9.20
 * @license BSD
 */


defined('COT_CODE') or die('Wrong URL');

// Modules and plugins checked by default
$default_modules = array('index', 'page', 'users', 'rss', 'market', 'payments', 'projects', 'folio');
$default_plugins = array('ckeditor', 'cleaner', 'html', 'htmlpurifier', 'ipsearch', 'mcaptcha', 'news', 'search', 
		'locationselector', 'paypro', 'paytop', 'reviews', 'useragreement', 'usercategories', 'usergroupselector', 'userpoints', 'userimages', 'genderavatar');

$L['install_body_message1'] = "Установка «Script Freelance MarketPlace (SFM)»<br/><br/>".$L['install_body_message1'];

function cot_install_step2_tags()
{
	global $t, $db_name;
	$db_x = "sfm_";
	
	$t->assign(array(
		'INSTALL_DB_X' => $db_x,
		'INSTALL_DB_X_INPUT' => cot_inputbox('text', 'db_x',  $db_x, 'size="32"'),	
		'INSTALL_DB_NAME_INPUT' => cot_inputbox('text', 'db_name',  is_null($db_name) ? 'mydatabase' : $db_name, 'size="32"'),
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
	cot_install_config_replace($config_contents, 'admintheme', 'fusion');
	file_put_contents($file['config'], $config_contents);
}
