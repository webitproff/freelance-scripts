<?php
/**
 * 1.0.1
 */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('payments', 'module');

global $db_payments;

if (!$db->fieldExists($db_payments, "pay_email"))
{
	$db->query("ALTER TABLE `$db_payments` ADD COLUMN `pay_email` varchar(255) NOT NULL");
}
