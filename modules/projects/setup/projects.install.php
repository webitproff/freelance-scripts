<?php
/**
 * projects module
 *
 * @package projects
 * @version 2.5.5
 * @author CMSWorks Team
 * @copyright Copyright (c) CMSWorks.ru, littledev.ru
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('projects', 'module');
require_once cot_incfile('structure');

	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'dostavka-courier', 'structure_title' => 'Доставка и курьеры', 'structure_path' => '001'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'remont-stroitelstvo', 'structure_title' => 'Ремонт и строительство', 'structure_path' => '002'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'gruzoperevozki', 'structure_title' => 'Грузоперевозки', 'structure_path' => '003'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'uborka-hozyaystvo', 'structure_title' => 'Уборка и помощь по хозяйству', 'structure_path' => '004'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'virtualniy-pomoshchnik', 'structure_title' => 'Виртуальный помощник', 'structure_path' => '005'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'kompyuternaya-pomoshch', 'structure_title' => 'Компьютерная помощь', 'structure_path' => '006'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'meropriyatiya', 'structure_title' => 'Мероприятия и промоакции', 'structure_path' => '007'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'dizayn', 'structure_title' => 'Дизайн', 'structure_path' => '008'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'razrabotka-po', 'structure_title' => 'Разработка ПО', 'structure_path' => '009'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'foto-video-audio', 'structure_title' => 'Фото, видео и аудио', 'structure_path' => '010'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'ustanovka-tekhniki', 'structure_title' => 'Установка и ремонт техники', 'structure_path' => '011'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'krasota-zdorove', 'structure_title' => 'Красота и здоровье', 'structure_path' => '012'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'remont-digital-tech', 'structure_title' => 'Ремонт цифровой техники', 'structure_path' => '013'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'yurist-buhgalter', 'structure_title' => 'Юридическая и бухгалтерская помощь', 'structure_path' => '014'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'repetitor-obuchenie', 'structure_title' => 'Репетиторы и обучение', 'structure_path' => '015'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'sto-transporta', 'structure_title' => 'Техобслуживание транспорта', 'structure_path' => '016'));
	cot_structure_add('projects', array('structure_area' => 'projects', 'structure_code' => 'konsalting', 'structure_title' => 'Консалтинг', 'structure_path' => '017'));

$db->update($db_auth, array('auth_rights' => 5), "auth_code='projects' AND auth_groupid=4");