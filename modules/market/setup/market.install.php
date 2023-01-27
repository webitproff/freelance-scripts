<?php 

defined('COT_CODE') or die('Wrong URL');


require_once cot_incfile('market', 'module');

global $db_structure, $db_foliostore, $db_market, $db_auth, $db_mavatars;

if(cot_module_active('foliostore'))
{	
	require_once cot_incfile('foliostore', 'module');
	// Копируем структуру модуля Foliostore в Market
	$sql = $db->query("SELECT * FROM $db_structure WHERE structure_area='foliostore'");
	while($row = $sql->fetch())
	{
		unset($row['structure_id']);
		$row['structure_area'] = 'market';

		$db->insert($db_structure, $row);
	}

	// Копируем права структуры Foliostore
	$sql = $db->query("SELECT * FROM $db_auth WHERE auth_code='foliostore'");
	while($row = $sql->fetch())
	{
		unset($row['auth_id']);
		$row['auth_code'] = 'market';

		$db->insert($db_auth, $row);
	}

	// Копируем записи из таблицы Foliostore в Market
	// При этом также переименовываем загруженные изображения в плагине Mavatars
	$sql = $db->query("SELECT * FROM $db_foliostore WHERE item_store=1");
	while($row = $sql->fetch())
	{
		$folioid = $row['item_id'];

		unset($row['item_id']);
		unset($row['item_store']);
		unset($row['item_index']);

		$db->insert($db_market, $row);
		$id = $db->lastInsertId();

		if(cot_plugin_active('mavatars'))
		{
			if($mav = $db->query("SELECT * FROM $db_mavatars WHERE mav_code=" . $folioid . " AND mav_extension='foliostore'")->fetch())
			{
				unset($mav['mav_id']);
				$mav['mav_extension'] = 'market';
				$mav['mav_code'] = $id;

				$db->insert($db_mavatars, $mav);
			}	
		}
	}

}
else
{
	require_once cot_incfile('structure');
	
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'dostavka-courier', 'structure_title' => 'Доставка и курьеры', 'structure_path' => '001'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'remont-stroitelstvo', 'structure_title' => 'Ремонт и строительство', 'structure_path' => '002'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'gruzoperevozki', 'structure_title' => 'Грузоперевозки', 'structure_path' => '003'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'uborka-hozyaystvo', 'structure_title' => 'Уборка и помощь по хозяйству', 'structure_path' => '004'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'virtualniy-pomoshchnik', 'structure_title' => 'Виртуальный помощник', 'structure_path' => '005'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'kompyuternaya-pomoshch', 'structure_title' => 'Компьютерная помощь', 'structure_path' => '006'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'meropriyatiya', 'structure_title' => 'Мероприятия и промоакции', 'structure_path' => '007'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'dizayn', 'structure_title' => 'Дизайн', 'structure_path' => '008'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'razrabotka-po', 'structure_title' => 'Разработка ПО', 'structure_path' => '009'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'foto-video-audio', 'structure_title' => 'Фото, видео и аудио', 'structure_path' => '010'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'ustanovka-tekhniki', 'structure_title' => 'Установка и ремонт техники', 'structure_path' => '011'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'krasota-zdorove', 'structure_title' => 'Красота и здоровье', 'structure_path' => '012'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'remont-digital-tech', 'structure_title' => 'Ремонт цифровой техники', 'structure_path' => '013'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'yurist-buhgalter', 'structure_title' => 'Юридическая и бухгалтерская помощь', 'structure_path' => '014'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'repetitor-obuchenie', 'structure_title' => 'Репетиторы и обучение', 'structure_path' => '015'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'sto-transporta', 'structure_title' => 'Техобслуживание транспорта', 'structure_path' => '016'));
	cot_structure_add('market', array('structure_area' => 'market', 'structure_code' => 'konsalting', 'structure_title' => 'Консалтинг', 'structure_path' => '017'));
}

?>