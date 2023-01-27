<?php
/**
 * 2.20: add lastmsg field id ds_dialog table
 */

defined('COT_CODE') or die('Wrong URL');

global $db, $db_ds_dialog, $db_x;
$db_ds_dialog = (isset($db_ds_dialog)) ? $db_ds_dialog : $db_x . 'ds_dialog';

$db->query("ALTER TABLE $db_ds_dialog ADD COLUMN `lastmsg` int(11) NOT NULL DEFAULT '0'");

?>
