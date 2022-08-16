<?php

defined('COT_CODE') or die('Wrong URL');

global $db_payments;

if ($db->fieldExists($db_payments, "pay_email"))
{
	$db->query("ALTER TABLE `$db_payments` DROP COLUMN `pay_email`");
}
