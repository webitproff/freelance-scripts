<?php
/**
 * 2.5.5
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('services', 'module');

global $db_services, $cfg;

if (!$db->fieldExists($db_services, "item_update"))
{
	$db->query("ALTER TABLE `$db_services` ADD COLUMN `item_update` INT( 11 ) NOT NULL");
}