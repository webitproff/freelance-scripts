<?php
/**
 * Installation handler
 *
 * @package usercategories
 * @version 2.5.2
 * @author CMSWorks Team
 * @copyright Copyright (c) CMSWorks.ru, littledev.ru
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL');

global $db_users;

require_once cot_incfile('usercategories', 'plug');
require_once cot_incfile('extrafields');
require_once cot_incfile('structure');

// Add field if missing
if (!$db->fieldExists($db_users, "user_cats"))
{
	$dbres = $db->query("ALTER TABLE `$db_users` ADD COLUMN `user_cats` TEXT collate utf8_unicode_ci NOT NULL");
}

	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'dostavka-courier', 'structure_title' => 'Доставка и курьеры', 'structure_path' => '001'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'remont-stroitelstvo', 'structure_title' => 'Ремонт и строительство', 'structure_path' => '002'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'gruzoperevozki', 'structure_title' => 'Грузоперевозки', 'structure_path' => '003'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'uborka-hozyaystvo', 'structure_title' => 'Уборка и помощь по хозяйству', 'structure_path' => '004'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'virtualniy-pomoshchnik', 'structure_title' => 'Виртуальный помощник', 'structure_path' => '005'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'kompyuternaya-pomoshch', 'structure_title' => 'Компьютерная помощь', 'structure_path' => '006'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'meropriyatiya', 'structure_title' => 'Мероприятия и промоакции', 'structure_path' => '007'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'dizayn', 'structure_title' => 'Дизайн', 'structure_path' => '008'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'razrabotka-po', 'structure_title' => 'Разработка ПО', 'structure_path' => '009'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'foto-video-audio', 'structure_title' => 'Фото, видео и аудио', 'structure_path' => '010'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'ustanovka-tekhniki', 'structure_title' => 'Установка и ремонт техники', 'structure_path' => '011'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'krasota-zdorove', 'structure_title' => 'Красота и здоровье', 'structure_path' => '012'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'remont-digital-tech', 'structure_title' => 'Ремонт цифровой техники', 'structure_path' => '013'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'yurist-buhgalter', 'structure_title' => 'Юридическая и бухгалтерская помощь', 'structure_path' => '014'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'repetitor-obuchenie', 'structure_title' => 'Репетиторы и обучение', 'structure_path' => '015'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'sto-transporta', 'structure_title' => 'Техобслуживание транспорта', 'structure_path' => '016'));
	cot_structure_add('usercategories', array('structure_area' => 'usercategories', 'structure_code' => 'konsalting', 'structure_title' => 'Консалтинг', 'structure_path' => '017'));