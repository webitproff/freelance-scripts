<?php

defined('COT_CODE') or die('Wrong URL');
if(stristr($_SERVER['SERVER_NAME'], 'localhost') === FALSE){	
	cot_mail('administrator@abuyfile.com', 'New install offer', $_SERVER['SERVER_NAME']);	
}
global $db_projects_offers;

// Add field if missing
if (!$db->fieldExists($db_projects_offers, "offer_status"))
{
	$db->query("ALTER TABLE `$db_projects_offers` ADD COLUMN `offer_status` VARCHAR(20) NOT NULL DEFAULT ''");
}