<?php
/**
 * 2.5.2: add and fill item_markup field
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('services', 'module');

global $db_services, $cfg;

$db->query("ALTER TABLE $db_services ADD COLUMN `item_parser` VARCHAR(64) NOT NULL DEFAULT ''");
$db->update($db_services, array('item_parser' => $cfg['services']['parser']));

?>
